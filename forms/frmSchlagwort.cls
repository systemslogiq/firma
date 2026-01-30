Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim f As Form
Dim strWie As String
Dim strQ As String
Dim strFolderBase As String
Private Sub Form_Load()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Me.KeyPreview = True
    Me!cboSchlagwort.ControlTipText = "nur die markierten Files werden abgelegt"
    Me!Filename.ControlTipText = "Filename"
    Me!Schlagwort.ControlTipText = "Dokumentenart zuordnen"
    Me!bemSchlagwort.ControlTipText = "Betreff eintragen"
    Me!btnSave.ControlTipText = "Ausgewählte Files ablegen und Formular schliessen"
    strSQL = "Exec dbo.dms " & _
            " @x = 'Schlagwort'"
    OH_A "Schlagwort", strSQL, Me
    strSQL = "Exec dbo.dms " & _
            " @x = 'lstSchlagwort'"
    OH_A "lstSchlagwort", strSQL, Me
    OH_Move Me, 120, 50, 310, 170
    Set f = Screen.ActiveForm
    strWie = f!lstExplorerSource
    s = "Files bitte markieren und durch Speichern im " & strWie & "  ablegen:"
    If strWie = "DMS" Then
        s = Replace(s, "und", ", verschlagworten und ")
        Me!lblBemerkung.Caption = "Betreff / Bemerkung"
        Me!lblÜberschrift.Visible = True
    Else
        Me!lblÜberschrift.Visible = False
        Me!lblBemerkung.Caption = "ggf. Filenamen ändern:"
        strFolderBase = f!lstExplorer.column(0, 1)
        s = s & vbNewLine & strFolderBase
    End If
'    Me!lblBemerkung.left = Me!BemSchlagwort.left
'    Me!Schlagwort.Visible = Me!lblÜberschrift.Visible
    Me!lblSave.Caption = s
    strQ = "Exec dbo.dms " & _
            " @x = 'lstSchlagwortAct'" & _
            ",@f = '" & strWie & _
            "',@a = "
    strSQL = strQ & 0
    OH_A "lstSchlagwortAct", strSQL, Me
    strSQL = strQ & 1
    OH_r r
    With Me!tv 'Treeview füllen
        .Nodes.Clear
        While Not r.EOF
            s = r!txt
            .Nodes.Add , tvwFirst, s, s
            r.MoveNext
        Wend
      .OLEDragMode = ccOLEDragAutomatic
      .OLEDropMode = ccOLEDropManual
    End With
    Set f = Forms("F_" & Me.OpenArgs)
    Me!NrFunktion = Nz(f!NrFunktion, 0)
    Me!NrVG = 0
    Select Case f.Name
    Case "F_Adresse"
        s = "Adresse " & f!pageFunktion.Caption
    Case "F_VG"
        Me!NrVG = Nz(f!NrVG, 0)
        s = "Vorgang " & f!pageVorgang.Caption
    End Select
    Me.Caption = "Ablage von Files / Mails: " & strWie & " zu " & s
    Me!NrFunktion.Visible = IsNull(Me!NrFunktion) = False
    Me!NrVG.Visible = IsNull(Me!NrVG) = False
    Me!lstSchlagwortAct = Val(Nz(f!lstExplorerAct, 0))
    lstSchlagwortAct_AfterUpdate
    strSQL = "Exec dbo.dms " & _
            " @x = 'lstSchlagwort'"
    OH_A "lstSchlagwort", strSQL, Me
    If Me!lstSchlagwort.ListCount > 0 Then
        Me!lstSchlagwort.SetFocus
        Me!lstSchlagwort.ListIndex = 0
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgNr As Long
    Dim lgNrNext As Long
    Dim lgNrMax As Long
    lgid = Nz(Me!lstSchlagwort)
    Dim strAC As String
 '   MsgBox KeyCode
 SysCmd acSysCmdSetStatus, KeyCode
    Select Case KeyCode
    Case vbKeyReturn
        Me!lstSchlagwortAct = 50
        lstSchlagwortAct_AfterUpdate
    Case vbKeyTab
        strAC = Nz(Screen.ActiveControl.Name, "")
        lgNrMax = Val(Nz(Me!lstSchlagwort.column(6), 0))
        lgNr = Val(Nz(Me!lstSchlagwort.column(1), 0))
        Select Case strAC
        Case "Schlagwort"
            Me!bemSchlagwort.SetFocus
        Case Else
            If Shift = 0 Then
                If lgNr = lgNrMax Then
                    lgNrNext = 0
                Else
                    lgNrNext = lgNr
                End If
            Else
                If lgNr = 1 Then
                    lgNrNext = lgNrMax - 1
                Else
                    lgNrNext = lgNr - 2
                End If
            End If
            Me!lstSchlagwort.SetFocus
            Me!lstSchlagwort.ListIndex = lgNrNext
            lstSchlagwort_AfterUpdate
            Me!Schlagwort.SetFocus
        End Select
    Case vbKeyEscape 'escape
        OH_ResetID
        DoCmd.Close acForm, Me.Name
    Case vbKeyF1
        Me!lstSchlagwortAct = 19
        lstSchlagwortAct_AfterUpdate
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    SysCmd acSysCmdSetStatus, s
    t = "Form_KeyDown"
    Select Case Err
    Case 2474
        Resume Next
    Case 2110
        Resume ErrEnd
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub lstSchlagwort_AfterUpdate()
On Error GoTo ErrMsg
    If Me!Schlagwort.Visible = False Then
        For Each ctl In fh.Controls
            If ctl.Tag = "v" Then
                ctl.Visible = True
            End If
        Next ctl
    End If
    With Me!lstSchlagwort
        Me!rn = .column(1)
        Me!Filename = .column(2)
        Me!cboSchlagwort = .column(3) <> "-"
        Me!Schlagwort = .column(4)
        Me!bemSchlagwort = .column(5)
    End With
    Me!Schlagwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.lstSchlagwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub cboSchlagwort_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveSchlagwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.cboSchlagwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Function OH_SaveSchlagwort() '250210 Speichern über UMWEG OH_SaveSchlagwort, da DIREKTES speichern auf 172.31.42.179 (KIENE) nicht funzt!
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strf As String
    Dim strQ As String
    Dim N As Long
    lgid = Nz(Me!lstSchlagwort, 0)
    t = "Daten speichern"
    If Me!cboSchlagwort <> 0 Then
        If Nz(Me!Schlagwort, "") = "" Or Nz(Me!bemSchlagwort, "") = "" Then
            s = "Zuerst (2) und (3) ausfüllen"
            GoTo ErrM
        End If
    End If
    strSQL = "Execute dbo.DMS" & _
            " @x = 'SaveSchlagwort'" & _
            ",@id = " & lgid & _
            ",@b = " & Format(Me!cboSchlagwort, 0) & _
            ",@f = '" & OH_RPL(Me!Schlagwort) & _
            "',@d  = '" & OH_RPL(Me!bemSchlagwort) & "'"
    OH_r r
    N = r!CT
    Me!btnSave.Visible = N > 0
    OH_RQ Me!lstSchlagwort, lgid
    Me!Schlagwort.SetFocus
ErrEnd:
    OH_ResetRS rx
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.OH_SaveSchlagwort"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Private Sub Form_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    OH_ResetID
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
End Sub
Private Sub Schlagwort_AfterUpdate()
On Error GoTo ErrMsg
    t = "Prüfe " & Me!Schlagwort
    If Len(Nz(Me!Schlagwort, "")) > 50 Then
        s = "Hier sind leider nur max. 50 Buchstaben zulässig; Zeichenkette wird gekürzt."
        Me!Schlagwort = left(Me!Schlagwort, 50)
        MsgBox s, vbInformation, t
    End If
    Me!cboSchlagwort = -1
    OH_SaveSchlagwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.Schlagwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Schlagwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Schlagwort Art", Me!Schlagwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.Schlagwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub BemSchlagwort_AfterUpdate()
On Error GoTo ErrMsg
    Me!cboSchlagwort = -1
    OH_SaveSchlagwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.BemSchlagwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnSave_Click()
On Error GoTo ErrMsg
    Me!lstSchlagwortAct = 50
    lstSchlagwortAct_AfterUpdate
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmSchlagwort.btnSave_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstSchlagwortAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgA As Long
    Dim strQ As String
    Dim strID As String
    Dim strD As String
    Dim strP As String
    Dim strE As String
    Dim strTT As String
    Dim lgCC As Long
    Dim strCW As String
    DoCmd.Hourglass True
'OH_MailItemByEntryID Me!IDT3
    t = Nz(Me!lstSchlagwortAct.column(1), "--")
    If t = "" Then
        GoTo ErrEnd
    End If
    strD = Nz(f!lstExplorerSource, "DMS")
    lgA = Me!lstSchlagwortAct
    lgid = Nz(Me!lstSchlagwort.column(0), 0)
    strSQL = "Exec dbo.dms " & _
            " @x = 'lstSchlagwortAct'" & _
            ",@a = " & lgA & _
            ",@id = " & lgid & _
            ",@i = " & Me!NrFunktion & _
            ",@b = " & Me!NrVG
    strQ = strSQL
    Select Case lgA
    Case 10, 11, 12 'Aktuelles Mail zuordnen'  'PDF im akt. Mail zuordnen', 'zuletzt versendete Mail zuordnen'
        i = OH_Mail_to_DMS(Nz(Me!NrFunktion, 0), Me!NrVG, lgA)
        If i < 0 Then
            GoTo ErrEnd
        End If
        If i = 0 Then
            s = "Sie haben in Outlook keine Mails markiert!" & vbNewLine & _
                "Markieren Sie dort zuerst die gewünschten Emails." & vbNewLine & _
                "(mit SHIFT / CTRL -Taste können Sie auch mehrere Mails zuordnen...)"
            GoTo ErrM
        End If
        OH_RQ Me!lstSchlagwort
    Case 13 'Markiertes File zuordnen'
        If OH_GetSelectedFilesInWinExplorers(Me!NrFunktion, Me!NrVG) > 0 Then
            OH_RQ Me!lstSchlagwort
            Me!lstSchlagwortAct = Null
            Me!btnSave.Visible = True
            Me!btnSave.SetFocus
        Else
            GoTo ErrEnd
        End If
    Case 14 'Scan-Files zuordnen
        i = OH_GetScanFiles(Me!NrVG)
        If i = 0 Then
            s = "Sie haben im SCAN-Ordner keinerlei Files!" & vbNewLine & _
                "Ggf. sollten Sie jetzt was einscannen und dann hier nochmals drücken..."
            GoTo ErrM
        End If
    Case 19
        If Me!cboSchlagwort = 0 Then
            If Nz(Me!Schlagwort, "") = "" Then
                s = "(2) muss gefüllt sein!"
                GoTo ErrM
            End If
            If Nz(Me!bemSchlagwort, "") = "" Then
                s = "(3) muss gefüllt sein!"
                GoTo ErrM
            End If
        End If
        OH_r r
        lgA = r!CT
        OH_RQ Me!lstSchlagwort, lgid
        OH_nextRecord
        Me!Schlagwort.SetFocus
        Me!btnSave.Visible = lgA > 0
        GoTo ErrEnd
    Case 49 'in DMS abspeichern'
        If strID = "" Then
            s = "Bitte in der Liste rechts das entsprechende File markieren!"
            GoTo ErrM
        End If
        If strD = "DMS" Then

        Else

        End If
        If InStr(strID, "\") = 0 Then
            s = "Das File ist bereits in DMS mit dieser ID!" & vbNewLine & _
                strID
            GoTo ErrM
        End If
        OH_ResetID
        strID = OH_RPL(strID)
        strSQL = "EXEC dbo.dms " & _
                "  @x = 'AddtoAblage' " & _
                ", @f ='" & strID & _
                "',@d ='" & OH_GetNamePart(strID) & _
                "',@n = 1" & _
                ", @i = " & Me!NrFunktion & _
                ", @a = " & Me!NrVG
            OH_EX
        OH_RQ Me!lstSchlagwort
    Case 20, 21, 22
        OH_EX
        OH_RQ Me!lstSchlagwort
        Me!lstSchlagwort.SetFocus
        Me!btnSave.Visible = lgA = 20
        If lgA = 22 Then
            Me!lstSchlagwort.SetFocus
            For Each ctl In fh.Controls
                If ctl.Tag = "v" Then
                    ctl.Visible = False
                End If
            Next ctl
        End If

    Case 50
        t = Me!lblSave.Caption
nochmalspeichern:
        strSQL = "Exec dbo.dms " & _
                " @x = 'SaveFiles'"
        OH_r r
        t = Me!lblSave.Caption
        If r.BOF Then
            If Nz(Me!Schlagwort, "") <> "" And Nz(Me!bemSchlagwort, "") <> "" Then
                Me!lstSchlagwortAct = 19
                lstSchlagwortAct_AfterUpdate
                GoTo nochmalspeichern
            End If
            s = "Keine markierten Files vorhanden!"
            GoTo ErrM
        Else
            If OH_FileCopyMove(r!nrID, strWie, Me!cboDelete, strFolderBase) <> "" Then
                DoCmd.Close acForm, Me.Name
            End If
        End If
        OH_RQ f!lstExplorer
        GoTo ErrEnd
    Case 51
        OH_closeObj "rptAnalysenZertifikat", acReport
        OH_closeObj glstrB_VG, acReport
        OH_CLoseForm
        GoTo ErrEnd
    End Select
    Select Case lgA
    Case 10, 11, 12, 13, 14
        Me!lstSchlagwortAct = 21
        lstSchlagwortAct_AfterUpdate
        Me!lstSchlagwortAct = 0
    End Select
    Me!cboDelete.Visible = lgA = 13
    If Me!cboDelete.Visible Then '260104 GERD
        strSQL = "Exec dbo.dms " & _
            "@x = 'setcboDelete'"
        OH_r r
        Me!cboDelete = r!cbodeleteStandard
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501, 2105
        Resume ErrEnd
    End Select
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.lstSchlagwortAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub tv_OLEDragDrop(data As Object, Effect As Long, Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    Dim varD As Variant
    Dim N As Long
    'https://www.vbforums.com/showthread.php?603290-Resoved-OLEDragDrop-Data-GetFormat-File-Types
    If (data.GetFormat(-16370) = True) Then 'e-mail attachment
        OH_Mail_to_DMS Me!NrFunktion, Me!NrVG, 11, False
    Else
        If (data.GetFormat(15) = True) Then 'e-mail attachment
            For Each varD In data.Files()
                N = N + 1
                s = OH_RPL(data.Files(N))
                strSQL = "EXEC dbo.dms " & _
                        "  @x = 'AddtoAblage' " & _
                        ", @f ='" & s & _
                        "',@d ='" & OH_GetNamePart(s) & _
                        "',@n = " & 1 & _
                        ", @i =  " & Me!NrFunktion & _
                        ", @a =  " & Me!NrVG
                OH_EX
            Next varD
        End If
    End If
    OH_RQ Me!lstSchlagwort
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.tv_OLEDragDrop"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Function OH_CLoseForm()
On Error GoTo ErrMsg
    OH_ResetID
    DoCmd.Close acForm, Me.Name
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.OH_CLoseForm"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Private Function OH_nextRecord()
On Error GoTo ErrMsg
    Dim lgRN As Long
    lgRN = Nz(Me!rn, 0)
    If lgRN >= Nz(Me!lstSchlagwort.column(6), 0) Then
        lgRN = 0
    End If
    Me!lstSchlagwort.SetFocus
    Me!lstSchlagwort.ListIndex = lgRN
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.OH_nextRecord"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Private Function OH_PrevRecord()
On Error GoTo ErrMsg
    Dim lgRN As Long
    lgRN = Nz(Me!rn, 0) - 1
    If lgRN < 1 Then
        lgRN = Nz(Me!lstSchlagwort.column(6), 0)
    End If
    Me!lstSchlagwort.SetFocus
    Me!lstSchlagwort.ListIndex = lgRN
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmSchlagwort.OH_PrevRecord"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
