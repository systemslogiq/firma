Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

' ============================================================================
' Formular PF_SqlLogin - Maskierte Eingabe von SQL-Benutzer und -Passwort.
'
' Benoetigte Steuerelemente:
'   txtUser     Textfeld   Beschriftung "Benutzername:"
'   txtPwd      Textfeld   Beschriftung "Passwort:"       EingabeMaske = "Password"
'   chkShow     Kontrollk. Beschriftung "Passwort anzeigen"
'   btnOK       Befehlsk.  Beschriftung "OK"              Standard = Ja
'   btnCancel   Befehlsk.  Beschriftung "Abbrechen"       Abbrechen = Ja
'
' Rueckgabe ueber die Public-Variablen im Modul mdl_sql_Login:
'   gblSqlLoginOK   True wenn OK, False wenn Abbrechen
'   gstrSqlLoginUser
'   gstrSqlLoginPwd
' ============================================================================

Private Sub Form_Load()
On Error GoTo ErrMsg
    ' Reset
    gblSqlLoginOK = False
    Me!txtUser = gstrSqlLoginUser    ' evtl. vorbelegter Benutzer
    Me!txtPWd = ""
    Me!chkShow = False
    Apply_MaskFromCheckbox
    If Len(Nz(Me!txtUser, "")) = 0 Then
        Me!txtUser.SetFocus
    Else
        Me!txtPWd.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_SqlLogin.Form_Load"
    Resume ErrEnd
End Sub

Private Sub chkShow_Click()
    Apply_MaskFromCheckbox
End Sub

Private Sub Apply_MaskFromCheckbox()
On Error Resume Next
    If Me!chkShow = True Then
        Me!txtPWd.InputMask = ""        ' Klartext -> zur Kontrolle sichtbar
    Else
        Me!txtPWd.InputMask = "Password"
    End If
End Sub

Private Sub btnOK_Click()
Debug.Print "[PF_SqlLogin] btnOK_Click aufgerufen"
On Error GoTo ErrMsg
    Dim strU As String, strP As String
    strU = Nz(Me!txtUser, "")
    strP = Nz(Me!txtPWd, "")
    If Len(strU) = 0 Then
        MsgBox "Benutzername ist erforderlich.", vbExclamation, "SQL-Anmeldung"
        Me!txtUser.SetFocus
        GoTo ErrEnd
    End If
    If Len(strP) = 0 Then
        MsgBox "Passwort ist erforderlich.", vbExclamation, "SQL-Anmeldung"
        Me!txtPWd.SetFocus
        GoTo ErrEnd
    End If
    gstrSqlLoginUser = strU
    gstrSqlLoginPwd = strP
    gblSqlLoginOK = True
    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_SqlLogin.btnOK_Click"
    Resume ErrEnd
End Sub

Private Sub btnCancel_Click()
Debug.Print "[PF_SqlLogin] btnCancel_Click aufgerufen"
    gblSqlLoginOK = False
    gstrSqlLoginPwd = ""           ' nie liegen lassen
    DoCmd.Close acForm, Me.Name
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Sicherheit: Passwortfeld nach dem Schliessen leeren
    On Error Resume Next
    Me!txtPWd = ""
End Sub
