Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim f As Form
Dim strS As String
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgVGid As Long  '171127 geändert von INTEGER auf LONG OH
    Dim lgVGidu As Long
    Dim lgVGIDNeu As Long
    Dim strP As String
    Dim strPNeu As String
    OH_Move Me, 140, 100, 120, 100
    strS = "Exec dbo.spA_Clone @x = "
    Set f = Forms!F_VG
    t = "Clone Vorgänge aus " & f!projektNr
    Me.Caption = t
    lgVGid = f!VGID
    lgVGidu = f!VGIDu
    strSQL = strS & "'lstClone'" & _
        ", @i= " & lgVGid & _
        ",@a = " & lgVGidu
    OH_A "lstClone", strSQL, Me
    If Me!lstClone.ListCount = 0 Then
        s = "Es sind keine zu clonenden Vorgangsarten vorhanden!" & vbNewLine & _
            "(Stichwort = Clonen Ja)"
        GoTo ErrM
    End If
    For i = 0 To Me!lstClone.ListCount
        Me!lstClone.Selected(i) = True
    Next
    strSQL = strS & "'lstNeueNr'" & _
        ", @i= " & lgVGid
    OH_A "lstNeueNr", strSQL, Me
    Me!lstNeueNr.Selected(0) = True
    lstNeueNr_AfterUpdate
    Me!lblDatumTag.Caption = Me!lstClone.column(3, 1)
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    Cancel = True
    GoTo ErrEnd
End Sub
Private Sub btnOK_Click()
On Error GoTo ErrMsg
    Dim lgNr As Long
    Dim dt As Date
    Dim strP As String
    Dim strFO As String
    t = "Clonen ausführen"
    i = OH_InsertID_LST(Me!lstClone, True, True)
    If i = 0 Then
        s = "Sie haben keine zu clonenden Vorgangsarten markiert." & vbNewLine & _
            "Sie können dies mit der SHIFT und / oder CTRL-Taste vornehmen!"
        Me!lstClone.SetFocus
        GoTo ErrM
    End If
    lgNr = Nz(Me!lstNeueNr.column(0))
    If lgNr = 0 Then
        s = "Sie müssen definieren, ob Sie eine neue Unter-Nr. oder eine neue Projekt-Nr. wollen!"
        Me!lstNeueNr.SetFocus
        GoTo ErrM
    End If
    Select Case Nz(Me!DatumTag, "")
    Case ""
        s = "Sie müssen ein Datum (" & Me!lblDatumTag.Caption & ") festlegen!"
        Me!DatumTag.SetFocus
        GoTo ErrM
    Case Is < Date - 30
        s = "Dieses Datum (" & Me!lblDatumTag.Caption & " = " & Me!DatumTag & ") wird NICHT akzeptiert!"
        Me!DatumTag.SetFocus
        GoTo ErrM
    End Select
    strP = Nz(Me!projektNr, "")
    strFO = "0000.000"
    s = "Bitte geben Sie eine NICHT abgeschlossene Projekt-Nr. im Format " & strFO & " ein."
    If Len(strP) < Len(strFO) Then
        Me!projektNr.SetFocus
        GoTo ErrM
    End If
    If InStr(strP, ".") = 0 Then
        Me!projektNr.SetFocus
        GoTo ErrM
    End If
    If IsNumeric(Replace(strP, ".", "")) = False Then
        Me!projektNr.SetFocus
        GoTo ErrM
    End If
    If OH_Projektstopp(0, 0, strP) Then '200826
        GoTo ErrEnd
    End If

    strSQL = strS & "'OK'" & _
        ", @d= '" & Format(Me!DatumTag, "yyyymmdd") & _
        "',@f = '" & strP & _
        "',@m = " & lguser
    OH_r r
    i = r!nrVG30
    If i > 0 Then
        OH_SetKreditlimit i
    End If
    f!lstAktiv = 0
    f!lstA = 0
    f!lstVGIDAct = 400
    f!txtFind = strP
    f.txtFind_AfterUpdate

    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnclose_Click()
On Error GoTo ErrMsg
    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnClose_Click"
    Resume ErrEnd
End Sub
Private Sub btnMinus_click()
    Me!DatumTag = Nz(Me!DatumTag, Date) - 1
End Sub
Private Sub btnPlus_click()
    Me!DatumTag = Nz(Me!DatumTag, Date) + 1
End Sub
Private Sub lstNeueNr_AfterUpdate()
On Error GoTo ErrMsg
    Me!projektNr.Visible = True
    Select Case Nz(Me!lstNeueNr, 1)
    Case 1, 2
        Me!projektNr = Me!lstNeueNr.column(2)
    Case 3
        Me!comProjektNr.SetFocus
        Me!comProjektNr.Dropdown
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstNeueNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comProjektNr_GotFocus()
    strSQL = strS & "'comProjektNr'"
    OH_A "comProjektNr", strSQL, Me
End Sub
Private Sub comProjektNr_AfterUpdate()
On Error GoTo ErrMsg
    Me!projektNr = Me!comProjektNr.column(1)
    Me!projektNr.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comProjektNr_AfterUpdate"
    Resume ErrEnd
End Sub
