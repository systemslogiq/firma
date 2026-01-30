Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim rSNavi As Recordset
Dim strNode As String
Dim strNodeText As String
Dim nodeX As node
Dim objTV As MSComctlLib.TreeView
Dim strFolder As String
Dim strFolderHB As String
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    Set objTV = Me!tvQ.Object
    btntvq_Click
    With objTV.Nodes("a0")
        .EnsureVisible
        .Expanded = True
        tvq_NodeClick objTV.Nodes("a0")
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub btnNr_Click()
On Error GoTo ErrMsg
    OH_NewQ
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.btnNr_Click"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub btntvq_Click()
On Error GoTo ErrMsg
    OH_AddNavi
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.btntvq_Click"
    Resume ErrEnd
End Sub
Private Sub OH_AddNavi() ' Anzeigen
On Error GoTo ErrMsg
Dim varB, varBN
Dim strC As String
Dim strText As String
    OH_A "@x = 'AddNavi'", , Me
    OH_r r
    objTV.Nodes.Clear
    objTV.Checkboxes = False
    objTV.LineStyle = tvwRootLines  ' Linestyle 1
    objTV.Indentation = 100 ' Einrückung
    Do Until r.EOF
        varB = r!V
        strC = r!tvid
        Set nodeX = objTV.Nodes.Add(varB, tvwChild, strC, r!TVtxt)
        If Len(strC) = 2 Then
            nodeX.Bold = True
        End If
    r.MoveNext
    Loop
ErrEnd:
    SysCmd acSysCmdRemoveMeter
    Exit Sub
ErrMsg:
    s = "Fehler  " & Err & " " & Err.Description & vbNewLine & vbNewLine & _
            "Ihre Datenstruktur muss korrigiert werden!" & vbNewLine
    Select Case Err
    Case 35601
        s = s & "übergeordneter Level fehlt!" & vbNewLine
    End Select
    MsgBox s & "übergeordneter Level:" & vbTab & Nz(varB, "") & vbNewLine & _
                     "Betroffenes Elelement:" & vbTab & strC, _
                     vbCritical, "Fall für Admin"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_SyncS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If DirtyRecord(Me) Then GoTo ErrEnd
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub qpunkt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    btnNr_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.qpunkt_DblClick"
    Resume ErrEnd
End Sub
Private Sub tvq_NodeClick(ByVal node As Object)
On Error GoTo ErrMsg
    strNode = Mid(node.Key, 2)
    strNodeText = node.Text
    OH_A "@x = 'ID'" & _
        ",@f = '" & strNode & "'", , Me
    OH_SetRS Me, , strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        s = "Keine Daten"
    Case Else
        s = Err & " " & Err.Description
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
End Sub
Public Function OH_NewQ()
On Error GoTo ErrMsg
    Dim strMSG As String
    Dim strNr As String
    strNr = Nz(Me!qNr, "")
    t = "QM-Handbuch ergänzen"
    s = "Bitte geben Sie die neue Nr. ein" & vbNewLine & vbNewLine & _
        "Die Nummer darf noch nicht existieren, der entsprechende <Vater> muss aber vorhanden sein"
nochmalNew:
    strNr = InputBox(s, t, strNr)
    If Not strNr = "" Then
        OH_A "@x = 'Neuer Titel'" & _
           ", @f = '" & strNr & "'", , Me
        OH_r r
        strMSG = r!Msg
        If strMSG = "ok" Then
            Set nodeX = objTV.Nodes.Add(r!Boss, tvwChild, r!ID, r!txt)
            tvq_NodeClick objTV.Nodes(r!ID)
            Me!q.SetFocus
        Else
            s = s & vbNewLine & strMSG
            GoTo nochmalNew
        End If
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.OH_NewQ"
    Resume ErrEnd
End Function
Public Function OH_copyQ()
On Error GoTo ErrMsg
    Dim strQ As String
    Dim strMSG As String
    Dim strNr As String
    Dim strNrNeu As String
    strNr = Nz(Me!qNr, "")
    t = "QM-Handbuch ergänzen um Kopie von " & strNr
    s = "Bitte geben Sie die neue Nr. ein" & vbNewLine & vbNewLine & _
        "Die Nummer darf noch nicht existieren, der entsprechende <Vater> muss aber vorhanden sein"
nochmalNew:
    strNrNeu = InputBox(s, t, strNr)
    If Not strNrNeu = "" Then
        OH_A "@x = 'Neuer Titel'" & _
           ", @f = '" & strNrNeu & _
           "', @d = '" & strNr & "'"
        strQ = strSQL
        strSQL = strQ & _
            ", @a = 1 "
        OH_r r
        strMSG = r!Msg
        If strMSG = "ok" Then
            i = r!CT
            Select Case i
            Case 1
            Case Else
                s = "Möchten Sie die Unter-Nummern (" & i & " ) auch mitkopieren?"
                i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
                Select Case i
                Case vbCancel
                    GoTo ErrEnd
                Case Else
                    strSQL = strQ & _
                        ", @a = " & i
                    OH_r r
                    s = r!Msg
                    If r!Msg <> "ok" Then
                        GoTo ErrM
                    Else
                        OH_AddNavi
                        strNr = "a" & strNr
                        With objTV.Nodes(strNr)
                            .EnsureVisible
                            .Expanded = True
                            tvq_NodeClick objTV.Nodes(strNr)
                        End With
                    End If
                End Select
            End Select
        Else
            s = s & vbNewLine & strMSG
            GoTo nochmalNew
        End If
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Q.OH_copyQ"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_DeleteQ()
On Error GoTo ErrMsg
    Dim strBoss As String
    Dim strNr As String
    strNr = Nz(Me!qNr, "")
    strBoss = objTV.Nodes("a" & strNr).Parent.Key
    t = "QM-Handbuch reduzieren"
    OH_A "@x = 'DeleteQ'" & _
       ", @f = '" & strNr & "'"
    OH_r r
    i = r!CT
    s = "Bitte bestätigen Sie, dass Sie die Nummer" & vbNewLine & _
        strNr & vbNewLine & _
        "LÖSCHEN wollen!" & vbNewLine & vbNewLine
    If i > 1 Then
        s = s & "Abhängige Daten (" & i - 1 & ") werden auch gelöscht!"
    End If
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
        GoTo ErrEnd
    End If
    strSQL = strSQL & ",@a = 1"
    OH_EX
    OH_AddNavi
    With objTV.Nodes(strBoss)
        .EnsureVisible
        .Expanded = True
        tvq_NodeClick objTV.Nodes(strBoss)
    End With
ErrEnd:
    OH_ResetRS rs
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Q.OH_DeleteQ"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Q.txtFind_KeyDown"
    Resume ErrEnd
End Sub
Private Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Dim strfind As String
    Dim strID As String
    DoCmd.Hourglass True
    strfind = Nz(Me!txtFind, "")
    t = "Suche im QM-Navigator"
    i = 0
    For Each nodeX In objTV.Nodes
        nodeX.BackColor = vbWhite
        If nodeX.Expanded = True Then
            nodeX.Expanded = False
        End If
    Next nodeX
    OH_A "@x = 'txtfind'" & _
        ",@f = '" & strfind & "'"
    OH_r r
    While Not r.EOF
        With objTV.Nodes(CStr(r!tvid))
            SysCmd acSysCmdSetStatus, .Text
            .EnsureVisible
            .BackColor = vbYellow
        End With
    r.MoveNext
    Wend
    If strID <> "" Then
        objTV.Nodes(strID).EnsureVisible
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "Navigator txtFind_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = ""
    txtFind_AfterUpdate
    Me!txtFind = ""
End Sub
Public Function OH_explorerQM(Optional blopenFolder As Boolean = True) As Boolean
On Error GoTo ErrMsg
    Dim strNr As String
    strNr = Nz(Me!qpunkt, "")
    t = "QM-Handbuch im Explorer"
    OH_A "@x = 'QMHandbuch'" & _
       ", @f = '" & strNr & "'"
    OH_r r
    s = r!Msg
    If s <> "" Then
        GoTo ErrM
    End If
    strFolder = r!subfolder
    strFolderHB = r!folderHB
    If blopenFolder Then
        If Len(Dir(strFolder, vbDirectory)) = 0 Then
            s = "Bitte bestätigen Sie, dass Sie den Ordner" & vbNewLine & vbNewLine & _
                strFolder & vbNewLine & vbNewLine & _
                "anlegen (und gleich öffnen) wollen!"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
            If Not OH_CreateFolder(strFolder) Then
                GoTo ErrEnd
            End If
        End If
        OH_LaunchFolder 1, strFolder
    End If
    OH_explorerQM = True
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Q.OH_explorerQM"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub btnCopyExplorer_Click()
On Error GoTo ErrMsg
    Dim objFSO As Object
    Dim objFolder As Object
    Dim objFile As Object
    Dim strf As String
    Dim strFiles As String
    Dim z As Long
    If Not OH_explorerQM Then
        GoTo ErrEnd
    End If

    'Create an instance of the FileSystemObject
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    'Get the folder object
    Set objFolder = objFSO.GetFolder(strFolder)
    For Each objFile In objFolder.Files
        strf = "- " & objFile.Name
        If right(strf, 3) <> ".db" Then
            z = z + 1
            If z = 1 Then
                strFiles = strf
            Else
                strFiles = strFiles & vbNewLine & strf
            End If
        End If
    Next objFile
    Set objFSO = Nothing
    Set objFolder = Nothing
    Set objFile = Nothing
    t = Me!btnCopyExplorer.Caption
    If z = 0 Then
        s = strFolder & vbNewLine & "ist leer"
        GoTo ErrM
    Else
        If Nz(Me!qbem, "") <> "" Then
            s = z & " Filenamen gefunden:" & vbNewLine & _
            left(strFiles, 500) & vbNewLine & vbNewLine & _
            "vorhandener Eintrag:" & vbNewLine & left(Me!qbem, 500) & "...." & vbNewLine & vbNewLine & _
            "JA" & vbTab & "überschreiben?" & vbNewLine & _
                "NEIN" & vbTab & "ergänzen"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
            If i = vbCancel Then
                GoTo ErrEnd
            End If
        End If
    End If
    OH_A "@x ='qbem'" & _
        ",@i = " & Me!nrQ & _
        ",@a = " & i & _
        ",@f = '" & OH_RPL(strFiles) & "'"
    OH_EX
    OH_RQf Me
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "btnCopyExplorer_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnBeilageExcel_Click()
On Error GoTo ErrMsg
    Dim strPath As String
    OH_explorerQM False

    t = "Beilagen als Liste in Excel erstellen"
    s = "JA" & vbTab & "komplettes Handbuch" & vbNewLine & _
        "Nein" & vbTab & "Nur Ordner " & Replace(strFolder, strFolderHB, "")
    i = MsgBox(s, vbYesNoCancel, t)
    Select Case i
    Case vbCancel
        GoTo ErrEnd
    Case vbYes
        strPath = strFolderHB
    Case vbNo
        strPath = strFolder
    End Select
    OH_ResetID
    OH_ListFilesInFolder strPath, True
    OH_A "@x = 'ListFiles',@f = '" & strFolderHB & "'"
    OH_EXCEL strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "btnCopyExplorer_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
