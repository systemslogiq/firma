Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intI As Integer
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    OH_SetFont Me, glstrFont
    If InStr(strMSG(4), "Ohne") > 0 Then
        Me.Det.Visible = False
    End If
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Info.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Info.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
'Farbe abwechselnd grau / weiss im Detailbereich
'wichtig : Name des Detailbereichs ist "Det"
On Error GoTo ErrMsg
    intI = intI + 1
    Me.Det.BackColor = vbWhite
    If intI > 1 Then
        Me.Det.BackColor = 14869218
        intI = 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Info.Det_Format"
    Resume ErrEnd
End Sub
Private Sub GKFun_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    x = OH_GetPic(Me!NrFunktion, "Bild")
    If Len(x) = 0 Then
        Me!Pic.Visible = False
    Else
        Me!Pic.Visible = True
        Me!Pic.picture = x
    End If
    If IsNull(Me!EndeFunktion) Then
        Me!EndeFunktion.BackColor = vbWhite
    Else
        Me!EndeFunktion.BackColor = vbRed
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Info.GKFun_Format"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!rptTitel = Nz(Forms!F_Adresse!StandardText, "Info")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Info.ph_Format"
    Resume ErrEnd
End Sub
