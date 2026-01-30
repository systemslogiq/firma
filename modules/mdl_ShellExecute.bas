Attribute VB_Name = "mdl_ShellExecute"
Option Compare Database
Option Explicit

' Class       : CShellExecute
' Description : Use the Windows Shell to launch, print,
'               or explore files or programs
' Source      : Total Visual SourceBook 2002

' Declarations for Windows API calls
Private Declare PtrSafe Function ShellExecute _
  Lib "shell32.dll" _
  Alias "ShellExecuteA" _
  (ByVal hWnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) _
  As Long

Private Declare PtrSafe Sub ShellExecuteEx _
  Lib "shell32.dll" _
  Alias "ShellExecuteExA" _
  (lpExecInfo As SHELLEXECUTEINFO)

Private Declare PtrSafe Function GetExitCodeProcess _
  Lib "kernel32" _
  (ByVal hProcess As Long, _
  lpExitCode As Long) _
  As Long

Private Declare PtrSafe Function OpenProcess _
  Lib "kernel32" _
  (ByVal dwDesiredAccess As Long, _
    ByVal bInheritHandle As Long, _
    ByVal dwProcessId As Long) _
  As Long

Private Type SHELLEXECUTEINFO
  cbSize As Long
  fMask As Long
  hWnd As Long
  lpVerb As String
  lpFile As String
  lpParameters As String
  lpDirectory As String
  nShow As Long
  hInstApp As Long
  '  Optional fields
  lpIDList As Long
  lpClass As String
  hkeyClass As Long
  dwHotKey As Long
  hIcon As Long
  hProcess As Long
End Type

Private Const SEE_MASK_NOCLOSEPROCESS = &H40
Private Const SEE_MASK_DOENVSUBST = &H200

' Public property enumerated constants
Public Enum EnumShellExecuteErrors
  seeNoError = -1                 'Any value above 32
  seeOUT_OF_MEMORY = 0            'The operating system is out of memory or resources.
  seeERROR_FILE_NOT_FOUND = 2     'The specified file was not found.
  seeERROR_PATH_NOT_FOUND = 3     'The specified path was not found.
  seeERROR_BAD_FORMAT = 11        'The .exe file is invalid (non-Win32® .exe or error in .exe image).
  seeSE_ERR_ACCESSDENIED = 5      'The operating system denied access to the specified file.
  seeSE_ERR_ASSOCINCOMPLETE = 27  'The file name association is incomplete or invalid.
  seeSE_ERR_DDEBUSY = 30          'The DDE transaction could not be completed because other DDE transactions were being processed.
  seeSE_ERR_DDEFAIL = 29          'The DDE transaction failed.
  seeSE_ERR_DDETIMEOUT = 28       'The DDE transaction could not be completed because the request timed out.
  seeSE_ERR_DLLNOTFOUND = 32      'The specified dynamic-link library was not found.
  seeSE_ERR_NOASSOC = 31          'There is no application associated with the given file name extension.
  seeSE_ERR_OOM = 8               'There was not enough memory to complete the operation.
  seeSE_ERR_SHARE = 26            'A sharing violation occurred.

End Enum

Public Enum EnumShellExecuteShowStyles
  sesSW_HIDE = 0
  sesSW_MAXIMIZE = 3
  sesSW_MINIMIZE = 6
  sesSW_RESTORE = 9
  sesSW_SHOW = 5
  sesSW_SHOWDEFAULT = 10
  sesSW_SHOWMAXIMIZED = 3
  sesSW_SHOWMINIMIZED = 2
  sesSW_SHOWMINNOACTIVE = 7
  sesSW_SHOWNA = 8
  sesSW_SHOWNOACTIVATE = 4
  sesSW_SHOWNORMAL = 1
End Enum

Private mlnghInstance As Long
Private mlnghProcess As Long

Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long) '<R207>

Public Property Get StillExecuting() As Boolean
  ' Returns: A true or false value indicating whether the application
  '          launched with the OH_LaunchProgram or LaunchDocument method
  '          is still executing
  ' Source: Total Visual SourceBook 2002
  '
  Const clngStillActive = &H103

  Dim lngRet As Long
  Dim fResult As Boolean
  Dim lngExit As Long

  On Error GoTo ErrMsg

  ' This variable is set if an app is successfully launched
  ' with either OH_LaunchProgram or LaunchDocument

  If mlnghInstance <> 0 Then
    ' Test whether or not the app is still running
    lngRet = GetExitCodeProcess(mlnghProcess, lngExit)

    If lngRet > 0 Then
      fResult = (lngExit = clngStillActive)
    Else
      fResult = False
    End If

  Else
    fResult = False
  End If

  StillExecuting = fResult

ErrEnd:
  Exit Property

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "StillExecuting"
  Resume ErrEnd

End Property
Sub OH_PrintFile(strFName As String)
' so starten: PrintPDF Me!PDFDatei
  Dim se As SHELLEXECUTEINFO

  On Error Resume Next
  With se
    .cbSize = Len(se)
    .lpFile = strFName
    .lpParameters = vbNullString
    .lpDirectory = vbNullString
    .nShow = vbMinimizedNoFocus
    .lpVerb = "print"
  End With

  ShellExecuteEx se

End Sub
Public Function OH_LaunchDocument( _
  lngHWnd As Long, _
  strDocument As String)
  ' Comments  : Open a Document window on a directory
  ' Parameters: lnghWnd - Handle to window of a form
  '             strDocument - Path to the directory to open
  '             eShowStyle - Constant indicating how the Document
  '             is to be displayed (maximized, minimized etc.)
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long
  On Error GoTo ErrMsg
  mlnghInstance = 0
  mlnghProcess = 0

  lngResult = ShellExecute( _
    lngHWnd, _
    "open", _
    strDocument, _
    vbNullString, _
    vbNullString, _
    sesSW_SHOWDEFAULT)

  If lngResult > 32 Then
    OH_LaunchDocument = seeNoError
  Else
    OH_LaunchDocument = lngResult
  End If

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_LaunchDocument"
  Resume ErrEnd

End Function

Public Function OH_LaunchEmail( _
  lngHWnd As Long, _
  strAddress As String, _
  Optional eShowStyle As EnumShellExecuteShowStyles = sesSW_SHOWDEFAULT) _
  As EnumShellExecuteErrors
  ' Comments  : Open the program associated with email on the system.
  ' Parameters: lnghWnd - Handle to window of a form
  '             strAddress - email address in the form user@domain.com
  '             eShowStyle - Constant indicating how the browser
  '             is to be displayed (maximized, minimized etc.)
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long
  Dim strTmp As String

  On Error GoTo ErrMsg

  mlnghInstance = 0
  mlnghProcess = 0

  strTmp = "mailto:" & strAddress

  lngResult = ShellExecute( _
    lngHWnd, _
    vbNullString, _
    strTmp, _
    vbNullString, _
    vbNullString, _
    eShowStyle)

  If lngResult > 32 Then
    OH_LaunchEmail = seeNoError
  Else
    OH_LaunchEmail = lngResult
  End If

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_LaunchEmail"
  Resume ErrEnd

End Function

Public Function OH_LaunchFolder( _
  lngHWnd As Long, _
  strFolder As String, _
  Optional eShowStyle As EnumShellExecuteShowStyles = sesSW_SHOWDEFAULT) _
  As EnumShellExecuteErrors
  ' Comments  : Open a folder window on a directory
  ' Parameters: lnghWnd - Handle to window of a form
  '             strFolder - Path to the directory to open
  '             eShowStyle - Constant indicating how the folder
  '             is to be displayed (maximized, minimized etc.)
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long

  On Error GoTo ErrMsg

  mlnghInstance = 0
  mlnghProcess = 0

  lngResult = ShellExecute( _
    lngHWnd, _
    "open", _
    strFolder, _
    vbNullString, _
    vbNullString, _
    eShowStyle)

  If lngResult > 32 Then
    OH_LaunchFolder = seeNoError
  Else
    OH_LaunchFolder = lngResult
  End If

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_LaunchFolder"
  Resume ErrEnd

End Function

Public Function OH_LaunchProgram( _
  lngHWnd As Long, _
  strProgram As String, _
  Optional strParameters As String = vbNullString, _
  Optional strStartIn As String = vbNullString, _
  Optional eShowStyle As EnumShellExecuteShowStyles = sesSW_SHOWDEFAULT) _
  As EnumShellExecuteErrors
  ' Comments  : Launch a program
  ' Parameters: lnghWnd - Handle to window of a form
  '             strProgram - Path to program to launch
  '             strParameters - Command line arguments for
  '             the program
  '             strStartIn - Default startup directory for
  '             the program
  '             eShowStyle - Constant indicating how the program
  '             is to be displayed (maximized, minimized etc.)
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long
  Dim sexinfo As SHELLEXECUTEINFO

  On Error GoTo ErrMsg

  mlnghInstance = 0
  mlnghProcess = 0

  With sexinfo
    .cbSize = Len(sexinfo)
    .fMask = SEE_MASK_NOCLOSEPROCESS Or SEE_MASK_DOENVSUBST
    .hWnd = lngHWnd
    .lpVerb = "Open"
    .lpFile = strProgram
    .lpParameters = strParameters
    .lpDirectory = strStartIn
    .nShow = eShowStyle
  End With

  ShellExecuteEx sexinfo

  lngResult = sexinfo.hInstApp

  If lngResult > 32 Then
    OH_LaunchProgram = seeNoError
  Else
    OH_LaunchProgram = lngResult
  End If

  mlnghInstance = lngResult
  mlnghProcess = sexinfo.hProcess

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_LaunchProgram"
  Resume ErrEnd

End Function

Public Function OH_LaunchURL( _
  lngHWnd As Long, _
  strURL As String, _
  Optional eShowStyle As EnumShellExecuteShowStyles = sesSW_SHOWDEFAULT) _
  As EnumShellExecuteErrors
  ' Comments  : Open the default Internet browser on the user's machine
  '             by specifying a URL (uniform resource locator), for example:
  '             http://www.fmsinc.com
  ' Parameters: lnghWnd - Handle to window of a form
  '             strURL - URL to open
  '             eShowStyle - Constant indicating how the browser
  '             is to be displayed (maximized, minimized etc.)
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long

  On Error GoTo ErrMsg

  mlnghInstance = 0
  mlnghProcess = 0
  lngResult = ShellExecute( _
    lngHWnd, _
    vbNullString, _
    strURL, _
    vbNullString, _
    vbNullString, _
    eShowStyle)

  If lngResult > 32 Then
    OH_LaunchURL = seeNoError
  Else
    OH_LaunchURL = lngResult
  End If

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_LaunchURL"
  Resume ErrEnd
End Function
Public Function OH_PrintDocument( _
  lngHWnd As Long, _
  strDocument As String) _
  As EnumShellExecuteErrors
  ' Comments  : Prints a document by launching the program
  '             that is associated with the document (similar
  '             to what happens when you drag a document to the
  '             printer icon on the desktop.)
  ' Parameters: lnghWnd - Handle to window of a form
  '             strDocument - Path to the document to print
  ' Returns   : -1 on Success, or one of the values in the
  '             EnumShellExecuteErrors constants on failure
  ' Source    : Total Visual SourceBook 2002
  '
  Dim lngResult As Long

  On Error GoTo ErrMsg

  mlnghInstance = 0
  mlnghProcess = 0

  lngResult = ShellExecute( _
    lngHWnd, _
    "print", _
    strDocument, _
    vbNullString, _
    vbNullString, _
    0)

  If lngResult > 32 Then
    OH_PrintDocument = seeNoError
  Else
    OH_PrintDocument = lngResult
  End If

ErrEnd:
  Exit Function

ErrMsg:
  MsgBox "Error: " & Err.number & ". " & Err.Description, , _
    "OH_PrintDocument"
  Resume ErrEnd

End Function
'Function OH_CallHTTPRequest(strurl As String) As Long
'    Dim objXMLHTTP As Object
'    Dim lgStatus As Long
'    Dim strContent As String
'    t = "OH_CallHTTPRequest"
'    DoCmd.Hourglass True
'    Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
'    objXMLHTTP.Open "POST", strurl, False
'    SysCmd acSysCmdSetStatus, strurl
'    objXMLHTTP.send
'    lgStatus = objXMLHTTP.Status
'    strContent = ""
'    If objXMLHTTP.Status = 200 Then
'       strContent = objXMLHTTP.responseText
'    Else
'       s = strurl & vbNewLine & "HTTP Request unsuccessfull!"
'       GoTo errM
'    End If
'    OH_CallHTTPRequest = lgStatus
'errend:
'    Set objXMLHTTP = Nothing
'    DoCmd.Hourglass False
'    Exit Function
'errMSG:
'    s = Err.Number & " " & Err.Description
'    Resume errM
'errM:
'    MsgBox s, vbExclamation, t
'    GoTo errend
'End Function
Function OH_CallHTTPRequest(strURL As String, Optional strOrigin As String, Optional lgid As Long, Optional strTableName As String) As Long
    '<R207> Function to make an HTTP POST request and handle server timeouts and retries
    ' Constants for maximum number of retries and timeout in milliseconds
    Const MAX_RETRIES As Integer = 3  ' Maximum number of retries
    Const TIMEOUT As Long = 60000  ' Timeout in milliseconds (60 seconds)

    Dim objXMLHTTP As Object
    Dim lgStatus As Long
    Dim strContent As String
    Dim retryCount As Integer
    t = "OH_CallHTTPRequest"
    Dim startTime As Single, endTime As Single, duration As Single

    ' Enable the hourglass cursor to indicate processing
    DoCmd.Hourglass True

    ' Create the XMLHTTP object for making the HTTP request
    Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")

    ' Loop to attempt the HTTP request up to the maximum retries
    For retryCount = 1 To MAX_RETRIES
        ' Use On Error Resume Next to handle runtime errors
        On Error Resume Next

        '***For testing - record start***
        startTime = Timer

        ' Open the HTTP request with the specified URL and set it to synchronous
        objXMLHTTP.Open "POST", strURL, False
        ' Set timeouts for the request
        objXMLHTTP.setTimeouts TIMEOUT, TIMEOUT, TIMEOUT, TIMEOUT
        ' Send the HTTP request
        objXMLHTTP.send

        '***For testing - record end***
        endTime = Timer

        ' Get the status of the HTTP request
        lgStatus = objXMLHTTP.status

        '***For testing - calculate request duration***
        'duration = endTime - startTime
        'MsgBox "Attempt " & retryCount & ": Request Duration = " & duration & " seconds" & "       lgstatus :" & lgStatus

        ' Check for successful request and no VBA error
        If Err.number = 0 And lgStatus = 200 Then
            ' Read the response text if the request was successful
            strContent = objXMLHTTP.responseText

            ' Return the HTTP status
            OH_CallHTTPRequest = lgStatus

            ' Exit the loop as the request was successful
            Exit For
        ElseIf retryCount = MAX_RETRIES Then
            ' Show a message if maximum retries are reached without success

            OH_LogErrorToSQLServer "TimeOut", "OH_CallHTTPRequest" & " - " & strOrigin, strTableName, lgid

            MsgBox "Maximum retry attempts reached. " & _
                   "Error: " & Err.number & " - " & Err.Description, _
                   vbExclamation, t

            ' Return the HTTP status
            OH_CallHTTPRequest = lgStatus

            ' Exit the loop as retries are exhausted
            Exit For
        Else
            ' Wait for a short duration before retrying the request
            Sleep 5000  ' 5 Sekunden Wartezeit
        End If

        ' Reset the error handling
        On Error GoTo 0
    Next retryCount

ErrEnd:
    ' Clean up and reset the hourglass cursor
    Set objXMLHTTP = Nothing
    DoCmd.Hourglass False
    Exit Function
'errMSG:
'    s = Err.Number & " " & Err.Description
'    Resume errM
'errM:
'    MsgBox s, vbExclamation, t
'    GoTo errend
End Function
Public Function OH_TESTE()
Dim xmlhttp As New MSXML2.XMLHTTP60, myurl As String
myurl = "https://OHSV11:5080/contact?call=0049 763316130"
xmlhttp.Open "GET", myurl, False
xmlhttp.send
MsgBox (xmlhttp.responseText)

End Function
