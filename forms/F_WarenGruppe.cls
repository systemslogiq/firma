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
    OH_A "WarengruppeKZ", , Me
    OH_A "lstOrderby", , Me
    OH_A "InlandEinkauf", , Me
    OH_A "AuslandEinkauf", , Me
    OH_A "InlandEinkauf", , Me
    OH_A "EGEinkauf", , Me
    OH_A "InlandVerkauf", , Me
    OH_A "AuslandVerkauf", , Me
    OH_A "EGVerkauf", , Me
    Me!lstOrderBy = 30
    txtFind_AfterUpdate
    s = "Warengruppen mit den oben eingestellten Bedingungen unten anzeigen." & vbNewLine & _
        "Die wichtigsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen Wert."
    Me!btntxtFind.ControlTipText = s
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_WarenGruppe.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_WarenGruppe.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If DirtyRecord(Me) Then GoTo ErrEnd
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_WarenGruppe.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_SyncS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_WarenGruppe.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Artikel"
    With Forms!F_Artikel
        !lstA = Me!NrWarengruppe
        .lstA_AfterUpdate
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_WarenGruppe.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub btnArtikelNeu_Click()
On Error GoTo ErrMsg
    s = "Der letzte mit dieser Warengruppe angelegte Artikel wird jetzt kopiert" & vbNewLine & _
            "und steht dann zu weiteren Bearbeitung / Anpassung zur Verfügung!"
    If MsgBox(s, vbQuestion + vbOKCancel, "Neuer Artikel mit Warengruppe " & Me!WarenGruppe) = vbOK Then
        strSQL = "Exec dbo.spA_Artikel " & _
                " @x = 'Neuer Artikel', " & _
                " @b = " & Me!NrWarengruppe
        OH_r r
        If r!Idneu = 0 Then
            MsgBox "Ein neuer Artikel konnte nicht erfasst werden!", vbCritical, "Versuchen Sie es direkt im Artikelformular!"
            GoTo ErrEnd
        End If
        OH_OF "F_Artikel", r(0)
        With Forms!F_Artikel
            !ArtikelName = "NEU"
            !ArtikelName.SetFocus
        End With
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.btnArtikelNeu_Click"
    Resume ErrEnd
End Sub

Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Artikel", Nz(Me!LstArtikel, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstArtikel_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstVG_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Nz(Me!lstVG, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstVG_DblClick"
    Resume ErrEnd
End Sub

Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstDet_AfterUpdate"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstDet_DblClick"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Select Case Me.regd
    Case 0
        OH_A "lstArtikel", "@i =" & Me!NrWarengruppe, Me
    Case 1
        OH_A "lstVG", "@f ='" & Me!WarenGruppe & "'", Me
    Case 2
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrWarengruppe'" & _
            ",@ID =  " & Nz(Me!NrWarengruppe, 0)
        OH_A "lstStichwort", strSQL
        OH_lstStichwortAct Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.regD_Change"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spA_Warengruppe " & _
            " @x = 'lst'" & _
            ",@f = '" & Replace(OH_RPL(Me!txtFind.Text), "*", "%") & _
            "',@a = " & Me!lstOrderBy
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btntxtFind_Click()
    txtFind_AfterUpdate
End Sub
Private Sub btnPF_Tab_Click()
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name, "lstd"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Warengruppe btnPF_Tab_Click"
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
    OH_PF_Tab Me.Name, "lstd"
End Sub
Private Sub lstOrderby_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstOrderby_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.txtFind_DblClick"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.txtFind_KeyDown"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.comtxtFind_AfterUpdate"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstStichwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Warengruppe.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub InlandEinkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "Inland Einkauf", Me!InlandEinkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "InlandEinkauf_NotInList"
    Resume ErrEnd
End Sub
Private Sub AuslandEinkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "Ausland Einkauf", Me!AuslandEinkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AuslandEinkauf_NotInList"
    Resume ErrEnd
End Sub
Private Sub EGEinkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "EG Einkauf", Me!EGEinkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EGEinkauf_NotInList"
    Resume ErrEnd
End Sub
Private Sub InlandVerkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "Inland Verkauf", Me!InlandVerkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "InlandVerkauf_NotInList"
    Resume ErrEnd
End Sub
Private Sub AuslandVerkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "Ausland Verkauf", Me!AuslandVerkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AuslandVerkauf_NotInList"
    Resume ErrEnd
End Sub
Private Sub EGVerkauf_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    OH_KontoInsert NewData, "EG Verkauf", Me!EGVerkauf
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EGVerkauf_NotInList"
    Resume ErrEnd
End Sub
Private Function OH_KontoInsert(strK As String, strKArt As String, ctl As control)
On Error GoTo ErrMsg
    t = "Neues Konto erstellen"
    If Val(strK) = 0 Or Not IsNumeric(strK) Then
        s = "Bitte nur Zahlen"
        ctl.Undo
        GoTo ErrM
    End If
    s = "Soll dieses Konto im Lexikon unter Gruppe Warengruppe-Konto erfasst werden?" & vbNewLine & vbNewLine & _
        strK & " " & strKArt
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, "neues Konto") = vbOK Then
        OH_A "@x = 'InsertKonto'" & _
            ",@f = '" & strK & _
            "',@d = '" & strKArt & "'"
        OH_EX
        OH_RQ ctl
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function


Private Sub btnKonto_Click()
    OH_Openlexikon "Warengruppe-Konto"
End Sub
