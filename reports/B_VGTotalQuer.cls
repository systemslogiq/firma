Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    If OH_B(Me) Then
        GoTo ErrEnd
    End If
    OH_SetFont Me, glstrFont
    If Len(t) = 0 Then
        Me!ReportTitel.Caption = "Zusammenfassung"
    Else
        Me!ReportTitel.Caption = t
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotalQuer.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotalQuer.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    If Me!Achtung Like "x" Then
        Me!Nummer.BackColor = vbRed
    Else
        Me!Nummer.BackColor = vbWhite
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotalQuer.Det_Format"
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
    Me!MWSt1.Visible = blKasse
    Me!MWST2.Visible = blKasse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotalQuer.GKQK_Format"
    Resume ErrEnd
End Sub
Private Sub SK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    If Me!WaehrungML = "EUR" Then
        For i = 1 To 5
            Me("EUR" & i).Visible = False
            Me("Loc" & i).Width = 2 * Me!EUR1.Width
        Next i
    End If
    Me!Loc1.Caption = "Netto in" & vbNewLine & Me!WaehrungML
    Me!Loc.Caption = "Brutto in" & vbNewLine & Me!WaehrungML
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "B_VGTotalQuer.SK_Format"
    Resume ErrEnd
End Sub
