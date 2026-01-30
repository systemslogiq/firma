Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim frmN As Form
Dim lgNavi As Long
Dim ctlNavi As control
Dim strNavi As String
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgV As Long
    Dim lgY As Long
    Dim lgX As Long
    Dim lgH As Long
    lgNavi = Nz(Me.OpenArgs)
    OH_A "lststatus", , Me
    OH_A "lstAktiv", , Me
    lgX = 150
    lgY = 20
    Select Case lgNavi
    Case 10
        Set frmN = Forms!F_Adresse
        strNavi = "Zuordnen als " & frmN!comKArt & " von " & frmN!pageFunktion.Caption
        Set ctlNavi = frmN!f0
        Me!lstStatus = frmN!comKArt.column(4)
    Case 20
        Set frmN = Forms!PF_NeuVG
        strNavi = "Adresse zu neuem Vorgang " & frmN!NrQK.column(1) & " zuordnen"
        Set ctlNavi = frmN!NrFunktion
        Me!lstStatus = 20
    Case 30, 31
        Set frmN = Forms!F_VG
        strNavi = "Adresse Zuordnen als " & frmN!comKArt.column(1)
        Set ctlNavi = frmN!NrVG
        Me!lstStatus = 20
        If lgNavi = 31 Then
            Me!txtFind = frmN!Firma
        End If
    Case 40
        Set frmN = Forms!F_VG
        strNavi = "Adresse dem Vorgang " & frmN!NrQK.column(1) & " zuordnen"
        Set ctlNavi = frmN!NrFunktion
        Me!lstStatus = 20
    Case 50
        Set frmN = Forms!pfrmAdresseCheck
        strNavi = frmN!Vorname & " " & frmN!Nachname & " arbeitet bei Fa.:"
        Set ctlNavi = frmN!Firma
        Me!lstStatus = 10
        lgV = 1
    Case 60
        Set frmN = Forms!F_Adresse
        strNavi = "Vorgang verschieben"
        Set ctlNavi = frmN!lstVG
        Me!lstStatus = 20
        lgV = 1
    Case 70, 71, 72
        Set frmN = Forms!F_VG!UF_txt.Form
        Set ctlNavi = frmN!txt
        strNavi = ctlNavi & " zuordnen"
        If lgNavi = 72 Then
            Me!lstStatus = 20
            Me!txtFind = Forms!F_VG!Firma
        Else
            Me!lstStatus = 10
        End If
    Case 80, 81
        Set frmN = Forms!PF_NeuAdresse
        strNavi = "neue Adresse zuordnen"
        Select Case lgNavi
        Case 80, 81
            lgY = (frmN.WindowTop + frmN.WindowHeight) / 56.7
            lgX = frmN.WindowLeft / 56.7
            If lgNavi = 80 Then
                Set ctl = frmN!ArtAdresse
            Else
                Set ctl = frmN!ArtAdresse1
            End If
            Select Case ctl
            Case "Frau"
                Me!lstStatus = 22
            Case "Herr"
                Me!lstStatus = 21
            Case Else
                Me!lstStatus = 10
            End Select
        End Select
        Set ctlNavi = frmN!lstActNeu
        lgV = 1
    Case 90 'Firmenwechsel
        Set frmN = Forms!F_Adresse
        strNavi = Trim(frmN!pageFunktion.Caption) & " wechselt in andere Firma..."
        Set ctlNavi = frmN!f0
        Me!lstStatus = 10
        lgV = 1
    Case 100 'gleiche Anschrift wie...
        Set frmN = Forms!F_Adresse
        strNavi = Trim(frmN!pageFunktion.Caption) & " gleiche Anschrift wie..."
        Set ctlNavi = frmN!f0
        Me!lstStatus = 0
        lgV = 1
    End Select
    Me.Caption = strNavi
    t = strNavi
    Me!btnOK.Caption = "..." & t
    If InStr(t, "zuordnen") Then
        lgV = 1
    End If
    'hole letzte Info aus Verlauf!
    If lgV = 1 Then
        If left(lgNavi, 12) = "zuordnen als" Then
            strSQL = "Exec dbo.spI_Verlauf @x = 'LetzteZuordnung'"
        Else
            strSQL = "Exec dbo.spI_Verlauf @x = 'LetzterVG', @u =" & lguser
        End If
        OH_r r
        If Not r.BOF Then
            If Not IsNull(r!NrFunktion) Then
                Me!comAdresse = r!NrFunktion
                comQK_Enter
                ComVG_Enter
            End If
        End If
    End If
    Select Case lgV
    Case Is > 0
        lgV = -1
    End Select
    Me!btnOK.Visible = lgV
    For Each ctl In Me.Det.Controls
        i = Val(ctl.Tag)
        If i > 0 Then
            ctl.Visible = Not lgV
            If lgV Then
                ctl.top = 0
            Else
                ctl.top = i * 56.7
            End If
        End If
    Next ctl
    'bettina
    lstStatus_AfterUpdate
    If lgV Then
        lgH = 70
    Else
        lgH = 110
    End If
    OH_Move Me, lgX, lgY, 120, lgH
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    t = vbNullString
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.Form_Open"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub lstAktiv_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!lstAktiv
    Case 100 'Eingabe leeren
        Me!txtFind = Null
        Me!comAdresse = Null
        Me!comQK = Null
        Me!ComVG = Null
        Me!lstAktiv = 10
        Me!txtFind.SetFocus
    Case 110 'Formular schliessen
        DoCmd.Close acForm, Me.Name
        GoTo ErrEnd
    End Select
    lstStatus_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.lstAktiv_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStatus_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    OH_A "comAdresse", _
        "@i = " & Nz(Me!comAdresse, 0) & _
        ",@a = " & Nz(Me!lstAktiv, 10) & _
        ",@n = " & Val(Nz(Me!lstStatus, 0)) & _
        ",@b = " & EFNr & _
        ",@f = '" & Nz(Me!txtFind, "") & "'", Me
    Me!txtFind.SetFocus
    Me!comAdresse.BackColor = Me!txtFind.BackColor
    Select Case Me!comAdresse.ListCount
    Case 0
        Me!comAdresse.BackColor = vbRed
    Case 1
        Me!comAdresse = Me!comAdresse.column(0, 0)
    Case Else
        If Nz(Me!txtFind, "") <> "" Or Me!lstStatus = 30 Then
            Me!comAdresse.SetFocus
            Me!comAdresse.Dropdown
        End If
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.lstStatus_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnOK_Click()
On Error GoTo ErrMsg
    If Nz(Me!comAdresse, 0) = 0 Then
        MsgBox Me!lstStatus.column(1) & " ==> auswählen!", vbInformation, Me!btnOK.Caption
        Me!comAdresse.SetFocus
    Else
        OH_Navigator lgNavi
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.btnOK_Click"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    lstStatus_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.txtFind_Afterupdate"
    Resume ErrEnd
End Sub
Private Sub btntxtFind_Click()
    lstStatus_AfterUpdate
End Sub
Private Sub btnAdresse_Click()
On Error GoTo ErrMsg
    Dim lgF As Long
    If IsNull(Me!comAdresse) Then
        Me!comAdresse.SetFocus
        Me!comAdresse.Dropdown
    Else
        lgF = Nz(Me!comAdresse, 0)
    End If
    DoCmd.Close acForm, Me.Name
    OH_OF "F_Adresse", lgF
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.btnAdresse_Click"
    Resume ErrEnd
End Sub
Private Sub btnQK_Click()
On Error GoTo ErrMsg
Dim strFirma As String
Dim strPerson As String
Dim strQK As String
    If IsNull(Me!comAdresse) Then
        strFirma = "not NrFirma =null"
    Else
        strFirma = "NrFirma=" & Me!comAdresse
    End If
    If IsNull(Me!comAdresse) Then
        strPerson = vbNullString
    Else
        strPerson = " and NrFunktion=" & Me!comAdresse
    End If
    If IsNull(Me!comQK) Then
        strQK = vbNullString
    Else
        strQK = " and NrQK = " & Me!comQK
    End If
    'OH_SF 11, strFirma & strPerson & strQK, "Where", "Vorgänge über Navigator"
    minimizeNavi
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.btnQK_Click"
    Resume ErrEnd
End Sub
Private Sub btnLeistung_Click()
On Error GoTo ErrMsg
    OH_A "@x = 'NrLeistungVG', " & _
        " @i = " & Me!ComVG
    OH_r r
    If r.BOF Then
        MsgBox "Keine Leistungen vorhanden!", vbExclamation, Me.Caption
    Else
        OH_OF "F_Leistung", r(0)
        minimizeNavi
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.btnLeistung_Click"
    Resume ErrEnd
End Sub
Private Sub btnVG_Click()
On Error GoTo ErrMsg
    Dim lgVG As Long
    lgVG = Nz(Me!ComVG, 0)
    'btnQK_Click
    If lgVG > 0 Then
        OH_OF "F_VG", lgVG
    End If
    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.btnVG_Click"
    Resume ErrEnd
End Sub
Private Sub comAdresse_enter()
On Error GoTo ErrMsg
'    If Me!comAdresse.Recordset.Source = "" Then
'        lstStatus_AfterUpdate
'    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.comAdresse_enter"
    Resume ErrEnd
End Sub
Public Sub comAdresse_AfterUpdate()
On Error GoTo ErrMsg
    Me!ComVG = Null
    If IsNull(Me!comAdresse) = False Then
        Me!btnOK.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.comAdresse_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comqk_AfterUpdate()
On Error GoTo ErrMsg
        Me!ComVG = Null
        Me!ComVG.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.comqk_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comQK_Enter()
 On Error GoTo ErrMsg
    OH_A "comQK", _
        " @i = " & Me!comAdresse & _
        ",@f = '" & Me!txtFind & "'", Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.comQK_Enter"
    Resume ErrEnd
End Sub
Private Sub comVG_AfterUpdate()
On Error GoTo ErrMsg
    Me!btnVG.SetFocus
    Me!comQK = Me!ComVG.column(4)
    Me!comAdresse = Me!ComVG.column(3)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.comVG_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ComVG_Enter()
On Error GoTo ErrMsg
    OH_A "comVG", _
        " @i = " & Me!comAdresse & _
        ",@b = " & Me!comQK & _
        ",@f = '" & Me!txtFind & "'", Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.ComVG_Enter"
    Resume ErrEnd
End Sub
Public Sub minimizeNavi()
On Error GoTo ErrMsg
'wenn chkminimize auf -1 gesetzt, Navigator minimieren
    If Me!chkMinimize = -1 Then
        Me.SetFocus
        DoCmd.Minimize
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Navigator.minimizeNavi"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = ""
    txtFind_AfterUpdate
End Sub
