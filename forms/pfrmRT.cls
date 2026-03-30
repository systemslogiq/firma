Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strT As String
Dim strS As String
Dim lgid As Long
Dim blC As Boolean
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strTT As String
    t = Nz(Me.OpenArgs, "")
    strS = "Exec dbo.spA_Z @x = 'lstactRT'" & _
            ",@f = '" & t & "'"
    Select Case t
    Case "Kurz-Übersicht mit Bemerkungen"
        Me!rt = s
        OH_Move Me, 250, 20, 185, 220
        Me!lblMarkierung.Visible = False
        Set frm = Forms!F_VG
        t = t & " Projekt " & frm!VGID
        With Me!rt
            .Height = 16 * 567
            .BackColor = Me.Det.BackColor
            .Locked = True
        End With
        Me!lstact.Height = 1.5 * 567
        strTT = "Hier sehen Sie alle Bemerkungen zu Vorgängen im gleichen Projekt" & vbNewLine & _
            "Zum Bearbeiten öffnen SIe bitte die einzelnen Vorgänge (Doppelklick auf ID...)"
    Case Else
        With Me!rt
            .Value = ctl.Value
            .SetFocus
            .SelStart = 0
            .FontName = glstrFont
            .FontSize = ctl.FontSize
            .Locked = False
        End With
        strTT = "zum Editieren den betreffenden Text markieren und die Formatierungswerkzeuge benutzen"
        OH_Move Me, 250, 0, 185, 210
        strT = Nz(Me!rt.Value)
        OH_SetFontRT Me!rt
        t = "Editiere markierten Text"
    End Select
    OH_A "lstact", strS, Me
    Me.Caption = t
    Me!rt.ControlTipText = strTT
    Me!lstact.SetFocus

ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmRT.Form_Open"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    If blC Then
        ctl.Value = Me!rt
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmRT.Form_Unload"
    Resume ErrEnd
End Sub
Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    DoCmd.Hourglass True
    OH_Hinweis ""
    t = Nz(Me!lstact.column(1)) & " " & Me.Caption
    Select Case Val(Me!lstact)
    Case 10
        If strT <> Nz(Me!rt) Then
            Select Case ctl.Name
            Case "txtmemo"
                Set frm = Forms!F_Adresse
                ctl.Value = Me!rt
            Case "BemVGDet"
                If OH_CheckAbschluss Then
                    GoTo ErrEnd
                End If
                Set frm = Forms!F_VG
                lgid = frm!nrVGDet
                strSQL = strS & _
                        ",@id =" & lgid & _
                        ",@fi = '" & OH_RPL(Nz(Me!rt)) & "'"
                OH_EX
                ctl = Me!rt
            Case Else
                strf = ctl.Parent.Name
                Select Case left(strf, 2)
                Case "F_", "sf", "fr", "PF", "UF"
                    Set frm = ctl.Parent
                Case Else
                    strf = ctl.Parent.Parent.Name
                    Select Case left(strf, 2)
                    Case "F_", "sf", "fr", "PF", "UF"
                        Set frm = ctl.Parent.Parent
                    Case Else
                        Set frm = ctl.Parent.Parent.Parent
                    End Select
                End Select
                Select Case ctl.Name
                Case "BemAdresse", "BemFunktion"
                    Set frm = Forms!F_Adresse
                    lgid = frm!NrFunktion
                Case "BemLeistung", "InfoLeistung"
                    Set frm = Forms!F_Leistung
                    lgid = frm!NrLeistung
                Case "BemLexikon"
                    Set frm = Forms!F_Lexikon
                    lgid = frm!nrlexikon
                Case "BemStichwort"
                    Set frm = Forms!PF_Stichwort!UF_Stichwort.Form
                    lgid = frm!NrStichwort
                Case "BemArtikel"
                    Set frm = Forms!F_Artikel
                    lgid = frm!NrArtikel
                Case "VGBem"
                    Set frm = Forms!F_VG
                    lgid = frm!NrVG
                End Select
                strSQL = "Execute dbo.spa_Z " & _
                       "@x = 'Update_RT'" & _
                       ",@ID = " & lgid & _
                       ",@f = '" & ctl.Name & _
                       "',@fi = '" & OH_RPL(Me!rt) & "'"
                OH_EX
                 OH_RQf frm, lgid, ctl.Name
            End Select
        End If
        blC = False
        ctl.SetFocus
        ctl.SelStart = 0
        DoCmd.Close acForm, Me.Name
    Case 20
        DoCmd.Close acForm, Me.Name
    Case 30
        If OH_CBget(Me!rt) = "" Then
            OH_Hinweis "Kein Text vorhanden!"
        End If
    Case 31
        If IsNull(Me!rt) Then
            OH_Hinweis "Kein Text vorhanden!"
        Else
            s = Nz(Me!rt, "")
            If InStr(s, "<div>") > 0 Then
                s = "JA" & vbTab & "Kompletten Text" & vbNewLine & _
                    "NEIN" & vbTab & "nur PLAIN-Text"
                i = MsgBox(s, vbYesNo + vbQuestion, t)
                If i = vbNo Then
                    OH_CB Application.PlainText(Me!rt)
                    GoTo ErrEnd
                End If
            End If
            OH_CB Nz(Me!rt, "")
        End If
    Case 32 'Alle Leerzeilen entfernen'
        s = OH_RPL(Application.PlainText(Me!rt))
        strSQL = "Select dbo.fx_Div( 'txtBereinigen',0,'" & s & "' ,'','') as email"
        OH_r r
        s = r(0)
        Me!rt = Me!rt & s
    Case 40
        If IsNull(Me!rt) Then
            OH_Hinweis "Kein Text vorhanden!"
        Else
            Me!rt = Null
            blC = False
        End If
    Case 50 '140816
        'das komlette Feld markieren und die Mini-Toolbar zum Formatieren öffnen
        With Me!rt
         .SetFocus
         .SelStart = 0
         .SelLength = Len(Nz(.Text, ""))
        End With
        'DoCmd.ShowToolbar oder so???
    Case 60
        Me!rt = Application.PlainText(Nz(Me!rt))
    Case 70 'Rechtschreib-Prüfung'
        Set ctl = Me!rt
        If IsNull(Len(ctl)) Or Len(ctl) = 0 Then
            s = "enthält keinen Text!"
            GoTo ErrM
        End If
        With ctl
            .SetFocus
            .SelStart = 0
            .SelLength = Len(Nz(ctl, "xxx"))
        End With
        DoCmd.SetWarnings False
        DoCmd.RunCommand acCmdSpelling
        DoCmd.SetWarnings True
    Case 100 'neuen Vorgang erstellen'
        frm.SetFocus
        DoCmd.openForm "PF_NeuVG", , , , , , "X" & frm!NrVG
        DoCmd.Close acForm, Me.Name
    Case 110
        If lgid > 0 Then
            With frm!lstDet
                For i = 0 To .ListCount - 1
                    If lgid = .column(0, i) Then
                        .Selected(i) = True
                    Else
                        .Selected(i) = False
                    End If
                Next i
            End With
            frm!lstVG = lgid
            OH_SetRS frm, lgid
            frm!vgbem.SetFocus
        End If
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "pfrmRT.lstAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Function OH_Hinweis(strM As String)
On Error GoTo ErrMsg
    Me!lblHinweis.Visible = False
    If strM <> "" Then
        Me!lblHinweis.Visible = True
        Me!lblHinweis.Caption = strM
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmRT.OH_Hinweis"
    Resume ErrEnd
End Function
Private Sub RT_AfterUpdate()
On Error GoTo ErrMsg
    blC = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmRT.RT_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub rt_LostFocus()
    lgid = Val(Replace(Me!rt.SelText, "ID:", ""))
End Sub
