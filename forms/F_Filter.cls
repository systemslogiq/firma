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
    OH_FormHeight Me
    OH_A "lstA", , Me
    OH_A "lstb", , Me
    OH_A "filterArt", , Me
    OH_A "FormN", , Me
    OH_A "FormName", , Me
    OH_A "FieldName", , Me
    OH_A "IsText", , Me
    OH_A "Compare", , Me
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    'OH_SyncS
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Select Case Me!FormName
    Case "F_Div"
        DoCmd.openForm "F_Div"
        With Forms!F_div
            !comF = Me!NrFilter
            .comF_AfterUpdate
        End With
    End Select
    Me.Visible = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.Form_DblClick"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnFilterNr_Click()
On Error GoTo ErrMsg
    Dim lgGr As Long
    If MsgBox("Soll die Filter-Nummer fortlaufend sortiert neu berechnet werden?", _
                vbQuestion + vbYesNo, _
                Me!btnFilterNr.ControlTipText & " " & Me!FormN) = vbYes Then
        OH_ResetNr Me, "FilterNr", Me!FilterNr, Me!NrFilter, Me!FormName, Me!filterArt
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.btnFilterNr_Click"
    Resume ErrEnd
End Sub
Private Sub comTop_AfterUpdate()
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.comTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub FilterNr_AfterUpdate()
On Error GoTo ErrMsg
    btnFilterNr_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.FilterNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstb_AfterUpdate()
On Error GoTo ErrMsg
    lstA_AfterUpdate
    Me!lstb.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstb_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstDet_AfterUpdate"
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
Private Sub lstForm_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Me!lstForm
    Me!lstForm.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstForm_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstForm_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    OH_SortListeSQL Me!lstForm, x, Y
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstForm_MouseDown"
    Resume ErrEnd
End Sub
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Me!lstM
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstM_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OpenStichwort Me
    OH_FB Forms!PF_Stichwort!UF_Stichwort.Form, _
                "NrStichwort = " & Nz(Me!lstStichwort, 0), "Stichwort"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstStichwort_DblClick"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Select Case Me.regd
    Case 0
        OH_A "lstForm", "@i = " & Me!filterArt & _
                        ", @f = '" & Me!FormName & _
                        "', @o='2,3'", Me
        Me!lstForm = Me!NrFilter
    Case 1
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrFilter'" & _
            ",@ID =  " & Nz(Me!NrFilter, 0)
        OH_A "lstStichwort", strSQL
        OH_lstStichwortAct Me
    Case 2
        OH_MarkerLST Me
    Case 3
        OH_TopLST Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.regD_Change"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    OH_txtFind Me, "Exec dbo.spA_Filter lst," & Me!lstA & " ,0, '" & Replace(OH_RPL(Me!txtFind.Text), "*", "%") & "', '" & Nz(Me!lstb, "") & "'"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.txtFind_AfterUpdate"
    End Select
    Resume ErrEnd
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.txtFind_KeyDown"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Filter.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
