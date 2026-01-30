Attribute VB_Name = "mdl_DB"
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
    Global db As dao.Database
    Global strDB As String
    Global r As ADODB.Recordset
    Global rs As ADODB.Recordset
    Global rx As ADODB.Recordset
    Global lgUserNrAdr As Long
    Global lguser As Long, strUser As String, strUserKZ As String, strRole As String
    Global glAdmin As Boolean
    Global strDocname As String
    Global strSQL As String, strSQL1 As String
    Global strlink As String, strlink1 As String
    Global i As Long, Y As Long
    Global x As Variant
    Global glID As Long
    Global f As Form, frm As Form
    Global ctl As control
    Global s As String          'hauptsächlich für Meldung in msgbox
    Global t As String          'hauptsächlich Titel in msgbox
    Global VarAntw As Variant   'varAntw der msgbox
    Global EFNr As Long
    Global EFNrFktn As Long
    Global glMandant As Long
    Global EFFirma As String, EFAbsender As String, EFAbsenderKlein As String
    Global intDBModus As Integer
    Global glAskNew As Boolean, _
           glAskSave As Boolean, _
           glAskDelete As Boolean, _
           glChangecontrol As Boolean, _
           glblAdmin As Boolean
    Global strVersion As String
    Global lgcolor As Long
    Global lgX(1 To 10) As Long  'siehe UF_txt before Update
    Global strMSG(1 To 7) As String
    Global blNixTun As Boolean
    Global glstrFont As String, _
           glstrFontA As String, _
           glstrFontEmail As String, _
           glstrFontSizeEmail As String, _
           glstrFieldAdresse As String, _
           glstrFieldVG As String, _
           glGFIDnotvisible As Boolean, _
           glstrStartCursor_in_PF_Artikel As String, _
           glintCursor_in_UF_VGDet As Integer, _
           glintPF_ArtikelmitTechDat As Integer, _
           glintArtikeltext As Integer, _
           glstrFormatAnzahl As String, _
           glArtikelpreis As Boolean, _
           glVGFix As Boolean, _
           glFaxFührende0 As Boolean, _
           glsgPreisFaktor As Single, _
           glsgRunden As Single, _
           glBackColor As Long, _
           glResizeForm As Boolean, _
           glFormHeight As Long, _
           glFormWidth As Long, _
           gllgNeuerVorgang As Long, _
           gllgSizePreview As Long, _
           glstrPS As String   'lexikon Database
    Global gllgWidthVG As Long       'Breite Vorgang
    Global glstrLagerKontrolle As String, _
           gllstArtikelActDefault As Long
    Public gcnn As ADODB.Connection
    Public gcat As ADOX.Catalog
    Global glStrStatus As String '150615
    Global glStrExplorerProjekt As String '150728
    Global glStrExplorerProjektFormat As String '150728
    Global glStrOutlookAblage As String '180401
    Global glScanFolder As String '160617
    Global selItem As Object
    Global selItemArray(1 To 20) As Object
    Global glstrB_VG As String
    Global glstrAbsender As String
    Global glstrAbsenderGesendet As String
    Global glMWStPflichtig As Boolean
    Global glstrBarcode As String
    Global fd As office.FileDialog
    Global glPersonaladministration As Long
    Public mQRBillFile As String
    Global glstrTempPath As String
    Global strDBArt As String
    Global strDBKunde As String
    Global glB2B As Boolean
    ' *** NEU: ZUGFeRD Lizenzdaten aus spI_User 251125 EC***
    Global glStrEMailZugferd As String
    Global glStrRegistryKeyZugferd As String


Public Function AutoExec()
On Error GoTo ErrMsg
    Dim strf As String
    Dim qd As dao.QueryDef
    t = "Starte Applikation Firma"
    SysCmd acSysCmdSetStatus, t
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    If Len(Dir(glstrTempPath, vbDirectory)) = 0 Then
        s = "Bitte erstellen Sie den Ordner " & glstrTempPath
        MsgBox s, vbCritical, t
    End If

    If OH_VerifyOfficeReferences = False Then
        Application.Quit
    End If
    If OH_AccessVersionID = False Then
        Application.Quit
    End If
'=======================================================
'   wird direkt nach dem Start der Datenbank ausgeführt
'   Connection abfragen!!
'=======================================================
    If Not CurrentProject.IsConnected Then
        If Not CurrentProject.IsConnected Then
            s = "Bitte prüfen Sie Ihre Server-Verbindung!"
            GoTo ErrM
        End If
    End If
    If Not CurrentProject.IsConnected Then
        Application.Quit
    End If
'   Connection abfragen!!
    strUser = VBA.Environ("username")
    strConnection = OH_GetCnnString
    Select Case strConnection
    Case "Stop"
        GoTo errstop
    End Select

    strSQL = "Exec dbo.spI_User"
    OH_r r
    If r.BOF Then
        MsgBox "Kann den Aktuellen User nicht finden!", vbCritical, "Suche User in Procedure spI_User"
    Else
        glDMS = r!DMS
        glScanFolder = r!ScanFolder
        strUserKZ = r!UserKZ
        glAdmin = Nz(r!Admin, 0)
        strRole = Nz(r!Roles)
        glResizeForm = Nz(r!ReSizeForm, 0)  '081215 OH
        glFormHeight = Nz(r!Formheight, 0) 'Einstellung der Formularhöhe in mm
        If glFormHeight = 0 Then
            glFormHeight = (OH_ScreenRes(1, "Twips") / 56.7) - 80
        End If
        glFormWidth = (OH_ScreenRes(0, "Twips") / 56.7) - 20
        gllgNeuerVorgang = Nz(r!NeuerVorgang, 23) '081220 OH Wunsch R. Holenstein
        gllstArtikelActDefault = Val(r!lstArtikelActDefault)
        gllgSizePreview = r!sizePreview
        gllgWidthVG = Nz(r!WidthVG, 480)
        glstrAbsender = r!glstrAbsender
        glstrAbsenderGesendet = r!glstrAbsenderGesendet
        glVGFix = r!glVGFix
        glPersonaladministration = r!Personaladministration
        glB2B = r!glB2B
        ' *** NEU: ZUGFeRD Lizenzdaten aus spI_User 251125 EC***
        glStrEMailZugferd = Nz(r!glStrEMailZugferd, "")
        glStrRegistryKeyZugferd = Nz(r!glStrRegistryKeyZugferd, "")
        glstrTempPath = r!glstrTempPath
    End If
     'Check, ob glstrTempPath existiert: wird benötigt für die Zwischenablage von Dokumenten
    If glstrTempPath = "" Then
        glstrTempPath = OH_FolderTemp 'STANDARD 260120
    End If
    gllg = "Deutsch"
'=======================================================
    '100419
    OH_LoadRibbons
'=======================================================
    'Besitzer der Applikation suchen (Stichwort: Applikation / Bemerkung: Besitzer)
    EFNrFktn = OH_checkCompany(strUserKZ)
    If EFNrFktn = 0 Then
        MsgBox "Besitzer der Applikation", vbCritical, "Stop"
        Application.Quit acExit
    End If
'=======================================================
    'Absender,Version feststellen
    OH_GetInfoGeneral
'=======================================================
    VarAntw = "NoForm_Current"
    If OH_isloaded("Menu") = False Then
        strSQL = "EXEC spa_Audit " & _
            " @x = 'Anmeldung'" & _
            ",@f = '" & Application.CurrentProject.FullName & "'"
        OH_EX
    End If
    DoCmd.openForm "Menu"
    Set f = Forms!Menu
    f.Visible = True
    DoCmd.Maximize
    VarAntw = Null
    f!suche.SetFocus
    glStrStatus = "DATEV"
    strSQL = ""
    db.QueryDefs.Refresh
    For Each qd In db.QueryDefs
        DoCmd.DeleteObject acQuery, qd.Name
    Next qd
    db.QueryDefs.Refresh
    If Not qd Is Nothing Then
        Set qd = Nothing
    End If
    If glDMS = "ELO" Then
        OH_ELO_GetInfos
    End If
    OH_ResetRSALL
    OH_Shift_Start glAdmin
    Application.SetOption "Show Status Bar", True '250717

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 91, 2475, 2498, 3033, 2486, 7874         '3033 für Properties einstellen, 7874 queries löschen...
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical
        Resume ErrEnd
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
errstop:
    OH_ApplicationQuit
  End Function
Public Function OH_New() ' neuer Datensatz im aktiven Formular
On Error GoTo ErrMsg
    Dim varTakeOver, varTakeOver1 As Variant
    Dim frmN As Form
    Dim lgid As Long
    strDocname = OH_CheckFrm
    If strDocname = "UF_txt" Then
        strDocname = "F_VG"
        Set frm = Forms!F_VG
        frm!txtFind.SetFocus
    End If
    t = "neue Daten in " & strDocname
    If strDocname = "Menu" Then
        s = "Bitte öffnen Sie dazu das entsprechende Hauptformular" & vbNewLine & _
            "(Adressen, Vorgänge, Artikel...)"
        GoTo ErrM
    End If
    If OH_Perm("I", frm) Then
        GoTo ErrEnd
    End If
    Select Case strDocname
    Case "F_Adresse"
        DoCmd.openForm "PF_NeuAdresse", , , , , , frm!NrFunktion
    Case "F_VG"
        OH_SaveRS frm!UF_txt.Form '230804 wegen Fehler bei Christina
        If frm.RegMain <> 0 Then
            frm.RegMain = 0
        End If
        If frm.regd > 1 Then
            frm.regd = 0
        End If
        DoCmd.openForm "PF_NeuVG", , , , , , "V" & frm!NrVG
        With Forms!PF_NeuVG
            !OGVGID = 0
            .OGVGID_AfterUpdate
            !btnOK.Caption = "F7: erstelle Neuen Vorgang"
            !OVG = 0
            .OVG_AfterUpdate
        End With
    Case "F_Ablage"
        strSQL = "Exec dbo.spa_Ablage 'Neue Ablage', " & lguser
        OH_r r
        lgid = r(0)
        OH_OF "F_Ablage", lgid
        frm!lstTop = lgid
        GoTo ErrEnd
    Case "F_QK", "UF_txtQK"
        strSQL = "Exec dbo.spa_QK 'Neue QK'"
        OH_r r
        lgid = r(0)
        OH_OF "F_QK", lgid
        frm!lstA = 2
        frm!txtFind = lgid
        frm.txtFind_AfterUpdate
        frm!QK.SetFocus
        GoTo ErrEnd
    Case "F_Artikel"
        strSQL = "Exec dbo.spa_Artikel 'Neuer Artikel'"
        OH_r r
        OH_OF "F_Artikel", r(0)
        frm!NrFirma = Null
        frm!ArtikelNr = Null
        frm!ArtikelName = Null
        frm!NrWarengruppe.SetFocus
        frm!NrWarengruppe.Dropdown
        GoTo ErrEnd
    Case "F_Leistung"
        t = "neuer Datensatz für gleiches Projekt"
        If IsNull(frm!nrVGDet) = True Then
            MsgBox "Bitte von einem existierenden Projekt ausgehen!", vbCritical, t
        Else
            strSQL = "Exec dbo.spa_Leistung 'Kopie'," & frm!NrLeistung & "," & lguser
            OH_r r
            lgid = r(0)
        End If
        OH_SetRS frm, lgid
        frm!AnzahlLeistung.SetFocus
    Case "F_Begriff"
        OH_SaveRS frm
        strSQL = "Exec dbo.spa_Begriff 'neuer Begriff'"
        OH_r r
        lgid = r(0)
        OH_OF "F_Begriff", lgid
        frm!regd = 3
        frm!lstTop = lgid
        frm!Begriff.SetFocus
    Case "F_Chronik"
        OH_SaveRS frm
        strSQL = "Exec dbo.spa_Chronik 'neue Chronik'"
        OH_r r
        lgid = r(0)
        OH_OF "F_Chronik", lgid
        frm!regd = 3
        frm!lstTop = lgid
        frm!DatumEreignis.SetFocus
    Case "F_Warengruppe"
        strSQL = "Exec dbo.spa_Warengruppe 'Neue Warengruppe'"
        OH_r r
        lgid = r(0)
        OH_OF "F_Warengruppe", lgid
        OH_RQ frm!lstDet
    Case "F_Lexikon"
        frm.OH_newLexikon
    Case "F_Filter"
        OH_SaveRS frm
        strSQL = "Exec dbo.spa_Filter " & _
                " @x = 'neuer Filter', " & _
                " @i = " & frm!NrFilter
        OH_r r
        lgid = r(0)
        OH_OF "F_Filter", lgid
        frm!regd = 3
        frm!lstTop = lgid
        frm!FieldName.SetFocus
    Case "F_Q"
        frm.OH_NewQ
    Case "F_language"
        frm!lstact = 10
        frm.lstAct_AfterUpdate
    Case "UF_Stichwort"
        Set frm = Forms!PF_Stichwort!UF_Stichwort.Form
        frm.btnNeu_Click
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    If Err = 2475 Or Err = 2046 Then Resume ErrEnd
    s = Err & " " & Err.Description
    t = "OH_New"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_Copy() ' kopiert markierte Datensätze des aktiven Formulares
On Error GoTo ErrMsg
    Dim strT As String
    Dim lgid As Long
    Dim strL As String
    Dim strCountRS As String
    Dim lgidc As Long
    Dim strA As String
    Dim strFocus As String
    Dim frmtbl As Form
    Dim lgAntw As Long
    Set frmtbl = OH_CheckMainFrm
    If frmtbl.Name = "F_VG" Then
        frmtbl!txtFind.SetFocus
    End If
    t = "neue Daten in " & frmtbl.Name
    If frmtbl.Name = "Menu" Then
        s = "Bitte öffnen Sie dazu das entsprechende Hauptformular" & vbNewLine & _
            "(Adressen, Vorgänge, Artikel...)"
        GoTo ErrM
    End If
    If OH_Perm("I", frmtbl) Then
        GoTo ErrEnd
    End If
    If OH_RecordcountForm(frmtbl) = 0 Then
        GoTo ErrEnd
    End If
'================================================================
'Formulare auswählen
    strT = OH_getTitel(frmtbl)
    s = Mid(frmtbl.Name, 3)
    Select Case frmtbl.Name
    Case "F_Adresse"
        s = vbNewLine & frmtbl!namen & ", " & frmtbl!Funktion & vbNewLine & vbNewLine & _
                  "==>" & vbNewLine & vbNewLine & _
                  frmtbl!Nachname & " Kopie" & vbNewLine & _
                  "(Der Nachname wird um das Wort <Kopie> erweitert)"
        lgAntw = Val(OH_msgbox(s, Array("komplette Adresse kopieren ohne Stichworte", "komplette Adresse kopieren incl. Stichworte", "zusätzl. Funktion erstellen"), _
                    vbQuestion, "Adresse kopieren", _
                   "Wichtiger Hinweis:" & vbNewLine & _
                   "Wenn Sie lediglich eine zusätzliche Funktion für die gleiche Adresse erfassen wollen," & vbNewLine & _
                   "sollten Sie nicht kopieren, sondern >zusätzl. Funktion erstellen< verwenden!!!" & vbNewLine & _
                   "Nehmen Sie dann in dem folgenden Formular die gewünschten Einstellungen vor!"))
        Select Case lgAntw
        Case 1, 2
            strlink = "NrAdresse=" & frmtbl!IDAdresse
            lgidc = OH_CopyRS("T_Adresse", strlink, "Nachname", frmtbl!Nachname & " Kopie", True, True)
            If lgidc = 0 Then
                GoTo ErrEnd
            Else
                If frmtbl!IDAdresse = frmtbl!NrAdrZuord Then
                    x = lgidc
                Else
                    x = frmtbl!NrAdrZuord
                End If
                lgidc = OH_CopyRS("T_Funktion", strlink, "NrAdresse", lgidc, True, , "NrAdrZuord", str(x))
            End If
            If lgAntw = 2 Then
                strlink = "NrFunktion=" & frmtbl!NrFunktion
                lgidc = OH_CopyRS("T_Stichwort", strlink, "NrFunktion", lgidc, True)
            End If
            strFocus = "Nachname"
            OH_OF "F_Adresse", lgidc
            With Forms!F_Adresse
                .regd = 1
                !lstKontakt = lgidc
            End With
            GoTo ErrEnd
        Case 3
            OH_New
            GoTo ErrEnd
        Case Else
            GoTo ErrEnd
        End Select
    Case "F_VG"
        If frm.RegMain <> 0 Then
            frm.RegMain = 0
        End If
        If frm.regd > 1 Then
            frm.regd = 0
        End If
        DoCmd.openForm "PF_NeuVG", , , , , , "V" & frmtbl!NrVG
        With Forms!PF_NeuVG
            !OmitBem = 1
            !OmitInfo = 0
            !OmitStichwort = 1
            !oMitTeilnehmer = 1
            !OmitTechDat = 1
            !btnOK.SetFocus
            !OGVGID = 1
            .OGVGID_AfterUpdate
            !btnOK.Caption = "F7: erstelle Neuen Vorgang (Kopiere)"
            !TxtVG.Visible = True
            !OVG = -1
            .OVG_AfterUpdate
            !VGWährung = frmtbl!VGWährung 'V160310
        End With
        GoTo ErrEnd
    Case "F_Ablage"
        strlink = "NrAblage=" & frmtbl!NrAblage
        s = s & " Nummer " & frmtbl!Nummer
                lgidc = OH_CopyRS("T_Ablage", _
                            "NrAblage=" & frmtbl!NrAblage, _
                            "Nummer", _
                            Nz(DMax("Nummer", "T_Ablage"), 0) + 1, _
                            False, _
                            True, _
                            "Fa2", _
                            "Kopie" & frmtbl!Fa2)
    Case "F_Lexikon"
        frmtbl!lstLexikon = 11
        frmtbl!lstLexikon.SetFocus
        frmtbl.lstLexikon_AfterUpdate
    Case "F_Leistung"
        strlink = "NrLeistung=" & frmtbl!NrLeistung
        s = "Projekt-Nr. " & frmtbl!ANr & vbNewLine & _
                  frmtbl!Firma & vbNewLine & _
                  left(frmtbl!Artikel, 50) & vbNewLine & _
                  frmtbl!VG & " vom " & frmtbl!DatumTag & vbNewLine & vbNewLine & _
                  "neues Datum " & Date & vbNewLine & _
                 "Ändern Sie die " & frmtbl!LiefereinheitVG & "-Anzahl, falls erforderlich:"
KopieAgain:
        strA = InputBox(s, frmtbl.Caption & " kopieren", frmtbl!AnzahlLeistung)
        If strA = "" Then
            GoTo ErrEnd
        End If
        strA = Replace(strA, ".", ",")
        If IsNumeric(strA) Then
            lgidc = OH_CopyRS("T_Leistung", strlink, "DatumTag", Format(Date, "yyyymmdd"), True, True, _
                            "AnzahlLeistung", Trim(str(strA)))
        Else
            MsgBox strA & " ist keine Zahl!", vbCritical, "Kopie leider nicht erstellt!"
            GoTo KopieAgain
        End If
        strFocus = "DatumTag"
    Case "F_Artikel"
        i = MsgBox("Artikel kopieren?" & vbNewLine & vbNewLine & _
                "JA" & vbTab & "Mit techn. Daten" & vbNewLine & _
                "Nein" & vbTab & "Ohne techn. Daten", _
                vbQuestion + vbYesNoCancel, left(frmtbl!Artikel & " " & frmtbl!ArtikelName & " " & frmtbl!ArtikelNr, 50))
        If i = vbCancel Then
            GoTo ErrEnd
        End If
        strlink = "NrArtikel=" & frmtbl!NrArtikel
        s = frmtbl!Artikel & " " & frmtbl!ArtikelName
        lgidc = OH_CopyRS("T_Artikel", _
                        strlink, _
                        "ArtikelNr", _
                        frmtbl!ArtikelNr & " Copy", _
                        True, _
                        True)
        If lgidc = 0 Then
            GoTo ErrEnd
        End If
        strFocus = "ArtikelNr"
        If i = vbYes Then
            OH_CopyRS "T_Stichwort", _
                        "NrArtikel= " & frmtbl!NrArtikel, _
                        "NrArtikel", _
                        Val(lgidc), _
                        True
        End If
    Case "F_QK"
        strSQL = "Exec dbo.spa_QK 'Copy'," & frmtbl!IDQK
        OH_r r
        lgidc = r(0)
    Case "F_Begriff"
        strlink = "NrBegriff=" & frmtbl!NrBegriff
        s = frmtbl!Begriff
        lgidc = OH_CopyRS("T_Begriff", strlink, "Begriff", frmtbl!Begriff & " Copy", , True)
        strFocus = "Begriff"
    Case "F_Filter"
        strlink = "NrFilter=" & frmtbl!NrFilter
        s = frmtbl!FormN & " " & frmtbl!NrFilter
        lgidc = OH_CopyRS("T_Filter", strlink, "FormN", frmtbl!FormN & " Copy", , True)
        OH_OF "F_Filter", lgidc
        frmtbl!lstTop.SetFocus
        frmtbl!FormN.SetFocus
        GoTo ErrEnd
    Case "F_Chronik"
        strlink = "NrChronik=" & frmtbl!NrChronik
        s = frmtbl!DatumEreignis & " " & frmtbl!Wer
        lgidc = OH_CopyRS("T_Chronik", strlink, "DatumEreignis", Date, , True)
    Case "F_q"
        frmtbl.OH_copyQ
    Case "F_Warengruppe"
        strSQL = "Exec dbo.spa_Warengruppe Copy," & frmtbl!NrWarengruppe
        OH_r r
        lgidc = r(0)
        OH_RQ frmtbl!lstDet
    Case Else
        MsgBox "Nicht integriert", vbInformation, "KOPIE"
    End Select
    If lgidc > 0 Then
        OH_OF frmtbl.Name, lgidc
        OH_RQ frmtbl!lstDet
        If strFocus <> "" Then
            frmtbl(strFocus).SetFocus
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_Copy"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_DeleteRS(frmDel As Form, Optional lgDo As Long = 0)
On Error GoTo ErrMsg
    Dim strT As String
    Dim strA As String
    Dim N As Long
    Dim lgid As Long
    Dim strDeleteMldg As String
    DoCmd.Hourglass True
    t = "LÖSCHE DATEN"
    If frmDel.Name = "Menu" Then
        s = "Bitte öffnen Sie dazu das entsprechende Hauptformular" & vbNewLine & _
            "(Adressen, Vorgänge, Artikel...)"
        GoTo ErrM
    End If
    If OH_Perm("d", frmDel) Then
        GoTo ErrEnd
    End If
    strT = Mid(frmDel.Name, 3)
    Select Case strT
    Case "Q"
        frmDel.OH_DeleteQ
        GoTo ErrEnd
    End Select
    i = 0
    If frmDel!countM = 0 Then
        OH_MarkerYesOne frmDel
    End If
    lgid = 0
    Select Case strT
    Case "Adresse"
        strT = "Funktion"
        lgid = frmDel("Nr" & strT)
    Case "QK"
        lgid = frmDel("ID" & strT)
    Case "VG"
        Select Case frmDel!VGStatus
        Case glStrStatus
            t = "Check, ob Änderungen zulässig sind!"
            s = "Der Status steht auf <" & glStrStatus & ">" & vbNewLine & _
                "Diese Daten können gemäss GoBD nicht mehr geändert resp. gelöscht werden!"
            GoTo ErrM
        End Select
        lgid = frmDel("Nr" & strT)
    Case "F_Q"
        frmDel.OH_DeleteQ
        GoTo ErrEnd
    Case Else
        lgid = frmDel("Nr" & strT)
    End Select
    t = left(OH_getTitel(frmDel), 40)
    strT = "T_" & strT
    s = ""
    OH_ResetID
    Select Case lgDo
    Case 0, 9
        N = 1
        OH_InsertID lgid
    Case 10
        N = Nz(frmDel!countM, 0)
        If strT = "T_Leistung" Then '170902
            Set ctl = frmDel!lstDet
        Else
            Set ctl = frmDel!lstM
        End If
        For i = 1 To N
            OH_InsertID ctl.column(0, i)
            If i = 3 Or i = 10 Or i = 100 Then
                If MsgBox("Die zu löschenden Daten (" & N & "!!!) gehen unwiderruflich verloren!!!! " & vbNewLine & _
                        "Mehr als " & i - 1 & " Datensätze löschen?.......", vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End If
        Next i
    Case 11
        N = 0
        i = 0
        Set ctl = frmDel!lstDet
        For Each x In ctl.ItemsSelected
            i = i + 1
        Next x
        For Each x In ctl.ItemsSelected
            N = N + 1
            OH_InsertID ctl.column(0, x)
            If N = 2 Or N = 10 Or N = 100 Then
                If MsgBox("Die zu löschenden Daten (" & i & "!!!) gehen unwiderruflich verloren!!!! " & vbNewLine & _
                        "Mehr als " & N - 1 & " Datensätze löschen?.......", _
                        vbOKCancel + vbDefaultButton2, _
                        t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End If
        Next x
    End Select
    Select Case N
    Case 0
        MsgBox "Bitte mindestens EINEN Datensatz anwählen!" & vbNewLine & _
                "(links Datensatz-Markierer anclicken)", vbExclamation, "LÖSCHEN"
        GoTo ErrEnd
    Case 1
    Case 2
        s = s & vbNewLine & " und  einen weiteren Datensatz"
    Case Else
        s = s & vbNewLine & " und  weitere " & N - 1 & " Datensätze (mehr als 1!!)"
    End Select
    s = t & vbNewLine & _
                s
    If strT = "T_Funktion" Then
        'sind Vorgänge mit Status "DATEV" drunter?
        'zuerst mal Anzahl der zu löschenden Datensätze berechnen
        N = 0
        strSQL = "spI_DELETE " & _
                " @t = '" & strT & "'," & _
                " @a = 1"
        OH_r r
        i = vbNo
        If r!CT > 1 Then
            strA = left(" <" & frmDel!Funktion & " " & frmDel!Wo, 30) & "> "
            strA = frmDel!Vorname & " " & frmDel!Nachname & " hat " & r!CT & " Funktionen." & vbNewLine & _
                    "Möchten Sie nur die aktuell angezeigte Funktion" & vbNewLine & _
                    strA & "löschen?" & vbNewLine & vbNewLine & _
                    "Ja" & vbTab & "Nur Funktion" & strA & "löschen" & vbNewLine & _
                    "Nein" & vbTab & "komplette Adresse Löschen"
            i = MsgBox(strA, vbYesNoCancel + vbQuestion, t)
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            End Select
        End If
        strSQL = "spI_DELETE " & _
                " @t = '" & strT & "'," & _
                " @a = " & i
        OH_r r
        s = s & vbNewLine & r!mldg
        N = r!Anzahl
        If r!nichtlöschen > 0 Then
            GoTo ErrM
        End If
    End If
    If strT = "T_VG" Then
        'sind Vorgänge mit Status "DATEV" drunter?
        'zuerst mal Anzahl der zu löschenden Datensätze berechnen
        i = 0
        strSQL = "spI_DELETE " & _
                " @t = '" & strT & "'," & _
                " @a = 1"
        OH_r r
        i = r!nichtlöschen
        If i > 0 Then
            s = "Sie haben Vorgänge ( " & i & ") mit Status " & glStrStatus
            GoTo ErrM
        End If
        s = s & vbNewLine & _
            frmDel.pageVorgang.Caption
    End If
    i = MsgBox("LÖSCHEN bedeutet, dass diese Daten unwiderruflich weg sind!!" & vbNewLine & vbNewLine & _
            frmDel.Caption & vbNewLine & s, vbOKCancel + vbDefaultButton2 + vbExclamation, _
                "LÖSCHEN (Daten sind dann definitiv weg!!!)")
    If i = vbOK Then
        If N > 3 Then
inputbox1:
            strA = "JA " & N
            s = "Bitte bestätigen Sie mit einem grossgeschriebenen " & strA & "," & vbNewLine & _
                        "dass Sie insgesamt " & N & " Datensätze löschen wollen!"
            If strT = "T_Funktion" Then
                s = s & vbNewLine & vbNewLine & _
                        "Ihnen ist klar, dass Sie hiermit auch" & vbNewLine & _
                        "ALLE zugehörigen Vorgänge, Artikel, Stichworte etc. LÖSCHEN" & vbNewLine & _
                        "(insgesamt " & N & " Datensätze!)"
            End If

            s = InputBox(s & _
                        strDeleteMldg, "LÖSCHEN " & t, "NEIN")
            If StrComp(s, strA, vbBinaryCompare) <> 0 Then
                If Len(s) > 0 And s <> "nein" Then
                    strDeleteMldg = vbNewLine & vbNewLine & "Sie müssen ein GROSSGESCHRIEBENES <" & strA & "> eingeben!" & vbNewLine & strDeleteMldg
                    GoTo inputbox1
                Else
                    GoTo ErrEnd
                End If
            End If
        End If
        If N > 1 Then
            lgid = 0
        End If
        strSQL = "spI_DELETE " & _
                    " @t = '" & strT & _
                    "',@i = " & lgid
        OH_r r
        lgid = Nz(r!ID, 0)
    'Input Dirk Müller 131118 und 141120
    '1.  Nach dem Löschen eines Vorganges wird der zuletzt erfasste Vorgang im gleichen Projekt und gleichen Unterprojekt angezeigt.
    '2.  Ist im Unterprojekt kein Vorgang mehr enthalten, wird der zuletzt erfasste Vorgang im gleichen Projekt angezeigt.
    '3.  Ist auch der einzige Vorgang in einem Projekt gelöscht, wird der nächste im Filter ausgewählte Vorgang  angezeigt.
    '4.  Falls Im Filter nur EIN Vorgang war (der zu löschende), wird der zuletzt vom aktuellen User bearbeitete Vorgang angezeigt.
        frmDel.txtFind_AfterUpdate
        If frmDel!countRec < 1 And Nz(frmDel!txtFind, "") <> "" Then
            frmDel!txtFind = Null
            frmDel.txtFind_AfterUpdate
        End If
        If lgid <> 0 And frmDel!f0 <> lgid Then
            OH_OF frmDel.Name, lgid
        End If
        frmDel!lstDet.SetFocus
    Else
        SysCmd acSysCmdSetStatus, "löschen abgebrochen!  " & t
    End If
ErrEnd:
    DoCmd.Hourglass False
    VarAntw = Null
    Exit Function
ErrMsg:
    Select Case Err
    Case -2147217911
        MsgBox Err & " " & Err.Description & vbNewLine & _
                "KEINE BERECHTIGUNG!", vbCritical, t
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, t
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    s = ""
    GoTo ErrEnd
End Function
Public Function OH_GetNr(strNr As String, _
                            Optional lgNr As Long, _
                            Optional lgAbteilung As Long, _
                            Optional varDate, _
                            Optional strKZ As String)
On Error GoTo ErrMsg
    Select Case strNr
    Case "VGNr"
        strSQL = "spI_GetNr MaxVGNr, " & _
                             lgNr & "," & _
                             lgAbteilung & "," & _
                             Year(varDate)
    Case "VGID"
        strSQL = "spI_GetNr MaxVGID"
    Case "ArtikelNr"
        strSQL = "spI_GetNr ArtikelNr," & lgNr & ",0,0,'" & strKZ & "'"
    Case "TxtNrVG"
        strSQL = "spI_GetNr txtVG, " & lgNr
    Case "TxtNrQK"
        strSQL = "spI_GetNr txtQK, " & lgNr
    End Select
    OH_r rx, "EXEC " & strSQL
    OH_GetNr = rx(0)
    OH_ResetRS rx
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetNr"
    Resume ErrEnd
End Function
Public Function OH_StartSelect()
On Error GoTo ErrMsg
    OH_CheckFrm
    frm.Form_DblClick (0)
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_StartSelect"
    Resume ErrEnd
End Function
Public Function OH_explorer() As String ' öffnet Explorer mit der entsprechenden Firma
                              ' Pfad muss in Stichworten mit "Explorer" abgelegt sein
On Error GoTo ErrMsg
    Dim strE As String
    strE = OH_StichwortExplorer("explorer")
    If Len(strE) > 0 Then
        OH_LaunchFolder 0, strE
        OH_explorer = strE
    End If
ErrEnd:
    Exit Function
ErrMsg:
Select Case Err
Case 490
    MsgBox Err & " " & Err.Description & vbNewLine & _
                 "Prüfen Sie in Ihren Adressen den unter Stichwort <Explorer> eingetragenen Hyperlink!" & _
                 vbNewLine & strE & " ?????", vbCritical, "Explorer Ablage"
Case Else
    MsgBox Err & " " & Err.Description, vbCritical, "Explorer Ablage"
End Select
Resume ErrEnd
End Function
Public Function OH_StichwortExplorer(strArt As String, _
                                    Optional blA As Boolean, _
                                    Optional frm As Form, _
                                    Optional blAnzeige As Boolean) As String
On Error GoTo ErrMsg
    Dim lgFirma As Long
    Dim lgVG As Long
    Dim strclient As String
    Dim strSubFolder As String
    Dim strE As String
    Dim strf As String
    Dim strFF As String
    Dim strN As String
    Dim strFO() As String
    Dim strA(1 To 5) As String
    Dim varA As Variant
    Dim N As Long
    Dim i1 As Long
    Dim r1 As ADODB.Recordset
    DoCmd.Hourglass True
    If frm Is Nothing Then
        Set frm = OH_CheckMainFrm
    End If

    t = "Windows-Explorer-Ablage"
    OH_StichwortExplorer = ""
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'Explorer', " & _
            " @f = 'Ablage'"
    OH_r r
    If r.BOF = True Then
        MsgBox "Ihnen fehlt im Lexikon der Eintrag:" & vbNewLine & _
                "unter Gruppe <DatabAse> in Formname <Explorer Ablage>", vbCritical, "Philipp fragen!"
        OH_ResetRS r
    Else
        strclient = Nz(r!Begriff, "")
        If Len(Dir(strclient, vbDirectory)) = 0 Then
            s = strclient & vbNewLine & _
                "ist noch nicht angelegt." & vbNewLine & _
                "Bitte zuerst diesen Basis-Ordner erstellen!"
            GoTo ErrM
        End If

        Select Case frm.Name
        Case "F_Adresse"
            lgFirma = frm!NrAdrZuord
        Case "F_VG", "frmProjekt"
            lgFirma = frm!NrFirma
            lgVG = frm!VGID
        Case "F_Leistung"
            lgFirma = frm!NrFirma
            lgVG = frm!VGID
        Case "F_Artikel"
            lgFirma = frm!NrFirma
        Case Else
            lgFirma = 0
        End Select
        If blA Then
            lgVG = 0
        End If
        If lgFirma > 0 Then
            strSQL = "Exec dbo.spa_Adresse " & _
                    " @x = 'Explorer', " & _
                    " @f = 'Firma', " & _
                    " @i  = " & lgFirma
            OH_r r
            If r.BOF Then
                s = "Adresse mit ID = " & lgFirma & "  nicht gefunden!"
                GoTo ErrM
            End If
            strSubFolder = r!subfolder
            strN = r!Firma
            strE = r!HL
            If strE = "keinHL" Then
                If blAnzeige Then
                    OH_StichwortExplorer = "StopAnzeige"
                    GoTo ErrEnd
                End If
                strE = OH_CheckExplorerName(strN)
            Else
                If Len(Dir(strE, vbDirectory)) > 0 Then
                    If lgVG <> 0 Then
                        strFF = "#" & strE & "#"
                        GoTo ExplorerVG
                    Else
                        GoTo ExplorerOK
                    End If
                End If
            End If
            s = "Die Adresse " & strN & " ist noch nicht im Explorer abgelegt." & vbNewLine & vbNewLine & vbNewLine & _
                            "Ändern Sie ggf. bitte den vorgeschlagenen Ordner-Namen für Eintrag in Explorer ab!" & vbNewLine & _
                            "Sie können der Adresse auch einen bestehenden Ordner zuweisen (z.B. bei Partnern; dann den entspr. Ordner-Namen eintragen)"
            strA(1) = "Ordner erstellen"
            strA(4) = "Öffne " & strclient
            strA(5) = "Ordner auswählen..."
            varA = Array(strA(1), strA(4), strA(5))
            If strSubFolder <> "" Then
                s = s & vbNewLine & vbNewLine & _
                    "Gleichzeitig können diese Unterordner angelegt werden:" & vbNewLine & _
                    Replace(strSubFolder, " 2:", vbNewLine & "2:")
                strA(1) = "Nur Basis-Ordner erstellen"
                strA(2) = "Basis-Ordner und Unter-Ordner erstellen"
                '1:Angebot;Projekte 2:ABC;Personalien
                If InStr(strSubFolder, "2:") Then
                    strA(3) = "mit Unter-Ordner 2:"
                    strA(2) = "mit Unter-Ordner 1:"
                    varA = Array(strA(1), strA(2), strA(3), strA(4), strA(5))
                Else
                    varA = Array(strA(1), strA(2), strA(4), strA(5))
                End If
            End If

            OH_msgbox s, _
                    varA, _
                    vbQuestion, _
                    "Ordner für eine Adresse im Explorer erstellen", _
                    "Automatisches Erstellen von Ordnern im Explorer abhängig von der Adresse:" & vbNewLine & _
                    "Tragen Sie in <Eingabe> ein, wie der neue Ordner heissen soll!" & vbNewLine & _
                    "Der Ordnername setzt sich dann aus dem im Lexikon vorgegebenen Pfad und diesem Begriff zusammen!", _
                    strE
            Select Case strMSG(2)
            Case "", "Abbrechen"
                OH_StichwortExplorer = ""
                GoTo ErrEnd
            Case strA(1), strA(2), strA(3)
                i = InStr(strSubFolder, " 2:")
                Select Case strMSG(2)
                Case strA(2)
                    If i > 0 Then
                        strSubFolder = left(strSubFolder, i)
                    End If
                    strSubFolder = Trim(Replace(strSubFolder, "1:", ""))
                Case strA(3)
                    strSubFolder = Trim(Mid(strSubFolder, i + 4))
                Case Else
                    strSubFolder = ""
                End Select
                strE = strMSG(3)
                If InStr(strE, "\") = 0 Then
                    strf = strclient & "\" & strE
                Else
                    strf = strE
                End If
                If Len(Dir(strf, vbDirectory)) > 0 Then
                    s = strf & vbNewLine & vbNewLine & _
                        "Hinweis: Ordner existiert bereits" & vbNewLine & vbNewLine & _
                        "Soll der Ordner zugeordnet werden zu" & vbNewLine & _
                        vbTab & strN
                    If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
                        GoTo ErrEnd
                    End If
                Else
                    If OH_CreateFolder(strf, strSubFolder) = False Then
                        GoTo ErrEnd
                    End If
                End If
InsertStichwort:
                strf = strE & "#" & strf & "#"
                strSQL = "spa_Adresse " & _
                " @x = 'Explorer'" & _
                ", @f = 'InsertHL'" & _
                ", @o = '" & strE & _
                "', @d = '" & strf & _
                "', @i  = " & r!idf
                OH_EX
                strE = strclient & "\" & strE
                Select Case frm.Name
                Case "F_Adresse"
                    frm.regD_Change
                End Select
            Case strA(4)
                strE = strclient
            Case strA(5)
                Set fd = Application.FileDialog(msoFileDialogFolderPicker)
                With fd
                    .Title = t
                    .AllowMultiSelect = False
                    .filters.Clear
                    .ButtonName = "Ordner auswählen u. eintragen"
                    .InitialFileName = strclient
                    .Show
                End With
                If fd.SelectedItems.count > 0 Then
                    strf = fd.SelectedItems(1)
                    strE = Replace(strf, strclient & "\", "")
                    GoTo InsertStichwort
                End If
                GoTo ErrEnd
            End Select
            strFF = strE
        Else
            strFF = "#" & strE & "#"
        End If
ExplorerVG:
        If lgVG > 0 Then
            strf = HyperlinkPart(strFF, acAddress) & "\"
            strE = Dir(strf, vbDirectory)
            Do While strE <> ""    ' Schleife beginnen.
                ' Aktuelles und übergeordnetes Verzeichnis ignorieren.
                If strE <> "." And strE <> ".." Then
                    ' Mit bit-weisem Vergleich sicherstellen, daß strE ein
                    ' Verzeichnis ist.
                    If (GetAttr(strf & strE) And vbDirectory) = vbDirectory Then
                        If InStr(strE, lgVG) > 0 Then ' Eintrag nur anzeigen, wenn es sich
                            strE = strf & strE
                            Exit Do
                        End If
                    End If    ' um ein Verzeichnis handelt.
                End If
                strE = Dir    ' Nächsten Eintrag abrufen.
            Loop
            If Len(strE) = 0 And frm.Name <> "frmProjekt" Then
                OH_msgbox "Dieses Projekt ist noch nicht im Explorer abgelegt." & vbNewLine & vbNewLine & _
                                "Ändern Sie ggf. bitte den vorgeschlagenen Ordner-Namen für Eintrag in Explorer ab!" & vbNewLine & _
                                strf & "............", _
                                Array("Ordner erstellen", strf), _
                                vbQuestion, _
                                "Projekt " & frm!VGID & " " & left(frm!VG, 20), _
                                "Automatisches Erstellen von Ordnern im Explorer abhängig von Firma und Projekt:" & vbNewLine & _
                                "Tragen Sie in <Eingabe> ein, wie der neue Ordner heissen soll!" & vbNewLine & _
                                "Der Ordnername setzt sich dann aus diesem Begriff und der Projekt-Nr. zusammen!", _
                                left(frm!VG, 20)
                Select Case Val(strMSG(1))
                Case 0
                    OH_StichwortExplorer = ""
                    GoTo ErrEnd
                Case 2
                    strE = strf
                Case 1
                    strE = strMSG(3)
                    strE = strf & strE & " " & lgVG
                    If OH_CreateFolder(strE) = False Then
                        GoTo ErrEnd
                    End If
                End Select
            End If
        End If
    End If
ExplorerOK:
    If strArt Like "Outlook" Then
        If Len(strE) > Len(strclient) Then
            strE = right(strE, Len(strE) - Len(strclient))
        Else
            strE = "XX"
        End If
    End If
    OH_StichwortExplorer = strE
    OH_ResetRS r1
ErrEnd:
    OH_ResetRS
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "StichwortExplorer"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, "StichwortExplorer"
    GoTo ErrEnd
End Function
Public Function OH_StichwortRemoveWert(frm As Form)
On Error GoTo ErrMsg
    Dim ctld As control
    Dim lgid As Long
    Dim strID As String
    Dim strGR As String
    strlink = ""
    s = ""
    t = "Setze den Wert zu null " & OH_getTitel(frm)
    Set ctld = frm!lstStichwort
    If ctld.ListCount < 1 Then
        SysCmd acSysCmdSetStatus, t & ": kein Stichwort vorhanden!"
        GoTo ErrEnd
    End If
    strID = "Nr" & frm.Tag
    lgid = Nz(frm(strID), 0)
    If InStr(frm!lstStichwort.Recordset.Source, "NrVGDET") > 0 Then
        strID = "NrVGDET"
        lgid = Nz(frm!nrVGDet, 0)
    End If
    strlink = strID & "= " & lgid
    Select Case frm.Tag
    Case "Artikel", "VG"
        strGR = Nz(frm!lstStichwortGr1, "")
        strlink = strlink & " and isnull(StichwortGr,  ''" & strGR & "'') = ''" & strGR & "''"
    End Select
    i = OH_CountStichwort(strlink)
    s = "Entferne für alle Stichworte den Wert / Hyperlink" & vbNewLine & vbNewLine
    Select Case i
    Case 0
        s = s & "ES GIBT KEINE Stichworte mit einem Wert / Hyperlink!"
        GoTo ErrM
    Case 1
        s = s & "Den Wert (Bemerkung) des EINEN Stichwortes entfernen = zu null setzen?"
    Case Else
        s = s & "Alle " & i & " Werte (Bemerkungen) / Hyperlinks zu null setzen"
    End Select
    If MsgBox(s, vbQuestion + vbYesNo, t) = vbYes Then
        strSQL = "Exec dbo.spA_Stichwort " & _
                " @x = 'RemoveWert', " & _
                " @fi='" & strlink & "'"
        OH_EX strSQL
        OH_RQ ctld
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_RemoveWert Stichworte"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_tlbStartWord()
On Error GoTo ErrMsg
    OH_ScanWord "+Word-Leervorlage", "Word-Leervorlage"
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_tlbStartWord"
    Resume ErrEnd
End Function
Public Function OH_ScanWord(Optional strf As String, _
                            Optional strT As String, _
                            Optional strM As String)
On Error GoTo ErrMsg
    Dim lgM As Long
    Dim varB As Variant
    Set frm = Screen.ActiveForm
    If Len(strT) = 0 Then
        strT = "Einscannen über Word-Vorlage"
    End If
    If Len(strf) = 0 Then
        strf = "+Scan-Vorlage"
    End If

    Select Case frm.Name
    Case "F_Adresse"
        If OH_Validate(frm!NrMitarbeiter, "Mitarbeiter") = True Then
            Exit Function
        End If
        varB = frm!Nachname
    Case "F_VG"
        If OH_Validate(frm!NrMitarbeiter, "Mitarbeiter") = True Then
            Exit Function
        End If
        varB = frm!VG
    Case Else
        OH_msgbox vbNewLine & vbNewLine & _
                 "Bitte wechseln Sie zu Adressen oder Vorgängen!", _
                  Array("Habe ich kapiert!"), vbInformation, strT, _
                  "Wenn Sie über Adressen oder Vorgänge gehen, kann Ihnen Ihre DB bereits" & _
                  " den Ort" & vbNewLine & _
                  "< endweder den Ordner Firma oder Projekt >" & vbNewLine & _
                  "für die Ablage des Wordfiles vorschlagen!"
        Exit Function
    End Select
    lgM = frm!NrMitarbeiter
    OH_startWord strf, lgM, , varB, strM
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Word-Vorlage starten"
    Resume ErrEnd
End Function
Public Function OH_CheckAbschluss(Optional strStatus As String = "") As Boolean
On Error GoTo ErrMsg
    Dim lgVG As Long
    OH_CheckAbschluss = True
    Set frm = Forms!F_VG
    lgVG = frm!NrVG
    t = "Qualitäts-Prüfung " & frm!ANr & " " & left(frm!Firma, 30)
            s = "Gemäss GoBD dürfen diese Daten nicht mehr verändert werden, " & _
                "da der Status auf <" & glStrStatus & "> steht"
        '150612 siehe Mail Uli Lips vom 12. Juni 2015
    If frm!VGStatus = glStrStatus Or strStatus = glStrStatus Then
        Select Case Screen.ActiveControl.Name
        Case "VGInfo", "vgdat2", "VGSng1", "VGAbschluss", "VGPrint", "Priorität" '211013 VGPrint ergänzt Input Dirk"
            OH_CheckAbschluss = False
            GoTo ErrEnd
        End Select
    End If
    strSQL = "Select top 1 Whoupdate as w, lastUpdate as l from T_VG" & _
        " where NrVG =  " & lgVG & _
        " and VgStatus = '" & glStrStatus & "'"
    OH_r r
    If r.BOF = False Then
        s = s & vbNewLine & _
            r!w & vbNewLine & _
            r!l
        OH_ResetRS
        GoTo ErrM
    End If
    If frm!VGAbschluss.OldValue <> 0 Then
        s = "Änderungen sollten Sie keine mehr vornehmen !" & vbNewLine & _
         "<< " & frm!VG & " >> " & vbNewLine & "ist bereits am " & Format(frm!LastUpdate, "dddd, dd.mm.yy hh:nn") & " von " & frm!whoUpdate & " abgeschlossen worden!" & vbNewLine & vbNewLine & _
         "Wollen Sie die Änderung dennoch vornehmen?????"
        x = MsgBox(s, vbDefaultButton2 + vbCritical + vbYesNo, t)

        Select Case x
        Case vbYes
            OH_CheckAbschluss = False
        End Select
    Else
        OH_CheckAbschluss = False
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox s, vbCritical, t
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_NextStichwortNr(intNr As Long, lgid As Long, strID As String) As Long
On Error GoTo ErrMsg
Dim rsMax As ADODB.Recordset
'lfd. Nummer ermitteln
'lgID: ID des geänderten DS
    If strID = "IDQK" Then
        strID = "NrQK"
    End If
    If intNr = 0 Then
        'hole nächste StichwortNr 180326
        strSQL = "Exec dbo.spA_Stichwort " & _
                    " @st = 27" & _
                    ", @cID ='" & strID & _
                    "',@ID =  " & lgid
        OH_r rsMax
        OH_NextStichwortNr = rsMax!Nr
        OH_ResetRS rsMax
    Else
        OH_NextStichwortNr = intNr
    End If
    OH_ResetRS rsMax
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_GetMandant() As Variant
On Error GoTo ErrMsg
    If EFNr = 0 Then
        OH_GetMandant = vbNullString
    Else
        OH_GetMandant = EFNr
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_GenerellesPS(frm As Form)
On Error GoTo ErrMsg
    Dim strsqlPS As String
    Dim strPS As String
    Dim strP As String
    Dim strPSNew As String
    strP = "Generelles PS"
    strPS = "Ersetzen Sie diesen Text durch Ihren Kurztext"
    strSQL = "Exec dbo.spa_Lexikon" & _
            " @x = '" & strP & "'"
    OH_r r
    strPSNew = r!PS
    s = "Den Kurztext, den Sie unten festlegen, können Sie auf jedem Brief, Fax, EMail erscheinen lassen!!" & vbNewLine & vbNewLine & _
            "Ändern Sie einfach den Text ab und bestätigen Sie mit JA!"
    OH_msgbox s, _
            Array("JA" & vbNewLine & "Text anzeigen", _
            "Nein" & vbNewLine & "NICHT zeigen", _
            "Im Lexikon anschauen"), _
            vbQuestion, _
            "Genereller Text auf allen Reports!", _
            "Das Ganze finden Sie auch im Lexikon unter Gruppe <Database>, <Generelles PS>", strPSNew
    strPSNew = strMSG(3)
    i = Val(strMSG(1))
    Select Case i
    Case 1, 2
        If strPS = strPSNew Then
            glstrPS = vbNullString
        Else
            If i = 1 Then
                glstrPS = strPSNew
                frm!btnGenerellesPS.ForeColor = vbGreen
            Else
                glstrPS = vbNullString
                frm!btnGenerellesPS.ForeColor = vbRed
            End If
        End If
        strSQL = "Exec dbo.spa_Lexikon" & _
                " @x = '" & strP & "'," & _
                " @f = '" & strPSNew & "'," & _
                " @i = " & i
        OH_EX
    Case 3
        OH_OF "F_Lexikon", 0, 0, "Begriff like ''" & strP & "''"
    End Select
    OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Generelles PS"
    Resume ErrEnd
End Function
Public Function OH_GetKalkVP(dblEP As Double, _
                             dblAR As Double, _
                             dblPF As Double, _
                             strEW As String, _
                             strVW As String) As Double
'Berechneter Verkaufspreis aufgrund des
'-Einkaufspreises (dblEP)
'-ArtikelRabatt (dblAR)
'-Preisfaktor (dblPF)
'UF_Stichwort gesetzt
On Error GoTo ErrMsg
    Dim sgEK As Single
    Dim sgVK As Single
    Dim rsVP As ADODB.Recordset
    strSQL = "Select * from T_LAnd"
    OH_r rsVP
    rsVP.Find "Währung ='" & strEW & "'"
    sgEK = rsVP!Kurs
    rsVP.Find "Währung ='" & strVW & "'"
    sgVK = rsVP!Kurs
    OH_GetKalkVP = (dblEP - (dblEP * dblAR / 100)) * dblPF * sgEK / sgVK
    If strVW Like "CHF" Then
        OH_GetKalkVP = Int((OH_GetKalkVP * 20) + 0.5) / 20
    Else
        OH_GetKalkVP = Int((OH_GetKalkVP * 100) + 0.5) / 100
    End If
    If OH_GetKalkVP > 100 Then
        OH_GetKalkVP = OH_RundeX(OH_GetKalkVP, 0)
    End If
    OH_ResetRS rsVP
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetKalkVP"
    Resume ErrEnd
End Function
Public Function OH_RefreshStichwort(frm As Form)
On Error GoTo ErrMsg
'prüft, ob PF_Stichwort offen ist, wenn ja wird die Recordsource aktualisiert!
    If OH_isloaded("PF_Stichwort") Then
       OH_OpenStichwort frm
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_RefreshPopup Me"
    Resume ErrEnd
End Function
Public Function OH_OpenStichwort(frmST As Form, _
                                Optional strST As String, _
                                Optional strS As String, _
                                Optional lgX As Long = 0) As Long
On Error GoTo ErrMsg
'öffnet PF_Stichwort
    OH_OpenStichwort = 0
    Select Case lgX
    Case Is < 3435
    Case Is < 7400
        OH_OpenStichwort = 1
        OH_tlbZoom
        GoTo ErrEnd
    Case Is > 10000
        t = "Öffne Hyperlink"
        strSQL = "Exec dbo.spA_Stichwort " & _
                " @x = 'ÖffneHyperlink' " & _
                ", @id=" & Val(frmST!lstStichwort)
        OH_r r
        If r.BOF Then
            s = "Kein Hyperlink erkannt"
            GoTo ErrM
        Else
            OH_LaunchDocument 1, r!Hyperlink
        End If
        OH_OpenStichwort = 1
        GoTo ErrEnd
    Case Else
    End Select
    DoCmd.openForm "PF_Stichwort", , , , , acHidden
    With Forms!PF_Stichwort
        .OH_SetForm frmST, strST, strS
        .Visible = True
    End With

ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_OpenStichwort"
    Resume ErrEnd
ErrM:
    MsgBox s, vbInformation, t
End Function
Public Function OH_WordAnschrift(strArt As String)
On Error GoTo ErrMsg
    Dim lgF As Long
    Dim lgA As Long
    Dim strPath As String
    Dim strFileMerge As String
    Dim strE As String
    Dim strFile As String
    Dim strFileMM As String
    Dim strK As String
    Dim rsW As ADODB.Recordset
    Dim mm As MailMerge
    t = strArt & " mit Wordserienbrief-Funktion"
    strArt = Mid(strArt, InStr(strArt, " ") + 1, 20)
    strlink = "NrFunktion = " & EFNrFktn & _
              " and Stichwort like '+Couvert' " & _
              " and BemStichwort like '" & strArt & "'"
    strSQL = "Select * from T_Stichwort where " & strlink & ";"
    OH_r rsW
    If rsW.BOF = True Then
        MsgBox EFAbsenderKlein & vbNewLine & vbNewLine & _
              "Kein Wordfile in Stichworten erfasst!", vbCritical, t
        GoTo ErrEnd
    Else
        s = "Das beim Mandant unter Stichworten <+Couvert> eingetragene File" & vbNewLine & strFileMM & vbNewLine
        strFileMM = Nz(HyperlinkPart(rsW!StichwortHyperlink, acAddress), "")
        If Not right(strFileMM, 3) Like "dot" Then
            MsgBox s & "ist kein Word-File mit Endung <.dot>!", vbCritical, t
            GoTo ErrEnd
        End If
        If Len(Dir(strFileMM)) = 0 Then
            MsgBox s & "ist nicht zu finden!", vbCritical, t
            GoTo ErrEnd
        End If
    End If
    strPath = OH_GetPathPart(strFileMM)
    strFileMerge = strPath & "AnschriftSteuerdatei.txt"
    DoCmd.OutputTo acOutputQuery, "A_Anschrift", acFormatRTF, strFileMerge, False
        If OH_InitializeWord = False Then
            GoTo ErrEnd
        End If
    With appWd
        .Visible = True
        .Documents.Open strFileMM
        .WindowState = wdWindowStateMaximize
        .ActiveWindow.View.Type = wdPrintView
        Set mm = .ActiveDocument.MailMerge
        mm.OpenDataSource Name:=strFileMerge, readOnly:=True, Format:=wdOpenFormatUnicodeText
        mm.Destination = wdSendToNewDocument
        If mm.State = wdMainAndDataSource Then
            mm.Execute
        Else
            MsgBox "Keine Datenquelle im Hauptdokument " & strFile, vbCritical, "Wordserienbrief"
            Set appWd = Nothing
            GoTo ErrEnd
        End If
        strFile = strPath & "Couvert.doc"
        .ActiveDocument.SaveAs strFile
        .Documents(OH_GetNamePart(strFileMM)).Close SaveChanges:=wdDoNotSaveChanges
        .Documents.Open strFile
    End With
    Set appWd = Nothing
    FollowHyperlink (strFile), , True
ErrEnd:
    OH_ResetRS rsW
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        s = "Mögl. Fehlerquellen:" & vbNewLine & _
                "-Sie haben zwischenzeitl. im Explorer Ordner verschoben?" & vbNewLine & _
                "-Prüfen Sie den Ordner des Kandidaten / der Firma" & vbNewLine & _
                "-Serienbriefe waren schon geöffnet?" & vbNewLine & _
                "-Prüfen Sie die Einträge bei dem entspr. Mandanten unter Stichwort <+Couvert>" & vbNewLine & vbNewLine & _
                "Ihre Firmen-DB hat diesen Fehler generiert:" & vbNewLine

        MsgBox s & Err & " " & Err.Description, vbCritical, "Fehler bei Word-Brief starten"
        Resume ErrEnd
    End Select
    Resume ErrEnd
End Function
Public Function OH_RefreshPopup(frm As Form)
On Error GoTo ErrMsg
    Dim strCaption As String
'prüft, ob PF_Stichwort offen ist, wenn ja wird die Recordsource aktualisiert!
    If OH_isloaded("PF_Stichwort") Then
        If Forms!PF_Stichwort.Reg = 0 Then
            OH_OpenStichwort frm
        End If
    End If
    If OH_isloaded("PF_Filter") Then
        With Forms!PF_Filter
            If Not !comForm Like frm.Name Then
                !comForm = frm.Name
                .comForm_AfterUpdate
            End If
        End With
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_RefreshPopup Me"
    Resume ErrEnd
End Function
Public Function OH_Navigator(lgNavi As Long)
' OHNEMUS, Samstag, 11. September 2004
' Hinweise :
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgZ As Long
    Dim frmN As Form
    Dim sgP As Single
    Dim sgMWSTOld As Single
    Dim sgMWSTNew As Single
    Dim ctlNavi As control
    DoCmd.Hourglass True
    t = "Adressen zuordnen aus Navigator"
    If OH_isloaded("PF_Navigator") = True Then
        Set frm = Forms!pf_Navigator
        If IsNull(frm!comAdresse.column(1)) = False Then
            lgid = frm!comAdresse
        Else
            If MsgBox("wählen Sie bitte im Navigator eine Person oder Firma aus!", vbExclamation + vbOKCancel, t) = vbCancel Then
                DoCmd.Close acForm, "PF_Navigator"
            Else
                If Nz(frm!txtFind, "") = "" Then
                    frm!txtFind.SetFocus
                Else
                    frm!comAdresse.SetFocus
                End If
            End If
        End If
        If lgid > 0 Then
            s = Nz(frm!comAdresse.column(1))
            If InStr(frm!btnOK.Caption, "Firma") = 0 Then
                If frm!comAdresse.column(1) <> s Then
                    s = s & vbNewLine & _
                            frm!comAdresse.column(1)
                End If
            End If
        Select Case lgNavi
        Case 10
            Set frmN = Forms!F_Adresse
            strSQL = "spa_Adresse" & _
                        " @x = 'NeuerKontakt'" & _
                        ", @i = " & lgid & _
                        ", @a = " & frmN!NrFunktion & _
                        ", @f ='" & frmN!comKArt & "'"
            OH_r r
            If r!Msg <> "" Then
                If MsgBox(r!Msg, vbRetryCancel + vbQuestion, t) = vbRetry Then
                    GoTo ErrEnd
                End If
            End If
            OH_RQ frmN!lstKontakt, lgid
            frmN!lstKontakt.SetFocus
        Case 20
            Set frmN = Forms!PF_NeuVG
            If frmN!NrFunktion = lgid Then
                GoTo closeNavi
            End If
            frmN!NrFunktion = lgid
            frmN.NrFunktion_AfterUpdate
        Case 30, 31
            Set frmN = Forms!F_VG
            OH_EX "EXEC spa_VG" & _
                " @x ='NeuerKontakt'" & _
                ", @i = " & lgid & _
                ", @a = " & frmN!NrVG & _
                ", @m = " & Nz(frmN!ComAnzahlZuord, 1) * 100 & _
                ", @f ='" & frmN!comKArt & "'"
            OH_RQ frmN!lstKontakt, lgid
            frmN!lstKontakt.SetFocus
            frmN!comKArt = Null
            frmN!ComAnzahlZuord = Null
        Case 40
            Set frmN = Forms!F_VG
            sgMWSTOld = frmN!MWSt
            If frmN!NrFunktion = lgid Then
                s = frm!comAdresse.column(1) & vbNewLine & _
                        "ist bereits diesem Vorgang zugeordnet!"
                GoTo ErrM
            End If
            strSQL = "Exec dbo.spa_VG " & _
                        " @x = 'PartnerÄndern' " & _
                        ", @i = " & frmN!NrVG & _
                        ", @a = " & lgid & _
                        ", @m = " & frmN!NrQK & _
                        ", @d = '" & frmN!VGSprache & _
                        "',@f = '" & frmN!comAnschrift & "'"
            OH_r r
            If left(r!Msg, 2) <> "OK" Then
                s = r!Msg
                GoTo ErrM
            End If
            OH_RQf frmN
            frmN.OH_VGCurrent  'Update Input Dirk 180807
            frmN!NamePerson.SetFocus
            sgMWSTNew = frmN!MWSt
            If sgMWSTOld <> sgMWSTNew Then
                t = "Check der MWST"
                s = "die MWST hat geändert von " & sgMWSTOld & " auf " & sgMWSTNew & vbNewLine & _
                    "JA" & vbTab & "ist korrekt" & vbNewLine & _
                    "Nein" & vbTab & "urspr. MWSt " & sgMWSTOld & " wieder eintragen"
                i = MsgBox(s, vbExclamation + vbYesNo, t)
                If i = vbNo Then
                    strSQL = "Exec dbo.spa_VG " & _
                        " @x = 'MWSTÄndern' " & _
                        ", @i = " & frmN!NrVG & _
                        ",@dec = '" & Replace(sgMWSTOld, ",", ".") & "'"
                    OH_EX
                    frmN.lstDet_AfterUpdate
               End If
            End If

        Case 50
            Set frmN = Forms!pfrmAdresseCheck
            frmN!Firma = frm!comAdresse.column(4)
        Case 60
            Set frmN = Forms!F_Adresse
            If frmN!NrFunktion = lgid Then
                s = frm!comAdresse.column(1) & vbNewLine & _
                        "ist bereits diesem Vorgang zugeordnet!"
                GoTo ErrM
            End If
            strSQL = "Exec dbo.spa_Adresse " & _
                        " @x = 'lstVGAct'" & _
                        ", @i = " & lgid & _
                        ", @a = " & frmN!lstVGAct & _
                        ", @n = " & frmN!NrFunktion & _
                        ", @b = " & frmN!lstVG
            OH_r r
            i = r!Info
            Select Case i
            Case 0
                s = "Keine Verschiebung!"
                GoTo ErrM
            Case 1
                s = "EIN Vorgang wurde"
            Case Else
                s = i & " Vorgänge wurden"
            End Select
            s = s & " verschoben auf " & vbNewLine & _
                frm!comAdresse.column(1)
            MsgBox s, vbInformation, t
            OH_RQ frmN!lstVG
            frmN!lstVGAct.SetFocus
        Case 70, 71, 72
            Set frmN = Forms!F_VG!UF_txt.Form
            Set ctlNavi = frmN!txtV
            strSQL = "SELECT Nachname, " & _
                           " Strasse, " & _
                           " Land, " & _
                           " PLZStrasse, " & _
                           " Ort, " & _
                           " NachnameStrasseOrt, " & _
                           " FunktionNr, " & _
                           " Telefon, " & _
                           " Fax " & _
                    " FROM A_Funktion " & _
                    " Where NrFunktion = " & frm!comAdresse
            OH_r r
            ctlNavi = r!NachnameStrasseOrt '250528 OH
'                If Not IsNull(R!FunktionNr) Then
'                    ctlNavi = ctlNavi & vbNewLine & _
'                        "Betriebs-Nr.: " & R!FunktionNr
'                End If
                Select Case lgNavi
                Case 71
                    ctlNavi = ctlNavi & vbNewLine & _
                        "Tel.: " & Nz(r!Telefon, " - ") & vbNewLine & _
                        "Fax : " & Nz(r!Fax, " - ")
                Case 72
                    If Not IsNull(frm!comAdresse) Then
                        strSQL = "SELECT NrAdresse, " & _
                                        " Vorname, " & _
                                        " Nachname, " & _
                                        " ArtAdresse, " & _
                                        " Telefon " & _
                            " FROM A_Funktion " & _
                            " Where NrFunktion = " & Val(frm!comAdresse)
                        OH_r r
                        ctlNavi = ctlNavi & vbNewLine & _
                              "Kontaktperson: " & r!ArtAdresse & " " & r!Vorname & " " & r!Nachname
                        If Not IsNull(r!Telefon) Then
                            ctlNavi = ctlNavi & vbNewLine & _
                               "Tel.: " & r!Telefon
                        End If
                    End If
                End Select
        Case 80, 81
            Set frmN = Forms!PF_NeuAdresse
            strSQL = "EXECUTE spa_Adresse " & _
                    " @x = 'ID' " & _
                    ",@i = " & lgid
            OH_r r
            If lgNavi = 80 Then
                frmN!NrFunktion = frm!comAdresse
                frmN!Nachname = r!Nachname
                frmN!Vorname = r!Vorname
            Else
                frmN!NrFunktion1 = frm!comAdresse
                frmN!Nachname1 = r!Nachname
                frmN!vorname1 = r!Vorname
            End If
        Case 90 'Firmenwechsel
            Set frmN = Forms!F_Adresse
            strSQL = "EXECUTE spa_Adresse " & _
                    " @x = 'lstact' " & _
                    ",@a = " & 28 & _
                    ",@i = " & lgid & _
                    ",@b = " & frmN!NrFunktion
            OH_r r
            lgZ = r!Msg
            If lgZ > 0 Then
                OH_OF "F_Adresse", lgZ, 10
                s = "Firmenwechsel: alle betroffenen Adressen sind gefiltert."
                SysCmd acSysCmdSetStatus, s
            Else
                s = "Firmenwechsel war NICHT erfolgreich"
                GoTo ErrM
            End If
        Case 100 'gleiche Anschrift wie...'
            Set frmN = Forms!F_Adresse
            lgZ = frmN!NrFunktion
            strSQL = "EXECUTE spa_Adresse " & _
                    " @x = 'lstact' " & _
                    ",@a = " & 29 & _
                    ",@b = " & lgid & _
                    ",@i = " & lgZ
            OH_r r
            If r!Msg = 1 Then
                OH_OF "F_Adresse", lgZ, 10
                s = "beide betroffenen Adressen sind gefiltert, die Adressen sind angeglichen!"
                SysCmd acSysCmdSetStatus, s
            Else
                s = "Änderung der Anschrift war NICHT erfolgreich"
                GoTo ErrM
            End If

        End Select

'            Select Case lgNavi
'            Case "Zuordnen als "        ' 180419 Zuordnung erweitert
'                Set frmN = Forms!F_Adresse
'                strSQL = "spa_Adresse" & _
'                            " @x ='NeuerKontakt'" & _
'                            ", @i = " & lgID & _
'                            ", @a = " & frmN!NrFunktion & _
'                            ", @f ='" & frmN!comKArt & "'"
'                OH_r R
'                If R!Msg <> "" Then
'                    If MsgBox(R!Msg, vbRetryCancel + vbQuestion, t) = vbRetry Then
'                        GoTo Errend
'                    End If
'                End If
'                OH_RQ frmN!lstKontakt, lgID
'                frmN!lstKontakt.SetFocus
'            Case "Vorgang versc"
'            Case "arbeitetBei"
'                Set frmN = Forms!pfrmNdresseCheck
'                frmN!Firma = frm!comFirma
'            Case "Lieferant (Fi"
'                Set frmN = Forms!F_Artikel
'                lgID = Nz(frm!comAdresse.column(4), 0)
'                If lgID = 0 Then
'                    s = "Bitte auswählen"
'                    frm!comAdresse.SetFocus
'                    GoTo errM
'                End If
'                lgZ = frmN!NrArtikel
'                strSQL = "EXEC spa_Artikel " & _
'                        "@x = 'LieferantÄndern'" & _
'                        ",@i = " & lgZ & _
'                        ",@a = " & lgID
'                OH_EX
'                OH_RQf frmN
'                OH_RQ frmN!lstDet, lgZ
'            Case "Kunde (Firma)"
'                Set frmN = Forms!F_Artikel
'                lgID = Nz(frm!comAdresse, 0)
'                If lgID = 0 Then
'                    s = "Bitte auswählen"
'                    frm!comAdresse.SetFocus
'                    GoTo errM
'                End If
'                If Val(frm!Rabatt) <= 0 Or Val(frm!Rabatt) > 100 Then
'                    s = "Bitte Rabatt > 0 und <100 % eintragen"
'                    frm!Rabatt.SetFocus
'                    GoTo errM
'                End If
'                lgZ = frmN!NrArtikel
'                strSQL = "EXEC spa_Artikel " & _
'                        "@x = 'lstRabattAct'" & _
'                        ",@a = 20 " & _
'                        ",@i = " & lgZ & _
'                        ",@b = " & lgID & _
'                        ",@n = " & Val(frm!Rabatt) * 100
'                OH_r R
'                OH_RQ frmN!lstRabatt, R!ID
'            Case Else
'                strSQL = "SELECT Nachname, " & _
'                               " Strasse, " & _
'                               " Land, " & _
'                               " PLZStrasse, " & _
'                               " Ort, " & _
'                               " FunktionNr, " & _
'                               " Telefon, " & _
'                               " Fax " & _
'                        " FROM A_Funktion " & _
'                        " Where NrFunktion = " & frm!comAdresse
'                OH_r R
'                ctlNavi = R!Nachname & vbNewLine & _
'                    R!Strasse & vbNewLine & _
'                    R!Land & "-" & R!PLZStrasse & " " & R!Ort
'                    If Not IsNull(R!FunktionNr) Then
'                        ctlNavi = ctlNavi & vbNewLine & _
'                            "Betriebs-Nr.: " & R!FunktionNr
'                    End If
'                    Select Case lgNavi
'                    Case "Firma auswählen mit Tel. und Fax und zuordnen"
'                        ctlNavi = ctlNavi & vbNewLine & _
'                            "Tel.: " & Nz(R!Telefon, " - ") & vbNewLine & _
'                            "Fax : " & Nz(R!Fax, " - ")
'                    Case "Kontaktperson auswählen und zuordnen"
'                        If Not IsNull(frm!comAdresse) Then
'                            strSQL = "SELECT NrAdresse, " & _
'                                            " Vorname, " & _
'                                            " Nachname, " & _
'                                            " ArtAdresse, " & _
'                                            " Telefon " & _
'                                " FROM A_Funktion " & _
'                                " Where NrFunktion = " & Val(frm!comAdresse)
'                            OH_r R
'                            ctlNavi = ctlNavi & vbNewLine & _
'                                  "Kontaktperson: " & R!ArtAdresse & " " & R!Vorname & " " & R!Nachname
'                            If Not IsNull(R!Telefon) Then
'                                ctlNavi = ctlNavi & vbNewLine & _
'                                   "Tel.: " & R!Telefon
'                            End If
'                        End If
'                    End Select
'                ctlNavi.SetFocus
'           End Select
closeNavi:
            DoCmd.Close acForm, "PF_Navigator"
        End If
    Else
        DoCmd.openForm "PF_Navigator", , , , , , lgNavi
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    t = "OH_Navigator"
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function oh_AdrSecurityMldg()
On Error GoTo ErrMsg
    s = "Mit dieser Nummer von 0 bis max. 5 können Sie den Zugriff der Adressen für die einzelnen Mitarbeiter (MA) steuern!" & vbNewLine & _
            "Wenn Sie z.B. (als Admin) bei einem MA das Stichwort <+AdrSecurity> mit dem Wert <1,2,3> (mit Komma trennen!) eintragen, " & _
            "sieht dieser MA nur Adressen mit den Adressen-Sicherheits-Nummern 1,2 oder 3." & vbNewLine & _
            "Der Standard-Wert steht auf <0> ==> Adressen für alle zugänglich!" & vbNewLine & vbNewLine & _
            "Nur Nummern, für die der MA die Berechtigung hat, kann er auch ändern!"
    MsgBox s, vbInformation, "Adressen-Sicherheits-Nummer"
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "oh_AdrSecurityMldg"
    End Select
    Resume ErrEnd
End Function
Public Function OH_GetIDfromLst(ctlLst As control) As Long
On Error GoTo ErrMsg
'übergebe ein ListenFeld mit Mehrfachauswahl
'ermittle den ersten angeclickten Datensatz, wenn nix angeclickt, nimm den Ersten!
    If ctlLst.ListIndex = -1 Then
        OH_GetIDfromLst = 1
    Else
        OH_GetIDfromLst = ctlLst.ListIndex + 1
    End If
    ctlLst.Selected(OH_GetIDfromLst) = True
    OH_GetIDfromLst = Nz(ctlLst.column(0, OH_GetIDfromLst), 0)
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetIDfromLst"
    Resume ErrEnd
End Function
Public Function OH_SetIDinLst(ctlLst As control, lgid As Long) As Long
On Error GoTo ErrMsg
'übergebe ein ListenFeld mit Mehrfachauswahl ctlLst
'markiere die Zeile mit der übergeben lgID
    Dim N As Long
    For N = 0 To ctlLst.ListCount - 1
        If Val(Nz(ctlLst.column(0, N), 0)) = lgid Then
            ctlLst.Selected(N) = True
            Exit For
        End If
    Next N
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_SetIDinLst"
    Resume ErrEnd
End Function
Public Function OH_OF(strFrm As String, _
                        Optional lgid As Long = 0, _
                        Optional lgArt As Long = 0, _
                        Optional strL As String _
                        ) As Long
On Error GoTo ErrMsg
    Dim blVerlauf As Boolean
    Dim frmF As Form
    If lgArt = 10 Then
        DoCmd.openForm strFrm
        Set frmF = Forms(strFrm)
        s = frmF.Tag
        If s = "Funktion" Then
            s = "Adresse"
        End If
        strSQL = "Exec dbo.spa_" & s & _
        " @x = 'vwID'," & _
        " @i = 1"
        OH_txtFind frmF, strSQL, lgid
        OH_OF = 1
    Else
        blVerlauf = lgArt <> 3
        If Screen.ActiveForm.Name <> strFrm Then
            DoCmd.openForm strFrm, , , , , , lgid
        End If
        OH_OF = 1
        If strFrm <> "Menu" Then
            If lgid = 0 Then
                If strL = vbNullString Then
                    lgArt = 1
                Else
                    lgid = OH_GetID(strFrm, strL)
                End If
            End If
            If lgid > 0 Then
                strSQL = "Exec dbo.spa_" & Mid(strFrm, 3) & " ID, " & lgid & "," & lgArt
                strSQL = Replace(strSQL, "__", "_") '110628
                OH_r r
                If r.BOF Then
                    MsgBox "Daten nicht gefunden!", vbExclamation, strFrm
                    strSQL = "Exec dbo.spa_" & Mid(strFrm, 3) & " ID,0"
                    OH_r r
                    If r.BOF Then
                        OH_OF = 0
                        MsgBox "Daten nicht gefunden!", vbExclamation, strFrm
                        DoCmd.Close acForm, strFrm
                        GoTo ErrEnd
                    End If
                End If
                Set frm = Forms(strFrm)
                OH_SetRS frm, lgid, strSQL, , , blVerlauf
                frm.Visible = True
                OH_setLst frm!lstDet, lgid
            End If
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err
    Case 2475 'Aktives Fenster
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_OF " & strFrm
    End Select
    Resume ErrEnd
End Function
Public Function OH_GetID(strFrm As String, _
                        strL As String) As Long
On Error GoTo ErrMsg
    Dim lgid As Long
    'Hole letzte ID für Formular
    OH_GetID = 0
    If strL = vbNullString Then
        GoTo ErrEnd
    End If
    strSQL = "Exec dbo.spI_ID " & _
                "@x = 'GetID' " & _
                ",@f = '" & strFrm & _
                "',@d = '" & strL & "'"
    OH_r r
    If r.BOF Then
        OH_GetID = 0
    Else
        OH_GetID = r(0)
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_GetID " & strFrm
    End Select
    Resume ErrEnd
End Function
Public Function OH_tlbStartForm() As Form
On Error GoTo ErrMsg
    OH_closeObj "PF_MsgBox"
    DoEvents
    Set OH_tlbStartForm = Screen.ActiveForm
    If left(OH_tlbStartForm.Name, 2) Like "PF" Then
        DoCmd.Minimize
    End If
    Set OH_tlbStartForm = Screen.ActiveForm
    If Len(OH_tlbStartForm.RecordSource) > 0 Then
        OH_SaveRS OH_tlbStartForm
        If OH_RecordcountForm(OH_tlbStartForm) = 0 Then
            OH_tlbStartForm.FilterOn = False
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2475
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_tlbStartForm"
    End Select
    Resume ErrEnd
End Function
Public Function OH_ResetNr(frm As Form, _
                            strNr As String, _
                            lgNr As Long, _
                            lgid As Long, _
                            Optional strW1 As String = "", _
                            Optional lg1 As Long = 0, _
                            Optional lgStart As Long = 1, _
                            Optional strW2 As String = "", _
                            Optional lg2 As Long = 0) As Boolean
On Error GoTo ErrMsg
' OHNEMUS, Montag, 19. November 2007
    strSQL = "Exec dbo.spI_Resetnr @x='" & frm.Name & "'," & _
                              "@Nr= " & lgNr & "," & _
                              "@ID= " & lgid & "," & _
                              "@w1= '" & strW1 & "'," & _
                              "@i1= " & lg1 & "," & _
                              "@w2= '" & strW2 & "'," & _
                              "@i2= " & lg2 & "," & _
                              "@s= " & lgStart
    frm.Undo
    OH_EX
    OH_RQf frm
    strlink = strNr & "  = " & lgNr
    OH_FB frm, strlink, strNr
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_ResetNr"
    End Select
    Resume ErrEnd
End Function
Public Function OH_EFAbsender(Optional IDUser As Long = 0, Optional strA As String = "")
On Error GoTo ErrMsg
'EFAbsenderKlein Einstellung des Absenders für Etiketten-Kurzabsender!
    If IDUser = 0 Then
        IDUser = lguser
    End If
    strSQL = "Exec dbo.spa_Z " & _
            "@x = 'EFAbsender' " & _
            ",@ID = " & IDUser & _
            ",@f = '" & strA & "'"
    OH_r r
    EFAbsenderKlein = Nz(r!Kurz, "Absender-Adresse nicht vollständig")
    EFAbsender = Nz(r!Lang, "Absender-Adresse nicht vollständig")
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_EFAbsender"
    Resume ErrEnd
End Function

Public Function OH_ReplaceStr(strTxt As String, strX As String) As String
On Error GoTo ErrMsg
    Dim rm As ADODB.Recordset
    'suche Makler zu EMailadresse = strX
    strSQL = "Exec dbo.spa_Div " & _
            " @x ='Replacetxt', " & _
            " @f = '" & strX & "'"
    OH_r rm
    While Not rm.EOF
        strTxt = Replace(strTxt, rm!s, rm!r)
    rm.MoveNext
    Wend
    OH_ReplaceStr = strTxt
    OH_ResetRS rm
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_ReplaceStr"
    End Select
    Resume ErrEnd
End Function
Public Function OH_lstWv(f As Form)
On Error GoTo ErrMsg
    s = "Liste der Wiedervorlagen (WV)" & vbNewLine & _
                "Doppel-Klick:" & vbNewLine & _
                "-im linken Bereich öffnet Editier-Modus" & vbNewLine & _
                "-auf Partner zeigt Person" & vbNewLine & _
                "-auf Firma zeigt Firma" & vbNewLine & _
                "-auf Projekt zeigt Vorgang" & vbNewLine & _
                "mehrere WV markieren mit SHIFT/CTRL-Taste"
    With f!lstWv
        .ColumnWidths = OH_ColumnWidthsMM("0;0;0;0;16;12;50;30;30;20;20")
        .ColumnCount = 13
        .ControlTipText = s
    End With
    strSQL = "Exec dbo.spa_Adresse " & _
           " @x = 'Wiedervorlage'," & _
           " @f ='" & f.Tag & "'"
    OH_A "lstWvAct", strSQL, f
    f!lstWvAct.Value = 22
    OH_lstWvAct f, f!lstWvAct
    f!lstWvAct.Value = 22
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_lstWv"
    End Select
    Resume ErrEnd
End Function
Public Function OH_lstWv_DblClick(f As Form)
On Error GoTo ErrMsg
    Dim lgid As Long
    t = "Doppel-Klick Liste Wiedervorlage"
    i = f!lstWv.Tag
    Select Case i
    Case Is > 7800
        lgid = Val(Nz(f!lstWv.column(2)))
        If lgid = 0 Then
            s = "Diese Wiedervorlage ist keinem Projekt zugeordnet"
            GoTo ErrM
        End If
        OH_OF "F_VG", lgid
    Case Is > 4400 'Partner
        lgid = Val(Nz(f!lstWv.column(1)))
        If i > 6100 Then 'firma
            strSQL = "Exec dbo.spa_Adresse " & _
                    " @x = 'IDFirma', " & _
                    " @i = " & lgid
            OH_r r
            lgid = r!ID
            OH_OF "F_Adresse", lgid, 1
        Else
            OH_OF "F_Adresse", lgid
        End If
    Case Else
        f!lstWvAct = 30
        OH_lstWvAct f, f!lstWvAct
    End Select
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_lstWv"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
End Function

Public Function OH_lstWvAct(f As Form, c As control)
On Error GoTo ErrMsg
    Dim lgu As Long
    Dim lgA As Long
    Dim lgS As Long
    Dim lgid As Long
    Dim z As Long
    Dim strA As String
    Dim strM As String
    DoCmd.Hourglass True
    Set ctl = f!lstWv
    lgA = Nz(c, 0)
    ctl.BackColor = f!lstDet.BackColor
    t = "Wiedervolage  " & c.column(1)
    Select Case lgA
    Case 29, 30, 31, 32, 33, 40, 41, 43, 44
        z = OH_InsertID_LST(ctl, True)
        Select Case z
        Case 0
            s = "Bitte rechts die entsprechende(n) Zeile markieren!" & vbNewLine & vbNewLine & _
                    "(Markieren Sie mehrere Zeilen mit der SHIFT / CTRL-Taste)"
            GoTo ErrM
        Case 1
            strM = "Betroffen ist die EINE markierte Wiedervolage" & vbNewLine
        Case Else
            strM = "Betroffen sind die " & z & " markierten Wiedervolagen" & vbNewLine
        End Select
        If lgA = 29 Then
            s = strM & vbNewLine & _
                    "Clicken Sie unten an, was Sie damit machen wollen..." & vbNewLine & _
                    "Mit Admin-Rechten kann man auch Wiedervolagen eines Kollegen manipulieren!"
            GoTo ErrM
        Else
            If glAdmin = False Then
                'Prüfe, ob Wiedervolagen eines Kollegen markiert sind
                'wenn ja abbrechen!
                i = 0
                For Each x In ctl.ItemsSelected
                    If ctl.column(5, x) <> strUserKZ Then
                        i = i + 1
                        ctl.Selected(x) = False
                    End If
                Next x
                If i > 0 Then
                    s = "Ohne Admin-Rechte können Sie die markierten (" & i & ") Wiedervolagen eines Kollegen nicht ändern!"
                    GoTo ErrM
                End If
            End If
        End If
    End Select

    lgid = Nz(ctl.column(0), 0)
    strA = "Exec dbo.spa_Adresse" & _
            " @x = 'Wiedervorlage'," & _
            " @i = " & f!NrFunktion & "," & _
            " @n = " & lgid & "," & _
            " @a = " & lgA
    Select Case lgA
    Case 9
        Select Case f.Name
        Case "F_VG"
            s = "den aktuellen Vorgang" & vbNewLine & f!VG
        Case "F_Adresse"
             s = "die aktuelle Adresse" & vbNewLine & f!Nachname
       End Select
        s = "Sie können " & s & vbNewLine & _
                "sich oder einem anderen MA als Wiedervolage zuordnen." & vbNewLine & _
                "Clicken Sie das Gewünschte einfach an...."
        GoTo ErrM
    Case 10, 20, 21, 30
        DoCmd.openForm "pfrmZuord", , , , , , left(f.Tag, 1) & lgA & lgid
    Case 31
        s = strM & vbNewLine & _
                "Bitte Anzahl Tage (ab heute) für die Wiedervolage eingeben" & vbNewLine & _
                "(Standard ist eine Woche = 7 Tage)"
        s = InputBox(s, t, 7)
        If s = "" Then
            GoTo ErrEnd
        End If
        lgS = OH_CheckFromTo(Val(s), 0, 365)
        If lgS < 0 Then
            GoTo ErrEnd
        End If
        strSQL = strA & _
            ", @b = " & lgS
        OH_EX
        OH_RQ ctl
        ctl = lgid
    Case 32
        s = strM & vbNewLine & _
                "Bitte Priorität" & vbNewLine & _
                "(Standard ist 1 = höchste Priorität)"
        s = InputBox(s, t, 1)
        If s = "" Then
            GoTo ErrEnd
        End If
        lgS = OH_CheckFromTo(Val(s), 1, 3)
        If lgS < 1 Then
            GoTo ErrEnd
        End If
        strSQL = strA & _
            ", @b = " & lgS
        OH_EX
        OH_RQ ctl
    Case 33
        s = strM & vbNewLine & _
                "Bitte Bemerkung eintragen"
        s = InputBox(s, t, Nz(ctl.column(6), "")) '140602 NZ ergänzt
        If s = "" Then
            GoTo ErrEnd
        End If
        strSQL = strA & _
            ", @d = '" & OH_RPL(left(s, 255)) & "'"
        OH_EX
        OH_RQ ctl
        ctl = lgid
    Case 40
        s = strM & vbNewLine & _
                "Bitte bestätigen Sie das Löschen mit einem JA"
        s = InputBox(s, t, "NEIN")
        If s = "JA" Then
            strSQL = strA
            OH_EX strSQL
            OH_DeleteAppointment CStr(lgid)
            f.regD_Change
        End If
    Case 41
        s = ""
        For Each x In ctl.ItemsSelected
            strA = Replace(ctl.column(4, x), "x", "")
            strM = ctl.column(6, x)
            lgid = ctl.column(1, x)
        Next x
        OH_OF "F_Adresse", lgid
        Set f = Forms!F_Adresse
        f!StandardText.SetFocus
        f!StandardText = "Wiedervorlage vom " & strA & " " & left(strM, 30) & "..."
        f!txtMemo = "Thema:<br>" & strM
        f.btnStartEmail_Click
    Case 43 '160707 Input Michael Misteli
        strSQL = strA & _
                 ", @f = '" & f.Tag & "'"
        OH_r r, strSQL
        i = r!markiert
        Select Case i
        Case 0
            s = "es ist keine Wiedervorlage markiert"
            GoTo ErrM
        Case 1
            s = "Die  aktuell markierte Wiedervorlage steht"
        Case Else
            s = "Die " & i & " markierten Wiedervorlagen stehen"
        End Select
        s = s & " Ihnen zur weiteren Bearbeitung unter den <Markierten Datensätzen> zur Verfügung. " & vbNewLine & _
            "Soll diese Liste angezeigt werden?"
        If MsgBox(s, vbYesNo, t) = vbYes Then
            f!lstM.SetFocus
        End If
    Case 44
        For Each x In ctl.ItemsSelected
            lgid = ctl.column(1, x)
        Next x
       OH_OF "F_Adresse", lgid
    Case 22, 50, 51, 52, 53, 54
        s = strUserKZ
        If lgA = 53 Then
            s = "Bitte das Kurzzeichen des Mitarbeiters eingeben"
            s = InputBox(s, t)
            If s = "" Then
                GoTo ErrEnd
            End If
        End If
        strSQL = strA & _
                 ", @f = '" & s & "'"
        If f.Name = "F_VG" Then '251212
            strSQL = strSQL & _
                     ", @z = " & f!NrVG
        End If
        OH_A ctl.Name, strSQL, f
        i = ctl.ListCount
        If i = 0 Then
            ctl.BackColor = c.BackColor
            t = t & " KEINE Daten vorhanden!"
        End If
        OH_lstWV_CLick f
    Case 60
        OH_InsertID_LST ctl
        OH_EXCEL strA, "Liste der Wiedervolagen"
    End Select
    SysCmd acSysCmdSetStatus, t
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_lstWvAct"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_lstWV_CLick(f As Form)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(f!lstWv.column(0), 0)
    If lgid = 0 Then
        lgid = Nz(f!lstWv.column(0, 1), 0)
        f!lstWv.Selected(1) = True
    End If
    strSQL = "Exec dbo.spa_Adresse" & _
            " @x = 'Wiedervorlage'" & _
            ", @n = " & lgid & _
            ", @f = '" & f.Name & _
            "', @i = " & f("Nr" & f.Tag) & _
            ", @a = 99"
    OH_r r
    f!txtWV = r!txtWV
    s = "Beschreibung der Wiedervorlage zum aktuell markierten Datensatz" & vbNewLine & _
        "Doppel-Klick, um diese Daten zu editieren!"
    f!txtWV.ControlTipText = s
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_lstWV_CLick"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_FormHeight(f As Form)
On Error GoTo ErrMsg
'121130 Einstellung der Formularhöhe gemäß Idee von GB
'Die Höhe ist pro User einstellbar unter Stichwort Formularhöhe in mm, Standardwert 190mm, gespeichert in glFormHeight
Dim lgT As Long 'Top des Steuerelementes
Dim lgH As Long 'Height des Steuerelementes
Dim h As Long
Dim z As Single
Dim strR As String 'ermitteln, ob ein Register betroffen ist; Annahme: MAX ein Register
    For Each ctl In f.Controls
        If left(ctl.Name, 3) = "lst" Then
            ctl.ShortcutMenuBar = "cbEmpty"
        End If
    Next ctl
    'controltypes:
    '123 = acTabCtl Registersteuerelement
    '124 = acPage   Page
    'z = 190 * 567 / 10 ergibt Überlauf???
    z = 190 'ist der Standardwert; die Formulare sind 190 mm hoch!!
    z = z * 567 / 10
    h = glFormHeight * 567 / 10
    t = "Einstellung der Formularhöhe"
    Select Case glFormHeight
    Case 0
        GoTo ErrEnd
    Case Is < 140
        s = "Das Formular " & f.Name & " kann nicht auf die Höhe " & glFormHeight & " eingestellt werden!"
        SysCmd acSysCmdSetStatus, s
        GoTo ErrEnd
    Case Is > 300
        s = "Das Formular " & f.Name & " kann nicht auf die Höhe " & glFormHeight & " eingestellt werden!"
        SysCmd acSysCmdSetStatus, s
        GoTo ErrEnd
    End Select
    'Erster Durchlauf: nur checken, ob Verkleinerung möglich und feststellen, ob ein Register betroffen ist
    For i = 1 To 2
        For Each ctl In f.Det.Controls
            Select Case ctl.ControlType
            Case 123, 124, acImage 'Register erst verkleinern, wenn beinhaltende Steuerlemente verkleinert sind
                If i = 1 Then
                    If lgT > h Then
                        s = "Das Formular " & f.Name & " kann nicht auf die Höhe " & glFormHeight & " eingestellt werden!"
                        SysCmd acSysCmdSetStatus, s
                        GoTo ErrEnd
                    Else
                        GoTo nextctl
                    End If
                End If
            Case Else
                If i = 2 Then
                    GoTo nextctl:
                End If
            End Select
            lgT = ctl.top
            lgH = ctl.Height
            Select Case lgT + lgH
            Case Is > z
                ctl.Height = h - lgT
            Case Is > z - (1 * 567) 'wenn das untere Ende innerhalb 1 cm vom unteren Ende liegt
                ctl.Height = lgH + h - z
            End Select
            SysCmd acSysCmdSetStatus, "Steuer-Element " & ctl.Name & " wurde in der Höhe eingestellt!"
nextctl:
        Next ctl
    Next i
    f.Det.Height = 0

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2100
        SysCmd acSysCmdSetStatus, "Formularhöhe PROBLEM!"
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_FormHeight"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_CheckRechnungsVersand(lgVG As Long) As Boolean
On Error GoTo ErrMsg
'gibt es eine besondere Versandanschrift?
'<R53>
'<R206>
    Dim strAb As String
    Dim strG As String
    Dim strQ As String
    t = "Rechnungsversand"
    Dim rV As ADODB.Recordset
    If lgVG = 0 Then
        GoTo ErrEnd
    End If
    strQ = "Exec dbo.spa_VG " & _
            "@x = 'Rechnungsversand'" & _
            ",@i = " & lgVG
    OH_r rV, strQ
    If rV!A = "" Then
        GoTo ErrEnd
    End If
    s = "ACHTUNG: Dieser Kunde hat eine spezielle Versandanschrift" & vbNewLine & _
        "Die entsprechende Adresse wird geöffnet und von dort aus eine separate Seite mit dieser Anschrift gedruckt:" & vbNewLine & _
        rV!A & vbNewLine & vbNewLine & _
        "JA" & vbTab & "gleich drucken (Seitenansicht)" & vbNewLine & _
        "Nein" & vbTab & "zuerst anschauen, ev. Text anpassen."
    i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
    If i = vbCancel Then
        GoTo ErrEnd
    End If
    If Not OH_isloaded("F_Adresse") Then
        DoCmd.openForm "F_Adresse"
    End If
    Set frm = Forms!F_Adresse
    If frm!IDAdresse <> rV!f Then
        OH_OF "F_Adresse", rV!f, 1
    End If
    frm.SetFocus
    frm!Anschrift.SetFocus
    SysCmd acSysCmdSetStatus, "Rechnungsversand"
    If frm!NrMitarbeiter <> lguser Then
        frm!NrMitarbeiter = lguser
    End If
    frm!Anschrift = rV!A
    frm!comAnrede = lg("Sehr geehrte Damen und Herren")
    frm!comEmail = Null
    frm!CC = Null
    frm!StandardText = rV!N
    frm!OutlookVorlage = Null
    frm!txtMemo = rV!t
    frm!lstTxtMemo = 801
    If i = vbYes Then
        frm.lstTxtMemo_AfterUpdate
    End If
    OH_CheckRechnungsVersand = True
ErrEnd:
    OH_ResetRS rV
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_CheckRechnungsVersand"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_CheckGelangensbestätigung(lgVG As Long, _
                                            Optional strSource As String, _
                                            Optional strOutlookFolder As String, _
                                            Optional lgSendMail As Long = 0) As Boolean
On Error GoTo ErrMsg
'<R206> Check if a EC (Entry certificte / Gelangensbestätigung) is necessary
'<R211>
    Dim lgid As Long
    Dim lgF As Long
    Dim strMailR As String
    Dim strMailK As String
    Dim strAb As String
    Dim strG As String
    Dim strQ As String
    Dim strECstatus As String
    Dim strECguid As String
    Dim strECurl As String
    Dim strECSyncClient As String
    Dim strECmail As String
    Dim strLanguage As String
    Dim varA As Variant
    Dim strA(1 To 10) As String
    Dim strhelp As String
    Dim rV As ADODB.Recordset
    t = "Gelangensbestätigung"
    If lgVG = 0 Then
        GoTo ErrEnd
    End If
    strG = "Gelangensbestätigung"
    strQ = "Exec dbo.spa_VG " & _
            "@x = 'check_Gelangensbestätigung'" & _
            ",@i = " & lgVG
    OH_r rV, strQ
    strECstatus = rV!entry_certificate_status
    strECguid = rV!entry_certificate_guid
    strECurl = rV!entry_certificate_url
    strECSyncClient = rV!sync_client
    strECmail = rV!entry_certificate_mail
    strLanguage = rV!Language
    strAb = rV!EmailAbsender

    lgid = rV!IDTxt
    If strECstatus = "Gelangensbestätigung nicht erforderlich" Then
        GoTo ErrEnd
    End If
    If strECstatus = "sent" And strSource = "print_ec" Then
        OH_Gelangensbestätigung strECmail, strAb, strECurl, strLanguage
    End If
    If strECstatus = "sent" And strSource <> "print_ec" Then
        GoTo ErrEnd
    End If
    i = 1
    If strECstatus = "E-Mail fehlt" Then
        t = "E-Mail-Eintrag " & strG & " fehlt"
        s = "Es wurde geprüft, ob bei der entsprechenden Firma das Stichwort <eMail-Adresse  " & strG & "> vorliegt." & vbNewLine & _
        "Bitte eine gültige E-Mailadresse eingeben."
        strA(1) = "Abbrechen"
        strA(2) = "E-Mail-Adresse eintragen"
        varA = Array(strA(1), strA(2))
Mailadresse:
    '===================
        OH_msgbox s, varA, vbQuestion, t, strhelp, "hier E-Mail-Adresse eintragen"
    '===================
        i = 0
        Select Case strMSG(2)
        Case "", "abbrechen"
            GoTo ErrEnd
        Case strA(1)
            MsgBox "test"
        Case strA(2)
            If InStr(strMSG(3), "@") = 0 Or InStr(strMSG(3), ".") = 0 Or InStr(strMSG(3), " ") > 0 Then
                s = s & vbNewLine & vbNewLine & "Bitte eine gültige Mail-Adresse eintragen!"
                GoTo Mailadresse
            End If
            strECmail = strMSG(3)
            i = 1
        End Select
        If i = 1 Then
            strSQL = strQ & _
                    ",@f = '" & strECmail & _
                    "', @m = " & lgid
            OH_EX
        End If
    End If
    OH_RQf Forms!F_VG!UF_txt.Form

    '<R220>
    If strSource <> "print_ec" Or (strSource = "print_ec" And strECstatus <> "sent") Then
        OH_Gelangensbestätigung strECmail, strAb, strECurl, strLanguage, strOutlookFolder, lgSendMail
        strSQL = "EXEC dbo.ISO" & _
                    " @x = 'GelangensbestätigungWorkFlow'" & _
                    ",@i = " & lgVG & _
                    ",@f = 'gesendet'"
        OH_EX
        OH_CheckGelangensbestätigung = True
    End If

ErrEnd:
    OH_ResetRS rV
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_CheckGelangensbestätigung"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_Audit(frm As Form)
On Error GoTo ErrMsg
    Dim strT As String
    Dim lgid As Long
    Dim lgact As Long
    lgact = Nz(frm!lstAuditAct, 10)
    strT = Replace(frm.Name, "F_", "T_")
    lgid = Nz(frm("Nr" & frm.Tag), 0)
    t = frm!lstAuditAct.column(1)
    Select Case lgact
    Case 10, 20, 30
        strSQL = "Exec dbo.spa_Audit " & _
                "@x = 'lstAudit' " & _
                ",@i = " & lgid & _
                ",@a = " & lgact & _
                ",@f = '" & strT & "'"
        OH_A "lstAudit", strSQL, frm
        frm!lstAudit.ColumnCount = 7
        frm!lstAudit.ColumnWidths = OH_ColumnWidthsMM("0;30;20;30;60;60")
        frm!lstAudit.BackColor = frm!lstDet.BackColor
        If lgact = 30 Then
            If frm!lstAudit.ListCount = 0 Then
                frm!lstAudit.BackColor = vbRed
                SysCmd acSysCmdSetStatus, "Daten sind NICHT freigegeben!"
            Else
                frm!lstAudit.BackColor = vbGreen
                SysCmd acSysCmdSetStatus, "Daten sind freigegeben!"
            End If
        End If
    Case 31
        If lgact <> 30 Then
            frm!lstAuditAct = 30
            OH_Audit frm
        End If
        'Darf der User Daten freigeben?
        strSQL = "Exec dbo.spa_Audit " & _
                "@x = 'Datenfreigabe' " & _
                ",@n = " & lguser
        OH_r r
        If r!Msg = "Nein" Then
            s = "Sie dürfen keine Daten freigeben!" & vbNewLine & _
                "(Ihnen fehlt das Stichwort = +Datenfreigabe JA)"
            GoTo ErrM
        End If
        s = "Daten des aktuellen Datensatzes in " & frm.Caption & " freigeben?"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strSQL & _
                ",@i = " & lgid & _
                ",@f = '" & strT & "'"
        OH_r r
        s = r!Msg
        MsgBox s, vbInformation, t
        frm!lstAuditAct = 30
        OH_Audit frm
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_Audit " & frm.Name
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_FileCopyMove(lgid As Long, _
                                strWie As String, _
                                Optional blDelete As Boolean = True, _
                                Optional strFolderBase As String _
                                ) As String
'170823 optional delete wegen Word outlook Gelangensbestätigung
On Error GoTo ErrMsg
'20160411
    Dim A As Outlook.Attachment
    Dim strSQ As String
    Dim strFO As String
    Dim strFN As String
    Dim strFNpart As String
    Dim strP As String
    Dim blRequery As Boolean
    Dim lgParentID As Long
    Dim lgFileLen As Long
    Dim rAr As ADODB.Recordset '171017
    Dim strKeywords As String
    Dim lgVG As Long
    If glDMS = "SQL" Or strWie = "Windows Explorer" Then
        strSQL = "EXEC dbo.DMS " & _
                "@x = 'SaveFiles'" & _
                ",@f = '" & glDMS & "'"
        OH_r rAr
        If rAr.BOF Then
            GoTo ErrEnd
        End If
        While Not rAr.EOF
            If rAr!idt7 = "KD" Then 'aus Adressen ==> NrVG = 0
                i = rAr!ID
                lgVG = 0
            Else
                lgVG = rAr!ID2 'Aus Vorgängen = NrVG
                i = rAr!ID 'Aus Vorgängen = NrFunktion
            End If
                            'wenn eMail
            strFN = rAr!IDT3
            Select Case rAr!Idt5
            Case "Mail"
                strFN = glstrTempPath & rAr!IDT2
                OH_KILL strFN
                selItemArray(rAr!id1).SaveAs strFN, olMSG
                strFO = strFN
            Case "MailAttachment"
                strFN = glstrTempPath & rAr!IDT2
                OH_KILL strFN
                For Each A In selItemArray(rAr!id1).Attachments
                    If A.Filename = rAr!idt6 Then
                        A.SaveAsFile strFN
                        Exit For
                    End If
                Next A
                strFO = strFN
            End Select
            lgFileLen = FileLen(strFN) / 1000000
            Select Case lgFileLen
            Case Is > 20
                s = strFN & vbNewLine & vbNewLine & _
                    "File-Grösse: " & Format(lgFileLen, "0,000") & " KB" & vbNewLine & vbNewLine & _
                    "Dieses grosse File wirklich zuordnen??"
                If MsgBox(s, vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End Select
            If strWie = "DMS" Then
                If Not OH_SaveFileToDB(strFN, rAr!idt1 & "; " & rAr!IDT4, i, lgVG) Then
                    GoTo ErrEnd
                End If
            Else
                strP = strFolderBase
                t = "File-Manipulation!"
                If strP = "" Then
                    GoTo ErrEnd
                End If
                If strFO = "" Then
                    strFO = rAr!IDT3
                End If
                strFN = strP & "\" & rAr!IDT4
                If Len(Dir(strFN)) > 0 Then
                    s = strFN & vbNewLine & _
                        "Das File befindet sich bereits am richtigen Platz!" & vbNewLine & _
                        "JA" & vbTab & "überschreiben" & vbNewLine & _
                        "Nein" & vbTab & "nicht ersetzen"
                    If MsgBox(s, vbYesNo + vbExclamation + vbDefaultButton2, t) = vbNo Then
                        GoTo ErrEnd
                    Else
                        OH_KILL strFN
                    End If
                Else
                    If Len(Dir(strP)) = 0 Then
                        s = strP & vbNewLine & _
                            "Soll der Ordner angelegt werden?"
                        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                            GoTo ErrEnd
                        End If
                        OH_CreateFolder strP
                    End If
                End If
                If blDelete Then
                    Name strFO As strFN
                Else
                    FileCopy strFO, strFN
                End If
            End If
            rAr.MoveNext
            strFN = "OK"
        Wend
        blRequery = True
    End If
    If glDMS = "DATEV DMS" And strWie = "DMS" Then
        strSQ = "EXEC dbo.DMS " & _
                "@x = 'Archive'"
        strSQL = strSQ
        OH_r rAr
        If rAr.BOF Then
            GoTo ErrEnd
        End If
        While Not rAr.EOF
            lgid = rAr!nrID
            strFO = rAr!IDT3
            If rAr!idt7 = "KD" Then 'aus Adressen ==> NrVG = 0
                lgVG = 0
            Else
                lgVG = rAr!ID2 'Aus Vorgängen = NrVG
            End If

            If OH_FindDMS(rAr!ID2, rAr!IDT4) = True Then
                s = rAr!IDT2 & vbNewLine & vbNewLine & _
                    "Möchten Sie dieses Dokument wirklich ein weiteres Mal in DMS ablegen?" & vbNewLine & vbNewLine & _
                    "Bitte mit einem <JA> bestätigen!"
                s = InputBox(s, "Ablage in DMS", "NEIN")
                Select Case s
                Case "JA", "<JA>"
                Case Else
                    GoTo ErrEnd
                End Select
            End If
            'wenn eMail
            strFN = glstrTempPath & rAr!IDT2
            Select Case rAr!Idt5
            Case "Mail"
                OH_KILL strFN
                selItem.SaveAs strFN, olMSG
                strFO = strFN
            Case "MailAttachment"
                OH_KILL strFN
                For Each A In selItem.Attachments
                    If A.Filename = rAr!idt6 Then
                        A.SaveAsFile strFN
                        Exit For
                    End If
                Next A
                strFO = strFN
            End Select
            If Len(Dir(strFO)) = 0 Then
                s = strFO & vbNewLine & _
                    "NICHT zu finden!"
                GoTo ErrM
            End If
            s = Format(Now, "HHMMSS")
            strSQL = strSQ & _
                    ",@i = " & lgid & _
                    ",@u = " & lguser
           If OH_ArchiveDocument(strFO, strSQL) = False Then
                GoTo ErrEnd
            Else
                If blDelete Then
                    OH_KILL strFO
                End If
                strFN = strFO
                blRequery = True
                SysCmd acSysCmdSetStatus, "File in DMS " & strFO
            End If
            s = ""
            Select Case rAr!idt1
            Case "Gelangensbestätigung"
                s = "erhalten"
            Case "Gelangensbestätigung an", "Gelangensbestät. an" '<Gelangensbestätigung an> geht NICHT wegen Beschränkung auf 20 Zeichen
                s = "gesendet"
            End Select
            If s <> "" Then
                strSQL = "EXEC dbo.ISO" & _
                    " @x = 'GelangensbestätigungWorkFlow'" & _
                    ",@i = " & rAr!ID2 & _
                    ",@f = '" & s & "'"
                OH_EX
            End If
        rAr.MoveNext
        Wend
    End If
    If glDMS = "ELO" Then
        strSQ = "EXEC dbo.DMS_ELO " & _
                "@x = 'ELO_Archive'"
        strSQL = strSQ
        OH_r rAr
        If rAr.BOF Then
            GoTo ErrEnd
        End If
        While Not rAr.EOF
            lgid = rAr!nrID
            strFO = rAr!FO
            If rAr!idt7 = "KD" Then 'aus Adressen ==> NrVG = 0
                lgVG = 0
            Else
                lgVG = rAr!ID2 'Aus Vorgängen = NrVG
            End If
            If rAr!Vorhanden = 1 And rAr!ID3 <> 99 Then 'Frage nicht stellen bei B2B-Automatismus
                s = rAr!IDT2 & vbNewLine & vbNewLine & _
                    "Möchten Sie dieses Dokument wirklich ein weiteres Mal in DMS-ELO ablegen?" & vbNewLine & vbNewLine & _
                    "Bitte mit einem <JA> bestätigen!"
                s = InputBox(s, "Ablage in DMS", "NEIN")
                Select Case s
                Case "JA", "<JA>"
                Case Else
                    GoTo ErrEnd
                End Select
            End If
            'wenn eMail
            strFN = glstrTempPath & rAr!IDT2
            Select Case rAr!Idt5
            Case "Mail"
                OH_KILL strFN
                selItem.SaveAs strFN, olMSG
                strFO = strFN
            Case "MailAttachment"
                OH_KILL strFN
                For Each A In selItem.Attachments
                    If A.Filename = rAr!idt6 Then
                        A.SaveAsFile strFN
                        Exit For
                    End If
                Next A
                strFO = strFN
            End Select
            If Len(Dir(strFO)) = 0 Then
                s = strFO & vbNewLine & _
                    "NICHT zu finden!"
                GoTo ErrM
            End If
            s = Format(Now, "HHMMSS")
            'Keywords auflisten
            strSQL = strSQ & _
                    ",@i = " & lgid & _
                    ",@u = " & lguser
            OH_r r
            strKeywords = r!Keywords
            If lgVG = 0 Then
                lgParentID = lgEloParentIDAdresse
            Else
                lgParentID = lgEloParentIDVorgang
            End If
            If lgParentID = 0 Then
                s = "SCHWERWIEGENDER FEHLER:" & vbNewLine & _
                    " in ELo ist die zugehörge PARENTID nicht zu finden." & vbNewLine & _
                    "Bitte wenden Sie sich an den Administrator"
                GoTo ErrEnd
            End If
            lgid = OH_ELO_CreateFile(strFO, lgParentID, strKeywords)
            If lgid = 0 Then
                GoTo ErrEnd
            Else
                If blDelete Then
                    OH_KILL strFO
                End If
                strFN = strFO
                blRequery = True
                SysCmd acSysCmdSetStatus, "File in DMS " & strFO
            End If
            s = ""
            Select Case rAr!idt1
            Case "Gelangensbestätigung"
                s = "erhalten"
            Case "Gelangensbestätigung an", "Gelangensbestät. an" '<Gelangensbestätigung an> geht NICHT wegen Beschränkung auf 20 Zeichen
                s = "gesendet"
            End Select
            If s <> "" Then
                strSQL = "EXEC dbo.ISO" & _
                    " @x = 'GelangensbestätigungWorkFlow'" & _
                    ",@i = " & rAr!ID2 & _
                    ",@f = '" & s & "'"
                OH_EX
            End If
        rAr.MoveNext
        Wend
    End If
    OH_FileCopyMove = strFN
    If blRequery Then
        If lgVG > 0 Then
            Set frm = Forms!F_VG
            If frm.regd = 12 Then
                OH_RQ frm!lstExplorer, lgid
            End If
        Else
            Set frm = Forms!F_Adresse
            If frm.regd = 8 Then
                OH_RQ frm!lstExplorer, lgid
            End If
        End If
    End If
ErrEnd:
    If left(strFO, 7) = left(glstrTempPath, 7) And blDelete Then
        OH_KILL strFO
    End If
    OH_ResetRS rAr
    Exit Function
ErrMsg:
    OH_FileCopyMove = ""
    Select Case Err.number
    Case 75, 70
        s = "Das bearbeitete File muss geschlosssen sein (kann nicht gelöscht werden)!"
    Case Else
        s = Err.number & " " & Err.Description
    End Select
    Resume ErrM
ErrM:
    If MsgBox(s, vbOKCancel + vbExclamation, t) = vbOK Then
        GoTo ErrEnd
    Else
        Exit Function
    End If
End Function
Public Function OH_Test()
s = "Phone:   +352 270776-1"
For i = 1 To Len(s)
    MsgBox Mid(s, i, 1) & vbNewLine & Asc(Mid(s, i, 1))
Next i
End Function
Public Function OH_ApplicationQuit()
On Error GoTo ErrMsg
    OH_closeObj "Menu"
ErrEnd:
    Application.Quit
    Exit Function
ErrMsg:
    Resume ErrEnd
End Function
Public Function OH_VersionPrint() As String
On Error GoTo ErrMsg
    OH_VersionPrint = strVersion & vbNewLine & _
              "Gedruckt am: " & Format(Date, "dd.mm.yy") & " von " & strUserKZ
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Errors during OH_VersionPrint"
    Resume ErrEnd
End Function
Public Function OH_RQ(ctl As control, _
                     Optional lgid As Long = 0, _
                     Optional lgX As Long = 0) As Boolean 'Requery (Abfrage) eines Steuerelementes
On Error GoTo ErrMsg
    Dim strQ As String
    Dim f As Form
    Dim rq As ADODB.Recordset
    If ctl.Name = "sfrm" Then
        Set f = ctl.Parent!sfrm.Form
        OH_SetRS f, 0, f.Recordset.Source
        If lgid > 0 Then
            ctl.Parent!sfrm.SetFocus
            f!f0.SetFocus
            DoEvents
            DoCmd.FindRecord lgid, acEntire
        End If
    Else
        'durch Recordset gebundene Listenfelder können offenbar nicht mit "REQUERY" aktualisiert werden
        strQ = Nz(ctl.Recordset.Source, "")
        If lgX = 1 Then 'wenn eine 1 übergeben wird, sollen KEINE Daten mehr gezeigt werden
            Set ctl.Recordset = Nothing
            ctl.Requery 'hier ist .requery ok.- OH
        Else
            OH_r rq, strQ, , , True
            Set ctl.Recordset = rq
            If lgid > 0 Then
                If ctl.ControlType = acListBox Then
                    Select Case ctl.MultiSelect
                    Case 0
                        ctl = lgid
                    Case 1, 2
                        For i = 0 To ctl.ListCount - 1  '191104
                            ctl.Selected(i) = False
                            If ctl.column(0, i) = lgid Then
                                ctl.Selected(i) = True
                                Exit For
                            End If
                        Next i
                    End Select
                Else
                    ctl = lgid
                End If
            End If
        End If
    End If
    OH_ResetRS rq
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2162, 91
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_RQ"
    End Select
    Resume ErrEnd
End Function
Public Function OH_RQf(ByRef f As Form, _
                      Optional lgFB As Long, _
                      Optional strFocus As String) As Boolean
On Error GoTo ErrMsg
    Dim strSQ As String
    Dim strFN As String
    '171102 Markus S.
    strFN = f.Name
    Select Case left(strFN, 3) '<R237>
    Case "UF_", "sfr"
        strFN = f.Parent.Name
    End Select
    If OH_isloaded(strFN) Then
        strSQ = f.Recordset.Source
        i = OH_SetRS(f, 0, strSQ, lgFB)
        OH_RQf = i > 0
    End If
    If strFocus <> "" Then
        f(strFocus).SetFocus
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2162, 3021, 2108 '2108 = zuerst speichern
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_RQf Requery auf Formular"
    End Select
    Resume ErrEnd
End Function
Public Function OH_B(rpt As Report, _
                Optional lgR As Long = 0, _
                Optional strT As String, _
                Optional ByVal strQ As String) As Boolean
On Error GoTo ErrMsg
'Datenherkunft für Reports!
    Dim qdf As QueryDef
    Dim blB As Boolean
    If left(rpt.Name, 4) = "B_VG" And right(strQ, 6) <> "Brief'" Then
        With Forms!F_VG
            If !NrQK = 30 Then
                strSQL = "EXECUTE spA_B_VG @x = 'checkKreditlimit',@i = " & !NrVG
                OH_r rx
                If Not rx.EOF Then
                    s = rx!KreditlimitInfo
                    If s <> "" Then
                        t = "ACHTUNG WICHTIGER HINWEIS zu ID = " & !NrVG
                        If MsgBox(s, vbYesNo + vbDefaultButton2 + vbExclamation, t) = vbNo Then
                            OH_B = True
                            GoTo ErrEnd
                        End If
                    End If
                End If
            End If
        End With
    End If
    If strQ = "" Then
        strQ = "exec spA_B " & _
                " @x = '" & rpt.Name & _
                "', @i= " & lgR & _
                ", @f= '" & strT & "'"
    End If
    blB = OH_setQdf("qdfrpt", strQ, False) = 0
    If blB = False Then
        rpt.RecordSource = "qdfRpt"
        OH_SetFont rpt, glstrFont
        rpt!DBVersion.Caption = OH_VersionPrint
       ' rpt!Logo.picture = glstrLogo
    End If
    OH_B = blB
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2465, 438 'Feld nicht vorhanden Version & Picture
        Resume Next
    Case Else
        OH_B = True
        MsgBox Err & " " & Err.Description, vbCritical, "Recordsource für " & rpt.Name
        Resume ErrEnd
    End Select
End Function
Public Function OH_setQdf(strO As String, _
                         strSQL As String, _
                         Optional blMldg As Boolean = True, _
                         Optional strAct As String) As Long
On Error GoTo ErrMsg
    Dim qdf As QueryDef
    Dim strT As String
    Dim blExist As Boolean
    DoCmd.Hourglass True
    strT = "erstelle Abfrage " & strO
    If strConnODBC = "" Then
        s = "Bitte Anwendung neu starten, Die Server-Connection ist nicht vorhanden!"
        GoTo ErrM
    End If
    blExist = False
    db.QueryDefs.Refresh
    For Each qdf In db.QueryDefs
        If qdf.Name = strO Then
            blExist = True
            Exit For
        End If
    Next qdf
    If blExist = False Then
        Set qdf = db.CreateQueryDef(strO)
        db.QueryDefs.Refresh
    Else
        Set qdf = db.QueryDefs(strO)
    End If
    qdf.ReturnsRecords = True
    qdf.connect = strConnODBC
    qdf.SQL = strSQL
    If qdf.OpenRecordset(dbOpenSnapshot).EOF Then
        OH_setQdf = 0
    Else
        OH_setQdf = 1
    End If
    If OH_setQdf = 0 And blMldg Then
        MsgBox "Keine Daten zu finden" & vbNewLine & strAct, vbInformation, t
    End If
    If Not qdf Is Nothing Then
        Set qdf = Nothing
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 3325 'Pass-Through-abfrage mit dem Wert TRUE für die ReturnsRecod-Eigenschaft hat keine Datensätze zurückgegeben.
        OH_setQdf = 0
        Resume Next
    Case Else
        s = Err & " " & Err.Description
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, strT
    GoTo ErrEnd
End Function
Public Function OH_Projektstopp(lgVGid As Long, lgVGidu As Long, Optional strP As String) As Boolean
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    t = "Checke Vorgang auf Projekt-Stopps"
    If strP <> "" Then
        i = InStr(strP, ".")
        lgVGid = Val(left(strP, i - 1))
        lgVGidu = Val(Mid(strP, i + 1))
    End If
    strSQL = "EXECUTE dbo.spa_VG @x = '+ProjektStopp'" & _
                    ",@i = " & lgVGid & _
                    ",@u = " & lgVGidu
    OH_r r
    s = Nz(r!Msg, "")
    If left(s, 7) = "Achtung" Then
        OH_Projektstopp = True
        MsgBox s, vbExclamation, t
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_Projektstopp"
    Resume ErrEnd
End Function
Public Function OH_CBx(strNr As String) As Boolean
    'Fax-Nummer replacen (PG 161223)
    strNr = Replace(strNr, "+", "00")
    strNr = Replace(strNr, " ", "")
    If glFaxFührende0 Then
        strNr = "0" & strNr
    End If
    OH_CB strNr
End Function
Public Sub OH_Wait(ByVal MilliSec As Long)
    'Quelle: www.dbwiki.net oder www.dbwiki.de
    DoCmd.Hourglass True
    Dim lgI As Long
    Dim lgE As Long
    lgE = Timer + (MilliSec / 1000)
    Do While lgI < lgE
        DoEvents
        lgI = Timer
    Loop
    DoCmd.Hourglass False
End Sub
Function ListOldToolbars()
     Dim objCommandBar As Object
     For Each objCommandBar In Application.CommandBars
          Debug.Print objCommandBar.Name
     Next
End Function
Function DeleteOldToolbars()
     Dim objCommandBar As Object
     For Each objCommandBar In Application.CommandBars
          If objCommandBar.Name = "addins" Then
               objCommandBar.Delete
          End If
     Next
End Function
Function OH_SetKreditlimit(lgVG As Long) As Boolean
On Error GoTo ErrMsg
    'OPOS-Liste HVL EXCEL-Daten Import OHNE EXCEL zu öffnen
    Dim strT As String
    Dim strQ As String
    Dim strf As String
    Dim strDN As String
    Dim strDNFind As String
    Dim strHS As String
    Dim lgSaldo As Long
    Dim cnnOPOS As New ADODB.Connection
    Dim rsOPOS As New ADODB.Recordset
    DoCmd.Hourglass True
    strT = "Berechnung des Kreditlimits"
    strSQL = "exec spI_VGDiv " & _
            " @x = 'Kreditlimit'" & _
            ", @i= " & lgVG
    OH_r r
    s = r!Msg
    If s > "OK" Then
        GoTo ErrM
    End If
    strf = Nz(r!Filename)
    If Len(Dir(strf)) = 0 Then
        s = strf & vbNewLine & _
            "Das File ist NICHT zu finden"
        GoTo ErrM
    End If
    strDN = r!Debitor
    If strDN = "" Then
        s = "Debitor-Nr. ist nicht zu finden!"
        GoTo ErrM
    End If
    cnnOPOS.Open "Provider=Microsoft.ACE.OLEDB.12.0;" & _
        "Data Source=" & CStr(strf) & ";" & _
        "Extended Properties=""Excel 12.0;HDR=Yes;IMEX=1"";"
        'Imports from sheet named xDatabase and range A:EF
    rsOPOS.Open "SELECT * FROM [Sheet Caption$A:H];", cnnOPOS, adOpenStatic, adLockReadOnly
    Do Until rsOPOS.EOF
        If rsOPOS.Fields(0).Value = strDN Then
            lgSaldo = Nz(rsOPOS.Fields(5).Value, 0)
            strHS = Nz(rsOPOS.Fields(6).Value, "H")
            Exit Do
        End If
        rsOPOS.MoveNext
    Loop
    DoCmd.Hourglass True
    strSQL = strSQL & _
            ",@a =1" & _
            ",@ID2 =" & lgSaldo & _
            ",@c1 = '" & strHS & "'"
    OH_EX
    OH_SetKreditlimit = True
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        strT = "OH_SetKreditlimit"
        s = Err & " " & Err.Description
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, strT
    GoTo ErrEnd
End Function
Public Function OH_LoescheMSysFirma()
    Dim strKundenVariable As String
    strKundenVariable = "OHNEMUSx"
    strKundenVariable = InputBox("Lösche Einträge in MSysFirma  A U S S E R   Kunde " & strKundenVariable, _
                                "OH_LoescheMSysFirma", _
                                strKundenVariable)
    i = Nz(DCount("KD", "MSysFirma", "KD = '" & strKundenVariable & "'"), 0) 'gibt's den Kunden überhaupt?
    If i > 0 Then
        strSQL = "Delete * FROM MSysFirma WHERE KD <> '" & strKundenVariable & "'" 'lösche alle Einträge ausser dem gewählten Kunden
        CurrentDb.Execute strSQL
    Else
        MsgBox strKundenVariable & " NICHT zu finden", vbInformation, "MSysFirma"
    End If
End Function
