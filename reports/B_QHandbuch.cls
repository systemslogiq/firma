Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Me!strReportTitel.Caption = t
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_QHandbuch.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_QHandbuch.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub rh_Format(Cancel As Integer, FormatCount As Integer)
    Me!Logo.picture = OH_GetPic(EFNrFktn, "+Logo oben")
    Me!strReportTitel.Caption = "Qualitäts -Management - Handbuch" & vbNewLine & EFFirma
End Sub

Private Sub pf_Format(Cancel As Integer, FormatCount As Integer)
    Me!txtpf = Now() & " QM-Handbuch " & EFFirma
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Select Case Me!ebene
    Case 1
        Me.Det.BackColor = 12040119
    Case 2
        Me.Det.BackColor = 13882323
    Case 3
        Me.Det.BackColor = 14737632
    Case Else
        Me.Det.BackColor = vbWhite
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_QHandbuch.Det_Format"
    Resume ErrEnd
End Sub
