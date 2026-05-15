Attribute VB_Name = "mdlTelefonie"
Option Compare Database
Option Explicit
Global lgLastCall As Long
Private Declare PtrSafe Function SHGetPathFromIDList Lib "shell32" Alias "SHGetPathFromIDListA" _
        (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare PtrSafe Function SHGetSpecialFolderLocation _
        Lib "shell32" _
        (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As Long) As Long
Private Declare PtrSafe Sub CoTaskMemFree Lib _
        "ole32" (ByVal pv As Long)
Private Const CSIDL_APPDATA = &H1A
Private Declare PtrSafe Function tapiRequestMakeCall Lib "TAPI32.DLL" _
        (ByVal DestAddress As String, ByVal AppName As String, _
        ByVal CalledParty As String, ByVal Comment As String) As Long

Private Const TAPIERR_NOREQUESTRECIPIENT As Long = -2&
Private Const TAPIERR_REQUESTQUEUEFULL As Long = -3&
Private Const TAPIERR_INVALDESTADDRESS As Long = -4&

Public Enum SkypeAction
  SkypeChat = 0
  SkypeTelephon = 1
End Enum

Public Function gsGetAppDataFolder(Optional ByVal sSubFolder As String = "") As String
'The file CDCCALLS.XML
'The file is in the folder …\documents and settings\username\application data\ application exe name.
'(this is the default path which can be configured within the wizard or in the node <setup> value <XML Directory>).
'You can access this local folder via Windows
Dim sPath As String
Dim lpidl As Long
    gsGetAppDataFolder = ""
    If SHGetSpecialFolderLocation(0, CSIDL_APPDATA, lpidl) = 0 Then
        sPath = Space$(260)
        If SHGetPathFromIDList(ByVal lpidl, ByVal sPath) Then
            gsGetAppDataFolder = left(sPath, InStr(sPath, Chr$(0)) - 1)
            If sSubFolder <> "" Then
                gsGetAppDataFolder = gsFitPath(gsGetAppDataFolder) & sSubFolder
            End If
        End If
        CoTaskMemFree lpidl
    End If
End Function
Public Function gsFitPath(sPath As String) As String
    If right(sPath, 1) <> "\" Then
        gsFitPath = sPath & "\"
    Else
        gsFitPath = sPath
    End If
End Function

Public Function OH_lastcall()
On Error GoTo ErrMsg
    MsgBox "UNDER CONSTRUCTION", vbInformation, "OH_lastcall"
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_lastcall"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, "LETZTER ANRUF"
    GoTo ErrEnd
End Function
Public Function OH_DialTelefon(lgid As Long, _
                              ctlNumber As control, _
                              strName As String)
On Error GoTo ErrMsg
    Dim strNr As String
    Dim strArt As String
    Dim WShell As Object
    Dim strParam As String

    DoCmd.Hourglass True
    strNr = Nz(ctlNumber, "")
    If strNr = "" Then
        s = strName & vbNewLine & _
                  "Telefon-Nr. fehlt!"
        GoTo ErrM
    End If
    strNr = Replace(Replace(Replace(strNr, " ", ""), "(", ""), ")", "")
    OH_CB strNr
    '200307 Telefonie HVL
    strSQL = "Exec dbo.spa_Lexikon" & _
            " @x = 'Telefonie'" & _
            ",@e = '" & VBA.Environ("Computername") & "'"
    OH_r r
    strArt = r!Art
    strParam = Nz(r!Param, "")
    Select Case strArt
    Case "1" 'Shortcut z.b. F8
        SendKeys "{" & strParam & "}"
        ctlNumber.SetFocus
    Case "2"
        'strNr = Replace(strNr, "+", "00")
        strNr = Replace(strNr, "+49", "0")
        i = tapiRequestMakeCall(strNr, "", strName, "")
        If i <> 0 Then
            Select Case i
                Case TAPIERR_NOREQUESTRECIPIENT
                    s = "No Windows Telephony dialing " & _
                            "application is running and " & _
                            "none could be started."
                Case TAPIERR_REQUESTQUEUEFULL
                    s = "The queue of pending Windows " & _
                            "Telephony dialing requests is full."
                Case TAPIERR_INVALDESTADDRESS
                    s = "The phone number is not valid."
                Case Else
                    s = "Unknown error."
            End Select
            GoTo ErrM
        End If
    Case "3"
        OH_DialOutlookContact lgid, strNr, strName
    Case "4"
        'http://www.vbarchiv.net/tipps/details.php?id=2023
        ' Skype-Chat bzw. Skype-Telefonie starten
        ' Parameter für den Aufruf zusammenstellen
        strParam = "skype:" & strName & "?"
        strParam = strParam & "call"
       ' Skype aufrufen
       Set WShell = CreateObject("WScript.Shell")
       WShell.Run strParam
    Case "5" '"TK-Suite Client"
        strParam = "tksuite:" & strNr & "?call" 'Quelle CHATGPT 250918
        OH_LaunchURL 1, strParam

       ' OH_LaunchProgram 3, "C:\Programme\AGFEO\Tk-Suite-Basic\tools\openTKSuite.lnk"
'        strNr = Replace(strNr, "+", "00")
'        strNr = strParam & strNr
'        Application.FollowHyperlink strNr, , False, False
        'http://OHSV11:5080/contact?call=0049 763316130
        ''OH_CallHTTPRequest = SEHR Langsam!!!!!
        'OH_CallHTTPRequest strNr
    Case 6
       ' 6:CTI DATA CONNECTOR C:\Users\philipp\AppData\Local\Temp\cdc-ep\files\Setup\dial.exe
       ' strParam = Replace(gsGetAppDataFolder, "\Roaming", "") & "\Local\Temp\cdc-ep\files\Setup\dial.exe " 'Warum ROAMING???
'        If OH_ComputerName = "hvlsv23" Then
'            strParam = "\\hvlsv25\CTI\dial.exe "
'        Else
'            strParam = "c:\Program Files (x86)\CTI Data Connector Enterprise Edition 4\dial.exe "
'        End If
        'strParam = "C:\Users\peter_gammenthaler\AppData\Local\Temp\cdc-ep\files\Setup\dial.exe "
        Call Shell(strParam & strNr)
    Case 7 'Shortcut CTRL F10 (GuH)
        ctlNumber.SetFocus
        SendKeys "^{F10}", True    ' Send CTRL+F10 to start Phone
    Case 8 'Shortcut CTRL F11 (HVL)
        ctlNumber.SetFocus
        'SendKeys "{F11}", True    ' Send F11 to start Phone
        'SENDKEYS Ersatz, weil Sendkey den NUMLOCK ausschaltet=====================================================
        keybd_event VK_F11, 1, 0, 0
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_DialTelefon"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, "OH_DialTelefon"
End Function
