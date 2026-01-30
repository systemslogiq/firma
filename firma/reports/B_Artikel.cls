Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_NoData(Cancel As Integer)
    Cancel = True
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
    Me!strReportTitel.Caption = t
End Sub
Private Sub Report_Open(Cancel As Integer)
' OH 22. August 2006
On Error GoTo ErrMsg
    i = strMSG(3)
    Select Case i
    Case 307
        Me!KalkVP.Visible = False
        Me!VKWährung.Visible = False
        Me!Einkaufspreis.Visible = False
        Me!EKWährung.Visible = False
        Me!ArtikelRabatt100.Visible = False
    End Select
    Dim strL As String
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Artikel.Report_Open"
    End Select
    Resume ErrEnd
End Sub
