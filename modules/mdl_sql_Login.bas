Attribute VB_Name = "mdl_sql_Login"
Option Compare Database
Option Explicit

' ============================================================================
' Wrapper um das Formular PF_SqlLogin zur maskierten Passwort-Eingabe.
'
' PF_SqlLogin bietet:
'   - Benutzername (Klartext)
'   - Passwort (maskiert mit ***)
'   - Checkbox "Passwort anzeigen" zur Kontrolle der Eingabe
'   - OK / Abbrechen
'
' Das Formular schreibt die Eingaben beim Klick auf OK in die hier deklarierten
' Public-Variablen. Der Aufrufer liest sie via SqlLogin_Prompt aus.
' ============================================================================

Public gblSqlLoginOK  As Boolean    ' True wenn OK geklickt
Public gstrSqlLoginUser As String   ' Eingegebener Benutzer (bei Aufruf evtl. vorbelegt)
Public gstrSqlLoginPwd  As String   ' Eingegebenes Passwort

' ----------------------------------------------------------------------------
' SqlLogin_Prompt
'   Oeffnet PF_SqlLogin als modalen Dialog.
'   Bei Aufruf wird strUser als Vorbelegung genutzt. Nach OK stehen in
'   strUser/strPwd die eingegebenen Werte; Rueckgabe True.
'   Bei Abbrechen: Rueckgabe False, strPwd wird geleert.
' ----------------------------------------------------------------------------
Public Function SqlLogin_Prompt(ByRef strUser As String, ByRef strPwd As String) As Boolean
    On Error GoTo ErrMsg

    gblSqlLoginOK = False
    gstrSqlLoginUser = Nz(strUser, "")
    gstrSqlLoginPwd = ""

    DoCmd.openForm "PF_SqlLogin", , , , , acDialog
    ' acDialog blockiert, bis das Formular geschlossen wurde.

    If gblSqlLoginOK Then
        strUser = gstrSqlLoginUser
        strPwd = gstrSqlLoginPwd
        SqlLogin_Prompt = True
    Else
        strPwd = ""
        SqlLogin_Prompt = False
    End If

    ' Aufraeumen: Passwort nicht laenger als noetig im Modul halten
    gstrSqlLoginPwd = ""
    Exit Function
ErrMsg:
    SqlLogin_Prompt = False
    gstrSqlLoginPwd = ""
End Function

Public Sub SqlLogin_Test()
    Dim u As String, p As String
    u = "testuser"
    Dim ok As Boolean
    ok = SqlLogin_Prompt(u, p)
    Debug.Print "---- SqlLogin_Test ----"
    Debug.Print "OK         : " & ok
    Debug.Print "Benutzer   : [" & u & "]"
    Debug.Print "PwdLaenge  : " & Len(p)
End Sub
