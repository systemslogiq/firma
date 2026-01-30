Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Compare Database
Option Explicit
Dim lgid As Long
Dim strAblageZertifikate As String
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    OH_A "lstB2BEx", , Me
    i = Me!lstB2BEx.ListCount
    OH_A "lstB2BExAct", "@i = " & i, Me
    Me!lstB2BExAct = 12
    lstB2BExAct_AfterUpdate
    Me!lstB2BEx = Me!lstB2BEx.column(0)
    OH_Move Me, 10, 10, 460, 250
    s = "Übersicht von Lagerabrufen, bei denen NNT die ausgelieferte Menge bereits mitgeteilt hat."
    Me.Caption = s
ErrEnd:
    DoCmd.Hourglass False
Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmB2B.Form_Load"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmB2B.Form_Activate"
    Resume ErrEnd
End Sub

Private Sub lstB2B_DblClick(Cancel As Integer)
    t = Nz(Me!lstB2B.column(0), "") & " - " & Nz(Me!lstB2B.column(1), "")
    s = Nz(Me!lstB2B.column(2), "")
    MsgBox s, vbInformation, t
End Sub

Private Sub lstB2BEx_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgcolor As Long
    With Me!lstB2B
        If .Visible Then
            OH_A "lstB2B", "@i = " & Nz(Me!lstB2BEx, 0)
            Select Case Nz(Me!lstB2BEx.column(19))
            Case "NEIN"
                lgcolor = vbRed
            Case "JA"
                lgcolor = vbGreen
            Case "  ?"
                lgcolor = vbYellow
            Case Else
                lgcolor = vbMagenta
            End Select
            .BackColor = lgcolor
        End If
    End With
ErrEnd:
    DoCmd.Hourglass False
Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmB2B.lstB2BEx_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstB2BExAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgVG38 As Long
    Dim lgid As Long
    Dim lgVG As Long
    Dim lgact As Long
    Dim lgct As Long
    Dim strQ As String
    Dim strQx As String
    Dim strM As String
    Dim strAttach As String
    Dim strB2B_OutlookFolder As String
    Dim oFolder As Outlook.Folder
    Dim oMail As Outlook.MailItem
    Dim strFile As String
    Dim lgW As Long
    Dim rB2B As ADODB.Recordset
    Dim rB2Bx As ADODB.Recordset
    Dim rB2By As ADODB.Recordset
    Dim lgSendMail As Long '0 = nur Display, 1 = Direkt versenden, 2 nur display und in DMS speichern, 3 direkt versenden und in DMS speichern
    DoCmd.Hourglass True
    lgact = Nz(Me!lstB2BExAct, 0)
    lgid = Nz(Me!lstB2BEx, 0)
    lgVG = Nz(Me!lstB2BEx.column(3), 0)
    OH_A "@x = 'lstB2BExAct'" & _
        ", @a = " & lgact & _
        ", @i = " & lgid & _
        ", @u = " & lguser, , Me
    strQ = strSQL
    t = Nz(Me!lstB2BExAct.column(1), "")
    Select Case lgact
    Case 10, 20, 21, 30, 31, 32, 33, 34
        If lgid = 0 Then
            s = "Bitte eine Zeile markieren"
            GoTo ErrM
        End If
    End Select
    Select Case lgact
    Case 10
        OH_r r
        s = Nz(r!Bem, "")
        i = r!notok
        If i <> 0 Then
            GoTo ErrM
        End If
        If s <> "" And r!OK = "JA" Then
            MsgBox s, vbExclamation, t
        End If
        OH_RQ Me!lstB2BEx, lgid
    Case 12
        lgW = Me!lstB2BExAct.left
        With Me!lstB2B
            .Visible = Not .Visible
            If .Visible Then
                lgW = Me!lstB2B.left
                lgid = Nz(Me!lstB2BEx, 0)
                If lgid = 0 Then
                    lgid = Me!lstB2BEx.column(0, 1)
                End If
                Me!lstB2BEx = lgid
                lstB2BEx_AfterUpdate
            End If
        End With
        Me!lstB2BEx.Width = lgW - 100
    Case 20, 21
        OH_r r
        i = r!CT
        Select Case i
        Case 0
            s = "Keine Daten auf <Ausführen> gesetzt" & vbNewLine & vbNewLine & _
                "Daten mit <!!> können mit Doppelklick auf <JA> gesetzt werden"
            GoTo ErrM
        Case 1
            s = "EIN Lagerabruf"
        Case Else
            s = i & " Lagerabrufe"
        End Select
        s = s & " mit <JA> markiert" & vbNewLine & vbNewLine & _
            "neue Vorgänge erstellen " & vbNewLine & _
            "und im Ausgangsordner von Outlook ablegen" & vbNewLine & vbNewLine & _
            "57er Lagerabruf" & vbNewLine & _
            "37er Lieferschein" & vbNewLine
        If lgact = 20 Then
            s = s & "51er Rechnung"
        End If
        s = s & vbNewLine & vbNewLine & _
            "bereits erstellte Vorgänge werden nicht nochmal erzeugt!" & vbNewLine & _
            "Vorgänge mit Status versendet oder erledigt werden nicht nochmal gemailt!"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
            strSQL = strQ & ",@b =10"
            OH_r r
            s = r!Msg
            If s = "" Then
                s = "Keine neuen Vorgänge erstellt"
            End If
            s = "Ergebnis:" & vbNewLine & _
                "================" & vbNewLine & _
                s
            s = s & vbNewLine & vbNewLine & _
                "Erstelle Outlook-Mails" & vbNewLine & _
                "für noch nicht versendete 37er und 51er" & vbNewLine & vbNewLine & _
                "JA" & vbTab & "nur Anzeigen" & vbNewLine & _
                "NEIN" & vbTab & "DIREKT versenden!!"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            Case vbYes
                Me!lstB2BExAct = 25
            Case vbNo
                Me!lstB2BExAct = 26
            End Select
            lstB2BExAct_AfterUpdate
        End If
    Case 25, 26
        strM = ""
        OH_A "@x = 'Ablage Outlook'", , Me
        OH_r r
        strB2B_OutlookFolder = Nz(r!B2B_outlookFolder, "")
        OH_r rB2B, strQ
        While Not rB2B.EOF
            lgSendMail = 2
            lgid = rB2B!ID
            lgVG38 = rB2B!nrVG38
            If lgact = 26 Then
                If rB2B!MailinDMS = 0 Then
                    lgSendMail = 1
                Else
                    lgSendMail = 3
                End If
            End If
            If rB2B!stopp = 1 Or lgact = 25 Then 'Email darf nicht direkt versendet werden
                If rB2B!MailinDMS = 0 Then
                    lgSendMail = 0
                Else
                    lgSendMail = 2
                End If
            End If
            strAttach = ""
            strSQL = strQ & ", @nrvg37 = " & lgid
            OH_r rB2By
            While Not rB2By.EOF
                For i = 1 To 4 '3
                    strFile = ""
                    t = " als Anhang zu Outlook"
                    Select Case i
                    Case 1
                        t = "Zertifikatfile"
                        strFile = Nz(rB2By!Zertifikatfile, "")
                    Case 2
                        t = "Waagschein"
                        If Val(Nz(rB2By(t), "")) > 0 Then
                            strFile = OH_ELO_getFile(rB2By(t), t)
                        End If
                    Case 3
                        t = "CMR"
                        If Val(Nz(rB2By(t), "")) > 0 Then
                            strFile = OH_ELO_getFile(rB2By(t), t)
                        End If
                    Case 4
                        t = "Zollpapiere"
                        If Val(Nz(rB2By(t), "")) > 0 Then
                            strFile = OH_ELO_getFile(rB2By(t), t)
                        End If
                    End Select
                    If strFile <> "" Then
                        t = t & " als Anhang zu Outlook"
                        If left(strFile, 6) = "Failed" Then
                            s = strFile
                            GoTo ErrM
                        End If
                        If Len(Dir(strFile)) = 0 Then
                            s = strFile & vbNewLine & _
                                "ist nicht zu finden"
                            GoTo ErrM
                        End If
                        If strAttach = "" Then
                            strAttach = strFile
                        Else
                            strAttach = strAttach & ";" & strFile
                        End If
                    End If
                Next i
            rB2By.MoveNext
            Wend
            OH_OF "F_VG", lgid
            Set f = Forms!F_VG
            If f!NrVG = lgid Then
                If Not OH_PDFOutlook(lgid, strAttach, strB2B_OutlookFolder, lgSendMail) Then
                    s = strM & vbNewLine & "Erstelle Outlook-Mail mit ID = " & lgid & vbNewLine & vbNewLine & _
                        "ist etwas schief gelaufen"
                    GoTo ErrM
                Else
                    strQx = strQ & _
                            ",@NrVG = " & lgid & _
                            ",@nrVG38 =" & lgVG38
                    OH_r rB2Bx, strQx
                    strM = strM & rB2Bx!Msg
                    If f!NrQK = 51 Then '251117 Prüfe, ob eine Gelangensbestätigung erforderlich ist, wenn ja, erstelle das Mail dazu!
                        'Gelangensbestätigung NICHT in DMS ablegen!
                        If lgSendMail = 2 Then
                            lgSendMail = 0
                        End If
                        If lgSendMail = 3 Then
                            lgSendMail = 1
                        End If
                        If OH_CheckGelangensbestätigung(lgid, , strB2B_OutlookFolder, lgSendMail) = True Then
                            strM = strM & vbNewLine & _
                                "mit Gelangsbestätigung"
                        End If
                    End If
                End If
            End If
            rB2B.MoveNext
        Wend
        OH_RQ Me!lstB2BEx, lgid
        t = "Ergebnis"
        MsgBox strM, vbExclamation, t
    Case 30, 31, 32, 33, 34 '30er
        Select Case lgact
        Case 30 '30er
            lgVG = Val(Nz(Me!lstB2BEx.column(5), 0))
        Case 31 '37er
            lgVG = Val(Nz(Me!lstB2BEx.column(7), 0))
        Case 32 '38er
            lgVG = Val(Nz(Me!lstB2BEx.column(3), 0))
        Case 33 '51er
            lgVG = Val(Nz(Me!lstB2BEx.column(8), 0))
        Case 34 '57er
            lgVG = Val(Nz(Me!lstB2BEx.column(9), 0))
        End Select
        If lgVG = 0 Then
            s = "Noch nicht erstellt"
            GoTo ErrM
        End If
        OH_OF "F_VG", lgVG
    Case 40
        strSQL = Me!lstB2BEx.Tag
        OH_r r
        OH_A "lstB2BEx", "@b = " & Nz(Me!optOK, 0), Me
        OH_RQ Me!lstB2BEx
    Case 60
        OH_EX strQ
        DoCmd.Close acForm, Me.Name
        GoTo ErrEnd
    Case 61
        OH_EX strQ
        OH_RQ Me!lstB2BEx, lgid
    Case 100
        DoCmd.Close acForm, Me.Name
        GoTo ErrEnd
    End Select
    Me!lstB2BExAct = 0

ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmB2B.lstB2BExAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub lstB2BEx_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstB2BExAct = 10
    lstB2BExAct_AfterUpdate
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "frmB2B.lstB2BEx_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub optOK_Click()
    Me!lstB2BExAct = 40
    lstB2BExAct_AfterUpdate
End Sub
