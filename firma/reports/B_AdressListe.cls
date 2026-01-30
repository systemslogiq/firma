Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intI As Integer
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strSort As String
    Dim strL As String
    OH_SetFont Me, glstrFont
    i = MsgBox("Sortierung nach" & vbNewLine & _
             "JA" & vbTab & "Nachname" & vbNewLine & _
             "Nein" & vbTab & "Firma", vbQuestion + vbYesNoCancel, Me.Caption)
    Select Case i
    Case vbYes, vbNo
        strSQL = "Exec dbo.spa_B B_AdressListe,0," & i
    Case vbCancel
        Cancel = True
        Exit Sub
    End Select
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_AdressListe.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg    'wenn Bericht keine Daten enthält, wird er geschlossen ohne Anzeige
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_AdressListe.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
'msgbox Me!Name & vbTab & Me!tel
'Farbe abwechselnd grau / weiss im Detailbereich
'wichtig : Name des Detailbereichs ist "Det"
    intI = intI + 1
    Me.Det.BackColor = vbWhite
    If intI > 1 Then
        Me.Det.BackColor = 14869218
        intI = 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_AdressListe.Det_Format"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!strReportTitel.Caption = t
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_AdressListe.ph_Format"
    Resume ErrEnd
End Sub
