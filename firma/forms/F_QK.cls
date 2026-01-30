Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim frmU As Form
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    Set frmU = Me!UF_txtQK.Form
    OH_FormHeight Me
    OH_A "lstA", , Me
    OH_A "Sng1", , Me
    OH_A "Dat1", , Me
    OH_A "Dat2", , Me
    OH_A "DetTxt1", , Me
    OH_A "DefReport", , Me
    OH_A "Freigabe", , Me
    OH_A "FreigabeWer", , Me
    OH_A "QKFarbe", , Me
    OH_A "nextQK", , Me
    OH_A "RechteQK", , Me
    OH_A "ArtikelLager", , Me
    strSQL = "Exec spa_Stichwort @x = 'Markerstichwort'"
    OH_A "txtMarker", strSQL, frmU 'im Unterformular UF_txtQK
    OH_A "txt", , frmU 'im Unterformular UF_txtQK
    lstA_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.Form_Load"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
    Me!pg0.Caption = "Texte 1 bis x zu : " & Me!IDQK & " " & Me!QK
    strSQL = "Exec dbo.spa_QK " & _
            " @x = 'UF_txtQK'," & _
            " @i = " & Me!IDQK
    OH_SetRS frmU, , strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstDet_AfterUpdate"
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
Public Sub regD_Change()
On Error GoTo ErrMsg
    Select Case Me.regd
    Case 0
        OH_A "lsttxtAct", , Me
    Case 1
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrQK'" & _
            ",@ID =  " & Nz(Me!IDQK, 0)
        OH_A "lstStichwort", strSQL
        OH_lstStichwortAct Me
    Case 2
        strSQL = "Exec dbo.spA_QK 'lstVG', " & Me!IDQK
        OH_A "lstVG", strSQL
    Case 3
        strSQL = "Exec dbo.spA_QK 'lstKontakt', " & Me!IDQK
        OH_A "lstKontakt", strSQL
    Case 4 '20120121 gb
        OH_MarkerLST Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.regD_Change"
    Resume ErrEnd
End Sub
Private Sub btnHinweis_Click()
On Error GoTo ErrMsg
    s = "Hinweis:" & vbNewLine & _
              "Stichworte mit einem Häckchen werden in Vorgänge übernommen und mit ausgedruckt!"
    MsgBox s, vbExclamation, "Hinweis zu Stichworten"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.btnHinweis_Click"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Me!lstA = 2
    Me!txtFind = Me!IDQK & " " & Me!QK
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If OH_Perm("u", Me) Then
        Cancel = True
        GoTo ErrEnd
    End If
    If DirtyRecord(Me) Then GoTo ErrEnd
    t = "Neue Vorgangsart"
    If Me!QK = t Then
        s = "Bitte ändern Sie die Bezeichnung"
        MsgBox s, vbInformation, t
        Cancel = True
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub lstKontakt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!lstKontakt
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstKontakt_dblClick"
    Resume ErrEnd
End Sub
Private Sub lstTxtAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    If frmU.RecordSource <> "" Then
        If OH_RecordcountForm(frmU) > 0 Then
            lgid = Nz(frmU!NrTxt, 0)
        End If
    End If
    t = Me!lstTxtAct.column(1) & " in " & Me!QK
    Select Case Me!lstTxtAct
    Case Is > 10
        If lgid = 0 Then
            s = "bitte den betreffenden Text markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case Me!lstTxtAct
    Case 20, 21
        s = "Bitte Löschen bestätigen!"
        If Me!lstTxtAct = 20 Then
            s = "Position " & frmU!TxtNr & ":  " & frmU!txt & vbNewLine & vbNewLine & s
        Else
            s = "Alle Texte zu " & Me!IDQK & " " & Me!QK & vbNewLine & vbNewLine & s
        End If
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, _
                    t) = vbCancel Then
            GoTo ErrEnd
        End If
    End Select
    OH_A "@x = 'lstTxtAct'," & _
        " @a = " & Me!lstTxtAct & "," & _
        " @b = " & Me!IDQK & "," & _
        " @i = " & lgid
    Select Case Me!lstTxtAct
    Case 10
        OH_r r
        lgid = r!ID
    Case 20, 21
        OH_EX
        lgid = 0
    Case Else
        OH_EX
    End Select
    OH_RQf frmU, lgid
    If lgid > 0 Then
        Me!UF_txtQK.SetFocus
        frmU!txt.SetFocus
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstTxtAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
End Sub
Private Sub QKFarbe_AfterUpdate()
On Error GoTo ErrMsg
    Me!QKFarbe.BackColor = Nz(Me!QKFarbe, 16777215) 'wenn keine Farbe übergeben wird, z.B. auch beim Löschen der Farbe, dann wird automatisch weiss gesetzt.
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.QKFarbe_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spA_QK " & _
                "@x = 'lst'" & _
               ",@i = " & Nz(Me!lstA, 0) & _
               ",@f = '" & OH_RPL(Me!txtFind.Text) & "'"
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = Null
    txtFind_AfterUpdate
End Sub

Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.txtFind_KeyDown"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnPF_Tab_Click()
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Warengruppe btnPF_Tab_Click"
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
    OH_PF_Tab Me.Name, "lstd"
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstA_AfterUpdate"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstStichwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstVG_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Nz(Me!lstVG, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstVG_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Nz(Me!lstVG, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.Form_DblClick"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_QK.lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub IDQK_Enter()
    OH_SaveRS Me
    Me!IDQK.SetFocus
End Sub
'Private Sub IDQK_BeforeUpdate(Cancel As Integer)
Private Sub IDQK_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgidOld As Long
    Dim lgid As Long
    lgidOld = Me!IDQK.OldValue
    lgid = Nz(Me!IDQK, 0)
    If lgid = 0 Then
        s = "Bitte ID ausfüllen"
        GoTo ErrM
    End If
    If lgid <> lgidOld Then
        'Cancel = True
        Me.Undo
        OH_A "@x = 'ChangeID'" & _
            ",@a = " & lgidOld & _
            ",@i = " & lgid
        OH_r r
        s = r!Msg
        If s <> "" Then
            GoTo ErrM
        End If
        Me!txtFind = lgid
        txtFind_AfterUpdate
        Me!QK.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "IDQK_BeforeUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
