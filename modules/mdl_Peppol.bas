Attribute VB_Name = "mdl_Peppol"
'******* Peppol Outbound *******
'   Routing der bereits erzeugten XML in das Peppol-Outbound-Verzeichnis
'   auf dem Gruppenlaufwerk. Erzeugung selbst geschieht in mdlERechnung.
'
'   Pfade kommen aus T_Lexikon (Begriff 'Peppol Pfad Outbound')
'   und werden in spI_User -> AutoExec in glStrPeppolOutbound geladen.
'
'   Versand-Workflow (Stand 27.04.2026, nach Call mit EDICENTER):
'   - FIRMA legt die XML in Outbound\pending\ ab (EDI-Connector holt ab)
'   - FIRMA legt die XML zusaetzlich in Outbound\sent\ mit Timestamp ab
'     (dauerhafte History, Basis fuer Duplikat-Pruefung)
'   - failed\ entfaellt: Fehlerbehandlung uebernimmt EDICENTER
'     (automatische E-Mail an Dirk + Gerd, plus naechtlicher Report)
'   - Duplikat-Treffer in sent\ -> User-Rueckfrage
'     (z.B. fuer Korrektur-Versand muss erneuter Versand moeglich sein)
'
'   Workflow gemaess HVL_Peppol-Anbindung_Zusammenfassung_20260421.md
'   Abschnitt 5/6/7.
'   260427 EC
Option Compare Database
Option Explicit

Private Const PEPPOL_SUB_PENDING As String = "pending\"
Private Const PEPPOL_SUB_SENT    As String = "sent\"

' Letzter erfolgreich abgelegter sent\-Pfad. Wird von OH_Peppol_PlaceInOutbound
' gesetzt und vom Aufrufer (z.B. mdl_Printer.bas im Peppol-Skip-Block) zur
' anschliessenden ELO-Archivierung gelesen. Best-Effort, nicht thread-safe --
' Access ist single-threaded, daher unkritisch.
Public glStrPeppolLastSentPath As String

'=================================================================
' Pruefen, ob fuer den Vorgang Peppol-Versand zutrifft.
' Drei-stufige Pruefung (260429 EC):
'   Gate 1 - Mandant-weiter Master-Schalter:
'            Lexikon 'PEPPOL-Rechnungsversand' (Gruppe Database) = 'JA'
'            -> in mdl_DB.AutoExec nach glPeppolRechnungsversand geladen.
'            Ist der Schalter aus, faellt der DB-Roundtrip komplett weg.
'   Gate 2 - Kundenseitiger Schalter:
'            A_Stichwort 'PEPPOL-Rechnungsversand' = 'JA' an
'            A_VG.Firma_NrFunktion (Empfaenger).
'   Gate 3 - Datenvollstaendigkeit:
'            Buyer- und Seller-Peppol-IDs als A_Stichwort vorhanden.
' Gate 2 + Gate 3 werden in dbo.spA_VG @x='IsPeppolCase' ausgewertet
' (vgl. 20260429-03-ddl_spA_VG_IsPeppolCase.sql).
'=================================================================
Public Function OH_Peppol_IsPeppolCase(NrVG As Long) As Boolean
On Error GoTo ErrMsg
    ' Gate 1: Mandant-weiter Master-Schalter (Lexikon Database)
    If Not glPeppolRechnungsversand Then
        OH_Peppol_IsPeppolCase = False
        Exit Function
    End If

    ' Gate 2 + 3: kundenseitiger Schalter und Peppol-IDs (in SP)
    strSQL = "EXECUTE dbo.spA_VG" & _
             " @x = 'IsPeppolCase'" & _
             ",@i = " & NrVG
    OH_r r
    If r.BOF Then
        OH_Peppol_IsPeppolCase = False
    Else
        OH_Peppol_IsPeppolCase = (Nz(r!IsPeppol, 0) = 1)
    End If
    Exit Function

ErrMsg:
    OH_Peppol_IsPeppolCase = False
    Debug.Print "OH_Peppol_IsPeppolCase Fehler " & Err.number & ": " & Err.Description
End Function

'=================================================================
' Prueft, ob die Datei bereits versendet wurde.
'   pending\ : exakter Dateiname (kann eigentlich nur dann sein,
'              wenn der EDI-Connector noch nicht abgeholt hat)
'   sent\    : Pattern-Match <BaseName>_*<Ext> (Timestamp angehaengt)
' Liefert True bei Treffer, False sonst. KEIN Abbruch hier - der
' Aufrufer entscheidet ueber die User-Rueckfrage.
'   strFilename = nur der Dateiname (ohne Pfad)
'=================================================================
Public Function OH_Peppol_DuplicateExists(strFilename As String) As Boolean
On Error GoTo ErrMsg
    Dim fso As Object
    Dim strBase As String
    Dim strBaseName As String
    Dim strExt As String
    Dim lngDot As Long

    strBase = OH_Peppol_GetBaseOutbound()
    If strBase = "" Then
        OH_Peppol_DuplicateExists = False
        Exit Function
    End If

    Set fso = CreateObject("Scripting.FileSystemObject")

    ' 1. exakter Treffer in pending\
    If fso.FileExists(strBase & PEPPOL_SUB_PENDING & strFilename) Then
        OH_Peppol_DuplicateExists = True
        GoTo CLEANUP
    End If

    ' 2. Pattern-Match in sent\: <BaseName>_*<Ext>
    lngDot = InStrRev(strFilename, ".")
    If lngDot > 0 Then
        strBaseName = left$(strFilename, lngDot - 1)
        strExt = Mid$(strFilename, lngDot)
    Else
        strBaseName = strFilename
        strExt = ""
    End If

    If Dir(strBase & PEPPOL_SUB_SENT & strBaseName & "_*" & strExt) <> "" Then
        OH_Peppol_DuplicateExists = True
        GoTo CLEANUP
    End If

    OH_Peppol_DuplicateExists = False

CLEANUP:
    Set fso = Nothing
    Exit Function

ErrMsg:
    OH_Peppol_DuplicateExists = False
    Debug.Print "OH_Peppol_DuplicateExists Fehler " & Err.number & ": " & Err.Description
    Resume CLEANUP
End Function

'=================================================================
' Legt die bereits erzeugte XML im Peppol-Outbound ab.
' Doppelablage:
'   - pending\<Dateiname>                   -> EDI-Connector holt ab
'   - sent\<BaseName>_<Timestamp><Ext>      -> History
' Bei Duplikat-Treffer in sent\: User-Rueckfrage (Ja = trotzdem
' versenden, z.B. Korrektur-Versand). Bei Nein: Abbruch + False.
'
' strSentPathOut (ByRef, optional): wird im Erfolgsfall mit dem
' vollstaendigen Pfad der sent\-Kopie befuellt -- z.B. fuer die
' anschliessende ELO-Archivierung benoetigt.
'=================================================================
Public Function OH_Peppol_PlaceInOutbound(strSourcePath As String, _
                                          Optional ByRef strSentPathOut As String) As Boolean
On Error GoTo ErrMsg
    Dim fso As Object
    Dim strBase As String
    Dim strPending As String
    Dim strSent As String
    Dim strFilename As String
    Dim strFilenameSent As String
    Dim strDestPending As String
    Dim strDestSent As String

    Set fso = CreateObject("Scripting.FileSystemObject")

    If Not fso.FileExists(strSourcePath) Then
        MsgBox "Peppol: Quelldatei nicht gefunden:" & vbCrLf & strSourcePath, _
               vbCritical, "Peppol Outbound"
        OH_Peppol_PlaceInOutbound = False
        GoTo CLEANUP
    End If

    strBase = OH_Peppol_GetBaseOutbound()
    If strBase = "" Then
        MsgBox "Peppol: Outbound-Pfad ist nicht konfiguriert (Lexikon 'Peppol Pfad Outbound').", _
               vbCritical, "Peppol Outbound"
        OH_Peppol_PlaceInOutbound = False
        GoTo CLEANUP
    End If

    strPending = strBase & PEPPOL_SUB_PENDING
    strSent = strBase & PEPPOL_SUB_SENT

    If Not fso.FolderExists(strPending) Then
        MsgBox "Peppol: Zielordner existiert nicht:" & vbCrLf & strPending, _
               vbCritical, "Peppol Outbound"
        OH_Peppol_PlaceInOutbound = False
        GoTo CLEANUP
    End If

    If Not fso.FolderExists(strSent) Then
        MsgBox "Peppol: Zielordner existiert nicht:" & vbCrLf & strSent, _
               vbCritical, "Peppol Outbound"
        OH_Peppol_PlaceInOutbound = False
        GoTo CLEANUP
    End If

    strFilename = fso.GetFileName(strSourcePath)

    ' Duplikat-Pruefung -> User-Rueckfrage (Ja/Nein), kein Hard-Stop
    If OH_Peppol_DuplicateExists(strFilename) Then
        If MsgBox( _
            "Diese Rechnung wurde bereits an EDICENTER uebergeben." & vbCrLf & vbCrLf & _
            "Datei: " & strFilename & vbCrLf & vbCrLf & _
            "Trotzdem erneut versenden? (z.B. Korrektur-Versand)", _
            vbQuestion + vbYesNo + vbDefaultButton2, _
            "Peppol Outbound - Duplikat") <> vbYes Then
            OH_Peppol_PlaceInOutbound = False
            GoTo CLEANUP
        End If
    End If

    ' 1. Kopie nach pending\ (Connector holt ab)
    strDestPending = strPending & strFilename
    fso.CopyFile strSourcePath, strDestPending, True

    ' 2. Kopie nach sent\ mit Timestamp (History)
    strFilenameSent = OH_Peppol_AppendTimestamp(strFilename)
    strDestSent = strSent & strFilenameSent
    fso.CopyFile strSourcePath, strDestSent, True

    Debug.Print "Peppol: XML abgelegt -> " & strDestPending
    Debug.Print "Peppol: History     -> " & strDestSent
    strSentPathOut = strDestSent
    glStrPeppolLastSentPath = strDestSent
    OH_Peppol_PlaceInOutbound = True

CLEANUP:
    Set fso = Nothing
    Exit Function

ErrMsg:
    OH_Peppol_PlaceInOutbound = False
    MsgBox "Peppol-Ablage fehlgeschlagen:" & vbCrLf & _
           Err.number & " " & Err.Description, _
           vbCritical, "Peppol Outbound"
    Resume CLEANUP
End Function

'=================================================================
' Haengt _yyyymmddhhnnss vor die Dateiendung an.
' Beispiel: "Rechnung_3401_Mustermann.xml"
'        -> "Rechnung_3401_Mustermann_20260427143022.xml"
'=================================================================
Private Function OH_Peppol_AppendTimestamp(strFilename As String) As String
    Dim strBase As String
    Dim strExt As String
    Dim lngDot As Long
    lngDot = InStrRev(strFilename, ".")
    If lngDot > 0 Then
        strBase = left$(strFilename, lngDot - 1)
        strExt = Mid$(strFilename, lngDot)
    Else
        strBase = strFilename
        strExt = ""
    End If
    OH_Peppol_AppendTimestamp = strBase & "_" & Format$(Now, "yyyymmddhhnnss") & strExt
End Function

'=================================================================
' Liefert den Outbound-Basispfad (mit Slash am Ende).
' Quelle: glStrPeppolOutbound (aus spI_User -> AutoExec).
'=================================================================
Private Function OH_Peppol_GetBaseOutbound() As String
    Dim strBase As String
    strBase = Nz(glStrPeppolOutbound, "")
    If strBase = "" Then
        OH_Peppol_GetBaseOutbound = ""
        Exit Function
    End If
    If right$(strBase, 1) <> "\" Then strBase = strBase & "\"
    OH_Peppol_GetBaseOutbound = strBase
End Function
