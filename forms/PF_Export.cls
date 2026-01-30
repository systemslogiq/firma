Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim lgExport As Long
Dim strF1 As String
Dim strQ As String
'171229 Mehr Funktionalität von VBA nach SQL verlagert
Private Sub Form_Load()
' 120109
On Error GoTo ErrMsg
    OH_A "VGStatus", , Me
    Me!VGStatus = "NOCH NICHT in DATEV"
    strQ = "EXEC spA_Faktura " & _
                " @x ='Faktura'" & _
                ",@i = "
    strSQL = strQ & "1"
    OH_r r
    strF1 = r!f1
    Me!TextFile = r!f1
    Me!vonDat = Date + Val(r!von) '<R174>
    Me!BisDat = Date + Val(r!bis)
    OH_Move Me, 150, 50, 300, 110  '<R63> links 150 wegen Christina's Doppel-Klick
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Export.Form_Load"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnclose_Click()
On Error GoTo ErrMsg
    DoCmd.Close acForm, "PF_Export"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnStatus_Click()
On Error GoTo ErrMsg
    s = "Es werden nur Vorgänge exportiert, die dem angewählten Status entsprechen!" & vbNewLine & _
            "Nach dem EXPORT von Daten wird der Vorgangsstatus automatisch auf <" & glStrStatus & "> gesetzt."
    MsgBox s, vbInformation, "Infos zum EXPORT-Status"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub

Private Sub btnVG_Click()
On Error GoTo ErrMsg
    If IsNull(Me!vonDat) Then
        btnvonDat_Click
        Me!vonDat.SetFocus
        GoTo ErrEnd
    End If
    If IsNull(Me!BisDat) Then
        btnBisDat_Click
        Me!BisDat.SetFocus
        GoTo ErrEnd
    End If
    If IsNull(Me!TextFile) Then
        Me!TextFile.SetFocus
        GoTo ErrEnd
    End If
    If Me!vonDat > Me!BisDat Then
        Me!vonDat = Me!BisDat
        Me!vonDat.SetFocus
        GoTo ErrEnd
    End If
    If lgExport = 0 Then
        btnExport_Click
    End If
    If lgExport > 0 Then
        OH_OF "F_VG", Nz(Me!lstFaktura, 0)
        Set frm = Forms!F_VG
        strSQL = "Exec dbo.spa_VG vwID"
        OH_A "lstDet", strSQL, frm
        frm!countRec = frm!lstDet.ListCount
        frm!lstDet.Selected(1) = True
        frm.lstDet_AfterUpdate
        frm.regd = 1
        DoCmd.Close acForm, "PF_Export"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnvonDat_Click()
    OH_OpenKalender Me!vonDat
End Sub
Private Sub btnBisDat_Click()
    OH_OpenKalender Me!BisDat
End Sub
Private Sub SpinButtonvonDat_SpinDown()
    Me!vonDat = Nz(Me!vonDat, Date) - 1
End Sub
Private Sub SpinButtonvonDat_Spinup()
    Me!vonDat = Nz(Me!vonDat, Date) + 1
End Sub
Private Sub SpinButtonbisDat_SpinDown()
    Me!BisDat = Nz(Me!BisDat, Date) - 1
End Sub
Private Sub SpinButtonbisDat_Spinup()
    Me!BisDat = Nz(Me!BisDat, Date) + 1
End Sub
Private Sub btnExport_Click()  '150615
    OH_Export True
End Sub
Private Sub btnExportOhne_Click()
    OH_Export False
End Sub
Private Function OH_Export(blmit As Boolean)   '150615
On Error GoTo ErrMsg
    Dim strV As String
    DoCmd.Hourglass True
    Dim lgT As Long
    Dim lgct As Long
'171229 Mehr Funktionalität von VBA nach SQL verlagert
    strSQL = strQ & "0" & _
            ", @s = '" & Me!VGStatus & _
            "',@o = '" & glStrStatus & _
            "',@n = " & glMandant & _
            ", @f = '" & Format(Me!vonDat, "yyyymmdd") & _
            "',@d = '" & Format(Me!BisDat, "yyyymmdd") & "'"
    OH_r r
    lgct = r!CT
    If lgct = 0 Then
        s = "Keine Daten zum Exportieren vorhanden!"
        GoTo ErrM
    End If
    If blmit Then
        Select Case glDMS
        Case "SQL", ""
        Case "ELO"
            strSQL = "EXECUTE dbo.DMS_ELO @x = 'GetUniqueID'"
            OH_EX
        Case Else
            strSQL = "Select * from vwid"
            OH_r r
            While Not r.EOF
                lgT = lgT + 1
                Me.Caption = "Suche DMS-DOKU für ID " & r!ID & " (" & lgT & " von " & lgct & ")"
                s = OH_ListDMS(r!ID, "ID")
                If s <> "" Then
                    strSQL = "Update T_ID " & _
                            "Set IDT1 = '" & s & _
                            "' where NrID = " & r!nrID
                    OH_EX
                End If
            r.MoveNext
            Wend
        End Select
    End If
    strSQL = strQ & "3"
    OH_A "lstFaktura", strSQL, Me
    lgExport = Me!lstFaktura.ListCount - 1
    s = "Exportliste mit " & lgExport & " Datensätzen"
    SysCmd acSysCmdSetStatus, s
    Me.Caption = s
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "Export Rechnungswesen"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Private Sub btnStartExport_Click()
On Error GoTo ErrMsg
    Dim strS As String
    Dim lgVG As String
    Dim N As Long
    Dim A As String
    DoCmd.Hourglass True
    t = Me!btnStartExport.Caption
    Select Case Me!VGStatus
    Case "noch zu bearbeiten"
        s = "Vorgänge mit Status" & vbNewLine & vbNewLine & _
                Me!VGStatus & vbNewLine & vbNewLine & _
            "werden nicht exportiert!"
        GoTo ErrM
    End Select
    If OH_CheckAdmin("+" & Me!btnStartExport.Caption) = False Then
        btnExport_Click
        DoCmd.Hourglass True
        Select Case glDMS
        Case "SQL", ""
        Case Else
            i = 0
            s = "ACHTUNG"
            s = s & vbNewLine & _
                "für diese IDs sind keine Dokumente im DMS!" & vbNewLine & _
                "Bitte zuerst ein Dokument zuordnen" & vbNewLine & _
                "(Für Kreditoren muss die Rechnungs-Nr. und Datum übereinstimmen):" & vbNewLine
            strSQL = strQ & "11" 'welche Vorgänge sind OHNE Dokument
            OH_r r
            While Not r.EOF
                i = i + 1
                s = s & r!ID & "  "
            r.MoveNext
            Wend
            If i > 0 Then
                GoTo ErrM
            End If
        End Select
        t = "EXPORT FAKTURA " & lgExport & " Datensätze!"
        If lgExport > 0 Then
            OH_KILL strF1
            Open strF1 For Output As #1
            strSQL = strQ & "2"
            OH_r r

            i = 0
            'Überschriften
            s = ""
            For N = 0 To r.Fields.count - 1
                A = r.Fields(N).Name
                If s = "" Then
                    s = A
                Else
                    s = s & ";" & A
                End If
            Next N
            Print #1, s
            While Not r.EOF
                i = i + 1
                s = ""
                For N = 0 To r.Fields.count - 1
                    A = Nz(r.Fields(N).Value, "")
                    If s = "" Then
                        s = A
                    Else
                        s = s & ";" & A
                    End If
                Next N
                Print #1, s
            r.MoveNext
            Wend
            If i = 0 Then
                MsgBox "Export nach " & Me!TextFile & " ist gescheitert!", vbCritical, t
            Else
                If Len(Dir(strF1)) > 0 Then
                    strSQL = strQ & "4"
                    OH_EX
                    MsgBox "Export nach " & strF1 & vbNewLine & _
                            "mit " & i & " Datensätzen ist erledigt!", vbInformation, t
                    DoCmd.Close acForm, "PF_Export"
                End If
            End If
        Else
            MsgBox "KEINE DATEN GEFUNDEN" & vbNewLine & _
                    "mit Status <" & Me!VGStatus & ">", vbCritical, t
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Close #1
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EXPORT FAKTURA"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub TextFile_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub TextFile_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!TextFile) Then
        Cancel = True
        Me.Undo
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnDMS_Click()
On Error GoTo ErrMsg
    Dim strID As String
    Dim lgid As Long
    strID = Nz(Me!lstFaktura.column(9), "")
    lgid = Nz(Me!lstFaktura.column(0), 0)
    If lgid = 0 Then
        s = "Bitte markieren Sie zuerst die entsprechende Zeile"
        GoTo ErrM
    End If
    If strID = "" Then
        t = "ID " & Me!lstFaktura
        s = "NOCH KEIN DOKUMENT hinterlegt!"
        GoTo ErrM
    End If
    Select Case glDMS
    Case ""
        OH_LaunchProgram 0, strID
    Case "ELO"
        strSQL = "EXECUTE DMS_ELO @x='GetIDFromUniqueID',@f = '" & strID & "'"
        OH_r r
        If Not r.BOF Then
            OH_ELO_ShowFile r!ID
        End If
    Case Else
        OH_ShowDMSDocument strID
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnDMS_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub VGStatus_AfterUpdate()
    OH_Export False
End Sub
