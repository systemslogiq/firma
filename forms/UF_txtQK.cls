Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    DoCmd.Hourglass True
    Select Case Parent.Name
    Case "F_QK"
        DoCmd.openForm "pfrmtxt", , , , , , "QK"
        OH_FB Forms!pfrmtxt, "nrTxt = " & Me!NrTxt, "txtV"
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txtQK.Form_DblClick"
    Resume ErrEnd
End Sub

Private Sub txt_AfterUpdate()
On Error GoTo ErrMsg
    Me!NrQK = Parent!IDQK
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txtQK.txt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon Me!txt, Nz(Me!txtV)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txtQK.txt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub TxtNr_AfterUpdate()
On Error GoTo ErrMsg
    If Nz(Me!NrTxt, 0) > 0 Then
        OH_ResetNr Me, "TxtNr", Me!TxtNr, Me!NrTxt, , Parent!IDQK
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txtQK.TxtNr_AfterUpdate"
    Resume ErrEnd
End Sub
