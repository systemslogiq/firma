Attribute VB_Name = "mdlB2B"
Option Compare Database
Option Explicit
Public Function OH_B2B(lgid As Long) As Boolean
On Error GoTo ErrMsg
    Dim strQ As String
    Dim strFunction As String
    Dim lgM As Long
    Dim lgact As Long
    Set f = Forms!F_VG
    strFunction = "OperationRequest"
    t = strFunction
    OH_A "@x = 'checkTexteVG'" & _
         ",@i = " & f!NrVG & _
         ",@f ='Versandart'", , f
    OH_r r
    s = r!Msg
    Select Case s
    Case "OperationRequest"
    Case Else
        s = "geht nur bei Versandart = " & strFunction
        GoTo ErrM
    End Select
    OH_A "@x = 'checkTexteVG'" & _
         ",@i = " & f!NrVG & _
         ",@f ='OperationalIndicationCode'", , f
    OH_r r
    While Not r.EOF
        s = r!Msg
        Select Case s
        Case "PAC - MEE", "COA-MEE"
            strQ = "EXECUTE spA_B2B @x ='CheckDocuments'" & _
                    ",@nrVG = " & lgid & _
                    ",@f = '" & s & "'"
            OH_r rx, strQ
            If rx.BOF Then 'ELO-Doku suchen und zuordnen

            End If
        End Select
    r.MoveNext
    Wend
    strQ = "EXECUTE spA_B2B @x ='" & strFunction & "',@nrVG = " & lgid
    t = strFunction
    Select Case strFunction
    Case "OperationRequest"
        strSQL = strQ
        OH_r r
        lgact = r!act
        s = r!Msg
        lgM = r!ID
        Select Case lgact
        Case 1
            GoTo ErrM
        Case 2, 3, 4
            If MsgBox(s, vbOKCancel + vbDefaultButton2 + vbQuestion, t) = vbOK Then
                strSQL = strQ & _
                    ",@a = " & lgact & _
                    ",@i = " & lgM
                OH_r r
                s = strFunction & " wurde NICHT erstellt"
                i = r!CT
                If i <> 1 Then
                    GoTo ErrM
                Else
                    s = Replace(s, "NICHT", "")
                    SysCmd acSysCmdSetStatus, s
                    OH_B2B = True
                End If
            End If
        End Select
        OH_closeObj glstrB_VG, acReport
    End Select

ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_B2B"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Function OH_IsB2BServiceReady(strURL As String) As Boolean
On Error GoTo ErrMsg
    Dim http As Object
    DoCmd.Hourglass True
    t = "Microservice Connection B2B"
    Set http = CreateObject("MSXML2.XMLHTTP")
    http.Open "GET", strURL, False
    http.send
    OH_IsB2BServiceReady = (http.status = 200)
    s = strURL & vbNewLine & vbNewLine & "Service is not running!"
    If OH_IsB2BServiceReady Then
        s = Replace(s, "not ", "")
        MsgBox s, vbExclamation, t
    Else
        GoTo ErrM
    End If
ErrEnd:
   DoCmd.Hourglass True
   Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_IsB2BServiceReady"
    Resume ErrM
ErrM:
    MsgBox strURL & vbNewLine & s, vbCritical, t
    GoTo ErrEnd
End Function
