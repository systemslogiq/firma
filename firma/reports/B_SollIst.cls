Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    OH_SetFont Me, glstrFont
    strSQL = "Exec dbo.spa_B " & _
            " @x = 'B_SollIst', " & _
            " @f = '" & Nz(Me.OpenArgs) & "'"
    Cancel = OH_B(Me, , , strSQL)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_SollIst.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_SollIst.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim sgV As Single
    Dim sgB As Single
    sgV = Nz(Me!verrechnet, 0)
    sgV = Int((sgV * 100) + 0.5) / 100
    sgB = Nz(Me!bestellt, 0)
    sgB = Int((sgB * 100) + 0.5) / 100
    If sgV > sgB Then
        Me!Diff.ForeColor = vbRed
        Me!Diff = "-"
    End If
    If sgV < sgB Then
        Me!Diff.ForeColor = vbGreen
        Me!Diff = "+"
    End If
    If sgV = sgB Then
        Me!Diff.ForeColor = vbBlack
        Me!Diff = "="
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_SollIst.Det_Format"
    Resume ErrEnd
End Sub
Private Sub SK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!strReportTitel.Caption = t
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_SollIst.SK_Format"
    Resume ErrEnd
End Sub
Private Sub Report_Close()
On Error GoTo ErrMsg
    OH_ResetRS r
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_SollIst.Report_Close"
    Resume ErrEnd
End Sub
