Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim f As Form
Dim strLst(1 To 5) As String
Dim strS As String
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim lgid As Long
    DoCmd.Hourglass True
    Set f = Forms!F_VG
    f.regd = 5 'Focus auf Artikelliste setzen
    f.OH_CheckSollHaben
    strS = "Exec dbo.spa_VG " & _
            "@x = 'CheckVG'" & _
            ",@i = " & f!NrVG & _
            ","
    strSQL = strS & " @f = 'AnzahlArtikel'"
    OH_r r
    lgA = r!AnzahlArtikel
    If lgA = 0 Then
        s = "Der Vorgang hat noch KEINE Artikel; bitte zuerst zuordnen!"
        GoTo ErrM
    End If
    strSQL = strS & " @f = 'LstMWST'"
    OH_A "lstMWST", strSQL, Me
    strSQL = strS & " @f = 'lstVGDet'"
    OH_A "lstVGDet", strSQL, Me
    Me!lstVGDet.Selected(1) = True
    strSQL = "Exec dbo.spa_VG " & _
        " @x = 'USt-Id'," & _
        " @i = " & f!NrFirma
    OH_A "lstIhreUSTID", strSQL, Me
    strSQL = "Exec dbo.spa_VG " & _
            " @x = 'USt-Id'" & _
            ", @i = " & EFNr & _
            ", @f = " & f!NrQK   '<R74>
    OH_A "lstUnsereUSTID", strSQL, Me
    strSQL = strS & " @f = 'lstWarengruppe'"
    OH_A "lstWarengruppe", strSQL, Me
    strSQL = strS & " @f = 'Values'"
    OH_r r
    While r.EOF = False
        Select Case r!w
        Case "MWST"
            Me!lstMWST = Val(r!V)
            strLst(1) = Nz(Me!lstMWST)
        Case "IHRE USt-Id"
            Me!lstIhreUSTID = r!V
            strLst(2) = Nz(Me!lstIhreUSTID)
        Case "Unsere USt-Id"
            Me!lstUnsereUSTID = r!V
            strLst(3) = Nz(Me!lstUnsereUSTID)
        Case "Warengruppe"
            Me!lstWarengruppe = r!V
            strLst(4) = Nz(Me!lstWarengruppe)
        Case "Hinweis"
            Me!lstHinweis = r!V
            strLst(5) = Nz(Me!lstHinweis)
        End Select
    r.MoveNext
    Wend
    lstVGDet_AfterUpdate
    lstMWST_AfterUpdate
    Me.Caption = "Checke Konten für Vorgang " & f.pageVorgang.Caption
    OH_Move Me, 150, -10, 140, 215
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.Form_Open"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    Cancel = True
    GoTo ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    Dim lgLeft As Long
    If f.RegMain = 2 Then
        f.OH_lstArtikelafterupdate f!LstArtikel
    End If
    lgLeft = Me.WindowLeft
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmCheckVG.Form_Close"
    Resume ErrEnd
End Sub

Private Sub lstMWST_AfterUpdate()
On Error GoTo ErrMsg
    Me!lblMWST.Caption = "% MWST"
    Me!lblMWST.BackColor = vbWhite
    Me!lblMWST.ForeColor = vbBlack
    If Me!lstMWST.column(1) <> Me!lstMWST.column(2) Then
        Me!lblMWST.Caption = Me!lblMWST.Caption & " " & Me!lstMWST.column(2) & "  ???"
        Me!lblMWST.BackColor = vbRed
        Me!lblMWST.ForeColor = vbWhite
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmCheckVG.lstMWST_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstMWST_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strMWSTn As String
    Dim strMWSTo As String
    t = "Ändern der Mehrwert-Steuer"
    DoCmd.Hourglass True
    strMWSTn = Nz(Me!lstMWST.column(0), "")
    strMWSTo = Nz(Me!lstVGDet.column(4), "")
    If strMWSTo = "" Then
        s = "Markieren sie oben in der Liste die zu ändernde Mehrwert-Steuer"
        GoTo ErrM
    End If
    If strMWSTo = strMWSTn Then
        s = "Die Mehrwert-Steuer" & vbNewLine & vbNewLine & strMWSTn & vbNewLine & vbNewLine & _
           "ist bereits zugeordnet!"
        GoTo ErrM
    End If
    strSQL = strS & " @f = 'UpdateMWST'" & _
            ", @d = '" & strMWSTn & _
            "',@s1 = '" & strMWSTo & "'"
    OH_EX
    f.OH_CheckSollHaben
    Form_Open (0)
    OH_RQf f
    Me!lstMWST = strMWSTn
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstWarengruppe_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstHinweis_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgH As Long
    s = Nz(Me!lstHinweis, "")
    t = "Ändern der Hinweise"
    DoCmd.Hourglass True
    strSQL = strS & " @f = 'UpdateHinweis'" & _
            ", @d = '" & s & _
            "', @s1 = '" & Me!lstWarengruppe & "'"
    OH_EX
    OH_RQf f!UF_txt.Form
    Me!lstHinweis = lgH
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstHinweis_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstVGDet_AfterUpdate()
On Error GoTo ErrMsg
    Me!lstWarengruppe = Me!lstVGDet.column(1)
    Me!lstMWST = Me!lstVGDet.column(4)
    strSQL = "Exec dbo.spa_VG " & _
            "@x = 'CheckVG'" & _
            ",@s1 = '" & Me!lstWarengruppe & _
            "', @f = 'lstHinweis'" & _
            ", @d = " & f!NrQK
    OH_A "lstHinweis", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmCheckVG.lstVGDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstVGDet_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strWG As String
    strWG = Me!lstVGDet.column(1)
    f!WarengruppeDet.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmCheckVG.lstVGDet_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstWarengruppe_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strWGn As String
    Dim strWGo As String
    DoCmd.Hourglass True
    strWGn = Nz(Me!lstWarengruppe.column(0), "")
    strWGo = Nz(Me!lstVGDet.column(1), "")
    If strWGo = "" Then
        s = "Markieren sie oben in der Liste die zu ändernde Warengruppe"
        GoTo ErrM
    End If
    If strWGo = strWGn Then
        s = "Die Warengruppe" & vbNewLine & vbNewLine & strWGn & vbNewLine & vbNewLine & _
           "ist bereits zugeordnet!"
        GoTo ErrM
    End If
    strSQL = strS & _
            "  @f = 'UpdateWarengruppe'" & _
            ", @d = '" & strWGn & _
            "',@s1= '" & strWGo & "'"
    OH_EX
    f.OH_CheckSollHaben
    Form_Open (0)
    OH_RQ f!LstArtikel
    If f.regd = 5 Then
        OH_RQ f!LstArtikeld
    End If
    Me!lstWarengruppe = strWGn
    OH_RQf f.UF_txt.Form '200807
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstWarengruppe_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstIhreUSTID_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strUSTn As String
    DoCmd.Hourglass True
    strUSTn = Nz(Me!lstIhreUSTID.column(0), "")
    SysCmd acSysCmdSetStatus, "Update USt-Id  " & strUSTn
    If strUSTn = "" Then
        s = "Ihre USt-Id muss ausgefüllt sein!"
        GoTo ErrM
    End If
    strSQL = strS & " @f = 'Update Ihre USt-Id'" & _
            ",@d = '" & strUSTn & "'"
    OH_EX
    OH_RQf f.UF_txt.Form
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstIhreUSTID_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstUnsereUSTID_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strUSTn As String
    DoCmd.Hourglass True
    strUSTn = Nz(Me!lstUnsereUSTID.column(0), "")
    SysCmd acSysCmdSetStatus, "Update USt-Id  " & strUSTn
    If strUSTn = "" Then
        s = "Unsere USt-Id muss ausgefüllt sein!"
        GoTo ErrM
    End If
    strSQL = strS & " @f = 'Update Unsere USt-Id'" & _
            ",@d = '" & strUSTn & "'"
    OH_EX
    OH_RQf f.UF_txt.Form
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstUnsereUSTID_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnclose_Click()
On Error GoTo ErrMsg
    DoCmd.Close
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmCheckVG.btnClose_Click"
    Resume ErrEnd
End Sub
Private Sub btnHinweis_Click()
On Error GoTo ErrMsg
    Dim strUSTn As String
    DoCmd.Hourglass True
    strUSTn = Nz(Me!lstUnsereUSTID.column(0), "")
    SysCmd acSysCmdSetStatus, "Update USt-Id  " & strUSTn
    If strUSTn = "" Then
        s = "Unsere USt-Id muss ausgefüllt sein!"
        GoTo ErrM
    End If
    strSQL = "EXECUTE dbo.spI_VGDiv " & _
            " @x = '+Hinweis Vorgang'" & _
            ",@i = " & f!NrVG & _
            ",@f = '" & Nz(Me!lstWarengruppe) & "'"
    OH_EX
    OH_RQf f.UF_txt.Form
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "pfrmCheckVG.lstUnsereUSTID_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
