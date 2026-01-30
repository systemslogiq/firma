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
    OH_A "lstC", , Me
    OH_A "lstT", , Me
    OH_A "lstTabelle", , Me
    Me!lstTabelle = "A L L E  Tabellen"
    OH_A "LstTopA", , Me
    OH_A "lstUser", , Me
    Me!lstUser = Me!lstUser.column(0, 1)
    Me!lstTopA = 40
    lstActualUser_DblClick 0
    lstTopA_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.Form_Activate"
    Resume ErrEnd
End Sub
Public Sub Form_Current()
On Error GoTo ErrMsg
    Me!btnInsertDeleted.Visible = True
    If Me!tableName = "LOGIN" Or Me!colname = "Ausdrucken" Then
        Me!btnInsertDeleted.Visible = False
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
       'MsgBox Err.Number & " " & Err.Description, vbCritical, "Form_F_Audit.Form_Current"
    End Select
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub keycol_DblClick(Cancel As Integer)
    lstDet_DblClick (0)
End Sub
Private Sub lstA_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstActualUser_Click()
On Error GoTo ErrMsg
    Me!lstUser = Me!lstActualUser
    lstUser_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstActualUser_Click"
    Resume ErrEnd
End Sub
Private Sub lstActualUser_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_A "lstActualUser", , Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstActualUser_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strA As String
    Dim lgid As Long
    Dim lgArt As Long
    Dim strf As String
    strA = Nz(Me!lstDet.column(3))
    DoEvents
    t = "Doppel-Klick auf Audit-Liste"
    lgid = Val(Nz(Me!keycol, 0))
    Select Case strA
    Case "Anmeldung", "Abmeldung"
        s = strA & vbNewLine & _
            "User" & vbTab & Me!AuditWho & vbNewLine & _
            "Uhrzeit" & vbTab & Format(Me!AuditDate, "dd.mm.yy HHMM")
        MsgBox s, vbInformation, t
    Case Else
        s = "Dieser Datensatz wurde verändert" & vbNewLine & _
            "User" & vbTab & Me!AuditWho & vbNewLine & _
            "Uhrzeit" & vbTab & Format(Me!AuditDate, "dd.mm.yy HHMM") & vbNewLine & _
            "Tabelle" & vbTab & Me!tableName & vbNewLine & _
            "ID" & vbTab & Me!keycol & vbNewLine & vbNewLine
        If strA = "Deleted" Then
            s = Replace(s, "verändert", "gelöscht") & _
                left(Me!oldval, 500)
            MsgBox s, vbInformation, t
            GoTo ErrEnd
        End If
        s = s & _
            "Feldname" & vbTab & vbTab & Me!colname & vbNewLine & vbNewLine & _
            "alter Wert" & String(40, "=") & vbNewLine & _
            left(Me!oldval, 500) & vbNewLine & vbNewLine & _
            "neuer Wert" & String(40, "=") & vbNewLine & _
            left(Me!newval, 500)
        strf = Replace(Me!tableName, "T_", "F_")
        Select Case strf
        Case "F_Land"
            strf = "PF_Land"
        Case "F_Funktion"
            strf = "F_Adresse"
        Case "F_Adresse"
            lgArt = 1
        End Select
        If OH_FrmExist(strf) Then
            s = s & vbNewLine & vbNewLine & _
                "Daten anschauen ?"
            If MsgBox(s, vbQuestion + vbYesNo, "Formular öffnen" & strf) = vbYes Then
                Select Case strf
                Case "pF_Land"
                    DoCmd.openForm "PF_Land"
                    OH_FB Forms!PF_Land, "NrLand= " & lgid
                Case Else
                    OH_OF strf, lgid, lgArt
                End Select
            End If
        Else
            MsgBox s, vbInformation, t
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & "  " & Err.Description, vbCritical, "F_Audit.lstDet_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstTabelle_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub LstTopA_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstUser_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstC_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub btnArchiv_Click()
On Error GoTo ErrMsg
    Dim strFile As String
    Dim strf As String
    Dim N As Long
    t = "Archivieren von Änderungen, Löschungen"
    If OH_CheckAdmin("+" & t) = False Then
        s = Me!btnArchiv.ControlTipText & vbNewLine & _
                "Geben Sie die Anzahl der letzten Tage ein, die Sie NICHT archivieren wollen!" & vbNewLine & _
                "Vorgabewert ist 30, d.h. Sie behalten den letzten Monat!" & vbNewLine & vbNewLine & _
                "Geben Sie das Wort   Alle   ein, wenn Sie ALLE DATEN archivieren wollen."
        x = InputBox(s, t, 30)
        Select Case x
        Case ""
            N = 0
        Case "Alle"
            N = 1000000
            s = "Alle Daten"
        Case Else
            N = Val(x)
            s = "älter als " & N & " Tag(e)"
        End Select
        If N = 0 Then
            GoTo ErrEnd
        End If
        strSQL = "Exec dbo.spa_Audit @x = 'Archivcount', @i = " & N
        OH_r r
        i = r!AnzahlArchiv 'Anzahl zu archivierender Datensätze
        If i = 0 Then
            MsgBox "Der ausgewählte Zeitraum beinhaltet keine Daten (" & s & ")", vbExclamation, t
        Else
            i = MsgBox("bitte bestätigen Sie die Archivierung von " & i & " Datensätzen im Textfile " & vbNewLine & _
                    strFile & vbNewLine & vbNewLine & _
                    "JA" & vbTab & "Archivieren" & vbNewLine & _
                    "Nein" & vbTab & "Nur anzeigen", vbExclamation + vbYesNoCancel, t)
            Select Case i
            Case vbYes
                strSQL = "Exec dbo.spa_Audit" & _
                        " @x = 'Archiv'" & _
                        ", @i = " & N
                OH_r r
                s = "Anzahl" & vbTab & "was" & vbNewLine & _
                        "===================================" & vbNewLine & _
                        r!DeletedRecords & vbTab & "betroffene Datensätze" & vbNewLine & _
                        r!New & vbTab & "aktuelle Audit-Tabelle" & vbNewLine & _
                        r!old & vbTab & "im Archiv"
                MsgBox s, , t
                txtFind_AfterUpdate
            Case vbNo
                strSQL = "Exec dbo.spA_Audit" & _
                        " @x = 'lstdet'" & _
                        ", @i = " & N
                OH_A "lstdet", strSQL
                Me!lstDet.SetFocus
            End Select
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Audit.btnArchiv_Click"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!lstA
    Case 3, 4
        Me!lstTabelle = "A L L E  Tabellen"
        Me!lstTabelle.Selected(1) = True
    End Select
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstC_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!lstC
    Case 5
        Me!txtFind = Format(Now, "yyyy-mm-dd hh:")
    End Select
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstC_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstArt_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Audit", Nz(Me!lstArt, 0)
    Me!lstArt.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstArt_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstDet_AfterUpdate"
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
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_OF "F_Audit", Me!lstTop
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstTopA_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    txtFind_AfterUpdate
    Me!lstTopA.SetFocus
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstTopA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstUser_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    txtFind_AfterUpdate
    Me!lstUser.SetFocus
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstUser_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstT_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    txtFind_AfterUpdate
    Me!lstT.SetFocus
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstT_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstTabelle_AfterUpdate()
On Error GoTo ErrMsg
    If Me!lstTabelle <> "A L L E  Tabellen" Then
        Select Case Me!lstA
        Case 3, 4
            Me!lstA = 0
        End Select
    End If
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.lstTabelle_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spA_Audit " & _
                    " @x = 'lst'" & _
                    ",@a = " & Nz(Me!lstA, 0) & _
                    ",@b = " & Nz(Me!lstC, 0) & _
                    ",@z = " & Nz(Me!lstT, 0) & _
                    ",@t = '" & Nz(Me!lstTabelle, "A L L E  Tabellen") & _
                    "',@f = '" & OH_RPL(Nz(Me!txtFind, "")) & _
                    "',@d = " & Nz(Me!lstTopA, 0) & _
                    ",@u = '" & Nz(Me!lstUser, " A L L E   User") & "'"
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Audit.txtFind_AfterUpdate"
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
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Audit.txtFind_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnInsertDeleted_Click()
On Error GoTo ErrMsg
    t = "Daten wiederherstellen"
    If Not glAdmin Then
        s = "geht nur mit Admin-Rechten"
        GoTo ErrM
    End If
    s = "JA" & vbNewLine & _
        "Wollen Sie diese Daten wiederherstellen?" & vbNewLine & vbNewLine & _
        "lfd.-Nr." & vbTab & Me!NrAudit & vbNewLine & _
        "Tabelle" & vbTab & Me!tableName & vbNewLine & _
        "ID" & vbTab & Me!keycol & vbNewLine & vbNewLine
    i = Me!countRec
    If i > 0 Then
        s = s & "NEIN" & vbNewLine & _
            "Wollen Sie ALLE " & i & " GEFILTERTEN Daten" & vbNewLine & _
            "-sofern es sich um gelöschte/geänderte Daten handelt -" & vbNewLine & _
            "wiederherstellen?"
    End If
    i = MsgBox(s, vbYesNoCancel + vbExclamation + vbDefaultButton3, t)
    DoCmd.Hourglass True
    OH_ResetID
    Select Case i
    Case vbCancel
        GoTo ErrEnd
    Case vbYes
        OH_InsertID Nz(Me!NrAudit, 0)
    Case vbNo
        OH_InsertID_LST Me!lstDet
    End Select
    OH_A "@x = 'InsertDeleted'"
    OH_r r
    s = r!Msg
    MsgBox s, vbExclamation, t
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        s = Err & " " & Err.Description
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
