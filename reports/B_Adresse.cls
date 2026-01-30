Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strL As String
    OH_SetFont Me, glstrFont
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Adresse.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
    'wenn Bericht keine Daten enthält, wird er geschlossen ohne Anzeige
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Adresse.Report_NoData"
    Resume ErrEnd
End Sub
