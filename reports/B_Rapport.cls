Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim lgmin As Long
Dim lgmax As Long
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Me!strReportTitel.Caption = t
    OH_SetFont Me, glstrFont
    Cancel = OH_B(Me)
    lgmax = 0
    lgmin = CLng(Date)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Rapport.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Rapport.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim lgD As Long
    lgD = Me!DatumTag
    If lgD < lgmin Then
        lgmin = lgD
    End If
    If lgD > lgmax Then
        lgmax = lgD
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Rapport.Det_Format"
    Resume Next
End Sub
Private Sub gf1_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim strMax As String
    Dim strMin As String
    strMin = Format(CDate(lgmin), "dd. mmmm yyyy")
    If lgmax > lgmin Then
        strMax = "  bis  " & Format(CDate(lgmax), "dd. mmmm yyyy")
        If Year(lgmax) = Year(lgmin) Then
            strMin = Format(CDate(lgmin), "dd. mmmm")
            If Month(lgmax) = Month(lgmin) Then
                strMin = Format(CDate(lgmin), "dd.")
            End If
        End If
        strMin = "vom  " & strMin
    End If
    Me!vonBis = strMin & strMax
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Rapport.gf1_Format"
    Resume Next
End Sub
