Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Form_Error(DataErr As Integer, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    Dim strB As String
    Dim strBold As String
    Select Case DataErr
    Case 2601
        If IsNull(Me!Begriff.OldValue) = False Then
            strB = Me!Begriff
            strBold = Me!Begriff.OldValue
            s = "Der Begriff " & strB & " existiert bereits!" & vbNewLine & _
                       "Wollen Sie den Begriff" & vbNewLine & _
                       strBold & vbNewLine & _
                       "löschen und auf den bestehenden Begriff zurückgreifen?"
            If MsgBox(s, vbQuestion + vbOKCancel, "Doppelte Werte") = vbOK Then
                OH_EX "UPDATE T_Artikel SET T_Artikel.Artikel =  '" & strB & "'" & _
                            " WHERE T_Artikel.Artikel like '" & strBold & "';"
                Me.Undo
                OH_EX "delete  T_Begriff WHERE begriff like '" & strBold & "';"
                OH_OF "F_Begriff", 0, 0, "Begriff like ''" & strB & "''"
            End If
        Else
            MsgBox "Der Begriff " & Me!Begriff & " existiert bereits!", vbCritical, "Fehler in " & Me.Caption
            Me!Begriff.SetFocus
        End If
    Case Else
        Response = OH_Form_error(DataErr)
    End Select
    strDel = vbNullString
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.Form_Error"
    Resume ErrEnd
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    OH_A "lstA", , Me
    OH_A "Begriffgruppe", , Me
    Me!lstA = "A L L E  Gruppen"
    OH_A "Begriff1", , Me
    OH_A "Kurzform", , Me
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub Begriff_AfterUpdate()
On Error GoTo ErrMsg
    Me!Begriff1.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.Begriff_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Begriff1_AfterUpdate()
On Error GoTo ErrMsg
    Me!BemBegriff.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.Begriff1_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub BegriffGruppe_AfterUpdate()
On Error GoTo ErrMsg
    OH_RQ Me!lstA
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.BegriffGruppe_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comTop_AfterUpdate()
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.comTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Artikel", Me!NrBegriff
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If DirtyRecord(Me) Then GoTo ErrEnd
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgBegriff As Long
    lgBegriff = Me!NrBegriff
    OH_RQf Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Artikel", Nz(Me!LstArtikel, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.lstArtikel_DblClick"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
    OH_NoDblClick
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
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstM, 0)
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.lstM_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    OH_SortListeSQL Me!lstStichwort, x, Y
    lgX(2) = x
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.lstStichwort_MouseDown"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OpenStichwort Me, , , lgX(2)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.lstStichwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Me!lstTop
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Dim lgact As Long
    Select Case Me.regd
    Case 0
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrBegriff'" & _
            ",@ID =  " & Nz(Me!NrBegriff, 0)
        OH_A "lstStichwort", strSQL, Me
        OH_lstStichwortAct Me
    Case 1
        strSQL = "@f = '" & Me!Begriff & "'"
        OH_A "lstArtikel", strSQL
    Case 2
        OH_MarkerLST Me
    Case 3
        lgact = Me!comTop
        If Me!comTop = 9 Then
            Me!comTop = 4
        End If
        OH_TopLST Me
        If lgact = 9 And Me!lstTop.ListCount > 1 Then
            s = "Alle Nicht benutzten Begriffe (" & Me!lstTop.ListCount - 1 & ")" & vbNewLine & _
                "L Ö S C H E N ??"
            If MsgBox(s, vbDefaultButton2 + vbQuestion + vbOKCancel, t) = vbOK Then
                Me!comTop = 9
                OH_TopLST Me
                Me!comTop = 4
                OH_TopLST Me
                txtFind_AfterUpdate
            End If
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.regD_Change"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    OH_A "@x = 'lst'" & _
        ", @f = '" & Nz(OH_RPL(Me!txtFind), "") & _
        "', @d = '" & Nz(Me!lstA, "") & "'", , Me
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.txtFind_AfterUpdate"
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
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.txtFind_KeyDown"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.lsta_AfterUpdate"
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
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Begriff.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Begriff.txtFind_DblClick"
    Resume ErrEnd
End Sub
