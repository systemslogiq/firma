Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Form_Load()
On Error GoTo ErrMsg
    Dim Y As Long
    For Y = 1 To 6
        strMSG(Y) = vbNullString
    Next Y
    DoCmd.Hourglass False
    Select Case Screen.ActiveControl.Name
    Case "lststichwort"
        Y = 0
    Case Else
        Y = 50
    End Select
    OH_Move Me, 120, Y, 155, 130
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2474
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "PF_MsgBox.Form_Load"
        Resume ErrEnd
    End Select
End Sub
Sub ExitDialog(intBtnNum As Integer)
'strMSG(1)==> Nummer des gedrückten Buttons
'strMSG(2)==> Caption des gedrückten Buttons
'strMSG(3)==> ID der ausgewählten Liste
'strMSG(4)==> Text im Eingabefeld
'strMSG(5)==> 'Siehe Auswertung in OH_tlbCorrection // 'txtPrompt (für Zoom-Rückgabe OH_tlbZoom)
On Error GoTo ErrMsg
    Dim strListe As String
    Dim iL As Long
    If left(Me!comInput.ColumnWidths, 2) Like "0;" Then  'Siehe Auswertung in OH_tlbCorrection
        strMSG(5) = Nz(Me!comInput.column(1), "")
    Else
        strMSG(5) = Nz(Me!comInput, "")
    End If
    If Me!Liste.Visible = True Then
        For Each x In Me!Liste.ItemsSelected
            strListe = Nz(Me!Liste.column(0, x), "")
            If Len(strListe) > 0 And iL < 100 Then
                iL = iL + 1
                If IsNumeric(strListe) = False Then
                    strListe = "'" & strListe & "'"
                End If

                If iL = 1 Then
                    strMSG(3) = strListe
                Else
                    strMSG(3) = strMSG(3) & "," & strListe
                End If
            End If
            strMSG(4) = Nz(Me!Input, "")
            If IsNull(Me!Input) = True Then
                strMSG(4) = Nz(Me!Liste.column(2, x), "")
            Else
                strMSG(4) = Nz(Me!Input, "")
            End If
        Next x
        strMSG(5) = Nz(Me!Input, "")
    Else
        strMSG(3) = Nz(Me!Input, "")
        strMSG(4) = Nz(Me!Input, "")
    End If
    strMSG(1) = Nz(intBtnNum, "0")
    If intBtnNum = 9 Then
        intBtnNum = 1
    End If
    strMSG(2) = Me("btn" & intBtnNum).Caption
    If Me!txtPrompt.Locked = False Then
        strMSG(5) = Nz(Me!txtPrompt)
    End If
On Error Resume Next
    DoCmd.Close acForm, Me.Name, acSavePrompt
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.ExitDialog"
    Resume ErrEnd
End Sub
Private Sub btn1_Click()
    ExitDialog 1
End Sub
Private Sub btn2_Click()
    ExitDialog 2
End Sub
Private Sub btn3_Click()
    ExitDialog 3
End Sub
Private Sub btn4_Click()
    ExitDialog 4
End Sub
Private Sub btn5_Click()
    ExitDialog 5
End Sub
Private Sub btn6_Click()
    ExitDialog 6
End Sub
Private Sub btn0_Click()
    ExitDialog 0
End Sub
Private Sub btnHelp_Click()
On Error GoTo ErrMsg
    Dim strX As String
    On Error Resume Next
    strX = Nz(Me!lblHelp.Caption, "Keine HILFE")
    If Err <> 0 Or Len(strX) = 0 Then
      Beep
      Exit Sub
    End If
    MsgBox strX, vbOKOnly + vbInformation, "Hilfe: " & Me.Caption
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.btnHelp_Click"
    Resume ErrEnd
End Sub
Private Sub comInput_AfterUpdate()
'Auswertung der ComboBox
On Error GoTo ErrMsg
    Me!Input = Me!comInput
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.comInput_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Det_DblClick(Cancel As Integer)
    ExitDialog 0
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    If strMSG(1) Like "" Then
        strMSG(1) = 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Form_Close"
    Resume ErrEnd
End Sub
Private Sub Form_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    If KeyAscii = vbKeyEscape Then  'escape
        ExitDialog 0
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Form_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Input_AfterUpdate()
On Error GoTo ErrMsg
    s = "Hier können Sie einen Filter setzen:"
   ' strSQL = Me!Liste.Recordset.Source
    strSQL = Me!Liste.RowSource
    If InStr(strSQL, "OffeneProjekte") > 0 Then
        Select Case left(Trim(Me.Caption), 8)
        Case "Position"
            s = Replace(Me!Input, s, "")
            strSQL = Me!Liste.Recordset.Source
            i = InStr(strSQL, ", @s1")
            If i > 0 Then
                strSQL = left(strSQL, i - 1)
            End If
            strSQL = strSQL & _
                    ", @s1 = '" & s & "'"
            OH_A "Liste", strSQL
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Input_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub Liste_AfterUpdate()
On Error GoTo ErrMsg
    Dim strI As String
    'wenn das "Druckmenu" offen ist, soll man für diejenigen Reports,
    'die in T_Filter in "BemFilter" ein "(X)" haben, den Reporttitel beeinflussen können
    Select Case left(Me.Caption, 5)
    Case "druck", "weite"
        strI = Nz(Me!Liste.column(2), "")
        If Not right(strI, 3) Like "(X)" Then
            Me!Input.Visible = False
            Me!Liste.Height = Me!Input.top - Me!Liste.top + Me!Input.Height
        Else
            Me!Liste.Height = Me!Input.top - Me!Liste.top - 100
            Me!Input.Visible = True
            Me!Input.Value = Trim(left(strI, Len(strI) - 3)) & " "
        End If
    Case Else
        Me!Liste.Height = Me!txtPrompt.Height
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Liste_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Liste_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    ExitDialog 9
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Liste_DblClick"
    Resume ErrEnd
End Sub
Private Sub Liste_KeyUp(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Dim strTitelListe As String
    Dim strListe As String
    Dim strTab As String
    Dim strID As String
    Dim iL As Long
    strTitelListe = Me.Caption & " LÖSCHEN"
    If KeyCode = 46 Then
        strID = Me!Liste.Recordset.Source
        i = InStr(strID, ".Nr")
        If i > 0 Then
            strID = Mid(strID, i + 1, 20)
            For i = 1 To Len(strID)
                If Mid(strID, i, 1) Like "," Then
                    strID = left(strID, i - 1)
                    Exit For
                End If
            Next i
        End If
        Select Case strID
        Case "NrStichwort", "NrArtikel", "NrVG"
            For Each x In Me!Liste.ItemsSelected
                strListe = Nz(Me!Liste.column(0, x), "")
                If Len(strListe) > 0 And iL < 200 Then
                    iL = iL + 1
                    If iL = 1 Then
                        strMSG(3) = strListe
                    Else
                        strMSG(3) = strMSG(3) & "," & strListe
                    End If
                End If
            Next x
        Case Else
            MsgBox "In dieser Liste können Sie NICHT löschen!", vbExclamation, strTitelListe
            Exit Sub
        End Select
        If iL = 0 Then
            MsgBox "Markieren Sie bitte in der Liste die zu löschenden Daten!" & vbNewLine & _
                    "mit CTRL oder Shift-Taste", vbExclamation, strTitelListe
        Else
            i = MsgBox("Markierte Daten (" & iL & ") löschen?", _
                    vbExclamation + vbOKCancel + vbDefaultButton2, strTitelListe)
            If i = vbOK Then
                strTab = "T_" & right(strID, Len(strID) - 2)
                OH_EX "delete " & strTab & " where " & strID & " in (" & strMSG(3) & ");"
                DoCmd.Close acForm, Me.Name
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Liste_KeyUp"
    Resume ErrEnd
End Sub
Private Sub Liste_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
   OH_SortListe Me!Liste, x, Y
   VarAntw = "X"
    Me!Liste.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Msgbox.Liste_MouseDown"
    Resume ErrEnd
End Sub
