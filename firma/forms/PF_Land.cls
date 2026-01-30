Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_Move Me, 50, 10, 210, 210
    '170115 auf Wunsch von PG
    s = "Tages-Kurs" & vbNewLine & _
        "Wird nur benutzt für den Umrechnungsfaktor (= Kurs) bei Vorgänge" & _
        "NICHT verwendet z.B. für Berechnung von Artikel-Preisen"
    Me!TagesKurs.ControlTipText = s
    strSQL = "Execute spa_Z @x = 'lstLandOB'"
    OH_A "lstlandOB", strSQL, Me
    Me!lstLAndOB = "DBLAND"
    lstLAndOB_AfterUpdate
    OH_SetRS Me, , strSQL
    strSQL = "Execute spa_VG @x = 'VGWährung'"
    OH_A "Währung", strSQL, Me
    strSQL = "Exec dbo.spa_Z @x = 'VGSprache'"
    OH_A "Sprache", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_PF_Land: Form_Load"
    Resume ErrEnd
End Sub
Private Sub DBLand_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub DBLand_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!DBLand.OldValue = True Then
        Cancel = True
        Me.Undo
        OH_SaveRS
    Else
        If InputBox("Achtung: Sie wechseln das für die Datenbank massgebende Land (Kurse, Währungen etc.)!!!" & vbNewLine & vbNewLine & _
                    "Bitte mit einem <JA> bestätigen!", _
                    "WICHTIGE Änderung", "NEIN") <> "JA" Then
            Cancel = True
            Me.Undo
            OH_SaveRS
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Dim strL As String
    strL = Me!LandKZ
    OH_RQf Me
    MsgBox "Land" & vbNewLine & strL & vbNewLine & "wurde abgespeichert und einsortiert!", _
            vbExclamation, "Länderbearbeitung"
    OH_FB Me, "landKZ ='" & strL & "'"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me.NewRecord Then
        Me!DBLand = 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub lstLAndOB_AfterUpdate()
    strSQL = "Execute spa_Z @x = 'RS_PF_Land', @f = '" & Me!lstLAndOB & "'"
    OH_SetRS Me, , strSQL
End Sub
