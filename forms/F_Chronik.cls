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
    Me!lstA = 5000
    OH_A "Zeitraum", , Me
    OH_A "Wer", , Me
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Form_Activate"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnDatumEreignis_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.btnDatumEreignis_Click"
    Resume ErrEnd
End Sub
Private Sub comTop_AfterUpdate()
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.comTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub DatumEreignis_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!DatumEreignis, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.DatumEreignis_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_SyncS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If DirtyRecord(Me) Then GoTo ErrEnd
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Jahre_Enter()
On Error GoTo ErrMsg
    MsgBox "Änderungen bitte beim Datum !", , "Hier nicht!"
    Me!DatumEreignis.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Jahre_Enter"
    Resume ErrEnd
End Sub
Private Sub DatumEreignis_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!Zeitraum) Then Me!Zeitraum = Format(Me!DatumEreignis, "mmmm")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.DatumEreignis_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
   ' OH_SetListe "Chronik", "Jahre=" & Me!Jahre, "Ereignisse im Jahr " & Me!Jahre
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
    Me!lstJahr = Me!NrChronik
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstDet_AfterUpdate"
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
Private Sub lstJahr_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Chronik", Me!lstJahr
    Me!lstJahr.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstJahr_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Chronik", Me!lstM
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstM_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Chronik", Me!lstTop
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
     Select Case Me.regd
    Case 0
        OH_A "lstJahr", "@i = " & Me!Jahre, Me
    Case 1
        strSQL = "Exec dbo.spA_Stichwort " & _
                    " @cID ='NrChronik'" & _
                    ",@ID = " & Nz(Me!NrChronik, 0)
        OH_A "lstStichwort", strSQL, Me
        OH_lstStichwortAct Me
   Case 2
        OH_MarkerLST Me
    Case 3
        OH_TopLST Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.regD_Change"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    OH_A "@x = 'lst'" & _
        ", @f = '" & OH_RPL(Me!txtFind.Text) & "'" & _
        ", @i = '" & Nz(Me!lstA, 5000) & "'", , Me
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = Null
    txtFind_AfterUpdate
End Sub

Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer) '121216 gb
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ANSI-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.txtFind_KeyDown"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Chronik.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
