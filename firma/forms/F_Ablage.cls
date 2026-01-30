Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    Dim strfa As String
    OH_FormHeight Me
    OH_A "lstA", , Me
    OH_A "lstA", , Me
    OH_A "lstFirma", , Me
    Me!lstFirma = 0
    OH_A "NrMitarbeiter", , Me
    OH_A "AblageArt", , Me
    OH_A "Fa1", , Me
    OH_A "Fa2", , Me
    OH_A "Fa3", , Me
    OH_A "NrFirma", , Me
    OH_A "AnzahlRegister", , Me
    OH_A "Ort", , Me
    OH_A "EtikettenText", , Me
    OH_A "1", , Me
    OH_A "2", , Me
    OH_A "3", , Me
    OH_A "4", , Me
    Me!lstA = "A l l e"
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub btnEtikettenText_Click()
On Error GoTo ErrMsg
    Me!EtikettenText = Me!Fa1 & vbNewLine & _
                       Me!Fa2 & vbNewLine & _
                       Me!Fa3
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnEtikettenText_Click"
    Resume ErrEnd
End Sub
Private Sub btnAblageart_Click()
On Error GoTo ErrMsg
    OH_Openlexikon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnAblageart_Click"
    Resume ErrEnd
End Sub
Private Sub btnAblageErfasst_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnAblageErfasst_Click"
    Resume ErrEnd
End Sub
Private Sub btnfldr_Click()
On Error GoTo ErrMsg
    Me!fldr.SetFocus
    DoCmd.RunCommand acCmdEditHyperlink
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnfldr_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnNrMitarbeiter_Click()
On Error GoTo ErrMsg
    AdresseSuchen Me!NrMitarbeiter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnNrMitarbeiter_Click"
    Resume ErrEnd
End Sub
Private Sub comTop_AfterUpdate()
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.comTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_SyncS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeInsert(Cancel As Integer)
On Error GoTo ErrMsg
    Me!NrMitarbeiter = lguser
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Form_BeforeInsert"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!EtikettenText) Then
        btnEtikettenText_Click
    End If
    If OH_Validate(Me!AblageArt, "Ablage-Art") Then
        Cancel = True
        GoTo ErrEnd
    End If
    '<R78> Ersteller (NrMitarbeiter) in F_Ablage ist ein Mussfeld','OH','Input Nils F.'
    If OH_Validate(Me!NrMitarbeiter, "Ersteller") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If DirtyRecord(Me) Then GoTo ErrEnd
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Ablage.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Ablage.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub AblageArt_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Me!AblageArt.BackColor = Nz(Me!TextFarbe, vbWhite)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.AblageArt_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub NrFirma_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_newCompany NewData
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.NrFirma_NotInList"
    Resume ErrEnd
End Sub
Private Sub NrVG_Enter()
On Error GoTo ErrMsg
    OH_A "NrVG", "@a =" & Nz(Me!NrFirma, 0), Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.NrVG_Enter"
    Resume ErrEnd
End Sub
Private Sub NrFirma_AfterUpdate()
On Error GoTo ErrMsg
    If MsgBox(Me!NrFirma.column(1) & " eintragen ?", _
            vbOKCancel + vbQuestion, _
            "Firmen-Name eintragen") = vbOK Then
        Me!Fa2 = Me!NrFirma.column(1)
    Else
        Me!NrFirma = Null
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.NrFirma_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnVG_Click()
On Error GoTo ErrMsg
    If IsNull(Me!NrVG) Then
        Me!NrVG.SetFocus
        Me!NrVG.Dropdown
    Else
        OH_OF "F_VG", Me!NrVG
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnVG_Click"
    Resume ErrEnd
End Sub
Private Sub btnAdresse_Click()
On Error GoTo ErrMsg
    If IsNull(Me!NrFirma) Then
        Me!NrFirma.SetFocus
        Me!NrFirma.Dropdown
    Else
        OH_OF "F_Adresse", Me!NrFirma, 1
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.btnAdresse_Click"
    Resume ErrEnd
End Sub
Private Sub Nummer_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_B ID," & Me!f0
    OH_EX
    t = "Ordner " & Me!Nummer & " " & Me!AblageArt & " " & Me!Fa1
    DoCmd.OpenReport "B_Ablage", acViewPreview
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.Nummer_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstFirma_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.lstFirma_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Ablage", Nz(Me!lstTop, 0)
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Select Case Me.regd
    Case 1
        OH_MarkerLST Me
    Case 2
        OH_A "comTop"
        OH_TopLST Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.regD_Change"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
    AblageArt_BeforeUpdate (0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Ablage.lstDet_AfterUpdate"
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
    OH_OF "F_Ablage", Nz(Me!lstM, 0)
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Ablage.lstM_Afterupdate"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spA_Ablage " & _
            " @x = 'lst' " & _
            ", @a = " & Nz(Me!lstFirma, 0) & _
            ", @f = '" & Nz(Me!txtFind, "") & _
            "', @d ='" & Nz(Me!lstA, "A L L E") & "'"
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Ablage.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Ablage.txtFind_KeyDown"
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
    MsgBox Err & " " & Err.Description, vbCritical, "Form_F_Ablage.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_F_Ablage.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
