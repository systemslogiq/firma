Attribute VB_Name = "mdlOffice"
Option Compare Database
Option Explicit
Global appWd    As Word.Application
Dim objWDDoc    As Word.Document
Global appEXCEL As Excel.Application
Global wb As Excel.Workbook
Global ws As Excel.Worksheet
Public Function OH_CloseExcel()
On Error GoTo ErrMsg
    Set appEXCEL = GetObject(, "Excel.Application")
    appEXCEL.Quit
    Set appEXCEL = Nothing
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CloseExcel"
        Resume ErrEnd
End Function
Function OH_InitializeEXCEL() As Boolean
    ' Diese Funktion wird verwendet, um EXCEL zu initialisieren.
On Error GoTo ErrMsg
    t = "Check EXCEL: OH_InitializeEXCEL"
    SysCmd acSysCmdSetStatus, "EXCEL wird gestartet..."
    DoCmd.Hourglass True
    Const ERR_APP_NOTRUNNING As Long = 429
    On Error Resume Next
    DoEvents
    Set appEXCEL = GetObject("", "EXCEL.Application")
    If Err = ERR_APP_NOTRUNNING Then
        DoEvents
        Set appEXCEL = CreateObject("EXCEL.Application")
    End If
    OH_InitializeEXCEL = Not appEXCEL Is Nothing
    If OH_InitializeEXCEL = False Then
        s = "EXCEL ist NICHT per VBA verfügbar!" & vbNewLine & _
            "Starten Sie bitte EXCEL zuerst und wiederholen Sie die Aktion"
        GoTo ErrM
    End If

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    OH_InitializeEXCEL = False
    Select Case Err
    Case 462
    Case Else
        s = Err & " " & Err.Description
    End Select
    Resume ErrM
ErrM:
    OH_InitializeEXCEL = False
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function


Function OH_InitializeWord() As Boolean
    ' Diese Funktion wird verwendet, um Word zu initialisieren.
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    SysCmd acSysCmdSetStatus, "Word wird gestartet..."
    Const ERR_APP_NOTRUNNING As Long = 429
    On Error Resume Next
' Handle Microsoft WORD
    DoEvents
    Set appWd = GetObject("", "Word.Application")
    If Err = ERR_APP_NOTRUNNING Then
        DoEvents
        Set appWd = CreateObject("Word.Application")
    End If
    OH_InitializeWord = Not appWd Is Nothing
    If OH_InitializeWord = False Then
        MsgBox "Word ist NICHT per VBA verfügbar!" & vbNewLine & _
            "Starten Sie bitte WORD zuerst und wiederholen Sie die Aktion", vbCritical, "Starte WORD-Application"
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    OH_InitializeWord = False
    Select Case Err
    Case 462
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_Initialize  Word"
    End Select
        Resume ErrEnd
End Function

Public Function OH_startWord(Optional strVorlageFile As String, _
                         Optional lgMitarbeiter As Long, _
                         Optional varAnschrift As Variant, _
                         Optional varBetreff As Variant, _
                         Optional varBody As Variant, _
                         Optional varAnrede As Variant, _
                         Optional varDate As Variant, _
                         Optional varBeilage As Variant)
On Error GoTo ErrMsg
    Dim strPath As String
    Dim strB As String
    Dim strBT As String
    Dim strVorlage As String
    Dim strUnterschrift As String
    Dim strFile As String
    Dim strClassType As String
    strPath = OH_StichwortExplorer("explorer")
    strPath = glstrTempPath
    If strVorlageFile = "" Then
        strVorlageFile = "+Word-Brief"
    End If
    strSQL = "Exec dbo.spa_Adresse" & _
                    " @x = 'WordBrief'," & _
                    " @i = " & lgMitarbeiter & "," & _
                    " @f = '" & strVorlageFile & "' "
    OH_r r
    t = "Word starten"
    strUnterschrift = r!Unterschrift
    strVorlage = Nz(r!Vorlage)
    If Len(Dir(strVorlage)) = 0 Then
        s = strVorlage & vbNewLine & vbNewLine & _
            "das Vorlage-File existiert nicht (mehr)"
        GoTo ErrM
    End If
    strClassType = Nz(r!BemStichwort, "")
    If Len(strPath) > 0 Then
        Set fd = Application.FileDialog(msoFileDialogFolderPicker)
        With fd
          .Title = "Ablage des Wordfiles in " & strPath
          .InitialFileName = strPath
        .filters.Clear
        .filters.Add "Excel-Dateien", "*.docx"
          .Show
        End With
 '       SendKeys "^(V)"    ' FileName vorschlagen
         If fd.SelectedItems.count > 0 Then
            strFile = fd.SelectedItems(1)
        End If
        If Len(strFile) > 0 Then
            If strVorlage = "" Then
                x = OH_msgbox(vbNewLine & vbNewLine & "Vorlage nicht definiert", _
                         Array("Ohne Vorlage erstellen", "Abbrechen"), vbCritical, strVorlageFile & " fehlt", _
                         "Unter den Stichworten <" & strVorlageFile & "> muss beim Mandanten ein " & vbNewLine & _
                         "entsprechendes Wordfile als Hyperlink abgelegt sein!")
                strVorlageFile = ""
            Else
                x = 1
            End If
            If x <> 1 Then
                GoTo ErrEnd
            End If
            If OH_InitializeWord = False Then
                GoTo ErrEnd
            End If
            With appWd
                .Application.Visible = True
                If strVorlage <> "" Then
                    .Application.Documents.Add Template:=strVorlage
                End If
                ' Maximieren
                .WindowState = wdWindowStateMaximize
                If strVorlageFile Like "+Word-Brief" Then
                    For i = 1 To 6
                        Select Case i
                        Case 1
                            strB = "Anschrift"
                            strBT = Nz(varAnschrift, "Anschrift hier eintragen")
                        Case 2
                            strB = "Anrede"
                            strBT = Nz(varAnrede, "Anrede")
                        Case 3
                            strB = "Unterschrift"
                            strBT = Nz(strUnterschrift, "Unterschrift")
                        Case 4
                            strB = "Datum"
                            strBT = Nz(varDate, "Datum")
                        Case 5
                            strB = "Body"
                            strBT = Nz(varBody, "")
                        Case 6
                            strB = "Beilage"
                            strBT = Nz(varBeilage, "")
                        End Select
                        If .ActiveDocument.Bookmarks.Exists(strB) = True Then
                            .ActiveDocument.Bookmarks(strB).Range.Text = strBT
                        End If
                    Next i
                End If
                .Visible = True
                If Len(strFile) > 0 Then
                 .ActiveDocument.SaveAs strFile
                End If
                .ActiveWindow.View.Type = wdPrintView
                If strVorlageFile Like "+Scan-Vorlage" Then
                    If Len(strClassType) = 0 Then
                        MsgBox "classtype des Scanners fehlt bei Vorlage in Stichworten"
                    Else
                        .Selection.TypeParagraph
                        .Selection.TypeParagraph
                        .Selection.InlineShapes.AddOLEObject ClassType:=strClassType, _
                            Filename:="", LinkToFile:=False, DisplayAsIcon:=False
                    End If
                End If
            End With
            appWd.Visible = True
            appWd.Activate
            Set appWd = Nothing
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2475, 2046, 4248
        Resume ErrEnd
    Case Else
        s = Err.number & " " & Err.Description
    End Select
    Resume ErrM
' Ende des Fehlerhandlerblocks.
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_startMerge(strf As String)
On Error GoTo ErrMsg
    If OH_InitializeWord = False Then
        GoTo ErrEnd
    End If
    With appWd
        .Visible = True
        .Documents.Open strf, False
        .WindowState = wdWindowStateMaximize
        .ActiveWindow.View.Type = wdPrintView
        With .ActiveDocument.MailMerge
            .Destination = wdSendToNewDocument
            .SuppressBlankLines = True
            With .DataSource
                .FirstRecord = wdDefaultFirstRecord
                .LastRecord = wdDefaultLastRecord
            End With
            .Execute Pause:=False
        End With
    End With
    Set appWd = Nothing
ErrEnd:
    Exit Function
ErrMsg:
    If Err = 2475 Or Err = 2046 Then Resume ErrEnd
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function

Public Function OH_StartKatalog(strV As String)
On Error GoTo ErrMsg
    Dim strFolderBilder As String
    Dim strFolderFiles As String
    Dim strFile As String
    Dim strNr As String
    t = "Starte Katalog"
    If Len(Dir(strV)) = 0 Then
        s = "Vorlage nicht zu finden" & vbNewLine & strV
        GoTo ErrM
    End If
    If OH_InitializeWord = False Then
        GoTo ErrEnd
    End If
    strSQL = "Exec dbo.spa_Artikel " & _
        " @x = 'Katalog'"
    OH_r r
    i = 0
    While Not r.EOF
        i = i + 1
        If i = 1 Then
            strNr = r!ArtikelNr
            strFolderBilder = r!FolderBilder
            strFolderFiles = r!FolderFiles
            strFile = strFolderFiles & "\" & strNr & ".docx"
            If Len(Dir(strFolderBilder, vbDirectory)) = 0 Then
                s = "Folder Bilder nicht zu finden" & vbNewLine & strFolderBilder
                GoTo ErrM
            End If
            If Len(Dir(strFolderFiles, vbDirectory)) = 0 Then
                s = "Folder Für Files nicht zu finden" & vbNewLine & strFolderFiles
                GoTo ErrM
            End If
        End If
        With appWd
           .Application.Visible = True
           ' Maximieren
           .WindowState = wdWindowStateMaximize
            OH_KILL strFile
            Set objWDDoc = appWd.Documents.Add( _
                 Template:=strV, NewTemplate:=False)
             If Err.number = 0 Then
                With objWDDoc.ActiveWindow
                    .View.Type = wdPageView
                    .ActivePane.View.Zoom.PageFit = wdPageFitBestFit
                End With
                appWd.Application.Activate
            Else
                s = "Es konnte kein neues Dokument auf " & _
                   "der Basis Dokumentvorlage '" & _
                   strV & "' erstellt werden!"
                GoTo ErrM
            End If
        End With
        If TypeName(objWDDoc) = "Document" Then
            For i = 1 To r.Fields.count - 1
                Select Case left(r.Fields(i).Name, 2)
                Case "Ar", "SP"
                    AddTextToBookmarks r.Fields(i).Name, Nz(r.Fields(i).Value, "")
                Case "Bi"
                    If Len(Dir(Nz(r!Bild))) = 0 Then
                        MsgBox r!Bild & vbNewLine & _
                                "Bild nicht vorhanden", vbExclamation, t
                    End If
                    appWd.Selection.GoTo What:=wdGoToBookmark, Name:="Bild"
                    appWd.Selection.InlineShapes.AddPicture Filename:= _
                    r!Bild _
                    , LinkToFile:=False, SaveWithDocument:=True
                End Select
            Next i
        End If
        SysCmd acSysCmdSetStatus, "Save File " & strFile
        appWd.ActiveDocument.SaveAs strFile
    r.MoveNext
    Wend
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        s = Err.number & " " & Err.Description
    End Select
    Resume ErrM
' Ende des Fehlerhandlerblocks.
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Private Sub AddTextToBookmarks(ByVal strBMName As String, _
      ByVal strBMText As String)

  Dim objBMRange As Word.Range

  With objWDDoc
    If .Bookmarks.Exists(strBMName) Then
      Set objBMRange = .Bookmarks(strBMName).Range
      objBMRange.Text = strBMText
      .Bookmarks.Add Name:=strBMName, Range:=objBMRange
      Set objBMRange = Nothing
    End If
  End With
End Sub
Public Function OH_Word(frmP As Form, Optional strE As String)
On Error GoTo ErrMsg
    Dim strQ As String
    Dim strB As String
    Dim strBT As String
    Dim strf(1 To 5, 1 To 3) As String
    Dim strFN As String
    Dim strFile As String
    Dim strVorlageFile As String
    Dim docFF As Word.FormFields
    Dim oFF As Word.FormField
    Dim strX As String
    Dim tbl As Word.Table
    Dim objTM As Word.Bookmark
    Dim lgR As Long
    Dim lgC As Long
    Dim lgFC As Long
    Dim lgVG As Long
    Dim lgQK As Long
    Dim N As Long
    Dim strFilePart As String
    Dim strSignatur As String
    Dim strAnrede As String
    Dim strBody As String
    lgVG = frmP!NrVG
    lgQK = frmP!NrQK
    t = "ISO-Vorlagefile / Word-Bearbeitung für Vorgang " & lgQK

    strQ = "exec dbo.iso " & _
            "@x = 'Vorlagefile'" & _
            ",@u = " & lguser & _
            ",@i = " & lgVG & _
            ",@b = " & lgQK
    strSQL = strQ
    OH_r r
    If r.BOF Then
        s = "Es ist kein Vorlage-File in den Stichworten zum Vorgang definiert!"
        GoTo ErrM
    End If
    i = 0
    s = "Da es mehrere Vorlagen gibt, bitte unten die Nummer eingeben!" & vbNewLine & vbNewLine
    While Not r.EOF
        i = i + 1
        strf(i, 1) = Nz(r!HL)
        strf(i, 2) = Nz(r!VF)
        strf(i, 3) = Nz(r!Vorhanden)
        s = s & r!Msg & vbNewLine
        If strf(i, 1) = "" Or strf(i, 2) = "" Then
            s = "Vorlage-File in Stichworten falsch hinterlegt!"
            GoTo ErrM
        End If
        If Len(Dir(strf(i, 1))) = 0 Then
            s = strf(i, 1) & vbNewLine & _
                "File ist nicht zu finden!"
            GoTo ErrM
        End If
    r.MoveNext
    Wend
    N = 1
    If i > 1 Then
        N = Val(InputBox(s, t, 1))
        If N < 1 Or N > i Then
            GoTo ErrEnd
        End If
    End If
    i = Val(strf(N, 3))
    strFN = strf(N, 2)
    s = "Vorgang " & lgQK & vbNewLine & _
        "Es gibt bereits "
    Select Case i
    Case 1
        s = s & "ein entsprechendes ISO-Dokument!"
    Case Is > 1
        s = s & i & " entsprechende ISO-Dokumente!"
    End Select
    If i > 0 Then
        s = s & vbNewLine & vbNewLine & _
            "Zuerst mal das bereits Bestehende anzeigen?"
        i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbYes
            Forms!F_VG!lstStichwort.SetFocus
            GoTo ErrEnd
        End Select
    End If
    strVorlageFile = strf(N, 1)
    strQ = strQ & _
            ",@f = '" & strf(N, 2) & _
            "',@d = '" & strVorlageFile & "'"
    strSQL = strQ & ",@a = 10"
    OH_r r
    If OH_InitializeWord = False Then
        GoTo ErrEnd
    End If
    With appWd
        .Application.Visible = True
        ' Maximieren
        .WindowState = wdWindowStateMaximize
        .Documents.Add Template:=strVorlageFile
        If .ActiveDocument.ProtectionType <> wdNoProtection Then
            .ActiveDocument.UnProtect
        End If
        Select Case lgQK
        Case 203 'Schulungen'
            Set tbl = .ActiveDocument.Tables(1)
            i = tbl.Rows.count
            lgR = 1
            While Not r.EOF
                If lgR = 1 Then
                    For Each objTM In .ActiveDocument.Bookmarks
                        objTM.Range.Text = Nz(r(objTM.Name), "")
                    Next objTM
                End If
                lgR = lgR + 1
                If lgR >= i Then
                    tbl.Rows.Add
                End If
                For lgC = 1 To r!fc
                    tbl.Cell(lgR, lgC).Range.Text = Nz(r.Fields(lgC - 1).Value, "")
                Next lgC
            r.MoveNext
            Wend
        Case 51, 200, 201, 202, 204, 207
            Set docFF = .ActiveDocument.FormFields
            strX = "|"
            For Each oFF In docFF
                strX = strX & oFF.Name & "|"
            Next
            lgR = 0
            While Not r.EOF
                lgR = lgR + 1
                strB = Replace(Trim(Nz(r!txt, "")), "-", "") 'Textmarken OHNE Leerzeichen!!!
                strB = Replace(strB, " ", "")
                strBT = Nz(r!txtV, "")
                If .ActiveDocument.Bookmarks.Exists(strB) = True Then
                    If InStr(strX, "|" & strB & "|") > 0 Then
                        Select Case strBT
                        Case "", "-", "N", "Nein"
                        Case Else
                            .ActiveDocument.FormFields(strB).CheckBox.Value = True
                        End Select
                    Else
                        i = 0
                        Select Case Val(strBT)
                        Case 1, 2, 3, 4, 5, 6
                            If InStr(strVorlageFile, "Lieferantenbewertung") > 0 And Len(strBT) = 1 Then
                                .ActiveDocument.Bookmarks(strB).Range.Select
                                If Val(strBT) > 1 Then
                                    For i = 1 To Val(strBT)
                                        appWd.Selection.MoveRight unit:=wdCell
                                    Next i
                                End If
                                appWd.Selection.TypeText Text:="X"
                                i = 1
                            End If
                        End Select
                        If i = 0 Then
                            .ActiveDocument.Bookmarks(strB).Range.Text = strBT
                            'eine Textmarke kann NUR EINMAL erfasst werden mit dem gleichen Namen
                            'Trick einfach ein XX an di Textmarke dranhängen (siehe Gelangensbestätigung "Kunde")
                            If .ActiveDocument.Bookmarks.Exists(strB & "XX") = True Then
                                .ActiveDocument.Bookmarks(strB & "XX").Range.Text = strBT
                            End If
                        End If
                    End If
                End If
            r.MoveNext
            Wend
            If lgQK = 202 Then
                strSQL = strQ & ",@a = 20"
                OH_r r
                Set tbl = .ActiveDocument.Tables(1)
                N = tbl.Rows.count
                lgR = 2
                While Not r.EOF
                    lgR = lgR + 1
                    If lgR >= N Then
                        tbl.Rows.Add
                    End If
                    tbl.Cell(lgR, 1).Range.Text = Nz(r!txt, "")
                    i = Val(r!w)
                    If i > 0 Then
                        tbl.Cell(lgR, i + 1).Range.Text = "X"
                    End If
                    i = Val(r!z)
                    If i > 0 Then
                        tbl.Cell(lgR, i + 5).Range.Text = "X"
                    End If
                r.MoveNext
                Wend
            End If
            Select Case strFN
            Case "Gelangensbestätigung" 'muss übersetzt werden können, deshalb Textmarken für Übersetzungen
                If gllg <> "Deutsch" Then
                    For i = 1 To 17
                        strB = .ActiveDocument.Bookmarks("t" & i).Range.Text
                        strB = lg(strB)
                        .ActiveDocument.Bookmarks("t" & i).Range.Text = strB
                    Next i
                End If
                '180302 PAsswort-Abfrage entfernt!

'                S = "Zum Schutz des Dokumentes sollten Sie jetzt ein Passwort setzen!"
'                S = InputBox(S, strFN, "Passwort")
'                If S <> "" Then
'                    .ActiveDocument.Protect _
'                        Password:=S, _
'                        NoReset:=False, _
'                        Type:=wdAllowOnlyReading, _
'                        UseIRM:=False, _
'                        EnforceStyleLock:=False
'                End If
                strFilePart = "GB EC_" & frmP!projektNr & "_"
            End Select
        End Select
        .Visible = True
        .ActiveWindow.View.Type = wdPrintView
        strB = strFilePart & Replace(OH_GetNamePart(strVorlageFile), ".doc", "_" & Format(Date, "YYYYMMDD") & ".doc")
        Select Case glDMS
        Case "DATEV DMS"
            strFile = glstrTempPath & strB
            .ActiveDocument.SaveAs2 strFile, , , , , , , , , , , , , True
            .ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
            strSQL = "EXEC dbo.dms " & _
                " @x = 'AddtoAblage' " & _
                ",@s ='" & OH_RPL(strFN) & _
                "',@f ='" & OH_RPL(strFile) & _
                "',@d ='" & OH_RPL(strB) & _
                "',@n = 1 " & _
                ", @a =  " & frmP!NrVG & _
                ", @i =  " & frmP!NrFunktion
            OH_r r
            If OH_FileCopyMove(r!nrID, "DMS", False) <> "" Then '170823 File darf nicht gelöscht werden, da es zuerst noch ins Outlook muss
                If InStr(strE, "@") > 1 Then
                    strSQL = "EXEC spA_Adresse " & _
                            " @x = 'Standardtext' " & _
                             ",@f = '" & strFN & "'"
                    OH_r r
                    strBody = "<br><br><br>" & lg(frmP!QK) & " " & frmP!VGNr & " " & lg("vom") & " " & Format(frmP!VGdatum, "dd.mm.yyyy")
                    If Not r.BOF Then
                        strBody = strBody & "<br><br>" & _
                            lg(r!Beschreibung)
                    End If
                    OH_OutlookMail _
                        strE, _
                         strB, _
                         strBody, _
                        frmP!NrFunktion, _
                        strFile, , , , , frmP
                    strSQL = "EXEC dbo.ISO" & _
                        " @x = 'GelangensbestätigungWorkFlow'" & _
                        ",@i = " & frmP!NrVG & _
                        ", @f = 'gesendet'"
                    OH_EX
                    OH_KILL strFile '170823 File löschen
                End If
            End If
            .Quit
        Case ""
            strFile = OH_StichwortExplorer("Explorer", True) & "\QM-Dokumentation"
            t = "Ablage des Iso-Files!"
            If Len(Dir(strFile, vbDirectory)) = 0 Then
                s = strFile & vbNewLine & vbNewLine & _
                    "Der Ordner existiert nicht; das File wird jetzt unter C:\Temp gespeichert!"
                If MsgBox(s, vbQuestion + vbYesNo, t) = vbYes Then
                    strFile = glstrTempPath
                Else
                    GoTo ErrEnd
                End If
            End If
            strFile = strFile & strB
            s = "Soll das Wordfile so gespeichert werden:" & vbNewLine & _
                strFile
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
                .ActiveDocument.SaveAs2 strFile, , , , , , , , , , , , , True
                strSQL = strQ & _
                        ",@a = 30 " & _
                        ",@s1 = '" & strFile & "'"
                OH_EX
            End If
        End Select
        appWd.Visible = True
        appWd.Activate
    End With

    Set appWd = Nothing
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    If Err = 2475 Or Err = 2046 Then Resume ErrEnd
    MsgBox Err & " " & Err.Description, vbCritical, "OH_Word"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
End Function
Public Function OH_CheckEXCELFile(strf As String, blOpen As Boolean) As Workbook
On Error GoTo ErrMsg
' Test to see if there is a copy of Microsoft Excel already running.
On Error Resume Next
    If OH_InitializeEXCEL = False Then
        GoTo ErrEnd
    End If
    For Each wb In appEXCEL.Workbooks
        If strf = wb.FullName Then
            If blOpen = False Then
                wb.Close , True
                GoTo ErrEnd
            Else
                Set OH_CheckEXCELFile = wb
            End If
        End If
    Next
    If OH_CheckEXCELFile Is Nothing Then
        If Len(Dir(strf)) > 0 Then
            Set OH_CheckEXCELFile = appEXCEL.Workbooks.Open(strf)
        End If
    End If
    If OH_CheckEXCELFile Is Nothing Then
        s = "File existiert nicht!!"
    Else
        appEXCEL.Application.Visible = True
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Errors during OPENING EXCEL"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox strf & vbNewLine & _
            s, vbExclamation, "Daten aus EXCEL"
    GoTo ErrEnd
End Function
Public Function OH_EXCEL(Optional strQ As String, _
                         Optional strT As String, _
                         Optional strPath As String, _
                         Optional blExcel As Boolean) As Workbook
On Error GoTo ErrMsg
    Dim strf As String
    Dim strID As String
    Dim strField As String
    Dim wb As Workbook
    Dim xlTab As Worksheet
    Dim ws As Worksheet
    Dim iCols As Long
    Dim N As Long
    Dim Y As Long
    Dim z As Long
    Dim strN As String
    Dim strPlainText As String

    If strQ = "" Then
        Set frm = Forms!F_Lexikon
        t = frm!Begriff
        strN = frm!Begriff
        strSQL = frm!Beschreibung
        strSQL = frm!bemLexikon
        strID = Nz(frm!FieldName, "")
        Select Case left(strID, 2)
        Case "Nr", "ID"
        Case Else
            strID = ""
        End Select
        strField = Nz(frm!FormName, "")
        If strField = "" Then
            strID = ""
        End If
    Else
        Set frm = Screen.ActiveForm
        strSQL = strQ
        t = "Abfrage nach EXCEL"
        strN = "Abfrage aus Firma"
        If strT <> "" Then
            strN = strT
        End If
    End If
    strN = OH_CheckExplorerName(strN)
    strN = left(strN, 50)
        'rich text umwandeln in Plain Text
    strPlainText = Application.PlainText(strSQL)
    Select Case left(strPlainText, 5)
    Case "Selec", "exec ", "execu", "with "
    Case Else
        s = "Abfragen können nur ausgeführt werden," & vbNewLine & _
            "wenn Sie mit <SELECT>, <WITH> oder <EXEC> beginnen!"
        GoTo ErrM
    End Select
    OH_r r, strPlainText, , , True
    If r.BOF Then
        s = "Keine Datensätze vorhanden!"
        GoTo ErrM
    End If
    r.MoveLast
    Y = r.RecordCount & ""
    If strPath = "" Then
        strPath = CurrentProject.path
    End If
    strf = strPath & "\" & strN & UCase(strUserKZ) & Format(Date, "yyyymmdd") & ".xlsx"
    If OH_InitializeEXCEL = False Then
        GoTo ErrEnd
    End If
    If Len(Dir(strf)) > 0 And strID <> "" Then
        s = "Sollen die Felder " & strField & vbNewLine & _
            "aus dem File " & strf & vbNewLine & _
            "abgeglichen werden?"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        Select Case i
        Case vbYes
            OH_EXCELUpdate strID, strField, strf
            GoTo ErrEnd
        Case vbCancel
            GoTo ErrEnd
        End Select
    End If
    Select Case Y
    Case 1
        s = "EINEN Datensatz"
    Case Else
        s = Y & " Datensätze"
    End Select
    If Not blExcel Then
        i = MsgBox("JA" & vbTab & "öffne EXCEL" & vbNewLine & _
                    vbTab & strf & vbNewLine & vbNewLine & _
                    "Nein" & vbTab & "Öffne Liste direkt in Datenbank!" & vbNewLine & vbNewLine & _
                    "und sende " & s, _
                    vbYesNoCancel + vbQuestion, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbYes
        Case vbNo
            OH_PF_Tab frm.Name, strT, Application.PlainText(strSQL)
            GoTo ErrEnd
        End Select
    End If
    OH_KILL strf
    appEXCEL.Visible = True
    appEXCEL.Application.ScreenUpdating = True
    Set wb = appEXCEL.Workbooks.Add

    Set xlTab = wb.Worksheets(1)
    xlTab.cells(1, 1).Select
    OH_r r, strPlainText
    r.MoveFirst
    i = r.Fields.count
    For iCols = 0 To i - 1
        xlTab.cells(1, iCols + 1).Value = r.Fields(iCols).Name
        Select Case r.Fields(iCols).Name
        Case "EURTotal", "Soll", "Ist", "Netto", "Kurs", "Lagerwert"
            xlTab.Columns(iCols + 1).NumberFormat = "#,##0.00"
        End Select
        If InStr(r.Fields(iCols).Name, "Betrag") > 0 Or _
            InStr(r.Fields(iCols).Name, "steuer") > 0 Or _
            InStr(r.Fields(iCols).Name, "Tax") > 0 Or _
            InStr(r.Fields(iCols).Name, "VAT") > 0 Or _
            InStr(r.Fields(iCols).Name, "MWSt") > 0 Then
                xlTab.Columns(iCols + 1).NumberFormat = "#,##0.00"
        End If
        '<R187>
        If InStr(r.Fields(iCols).Name, "Datum") > 0 Or _
            InStr(r.Fields(iCols).Name, "Date") > 0 Or _
            InStr(r.Fields(iCols).Name, "erfasst") > 0 Then
                xlTab.Columns(iCols + 1).NumberFormat = "dd.mm.yyyy"
        End If
    Next
    xlTab.Range(xlTab.cells(1, 1), xlTab.cells(1, i)).Font.Bold = True
    DoEvents
    xlTab.Select
    xlTab.Name = left(strN, 30)
    xlTab.Range("a2").Select
    xlTab.Range("a2").CopyFromRecordset r
    xlTab.Select
    xlTab.cells.Select
    With appEXCEL.Selection
        .HorizontalAlignment = xlGeneral
        .VerticalAlignment = xlTop
    End With
    xlTab.Rows("1:1").Select
    appEXCEL.Selection.AutoFilter
    xlTab.cells.EntireColumn.AutoFit
  '  xlTab.Cells.EntireRow.AutoFit
    xlTab.cells.EntireRow.RowHeight = 15
    With appEXCEL.ActiveWindow
        .SplitColumn = 0
        .SplitRow = 1
    End With
    appEXCEL.ActiveWindow.FreezePanes = True
    With appEXCEL.Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .Color = 65535
        .TintAndShade = 0
        .PatternTintAndShade = 0
    End With
    xlTab.Range("a1").Select

    Set OH_EXCEL = wb
    If strID <> "" Then
        s = "Sie können jetzt die Felder " & strField & vbNewLine & _
            "aus dem File " & strf & vbNewLine & _
            "ändern, das File speichern und dann wieder mit ==>EXCEL einlesen!!!!"
        MsgBox s, vbInformation, t
    End If
    DoEvents
    wb.SaveAs Filename:=strf, FileFormat:=51 '=xlsx
ErrEnd:
    SysCmd acSysCmdRemoveMeter
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description & vbNewLine & vbNewLine & strf & vbNewLine & vbNewLine
    Select Case Err
    Case 70
        s = s & "Das File ist möglicherweise noch offen!"
    Case Else
        s = s & "Das File kann möglicherweise nicht gespeichert werden!"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, "Daten nach EXCEL mit Function OH_EXCEL"
    OH_CB strSQL
    GoTo ErrEnd
End Function
Public Function OH_EXCELCSV(strf As String) As Boolean
On Error GoTo ErrMsg
'130202 erzeuge das vorgegebene csv-File
    Dim xlTab As Worksheet
    Dim iCols As Long
    DoCmd.Hourglass True
    OH_KILL strf
    If OH_InitializeEXCEL = False Then
        GoTo ErrEnd
    End If
    appEXCEL.Application.ScreenUpdating = True
    Set wb = appEXCEL.Workbooks.Add

    Set xlTab = wb.Worksheets(1)
    xlTab.cells(1, 1).Select
    OH_r r, strSQL
    r.MoveFirst
    i = r.Fields.count
    For iCols = 0 To i - 1
        xlTab.cells(1, iCols + 1).Value = r.Fields(iCols).Name
    Next
    xlTab.Range(xlTab.cells(1, 1), xlTab.cells(1, i)).Font.Bold = True
    DoEvents
    xlTab.Select
    xlTab.Range("a2").Select
    xlTab.Range("a2").CopyFromRecordset r
    appEXCEL.DisplayAlerts = False
    wb.SaveAs Filename:=strf, _
                 FileFormat:=xlCSV, _
                 CreateBackup:=False
    wb.Save
    wb.Close
    appEXCEL.DisplayAlerts = True
    appEXCEL.Quit
    OH_EXCELCSV = True
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 70
        MsgBox Err.Description & vbNewLine & _
            "Das File ist möglicherweise noch offen!", vbCritical, "Errors during EXCEL Export (OH_EXCELCSV)"
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Errors during EXCEL Export (OH_EXCELCSV)"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, "Daten nach EXCEL"
    GoTo ErrEnd
End Function
Public Function OH_EXCELUpdate(strID As String, _
                                strField As String, _
                                strf As String) As Long
On Error GoTo ErrMsg
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim N As Long
    Dim m As Long
    Dim Y As Long
    Dim z As Long
    Dim lgR As Long
    Dim lgid As Long
    Dim strT As String
    Dim nn(0 To 10) As Long
    Dim strFields() As String
    Dim c As Range
    Dim lgC As Long
    Dim lgCu As Long
    DoCmd.Hourglass True
    If Len(Dir(strf)) = 0 Then
        s = strf & vbNewLine & _
            "File existiert nicht!"
        GoTo ErrM
    End If
    Set wb = OH_CheckEXCELFile(strf, True)
    If wb Is Nothing Then
        GoTo ErrEnd
    End If
    wb.Application.Visible = True
    Set ws = wb.Worksheets(1)
    ws.Activate
    ws.cells(1, 1).Select
    i = 0
    For i = 1 To 20
        If ws.cells(1, i) = strID Then
            Exit For
        End If
    Next i
    Select Case i
    Case 0, Is >= 20
        s = ws.Name & vbNewLine & _
            "Das ID-Field " & strID & vbNewLine & _
            "ist nicht vorhanden!"
        GoTo ErrM
    End Select
    strFields = Split(strField, ";")
    N = UBound(strFields)
    For Y = 0 To N
        For z = 1 To 20
            If ws.cells(1, z) = Trim(strFields(Y)) Then
                nn(Y) = z
                Exit For
            End If
        Next z
    Next Y
    If nn(1) = 0 Then
        s = strField & vbNewLine & _
        "Keine Feld zum Abgleich vorhanden"
        GoTo ErrM
    End If
    lgR = ws.UsedRange.Rows.count
    If lgR < 2 Then
        s = "Keine Daten vorhanden"
        GoTo ErrEnd
    End If
    strT = "T_" & Mid(strID, 3)
    For m = 2 To lgR
        SysCmd acSysCmdSetStatus, "Zeile " & m & " von " & lgR
        lgid = ws.cells(m, i)
        strSQL = "Select * from " & strT & _
                " Where " & strID & " = " & lgid
        lgC = lgC + 1
        OH_r r, strSQL, adLockOptimistic
        If r.BOF = False Then
            For Y = 0 To N
                Set c = ws.cells(m, nn(Y))
                If r(strFields(Y)) <> c Then
                    r(strFields(Y)) = c
                    lgCu = lgCu + 1
                    r.Update
                    With c.Interior
                        .Pattern = xlSolid
                        .PatternColorIndex = xlAutomatic
                        .ThemeColor = xlThemeColorAccent3
                        .TintAndShade = 0.599993896298105
                        .PatternTintAndShade = 0
                    End With
                Else
                    With c.Interior
                        .Pattern = xlSolid
                        .PatternColorIndex = xlAutomatic
                        .ThemeColor = xlThemeColorAccent3
                        .TintAndShade = 0.799981688894314
                        .PatternTintAndShade = 0
                    End With
                End If
                c.Borders(xlDiagonalDown).LineStyle = xlNone
                c.Borders(xlDiagonalUp).LineStyle = xlNone
                With c.Borders(xlEdgeLeft)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
                With c.Borders(xlEdgeTop)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
                With c.Borders(xlEdgeBottom)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
                With c.Borders(xlEdgeRight)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
                With c.Borders(xlInsideVertical)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
                With c.Borders(xlInsideHorizontal)
                    .LineStyle = xlContinuous
                    .ColorIndex = 0
                    .TintAndShade = 0
                    .Weight = xlThin
                End With
            Next Y
        End If
    Next m
    Set wb = Nothing
    s = "Felder geändert:" & vbTab & lgCu & vbNewLine & _
        "Zeilen kontrolliert: " & vbTab & lgC
    MsgBox s, vbInformation, t
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Errors during EXCEL Import"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox strf & vbNewLine & _
            s, vbExclamation, "Daten aus EXCEL"
    GoTo ErrEnd
End Function

Public Function OH_EXCELImport(StrImport As String)
On Error GoTo ErrMsg
    Dim strSheetname As String
    Dim strFile As String
    Dim strf As String
    Dim lgUR As Long
    Dim lgLM As Long
    Dim lgF(1 To 2) As Long
    Dim lgct(1 To 2) As Long
    If StrImport = "aktueller Lagerbestand" Then
        If OH_InitializeEXCEL = False Then
            GoTo ErrEnd
        End If
        appEXCEL.Application.ScreenUpdating = True
        t = StrImport
        Set fd = Application.FileDialog(msoFileDialogFilePicker)
        With fd
            .Title = t
            .AllowMultiSelect = False
            .ButtonName = "File auswählen u. eintragen"
            .filters.Clear
            .filters.Add "Excel-Dateien", "*.xlsx"
            .FilterIndex = 1
            .Show
        End With
        If fd.SelectedItems.count > 0 Then
            strFile = fd.SelectedItems(1)
        Else
            GoTo ErrEnd
        End If
        Set wb = Nothing
        If OH_IsFileOpen(strFile) = 2 Then
            Set appEXCEL = GetObject(, "Excel.Application")
            For Each wb In appEXCEL.Workbooks
                If wb.FullName = strFile Then
                    Exit For
                End If
            Next wb
        End If
        If wb Is Nothing Then
            Set wb = appEXCEL.Workbooks.Open(Filename:=strFile, UpdateLinks:=False, readOnly:=False)
        End If
        Set ws = wb.Worksheets(1)
        strSheetname = ws.Name
        appEXCEL.Visible = True
        lgUR = ws.Range("A1").End(xlDown).Row 'to determine Last Row with Data
        strf = ws.cells(1, 1)
        i = 0
        While strf <> ""
            i = i + 1
            strf = ws.cells(1, i)
            If ws.cells(1, i) = "ArtikelNr" Then
                lgF(1) = i
            End If
            If ws.cells(1, i) = "Lagermenge" Then
                lgF(2) = i
            End If
        Wend
        If lgF(1) = 0 Then
            s = "ArtikelNr fehlt als Spaltenüberschrift"
            GoTo ErrM
        End If
        If lgF(2) = 0 Then
            s = "Lagermenge fehlt als Spaltenüberschrift"
            GoTo ErrM
        End If
        strf = ws.cells(2, lgF(1))
        i = 2
        While strf <> ""
            lgLM = Val(ws.cells(i, lgF(2)))
            strSQL = "EXECUTE spa_Lager " & _
                    " @x = 'UpdateLagermenge'" & _
                    ",@f = '" & strf & _
                    "',@n = " & lgLM & _
                    ",@u = " & lguser
            OH_r r
            If r!CT = 1 Then
                lgct(1) = lgct(1) + 1
            Else
                lgct(2) = lgct(2) + 1
            End If
            SysCmd acSysCmdSetStatus, t & " " & i
            i = i + 1
            strf = ws.cells(i, lgF(1))
        Wend
        s = lgct(1) & vbTab & "Menge angepasst" & vbNewLine & _
            lgct(2) & vbTab & "Menge unverändert"
        MsgBox s, vbInformation, t

    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Errors during EXCEL Import"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox strf & vbNewLine & _
            s, vbExclamation, "Daten aus EXCEL"
    GoTo ErrEnd
End Function
