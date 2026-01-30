Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
    Dim strFrm As String, strField As String
    Dim strOldGroup As String, lgOldGroupNr As Long
    Dim lgforecolor As Long, lgbackcolor As Long
    Dim ctlColor As control, strCaption As String
    Dim blB As Boolean
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Close()
    Me.RecordSource = ""
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    If glstrFont = "" Then
        glstrFont = "Arial"
    End If
    Me!bemLexikon.FontName = glstrFont
    OH_Number Me, Me!LexikonNr, 100, 1
    OH_A "lstA", , Me
    OH_A "lstLexikon", , Me
    OH_A "lstOrderGruppe", , Me
    OH_A "WertOH", , Me
    lstOrderGruppe_AfterUpdate
    With Me!txtFind
        .SetFocus
        .ControlTipText = "Suche mit Wildcard in den wichtigsten Feldern" & vbNewLine & _
                        "mit <Gr:> können Sie nach kompletten Gruppen suchen." & vbNewLine & _
                        "mit <S:> können Sie nach Stichworten suchen"
    End With
    s = "Sortierung der Gruppen;" & vbNewLine & _
        "mit Gruppe-Filter: können Sie auch einen dauerhaften Filter setzen."
    Me!lstOrderGruppe.ControlTipText = s
    OH_SetFontRT Me!bemLexikon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub Formname_Enter()
On Error GoTo ErrMsg
    OH_A "Formname", "@f = 'Formname', @i = " & Me!NrBoss
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Formname_Enter"
    Resume ErrEnd
End Sub
Private Sub Fieldname_Enter()
On Error GoTo ErrMsg
    OH_A "Fieldname", "@f = 'Fieldname', @i = " & Me!NrBoss
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Fieldname_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.countRec_DblClick"
    Resume ErrEnd
End Sub
Public Sub lstOrderGruppe_AfterUpdate()
On Error GoTo ErrMsg
    Dim A As Long
    Dim strf As String
    A = Nz(Me!lstOrderGruppe, 0)
    If A = 3 Then
        s = Me!lstOrderGruppe.column(1) & vbNewLine & vbNewLine & _
            "Bitte Filter für Gruppen eingeben" & vbNewLine & _
            "(Abbrechen = entfernen)"
        strf = InputBox(s, t, Me!lstOrderGruppe.column(1))
        OH_A "lstOrderGruppe", "@f = '" & strf & "'", Me
    End If
    OH_A "lsta", "@a = " & A & _
                ",@f = '" & strf & "'", Me
    Me!lstA.ColumnWidths = "0cm;1cm;5cm;1cm"
    Me!lstA.Selected(1) = True
    Me!lstA = Me!lstA.column(0)
    lstA_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "lstOrderGruppe_AfterUpdate"
    Resume ErrEnd
End Sub

Public Function OH_newLexikon()
On Error GoTo ErrMsg
    Dim strG As String
    Dim lgG As Long
    Dim strInput As String
    If OH_Perm("I", Me, "Lexikon") Then
        GoTo ErrMsg
    End If
    strG = Me!Gruppe
    lgG = Me!GruppeNr
    Dim strA(1 To 2) As String
    t = "neuer Eintrag in Lexikon"
    s = "Tragen Sie unten ein:" & vbNewLine & _
               "1. Einen neuen Begriff zu " & vbNewLine & Space(10) & " Gruppe " & lgG & " " & strG & vbNewLine & _
                vbNewLine & "   oder " & vbNewLine & vbNewLine & _
               "2. Eine neue Gruppe "

    strA(1) = "Neuer Begriff (1)"
    strA(2) = "Neue Gruppe (2)"
nochmalNeu:
    OH_msgbox s, Array(strA(1), strA(2)), vbExclamation, t, _
             "Falls Sie einen neuen Begriff für eine andere Gruppe erfassen wollen," & _
             " vorher zu dieser Gruppe gehen!", " "
    strInput = Trim(strMSG(3))
    If strInput = "" And strMSG(2) <> "Abbrechen" Then
        s = s & vbNewLine & "Eingabe erforderlich!!!"
        GoTo nochmalNeu:
    End If
    Select Case strMSG(2)
    Case strA(1)
        OH_A "@x = 'InsertLex', " & _
            " @d = '" & Me!Gruppe & _
            "',@f = '" & strInput & "'"
        OH_r r
        OH_FindLex r!NrBoss, r!ID
    Case strA(2)
        OH_A "@x = 'InsertLex', " & _
         " @d = '" & strInput & "'"
        OH_r r
        OH_FindLex r!NrBoss, r!ID
    Case Else
        GoTo ErrEnd
    End Select
    OH_RQ Me!lstA
    OH_RQ Me!lstDet
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.OH_newLexikon"
    Resume ErrEnd
End Function
Private Sub Begriff_AfterUpdate()
On Error GoTo ErrMsg
    If Len(Nz(Me!bemLexikon, "")) = 0 Then
        Me!bemLexikon = Me!Begriff
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Begriff_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Begriff_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Select Case KeyCode
        Case 9, 13
        Me!bemLexikon.SetFocus
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Begriff_KeyDown"
    Resume ErrEnd
End Sub
Private Sub btnBemLexikon_Click()
On Error GoTo ErrMsg
    Me!bemLexikon.SetFocus
    OH_RT Me!bemLexikon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnBemLexikon_Click"
    Resume ErrEnd
End Sub
Public Sub lstLexikon_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgL As Long
    Dim strL As String
    Dim strGR As String
    DoCmd.Hourglass True
    OH_SaveRS Me
    t = Me!lstLexikon.column(1)
    OH_A "@x = 'lstLexikon'" & _
        ", @i = " & Nz(Me!nrlexikon, 0) & _
        ", @y = " & Nz(Me!NrBoss, 0) & _
        ", @a = " & Me!lstLexikon
    strL = strSQL
    Select Case Val(Me!lstLexikon)
    Case 10, 11, 12, Is >= 40
        If OH_Perm("I", Me) Then
            GoTo ErrEnd
        End If
    End Select
    Select Case Val(Me!lstLexikon)
    Case 10, 11, 12 'neu
        s = Me!Gruppe
        Select Case Val(Me!lstLexikon)
        Case 10
            If Nz(Me!NrBoss, 0) = 0 Then '170602
                s = Me!Begriff
            End If
            OH_A "@x = 'InsertLex'," & _
                " @d = '" & s & "'"
            OH_r r
        Case 11
            OH_A "@x = 'InsertLex'," & _
                " @d = '" & s & _
                "',@i = " & Me!nrlexikon
            OH_r r
        Case 12
            s = InputBox("Bitte neue Gruppenbezeichnung eingeben!", t)
            If s = "" Then
                GoTo ErrEnd
            End If
            OH_A "@x = 'InsertLex'," & _
                " @d = '" & s & "'"
            OH_r r
        End Select
        OH_FindLex r!NrBoss, r!ID
    Case 20, 21
        If OH_Perm("D", Me) Then
            GoTo ErrEnd
        End If
        t = t & " Nr.:" & Me!LexikonNr & " " & Me!Begriff
        If MsgBox("Wollen Sie wirklich Lexikon-Einträge löschen?", _
                    vbQuestion + vbOKCancel, t) = vbOK Then
            If Me!lstLexikon = 21 Or Me!NrBoss = 0 Then
                s = "Ganze Gruppe "
                If Me!NrBoss = 0 Then
                    strGR = Me!Begriff
                Else
                    strGR = Me!Gruppe
                End If
                s = s & " " & strGR
                t = "Lösche " & s & " " & Me!Gruppe
                If InputBox("Zum Bestätigen bitte" & vbNewLine & _
                          "<" & s & "> eingeben", _
                            t, s & "   NICHT Löschen") <> s Then
                    GoTo ErrEnd
                End If
            End If
            OH_r r, strL
            OH_FindLex r!NrBoss, r!ID
        End If
    Case 30
        Me!bemLexikon.SetFocus
        OH_CB Me!bemLexikon
        SysCmd acSysCmdSetStatus, "Zwischenablage ist gefüllt mit Beschreibung!"
    Case 40
        If Me!Gruppe = "Gruppe" Then
            s = "Geht nicht für Gruppe"
            GoTo ErrM
        End If
        strGR = InputBox("ACHTUNG GRAVIERENDE ÄNDERNG!!!!" & vbNewLine & _
                    "Bitte unten eine andere Bezeichnung eintragen für die Gruppe " & Me!Gruppe, t, Me!Gruppe)
        If strGR = "" Then
            GoTo ErrEnd
        End If
        If strGR = Me!Gruppe Then
            s = strGR & vbNewLine & "Sie sollten schon die Bezeichnung ändern"
            GoTo ErrM
        End If
        strSQL = strL & _
                ",@d = '" & Me!Gruppe & _
                "',@f = '" & strGR & "'"
        OH_r r
        OH_FindLex r!NrBoss, r!ID
    Case 41
        strGR = InputBox("ACHTUNG GRAVIERENDE ÄNDERNG!!!!" & vbNewLine & _
                    "Bitte unten eine andere Gruppe-Nr. eintragen für die Gruppe " & Me!Gruppe, t, Me!GruppeNr)
        Select Case strGR
        Case ""
            GoTo ErrEnd
        Case "0"
            i = 0
        Case Else
            i = Val(strGR)
            If i <= 0 Then
                s = "Bitte eine Zahl >= 0 eingeben!!"
                GoTo ErrM
            End If
        End Select
        If i = Me!GruppeNr Then
            s = strGR & vbNewLine & "Sie sollten schon die Nummer ändern"
            GoTo ErrM
        End If
        strGR = Me!Gruppe
        OH_A "@x = 'ResetLexikonNr' " & _
            ",@a = 0 " & _
            ",@n = " & i & _
            ",@i = " & Me!nrlexikon
        OH_r r
        Me!lstOrderGruppe = 0
        OH_FindLex Me!NrBoss, Me!nrlexikon
    Case 42
        If Me!Gruppe = "Gruppe" Then
            s = "Geht nicht für Gruppe"
            GoTo ErrM
        End If
        s = "ACHTUNG GRAVIERENDE ÄNDERNG!!!!" & vbNewLine & _
                    "Verschiebe den Begriff" & vbNewLine & _
                    Me!Begriff & vbNewLine & vbNewLine & _
                    "in die Gruppe (oder Gruppe-nr.)...."
        strGR = InputBox(s, t, Me!Gruppe)
        Select Case strGR
        Case Me!Gruppe
            GoTo ErrEnd
        Case "", "0"
            GoTo ErrEnd
        Case Else
            i = Val(strGR)
            If i < 0 Then
                s = "Bitte eine Zahl > 0 eingeben!!"
                GoTo ErrM
            End If
        End Select
        strSQL = strL & _
                ",@d = '" & strGR & _
                "',@f = '" & Me!Begriff & _
                "',@s = '" & OH_RPL(Me!bemLexikon) & "'"
        OH_r r
        If r!ID = 0 Then
            s = r!Msg
            GoTo ErrM
        End If
        OH_FindLex r!NrBoss, r!ID
    Case 43    'nach Begriff sortieren...
        If Me!Gruppe = "Gruppe" Then
            strGR = Me!Begriff
        End If
        s = "Sortiere die Gruppe < " & strGR & " > nach Begriff!!"
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbOK Then
            strSQL = strL & _
                        ",@d = '" & strGR & "'"
            OH_EX
            Me!txtFind = "Gr:" & strGR
            txtFind_AfterUpdate
        End If
    Case 50
        strL = Nz(Me!Beschreibung, "")
        If strL = "" Then
            s = "Es liegt KEINE Beschreibung vor"
            GoTo ErrM
        End If
        s = left(strL, 20) & "...." & vbNewLine & vbNewLine & _
            "Jetzt wird das Übersetzungs-Feature geöffnet und die Beschreibung erfasst."
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
            OH_OF "F_Language"
            Set f = Forms!F_Language
            strSQL = "Exec spa_Language" & _
                    " @x = 'GetID' " & _
                    ",@d = '" & f!lstA & _
                    "',@f = '" & strL & "'"
            OH_r r
            If r.BOF Then
                f!lstact = 10
                f.lstAct_AfterUpdate
                f!l1 = strL
            Else
                s = "Die Beschreibung ist bereits in " & f!lstA & " übersetzt!"
                MsgBox s, vbInformation, t
                f!txtFind = left(strL, 20)
                f.txtFind_AfterUpdate
            End If
        End If

    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstLexikon_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnGruppe_Click()
On Error GoTo ErrMsg
    OH_FilterGroup
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnGruppe_Click"
    Resume ErrEnd
End Sub
Private Sub btnGruppeNr_Click()
On Error GoTo ErrMsg
    OH_FilterGroup
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnGruppeNr_Click"
    Resume ErrEnd
End Sub
Private Function OH_FilterGroup()
On Error GoTo ErrMsg
    Dim lgid As Long
    If Me!NrBoss = 0 Then
        lgid = Me!nrlexikon
    Else
        lgid = Me!NrBoss
    End If
    Me!lstA = lgid
    Me!txtFind = Null
    lstA_AfterUpdate
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.OH_FilterGroup"
    Resume ErrEnd
End Function
Private Sub btnLexikonNr_Click()
On Error GoTo ErrMsg
    Me!LexikonNr.SetFocus
    Me!LexikonNr.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnLexikonNr_Click"
    Resume ErrEnd
End Sub
Private Sub btnNewSort_Click()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    If IsNull(Me!Gruppe) = False Then
        If MsgBox("Gruppe " & Me!Gruppe & " wird jetzt neu nach Begriff sortiert durchnummeriert!", _
                    vbQuestion + vbOKCancel, "Nummerierung") = vbOK Then
            OH_A "@x = 'OrderByBegriff' " & _
                ",@f = '" & Me!Gruppe & "'"
            OH_EX
            OH_FindLex Me!NrBoss, Me!nrlexikon
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnNewSort_Click"
    Resume ErrEnd
End Sub
Private Sub comTop_AfterUpdate()
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.comTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnopen_Click()
On Error GoTo ErrMsg
    Dim strB As String
    strB = Nz(Me!Beschreibung)
    OH_SaveRS
    If OH_Validate(Me!Begriff, "Begriff") Then GoTo ErrEnd
    Select Case Me!Gruppe
    Case "Abfragen"
        t = "Abfrage ausführen!"
        Select Case left(strB, 6)
        Case "Update"
            i = OH_EX(strB)
            s = strB & vbNewLine & vbNewLine
            Select Case i
            Case 0
                s = s & "KEINE Änderungen ausgeführt!"
            Case 1
                s = s & "EINE Änderung ausgeführt!"
            Case Else
                s = s & i & " Änderungen ausgeführt!"
            End Select
            MsgBox s, vbInformation, t
            GoTo ErrEnd
        Case Else
            OH_EXCEL
        End Select
        GoTo ErrEnd
    End Select
    OH_CB (Me!Begriff & vbNewLine & vbNewLine & Me!bemLexikon)
    If IsNull(Me!FormName) Or Me!FormName = "Nicht löschen" Then
        DoCmd.Hourglass True
        FollowHyperlink HyperlinkPart(Me!Begriff, acDisplayText), , True
        DoCmd.Hourglass False
    Else
        Select Case left(Me!FormName, 2)
        Case "PF", "UF", "F_", "Me"
            OH_OF Me!FormName, 0
            Select Case Me!FieldName
            Case "Nicht löschen", "JA", "Nein"
            Case Else
                If Not Me!FieldName Like "Nicht löschen" Then
                    Set ctlColor = Forms(Me!FormName)(Me!FieldName)
                    Select Case ctlColor.ControlType
                    Case acCommandButton
                        lgforecolor = ctlColor.ForeColor
                    Case 124 'acTabCtl
                        strCaption = ctlColor.Caption
                    Case Else
                        lgforecolor = ctlColor.ForeColor
                        lgbackcolor = ctlColor.BackColor
                    End Select
                    ctlColor.SetFocus
                    Me.TimerInterval = 200
                    i = 0
                End If
            End Select
        End Select
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 432, 490
        MsgBox "Der Begriff <" & Me!Begriff & ">" & _
                vbNewLine & "scheint nicht als Link zu existieren!" & vbNewLine & vbNewLine & _
               "Auf alle Fälle ist der Begriff und die Beschreibung jetzt im Zwischenspeicher verfügbar!", _
               vbExclamation, "Link"
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnopen_Click"
    End Select
    Me.TimerInterval = 0
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Public Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    btnopen_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Form_DblClick"
    Resume ErrEnd
End Sub
Public Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Not Screen.ActiveControl.Name Like "Marker" Then
        If Me!FormName = "Nicht löschen" Or _
           Me!FieldName = "Nicht löschen" Or _
           Me!WertOH < 2 Then
            s = "Wichtige Mitteilung Ihres DB-Ersteller Philipp Ohnemus:" & vbNewLine & vbNewLine & _
                      "Änderungen haben Auswirkungen auf Funktion der Datenbank!" & vbNewLine & _
                      "Bitte nur OK, wenn Sie sich sicher sind!"
            If MsgBox(s, vbOKCancel + vbExclamation + vbDefaultButton2, _
                      "Eingriff in Steuerung der DB") = vbCancel Then
                Cancel = True
                Me.Undo
                Exit Sub
            End If
        End If
    End If
    If OH_Validate(Me!Begriff, "Begriff") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If OH_Checkwert = True Then
        Cancel = True
        Me.Undo
        Exit Sub
    End If
    If DirtyRecord(Me) Then GoTo ErrEnd
    OH_SaveRecord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Function OH_Checkwert() As Boolean
On Error GoTo ErrMsg
    OH_Checkwert = False
    If Not glAdmin Then
        If Me!Gruppe Like "Database" Or Me!WertOH = 1 Then
            MsgBox "Sie dürfen in der Gruppe >Database< nicht ändern!" & vbNewLine & _
                       "Ihre Änderungen werden nicht akzeptiert!" & vbNewLine & vbNewLine & _
                       "Wenden Sie sich bitte an Ihren Datenbank-Administrator!", vbCritical, "Keine Änderungen!"
            OH_Checkwert = True
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.OH_Checkwert"
    Resume ErrEnd
End Function
Private Sub LexikonNr_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!LexikonNr <> Me!LexikonNr.OldValue Then
        s = "Wollen Sie wirklich die lfd.-Nr. für die Gruppe" & vbNewLine & _
                    vbTab & Me!Gruppe & vbNewLine & "ändern?" & vbNewLine & vbNewLine & _
                    Me!LexikonNr.OldValue & " ==> " & Me!LexikonNr
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, "Wichtige Änderung") = vbCancel Then
            Cancel = True
            Me.Undo
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.LexikonNr_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub LexikonNr_AfterUpdate()
On Error GoTo ErrMsg
    OH_A "@x = 'ResetLexikonNr' " & _
        ",@a = " & Me!NrBoss & _
        ",@n = " & Me!LexikonNr & _
        ",@i = " & Me!nrlexikon
    OH_EX
    OH_FindLex Me!NrBoss, Me!nrlexikon
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.LexikonNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Function OH_SaveRecord()
On Error GoTo ErrMsg
    Dim lgLexikon As Long
    Dim strf As String
    lgLexikon = Nz(Me!nrlexikon, 0)
    strSQL = "Select * from T_Lexikon where NrLexikon=" & lgLexikon
    OH_r rx, , , rrLockOptimistic
    If rx.BOF Then
        MsgBox "OH_SaveRecord T_Lexikon", vbCritical, "PHILIPP!!!!!"""
    Else
        For i = 1 To rx.Fields.count - 1
            strf = rx.Fields(i).Name
            Select Case strf
            Case "LexikonErfasst", _
                 "CounterLexikon", _
                 "Markerlexikon", _
                 "PrintMarkerlexikon"
            Case "lastupdate"
                rx(strf) = Now
            Case "Whoupdate"
                rx(strf) = strUser
           Case Else
                rx(strf) = Me(strf)
            End Select
        Next i
        rx.Update
    End If
    Me.Undo
    OH_RQ Me!lstDet, lgLexikon
    lstDet_AfterUpdate
    If Me!nrlexikon <> lgLexikon Then
        OH_RQf Me, lgLexikon
    End If
    OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.OH_SaveRecord"
    Resume ErrEnd
End Function
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Null
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub LstGruppe_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstGruppe, 0), , , False
    Me!lstGruppe.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.LstGruppe_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgL As Long
    Dim strCTT As String
    OH_lstdet Me
    Me!lstGruppe = Me!nrlexikon
    Me.pg0.Caption = "Gruppe " & Me!GruppeNr & " " & Me!Gruppe
    Me!lblFieldname.Caption = Nz(Me!gFieldname, "")
    Me!lblFormname.Caption = Nz(Me!gFormname, "")
    s = "Begriff"
    strCTT = "Öffnen Formular / WEB /Explorer, wenn EIntrag entsprechend" & vbNewLine & _
            "Begriff und Beschreibung wird in die Zwischenablage kopiert"
    If Me!Gruppe = "Abfragen" Then
        Select Case left(Me!Beschreibung, 6)
        Case "UPDATE"
            s = "Ausführen!"
            strCTT = "die UPDATE-Abfrage wird auf dem SERVER ausgeführt; Anzahl betroffene Daten wird zurückgemeldet"
        Case Else
            s = "==>EXCEL"
            strCTT = "Die betroffenen Datensätze werden im EXCEL aufbereitet"
        End Select
    Else
        s = "Begriff"
    End If
    Me!btnOpen.Caption = s
    Me!btnOpen.ControlTipText = strCTT
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    OH_lstdetKeydown Me, KeyCode
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstDet_KeyDown"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Form_DblClick (0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstDet_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstGruppe_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    btnopen_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstGruppe_DblClick"
    Resume ErrEnd
End Sub
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstM, 0), , , False
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstM_Afterupdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OpenStichwort Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstStichwort_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstTop, 0), , , False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Dim lgB As Long
    Dim strL As String
    Select Case Me.regd
    Case 0
        lgB = Nz(Me!NrBoss, 0)
        If lgB = 0 Then
            lgB = Nz(Me!nrlexikon, 0)
        End If
        strSQL = "Exec dbo.spA_Lexikon " & _
                " @x = 'lstGruppe'" & _
                ",@i= " & lgB
        OH_A "lstGruppe", strSQL, Me
    Case 1
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrLexikon'" & _
            ",@ID =  " & Nz(Me!nrlexikon, 0)
        OH_A "lstStichwort", strSQL, Me
        OH_lstStichwortAct Me
    Case 2
        OH_MarkerLST Me
    Case 3
        OH_TopLST Me
    Case 4
        Set ctl = Me!lstAbfragen
        OH_A ctl.Name

    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.regD_Change"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwortCopy_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!lstStichwortCopy, 0)
    MsgBox Me!lstStichwortT
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstStichwortCopy_AfterUpdate"
    Resume ErrEnd
End Sub

Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spA_Lexikon " & _
            " @x = 'lst'" & _
            ",@i =" & Nz(Me!lstA, 0) & _
            ",@f= '" & Replace(OH_RPL(Me!txtFind.Text), "*", "%") & "'"
    OH_txtFind Me, strSQL
    If left(Me!txtFind, 3) = "Gr:" Then
        Me!lstA = Me!NrBoss
        Me!txtFind = Null
    End If
    Select Case Val(Nz(Me!lstA, 0))
    Case -1
        Me!lstDet.ColumnWidths = "0cm;2cm;1cm"
    Case Else
        Me!lstDet.ColumnWidths = "0cm;0cm;1cm"
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.txtFind_DblClick"
    Resume ErrEnd
End Sub
Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer) '121216 gb
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.txtFind_KeyDown"
    Resume ErrEnd
End Sub
Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!comtxtFind
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
Public Function OH_FindLex(lgB As Long, lgid As Long)
On Error GoTo ErrMsg
    lstOrderGruppe_AfterUpdate
    Me!lstA = lgB
    Me!txtFind = ""
    lstA_AfterUpdate
    For i = 0 To Me!lstDet.ListCount - 1
        If Me!lstDet.column(0, i) = lgid Then
            Me!lstDet.Selected(i) = True
            Exit For
        End If
    Next i
    lstDet_AfterUpdate
    Me!Begriff.SetFocus
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.OH_FindLex"
    Resume ErrEnd
End Function

Private Sub btnlstAbfragen_Click()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Dim lgid As Long
    lgid = Nz(Me!lstAbfragen, 0)
    If lgid = 0 Then
        s = "Bitte die gewünschte Abfrage rechts markieren"
        GoTo ErrM
    End If
    OH_EXCEL
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.btnlstAbfragen_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstAbfragen_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstAbfragen, 0), , , False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstAbfragen_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstAbfragen_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_EXCEL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.lstAbfragen_DblClick"
    Resume ErrEnd
End Sub
Private Sub Fieldname_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Set fd = Application.FileDialog(msoFileDialogFilePicker)
    With fd
        .Title = t
        .AllowMultiSelect = False
        .ButtonName = "File auswählen"
        .filters.Clear
        .filters.Add "Alle Dateien", "*.*"
        .FilterIndex = 2
        .InitialFileName = ""
        .Show
    End With
    If fd.SelectedItems.count > 0 Then
        Me!FieldName = fd.SelectedItems(1)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Fieldname_DblClick"
    Resume ErrEnd
End Sub
Private Sub Formname_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Set fd = Application.FileDialog(msoFileDialogFilePicker)
    With fd
        .Title = t
        .AllowMultiSelect = False
        .ButtonName = "File auswählen u. eintragen"
        .filters.Clear
        .filters.Add "Excel-Dateien", "*.*"
        .FilterIndex = 2
        .Show
    End With
    If fd.SelectedItems.count > 0 Then
        Me!FormName = fd.SelectedItems(1)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Lexikon.Formname_DblClick"
    Resume ErrEnd
End Sub
