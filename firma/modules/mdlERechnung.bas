Attribute VB_Name = "mdlERechnung"

'******* eRechnung mit amvZugferd *******
Option Compare Database
Option Explicit
Public lngRememberPDFA3 As Long
'=================================================================
' REGISTRIERUNG (Lizenzschlüssel setzen)
'=================================================================
Private Function RegisterAmvZugferd(objEmbedAndExtract As Object) As Boolean
    On Error GoTo EH

    Debug.Print "ZUGFeRD EMail: " & glStrEMailZugferd
    Debug.Print "ZUGFeRD Key: " & glStrRegistryKeyZugferd

    If Nz(glStrEMailZugferd, "") = "" Or Nz(glStrRegistryKeyZugferd, "") = "" Then
        MsgBox "ZUGFeRD-Lizenzdaten sind nicht geladen. Bitte IT kontaktieren.", vbCritical, "ZUGFeRD Registrierung"
        RegisterAmvZugferd = False
    Exit Function
    End If

    With objEmbedAndExtract
        .EMail = glStrEMailZugferd
        ' je nach Version heißt die Eigenschaft RegistryKey oder LicenseKey
        .RegistryKey = glStrRegistryKeyZugferd
        ' .LicenseKey = gStrRegistryKeyZugferd   ' falls deine Version das so erwartet
    End With

    RegisterAmvZugferd = True
    Exit Function

EH:
    Debug.Print "RegisterAmvZugferd Fehler " & Err.number & ": " & Err.Description
    RegisterAmvZugferd = False
End Function
'=================================================================
' HAUPTFUNKTION
'=================================================================
Public Function OH_ProcessXMLandZUGFeRDExport(NrVG As Long, ByRef strAttach As String) As String
On Error GoTo ErrMsg

    Dim strXML As String
    Dim Result As String

    strSQL = "EXEC spa_eRechnung_ExportToXML @NrVG = " & NrVG
    OH_r r

    If r.BOF = True Then
        s = "Fehler bei der Erstellung des XML-Files." & vbNewLine & _
            "Bitte nochmal probieren."
        OH_ResetRS r
        OH_KILL strAttach
        GoTo ErrMsg
    End If

    strXML = glstrTempPath & "factur-x.xml"

    If Not OH_CreateXMLFile(r!XmlOutput, strXML) Then
        s = "Fehler beim Speichern der XML-Datei."
        OH_ResetRS r
        OH_KILL strAttach
        GoTo ErrMsg
    End If

    OH_ResetRS r

    ' *** XML-Validierung ***
    If Not ValidateXMLWellFormed(strXML) Then
        s = "VALIDIERUNGSFEHLER: Das erstellte XML ist nicht wohlgeformt!" & vbNewLine & vbNewLine & _
            "Mögliche Ursachen:" & vbNewLine & _
            "- Sonderzeichen in Kundendaten (& < > " & Chr(34) & ")" & vbNewLine & _
            "- Fehlende Pflichtfelder" & vbNewLine & vbNewLine & _
            "Bitte IT-Support kontaktieren." & vbNewLine & _
            "Rechnung wurde NICHT erstellt."
        OH_KILL strXML
        OH_KILL strAttach
        'Call LogError("XML-Validierung", NrVG, "Well-Formedness Check fehlgeschlagen")
        GoTo ErrMsg
    End If

'    ' Optional: XSD-Schema-Validierung (wenn aktiviert)
'    If GetLexikonSetting("eRechnung Validierung aktiviert") = "True" Then
'        If Not ValidateXMLSchema(strXML) Then
'            s = "VALIDIERUNGSFEHLER: XML entspricht nicht dem EN 16931 Standard!" & vbNewLine & vbNewLine & _
'                "Details siehe Debug-Log." & vbNewLine & _
'                "Rechnung wurde NICHT erstellt."
'            OH_KILL strXML
'            OH_KILL strAttach
'            'Call LogError("XML-Schema-Validierung", NrVG, "EN 16931 Konformität verletzt")
'            GoTo errMSG
'        End If
'    End If

    ' ZUGFeRD-Konvertierung
    Result = OH_ConvertToZUGFeRD(strAttach, strXML)

    If Result = "SUCCESS" Then
        OH_KILL strXML
        OH_ProcessXMLandZUGFeRDExport = "SUCCESS"
    Else
        s = "Fehler aufgetreten: " & Result
        OH_KILL strAttach
        OH_KILL strXML
        GoTo ErrMsg
    End If

ErrEnd:
    Exit Function

ErrMsg:
    t = "OH_ProcessXMLandZUGFeRDExport"
    If s = "" Then s = "Unbekannter Fehler: " & Err.number & " " & Err.Description
    OH_ProcessXMLandZUGFeRDExport = s
    GoTo ErrM

ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

'=================================================================
' XML-DATEI ERSTELLEN - SPEZIAL F˜R AMVZUGFERD
'=================================================================
Public Function OH_CreateXMLFile(xmlData As String, strXML As String) As Boolean
On Error GoTo ErrMsg

    Dim stream As Object
    Dim binaryStream As Object

    ' Schritt 1: Als UTF-8 ohne BOM in Memory schreiben
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 2 ' adTypeText
    stream.Charset = "UTF-8"
    stream.Open
    stream.WriteText xmlData, 0

    ' Schritt 2: BOM entfernen (erste 3 Bytes)
    stream.Position = 3

    Set binaryStream = CreateObject("ADODB.Stream")
    binaryStream.Type = 1 ' adTypeBinary
    binaryStream.Open
    stream.CopyTo binaryStream

    ' Schritt 3: Binary speichern
    binaryStream.SaveToFile strXML, 2 ' adSaveCreateOverWrite

    binaryStream.Close
    stream.Close

    ' Prüfen
    Dim fso As Object
    Set fso = CreateObject("Scripting.FileSystemObject")
    OH_CreateXMLFile = fso.FileExists(strXML)

    ' Debug: Erste Bytes ausgeben
    Debug.Print "XML gespeichert: " & strXML
    Call DebugFirstBytes(strXML)

CleanUp:
    Set stream = Nothing
    Set binaryStream = Nothing
    Set fso = Nothing
    Exit Function

ErrMsg:
    OH_CreateXMLFile = False
    Dim t As String, s As String
    t = "OH_CreateXMLFile"
    s = "Fehler in OH_CreateXMLFile: " & Err.Description
    MsgBox s, vbCritical, t
    Resume CleanUp
End Function

' Debug-Funktion
Private Sub DebugFirstBytes(strPath As String)
On Error Resume Next
    Dim stream As Object
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1 ' Binary
    stream.Open
    stream.LoadFromFile strPath

    Dim bytes() As Byte
    stream.Position = 0
    bytes = stream.Read(20)
    stream.Close

    Dim i As Integer
    Dim Result As String
    For i = 0 To UBound(bytes)
        Result = Result & bytes(i) & " "
    Next i

    Debug.Print "Erste 20 Bytes: " & Result
    ' Sollte mit "60 63 63 63" (<?xml) beginnen, NICHT mit "239 187 191" (BOM)
End Sub
''=================================================================
'' XML-DATEI ERSTELLEN MIT UTF-8 OHNE BOM
''=================================================================
'Public Function OH_CreateXMLFile(xmlData As String, strXML As String) As Boolean
'On Error GoTo errMSG
'
'    Dim stream As Object
'    Dim binaryStream As Object
'
'    ' Text-Stream für UTF-8
'    Set stream = CreateObject("ADODB.Stream")
'    stream.Type = 2 ' adTypeText
'    stream.Charset = "UTF-8"
'    stream.Open
'    stream.WriteText xmlData, 0
'    stream.Position = 0
'
'    ' Binary-Stream um BOM zu entfernen
'    Set binaryStream = CreateObject("ADODB.Stream")
'    binaryStream.Type = 1 ' adTypeBinary
'    binaryStream.Open
'
'    ' UTF-8 BOM überspringen (erste 3 Bytes: EF BB BF)
'    stream.Position = 3
'    stream.CopyTo binaryStream
'
'    ' Als Datei ohne BOM speichern
'    binaryStream.SaveToFile strXML, 2 ' adSaveCreateOverWrite
'
'    binaryStream.Close
'    stream.Close
'
'    ' Prüfen ob Datei existiert
'    Dim fso As Object
'    Set fso = CreateObject("Scripting.FileSystemObject")
'    OH_CreateXMLFile = fso.FileExists(strXML)
'
'CleanUp:
'    Set stream = Nothing
'    Set binaryStream = Nothing
'    Set fso = Nothing
'    Exit Function
'
'errMSG:
'    OH_CreateXMLFile = False
'    Dim t As String, s As String
'    t = "OH_CreateXMLFile"
'    s = "Fehler in OH_CreateXMLFile: " & Err.Description
'    MsgBox s, vbCritical, t
'    Resume CleanUp
'End Function
'=================================================================
' ZUGFERD ERSTELLEN
'=================================================================
Private Function OH_ConvertToZUGFeRD(strPDF As String, strXML As String) As String
On Error GoTo ErrMsg

    Dim objEmbedAndExtract As Object
    Dim fso As Object
    Dim strZugferdOutput As String
    Dim strResponse As String
    Dim blnSuccess As Boolean

    Set fso = CreateObject("Scripting.FileSystemObject")

    If Not fso.FileExists(strPDF) Then
        OH_ConvertToZUGFeRD = "Fehler: PDF nicht gefunden: " & strPDF
        Exit Function
    End If

    If Not fso.FileExists(strXML) Then
        OH_ConvertToZUGFeRD = "Fehler: XML nicht gefunden: " & strXML
        Exit Function
    End If

    On Error Resume Next
    Set objEmbedAndExtract = CreateObject("amvZugferd.EmbedAndExtract")
    On Error GoTo ErrMsg

    If objEmbedAndExtract Is Nothing Then
        OH_ConvertToZUGFeRD = OH_HandleMissingAmvZugferd(strPDF)
        Exit Function
    End If

    ' *** HIER Registrierung aufrufen ***
    If Not RegisterAmvZugferd(objEmbedAndExtract) Then
        OH_ConvertToZUGFeRD = "Fehler: ZUGFeRD-Lizenz konnte nicht gesetzt werden."
        Exit Function
    End If

    ' Ausgabepfad
    strZugferdOutput = fso.GetParentFolderName(strPDF) & "\" & _
                       Replace(fso.GetFileName(strPDF), ".pdf", "_ZUGFeRD.pdf")

    ' ZUGFeRD erstellen
    With objEmbedAndExtract
        blnSuccess = .EmbedXMLInPDF(strPDF, strXML, strZugferdOutput, "factur-x.xml", strResponse)
    End With

    Debug.Print "EmbedXMLInPDF Fehler: " & Err.number
    Debug.Print "blnSuccess: " & blnSuccess
    Debug.Print "strResponse: " & strResponse

    If blnSuccess Then
        If fso.FileExists(strZugferdOutput) Then
            fso.DeleteFile strPDF
            fso.MoveFile strZugferdOutput, strPDF
            OH_ConvertToZUGFeRD = "SUCCESS"
        Else
            OH_ConvertToZUGFeRD = "Fehler: ZUGFeRD-Datei wurde nicht erstellt."
        End If
    Else
        OH_ConvertToZUGFeRD = "Fehler bei ZUGFeRD-Erstellung:g " & strResponse
    End If

CleanUp:
    Set objEmbedAndExtract = Nothing
    Set fso = Nothing
    Exit Function

ErrMsg:
    OH_ConvertToZUGFeRD = "Fehler: " & Err.Description
    Resume CleanUp
End Function
'=================================================================
' FALLBACK
'=================================================================
Private Function OH_HandleMissingAmvZugferd(strPDF As String) As String
    Dim intResponse As VbMsgBoxResult

    intResponse = MsgBox( _
        "amvZugferd ist nicht installiert." & vbCrLf & vbCrLf & _
        "Die Rechnung wird als PDF/A-3 (ohne eingebettete XML) erstellt." & vbCrLf & vbCrLf & _
        "Möchten Sie fortfahren?", _
        vbQuestion + vbYesNo, _
        "ZUGFeRD nicht verfügbar" _
    )

    If intResponse = vbYes Then
        OH_HandleMissingAmvZugferd = "SUCCESS"
    Else
        OH_HandleMissingAmvZugferd = "Abbruch durch Benutzer"
    End If
End Function
'=================================================================
' REGISTRY-FUNKTIONEN F˜R PDF/A-3
'=================================================================
Public Function SetPDFA3() As Boolean
On Error Resume Next
    Dim wshShell As Object
    Dim strRegistryPath As String

    lngRememberPDFA3 = GetPDFA3()
    Set wshShell = CreateObject("WScript.Shell")
    strRegistryPath = "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\FixedFormat\LastISO19005-1"

    wshShell.RegWrite strRegistryPath, 1, "REG_DWORD"
    SetPDFA3 = (wshShell.RegRead(strRegistryPath) = 1)

    Set wshShell = Nothing
    On Error GoTo 0
End Function
'Stellt den Wert von LastISO19005-1 auf den Wert aus lngRememberPDFA3 zurück.
Public Function ResetPDFA3() As Boolean
    Dim wshShell As Object
    Dim strRegistrypfad As String
    Set wshShell = CreateObject("WScript.Shell")
    strRegistrypfad = "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\FixedFormat\LastISO19005-1"
    On Error Resume Next
    wshShell.RegWrite strRegistrypfad, lngRememberPDFA3, "REG_DWORD"
    On Error GoTo 0
    If wshShell.RegRead(strRegistrypfad) = lngRememberPDFA3 Then
        ResetPDFA3 = True
    End If
End Function
'Liest den Wert aus LastISO19005-1 aus.
Public Function GetPDFA3() As Long
    Dim wshShell As Object
    Dim strRegistrypfad As String
    Dim lngRegistrywert As Long
    Set wshShell = CreateObject("WScript.Shell")
    strRegistrypfad = "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\FixedFormat\LastISO19005-1"
    On Error Resume Next
    GetPDFA3 = wshShell.RegRead(strRegistrypfad)
End Function
' In VBA nach XML-Erstellung:
Private Function ValidateXMLWellFormed(xmlPath As String) As Boolean
    On Error GoTo errHandler
    Dim xmlDoc As Object
    Set xmlDoc = CreateObject("MSXML2.DOMDocument.6.0")
    xmlDoc.async = False
    xmlDoc.validateOnParse = False

    If Not xmlDoc.Load(xmlPath) Then
        Debug.Print "XML Parsing Error: " & xmlDoc.parseError.reason
        ValidateXMLWellFormed = False
    Else
        ValidateXMLWellFormed = True
    End If
    Exit Function
errHandler:
    ValidateXMLWellFormed = False
End Function
'Private Function ValidateXMLSchema(xmlPath As String) As Boolean
'    Dim xmlDoc As Object
'    Dim schemas As Object
'
'    Set xmlDoc = CreateObject("MSXML2.DOMDocument.6.0")
'    Set schemas = CreateObject("MSXML2.XMLSchemaCache.6.0")
'
'    ' XSD laden (einmalig herunterladen von www.ferd-net.de)
'    schemas.Add "urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100", _
'                App.Path & "\schemas\CrossIndustryInvoice_100pD16B.xsd"
'
'    xmlDoc.schemas = schemas
'    xmlDoc.async = False
'    xmlDoc.validateOnParse = True
'
'    If Not xmlDoc.Load(xmlPath) Then
'        MsgBox "Schema-Fehler: " & xmlDoc.parseError.reason, vbCritical
'        ValidateXMLSchema = False
'    Else
'        ValidateXMLSchema = True
'    End If
'End Function
'=================================================================
' XML-ONLY EXPORT (ohne PDF)  erzeugt & validiert nur die XML
'=================================================================
Public Function OH_ExportXMLOnly(NrVG As Long, ByRef strXmlOut As String) As String
On Error GoTo ErrMsg

    Dim strSQL As String

    ' XML aus DB ziehen
    strSQL = "EXEC spa_eRechnung_ExportToXML @NrVG = " & NrVG
    OH_r r

    If r.BOF Then
        s = "Fehler bei der Erstellung des XML-Files (keine Daten)."
        OH_ResetRS r
        OH_ExportXMLOnly = s
        Exit Function
    End If

    ' Fallback-Pfad, falls leer
    If Len(Trim$(strXmlOut)) = 0 Then
        strXmlOut = glstrTempPath & "factur-x.xml"
    End If

    ' Speichern (UTF-8 ohne BOM)
    If Not OH_CreateXMLFile(r!XmlOutput, strXmlOut) Then
        s = "Fehler beim Speichern der XML-Datei."
        OH_ResetRS r
        OH_ExportXMLOnly = s
        Exit Function
    End If

    OH_ResetRS r

    ' Wohlgeformtheit prüfen
    If Not ValidateXMLWellFormed(strXmlOut) Then
        s = "VALIDIERUNGSFEHLER: Das erstellte XML ist nicht wohlgeformt!" & vbCrLf & vbCrLf & _
            "Mögliche Ursachen:" & vbCrLf & _
            "- Sonderzeichen in Stammdaten (& < > " & Chr(34) & ")" & vbCrLf & _
            "- Fehlende Pflichtfelder"
        OH_KILL strXmlOut
        OH_ExportXMLOnly = s
        Exit Function
    End If

    ' Optional: Schema-Validierung später zuschaltbar (dein auskommentierter Codepfad)

    OH_ExportXMLOnly = "SUCCESS"
    Exit Function

ErrMsg:
    OH_ExportXMLOnly = "Fehler (XML-only): " & Err.number & " " & Err.Description
End Function
'=================================================================
' DEBUGGING SECTION
'=================================================================
Public Sub TestAmvZugferdRegistration()
    Dim obj As Object
    Dim strResult As String

    On Error Resume Next
    Set obj = CreateObject("amvZugferd.EmbedAndExtract")

    If Err.number <> 0 Then
        strResult = "L FEHLER - DLL nicht registriert" & vbCrLf & vbCrLf & _
                    "Fehler: " & Err.number & vbCrLf & _
                    "Beschreibung: " & Err.Description & vbCrLf & vbCrLf & _
                    "Lösung: RegAsm ausführen (siehe Anleitung)"
    Else
        If obj Is Nothing Then
            strResult = "L FEHLER - CreateObject gibt Nothing zurück"
        Else
            strResult = " SUCCESS - amvZugferd ist korrekt registriert!" & vbCrLf & vbCrLf & _
                       "Late Binding funktioniert."
        End If
    End If

    MsgBox strResult, vbInformation, "amvZugferd Registrierungs-Test"

    Set obj = Nothing
    On Error GoTo 0
End Sub
Public Sub FindAmvZugferdDLL()
    Dim ref As Object
    Dim strResult As String

    On Error Resume Next

    ' ˜ber References suchen
    For Each ref In Access.References
        If InStr(LCase(ref.Name), "amv") > 0 Or InStr(LCase(ref.Name), "zugferd") > 0 Then
            strResult = strResult & "Name: " & ref.Name & vbCrLf
            strResult = strResult & "Pfad: " & ref.FullPath & vbCrLf & vbCrLf
        End If
    Next

    If strResult = "" Then
        strResult = "Keine amvZugferd-Referenz gefunden." & vbCrLf & vbCrLf & _
                   "Entweder:" & vbCrLf & _
                   "1. DLL ist nicht als Verweis eingebunden (OK für Late Binding)" & vbCrLf & _
                   "2. Oder die DLL-Datei manuell suchen"
    End If

    MsgBox strResult, vbInformation, "amvZugferd DLL-Pfad"

    On Error GoTo 0
End Sub
Public Sub QuickTest()
    On Error Resume Next
    Dim obj As Object
    Set obj = CreateObject("amvZugferd.EmbedAndExtract")

    If Err.number = 0 And Not obj Is Nothing Then
        MsgBox "SUCCESS! DLL ist registriert und funktioniert!", vbInformation
    Else
        MsgBox "Fehler " & Err.number & ": " & Err.Description, vbCritical
    End If
End Sub
Public Function OH_Create_PDF(lgNrVG As Long, ByRef strFilename As String, ByRef strRechnungsformat As String)
On Error GoTo ErrMsg
    'strRechnungsformat wird im Bericht B_VG (spa_B_VG) ermittelt
    Dim blnZugferd As Boolean
    Dim blnXmlOnly As Boolean
    Dim strXmlOnly As String
    Dim strResult As String
    Dim Rz As ADODB.Recordset
    DoCmd.Hourglass True
    blnZugferd = False
    blnXmlOnly = False
    strResult = "SUCCESS PDF erstellt"
    Select Case UCase$(Trim$(strRechnungsformat))
        Case "ZUGFERD"
            blnZugferd = True
        Case "XML"
            blnXmlOnly = True
    End Select
    If blnZugferd Then
        ' Für ZUGFeRD: PDF/A-3 aktivieren
        Call SetPDFA3
    End If
    DoCmd.OutputTo acOutputReport, glstrB_VG, acFormatPDF, strFilename

    ' ---------- XML-only: kein PDF erzeugen ----------
    If blnXmlOnly Then
        ' Zielpfad für XML ableiten: nimm den PDF-Pfad und ersetze .pdf -> .xml
        ' (strFilename ist dein geplanter PDF-Pfad; bleibt hier nur als Namensbasis)
        strXmlOnly = Replace(strFilename, ".pdf", ".xml")
        If LCase$(right$(strXmlOnly, 4)) <> ".xml" Then strXmlOnly = strFilename & ".xml"

        strResult = OH_ExportXMLOnly(lgNrVG, strXmlOnly)
        If strResult <> "SUCCESS" Then
            s = strResult
            t = "XML-Export"
            GoTo ErrM
        End If
       strResult = "SUCCESS XML-Datei wurde erzeugt: " & strXmlOnly
    End If

    ' PDF erzeugen (Standard-PDF oder PDF/A-3, je nach oben)
    If blnZugferd Then
        Call ResetPDFA3
        ' Sofort XML erzeugen & in PDF einbetten
        strResult = OH_ProcessXMLandZUGFeRDExport(lgNrVG, strFilename)
        If strResult <> "SUCCESS" Then
            s = strResult
            t = "ProcessXMLandZUGFeRDExport"
            GoTo ErrM
        End If
        strResult = "SUCCESS PDF wurde erstellt" & IIf(blnZugferd, " (ZUGFeRD).", ".")
    End If
ErrEnd:
    OH_Create_PDF = strResult
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "OH_Create_PDF"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
 End Function
