Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
    Dim lgTop(1 To 3) As Long
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    MsgBox DataErr
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    Me.RecordSource = ""
    Me.AllowAdditions = False
    OH_A "StichwortGr", , Me
    OH_A "NrFunktion", , Me
    s = "Bemerkungen zum Stichwort" & vbNewLine & _
    "Die Aufklappliste zeigt alle jemals getätigten Einträge zu diesem Stichwort" & vbNewLine & _
    "Wenn ein Wert mit einer Einheit vermutet wird, wird der Wert und die Einheit unten separat angezeigt."
    Me!comBemStichwort.ControlTipText = s
    s = "Einheit (erfasst in den Bemerkungen zum Stichwort)"
    Me!bemEinheit.ControlTipText = s
    s = "Wert (erfasst in den Bemerkungen zum Stichwort)"
    Me!bemwert.ControlTipText = s
    'merke die Grundeinstellung Top
    lgTop(1) = Me!Stichwort.top + 2 * Me!Stichwort.Height + 0.2 * 567
    lgTop(2) = lgTop(1) + Me!Stichwort.Height + 0.1 * 567
    OH_SetFontRT Me!BemStichwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strT As String
    If OH_CheckAdmin(Me!Stichwort & " " & Me!BemStichwort & " Speichern") = True Then
        GoTo ErrM
    End If
    If OH_CheckAdmin(Me!Stichwort.OldValue) = True Then
        GoTo ErrM
    End If
    strT = Replace(Parent!ID.Tag, "ID", "Nr")
    If OH_Validate(Me!Stichwort, "Stichwort") Then Cancel = True: Exit Sub
    Me(strT) = Parent!ID
    Me!StichwortNr = OH_NextStichwortNr(Nz(Me!StichwortNr, 0), Me(strT), Parent!ID.Tag)
    OH_SaveRecord
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "Form_BeforeUpdate"
    Resume ErrM
ErrM:
    Cancel = True
    Me.Undo
    GoTo ErrEnd
End Sub
Private Function OH_SaveRecord()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim strf As String
    lgA = Nz(Me!NrStichwort, 0)
    strSQL = "Select top 1 * from T_Stichwort where NrStichwort = " & lgA
    OH_r rx, , , rrLockOptimistic
    For i = 1 To rx.Fields.count - 1
        strf = rx.Fields(i).Name
        Select Case strf
        Case "NrStichwort", "lastupdate", "whoupdate", "Stichworterfasst"
        Case Else
            rx(strf) = Me(strf)
        End Select
    Next i
    rx.Update
    Me.Undo
    OH_RQf Me, lgA
ErrEnd:
    OH_ResetRS rx
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Stichwort OH_SaveRecord"
    Resume ErrEnd
End Function
Private Sub Form_Current()
On Error GoTo ErrMsg
    Dim lgT As Long
    Dim lgL As Long
    Dim c As control
    Me!bemEinheit = ""
    Me!bemwert = ""
    Me!bemEinheit = Me!einheit
    Me!bemwert = Me!wert
    '210518 das Bemerkungsfeld BemStichwort ist Richtext.
    'in Anhängigkeit von der Eintragslänge vergrössert/verleinert sich das Feld "BemStichwort"
    lgL = Len(Me!BemerkungStichwort)
    lgT = 0
    If lgL > 40 Or InStr(Me!BemStichwort, Chr(13)) > 0 Then
        lgT = 1.5 * 567
    End If
    If lgT <> lgTop(3) Then 'nur wenn sich die Feldgrösse ändern muss
        If lgT = 0 Then
            Me!BemStichwort.Height = Me!Stichwort.Height
        Else
            Me!BemStichwort.Height = 2 * 567
        End If
        For Each c In Me.fh.Controls
            Select Case c.Tag
            Case "top1"
                c.top = lgTop(1) + lgT
            Case "top2"
                c.top = lgTop(2) + lgT
            End Select
        Next
        Me.fh.Height = lgTop(2) + lgT + 0.6 * 567
    End If
    lgTop(3) = lgT 'die zuletzt eingestellte Feldgrösse "merken"
    Y = Nz(Me!NrStichwort, 0) '250204 kleiner Trick mit y, um das aktuelle Stichwort nach requery zu finden
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "Form_Current"
    Resume ErrM
ErrM:
    GoTo ErrEnd
End Sub
Public Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strSignatur As String
    Set ctl = Me!BemStichwort
    Dim strA As String
    If Not IsNull(Me!Stichwort) Then
        If IsNull(Me!BemStichwort) Then
            OH_CB (Me!Stichwort)
        Else
            OH_CB (Me!BemStichwort)
        End If
    End If
    Parent.Reg = 1
    Set frm = Forms!PF_Stichwort
    Set ctl = frm!Stichwort
    For i = 0 To ctl.ListCount - 1
        If ctl.column(0, i) Like Me!Stichwort Then
            ctl.Selected(i) = True
            If IsNull(Me!BemStichwort) = False Then
                OH_A "BemStichwort", _
                    "@cID ='" & Parent!ID.Tag & _
                    "',@fi ='" & OH_RPL(Me!Stichwort) & _
                    "',@st = 3"
                frm!BemStichwort = Me!BemStichwort
            End If
            Exit For
        Else
            ctl.Selected(i) = False
        End If
    Next i
    If Parent!ID.Tag = "NrFunktion" Then
        Set frm = Forms!F_Adresse
        Select Case left(Me!Stichwort, 3)
        Case "Ass", "Lea"  'Assistant, Lead
            OH_OF "F_Adresse", 0, 0, "Namen like ''" & Me!BemStichwort & "''"
            frm!RegMain.Value = 0
        Case "Tel"
            OH_DialTelefon Me!NrFunktion, Me!BemStichwort, frm!namen
        Case "ema"
            If InStr(Me!BemStichwort, "@") > 0 Then
                If OH_Validate(frm!NrMitarbeiter, "Mandant") = True Then
                    Exit Sub
                End If
                If MsgBox("Mail starten?", vbQuestion + vbYesNo + vbDefaultButton2, _
                          frm!Nachvorname) = vbNo Then GoTo ErrEnd
                strEmail = Nz(Me!BemStichwort, "")
                OH_OutlookMail _
                    strEmail, _
                     "", _
                     "", _
                    frm!NrFunktion, _
                    Nz(frm!comBeilage), , , , , frm
            Else
                Me!BemStichwort.SetFocus
            End If
        End Select
        Select Case Me!Stichwort
        Case "Handy"
            OH_DialTelefon Me!NrFunktion, Me!BemStichwort, frm!namen
        End Select
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Me.AllowAdditions = False
   ' Form_Current
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Form_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    If MsgBox("Möchten Sie die markierten Stichworte löschen?", _
        vbQuestion + vbOKCancel, "LÖSCHEN") = vbCancel Then
        Cancel = True
    Else
        Cancel = False
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub Form_AfterDelConfirm(status As Integer)
On Error GoTo ErrMsg
    OH_RQf Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Form_AfterDelConfirm"
    Resume ErrEnd
End Sub
Private Sub BemStichwort_AfterUpdate()
On Error GoTo ErrMsg
    If Nz(Me!BemStichwort, "") <> "" Then
        If DateDiff("s", Me!LastUpdate, Now) < 20 Then
            t = "Neues Stichwort?"
            s = "Weiteres Stichwort erfassen?"
            If MsgBox(s, vbQuestion + vbYesNo, t) = vbYes Then
                OH_SaveRS Me
                btnNeu_Click
                GoTo ErrEnd
            End If
        End If
        OH_SaveRS Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemStichwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnHyperlink_Click()
On Error GoTo ErrMsg
    Me!StichwortHyperlink.SetFocus
    DoCmd.RunCommand acCmdEditHyperlink
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnHyperlink_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnMarkerStichwort_Click()
On Error GoTo ErrMsg
    If IsNull(Me!MarkerStichwort) Then
        Me!MarkerStichwort.SetFocus
        Me!MarkerStichwort.Dropdown
    Else
        MsgBox "Mit dieser Einstellung können Sie das Layout der Stichworte / techn. Daten auf dem Printout beeinflussen!", , _
                Me!btnMarkerStichwort.Caption & ": " & Me!MarkerStichwort
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnMarkerStichwort_Click"
    Resume ErrEnd
End Sub
Public Sub btnNeu_Click() '200309 Input Gerd
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strGR As String
    OH_SaveRS Me
    strGR = "Technische Daten"
    Select Case Parent!ID.Tag
    Case "NrFunktion"
        strGR = Nz(Forms!F_Adresse!lstStichwortGr, "")
        Select Case strGR
        Case "Alle Stichwort-Gruppen", ""
            strGR = "Technische Daten"
        End Select
    End Select
    strSQL = "Exec spa_Stichwort " & _
            " @x = 'InsertStichwort'" & _
            ", @ID = " & Parent!ID & _
            ", @cID = '" & Parent!ID.Tag & _
            "', @Gr = '" & strGR & _
            "',@o = '-'"
    OH_r r
    lgid = r!ID
    OH_RQf Me, lgid
    Me!Stichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnNeu_Click Neues Stichwort"
    Resume ErrEnd
End Sub
Private Sub btnPrintMarkerStichwort_Click()
On Error GoTo ErrMsg
    Dim strST As String
    Dim intP As Integer
    Set ctl = Me!PrintMarkerStichwort
    i = OH_RecordcountForm(Me)
    t = Me!btnPrintMarkerStichwort.Caption
    If i = 0 Then
        MsgBox "Keine Daten vorhanden, die gedruckt werden könnten!", _
                vbExclamation, t
    Else
        strST = Trim(Me!Stichwort & " " & Me!BemStichwort)
        Select Case i
        Case 1
            i = MsgBox("Soll das Stichwort" & vbNewLine & vbNewLine & _
                       Space(10) & strST & vbNewLine & vbNewLine & _
                       "ausgedruckt werden?", vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbYes
                If ctl = False Then
                    ctl = True
                    OH_SaveRS Me
                End If
            Case vbNo
                If ctl = True Then
                    ctl = False
                    OH_SaveRS Me
                End If
            End Select
        Case Else
            s = "Hier können Sie managen, ob diese Stichworte auf dem Ausdruck erscheinen sollen!" & vbNewLine & _
                    "Ihre DB druckt nur die markierten Datensätze aus."
            x = OH_msgbox(s, _
                        Array("Alle " & i & " markieren" & vbNewLine & "===> drucken", _
                              "Marker löschen, Keine drucken", "Bis Nummer drucken....", "Ab Nummer drucken...."), _
                        vbQuestion, t, _
                        "Sie können auch die einzelnen Stichworte mit dem Häckchen markieren" & _
                        " und so individuell entscheiden, welches Stichwort gedruckt werden soll.")
            intP = Val(x)
            Select Case intP
            Case 1, 2
            Case 3, 4
                If intP = 3 Then
                    s = "Bis zu"
                Else
                    s = "Ab"
                End If
                x = Val(InputBox(s & " welcher Nummer sollen die Stichworte ausgedruckt werden?", _
                        t, 1))
                If x = 0 Then
                    intP = 0
                End If
            End Select
            If intP = 0 Then
                GoTo ErrEnd
            End If
            strSQL = "Exec dbo.spA_Stichwort " & _
                      " @cID = '" & Parent!ID.Tag & _
                      "', @id = " & Parent!ID & _
                      ", @st = 26 " & _
                      ", @fi = " & intP & _
                      ", @o =" & x
            OH_EX
            OH_RQf Me
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnPrintMarkerStichwort_Click"
    Resume ErrEnd
End Sub
Private Sub BemStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Beep
    OH_CB Nz(Me!BemStichwort, "no entry")
    Select Case Me!BemStichwort
    Case "JA"
        Me!BemStichwort = "Nein"
    Case "NEIN"
        Me!BemStichwort = "Ja"
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemStichwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub Stichwort_AfterUpdate()
On Error GoTo ErrMsg
    comBemStichwort_Enter
    If Me!comBemStichwort.ListCount > 0 Then
        Me!comBemStichwort.SetFocus
        Me!comBemStichwort.Dropdown
    Else
        Me!BemStichwort.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Stichwort_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub Stichwort_Enter()
On Error GoTo ErrMsg
    OH_A "Stichwort", _
        "@cID = '" & Parent!ID.Tag & "'", Me
    Me!Stichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Stichwort_Enter"
    Resume ErrEnd
End Sub
Private Sub StichwortGr_AfterUpdate()
On Error GoTo ErrMsg
    'bei Änderung der Stichwortgruppe soll man weitere betroffene Stichwort gleichzeitig ändern können.
    Dim lgid As Long
    Dim strQ As String
    Dim strGR As String
    Dim strGrOld As String
    Dim lgGr As Long
    Dim lgGrleer As Long
    lgid = Nz(Me!NrStichwort, 0)
    strGR = Nz(Me!StichwortGr, "")
    strGrOld = Nz(Me!StichwortGr.OldValue, "")
    t = "Stichwort-Gruppe " & strGrOld & " ==> " & strGR
    If strGR = strGrOld Then
        GoTo ErrEnd
    End If
    strQ = "Exec dbo.spA_Stichwort " & _
              " @x = 'CheckStichwortGr'" & _
              ", @i = " & lgid & _
              ", @cID = '" & Parent!ID.Tag & _
              "', @id = " & Parent!ID & _
              ", @f  = '" & strGR
    strSQL = strQ & _
              "',@d = '" & strGrOld & "'"
    OH_r r
    lgGr = Nz(r!gr, 0)
    lgGrleer = Nz(r!grLeer, 0)
    Select Case lgGrleer
    Case 0
        Select Case lgGr
        Case 0
            GoTo ErrEnd
        Case 1
            s = "EIN weiteres Stichwort"
        Case Else
            s = lgGr & " weitere Stichworte"
        End Select
        s = s & " mit der gleichen Gruppe " & strGrOld
    Case 1
        strGrOld = ""
        s = "EIN weiteres Stichwort ohne Stichwort-Gruppe"
    Case Else
        strGrOld = ""
        s = lgGrleer & " weitere Stichworte ohne Stichwort-Gruppe"
    End Select
    s = "Sie haben " & s & vbNewLine & vbNewLine & _
        "Auch entsprechend anpassen mit Stichwort-Gruppe = " & strGR
    i = MsgBox(s, vbQuestion + vbYesNoCancel + vbDefaultButton2, t)
    Select Case i
    Case vbYes
        strSQL = Replace(strQ, "'CheckStichwortGr'", "'UpdateStichwortGr'") & _
              "',@d = '" & strGrOld & "'"
        OH_EX
    Case vbCancel
        StichwortGr = strGrOld
        GoTo ErrEnd
    End Select
    OH_SaveRS Me
    OH_RQf Me, lgid
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.StichwortGr_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub StichwortLex_Enter()
On Error GoTo ErrMsg
    OH_A "StichwortLex", , Me
    Me!StichwortLex.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.StichwortLex_Enter"
    Resume ErrEnd
End Sub
Private Sub BemStichwortLex_Enter()
On Error GoTo ErrMsg
    OH_A "BemStichwortLex", "@fi = '" & OH_RPL(Me!Stichwort) & "'", Me
    Me!BemStichwortLex.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemStichwortLex_Enter"
    Resume ErrEnd
End Sub
Public Sub btnStichwort_Click()
On Error GoTo ErrMsg
    Form_DblClick (0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnStichwort_Click"
    Resume ErrEnd
End Sub
Private Sub btnStichwortNr_Click()
On Error GoTo ErrMsg
    Dim strOrder As String
    Dim strhelp As String
    s = "Stichworte neu durch-nummerieren?"
    t = Me.Caption
    strhelp = "Alle Nummern werden von 1 an neu durchgerechnet; ohne Lücke"
    i = Val(OH_msgbox(s, Array("Sortiert nach Nummer", _
                               "Sortiert nach Stichwort alphabetisch", _
                               "Sortiert nach Lastupdate", _
                               "sortiert nach ID"), _
                vbQuestion, t, strhelp))
    Select Case i
        Case 1
            strOrder = "StichwortNr,Stichwort"
        Case 2
            strOrder = "Stichwort,StichwortNr"
        Case 3
            strOrder = "Lastupdate"
        Case 4
            strOrder = "NrStichwort"
    Case 0
        GoTo ErrEnd
    End Select
    strSQL = Me.Recordset.Source & ",@o = '" & strOrder & "'"
    OH_EX
    OH_RQf Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnStichwortNr_Click"
    Resume ErrEnd
End Sub
Private Sub btnStichwortGr_Click()
On Error GoTo ErrMsg
    t = "Stichwort-Gruppe"
    s = "Sie können die Stichworte in beliebige Gruppen unterteilen." & vbNewLine & _
        "Die Gruppen sind im Lexikon abgelegt und können dort bearbeitet werden!" & vbNewLine & vbNewLine & _
        "Lexikon öffnen?"
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
        OH_Openlexikon "Stichwort-Gruppe", Nz(Me!StichwortGr, "")
    End If

ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnStichwortGr_Click"
    Resume ErrEnd
End Sub
Private Sub MarkerStichwort_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.MarkerStichwort_AfterUpdate"
    strDel = vbNullString
    Resume ErrEnd
End Sub
Private Sub PrintMarkerStichwort_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!Stichwort) = False Then
        OH_SaveRS Me
    Else
        Me!Stichwort.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.PrintMarkerStichwort_AfterUpdate"
    strDel = vbNullString
    Resume ErrEnd
End Sub
Private Sub PrintMarkerStichwortDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.PrintMarkerStichwortDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Stichwort_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    x = Me!Stichwort.OldValue
    If IsNull(Me!Stichwort) And Not IsNull(x) Then
        Cancel = True
        Me!Stichwort.Undo
        MsgBox "Zum Löschen des Stichwortes bitte Datensatz markieren und dann delete !", vbInformation + vbOK, x
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.Stichwort_BeforeUpdate"
    Resume ErrEnd
End Sub
Public Sub StichwortNr_AfterUpdate()
On Error GoTo ErrMsg
    If Parent!ID.Tag = "IDQK" Then
        i = Me!NrQK
        s = "nrQK"
    Else
        i = Me(Parent!ID.Tag).Value
        s = Parent!ID.Tag
    End If
    OH_ResetNr Me, "StichwortNr", Me!StichwortNr, Me!NrStichwort, s, i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.StichwortNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub f1_AfterUpdate()
    StichwortNr_AfterUpdate
End Sub
Private Sub StichwortNr_Enter()
On Error GoTo ErrMsg
    OH_Number Me, Me!StichwortNr
    Me!StichwortNr.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.StichwortNr_Enter"
    Resume ErrEnd
End Sub
Private Sub MarkerStichwort_Enter()
On Error GoTo ErrMsg
    OH_A "Markerstichwort", , Me
    Me!MarkerStichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.MarkerStichwort_Enter"
    Resume ErrEnd
End Sub

Private Sub btnNrFunktion_Click()
On Error GoTo ErrMsg
    t = Me!btnNrFunktion.ControlTipText
    If IsNull(Me!NrFunktion) Then
        Me!NrFunktion.SetFocus
        Me!NrFunktion.Dropdown
    Else
        s = Me!NrFunktion.column(1) & vbNewLine & _
            "Firma anzeigen und Stichworte schliessen?"
        If MsgBox(s, vbYesNo + vbQuestion, t) = vbYes Then
            OH_OF "F_Adresse", Me!NrFunktion
            DoCmd.Close acForm, "PF_Stichwort"
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnNrFunktion_Click"
    Resume ErrEnd
End Sub
Private Sub BemWert_AfterUpdate()
On Error GoTo ErrMsg
    Me!BemStichwort = Trim(Me!bemwert & " " & Me!bemEinheit)
    Me!bemEinheit.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemWert_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub bemEinheit_AfterUpdate()
On Error GoTo ErrMsg
    BemWert_AfterUpdate
    Me!BemStichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemWert_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub bemEinheit_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    t = "Erfassen einer zusätzlichen Einheit"
    s = NewData & vbNewLine & vbNewLine & _
        "ist noch nicht als (techn.) Einheit hinterlegt" & vbNewLine & vbNewLine & _
        "bitte bestätigen Sie, dass es sich um eine korrekte Einheits-Bezeichnung für <" & Me!Stichwort & "> handelt!"
    Response = acDataErrContinue
    Me!bemEinheit.Undo
    If MsgBox(s, vbYesNo + vbDefaultButton2 + vbExclamation, t) = vbYes Then
        strSQL = "Exec dbo.spA_Stichwort " & _
                  " @x = 'NeueEinheit'" & _
                  ", @id = " & Me!NrStichwort & _
                  ", @o = '" & Me!Stichwort & _
                  "',@fi = '" & NewData & _
                  "',@d ='" & OH_RPL(Me!bemwert) & "'"
        OH_EX
        OH_RQ Me!bemEinheit
        OH_RQf Me, Me!NrStichwort
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "bemEinheit_NotInList"
    Resume ErrM
ErrM:
    GoTo ErrEnd
End Sub
Private Sub btnEinheit_Click()
On Error GoTo ErrMsg
    Dim strf As String
    strf = "Einheit*" & Me!bemEinheit
    DoCmd.Close acForm, "PF_Stichwort"
    DoCmd.openForm "F_Lexikon"
    Set frm = Forms!F_Lexikon
    frm!txtFind = strf
    frm.txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnEinheit_Click"
    Resume ErrEnd
End Sub
Private Sub bemEinheit_Enter()
On Error GoTo ErrMsg
    strSQL = "EXECUTE dbo.spa_Lexikon @x = 'getEinheit'"
    OH_A "BemEinheit", strSQL, Me
    Me!bemEinheit.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "bemEinheit_Enter"
    Resume ErrEnd
End Sub
Private Sub btnWert_Click()
On Error GoTo ErrMsg
    t = Me!btnWert.ControlTipText
    s = "Der Wert und ggf. die Einheit eines Stichwortes werden gemeinsam im Bemerkungsfeld gespeichert." & vbNewLine & _
        "Handelt es sich um technische Daten mit einem Wert und einer technischen Einheit," & vbNewLine & _
        "versucht die DB die Bemerkung zu splitten und rechts getrennt als Wert und Einheit anzuzeigen!"
    MsgBox s, vbInformation, t
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnWert_Click"
    Resume ErrEnd
End Sub
Private Sub comBemStichwort_Enter()
On Error GoTo ErrMsg
    OH_A "comBemStichwort", "@fi = '" & OH_RPL(Me!Stichwort) & "'", Me
    Me!comBemStichwort.SetFocus
    Me!comBemStichwort = Me!NrStichwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.comBemStichwort_Enter"
    Resume ErrEnd
End Sub
Private Sub comBemStichwort_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_A "@x = 'SavecomBemStichwort'" & _
                ",@i =  " & Me!comBemStichwort & _
                ",@n = " & Me!NrStichwort, , Me
    OH_EX
    OH_RQf Me, Me!NrStichwort, "BemStichwort"
    Me!BemStichwort = Me!comBemStichwort.column(1)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.comBemStichwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub BemStichwort_Enter()
On Error GoTo ErrMsg
    Dim strA As String
    strA = "schrift"
    Select Case right(Me!Stichwort, Len(strA))
    Case strA, "adresse"
        Select Case Parent!ID.Tag
        Case "NrFunktion"
            If IsNull(Me!BemStichwort) Then
                With Forms!F_Adresse
                    Me!BemStichwort = _
                        !Nachname & vbNewLine & _
                        !PostAdr
                End With
                OH_SaveRS Me
            End If
        End Select
    End Select
    Me!BemStichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.BemStichwort_Enter"
    Resume ErrEnd
End Sub
Private Sub comBemStichwort_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    Me!BemStichwort = NewData
    Me!comBemStichwort.Undo
    Me!BemStichwort.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.comBemStichwort_NotInList"
    Resume ErrEnd
End Sub


Private Sub btnBemStichwort_Click()
On Error GoTo ErrMsg
    Set ctl = Me!BemStichwort
    Dim strB As String
    '===================================================
    'Idee: Unter Stichworten werden auch techn. Daten abgelegt
    'Stichwort = Spezifikation z.B. "Volumen"
    'BemStichwort = "m3"
    'Wenn nach der Übertragung von techn. Daten jetzt Werte vor "m3" eingegeben werden sollen,
    'wird dieser Vorgang mit folgender Prozedur vereinfacht:
    If InStr(Me!BemStichwort, "<div") > 0 Then
        OH_RT Me!BemStichwort
    Else
        x = 0
        If DateDiff("s", Me!LastUpdate, Date) < 20 And Nz(ctl, "") <> "" Then
            If InStr(Nz(ctl, " "), " ") = 0 Then
                If IsNumeric(ctl) = False Then
                    If Len(ctl) < 6 Then
                        strB = InputBox("Ihre DB geht davon aus, dass <" & ctl & "> eine techn. Einheit ist," & _
                                        " zu der Sie jetzt den Wert erfassen können!!" & vbNewLine & vbNewLine & _
                                        "Wert eingeben für" & vbNewLine & _
                                        Me!Stichwort & " in <" & ctl & ">", Parent.Caption & ": Wert erfassen")
                        If Len(strB) > 0 Then
                            ctl = strB & " " & ctl
                            OH_SaveRS Me
                        End If
                        x = 1
                    End If
                End If
            End If
        End If
        If x = 0 Then
            Me!BemStichwort.SetFocus
            OH_tlbZoom
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_Stichwort.btnBemStichwort_Click"
    Resume ErrEnd
End Sub
