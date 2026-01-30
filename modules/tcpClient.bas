Attribute VB_Name = "tcpClient"
'https://msdn.microsoft.com/de-de/library/windows/desktop/ms741580(v=vs.85).aspx
'http://www.vbarchiv.net/api/api_connect.html
'http://www.devx.com/vb/Article/42242
Option Compare Database
Option Explicit

'This is the Winsock API definition file for Visual Basic


'Setup the variable type 'hostent' for the WSAStartup command
Type HOSTENT
    h_name As Long
    h_aliases As Long
    h_addrtype As String * 2
    h_length As String * 2
    h_addr_list As Long
End Type
Public Const SZHOSTENT = 16

'Set the Internet address type to a long integer (32-bit)
Type in_addr
    s_addr As Long
End Type

'A note to those familiar with the C header file for Winsock
'Visual Basic does not permit a user-defined variable type
'to be used as a return structure. In the case of the
'variable definition below, sin_addr must
'be declared as a long integer rather than the user-defined
'variable type of in_addr.
Type sockaddr_in
    sin_family As Integer
    sin_port As Integer
    sin_addr As Long
    sin_zero As String * 8
End Type


Public Const WSADESCRIPTION_LEN = 256
Public Const WSASYS_STATUS_LEN = 128
Public Const WSA_DescriptionSize = WSADESCRIPTION_LEN + 1
Public Const WSA_SysStatusSize = WSASYS_STATUS_LEN + 1

'Setup the structure for the information returned from
'the WSAStartup() function.
Type WSAData
    wVersion As Integer
    wHighVersion As Integer
    szDescription As String * WSA_DescriptionSize
    szSystemStatus As String * WSA_SysStatusSize
    iMaxSockets As Integer
    iMaxUdpDg As Integer
    lpVendorInfo As String * 200
End Type

'Define socket return codes
Public Const INVALID_SOCKET = &HFFFF
Public Const SOCKET_ERROR = -1

'Define socket types
Public Const SOCK_STREAM = 1 'Stream socket
Public Const SOCK_DGRAM = 2 'Datagram socket

Public Const SOCK_RAW = 3 'Raw data socket
Public Const SOCK_RDM = 4 'Reliable Delivery socket
Public Const SOCK_SEQPACKET = 5 'Sequenced Packet socket

'Define address families
Public Const AF_UNSPEC = 0 'unspecified
Public Const AF_UNIX = 1 'local to host (pipes, portals)
Public Const AF_INET = 2 'internetwork: UDP, TCP, etc.
Public Const AF_IMPLINK = 3 'arpanet imp addresses
Public Const AF_PUP = 4 'pup protocols: e.g. BSP
Public Const AF_CHAOS = 5 'mit CHAOS protocols
Public Const AF_NS = 6 'XEROX NS protocols
Public Const AF_ISO = 7 'ISO protocols
Public Const AF_OSI = AF_ISO 'OSI is ISO
Public Const AF_ECMA = 8 'european computer manufacturers
Public Const AF_DATAKIT = 9 'datakit protocols
Public Const AF_CCITT = 10 'CCITT protocols, X.25 etc
Public Const AF_SNA = 11 'IBM SNA
Public Const AF_DECnet = 12 'DECnet
Public Const AF_DLI = 13 'Direct data link interface
Public Const AF_LAT = 14 'LAT
Public Const AF_HYLINK = 15 'NSC Hyperchannel
Public Const AF_APPLETALK = 16 'AppleTalk
Public Const AF_NETBIOS = 17 'NetBios-style addresses
Public Const AF_MAX = 18 'Maximum # of address families
Public Const MSG_PEEK = &H2 ' Daten aus dem Puffer lesen, aber nicht aus dem Puffer entfernen

'Setup sockaddr data type to store Internet addresses
Type SOCKADDR
    sa_family As Integer
    sa_data As String * 14
End Type
Public Const SADDRLEN = 16

'Declare Socket functions

Public Declare PtrSafe Function WSAGetLastError Lib "wsock32.dll" () As Long
Public Declare PtrSafe Function closesocket Lib "wsock32.dll" (ByVal s As Long) As Long
Public Declare PtrSafe Function connect Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr_in, ByVal namelen As Long) As Long
Public Declare PtrSafe Function htons Lib "wsock32.dll" (ByVal hostshort As Long) As Integer
Public Declare PtrSafe Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long
Public Declare PtrSafe Function recv Lib "wsock32.dll" (ByVal s As Long, ByVal buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
Public Declare PtrSafe Function recvB Lib "wsock32.dll" Alias "recv" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
Public Declare PtrSafe Function send Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
Public Declare PtrSafe Function socket Lib "wsock32.dll" (ByVal af As Long, ByVal socktype As Long, ByVal protocol As Long) As Long
Public Declare PtrSafe Function WSAStartup Lib "wsock32.dll" (ByValwVersionRequired As Long, lpWSAData As WSAData) As Long
Public Declare PtrSafe Function WSACleanup Lib "wsock32.dll" () As Long
Public Declare PtrSafe Function WSAUnhookBlockingHook Lib "wsock32.dll" () As Long
Public Declare PtrSafe Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Global hSock As Long
Dim command_Error As Long
Dim No_Error As Long



Public Function ConnectServer(ByVal HostName As String, ByVal PortNumber As Integer) As Integer

Dim StartUpInfo As WSAData
'Version 1.1 (1*256 + 1) = 257
'version 2.0 (2*256 + 0) = 512
'Get WinSock version
'Initialize Winsock DLL
x = WSAStartup(257, StartUpInfo)

Dim I_SocketAddress As sockaddr_in
Dim ipAddress As Long
Dim OpenSocket As Long
Dim command_Error As Long
    ipAddress = inet_addr(HostName) '...........(1)
    'Create a new socket
    hSock = socket(AF_INET, SOCK_STREAM, 0) '
    If hSock = SOCKET_ERROR Then '
        MsgBox ("ERROR: socket = " + str$(hSock)) '...........(2)
        OpenSocket = command_Error '
        GoTo end1
    End If '
    'Open a connection to a server
    I_SocketAddress.sin_family = AF_INET '
    I_SocketAddress.sin_port = htons(PortNumber) '...........(3)
    I_SocketAddress.sin_addr = ipAddress '
    I_SocketAddress.sin_zero = String$(8, 0) '
    x = connect(hSock, I_SocketAddress, Len(I_SocketAddress)) '
    If hSock = SOCKET_ERROR Then '
        MsgBox ("ERROR: connect = " + str$(x)) '..(4)
        OpenSocket = command_Error '
    Else
        OpenSocket = hSock
    End If
end1:
End Function
Public Function RecData(dataBuf As String, ByVal maxLength As Integer) As Integer
Dim count As Long
Dim c As String * 1
Dim length As Integer
Dim RECV_ERROR As Long
Dim No_Error As Long
Dim RecvAscii As Long
    dataBuf = ""
    While length < maxLength
        DoEvents
        count = recv(hSock, c, 1, 0) '
        If count < 1 Then '
            RecvAscii = RECV_ERROR '............(1)
            dataBuf = Chr$(0) '
            GoTo EndRec
        End If '
        If c = Chr$(10) Then '
            dataBuf = dataBuf + Chr$(0) '............(2)
            RecvAscii = No_Error '
            GoTo EndRec
        End If '
        length = length + count '............(3)
        dataBuf = dataBuf + c '
    Wend
    RecvAscii = RECV_ERROR
EndRec:
End Function

Public Sub Disconnect()
    x = closesocket(hSock)
    If x = SOCKET_ERROR Then
        MsgBox ("ERROR: closesocket = " + str$(x))
    End If

    'Shutdown Winsock DLL
    x = WSACleanup()
End Sub
Public Function Sendcommand(ByVal command As String) As Integer
Dim strSend As String
Dim count As Long
    strSend = command + vbCrLf
    count = send(hSock, ByVal strSend, Len(strSend), 0)
    If count = SOCKET_ERROR Then
        MsgBox ("ERROR: send = " + str$(count))
        Sendcommand = command_Error
    Else
        Sendcommand = No_Error
    End If
End Function

' Sind Daten angekommen ?
Public Function DataComeIn(ByVal hSock As Long) As Long
  Dim Tmpstr As String * 1
    Dim strD As String
  DataComeIn = recv(hSock, ByVal Tmpstr, Len(Tmpstr), MSG_PEEK)
  If DataComeIn = -1 Then
        DataComeIn = WSAGetLastError()
  End If
End Function
Public Function GetData(ByVal hSock As Long) As String
  Dim Tmpstr As String * 4096, retVal As Long

  retVal = recv(hSock, ByVal Tmpstr, Len(Tmpstr), 0&)
  GetData = left$(Tmpstr, retVal)
End Function

Public Function OH_Test()

Call tcpClient.ConnectServer("192.168.10.11", 5080)
'Call tcpClient.ConnectServer("10.13.45.192", 1234)
'Call tcpClient.Sendcommand("contact?call=0041 447358184")
Call tcpClient.Sendcommand("tksuite:#21?call")

'Call tcpClient.Sendcommand("RM")
Call tcpClient.Disconnect
End Function
