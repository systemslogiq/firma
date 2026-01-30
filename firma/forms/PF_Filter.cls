Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strFrm As String
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_A "comForm", , Me
    OH_A "c", , Me
    OH_A "lstaction", , Me
    strFrm = Nz(Me.OpenArgs, "F_Adresse")
    If strFrm = "Menu" Then
        OH_Adresse
        strFrm = "F_Adresse"
    End If
    Me!comForm = strFrm
    comForm_AfterUpdate 'hier wird Recordset für das Formular gesetzt
    OH_A "f", "@s = '" & Me!comForm.column(1) & "'", Me
    OH_A "lstStandard", "@s = '" & Me!comForm & "'", Me
    Me!e.SetFocus
    strSQL = "Exec dbo.spi_Filter 'Filter schliessen?'"
    OH_r r
    Me!CloseFilter = r(0)
    OH_lstUseFilter
    s = Forms(strFrm)!countRec & " " & Me!comForm.column(2)
    OH_A "lstUseFilter", "@f = '" & s & "'", Me
    OH_ResetRS r
    OH_Move Me, 120, 10, 140, glFormHeight
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.Form_Load"
    Resume ErrEnd
End Sub
Private Function OH_lstUseFilter()
    s = Forms(strFrm)!countRec & " " & Me!comForm.column(2)
    OH_A "lstUseFilter", "@f = '" & s & "'", Me
End Function
Private Sub btnDelete_click()
On Error GoTo ErrMsg
    OH_EX "spI_Filter 'Alle ec entfernen'"
    OH_RQf Me
    Me!btnEscape.SetFocus
    Me!btnDelete.Enabled = False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.btndelete_Click"
    Resume ErrEnd
End Sub
Private Sub btnEscape_Click()
On Error GoTo ErrMsg
    DoCmd.Close acForm, "PF_Filter"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.btnEscape_Click"
    Resume ErrEnd
End Sub
Private Sub c_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!c
    Case 5
        Me!ec = Space(15) & "und" & Space(5)
    Case 7, 8
        Me!ec = Me!c.column(2)
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.c_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub CloseFilter_AfterUpdate()
On Error GoTo ErrMsg
    strSQL = "spI_Filter 'Filter schliessen nach Suchvorgang'"
    OH_EX
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.CloseFilter_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstaction_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    Dim strN As String
    Dim lgST As Long
    lgST = Nz(Me!lstStandard, 0)
    OH_SaveRS Me
    t = Me!lstAction.column(1)
    Select Case Me!lstAction
    Case 0   ' as Nr,'Hier Aktionen auswählen.....'
        btnOK_Click
    Case 2, 3 'Einstellungen als ALLGEMEINER =2 oder Mein = 3 Standard speichern'
        strf = InputBox("Bitte einen Namen eingeben für" & vbNewLine & _
                    "den neuen Filter", t)
        Select Case strf
        Case ""
            GoTo ErrEnd
        Case Else
            strSQL = "Exec dbo.spi_Filter 'Action" & Me!lstAction & "',0,'" & _
                                      strf & "','" & _
                                      Me!comForm & "','" & _
                                      Me!comForm.column(2) & "'"
            OH_r r
            lgST = r(0)
            Select Case lgST
            Case 0
                MsgBox "Bitte mindestens eine Bedingung auswählen!", vbExclamation, t
            Case -1
                MsgBox "Dieser Filter existiert bereits (gleicher Name und/oder gleiche Bedingung)!", vbExclamation, t
            Case Else
                OH_RQ Me!lstStandard, lgST
            End Select
        End Select
    Case 10 'markierten Standard umbenennen'
        strN = Nz(Me!lstStandard.column(1), "")
        If strN = "" Then
            s = "Bitte in der Liste einen Standardfilter markieren!"
            GoTo ErrM
        End If
        strf = InputBox("Bitte einen anderen Namen eingeben für" & vbNewLine & _
                    strN, t, strN)
        Select Case strf
        Case "", strN
        Case Else
            strSQL = "Exec dbo.spi_Filter 'Action10'," & lgST & ",'" & strf & "'"
            OH_EX
        End Select
        OH_RQ Me!lstStandard, lgST
    Case 11, 12 'markierten Standard löschen / überschreiben'
        If lgST = 0 Then
            s = "Bitte in der Liste einen Standardfilter markieren!"
            GoTo ErrM
        End If
        If MsgBox(Me!lstStandard.column(1) & vbNewLine & vbNewLine & _
                    "Bitte bestätigen", _
                    vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
            OH_EX "spi_Filter 'Action" & Me!lstAction & "'," & Me!lstStandard
            OH_RQ Me!lstStandard
        End If
    End Select
    Me!lstAction = 0
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.lstaction_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub comForm_AfterUpdate()
On Error GoTo ErrMsg
    Dim strST As String
    Dim lgPage As Long
    OH_A "@x = 'createfilter'" & _
        ",@s = '" & Me!comForm.column(1) & "'", , Me
    OH_EX
    strSQL = "Exec dbo.spi_Filter @x = 'filterRS'"
    OH_SetRS Me, , strSQL
    Me.Caption = "Filter setzen für " & Me!comForm.column(2)
    strST = lguser & " Standard"
    strSQL = "Exec dbo.spi_Filter @x = 'Standard', @s = '" & Me!comForm & "'"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.comForm_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ec_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    Me!btnOK.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.ec_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub f_AfterUpdate()
On Error GoTo ErrMsg
    Me!h = Me!f.column(1)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.f_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstStandard_AfterUpdate()
On Error GoTo ErrMsg
    strSQL = "spi_Filter " & _
            " @x = 'SetfromFilter'" & _
            ", @i = " & Me!lstStandard
    OH_EX
    OH_RQf Me
    btnOK_Click
    If OH_isloaded("pf_filter") Then
        Me.SetFocus
        Me!lstStandard.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.lstStandard_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ec_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spi_Filter " & _
                " @x = 'ec'," & _
                " @s = '" & Me!comForm.column(1) & "'," & _
                " @f = '" & Me!f & "'," & _
                " @o = '" & Me!h & "'"
    OH_A "ec", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.ec_Enter"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Me!btnDelete.Enabled = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.Form_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    OH_EX "spi_Filter 'Delete Filter 10'"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.Form_Close"
    Resume ErrEnd
End Sub
Public Sub btnOK_Click()
On Error GoTo ErrMsg
    Dim lgI As Long
    OH_ResetID
    OH_SaveRS Me
    Select Case Me!lstUseFilter
    Case 11, 12
        OH_InsertID_LST Forms(Me!comForm)!lstDet, , False
    End Select
    strSQL = "Exec dbo.spi_Filter " & _
                " @X = 'ok' " & _
                ",@fi = " & Me!lstUseFilter & _
                ",@s = '" & Me!comForm & _
                "',@f = '" & Me!comForm.column(1) & "'"
    With Forms(Me!comForm)
        lgI = 0
        If !lstDet.ColumnHeads Then
            lgI = 1
        End If
        OH_A "lstDet", strSQL, Forms(Me!comForm)
        !countRec = !lstDet.ListCount - lgI
        !txtFind = Null
        If Nz(!countRec, 0) > 0 Then
            !lstDet = Val(Nz(!lstDet.column(0, lgI), 0))
            !lstDet.Selected(lgI) = True
            .lstDet_AfterUpdate
            !countRec.BackColor = !txtFind.BackColor
        Else
            !countRec.BackColor = vbRed
        End If
        Me.Caption = "Filtern ==> " & !countRec & " " & Me!comForm.column(2)
    End With
    If Me!CloseFilter = True Then
        DoCmd.Close acForm, "PF_Filter"
    Else
        OH_lstUseFilter
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Filter.btnok_Click"
    Resume ErrEnd
End Sub
Private Sub lstUseFilter_AfterUpdate()
    Me!btnOK.SetFocus
End Sub

Private Sub e_DblClick(Cancel As Integer)
    Me!e = Null
End Sub
