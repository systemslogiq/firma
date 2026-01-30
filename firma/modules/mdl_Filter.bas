Attribute VB_Name = "mdl_Filter"
Option Compare Database
Option Explicit
Dim intF As Integer
Global strcomFind(1 To 10) As String
Dim lgDefault As Long
Global glstrFltr1 As String
Public Function OH_SetFilterField()
On Error GoTo ErrMsg
    OH_SetFilter1
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_SetFilterField, Filter auf dem aktuellen Control"
    Resume ErrEnd
End Function
Public Function OH_SetAntiFilterField()
On Error GoTo ErrMsg
    OH_SetFilter1 100
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_SetAntiFilterField, Anti-Filter auf dem aktuellen Control"
    Resume ErrEnd
End Function
Public Function OH_ResetFilter()
On Error GoTo ErrMsg
    OH_SetFilter1 99
ErrEnd:
    Exit Function
ErrMsg:
    If Err = 2474 Then Resume Next
    MsgBox Err & " " & Err.Description, vbCritical, "OH_ReSetFilter, Filter auf dem aktuellen Control zurücksetzen"
    Resume ErrEnd
End Function
Public Function OH_SetFilter1(Optional lgArt As Long = 0, _
                              Optional strf As String) As Long
On Error GoTo ErrMsg
    'bilde einen Filter mit dem aktuellen Control und
    'gehe wieder zum Ausgangsdatensatz zurück
    'OH071222
    Dim lgid As Long
    Dim strID As String
    Dim frmSF As Form
    Dim strNot As String
    Dim strFtr As String
    Set frmSF = OH_tlbStartForm
    strNot = " "
    lgid = frmSF!f0
    strID = frmSF!f0.ControlSource
    Select Case lgArt
    Case 100
        strNot = " Not "
    End Select
    If Len(strf) = 0 Then
        Set ctl = Screen.ActiveControl
    Else
        Set ctl = frmSF(strf)
    End If
    Select Case ctl.ControlSource
    Case "VGIDu"
        strFtr = "VGID= " & frmSF!VGID & _
                " and VGIDu= " & frmSF!VGIDu
    Case Else
        If IsNull(ctl) Then
            strFtr = ctl.ControlSource & " is" & strNot & "null"
        Else
            If lgArt = 0 Then
                strFtr = strNot & ctl.ControlSource & " like '%" & Replace(Trim(ctl), "'", "''") & "%'"
            Else
                strFtr = strNot & ctl.ControlSource & " like '" & Trim(ctl) & "'"
            End If
            If IsDate(ctl) And Len(ctl) > 6 Then 'OH071224
                strlink = "clng(" & ctl.ControlSource & ") = " & CLng(ctl)
            End If
            Select Case ctl.ControlSource
            Case "ProjektNr"
            Case Else
                If IsNumeric(ctl) Then
                    strFtr = strNot & ctl.ControlSource & "= " & Replace(ctl, ",", ".")
                End If
            End Select
        End If
    End Select
    frmSF.Filter = Trim(strFtr)
    If frmSF.FilterOn = False Then
        frmSF.FilterOn = True
    End If
    OH_FB frmSF, strID & " = " & lgid, ctl.Name
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2474
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_SetFilter1, Filter auf dem aktuellen Control"
        Resume ErrEnd
    End Select
End Function
Public Function OH_frmFilterRM()
On Error GoTo ErrMsg
    'siehe rechte Maustaste
    'Idee: im Spezialfilter wird das momentan aktuelle Feld aufgeklappt und gefiltert
    Dim strN As String
    Dim strf As String
    strf = Screen.ActiveForm.Name
    Set ctl = Screen.ActiveControl
    If ctl.ControlSource = "" Then
        MsgBox "Sie können Nicht nach einem Feld ohne Datenherkunft filtern!", vbExclamation, "Spezialfilter für Feld " & ctl.Name
    Else
        strN = ctl.Name
        DoCmd.openForm "PF_Filter"
        Set frm = Forms!PF_Filter
        frm!comForm = strf
        frm.comForm_AfterUpdate
        frm!f.SetFocus
        OH_FB frm, "F ='" & strN & "'", "f"
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Spezial-Filter rechte Maustaste"
    Resume ErrEnd
End Function
Public Function OH_FilterDate(frm As Form)
On Error GoTo ErrMsg
    Dim strDiff  As String
    Dim varD As Variant
    Dim strBookmark As String
    Set ctl = Screen.ActiveControl
    t = "Filtere Daten nach Datum: " & ctl.ControlTipText
    OH_msgbox "Sie können filtern nach mehreren Möglichkeiten!" & vbNewLine & _
        "Clicken Sie auf den Button Ihrer Wahl!", _
        Array("gleiches Datum", " gleiche KW", "gleicher Monat", " gleiches Jahr"), vbQuestion, _
        t, _
        "Sie können auch unten das Datum ändern (Bitte nur ein gültiges Datum eintragen)", _
        Nz(ctl.Value, Date)
    varD = strMSG(3)
    If IsDate(varD) = True Then
        If Len(varD) > 7 Then
            Select Case Val(strMSG(1))
            Case 0
                GoTo ErrEnd
            Case 1
               strDiff = "d"
            Case 2
               strDiff = "ww"
            Case 3
                strDiff = "m"
            Case 4
                strDiff = "yyyy"
            End Select
        End If
        strlink = "DateDiff(" & strDiff & ", " & ctl.ControlSource & " , convert(datetime,''" & varD & "'')) = 0"
        strBookmark = frm.RecordsetClone.Fields(0).Name & " =" & frm.RecordsetClone.Fields(0)
        OH_OF frm.Name, frm.RecordsetClone.Fields(0), 0, strlink
    Else
        MsgBox varD & "     ????????" & vbNewLine & _
               "Sie müssen ein gültiges Datum eingeben, sonst klappt's nicht!", vbCritical, "PHILIPP"
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, t
        Resume ErrEnd
    End Select
End Function

Public Function OH_tlbFilterField() As Long
On Error GoTo ErrMsg
    'siehe rechte Maustaste
    'Idee: das momentan aktuelle Feld filtern
    Dim strFrm As String
    Dim strN As String
    Dim strCS As String
    Dim lgid As Long
    Dim strField As String
    Dim strW As String
    Dim strIsText As String
    DoCmd.Hourglass True
    strFrm = Screen.ActiveForm.Name
    Set ctl = Screen.ActiveControl
    strCS = ctl.ControlSource
    strN = ctl.Name
    If strCS = "" Then
        MsgBox "Sie können Nicht nach einem Feld ohne Datenherkunft filtern!", _
        vbExclamation, "Filter für Feld " & strN
    Else
        OH_tlbFilterField = 0
        strW = OH_RPL(ctl.Value)
        If InStr(strN, "Datum") > 0 Then
            strW = Format(CDate(strW), "yyyymmdd")
        End If
        strlink = strCS & " in(''" & strW & "'')"
        strSQL = "Exec dbo.spI_ID InsertID_Filter,0,0,'" & _
                               strFrm & _
                               "', '" & strlink & "'"
        OH_EX
        Set frm = Forms(strFrm)
        strFrm = Mid(frm.Name, 3)
        strSQL = "Exec dbo.spa_" & strFrm & " vwID"
        OH_A "lstDet", strSQL, frm
        frm!countRec = frm!lstDet.ListCount
    End If

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Spezial-Filter OH_tlbFilterField"
    Resume ErrEnd
End Function
