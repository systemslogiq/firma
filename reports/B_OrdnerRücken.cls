Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgH As Long
    Dim N As Long
    strSQL = "Exec dbo.spa_Ablage " & _
            " @x = '+Logo Ordner'" & _
            ",@i = " & EFNrFktn
    OH_r r
    If r.BOF Then
        lgH = 190
    Else
        lgH = Val(r!h)
    End If
nochmal:
    s = "Wie hoch ist der Ordner-Rücken (in mm)" & vbNewLine & vbNewLine & _
               "Zahl zwischen 110 und 200 eingeben" & vbNewLine & _
               lgH & " ist unsere Standard-Grösse!"
    lgH = Val(InputBox(s, t, lgH))
    Select Case lgH
    Case 0
        Cancel = True
        Exit Sub
    Case Is < 110
        MsgBox "Kleiner 110 geht nicht!", vbCritical, t
        GoTo nochmal
    Case Is > 200
        MsgBox "Grösser 200 geht nicht!", vbCritical, t
        GoTo nochmal
    End Select
    If right(t, 5) = "Breit" Then
        For Each ctl In Me.Controls
            'If Not left(ctl.Name, 4) = "Logo" Then
                ctl.Width = 4.6 * 567  '(1 Cm sind 567 Twips)
            'End If
        Next ctl
    End If
    OH_SetFont Me, glstrFont
    Cancel = OH_B(Me)
    Me!ReOrdner.Height = lgH / 10 * 567
    N = Me!x6.top - Me!x1.top
    i = lgH * 56.7 - Me!x1.top - Me!x6.Height
    i = i * 10 / N
    For N = 1 To 6
        If N <> 6 Then
            Me("x" & N).Height = Me("x" & N).Height * i / 10
        Else
            Me!x6.top = lgH * 56.7 - Me!x6.Height - 50
        End If
        If N > 1 And N < 6 Then
            Me("x" & N).top = Me("x" & N - 1).top + Me("x" & N - 1).Height
        End If
    Next N
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_OrdnerRücken.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_OrdnerRücken.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!AblageArt.BackColor = Nz(Me!TextFarbe, vbWhite)
    Me!x6.BackColor = Nz(Me!TextFarbe, vbWhite)
    Me!logoOrdner.picture = OH_GetPic(Me!EFNrFun, "+Logo Ordner")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_OrdnerRücken.Det_Format"
    Resume ErrEnd
End Sub
Private Sub Report_Close()
On Error GoTo ErrMsg
    VarAntw = vbNullString
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_OrdnerRücken.Report_Close"
    Resume ErrEnd
End Sub
