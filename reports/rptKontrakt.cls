Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intI As Integer
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_B @x = '" & Me.Name & "'"
    'Me.RecordSource = strSQL
    Cancel = OH_B(Me, , , strSQL)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptKontrakt.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptKontrakt.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!ReportTitel = t
    If Val(strMSG(3)) = 124 Then
        Me!txtAnhang = "Anhang zu Mail vom " & Date
    End If
    Me!Logo.picture = Nz(Me!logoFile)
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2220
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptKontrakt.ph_Format"
    End Select
    Resume ErrEnd
End Sub
