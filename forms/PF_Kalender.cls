Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Form_Load()
On Error GoTo ErrMsg
    Dim strQ As String
    strQ = "Execute spa_Z1 @x = '"
    strSQL = strQ & "comShow'"
    OH_A "comshow", strSQL, Me
    OH_Number Me, Me!comStd, 24
    OH_Number Me, Me!comMin, 59
    strSQL = strQ & "lstKalenderVorwärts'"
    OH_A "lstKalenderVorwärts", strSQL, Me
    strSQL = strQ & "lstKalenderRückwärts'"
    OH_A "lstKalenderRückwärts", strSQL, Me
    strSQL = strQ & "lstactKalender'"
    OH_A "lstactKalender", strSQL, Me
    Me!lstKalenderVorwärts = "heute"
    lstKalenderVorwärts_AfterUpdate
    Me!Heute.Caption = " Heute: " & Format(Now(), "dddd dd. mmmm yyyy")

ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Kalender.Form_Load"
    Resume ErrEnd
End Sub
Public Sub OH_K(Optional strK As String, Optional lgVR As Long = 1)
On Error GoTo ErrMsg
    Dim datMStart As Date
    Dim datMEnd As Date
    Dim w As Long
    Dim d As Date
    Dim lgO As Long
    Select Case strK
    Case "vorwärts"
        Me!MY = DateAdd("d", 1, Me!MY)
    Case "rückwärts"
        Me!MY = DateAdd("d", -1, Me!MY)
    Case "1 Monat"
        Me!MY = DateAdd("m", lgVR, Me!MY)
    Case "1 Jahr"
        Me!MY = DateAdd("yyyy", lgVR, Me!MY)
    Case "Heute", ""
        Me!MY = Date
    Case "morgen"
        Me!MY = DateAdd("d", 1, Date)
    Case "übermorgen"
        Me!MY = DateAdd("d", 2, Date)
    Case "1 Woche"
        Me!MY = DateAdd("ww", lgVR, Me!MY)
    Case "viertel Jahr"
        Me!MY = DateAdd("q", lgVR, Me!MY)
    Case "halbes Jahr"
        Me!MY = DateAdd("q", 2 * lgVR, Me!MY)
    Case "10 Jahre"
        Me!MY = DateAdd("yyyy", 10 * lgVR, Me!MY)
    Case "gestern"
        Me!MY = DateAdd("d", -1, Date)
    Case "vorgestern"
        Me!MY = DateAdd("d", -2, Date)
    Case "Datum Löschen"

    End Select

    'Monatsanfang & -ende bestimmen
    datMStart = Primo(Me!MY)
    datMEnd = Ultimo(Me!MY)

    'Offset setzen
    lgO = Weekday(datMStart, vbMonday)    'vbMonday um die Woche mit Montag zu beginnen
    If lgO < 2 Then lgO = 8

    For i = 1 To 42
        With Me("k" & i)
            .BackColor = Me.Det.BackColor
            .ForeColor = vbBlack
            .BorderStyle = 1
            d = DateAdd("d", i - lgO, datMStart)
            .Tag = d
            .ControlTipText = Format(d, "dddd, dd.mmmm yyyy")
            .Value = Day(d)
            Select Case d
            Case Is < datMStart
                .ForeColor = RGB(128, 128, 128)
            Case Is > datMEnd
                .ForeColor = RGB(128, 128, 128)
            Case Else
                If i Mod 7 = 0 Then
                    .ForeColor = vbRed
                End If
            End Select
            '  Kalenderwoche berechnen alle 7 Tage
            If i Mod 7 = 0 Then
                w = w + 1
                Me("w" & w) = DatePart("ww", d, vbMonday, vbUseSystem)
            End If
            If d = Me!MY Then
                .BackColor = RGB(171, 171, 171)
                .BorderStyle = 1
            End If
        End With
    Next i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub lstActKalender_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    lgact = Nz(Me!lstactKalender, 0)
    Select Case lgact
    Case 10
        OH_Kr 0
    Case 20
        DoCmd.Close acForm, Me.Name
    Case 30
        ctl = Null
        DoCmd.Close acForm, Me.Name
    End Select
errExit:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstActKalender_AfterUpdate"
    Resume errExit
End Sub
Private Sub lstKalenderVorwärts_AfterUpdate()
On Error GoTo ErrMsg
    OH_K Me!lstKalenderVorwärts, 1
    Me!lstKalenderRückwärts = ""
errExit:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume errExit
End Sub
Private Sub lstKalenderRückwärts_AfterUpdate()
On Error GoTo ErrMsg
    OH_K Me!lstKalenderRückwärts, -1
    Me!lstKalenderVorwärts = ""
errExit:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume errExit
End Sub
Private Sub comStd_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!comMin) Then
        Me!comMin = 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub OH_Kr(kd As Integer)
On Error GoTo ErrMsg
    Dim varK As Variant
    Dim strK As String
    t = "Kalender-Funktion"
    x = Null
    Select Case kd
    Case 0
        varK = Me!MY
    Case Else
        strK = Nz(Me("K" & kd).Tag, 0)
        varK = CDate(strK)
    End Select
    If Nz(Me!comStd, "") <> "" Then
        varK = varK & " " & Format(Me!comStd, "00")
        varK = varK & ":" & Format(Nz(Me!comMin, 0), "00")
    End If
    If ctl <> varK Or IsNull(ctl) Then
        Select Case Me!comShow
        Case "Datum"
            strK = lg(Format(varK, "dddd")) & ", " & varK
        Case "Datum lang"
            strK = lg(Format(varK, "dddd")) & ", " & varK
            varK = strK
        Case "KW"
            strK = lg("KW") & " " & Format(DatePart("WW", varK), "00") & "-" & Year(varK)
            varK = strK
        Case "Monat"
            strK = lg(Format(varK, "mmmm")) & " " & Year(varK)
            varK = strK
        Case "Jahr"
            strK = lg("Jahr") & " " & Year(varK)
            varK = strK
        End Select
    End If
    If Nz(ctl, "") <> varK Then
        ctl = varK
        If ctl.Parent.Name = "UF_txt" Then
            Forms!F_VG!UF_txt.Form.OH_SaveRecord
        End If
    End If
    OH_CB (strK)
    SysCmd acSysCmdSetStatus, strK & ": das ausgewählte Datum ist jetzt auch im Zwischenspeicher"
    Beep
    ctl.SetFocus
    DoCmd.Close acForm, Me.Name
    s = ""
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 91, 2467
        Resume ErrEnd
    Case 2113, 2185 'kein focus 'Wert nicht zulässig
        s = Me!comShow & ":  " & varK & vbNewLine & "Dieser Wert ist nicht geeignet!"
    End Select
    s = Err & " " & Err.Description & vbNewLine & vbNewLine & s
    MsgBox s, vbCritical, "Kalender-Wert eintragen!"
Resume ErrEnd
End Sub
Public Sub OH_MM(kd As Integer)
On Error GoTo ErrMsg
    For i = 1 To 42
        If CDate(Me("k" & i).Tag) <> Me!MY And Me("k" & i).BackColor <> Me.Det.BackColor Then
            Me("k" & i).BackColor = Me.Det.BackColor
        End If
    Next i
    Me("k" & kd).BackColor = RGB(140, 175, 175)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MM"
    Resume ErrEnd
End Sub
Private Sub Heute_Click()
    OH_K "Heute"
End Sub
Private Sub k1_Click()
    OH_Kr 1
End Sub
Private Sub k2_Click()
    OH_Kr 2
End Sub
Private Sub k3_Click()
    OH_Kr 3
End Sub
Private Sub k4_Click()
    OH_Kr 4
End Sub
Private Sub k5_Click()
    OH_Kr 5
End Sub
Private Sub k6_Click()
    OH_Kr 6
End Sub
Private Sub k7_Click()
    OH_Kr 7
End Sub
Private Sub k8_Click()
    OH_Kr 8
End Sub
Private Sub k9_Click()
    OH_Kr 9
End Sub
Private Sub k10_Click()
    OH_Kr 10
End Sub
Private Sub k11_Click()
    OH_Kr 11
End Sub
Private Sub k12_Click()
    OH_Kr 12
End Sub
Private Sub k13_Click()
    OH_Kr 13
End Sub
Private Sub k14_Click()
    OH_Kr 14
End Sub
Private Sub k15_Click()
    OH_Kr 15
End Sub
Private Sub k16_Click()
    OH_Kr 16
End Sub
Private Sub k17_Click()
    OH_Kr 17
End Sub
Private Sub k18_Click()
    OH_Kr 18
End Sub
Private Sub k19_Click()
    OH_Kr 19
End Sub
Private Sub k20_Click()
    OH_Kr 20
End Sub
Private Sub k21_Click()
    OH_Kr 21
End Sub
Private Sub k22_Click()
    OH_Kr 22
End Sub
Private Sub k23_Click()
    OH_Kr 23
End Sub
Private Sub k24_Click()
    OH_Kr 24
End Sub
Private Sub k25_Click()
    OH_Kr 25
End Sub
Private Sub k26_Click()
    OH_Kr 26
End Sub
Private Sub k27_Click()
    OH_Kr 27
End Sub
Private Sub k28_Click()
    OH_Kr 28
End Sub
Private Sub k29_Click()
    OH_Kr 29
End Sub
Private Sub k30_Click()
    OH_Kr 30
End Sub
Private Sub k31_Click()
    OH_Kr 31
End Sub
Private Sub k32_Click()
    OH_Kr 32
End Sub
Private Sub k33_Click()
    OH_Kr 33
End Sub
Private Sub k34_Click()
    OH_Kr 34
End Sub
Private Sub k35_Click()
    OH_Kr 35
End Sub
Private Sub k36_Click()
    OH_Kr 36
End Sub
Private Sub k37_Click()
    OH_Kr 37
End Sub
Private Sub k38_Click()
    OH_Kr 38
End Sub
Private Sub k39_Click()
    OH_Kr 39
End Sub
Private Sub k40_Click()
    OH_Kr 40
End Sub
Private Sub k41_Click()
    OH_Kr 41
End Sub
Private Sub k42_Click()
    OH_Kr 42
End Sub
Private Sub k1_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 1
End Sub
Private Sub k2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 2
End Sub
Private Sub k3_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 3
End Sub
Private Sub k4_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 4
End Sub
Private Sub k5_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 5
End Sub
Private Sub k6_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 6
End Sub
Private Sub k7_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 7
End Sub
Private Sub k8_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 8
End Sub
Private Sub k9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 9
End Sub
Private Sub k10_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 10
End Sub
Private Sub k11_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 11
End Sub
Private Sub k12_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 12
End Sub
Private Sub k13_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 13
End Sub
Private Sub k14_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 14
End Sub
Private Sub k15_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 15
End Sub
Private Sub k16_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 16
End Sub
Private Sub k17_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 17
End Sub
Private Sub k18_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 18
End Sub
Private Sub k19_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 19
End Sub
Private Sub k20_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 20
End Sub
Private Sub k21_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 21
End Sub
Private Sub k22_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 22
End Sub
Private Sub k23_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 23
End Sub
Private Sub k24_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 24
End Sub
Private Sub k25_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 25
End Sub
Private Sub k26_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 26
End Sub
Private Sub k27_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 27
End Sub
Private Sub k28_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 28
End Sub
Private Sub k29_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 29
End Sub
Private Sub k30_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 30
End Sub
Private Sub k31_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 31
End Sub
Private Sub k32_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 32
End Sub
Private Sub k33_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 33
End Sub
Private Sub k34_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 34
End Sub
Private Sub k35_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 35
End Sub
Private Sub k36_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 36
End Sub
Private Sub k37_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 37
End Sub
Private Sub k38_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 38
End Sub
Private Sub k39_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 39
End Sub
Private Sub k40_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 40
End Sub
Private Sub k41_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 41
End Sub
Private Sub k42_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    OH_MM 42
End Sub
