Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    OH_SetFont Me, glstrFont
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_UB_Stichwort.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    OH_LayoutMarker Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_UB_Stichwort.Det_Format"
    Resume ErrEnd
End Sub
