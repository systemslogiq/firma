Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Compare Database
Option Explicit
Dim lgid As Long
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
DoCmd.Hourglass True
    Dim lgM As Long
    OH_A "lstProjektAct", , Me
    lstProjektAct_AfterUpdate
    Me.Caption = "Projektmappen"
    DoCmd.Maximize
    lgM = 10 'alle lgm minuten aktualisieren
    Me.TimerInterval = lgM * 60000 ' 60000 Millisekunden sind eine Minute.
ErrEnd:
    DoCmd.Hourglass False
Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_Current()
On Error GoTo ErrMsg
    Dim strf As String
    DoCmd.Hourglass True
    If Me.RecordSource = "" Then
        GoTo ErrEnd
    End If
    lgid = Me!ID
    If glDMS <> "" Then '<R214>
        strf = Me!projektNr
        strSQL = "Execute dbo.dms_ELO " & _
        " @x = 'ELO_Dokliste'" & _
        ", @d = '" & strf & _
        "',@f = 'Rechnungswesen'"
        OH_A "lstexplorer", strSQL, Me
        With Me!lstExplorer
            .ColumnCount = 4
            .ColumnWidths = OH_ColumnWidthsMM("0;50;20")
        End With
    Else
        s = OH_StichwortExplorer("explorer", , Me)
        If s = "" Then
            strSQL = "xxx"
        Else
            strSQL = "EXECUTE spI_GetFilePath " & _
                " @BaseDirectory = '" & s & "'"
        End If
        With Me!lstExplorer
            .ColumnCount = 5
            .ColumnWidths = OH_ColumnWidthsMM("0;50;20;30")
        End With
    End If
    OH_A "lstExplorer", strSQL, Me
    Me.AllowEdits = Me!VGStatus <> "Datev"
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Form_Current"
    Resume ErrEnd
End Sub
Public Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Nz(Me!ID, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_Timer()
On Error GoTo ErrMsg
    Dim lglstProjektAct As Long
    lglstProjektAct = Me!lstProjektAct
    Me!lstProjektAct = lglstProjektAct
    lstProjektAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Form_Timer"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    Dim N As Long
    Dim lstProjektAct As Long
    Me!txtFind.SetFocus
    Select Case Me!lstProjektAct
    Case 10, 11, 12
    Case Else
        Me!lstProjektAct = 10
    End Select
    strf = Replace(Nz(Me!txtFind.Text), "*", "%")
    OH_A "@x = 'RS' " & _
        ",@a = " & Nz(Me!lstProjektAct, 10) & _
        ",@f = '" & strf & "'", , Me
    N = OH_setQdf("qdfProjekt", strSQL, True, t)
    If N > 0 Then
        Me.RecordSource = "qdfProjekt"
        OH_FB Me, "ID =  " & lgid
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2185
        Resume errX
    Case Else
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.txtFind_AfterUpdate"
    End Select
    Resume ErrEnd
errX:
    lstProjektAct_AfterUpdate
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.txtFind_DblClick"
    Resume ErrEnd
End Sub
Private Sub ID_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Form_DblClick (0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.ID_DblClick"
    Resume ErrEnd
End Sub
Private Sub Info_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgVG As Long
    lgVG = lgid
    s = "Tragen Sie unten die gewünschte Info ein" & vbNewLine & _
        "zum Löschen ein <L> eintragen"
    t = "Projekt " & Me!projektNr & "   ID:" & lgid
    s = InputBox(s, t, Nz(Me!Info))
    If s <> Nz(Me!Info) And s <> "" Then
        OH_A "@x = 'setInfo'" & _
            ",@i = " & lgid & _
            ",@f = '" & OH_RPL(s) & "'", , Me
        OH_EX
        Me.Requery
        OH_FB Me, "ID =  " & lgVG, "Info"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Info_DblClick"
    Resume ErrEnd
End Sub

Public Sub lstProjektAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgQK As Long
    Dim lgact As Long
    Dim strA As String
    Dim N As Long
    DoCmd.Hourglass True
    lgact = Nz(Me!lstProjektAct, 0)
    t = Me!lstProjektAct.column(1)
    Select Case lgact
    Case 10, 11, 12
        Select Case lgact
        Case 10, 11, 12
            OH_A "lstProjektAct", , Me, True
        End Select
        txtFind_AfterUpdate
    Case 40
        Form_DblClick (0)
    Case 50
        OH_A "@x ='MappeSchliessen'" & _
            ",@f = '" & Nz(Me!projektNr, "") & "'", , Me
        OH_r r
        i = Nz(r!nichtErledigt, 0)
        s = ""
        Select Case i
        Case 1
            s = "EIN Vorgang ist noch nicht erledigt!"
        Case Is > 1
            s = i & " Vorgänge sind noch nicht erledigt!"
        End Select
        If s = "" Then
            strA = "JA"
        Else
            strA = "NEIN"
            s = "ACHTUNG!!" & vbNewLine & vbNewLine & s
        End If
        t = t & " " & Me!projektNr
        s = s & vbNewLine & vbNewLine & _
            "Mit einem JA können Sie die Projektmappe jetzt schliessen!" & vbNewLine & vbNewLine & _
            "Sie können die Projektmappe wieder öffnen," & vbNewLine & _
            "wenn Sie in einem Vorgang die Priorität auf = 4 setzen!" & vbNewLine & vbNewLine & _
            "mit JA das Schliessen bestätigen..."
        If InStr(InputBox(s, t, strA), "JA") > 0 Then
            strSQL = strSQL & _
                        ", @a = 1"
            OH_EX
            Me.Requery 'OH Hier stimmt's weil eine Pass Through-Query zugrunde liegt
        End If
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2105 'sie können nicht zum angegebene Datensatz gehen
    Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.lstProjektAct_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub projektNr_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Me!projektNr
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.projektNr_DblClick"
    Resume ErrEnd
End Sub
Private Sub Firma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Me!Firma
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.Firma_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstExplorer_dblclick(Cancel As Integer) '<R240116>
On Error GoTo ErrMsg
    Dim strf As String
    strf = Nz(Me!lstExplorer, "")
    If Nz(Me!lstExplorer, "") = "" Then
        GoTo ErrEnd
    End If
    If glDMS = "" Then
        OH_LaunchProgram 0, Me!lstExplorer
    Else
        OH_ELO_ShowFile Val(strf)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmProjekt.lstExplorer_dblclick"
    Resume ErrEnd
End Sub
Private Sub VGStatus_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgVG As Long
    lgVG = lgid
    t = "Status - Änderung" & Me!projektNr & " " & Me!QK
    Select Case Me!lstProjektAct
    Case 11
        s = "Diesen Status können Sie nur ändern, wenn Sie die Gelangensbestätigung auch tatsächlich ablegen!"
        GoTo ErrM
    End Select
    s = "Bitte die Nummer eintragen" & vbNewLine & vbNewLine & _
        "1 in Arbeit" & vbNewLine & _
        "2 versendet" & vbNewLine & _
        "3 erledigt"
    Select Case Me!VGStatus
    Case "in Arbeit"
        i = 2
    Case "versendet"
        i = 3
    Case "erledigt"
        i = 1
    End Select
    s = InputBox(s, t, i)
    Select Case Val(s)
    Case 1, 2, 3
        OH_A "@x = 'setStatus'" & _
            ",@i = " & lgid & _
            ",@f = '" & s & "'", , Me
        OH_EX
        Me.Requery
        OH_FB Me, "ID =  " & lgVG, "VGStatus"
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        s = Err.number & " " & Err.Description
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
