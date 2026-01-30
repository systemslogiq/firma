Attribute VB_Name = "mdlDMS"
Option Compare Database
Option Explicit
Global glDMS As String '160603
Global oDMSth As Object
Global strEloRESTAPI As String
Global strEloUser As String
Global strEloPWD As String
Global strEloDMS As String
Global Const strEloBoundary As String = "ELOOhnemus"
Global lgEloParentIDVorgang As Long
Global lgEloMaskID As Long
Global lgEloParentIDAdresse As Long

'161210 Anpassungen, da Programm ab und zu abstürzte
Public Function OH_OpenDmsTC() As Boolean
On Error GoTo ErrMsg
    t = "Öffne DMS CUSTOM ThinClient"
    SysCmd acSysCmdSetStatus, t
    DoEvents
    If oDMSth Is Nothing Then '161210 CreateObject nur wenn nicht schon erstellt
        Set oDMSth = CreateObject("DATEV.DMS.CUSTOM.ThinClient.Client")
        If Not oDMSth.Connected Then
            s = "Es konnte keine Verbindung zu DMS hergestellt werden."
            GoTo ErrM
        End If
    End If
    OH_OpenDmsTC = True
ErrEnd:
    s = ""
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    strSQL = "EXEC spa_Audit " & _
            " @x = 'InsertAudit'" & _
            ",@t ='DMS-Error'" & _
            ",@i = 0" & _
            ",@f = '" & s & _
            "',@d ='Public Function OH_OpenDmsTC'"
    OH_EX
    GoTo ErrEnd
End Function
Public Function OH_ShowDMSDocument(strDoc As String, Optional strX As String) As String
On Error GoTo ErrMsg
'20160602
'Die Methode GetFiles überträgt die angeforderte(n) Datei(en) auf den Client. Der
'Rückgabewert ist eine Auflistung von Wertepaaren (Dictionary):
'Schlüssel: Dateiname (String)
'Wert: Dateiinhalt (Byte-Array)
'Hinweis:
'Das Dokument muss zuvor mit der Methode LoadDocument erfolgreich geladen sein.
    Dim blnSuccessIndex As Boolean
    Dim blnLoadDoc As Boolean
    Dim strCondition As String
    Dim oArrayList As Object
    Dim oDictionary As Object
    Dim Item As Variant
    Dim strFilename As String
    Dim arrDocument() As Byte
    DoCmd.Hourglass True
    t = "Zeige Dokument aus DMS"
    If strDoc = "" Then
        s = "keine Dokumenten-ID ausgewählt"
        GoTo ErrM
    End If
    If OH_OpenDmsTC Then
        SysCmd acSysCmdSetStatus, t & " " & strDoc
        strCondition = "UNIQUE_DOK_ID = '" & strDoc & "'"
        If strX = "SaveDoc" Then
            blnSuccessIndex = oDMSth.LoadIndexData(strCondition, "I_ARCHIV")
            If blnSuccessIndex Then
                blnLoadDoc = oDMSth.LoadDocument(strCondition, "I_ARCHIV")
                DoEvents
                If blnLoadDoc Then
                    oDMSth.ShowDocument
                    OH_ShowDMSDocument = True
                    Set oDictionary = oDMSth.GetFiles()
                    If oDictionary.count > 0 Then
                        For Each Item In oDictionary
                            strFilename = glstrTempPath & Item
                            OH_KILL strFilename
                            arrDocument = oDictionary(Item)
                            OH_WriteByteArray strFilename, arrDocument
                            If Len(Dir(strFilename)) > 0 Then
                                OH_ShowDMSDocument = strFilename
                            End If
                        Next
                    Else
                        s = "Das Dokument ist leer"
                        GoTo ErrM
                    End If
                Else
                    s = "Das Dokument ist zwar vorhanden, wird aber nicht geladen..."
                    t = t & "   Philipp arbeitet dran!"
                    GoTo ErrM
                End If
            End If
        Else
            oDMSth.ShowDocumentInDMS "I_ARCHIV", strCondition    'EMRE FUNKTIONIERT NICHT
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_ListDMS(strID As String, _
                           Optional strW As String, _
                           Optional strT As String = "VG", _
                           Optional strFilter As String) As String
On Error GoTo ErrMsg
    '***Instanz erzeugen***
    Dim strFi(1 To 5)  As String
    Dim objArrayList As Object
    Dim objDS As Object
    Dim blnSuccessIndex As Boolean
    Dim strCondition As String
    Dim strC As String
    Dim strCondition1 As String
    Dim strField As String
    Dim strAttributeName As String
    Dim Y As Long
    DoCmd.Hourglass True
'20160602
    t = "Liste Dokumente aus DMS"
    If strID = "" Then
        s = "keinen Vorgang ausgewählt"
        GoTo ErrM
    End If
    If OH_OpenDmsTC = False Then
        GoTo ErrEnd
    End If
    Y = 1
    strField = "CUST_ID"
    strCondition = strField & " = '" & strID & "'"
    Select Case strT
    Case "VG"
        'Am 170123 wurde die Projekt-Nummer umgestellt auf 0000.000
        If InStr(strID, ".") > 0 Then
            strField = "CUST_VGID"
            strCondition = strField & " = '" & strID & "'"
            '170219 wir erfassen bekanntlich Kreditor-Rechnungen, welche mehreren Vorgängen zugeordnet werden, weil darauf mehrere Positionen / Aufträge fakturiert werden.
            strSQL = "EXEC dbo.Dms " & _
                    " @x =  'listDMSDokuKreditor'" & _
                    ",@f = '" & strID & "'"
            OH_r rx
            i = 0
            While Not rx.EOF
                i = i + 1
                strC = "(RE_Nr = '" & rx!rNr & "' and RE_DATUM = '" & Format(rx!RDatum, "dd.mm.yyyy") & "')"
                If i = 1 Then
                    strCondition1 = strC
                Else
                    strCondition1 = strCondition1 & " or " & strC
                End If
            rx.MoveNext
            Wend
            If i > 0 Then
                strCondition = "(" & strCondition & " or (" & strCondition1 & "))"
            End If
        End If
        If strW = "ID" Then
            '160922 Rechnungskorrektur auch...
            strCondition = strCondition & _
                    " and left(CUST_Art, 8)  IN ('Kreditor','Rechnung','Lagerent','Gutschri') "
        End If
        strCondition = "(" & strCondition & ") and ARP_BEREICH_BEZ = 'Rechnungswesen'"
    Case "Funktion"
        strCondition = "(" & strCondition & ") and ARP_BEREICH_BEZ = 'KD'"
    End Select
    If strFilter <> "" Then
        strFilter = Trim(Replace(strFilter, "*", ""))
       ' strCondition = "(" & strCondition & ") and right(DATEINAME," & Len(strFilter) & ") = '" & strFilter & "'"
       ' strCondition = "(" & strCondition & ") and charindex('" & strFilter & "',DATEINAME)>0"
       s = "Filter funktioniert für DATEV DMS (noch) Nicht"
       GoTo ErrM

    End If
   ' strCondition = strCondition & " and BETREFF = 'Angebot - 282 - SLN - Schmierstoff Logistik No Haltermann Kontraktpreise 29858-000.pdf'"
nextStrCondition:
    blnSuccessIndex = oDMSth.LoadIndexData(strCondition, "I_ARCHIV")
    i = 0
    OH_ListDMS = ""
    strSQL = ""
    If blnSuccessIndex Then
        Set objArrayList = oDMSth.GetIndexItems() 'Ein Arraylist-Item ist ein Dictionary mit Attribute und Wertpaaren / Datensätze
        For Each objDS In objArrayList 'objDS ist ein Dictionary
            i = i + 1
            If strW = "ID" Then
                OH_ListDMS = objDS("UNIQUE_DOK_ID")
                Exit For
            Else
            'Übergabe ergänzt am 160726 17071 Input Marme: bei vielen Records wird die Zeichenkette zu lang
                strFi(1) = objDS("UNIQUE_DOK_ID")
                strFi(2) = objDS("CUST_ART")
                strFi(3) = left(objDS("ERSTELL_DATUM"), 10)
                strFi(4) = OH_RPL(objDS("BETREFF"))
                strFi(5) = Format(objDS("ERSTELL_DATUM"), "yyyymmdd")
                If i = 1 Then
                    strSQL = "SELECT '" & strFi(1) & "' as ID ,'" & _
                                            strFi(2) & "' as [Doku-Art],'" & _
                                            strFi(3) & "' as [Übergabe],'" & _
                                            strFi(4) & "' as [Betreff des zugeordneten Dokumentes],'" & _
                                            strFi(5) & "' as orderBy"
                Else
                    strSQL = strSQL & " UNION Select '" & _
                                strFi(1) & "','" & _
                                strFi(2) & "','" & _
                                strFi(3) & "','" & _
                                strFi(4) & "','" & _
                                strFi(5) & "'"
                End If
            End If
        Next
        If strW = "" And strSQL <> "" Then
            OH_ListDMS = strSQL & " ORDER BY orderBy desc,[Doku-Art]"
        End If
    End If
    'wurde die ID nicht gefunden, wird die Suche erweitert (Kreditoren):
    If OH_ListDMS = "" And strField = "CUST_ID" And Y <> 2 Then
        strSQL = "EXEC dbo.Dms " & _
                " @x =  'listDMSDokuKreditor'" & _
                ",@i = " & Val(strID)
        OH_r rx
        If Not rx.BOF Then
            If rx!ID > 0 Then
                strCondition = "RE_Nr = '" & rx!rNr & "' and RE_DATUM = '" & Format(rx!RDatum, "dd.mm.yyyy") & "'"
                Y = 2
                GoTo nextStrCondition
            End If
        End If
    End If
    If OH_ListDMS = "" And strW <> "ID" Then
        OH_ListDMS = "Select " & _
                        "'' as ID , " & _
                        "'----' as [Doku-Art]," & _
                        "'----' as [Übergabe]," & _
                        "'Diesem Projekt sind noch keine Dokumente zugeordnet' as [Betreff des zugeordneten Dokumentes]"
    End If

ErrEnd:
    Set objArrayList = Nothing
    Set objDS = Nothing
    DoCmd.Hourglass False
    OH_ResetRS rx
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_FindDMS(strID As String, strBetreff As String) As Boolean
On Error GoTo ErrMsg
'20160625
'Suche im I_ARCHIV von DMS nach CUST_ID = strid und BETREFF = strBetreff,
'um mehrfache Ablagen verhindern zu können!
    Dim objArrayList As Object
    Dim objDatensatz As Object
    Dim blnSuccessIndex As Boolean
    Dim strCondition As String
    DoCmd.Hourglass True
    Y = 0
    t = "Gibt es das Dokument mit der CUST_ID und Betreff"
    If Not OH_OpenDmsTC Then
        GoTo ErrEnd
    End If
    'WARUM muss Betreff auf 50 gekürzt werden???
    strBetreff = OH_RPL(left(strBetreff, 50)) '<R33>
    strCondition = "CUST_ID = '" & strID & _
                   "' and (left(BETREFF,50) = '" & strBetreff & _
                   "' or CUST_Art = '" & strBetreff & "')"
    blnSuccessIndex = oDMSth.LoadIndexData(strCondition, "I_ARCHIV")
    If blnSuccessIndex Then
        Set objArrayList = oDMSth.GetIndexItems()
        For Each objDatensatz In objArrayList
            OH_FindDMS = True
        Next
    End If
ErrEnd:
    Set objArrayList = Nothing
    Set objDatensatz = Nothing
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Public Function OH_UpdateDMS(ByVal lgid As Long, lgVG As Long) As Boolean
On Error GoTo ErrMsg
   '***Indexdaten eines Dokumentes aktualisieren***
    ' Index Schlüssel/Wert Paare in einer Dictionary speichern
    '170109 DATEV Emre Önal
    DoCmd.Hourglass True
    Dim objDic As Object
    If glDMS = "ELO" Then
        strSQL = "Execute Dms_ELO @x = 'AddKeyword'" & _
                    ",@i = " & lgid & _
                    ",@a = " & lgVG & _
                    ",@f = 'CUST_ID'"
        OH_r r
        OH_UpdateDMS = r!Msg
    Else
        s = ""
        If OH_OpenDmsTC Then
            strSQL = "EXEC dbo.Dms " & _
                        "@x = 'UpdateDMS'" & _
                       ",@i = " & lgVG
            OH_r r
            Set objDic = CreateObject("Scripting.Dictionary")
            For i = 0 To r.Fields.count - 1
                objDic.Add r.Fields(i).Name, r.Fields(i).Value
            Next i
            OH_UpdateDMS = oDMSth.UpdateDocument("I_ARCHIV", "DOKU_NR = " & lgid, objDic) 'I_ARCHIV ist konstant in der Form zu verwenden
        End If
    End If
ErrEnd:
    Set objDic = Nothing
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    t = "Update des bestehenden DMS-Dokumentes = " & lgid
    s = Err.number & " " & Err.Description & vbNewLine & vbNewLine & _
       "Aktion war NICHT erfolgreich!" & vbNewLine & vbNewLine & _
       "Prüfen Sie bitte die eingegebene Dok-Id " & lgid
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Public Function OH_WriteByteArray(ByVal strPath As String, ByRef arrData() As Byte)
On Error GoTo ErrMsg
    Dim lngFile As Long
    ' open the file
    lngFile = FreeFile()
    Open strPath For Binary Access Write As lngFile
    ' write blob
    Put lngFile, , arrData
    ' close file
    Close lngFile
ErrEnd:
    Exit Function
ErrMsg:
    t = "Erstellen eines Files aus DMS (OH_WriteByteArray)"
    s = Err.number & " " & Err.Description
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ArchiveDocument(strFile As String, strSQLDMS As String) As Boolean
On Error GoTo ErrMsg
    Dim objDic As Object
    Dim arrlist As Object
    Dim strL As String
    Dim lgid As Long
    Dim lgVersuch As Long
    lgVersuch = 1
    Dim strSQLAudit As String
    t = "DMS-Archivieren mit DATEV THINCLINET (OH_ArchiveDocument)  " & left(strFile, 10) & "..."
    If strFile = "" Then
        s = "Keine Datei übergeben"
        GoTo ErrM
    End If
VERSUCH2:
    OH_r rx, strSQLDMS
    If rx.BOF Then
        s = strFile & vbNewLine & _
            "Datei NICHT gefunden, KEINE Schlagworte übergeben"
        GoTo ErrM
    End If
    SysCmd acSysCmdSetStatus, t
    If OH_OpenDmsTC Then
        Set objDic = CreateObject("Scripting.Dictionary")
        Set arrlist = CreateObject("System.Collections.Arraylist")
        arrlist.Add strFile
        's = ""
        For i = 0 To rx.Fields.count - 1
            strL = Nz(rx.Fields(i).Value, "null")
            If i = 0 Then
                s = strL
            Else
                s = s & "; " & strL
            End If
            If rx.Fields(i).Name = "CUST_ID" Then
                lgid = rx.Fields(i).Value
            End If
            objDic.Add rx.Fields(i).Name, rx.Fields(i).Value
        Next i
        If lgVersuch = 2 Then
            s = "Versuch 2 " & s
        End If
        strSQLAudit = "exec dms " & _
                "@x = 'AuditTrail'" & _
                ",@f = '" & s & _
                "',@i = " & lgid
        OH_EX strSQLAudit
        DoEvents
        OH_ArchiveDocument = oDMSth.ArchiveDocument("I_ARCHIV", arrlist, objDic)
        DoEvents
        If OH_ArchiveDocument = False Then
            SysCmd acSysCmdSetStatus, "Misserfolg!! " & t
            s = "Das File wurde NICHT an DMS übergeben, bitte Info an Admin!"
            If lgVersuch = 1 Then
                lgVersuch = 2
                SysCmd acSysCmdSetStatus, "2ter Versuch " & t
                GoTo VERSUCH2
            Else
                GoTo ErrM
            End If
        End If
        strSQLAudit = strSQLAudit & _
                ",@a = 1"
        OH_EX strSQLAudit
    End If
ErrEnd:
    Set objDic = Nothing
    Set arrlist = Nothing
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    strSQL = "EXEC spa_Audit " & _
        " @x = 'InsertAudit'" & _
        ",@t ='DMS-Error'" & _
        ",@i = " & lgid & _
        ",@f = '" & s & _
        "',@d ='Public Function OH_ArchiveDocument " & t & "'"
    OH_EX
    GoTo ErrEnd
End Function

Public Function OH_SaveFileToDB( _
    strFilename As String _
    , strBem As String _
    , ByVal lgFunktion As Long _
    , ByVal lgVG As Long _
) As Boolean
'**************************************************************
'PURPOSE: SAVES DATA FROM BINARY FILE (e.g., .EXE, WORD DOCUMENT
'CONTROL TO RECORDSET RS IN FIELD NAME FIELDNAME
On Error GoTo ErrMsg
    Dim lgFileNum As Long
    Dim lgFileLength As Long
    Dim abBytes() As Byte
    Dim lgCtr As Long
    Dim strf As String
    Dim strP As String
    Dim rDB As ADODB.Recordset
    t = "Speichere File im SQL-Server"
    SysCmd acSysCmdSetStatus, t & " " & strFilename
    If Dir(strFilename) = "" Then
        s = strFilename & vbNewLine & _
            "ist nicht zu finden"
        GoTo ErrM
    End If
    If InStr(strBem, ";") = 0 Or left(strBem, 1) = ";" Or right(strBem, 1) = ";" Then
        s = "bitte Schlagworte / Bemerkungen ausfüllen"
        GoTo ErrM
    End If
    If lgVG + lgFunktion = 0 Then
        s = "Zuordnung zu Adresse / Vorgang fehlt"
        GoTo ErrM
    End If
    strf = OH_RPL(OH_GetNamePart(strFilename)) '250702 Input Gerd HOCHKOMMA in Filenmae
    strP = OH_RPL(OH_GetPathPart(strFilename))
    strSQL = "Exec dbo.DMS " & _
            " @x = 'FillDoc'" & _
            ",@f = '" & strf & _
            "',@d = '" & strP & _
            "',@s1 = '" & OH_RPL(strBem) & _
            "',@i = " & lgFunktion & _
            ",@a = " & lgVG
    OH_r rDB
    If rDB!Vorhanden > 0 Then
        s = strFilename & vbNewLine & _
            "ist bereits so erfasst"
        GoTo ErrM
    End If

    'read file contents to byte array
    lgFileNum = FreeFile
    Open strFilename For Binary Access Read As #lgFileNum
    lgFileLength = LOF(lgFileNum)
    ReDim abBytes(lgFileLength)
    Get #lgFileNum, , abBytes()
    strSQL = strSQL & _
            ",@n = " & rDB!neu
    OH_r rDB, , rrOpenDynamic, rrLockOptimistic, True
    'put byte array contents into db field
    rDB.Fields("docdata").AppendChunk abBytes()
    rDB.Update
    Close #lgFileNum
    OH_SaveFileToDB = True
ErrEnd:
    OH_ResetRS rDB
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_LoadFileFromDB(strDoc As String, Optional strPath As String) As String
On Error GoTo ErrMsg
    '************************************************
    'PURPOSE: LOADS BINARY DATA IN RECORDSET RS,
    '************************************************
    Dim lgFileNum As Long
    Dim lgFileLength As Long
    Dim abBytes() As Byte
    Dim lgCtr As Long
    Dim strFilename As String
    If strDoc = "" Then
        s = "Bitte File auswählen!"
        GoTo ErrM
    End If
    If strPath = "" Then
        strPath = Environ("Temp") 'https://www.codevba.com/office/environ.htm#.YYOSO2DMLcs
                                'The default temporary folder that is used by the operating system and applications available to the currently logged on user
    End If
    If Len(Dir(strPath, vbDirectory)) = 0 Then
        s = "Bitte den Ordner < " & strPath & " > erstellen!"
        GoTo ErrM
    End If
    '220307 strdoc ="123E56788" führt zu einem Datenüberlauf, da E als Hochzeichen aufgefasst wird
    strSQL = "Execute dbo.DMS " & _
            "@x = 'getDoc'" & _
            ",@i = " & Val(Replace(strDoc, "E", "")) & _
            ",@d = '" & strDoc & _
            "',@f = '" & strPath & "'"
    OH_r rx
    If rx.BOF Then
        s = "File wurde NICHT gefunden( Nr: " & strDoc & ")"
        GoTo ErrM
    End If
    strFilename = rx!Filename
    OH_KILL strFilename
    lgFileNum = FreeFile
    Open strFilename For Binary As #lgFileNum
    lgFileLength = LenB(rx!Docdata)

    abBytes = rx("Docdata").GetChunk(lgFileLength)
    Put #lgFileNum, , abBytes()
    Close #lgFileNum
    OH_LoadFileFromDB = strFilename
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ELO_GetInfos() As Boolean
On Error GoTo ErrMsg
    t = "OH_ELO_GetInfos"
    strSQL = "EXEC dbo.Dms_ELO " & _
                "@x = 'ELO_GetInfos'" & _
               ",@u = " & lguser
    OH_r r
    strEloRESTAPI = r!EloRESTAPI
    If strEloRESTAPI = "" Then
        GoTo ErrEnd
    End If
    lgEloMaskID = r!EloMaskID
    lgEloParentIDVorgang = r!EloParentIDVorgang
    lgEloParentIDAdresse = r!EloParentIDAdresse
    strEloUser = r!eloUser
    strEloPWD = r!eloPwd
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ELO_CreateFile(strFilename As String, _
                                  lgParentID As Long, _
                                  strKeywords As String) As Long
    On Error GoTo ErrMsg
    Dim strBody As String
    Dim strResponse As String
    Dim lgid As Long
    Dim arrJsonSplit() As String
    Dim strFileNameWithoutPath As String
    t = "OH_ELO_CreateFile"
    'strFilename = "C:\Temp\Test_ELO.txt"
    strFileNameWithoutPath = OH_GetNamePart(strFilename)

    strBody = "{" & _
                """info"":{" & _
                        """name"":""" & strFileNameWithoutPath & """" & _
                        ",""parentId"": " & lgParentID & _
                        "}" & _
              "}"
    'strBody ={"info":{"name":"TEST_ELO.txt","parentId": 502554}}
    'strEloRESTAPI = http://192.168.10.35:9090/rest-Archiv/api/files
    'strUser = 'WaWi
    'strEloPWD = 'Y9keOHA$QZ!
    With CreateObject("Microsoft.XMLHTTP")
        .Open "POST", strEloRESTAPI, False, strEloUser, strEloPWD
        .setRequestHeader "Content-Type", "application/json"
        .send strBody
        strResponse = .responseText
    End With
    ' strResponse example = {"guid":"(391DCC61-F19B-582C-692A-37701D7309D5)","id":2699695,"name":"TEST_ELO.txt"}
    'ermittle aus der strResponse die neue ID
    arrJsonSplit = Split(strResponse, ",")
    lgid = Val(Mid(arrJsonSplit(1), 6))
    'lgID = 2699695
    If lgid = 0 Then
        s = strFileNameWithoutPath & vbNewLine & _
            "wurde NICHT in ELO angelegt!"
        GoTo ErrM
    End If
    strResponse = OH_ELO_UploadFile(lgid, strFilename)
    strResponse = OH_ELO_AddKeywords(lgid, strKeywords)
    OH_ELO_CreateFile = lgid
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "OH_ELO_CreateFile"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ELO_UploadFile(lgid As Long, strFilename As String) As String
    On Error GoTo ErrMsg
    Dim strContent As String
    Dim strURL As String
    strURL = strEloRESTAPI & "/" & lgid & "/content"
    'strUrl ="http://192.168.10.35:9090/rest-Archiv/api/files/2699695/content"
    strContent = OH_ELO_GetMultiPartFormDataBodyContent(strFilename)
    'strcontent = "--ELOOhnemus
'            Content-Disposition: form-data; name="file"; filename="TEST_ELO.txt"
'            Content-Type: application/octet-stream
'
'            Test ELO
'            --ELOOhnemus--
    With CreateObject("Microsoft.XMLHTTP")
        .Open "POST", strURL, False, strEloUser, strEloPWD
        .setRequestHeader "Content-Type", "multipart/form-data; boundary=" & strEloBoundary
        .send OH_GetByteArrayFromString(strContent)
        OH_ELO_UploadFile = .responseText  'Standard = 'Version 1 uploaded
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Function OH_ELO_GetMultiPartFormDataBodyContent(strFilename As String) As String
    On Error GoTo ErrMsg
    Dim lgFile As Long
    Dim btBuffer() As Byte
    Dim strContent As String
    Dim strFileNameWithoutPath As String

    ' https://wqweto.wordpress.com/2011/07/12/vb6-using-wininet-to-post-binary-file/

    DoCmd.Hourglass True
    ' read file
    lgFile = FreeFile
    Open strFilename For Binary Access Read As lgFile
    If LOF(lgFile) > 0 Then
        ReDim btBuffer(0 To LOF(lgFile) - 1) As Byte
        Get lgFile, , btBuffer
        strContent = StrConv(btBuffer, vbUnicode)
    End If
    Close lgFile
    '--- prepare body
    strFileNameWithoutPath = OH_GetNamePart(strFilename)
    strContent = "--" & strEloBoundary & vbCrLf & _
        "Content-Disposition: form-data; name=""file""; filename=""" & strFileNameWithoutPath & """" & vbCrLf & _
        "Content-Type: application/octet-stream" & vbCrLf & vbCrLf & _
        strContent & vbCrLf & _
        "--" & strEloBoundary & "--"
    OH_ELO_GetMultiPartFormDataBodyContent = strContent
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Function OH_GetByteArrayFromString(strText As String) As Byte()
    OH_GetByteArrayFromString = StrConv(strText, vbFromUnicode)
End Function
Public Function OH_ELO_AddKeywords(lgid As Long, strKeywords As String) As String
    On Error GoTo ErrMsg
    Dim strURL As String
    Dim strBody As String

    strURL = strEloRESTAPI & "/" & lgid & "/keywording"
    'siehe stored Procedure dbo.DMS_ELO if @x = 'ELO_Archive'
    strBody = "{" & _
        """maskId"": """ & lgEloMaskID & """" & _
        ",""fields"":{" & _
                strKeywords & _
                "}" & _
        "}"
'    MsgBox strBody & vbNewLine & lgId
    With CreateObject("Microsoft.XMLHTTP")
        .Open "PATCH", strURL, False, strEloUser, strEloPWD
        .setRequestHeader "Content-Type", "application/json"
        .send strBody
        OH_ELO_AddKeywords = .responseText 'Standard = "" (leer)
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 0
    Case Else
        s = Err.number & " " & Err.Description
        t = "OH_ELO_AddKeywords"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ELO_ShowFile(lgid As Long) As Boolean
    On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Dim strURL As String
    strURL = "elodms://" & lgid
    OH_LaunchURL 1, strURL
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 0
    Case Else
        s = Err.number & " " & Err.Description
        t = "OH_ELO_ShowFile"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_ELO_getFile(lgELO_ObjektID As Long, ByVal strType As String) As String
    On Error GoTo ErrMsg
    Dim http As Object
    Dim strURL As String
    Dim strTempFile As String
    t = "erstelle temp. File " & strType & " mit Daten aus ELO-ID=" & lgELO_ObjektID
    'DownloadEloObject 2766240
    If lgELO_ObjektID = 0 Then
        GoTo ErrEnd
    End If
    DoCmd.Hourglass True
    If strEloRESTAPI = "" Or strEloUser = "" Then
        s = "ELO Rest_API nicht definiert!" & vbNewLine & _
            "==>MENU NEU STARTEN"
        GoTo ErrM
    End If
    ' API endpoint and authentication
    strURL = strEloRESTAPI & "/" & lgELO_ObjektID & "/download"
    Set http = CreateObject("MSXML2.XMLHTTP.6.0")
    http.Open "GET", strURL, False, strEloUser, strEloPWD
    http.send

    ' Save the file if the request is successful
    If http.status = 200 Then
        Dim stream As Object
        strTempFile = glstrTempPath & strType & "_" & lgELO_ObjektID & ".pdf" 'temp. Filename
        OH_KILL strTempFile
        Set stream = CreateObject("ADODB.Stream")
        stream.Type = 1 ' Binary
        stream.Open
        stream.Write http.responseBody
        stream.SaveToFile strTempFile, 2 ' adSaveCreateOverWrite
        stream.Close
        OH_ELO_getFile = strTempFile
    Else
        OH_ELO_getFile = "Failed to download file. HTTP Status: " & http.status
    End If
ErrEnd:
    Set http = Nothing
    Set stream = Nothing
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 0
    Case Else
        s = Err.number & " " & Err.Description
        t = "OH_ELO_getFile"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
