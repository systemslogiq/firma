Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'=============================================
'Author:        OH
'Create date:   090108
'last Update:   100928 Input Matthias
'
'Description:   VBA Form PF_Leistung
'=============================================*/
Option Compare Database
Option Explicit
Dim strQ As String
Dim blV As Boolean
Private Sub Form_Open(Cancel As Integer)    '180423: OA/OH
On Error GoTo ErrMsg
    Dim lgVGdet As Long
    strQ = "Exec dbo.spa_LeistungPF @x = "
    lgVGdet = Val(Nz(OpenArgs, "0"))
    If lgVGdet = 0 Then
        Cancel = True
        GoTo ErrEnd
    End If
    strSQL = strQ & "'lstAct'"
    OH_A "lstAct", strSQL, Me
    strSQL = strQ & "'ID'" & _
            ",@i =  " & lgVGdet
    OH_SetRS Me, , strSQL
    strSQL = strQ & "'lstLeistung'" & _
            ", @i = " & lgVGdet
    OH_A "LstLeistung", strSQL, Me
    strSQL = strQ & "'NrBearbeiter'"
    OH_A "NrBearbeiter", strSQL, Me
    Me!NrBearbeiter = lguser
    Me!BemLeistung = Null
    Me!AnzahlLeistung = Null
    Me!InfoLeistung = Null
    Me!std = 0
    Me!min = 0
    Me!DatumTag = Date
    s = Nz(Me!verrechenbar, "")
    If s = "NICHT VERRECHENBAR" Then
        Me!StatusLeistung = 0
    End If
    Me!DatumTag.SetFocus
    Me.Caption = s & " Leistungen Pos. " & _
                Me!Position & " bestellt: " & Me!AnzahlVG & " " & Me!LiefereinheitVG & " " & Me!ArtikelText
    blV = Me!LiefereinheitVG = "Std."
    Me!AnzahlLeistung.Visible = Not blV
    Me!std.Visible = blV
    Me!min.Visible = blV
    If blV Then
        OH_Number Me, Me!std, 20, 0
        OH_Number Me, Me!min, 55
    End If
    OH_Move Me, 180, 107, 165, 105
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "PF_Leistungen: Form_open"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    If OH_isloaded("F_VG") Then
        OH_RQ Forms!F_VG!LstLeistung
    End If
    If OH_isloaded("F_Adresse") Then
        OH_RQ Forms!F_Adresse!LstLeistung
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Close"
    Resume ErrEnd
End Sub
Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strBO As String
    Dim strBN As String
    Dim lgVG As Long
    Dim lgL As Long
    DoCmd.Hourglass True
    Select Case Me!lstact
    Case 0
        DoCmd.Close acForm, Me.Name
    Case 10
        If OH_ok > 0 Then
            Form_Open (0)
        End If
    Case 11
        If OH_ok > 0 Then
            DoCmd.Close acForm, Me.Name
        End If
    Case 12
        lgL = OH_ok
        If lgL > 0 Then
            lgVG = Me!NrVG
            OH_OF "F_Leistung", lgL
            DoCmd.Close acForm, Me.Name
        End If
    Case 20
        'füge den Projektleiter ein in Bemerkungsfeld
        If InStr(Nz(Me!BemLeistung, ""), Me!PL) = 0 Then
            Me!BemLeistung = Trim(Me!BemLeistung & " " & Me!PL)
        End If
    Case 21
        'füge  "Mail an Projektleiter" ein in Bemerkungsfeld
        s = "siehe Mail vom " & Me!DatumTag & " an " & Me!PL
        If InStr(Nz(Me!BemLeistung, ""), s) = 0 Then
            If IsNull(Me!BemLeistung) Then
                Me!BemLeistung = s
            Else
                Me!BemLeistung = Me!BemLeistung & " (" & s & ")"
            End If
        End If
    Case 22
        s = "Team-Viewer-Session vom " & Me!DatumTag & " mit " & Me!PL
        If InStr(Nz(Me!BemLeistung, ""), s) = 0 Then
            If IsNull(Me!BemLeistung) Then
                Me!BemLeistung = s
            Else
                Me!BemLeistung = Me!BemLeistung & " (" & s & ")"
            End If
        End If
    Case 23
        strBO = Nz(Me!BemLeistung, "")
        OH_Openlexikon "Bemerkungen Leistungen", , , "BemLeistung", , False
        If strBO <> "" Then
            strBN = Nz(Me!BemLeistung, "")
            If strBN <> "" And strBN <> strBO Then
                t = "bestehender Eintrag!"
                s = "Soll der bestehende Eintrag überschrieben werden?"
                i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
                Select Case i
                Case vbCancel
                    Me!BemLeistung = strBO
                Case vbNo
                    Me!BemLeistung = strBO & strBN
                End Select
            End If
        End If
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstact_Afterupdate"
    Resume ErrEnd
End Sub
Private Sub DatumTag_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!DatumTag, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub

Private Sub AnzahlLeistung_DblClick(Cancel As Integer)
    Me!AnzahlLeistung = Nz(Me!AnzahlLeistung, 0) + 1
End Sub
Private Sub AnzahlLeistung_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!AnzahlLeistung, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub

Private Sub std_DblClick(Cancel As Integer)
    Me!std = Me!std + 1
End Sub

Private Sub std_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!std, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "std_KeyPress"
    Resume ErrEnd
End Sub
Private Sub min_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!min, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "min_KeyPress"
    Resume ErrEnd
End Sub
Private Sub AnzahlLeistung_Click()
    OH_closeObj "PF_Kalender"
End Sub
Private Sub SpinButtonDatumTag_SpinDown()
    Me!DatumTag = Nz(Me!DatumTag, Date) - 1
End Sub
Private Sub SpinButtonDatumTag_Spinup()
    Me!DatumTag = Nz(Me!DatumTag, Date) + 1
End Sub
Private Sub SpinButtonAnzahlLeistung_SpinDown()
On Error GoTo ErrMsg
    If Me!std.Visible Then
       Me!std = Nz(Me!std, 0) - 1
    Else
       Me!AnzahlLeistung = Nz(Me!AnzahlLeistung, 0) - 0.5
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_PF_Leistung: SpinButtonAnzahlLeistung_SpinDown"
    Resume ErrEnd
End Sub
Private Sub SpinButtonAnzahlLeistung_SpinUp()
On Error GoTo ErrMsg
    If Me!std.Visible Then
       Me!std = Nz(Me!std, 0) + 1
    Else
       Me!AnzahlLeistung = Nz(Me!AnzahlLeistung, 0) + 0.5
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_PF_Leistung: SpinButtonAnzahlLeistung_SpinUp"
    Resume ErrEnd
End Sub
Private Sub SpinButtonerledigtam_Spinup()
    Me!erledigtam = Nz(Me!erledigtam, Date) + 1
End Sub
Private Sub SpinButtonerledigtam_Spindown()
    Me!erledigtam = Nz(Me!erledigtam, Date) - 1
End Sub
Public Sub btnDatumTag_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Function OH_ok() As Long
On Error GoTo ErrMsg
    Dim lgNew As Long
    OH_ok = 0
    t = Me.Caption
    If blV Then
        If OH_Validate(Me!std, "Stunden") Then GoTo ErrEnd
        Me!AnzahlLeistung = Nz(Me!std, 0) + Nz(Me!min) / 60
    Else
        If OH_Validate(Me!AnzahlLeistung, "Anzahl") Then GoTo ErrEnd
    End If
    If OH_Validate(Me!NrBearbeiter, "Mitarbeiter") Then Me!NrBearbeiter = lguser
    If OH_Validate(Me!nrVGDet, "Projekt") Then GoTo ErrEnd
    If OH_Validate(Me!DatumTag, "Datum") Then GoTo ErrEnd
    If Me!DatumTag > Date Then
        If MsgBox("Hinweis: Datum liegt in der Zukunft!", _
                vbQuestion + vbOKCancel, Me!DatumTag & " " & t) = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    If (Me!StatusLeistung = 0 And Me!verrechenbar = "verrechenbar") Or _
        (Me!StatusLeistung <> 0 And Me!verrechenbar = "Nicht verrechenbar") Then
        If MsgBox("Datum" & vbTab & Me!DatumTag & vbNewLine & _
                  "Anzahl" & vbTab & Me!AnzahlLeistung & " " & Me!LiefereinheitVG & vbNewLine & _
                  "Artikel" & vbTab & left(Me!BemLeistung, 50) & vbNewLine & vbNewLine & _
                  "Sind die Std. verrechenbar ?", _
                vbQuestion + vbYesNo, t) = vbYes Then
            Me!StatusLeistung = 1
        Else
            Me!StatusLeistung = 0
        End If
    End If
    If Me!AnzahlLeistung = 0 Then
        If MsgBox("Hinweis: Sie haben keine (0) " & Me!LiefereinheitVG & " erfasst!" & vbNewLine & vbNewLine & _
                   "Ist das so in Ordnung???", vbExclamation + vbYesNo, t) = vbNo Then
            Me!std.SetFocus
            GoTo ErrEnd
        End If
    End If
    '250610 Separator verbessert Input Gerd.
    s = OH_RPL(Format(Nz(Me!DatumTag, Date), "YYYYMMDD") & "$|" & _
            Nz(Me!NrBearbeiter, lguser) & "$|" & _
            Nz(Me!AnzahlLeistung, 0) & "$|" & _
            Me!BemLeistung & "$|" & _
            Me!InfoLeistung & "$|" & _
            Me!StatusLeistung)
    strSQL = strQ & _
            " 'InsertLeistung'" & _
            ", @i = " & Me!nrVGDet & _
            ", @d = '" & s & "'"
    OH_r r
    OH_ok = r!ID
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Private Sub LstLeistung_DblClick(Cancel As Integer)
' OHNEMUS, Sonntag, 4. November 2007
On Error GoTo ErrMsg
    OH_OF "F_Leistung", Nz(Me!LstLeistung, 0)
    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Leistung.lstLeistung_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnBemleistungtextBaustein_Click()
On Error GoTo ErrMsg '170728 Idee Gerd
    Dim strBN As String
    Dim strBO As String
    strBO = Nz(Me!BemLeistung, "")
    Me!BemLeistung.SetFocus
    OH_Openlexikon "Bemerkungen Leistungen", , , "BemLeistung", Me, False
    If strBO <> "" Then
        strBN = Nz(Me!BemLeistung, "")
        If strBN <> "" And strBN <> strBO Then
            t = "bestehender Eintrag!"
            s = "Soll der bestehende Eintrag überschrieben werden?"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbCancel
                Me!BemLeistung = strBO
            Case vbNo
                Me!BemLeistung = strBO & strBN
            End Select
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "btnBemleistungtextBaustein_Click"
    Resume ErrEnd
End Sub
