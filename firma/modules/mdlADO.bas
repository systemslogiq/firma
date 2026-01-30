Attribute VB_Name = "mdlADO"
Option Compare Database
Option Explicit
Global strConnection As String
Global strConnODBC As String
Global con As New ADODB.Connection
Global NoRecords As Boolean
Public Enum rrCursorType
    rrOpenDynamic = adOpenDynamic
    rrOpenForwardOnly = adOpenForwardOnly
    rrOpenkeyset = adOpenKeyset
    rrOpenStatic = adOpenStatic
End Enum
Public Enum rrLockType
    rrLockOptimistic = adLockOptimistic
    rrLockReadOnly = adLockReadOnly
End Enum
Dim strText As String
Global glstrUser As String
Global glstrPW As String
Global lgRetry As Long

Private Const MAX_RETRIES As Long = 6
Private Const RETRY_DELAY_MS As Long = 1200   ' 1.2s
Private Const PING_TIMEOUT_SEC As Long = 3

' Optional: set to your DSN name if you want Ping to be DSN-stable.
' If left "", Ping will grab the connect string from any linked table.
Private Const DSN_NAME As String = ""
Public Function OH_r(Optional r As ADODB.Recordset, _
                    Optional strSQLr As String, _
                    Optional rrCursor As rrCursorType, _
                    Optional rrLock As rrLockType, _
                    Optional bolClientSide As Boolean) As ADODB.Recordset
On Error GoTo ErrMsg
    Dim strT As String
    Dim strM As String
OH_R_Again:
    DoCmd.Hourglass True
    strT = "Erstelle Recordset"
    Set r = New ADODB.Recordset
    With r
        .ActiveConnection = con
        If bolClientSide Then
            .CursorLocation = adUseClient
        Else
            .CursorLocation = adUseServer
        End If
        .CursorType = IIf((rrCursor = 0), adOpenStatic, rrCursor)
        .LockType = IIf((rrLock = 0), adLockReadOnly, rrLock)
        If strSQLr = "" Then
            strSQLr = strSQL
        End If
        .Open strSQLr
        If .EOF And .BOF Then
            NoRecords = True
            GoTo ErrEnd
        Else
            NoRecords = False
        End If
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case -2147467259, 3709
        If strSQLr = "" Then
            strSQLr = strSQL
        End If '200825 OH Fehlerroutine verbessert
        strM = OH_GetCnnString
        Select Case strM
        Case "OK"
            Resume OH_R_Again
        Case "Stop"
            OH_ApplicationQuit
        End Select
    Case -2147217913
        MsgBox "Prüfen Sie Ihre Filter-Bedingungen", vbCritical, strT
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_r"
        OH_CB strSQLr
    End Select
    Resume ErrEnd
End Function
Public Function OH_EX(Optional strS As String) As Long
On Error GoTo ErrMsg
    Dim strM As String
    Dim comM As ADODB.command
    Dim lngRecordsAffected As Long
    blNixTun = False
    If strConnection = "" Or con Is Nothing Then
        strM = OH_GetCnnString
    End If
    If con.State = adStateClosed Then
        con.ConnectionString = strConnection
        con.Open
    End If
OH_EX_Again:
    Set comM = New ADODB.command
    With comM
        .ActiveConnection = con
        If strS = "" Then
            strS = strSQL
        End If
        .CommandText = strS
        .Execute lngRecordsAffected
        Debug.Print lngRecordsAffected
    End With
    Set comM = Nothing
    OH_EX = lngRecordsAffected
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case -2147467259 'Connection Unterbruch
        strM = OH_GetCnnString
        Select Case strM
        Case "OK"
            Resume OH_EX_Again
        Case "Stop"
            OH_ApplicationQuit
        End Select
    Case Else
        OH_CB strS
        strSQL = "insert into T_ID (IDt1) Values(err)"
        con.Execute strSQL
        MsgBox Err & " " & Err.Description, vbCritical, "OH_EX"
    End Select
    Resume ErrEnd
End Function
Public Function OH_GetCnnString() As String
    On Error GoTo ErrMsg
    Dim strC As String
    Dim strT As String
    Dim strM As String
    Dim strConn As String
    Dim strServer As String
    Dim strODBC As String
    Dim strProvider As String
    Dim strUID As String
    Dim strPWD As String
    Dim strDriver As String
    Dim rDAO As dao.Recordset
    Dim tdf As dao.TableDef
    Dim blUseSQLAuth As Boolean '-gewünschte Authentifizierung
    Dim blIsSQLAuth As Boolean '- bestehende Authentifiierung

    ' Setze Verweis auf die aktuelle Datenbank
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    strT = "Erstellen der Connection"
    strDriver = "SQL SERVER"

    ' Hole die Verbindungseinstellungen
    strSQL1 = "Select top 1 * from MSYSFIRMA WHERE Used <> 0"
    Set rDAO = db.OpenRecordset(strSQL1)
    i = 0
    If rDAO.BOF Then
        OH_GetCnnString = "STOP"
        GoTo ErrM
    End If

    ' Extrahiere Verbindungsparameter
    strDriver = rDAO!driver
    strServer = rDAO!Server
    strDB = rDAO!Database
    strDBArt = UCase(left(Nz(rDAO!Art, "PROD"), 4))
    strDBKunde = rDAO!kd
    blUseSQLAuth = rDAO!SQLAuthentication
    rDAO.Close
    Set rDAO = Nothing

    strProvider = "sqloledb"
    'strProvider = "MSOLEDBSQL" 'FUNKTIONIERT NICHT BEI ANGELIKA trotz installation von "K:\1Firma\SQL\Anpassungen\251230\msoledbsql.msi"

     ' Verbindungszeichenfolge basierend auf SQL-Authentifizierung erstellen
    strODBC = "ODBC" & _
        ";DRIVER=" & strDriver & _
        ";SERVER=" & strServer & _
        ";DATABASE=" & strDB & _
        ";Encrypt=Yes " & _
        ";TrustServerCertificate=Yes"
'    strODBC = "ODBC" & _
'        ";DRIVER=" & strDriver & _
'        ";SERVER=" & strServer & _
'        ";DATABASE=" & strDB
    strProvider = "Provider=" & strProvider & _
        ";Data Source=" & strServer & _
        ";Initial Catalog=" & strDB & _
        ";Encrypt=Yes " & _
        ";TrustServerCertificate=Yes"

    If blUseSQLAuth Then
       strUID = InputBox("Bitte geben Sie Ihren Benutzernamen ein:", "SQL-Authentifizierung")
        If Len(strUID) = 0 Then
            MsgBox "Benutzername ist erforderlich.", vbExclamation, "Fehler"
            OH_GetCnnString = "STOP"
            GoTo ErrEnd
        End If

        strPWD = InputBox("Bitte geben Sie Ihr Passwort ein:", "SQL-Authentifizierung")
        If Len(strPWD) = 0 Then
            MsgBox "Passwort ist erforderlich.", vbExclamation, "Fehler"
            OH_GetCnnString = "STOP"
            GoTo ErrEnd
        End If

        If Len(strUID) = 0 Or Len(strPWD) = 0 Then
            MsgBox "Benutzername und Passwort sind erforderlich.", vbExclamation, "Fehler"
            OH_GetCnnString = "STOP"
            GoTo ErrEnd
        End If

        ' Verbindungszeichenfolgen zusammenstellen
        ' Die Option "TrustServerCertificate=yes" akzeptiert das Serverzertifikat auch dann,
        ' wenn es nicht vollständig verifiziert werden kann. Diese Option ist nützlich,
        ' um Verbindungsprobleme mit SSL-Zertifikaten zu umgehen, sollte jedoch in
        ' produktiven Umgebungen mit Vorsicht verwendet werden, da sie ein potenzielles Sicherheitsrisiko darstellen kann.
        strODBC = "DRIVER=" & strDriver & ";SERVER=" & strServer & ";DATABASE=" & strDB & ";UID=" & strUID & ";PWD=" & strPWD & ";Encrypt=yes;TrustServerCertificate=yes;"
        strProvider = strODBC
    Else
    ' Windows-Authentifizierung
      strODBC = strODBC & ";Trusted_Connection=yes"
      strProvider = strProvider & ";Integrated Security=SSPI;"
    End If

tryconnect: '====================================================================================================

    strM = OH_ConnectionSet(strProvider)
    If strM <> "OK" Then
        s = strM & vbNewLine & vbNewLine & _
            "Die Verbindung zum Server wurde unterbrochen!" & vbNewLine & vbNewLine & _
            "OK" & vbTab & "VERBINDUNG WIEDERHERSTELLEN " & vbNewLine & _
            "Abbr." & vbTab & "Applikation schliessen"
        i = MsgBox(s, vbExclamation + vbOKCancel, strT)
        Select Case i
        Case vbOK
            GoTo tryconnect
        Case Else
            GoTo errstop
        End Select
    End If
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    Set tdf = db.TableDefs("vwServername")
    s = tdf.connect & ";"
    blIsSQLAuth = InStr(s, "Trusted_Connection=yes") = 0 'ermittle aktuell bestehende Authentifizierunhg
    If InStr(s, "=" & strServer & ";") = 0 _
        Or InStr(s, "=" & strDB & ";") = 0 _
        Or (InStr(s, "=" & strUID & ";") = 0 And blIsSQLAuth = True) _
        Or blIsSQLAuth <> blUseSQLAuth Then '200131
        If Not OH_LinkTable(strODBC) Then
            s = strODBC
            GoTo ErrM
        End If
    End If
    strConnection = strProvider
    If blIsSQLAuth = True Then
        'Syntax für Pass-Through-Anfragen mit SQL-Authentifizierung:
        '"ODBC;" Prefix ist erforderlich
        'Treibername in geschweiften Klammern
        'Keine Encrypt/TrustServerCertificate Parameter für Pass-Through
        strConnODBC = "ODBC;DRIVER=" & strDriver & ";SERVER=" & strServer & ";DATABASE=" & strDB & ";UID=" & strUID & ";PWD=" & strPWD & ";"
    Else
        strConnODBC = strODBC
    End If
    SysCmd acSysCmdSetStatus, strODBC
    OH_GetCnnString = strM
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    strT = "OH_GetCnnString"
    i = 1
    Select Case Err
    Case 3265
        s = Err & " " & Err.Description
        Resume errstop
    Case 3283 'Index besteht bereits
        Resume Next
    Case Else
        Resume ErrM
    End Select
ErrM:
    Select Case i
    Case 1
        s = s & vbNewLine & vbNewLine & _
                "Verbindung zum Server und zur Datenbank neu aufbauen?"
        i = MsgBox(s, vbQuestion + vbOKCancel, "Verbindung ist unterbrochen")
        Select Case i
        Case vbOK
            AutoExec
        Case vbCancel
            OH_GetCnnString = "STOP"
        End Select
        GoTo ErrEnd
    Case 2
        s = "Grund-Einstellung Firma ist NICHT korrekt (MsysFirma)"
        GoTo errstop
    End Select
errstop:
    s = strProvider & vbNewLine & vbNewLine & vbNewLine & _
        "Erstellen Sie bitte jetzt einen Print-Screen." & vbNewLine & _
        "==>Fall für den ADMIN (MSYSFIRMA)"
    MsgBox s, vbCritical, strT
    OH_GetCnnString = "STOP"
End Function
Public Function OH_S(frmAct As Form, _
                    strA As String, _
                    Optional strC As String, _
                    Optional strf As String) As String
On Error GoTo ErrMsg
    Dim qdf As dao.QueryDef
    Dim Y As Long
    Dim strName As String
    Dim strQ As String
    If strf = "" Then
        If frmAct.Name = "Menu" Then
            strf = "Menu"
        Else
            strf = frmAct.Tag
        End If
    End If
    strQ = "Exec " & strf & _
           " @u = '" & strUser & _
          "',@x ='" & strA & "'"
    If strC <> "" Then
        If left(strC, 4) = "EXEC" Then
            strQ = strC
        Else
            strQ = strQ & "," & strC
        End If
    End If
    strName = "qdf" & strf & "_" & strA
    'pass Through Query
    For Each qdf In db.QueryDefs
        If qdf.Name = strName Then
            Y = 1
            Exit For
        End If
    Next qdf
    If Y = 0 Then
        Set qdf = db.CreateQueryDef(strName)
        db.QueryDefs.Refresh
    End If
    qdf.connect = strConnODBC
    qdf.SQL = strQ
    frmAct(strA).RowSource = strName
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_S Rowsource für " & strA
    Resume ErrEnd
End Function
Public Function OH_LinkTable(strConn) As Boolean
On Error GoTo ErrMsg
    Dim strf As String
    Dim tdf As dao.TableDef
    Dim N As Long
    t = "Verlinken der Tabellen"
    DoCmd.Hourglass True
    OH_LinkTable = False 'Default Value
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
  'Loop through the TableDefs Collection

   For Each tdf In db.TableDefs
       'Verify the table is an ODBC linked table
        If left$(tdf.connect, 5) = "ODBC;" Then
           'Skip System tables
            If left$(tdf.Name, 1) <> "~" Then
                Set tdf = db.TableDefs(tdf.Name)
                If tdf.connect <> strConn Then
                    tdf.connect = strConn
                    If tdf.Attributes < 537001984 Then
                        tdf.Attributes = dbAttachSavePWD 'dbAttachSavePWD = 131072
                    End If
                    tdf.RefreshLink
                    'Views aus dem Server benötigen einen  eindeutigen INDEX
                    Select Case left(tdf.Name, 1)
                    Case "A", "V", "Q"
                        strf = tdf.Fields(0).Name
                        strSQL = "CREATE UNIQUE INDEX " & strf & "IDX ON " & tdf.Name & " (" & strf & ")"
                        db.Execute (strSQL)
                    End Select
                End If
                N = N + 1
                DoEvents
                SysCmd acSysCmdSetStatus, strDB & "  " & N & "  Refresh Link to : " & tdf.Name & " " & strConn
           End If
       End If
    Next tdf
    OH_LinkTable = True
    Set tdf = Nothing

ErrEnd:
    DoCmd.Hourglass False
    SysCmd acSysCmdSetStatus, "Refresh Link READY"
    Exit Function
ErrMsg:
    Select Case Err
    Case 3282, 3283 'INDEX Existiert bereits
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "LINK TABLES"
        Resume ErrEnd
    End Select
End Function
Public Function OH_ConnectionSet(strConnection As String) As String
    'Connection zum Server neu setzen.
    Dim vError As Variant
    Dim strError As String
    DoCmd.Hourglass True
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    db.QueryTimeout = 1
    If Not con Is Nothing Then
        If con.State = adStateOpen Then
            con.Close
        End If
        Set con = Nothing
    End If
    Set con = New ADODB.Connection
    con.CommandTimeout = 5
    SysCmd acSysCmdSetStatus, "Verbinde zum Server " & strConnection
    On Error Resume Next
    con.Open strConnection
    On Error GoTo 0

    If con.State = adStateOpen Then
        OH_ConnectionSet = "OK"
    Else
        For Each vError In con.Errors
            strError = strError & vError.Description & vbNewLine
        Next vError
        If strError > "" Then
            OH_ConnectionSet = strError
        Else
            OH_ConnectionSet = "Connection Failed"
        End If
        OH_ConnectionSet = strConnection & vbNewLine & OH_ConnectionSet
    End If
    DoCmd.Hourglass False

End Function
' =========================
' Public entry point
' =========================
Public Function OH_EnsureSqlConnection(Optional ByVal interactive As Boolean = True) As Boolean

    For lgRetry = 1 To MAX_RETRIES
        If OH_PingSqlDsn() Then
            OH_EnsureSqlConnection = True
            lgRetry = MAX_RETRIES + 1
            Exit Function
        End If

        ' Try to recover by refreshing ODBC links
        OH_LinkTable strConnODBC

        OH_SleepMs RETRY_DELAY_MS
        DoEvents
    Next lgRetry

    OH_EnsureSqlConnection = False
    If interactive Then
        MsgBox "Database connection is currently unavailable." & vbCrLf & _
               "Please check VPN/network and try again.", vbExclamation, "Connection lost"
    End If
End Function

' =========================
' Ping: uses a passthrough query "SELECT 1"
' =========================
Public Function OH_PingSqlDsn() As Boolean
    On Error GoTo EH
    Dim rsPing As dao.Recordset
    Dim qd As dao.QueryDef

    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    Set qd = db.CreateQueryDef("")

    qd.ReturnsRecords = True
    qd.ODBCTimeout = PING_TIMEOUT_SEC
    qd.SQL = "SELECT 1"
    OH_GetCnnString
    qd.connect = strConnODBC

    Set rsPing = qd.OpenRecordset(dbOpenSnapshot, dbReadOnly)
    rsPing.Close

    OH_PingSqlDsn = True
    Exit Function

EH:
    OH_PingSqlDsn = False
End Function
' =========================
' Sleep helper without Windows API declare
' =========================
Private Sub OH_SleepMs(ByVal ms As Long)
    Dim t As Single
    t = Timer
    Do While (Timer - t) * 1000 < ms
        DoEvents
    Loop
End Sub
