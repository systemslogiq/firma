Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strFrm As String
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabTab"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 91
     Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Form_Activate PF_TAB"
        Resume ErrEnd
    End Select
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    If glID > 0 Then
        strSQL = "Exec dbo.spA_Filter " & _
                " @x ='lstedit', " & _
                " @a = 5 , " & _
                " @f = " & Me(Me.RecordsetClone.Fields(0).Name) & ", " & _
                " @i = " & glID
        OH_EX
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_AfterUpdate PF_TAB"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    Dim strf As String
    Dim strFg As String
    For i = 0 To 30
        With Me.Det.Controls(i)
            strf = .Name & ";" & .ColumnOrder & ";" & .ColumnWidth
            If i = 0 Then
                strFg = strf
            Else
                strFg = strFg & ";" & strf
            End If
        End With
    Next i
    strFg = Me.Caption & "  Feldreihenfolge:" & strFg & " RS:" & Replace(Me.RecordSource, "'", "|")
    strSQL = "spi_Verlauf " & _
        " @x = 'neu'," & _
        " @u = " & lguser & "," & _
        " @f = '" & Me.Tag & "'," & _
        " @txt = '" & strFg & "'"
    OH_EX
    If glID > 0 Then
        glID = 0
        OH_RQf frm
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Current PF_TAB"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OpenFrm 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_DblClick PF_TAB"
    Resume ErrEnd
End Sub
Private Sub Form_Click()
On Error GoTo ErrMsg
    OH_OpenFrm 0
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_DblClick PF_TAB"
    Resume ErrEnd
End Sub
Private Function OH_OpenFrm(lgD As Long)
On Error GoTo ErrMsg
    Dim strf As String
    Dim lgid As Long
    If lgD = 0 And Me.PopUp = False Then
        GoTo ErrEnd
    End If
    If lgD = 1 And Me.PopUp = True Then
        GoTo ErrEnd
    End If
    Set ctl = Me.Det.Controls(0)
    lgid = Val(Nz(ctl, 0))
    If lgid > 0 Then
        strf = ctl.ControlSource
        If left(strf, 2) = "Nr" Then
            strf = "F_" & Mid(strf, 3)
            If strf = "F_Funktion" Then
                strf = "F_Adresse"
            End If
            If OH_isloaded(strf) Then
                OH_OF strf, lgid
            End If
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Current PF_TAB"
    Resume ErrEnd
End Function
Private Sub Artikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
   OH_RS "Artikel"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Artikel_DblClick PF_TAB"
    Resume ErrEnd
End Sub
Private Sub Lieferant_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
   OH_RS "Lieferant"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Lieferant_DblClick PF_TAB"
    Resume ErrEnd
End Sub
Private Function OH_RS(strA As String)
On Error GoTo ErrMsg
    Dim strI As String
    Dim lgid As Long
    Dim strID As String
    lgid = Me.RecordsetClone.Fields(0).Value
    strID = Me.RecordsetClone.Fields(0).Name
    strI = ", @i = " & lgid & "," & _
           " @f = '" & strA & "'"
    strSQL = Me.Recordset.Source
    i = InStr(strSQL, "@i")
    If i > 0 Then
        i = i - 3
        strSQL = left(strSQL, i)
    End If
    strSQL = strSQL & strI
    OH_SetRS Me, , strSQL
    OH_FB Me, strID & " = " & lgid
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_RS PF_TAB"
    Resume ErrEnd
End Function
