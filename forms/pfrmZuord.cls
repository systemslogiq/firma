Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strA As String
Dim f As Form
Dim lgC As Long
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
Dim strOA As String
    Dim A As Long
    Dim N As Long
    t = "Wiedervorlage"
    strOA = Nz(Me.OpenArgs)
    A = Mid(strOA, 2, 2)
    Select Case A
    Case Is <> 30
        N = 0
    Case Else
        N = Mid(strOA, 4)
    End Select
    strA = "Exec dbo.spa_Adresse " & _
           "  @x = 'Wiedervorlage'"
    Select Case left(strOA, 1)
    Case "F"
        Set f = Forms!F_Adresse
        strSQL = strA & _
                ", @a = " & A & _
                ", @i = " & f!NrFunktion & _
                ", @u = " & lguser & _
                ", @n = " & N
    Case "V"
        Set f = Forms!F_VG
        strSQL = strA & _
                ", @a = " & A & _
                ", @i = " & f!NrFunktion & _
                ", @z = " & f!NrVG & _
                ", @u = " & lguser & _
                ", @n = " & N
        t = "Wiedervorlage zu einem Vorgang"
    Case Else
        Cancel = True
        GoTo ErrEnd
    End Select
    OH_r r
    Me!ID = r!ID
    Me!idf = r!idf
    Me!idV = r!idV
    Me!x = r!x
    Me!d = r!d
    Me!m = r!m
    Me!p = r!p
    Me!txt = r!t
    Me.Caption = t
    strSQL = strA & _
            ", @a = 2 " & _
            ", @b = " & A & _
            ", @u = " & lguser & _
            ", @n = " & N

    'Me!m.RowSource = strSQL
    OH_A "m", strSQL, Me
    strSQL = strA & _
            ", @a = 3"
    'Me!comD.RowSource = strSQL
    OH_A "comD", strSQL, Me
    strSQL = strSQL & _
            ",@f = 'Uhrzeit'"
    OH_A "comUhrzeit", strSQL, Me
    'Me!comUhrzeit.RowSource = strSQL
    strSQL = strA & _
            ", @a = 102"
    OH_A "lstAct", strSQL, Me
    Select Case A
    Case 10
        Me!m = lguser
        Me!d.SetFocus
    Case 20
        Me!m = Null
        Me!m.SetFocus
        Me!m.Dropdown
    Case 21
        Me!m = -1
        Me!d.SetFocus
    Case Else
        Me!lstact.SetFocus
    End Select
    If Me!ID = 0 Then
        comUhrzeit_AfterUpdate
    Else
        Me!comUhrzeit = Mid(Me!d, 10, 5)
    End If
    Me.Move 13 * 567, 1 * 567, 21 * 567, 13.5 * 567
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.Form_Open"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    OH_RQ f!lstWv, Me!ID
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.Form_Close"
    Resume ErrEnd
End Sub
Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim dstart As Date
    Dim strS As String
    Dim strEmail As String
    Dim lgact As Long
    t = Nz(Me!lstact.column(1), "")
    lgact = Nz(Me!lstact, 10)
    DoCmd.Hourglass True
    Select Case lgact
    Case 0
        DoCmd.Close acForm, Me.Name
    Case 50
        If mdl_Outlook.OH_FindAppointment(CStr(Nz(Me!ID, 0))) = False Then
            s = "Eintrag ist nicht zu finden"
            GoTo ErrM
        End If
    Case 60 'Termin in Outlook löschen...'
        'nutze Feld Mileage, um die ID zu speichern
        s = "Eintrag in Outlook löschen?"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
            If mdl_Outlook.OH_DeleteAppointment(CStr(Nz(Me!ID, 0))) = False Then
                s = "Eintrag ist nicht zu finden"
                GoTo ErrM
            End If
        End If
    Case 70 'KOMPLETT löschen......'
        'nutze Feld Mileage, um die ID zu speichern
        s = "Diese Wiedervorlage und ggf. Outlook-Eintrag löschen und schliessen?"
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
            strSQL = strA & _
                    " ,@a = 170 " & _
                    " ,@i = " & Me!ID
            OH_EX
            mdl_Outlook.OH_DeleteAppointment (CStr(Nz(Me!ID, 0)))
            f.regD_Change
            DoCmd.Close acForm, Me.Name
        End If
    Case Else
        t = Me.Caption
        For Each ctl In Det.Controls
            Select Case ctl.ControlType
            Case acComboBox, acTextBox
                If ctl.BorderColor = Me!ID.BorderColor And Nz(ctl, "") = "" Then
                    ctl.SetFocus
                    s = "Alle rot umrandeten Felder müssen ausgefüllt sein"
                    GoTo ErrM
                End If
            End Select
        Next ctl
        If Me!m = -1 Then
            s = "Bitte bestätigen Sie, dass das für   A L L E   Mitarbeiter gelten soll!"
            If MsgBox(s, vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        strSQL = strA & _
                " ,@a = 100 " & _
                " ,@i = " & Me!idf & _
                " ,@u = " & Me!m & _
                " ,@n = " & Me!ID & _
                " ,@b = " & Me!p & _
                " ,@dt = '" & Format(Me!d, "yyyymmdd hh:nn") & _
                "' ,@d = '" & OH_RPL(Me!txt) & "'"
        If f.Name = "F_VG" Then
            strSQL = strSQL & _
                    ", @z = " & Nz(Me!idV, 0)
        End If
        OH_r r
        If r!ID > 0 Then
            Me!ID = r!ID
            OH_RQ f!lstWv
        Else
            s = "Änderung wurde nicht akzeptiert!"
            GoTo ErrM
        End If
        If lgact > 10 Then
             strSQL = strA & _
                     " ,@a = 101" & _
                    " ,@i = " & Me!idf
            OH_r r
            dstart = Format(Me!d, "DD.MM.YYYY HH:NN")
            strS = r!Vornachname & ": Wiedervorlage"
            strEmail = "-"
            If lgact > 20 Then
                strEmail = r!EMail
            End If
            If lgact <> 40 Then
                'nutze Feld Mileage, um die ID einzutragen
                mdl_Outlook.OH_DeleteAppointment CStr(Nz(Me!ID, 0))
                mdl_Outlook.OH_OutlookAppointment _
                    strEmail, _
                    strS, _
                    CStr(dstart), _
                    Format(DateAdd("m", 30, Me!d), "DD.MM.YYYY HH:NN"), _
                    Application.PlainText(Nz(Me!txt)), _
                    "--", _
                    30, _
                    True, _
                    30, _
                    CStr(Me!ID)
            End If
            If lgact = 40 Then
                s = "<br><br>" & OH_rtf2html3(Nz(Me!txt))
                OH_OutlookMail _
                    strEmail, _
                    strS, _
                   s, , , , , , , f
            End If
        Else
            DoCmd.Close acForm, Me.Name
        End If
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.OH_ok"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub comUhrzeit_AfterUpdate()
On Error GoTo ErrMsg
    Me!d = Format(Me!d, "dd.mm.yy") & " " & Me!comUhrzeit
    Me!txt.SetFocus
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.comUhrzeit_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comD_AfterUpdate()
On Error GoTo ErrMsg
    Dim dt As Date
    dt = DateAdd("D", Me!comD, Date)
    If Me!d <> dt Then
        Me!d = dt
    End If
    comUhrzeit_AfterUpdate
    Me!d.SetFocus
    Me!comD = -1
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.comD_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub d_AfterUpdate()
On Error GoTo ErrMsg
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.d_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub m_AfterUpdate()
On Error GoTo ErrMsg
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.m_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub p_AfterUpdate()
On Error GoTo ErrMsg
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.p_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub p_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    lgC = 1
    Me!p = Me!p + 1
    If Me!p > 3 Then
        Me!p = 1
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.p_DblClick"
    Resume ErrEnd
End Sub
Private Sub d_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!d = Me!d + 1
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.d_DblClick"
    Resume ErrEnd
End Sub
Private Sub txt_AfterUpdate()
On Error GoTo ErrMsg
    lgC = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmZuord.txt_AfterUpdate"
    Resume ErrEnd
End Sub
