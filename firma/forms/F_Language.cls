Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim lgid As Long
    OH_FormHeight Me
    OH_A "lstA", , Me
    Me!lstA = "englisch"
    OH_A "lstAct", , Me
    OH_A "coml2", , Me
    OH_A "lstOB", , Me
    Me!lstOB = 0
    lstA_AfterUpdate
    OH_CreateCmb Me!lstDet
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.Form_Load"
    Resume ErrEnd
End Sub
Private Sub coml2_AfterUpdate()
On Error GoTo ErrMsg
    Me!l2 = Me!coml2
    OH_Button True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.coml2_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!l1
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub btnSave_Click()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgNrL As Long
    Dim strX As String
    Dim strD As String
    Dim strL As String
    strD = Nz(Me!l1)
    strX = Nz(Me!l2)
    strL = Nz(Me!lstDet.column(1), "")
    If strL = "" Then
        strL = Me!lstA
    End If
    lgid = Nz(Me!lstDet, 0)
    t = strL & ": " & left(Me!l1, 20)
    If Len(strL) < 8 Then
        s = "bitte eine Sprache auswählen"
        Me!lstA.SetFocus
        GoTo ErrM
    End If
    If strD = "" Or left(strD, 1) = "_" Then
        s = "bitte einen deutschen Text(ohne Unterstrich) eintragen"
        Me!l1.SetFocus
        GoTo ErrM
    End If
    If strX = "" Or left(strX, 1) = "_" Then
        s = "bitte den Übersetzungstext (ohne Unterstrich) eintragen"
        Me!l2.SetFocus
        GoTo ErrM
    End If
    OH_A "@x = 'SaveData' " & _
        ", @d = '" & OH_RPL(strD) & _
        "',@f ='" & OH_RPL(strX) & _
        "',@lg ='" & strL & "'"
    OH_r r
    If r!ID <> lgid Then
        lgid = r!ID
    End If
    OH_RQ Me!lstDet, lgid
    If Nz(Me!lstDet.column(0), 0) <> lgid Then
        Me!txtFind = Null
        txtFind_AfterUpdate
        OH_RQ Me!lstDet, lgid
    End If
    Me!lstDet.SetFocus
    OH_Button False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.btnSave_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnEscape_Click()
    Me!l1.SetFocus
    OH_Button False
    lstDet_AfterUpdate
End Sub
Private Function OH_Button(blV As Boolean)
On Error GoTo ErrMsg
    Me!btnSave.Visible = blV
    Me!btnEscape.Visible = blV
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.OH_Button"
    Resume ErrEnd
End Function
Private Sub coml2_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Language " & _
                " @x = 'coml2'," & _
                " @d = '" & Me!Language & "'"
    OH_A "coml2", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.coml2_Enter"
    Resume ErrEnd
End Sub
Private Sub l1_Change()
    OH_Button True
End Sub
Private Sub l2_Change()
    OH_Button True
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
    Me!Language = Me!lstA
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    Dim lgid As Long
    Dim strL As String
    Dim strT As String
    Dim strQ As String
    DoCmd.Hourglass True
    lgid = Nz(Me!lstDet, 0)
    t = Me!Language & " " & Me!lstact.column(1) & "  " & Me.Caption
    If Me.Dirty Then
        Me.Undo
    End If
    strL = Nz(Me!lstA, "")
    lgact = Nz(Me!lstact, 0)
    OH_A "@x = 'lstact' " & _
     ", @a = " & lgact & _
     ", @d = '" & strL & "'"
    strQ = strSQL
    Select Case lgact
    Case 0
        Me!txtFind = Null
        txtFind_AfterUpdate
    Case 10
        If OH_Perm("I", Me, "Language") Then
            GoTo ErrEnd
        End If
        strT = "Neuer Eintrag zum Übersetzen"
        Select Case strL
        Case "", "A l l e"
            s = "Bitte eine Sprache anwählen"
            GoTo ErrM
        End Select
        Me!l1 = Null
        Me!l2 = Null
        Me!l1.SetFocus
    Case 15 'Google Translation
        s = left(Me!Language, 2)
        strL = OH_TranslateByGoogle(Nz(Me!l1, ""), "DE", s)
        s = "Google-Vorschlag als  Übersetzung für:" & vbNewLine & _
        left(Me!l1, 50)
        strL = InputBox(s, t, strL)
        If strL = "" Then
            GoTo ErrEnd
        End If
        If (Nz(Me!l2, "")) = strL Then
            GoTo ErrEnd
        End If
        Me!l2 = strL
        OH_Button True
    Case 20, 21
        If OH_Perm("I", Me, "Language") Then
            GoTo ErrEnd
        End If
        If Me!lstA < 100 Then
            s = "Bitte eine Sprache markieren!"
            GoTo ErrM
        End If
        strL = Me!lstA
        t = strL & " " & Me!lstact.column(1) & "  " & Me.Caption
        If MsgBox(strL & vbNewLine & _
                    "Alle vorhandenen Einträge auf diese Sprache übertragen?", _
                    vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ
        OH_r r
        If r!Anzahl = 0 Then
            MsgBox "Es sind keine Übertragungen erforderlich!", vbExclamation, t
        Else
            MsgBox "Es wurden " & r!Anzahl & " Einträge vorgenommen" & vbNewLine & _
                    "Sie sollten jetzt diese Sprache überprüfen!", vbExclamation, t
            OH_RQ Me!lstA, 0
            Me!txtFind = left(strL, 20)
            txtFind_AfterUpdate
            Me!l1.SetFocus
        End If
    Case 30, 31
        If OH_Perm("d", Me, "Language") Then
            GoTo ErrEnd
        End If
        If lgact = 30 Then
            If lgid = 0 Then
                s = "Bitte eine Zeile markieren"
                GoTo ErrM
            End If
            s = "Lösche nur Übersetzung" & vbNewLine & vbNewLine & _
                "JA" & vbTab & left(Me!l2, 20) & vbNewLine & _
                "NEIN" & vbTab & "inclusive Deutsch und ggf. andere Sprachen!"
            i = MsgBox(s, vbYesNoCancel + vbExclamation, t)
            If i = vbCancel Then
                GoTo ErrEnd
            End If
            strSQL = strQ & _
                        ",@i = " & i & _
                        ",@s = '" & OH_RPL(Me!l1) & _
                        "',@f = '" & OH_RPL(Me!l2) & "'"
        Else
            s = "A C H T U N G" & vbNewLine & _
                "A C H T U N G" & vbNewLine & _
                "A C H T U N G" & vbNewLine & _
                "A C H T U N G" & vbNewLine & _
                "A C H T U N G" & vbNewLine & _
                "A C H T U N G" & vbNewLine & _
                "Komplette Daten in < " & Me!Language & " > sind dann VERLOREN!!!"
            'move to next record
            If s <> "" Then
                s = InputBox(s, t, "<LÖSCHEN> eintragen")
                If InStr(s, "Löschen") = 0 Or Len(s) > 10 Then
                    GoTo ErrEnd
                End If
            End If
            strSQL = strQ
        End If
        OH_EX
        OH_RQ Me!lstDet
        OH_RQ Me!lstA
        Me!lstact = 0
        txtFind_AfterUpdate
    Case 32
        OH_r r
        i = r!CT
        Select Case i
        Case 0
            s = "Doppelte Einträge wurden KEINE gefunden!"
        Case 1
            s = "EIN doppelter Eintrag wurde gelöscht!"
        Case Else
            s = i & " doppelte Einträge wurden gelöscht!"
        End Select
        MsgBox s, vbInformation, t
        Me!lstact = 0
        lstAct_AfterUpdate
    Case 40
        OH_TranslateByLEO Me!Language, Me!l1
    Case 41
        s = left(Me!Language, 2)
        strL = OH_TranslateByGoogle(Nz(Me!l1, ""), "DE", s)
        If strL <> "" Then
            Me!l2 = strL
            btnSave_Click
        End If
    End Select
    Me!lstact = 0
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        MsgBox "Keine Daten im Bericht", vbExclamation, t
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "F_Language.lstAct_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_Button False
    OH_A "@x ='getData'" & _
        ",@i = " & Nz(Me!lstDet, 0) & _
        ",@f = '" & Nz(Me!lstDet.column(1), "") & "'", , Me
    OH_r r
    Me!l1 = r!l1
    Me!l2 = r!l2
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstOB_AfterUpdate()
    txtFind_AfterUpdate
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    If Me.Dirty Then
        s = "Bitte zuerst speichern oder Rückgängig"
        GoTo ErrM
    End If
    Me!txtFind.SetFocus
    strSQL = "@f ='" & Replace(OH_RPL(Me!txtFind.Text), "*", "%") & _
            "', @d ='" & Nz(Me!lstA, "") & _
            "', @a = " & Nz(Me!lstOB, 0)
    OH_A "lstdet", strSQL, Me
    Me!lstDet = Nz(Me!lstDet.column(0, 0), 0)
    If Me!lstDet > 0 Then
        lstDet_AfterUpdate
        Me!l1.Visible = True
        Me!l2.Visible = True
        Me!coml2.Visible = True
        Me!Language.Visible = True
    Else
        Me!l1.Visible = False
        Me!l2.Visible = False
        Me!coml2.Visible = False
        Me!Language.Visible = False
    End If
    Me!countRec = Me!lstDet.ListCount
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Language.txtFind_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = Null
    txtFind_AfterUpdate
End Sub
Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer) '121216 gb
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.txtFind_KeyDown"
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
    MsgBox Err & " " & Err.Description, vbCritical, "F_Language.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
