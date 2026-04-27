Attribute VB_Name = "mdl_sql_Credentials"
Option Compare Database
Option Explicit

' ============================================================================
' Zugriff auf die Windows Anmeldeinformationsverwaltung (Credential Manager)
' zur Ablage des SQL-Server-Logins (UID/PWD fuer SQL-Authentifizierung).
'
' Windows verschluesselt den Eintrag pro Benutzerkonto via DPAPI.
' Sichtbar in:  Systemsteuerung -> Anmeldeinformationsverwaltung ->
'               Windows-Anmeldeinformationen -> Ziel "Firma_SQL"
' ============================================================================

Private Const CRED_TARGET       As String = "Firma_SQL"
Private Const CRED_TYPE_GENERIC As Long = 1
Private Const CRED_PERSIST_LOCAL_MACHINE As Long = 2

Private Type CRED_STRUCT
    Flags               As Long
    CredType            As Long
    TargetName          As LongPtr
    Comment             As LongPtr
    LastWritten         As Currency
    CredentialBlobSize  As Long
    CredentialBlob      As LongPtr
    Persist             As Long
    AttributeCount      As Long
    Attributes          As LongPtr
    TargetAlias         As LongPtr
    UserName            As LongPtr
End Type

Private Declare PtrSafe Function CredWriteW Lib "advapi32.dll" _
    (ByRef pStruct As CRED_STRUCT, ByVal Flags As Long) As Boolean

Private Declare PtrSafe Function CredReadW Lib "advapi32.dll" _
    (ByVal TargetName As LongPtr, ByVal CredType As Long, ByVal Flags As Long, _
     ByRef pHandle As LongPtr) As Boolean

Private Declare PtrSafe Function CredDeleteW Lib "advapi32.dll" _
    (ByVal TargetName As LongPtr, ByVal CredType As Long, ByVal Flags As Long) As Boolean

Private Declare PtrSafe Sub CredFree Lib "advapi32.dll" _
    (ByVal Buffer As LongPtr)

Private Declare PtrSafe Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
    (Destination As Any, Source As Any, ByVal Length As LongPtr)

Private Declare PtrSafe Function lstrlenW Lib "kernel32" _
    (ByVal lpString As LongPtr) As Long

' ----------------------------------------------------------------------------
' SqlCred_Save
'   Speichert SQL-Benutzername und -Passwort im Windows Credential Manager.
'   Rueckgabe: True bei Erfolg.
' ----------------------------------------------------------------------------
Public Function SqlCred_Save(ByVal strUser As String, ByVal strPwd As String) As Boolean
    On Error GoTo ErrMsg
    Dim cred      As CRED_STRUCT
    Dim bTarget() As Byte
    Dim bUser()   As Byte
    Dim bPwd()    As Byte

    bTarget = CRED_TARGET & vbNullChar
    bUser = strUser & vbNullChar
    bPwd = strPwd                              ' UTF-16 LE, ohne Nullterminator

    cred.CredType = CRED_TYPE_GENERIC
    cred.TargetName = VarPtr(bTarget(0))
    cred.UserName = VarPtr(bUser(0))
    cred.CredentialBlob = VarPtr(bPwd(0))
    cred.CredentialBlobSize = LenB(strPwd)
    cred.Persist = CRED_PERSIST_LOCAL_MACHINE

    SqlCred_Save = CredWriteW(cred, 0)
    Exit Function
ErrMsg:
    SqlCred_Save = False
End Function

' ----------------------------------------------------------------------------
' SqlCred_Load
'   Liest den gespeicherten SQL-Benutzer + Passwort.
'   strUser/strPwd werden per ByRef gefuellt.
'   Rueckgabe: True, wenn ein Eintrag gefunden wurde.
' ----------------------------------------------------------------------------
Public Function SqlCred_Load(ByRef strUser As String, ByRef strPwd As String) As Boolean
    On Error GoTo ErrMsg
    Dim pCred As LongPtr, pSrc As LongPtr
    Dim lBlobSize As Long, n As Long, okRead As Long
    Dim pBlob As LongPtr, pUserName As LongPtr
    Dim bTarget() As Byte, bPwd() As Byte

    strUser = "": strPwd = ""
    bTarget = CRED_TARGET & vbNullChar

    okRead = CredReadW(VarPtr(bTarget(0)), CRED_TYPE_GENERIC, 0, pCred)
    If okRead = 0 Or pCred = 0 Then Exit Function

#If Win64 Then
    pSrc = pCred + 32: CopyMemory lBlobSize, ByVal pSrc, 4
    pSrc = pCred + 40: CopyMemory pBlob, ByVal pSrc, 8
    pSrc = pCred + 72: CopyMemory pUserName, ByVal pSrc, 8
#Else
    pSrc = pCred + 24: CopyMemory lBlobSize, ByVal pSrc, 4
    pSrc = pCred + 28: CopyMemory pBlob, ByVal pSrc, 4
    pSrc = pCred + 48: CopyMemory pUserName, ByVal pSrc, 4
#End If

    If pUserName <> 0 Then
        n = lstrlenW(pUserName)
        If n > 0 Then
            strUser = String$(n, vbNullChar)
            CopyMemory ByVal StrPtr(strUser), ByVal pUserName, n * 2
        End If
    End If

    If lBlobSize > 0 And pBlob <> 0 Then
        ReDim bPwd(0 To lBlobSize - 1)
        CopyMemory bPwd(0), ByVal pBlob, lBlobSize
        strPwd = bPwd
    End If

    CredFree pCred
    SqlCred_Load = (Len(strUser) > 0)
    Exit Function
ErrMsg:
    If pCred <> 0 Then CredFree pCred
    SqlCred_Load = False
End Function






' ----------------------------------------------------------------------------
' SqlCred_Delete
'   Entfernt den gespeicherten Eintrag (z.B. nach fehlgeschlagener Anmeldung,
'   damit beim naechsten Start wieder abgefragt wird).
'   Rueckgabe: True bei Erfolg bzw. wenn nichts zu loeschen war.
' ----------------------------------------------------------------------------
Public Function SqlCred_Delete() As Boolean
    On Error GoTo ErrMsg
    Dim bTarget() As Byte
    bTarget = CRED_TARGET & vbNullChar
    SqlCred_Delete = CredDeleteW(VarPtr(bTarget(0)), CRED_TYPE_GENERIC, 0)
    Exit Function
ErrMsg:
    SqlCred_Delete = False
End Function

' ----------------------------------------------------------------------------
' SqlCred_Exists
'   Kurze Pruefung, ob ein Eintrag vorhanden ist (ohne Passwort zu laden).
' ----------------------------------------------------------------------------
Public Function SqlCred_Exists() As Boolean
    Dim u As String, p As String
    SqlCred_Exists = SqlCred_Load(u, p)
End Function

' ----------------------------------------------------------------------------
' SqlCred_Test
'   Manueller Test: im Direktfenster einfach  SqlCred_Test  eintippen.
'   Gibt Rueckgabewert, Benutzer und Passwort im Direktfenster aus.
' ----------------------------------------------------------------------------
Public Sub SqlCred_Test()
    Dim u As String, p As String
    Dim ok As Boolean
    ok = SqlCred_Load(u, p)
    Debug.Print "---- SqlCred_Test ----"
    Debug.Print "Load-Rueckgabe : " & ok
    Debug.Print "Benutzer       : [" & u & "]  (Laenge=" & Len(u) & ")"
    Debug.Print "Passwort       : [" & p & "]  (Laenge=" & Len(p) & ")"
    Debug.Print "Exists         : " & SqlCred_Exists
End Sub
