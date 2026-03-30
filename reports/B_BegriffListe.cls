Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_BegriffListe.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_BegriffListe.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub SK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!strReportTitel.Caption = t
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_BegriffListe.SK_Format"
    Resume ErrEnd
End Sub
