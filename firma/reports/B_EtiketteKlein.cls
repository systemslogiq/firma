Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Set frm = Forms!F_Adresse
    OH_EFAbsender frm!NrMitarbeiter
    If InStr(frm!comAnschrift, "Privat") Then
        i = MsgBox("Soll der Absender" & vbNewLine & _
                    EFAbsenderKlein & vbNewLine & _
                    "erscheinen?", vbQuestion + vbYesNoCancel, Me.Caption)
        Select Case i
        Case vbYes
            Me!TX_Absender.Caption = EFAbsenderKlein
        Case vbNo
            Me!TX_Absender.Caption = ""
        Case vbCancel
            Cancel = True
            GoTo ErrEnd
        End Select
    Else
        Me!TX_Absender.Caption = EFAbsenderKlein
    End If
    OH_SetFont Me, glstrFont
    strSQL = "Exec dbo.spa_B B_Etikette," & _
            frm!NrFunktion & ",0,'" & _
            frm!comAnschrift & "','" & _
            OH_RPL(frm!Anschrift) & "'"
    'Me.RecordSource = strSQL
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteKlein.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteKlein.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Report_Page()
'zurücksetzen für Etikettendruck
On Error GoTo ErrMsg
    lgLeerAnzahl = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteKlein.Report_Page"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    OH_Etikette2 Me
    If Me!LenN > 30 Then
        Me!Adr.FontName = "Arial Narrow"
    Else
        Me!Adr.FontName = "Times New Roman"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteKlein.Det_Format"
    Resume ErrEnd
End Sub
