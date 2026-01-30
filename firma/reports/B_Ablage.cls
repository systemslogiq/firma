Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_OrdnerInhalt.Report_Open"
    End Select
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
    Me!EtikettenText.BackColor = Me!TextFarbe
End Sub
Private Sub Report_activate()
Dim strRegister As String
    strRegister = Format(Me!AnzahlRegister, "00")
    For i = 0 To Me.count - 1
        If left(Me(i).Name, 1) = "F" Then
            If Me(i).Name <= "F" & strRegister Then
                Me(i).Visible = True
                Me(i).FontSize = 10 + 200 / 2 / Val(strRegister)
            Else
                Me(i).Visible = False
            End If
        End If
    Next i
    OH_SetFont Me, glstrFont
End Sub
