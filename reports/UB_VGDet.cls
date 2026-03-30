Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    OH_SetFont Me, glstrFont
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_UB_VGDet.Report_Open"
    Resume ErrEnd
End Sub
