Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = OH_B(Me)
    OH_SetFont Me, glstrFont
    If Len(t) = 0 Then
        Me!ReportTitel.Caption = "Zusammenfassung"
    Else
        Me!ReportTitel.Caption = t
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotal.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotal.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub GKQK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim blKasse As Boolean
    If Me!IDQK = 52 Then
        blKasse = False
    Else
        blKasse = True
    End If
    Me!VGDat2.Visible = blKasse
    Me!Dat2.Visible = blKasse
    Me!MWStML.Visible = blKasse
    Me!MWST2.Visible = blKasse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotal.GKQK_Format"
    Resume ErrEnd
End Sub
Private Sub SK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    If Me!Loc1 = "EUR" Then
        For i = 1 To 5
            Me("EUR" & i).Visible = False
            Me("Loc" & i).left = Me!EUR1.left
        Next i
        Me!MWStML.left = Me!EUR1.left - Me!MWStML.Width
        Me!MWST2.left = Me!MWStML.left
        Me!Projektname.Width = Me!MWStML.left - Me!Projektname.left
        Me!bezProjektname.Width = Me!Projektname.Width
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotal.SK_Format"
    Resume ErrEnd
End Sub
