Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim lgStart As Long
Dim dx As Date
Dim strT As String
Dim lgFrigutec As Long
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    dx = Date + 8 - Weekday(Date, vbFriday) + 7
    strT = Nz(Me.OpenArgs, "")
    DoCmd.Hourglass True
    Dim lgM As Long
    OH_A "@x = 'BasisDaten'", , Me
    OH_EX
    OH_A "lstTankAct", "@f= '" & dx & "'", Me
    If strT = "" Then
        strT = OH_TankUser
    End If
    Me!lstTank = strT
    Me!lstTankAct = 0
    lgStart = CLng(Date) - 3 '--date where tank chart starts
    ogTank_AfterUpdate
    'lstTank_AfterUpdate
    'lstTankAct_AfterUpdate
    Me.Caption = "Tank-Übersicht"
    DoCmd.Maximize
    'lgStart = CLng(Date) - 3 '--date where tank chart starts
    'OH_SetT lgStart
    s = "Liste möglicher Aktionen im Tanklager."
    Me!lstTankAct.ControlTipText = s
    OH_Move Me, 50, 0, 350, 300
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Open"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    Dim strT As String
    strT = Nz(Me!lstTank, "")
    'beim Schliessen wird der aktuell markierte Tank für den User zwischengespeichert
    If strT <> "" Then
        OH_TankUser strT
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Close"
    Resume ErrEnd
End Sub

Private Function OH_SetT(lgT As Long)
On Error GoTo ErrMsg
    Dim A As String
    Dim Y As Long
    Dim lgHeight As Long
    Dim lgTop As Long
    Dim lgLeft As Long
    Dim lgX As Long
    Dim lgTA As Long
    Dim blEmpty As Boolean
    Dim strOption As String
    If Me!ogTank = 1 Then
        strOption = "Tank"
    Else
        strOption = "Artikel"
    End If
    strT = Trim(Nz(Me!lstTank.column(0), "")) '180510 Trim erforderlich
    t = "verlauf für " & strOption & " " & strT
    If strT = "" Then
        s = "Bitte den gewünschten " & strOption & " markieren."
        GoTo ErrM
    End If
    Me!linHeute.Visible = False
    OH_A "@x = 'TankVerlauf'" & _
        ", @f = '" & strT & _
        "',@t = '" & Format(CDate(lgT), "yyyymmdd") & _
        "',@a = " & Me!reV.top & _
        ",@og = " & Me!ogTank & _
        ",@z = " & Me!reV.left & _
        ",@b = " & Me!reV.Height, , Me
    OH_r r
    If r.BOF Then
        s = "hierzu gibt es keinen Verlauf."
        GoTo ErrM
    End If
    lgX = Me!reV.top + Me!reV.Height 'Basis der x-Achse

    While Not r.EOF
        i = r!N
        If Me!ogTank = 2 Then
            Me!lblleer.Visible = True
            Me.lblleer.Caption = 0
            Me!lblhalb.Visible = False
            Me!lblVoll.Visible = True
            Me.lblVoll.Caption = r!lblVoll
        Else
            If i = 1 Then
                Me!lblVoll.Caption = Nz(r!lblVoll, "VOLL")
                Me!lblhalb.Caption = Nz(r!lblhalb, "50%")
            Else
                Me!lblleer.Visible = True
                Me.lblleer.Caption = "leer = 0 MT"
                Me!lblhalb.Visible = True
                Me.lblhalb.Caption = r!lblhalb '"50% = 786.5 MT"
                Me!lblVoll.Visible = True
                Me.lblVoll.Caption = r!lblVoll '"voll = 1573.0 MT"
            End If
        End If
        '*******CAPTION CHART
        A = Format(i, "00")
        With Me("t" & A)
            .Caption = r!Datum
            .left = r!left
            .FontWeight = 400
        End With
        For Y = 1 To 3
            lgHeight = Nz(r("h" & Y), 0)
            blEmpty = lgHeight <= 0
            If blEmpty Then
                lgHeight = lgHeight * -1
            End If
            With Me("m" & Y & A)
                .Visible = True
                lgLeft = r!left
                .left = lgLeft
                .Height = lgHeight
                .BackColor = r!BackColor
                .Tag = r!tankinfo
                .Width = Me!t01.Width
                .Visible = lgHeight <> 0
                Select Case Y
                Case 1
                    lgTop = lgX - lgHeight
                    .BorderColor = vbYellow
                Case 2
                    lgTop = lgTop - lgHeight
                    .BorderColor = vbBlue
                Case 3
                    lgTop = lgTop - lgHeight
                    .BorderColor = vbGreen
                End Select
                If blEmpty Then 'wenn a <0 then
                    .Width = .Width / 3
                    .BackColor = vbRed
                    lgTop = lgX
                    .left = lgLeft + (Y - 1) * .Width
                End If
                .top = lgTop
            End With
        Next Y
        If r!Heute = 0 Then
            Me!linHeute.Visible = True
            Me!linHeute.left = Me("t" & A).left + Me("t" & A).Width / 2
            Me("t" & A).ForeColor = vbRed
            Me("t" & A).FontWeight = 700
        Else
            Me("t" & A).ForeColor = vbBlack
        End If
    r.MoveNext
    Wend
    OH_A "lstVerlauf", "@f = '" & strT & "' , @a = " & Me!ogTank, Me '<EC>
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2105 'sie können nicht zum angegebene Datensatz gehen
    Resume Next
    Case Else
        s = Err.number & " " & Err.Description
        t = "OH_SetT"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub btnPrev_Click()
    lgStart = lgStart - 7
    OH_SetT lgStart
End Sub
Private Sub btnNext_Click()
    lgStart = lgStart + 7
    OH_SetT lgStart
End Sub
Private Sub lstTankAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgact As Long
    Dim N As Long
    Dim d As Date
    Dim iCols As Long
    Dim iCol As Long
    Dim strP As String
    Dim strf As String
    Dim strS As String
    Dim strProject As String
    Dim xlwrkP As Excel.Workbook
    Dim xlwrk As Excel.Workbook
    Dim ws As Excel.Worksheet
    Dim wp As Excel.Worksheet
    Dim lgFrigutec As Long
    DoCmd.Hourglass True
    lgact = Nz(Me!lstTankAct, 0)

    If Nz(Me!oFrigutec, 0) = False Or Nz(Me!oFrigutec, 0) = 0 Then
        lgFrigutec = 1
    Else
        lgFrigutec = 0
    End If
    t = Me!lstTankAct.column(1)
    Select Case lgact
    Case 0
        lgStart = CLng(Date) - 3
        OH_A "@x = 'Basisdaten'"
        OH_EX
        OH_A "lstTankAct", "@f = '" & dx & "'", Me
        OH_A "lstTank", "@f = '" & Format(dx, "yyyymmdd") & "', @a = " & Me!ogTank & ", @z = " & lgFrigutec, Me '<EC>
        If strT = "" Then
            strT = Me!lstTank.column(0, 1)
            Me!lstTank = strT
            lstTank_AfterUpdate
        End If
    Case 1
        s = "Bitte das gewünschte Datum eingeben"
NochmalDatum:
        s = InputBox(s, t, dx)
        If s = "" Then
            GoTo ErrEnd
        End If
        dx = CDate(s)
        i = Abs(DateDiff("d", dx, Date))
        If i > 365 Then
            s = s & vbNewLine & "Dies ist kein gültiges Datum, " & vbNewLine & _
                                "bitte korrigieren!"
            GoTo NochmalDatum
        End If
        Me!lstTankAct = 0
        lstTankAct_AfterUpdate
    Case 10
        lgid = Nz(Me!lstVerlauf.column(1), 0)
        If lgid > 0 Then
            OH_OF "F_VG", lgid
        End If
    Case 99
        DoCmd.Close acForm, Me.Name
    Case 100
        s = "Die Tankstatistik wird aktualisiert." & vbNewLine & _
            "Pro Projekt werden in EINEM EXCEL-File Sheets erzeugt, die nach dem D2-Datum sortiert sind." & vbNewLine & _
            "Das Excel-File wird geöffnet" & vbNewLine & vbNewLine & _
            "Lieber User: Bitte etwas Geduld (hole Dir einen Kaffee und trinke diesen genüsslich; dann sollte ich fertig sein!)" & vbNewLine & vbNewLine & _
            "links unten sehen Sie eine laufende Anzeige."
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
            GoTo ErrEnd
        End If
        s = "Ablage EXCEL Tanklager-Planung"
        OH_A "lstTankAct", _
            " @a = 101" & _
            ",@f = '" & s & "'", Me
        OH_r r
        If r.BOF Then
            s = "Im Lexikon fehlt der Eintrag " & s
            GoTo ErrM
        End If
        strP = r!Planungsfile
        If Len(Dir(strP)) = 0 Then
            s = "im Lexikon " & s & vbNewLine & _
                strf & " nicht zu finden"
            GoTo ErrM
        End If
        strf = OH_GetPathPart(strP)
        strf = strf & Format(Date, "yyyymmdd") & ".xlsx"
        OH_KILL strf
        OH_InitializeEXCEL
        appEXCEL.Visible = True
        appEXCEL.Application.ScreenUpdating = True
        If OH_FileInUse(strP) Then
            strP = Dir(strP)
            Set xlwrkP = appEXCEL.Workbooks(strP)
        Else
            Set xlwrkP = appEXCEL.Workbooks.Open(strP)
        End If
        Set xlwrk = appEXCEL.Workbooks.Add
        Set wp = xlwrkP.Sheets(1)
        s = "Projektnummer"
        If wp.cells(3, 1) <> s Then
            s = "In A3 wird " & s & "erwartet"
            GoTo ErrM
        End If
        iCol = 5 '250903 Input Alex 2 weitere Spalten in EXCEL, vorher icol = 3
        N = 0
        strProject = wp.cells(3, iCol)
        While Val(strProject) > 0
            wp.Activate
            wp.Select
            wp.cells(3, iCol).Select
            DoCmd.Hourglass True
            N = N + 1
            For i = 1 To 2
                Select Case i
                Case 1
                    s = "Einkauf"
                Case 2
                    s = "Verkauf"
                End Select
                strSQL = "Exec dbo.spI_Statistik " & _
                           "@x = 'lstStatistikAct'" & _
                            ",@a = 55 " & _
                            ",@b = " & strProject & _
                            ",@s1 = '" & s & "'"
                SysCmd acSysCmdSetStatus, N & "  Berechne " & s & " " & strProject
                OH_EX
            Next i
            strSQL = "Exec dbo.spI_Statistik " & _
                       "@x = 'lstStatistikAct'" & _
                        ",@a = 20 " & _
                        ",@b = " & strProject & _
                        ",@s1 = 'Einkauf'"
            If xlwrk.Sheets.count < N Then
                Set ws = xlwrk.Sheets.Add(After:=xlwrk.Sheets(xlwrk.Sheets.count))
            Else
                Set ws = xlwrk.Sheets(N)
            End If
            ws.Name = strProject
            ws.Activate
            ws.Select
            ws.cells(1, 1).Select
            SysCmd acSysCmdSetStatus, N & "  Berechne EXCEL " & strProject
            OH_r rx, strSQL
            If rx.BOF = False Then '<R96>
                rx.MoveFirst
                i = rx.Fields.count
                For iCols = 0 To i - 1
                    ws.cells(1, iCols + 1).Value = rx.Fields(iCols).Name
                    Select Case rx.Fields(iCols).Name
                    Case "Menge"
                        ws.Columns(iCols + 1).NumberFormat = "#,##0.00"
                    End Select
                Next
                ws.Range(ws.cells(1, 1), ws.cells(1, i)).Font.Bold = True
                DoEvents
                ws.Select
                ws.Range("a2").Select
                ws.Range("a2").CopyFromRecordset rx
                ws.Select
                ws.cells.Select
                With appEXCEL.Selection
                    .HorizontalAlignment = xlGeneral
                    .VerticalAlignment = xlTop
                End With
                ws.Rows("1:1").Select
                appEXCEL.Selection.AutoFilter
                ws.cells.EntireColumn.AutoFit
                '  xlTab.Cells.EntireRow.AutoFit
                ws.cells.EntireRow.RowHeight = 15
                With appEXCEL.ActiveWindow
                    .SplitColumn = 0
                    .SplitRow = 1
                End With
                appEXCEL.ActiveWindow.FreezePanes = True
                With appEXCEL.Selection.Interior
                    .Pattern = xlSolid
                    .PatternColorIndex = xlAutomatic
                    .Color = 65535
                    .TintAndShade = 0
                    .PatternTintAndShade = 0
                End With
            End If
            ws.Range("a1").Select
            iCol = iCol + 1
            strProject = wp.cells(3, iCol)
        Wend
        xlwrk.SaveAs Filename:=strf, FileFormat:=51 '=xlsx
        Form_Open (0)
        ws.Activate
        xlwrk.Sheets(1).Select
        SysCmd acSysCmdSetStatus, "Fertig mit Aktualisierung!"
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 13
        s = "Bitte ein gültiges Datum eingeben"
        Resume NochmalDatum
    Case Else
        s = Err.number & " " & Err.Description
    End Select
    t = "lstTankAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstTank_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetT lgStart
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "lstTank_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstVerlauf_Afterupdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!lstVerlauf.column(1), 0)
    If lgid > 0 Then
        lgStart = CLng(CDate(Me!lstVerlauf.column(2))) - 3
        OH_SetT lgStart
        Me!t04.ForeColor = vbBlue
        Me!t04.FontWeight = 700
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "lstVerlauf_Afterupdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub m101_Click()
    OH_TankInfo "m101"
End Sub
Private Sub m102_Click()
    OH_TankInfo "m102"
End Sub
Private Sub m103_Click()
    OH_TankInfo "m103"
End Sub
Private Sub m104_Click()
    OH_TankInfo "m104"
End Sub
Private Sub m105_Click()
    OH_TankInfo "m105"
End Sub
Private Sub m106_Click()
    OH_TankInfo "m106"
End Sub
Private Sub m107_Click()
    OH_TankInfo "m107"
End Sub
Private Sub m108_Click()
    OH_TankInfo "m108"
End Sub
Private Sub m109_Click()
    OH_TankInfo "m109"
End Sub
Private Sub m110_Click()
    OH_TankInfo "m110"
End Sub
Private Sub m111_Click()
    OH_TankInfo "m111"
End Sub
Private Sub m112_Click()
    OH_TankInfo "m112"
End Sub
Private Sub m113_Click()
    OH_TankInfo "m113"
End Sub
Private Sub m114_Click()
    OH_TankInfo "m114"
End Sub
Private Sub m201_Click()
    OH_TankInfo "m201"
End Sub
Private Sub m202_Click()
    OH_TankInfo "m202"
End Sub
Private Sub m203_Click()
    OH_TankInfo "m203"
End Sub
Private Sub m204_Click()
    OH_TankInfo "m204"
End Sub
Private Sub m205_Click()
    OH_TankInfo "m205"
End Sub
Private Sub m206_Click()
    OH_TankInfo "m206"
End Sub
Private Sub m207_Click()
    OH_TankInfo "m207"
End Sub
Private Sub m208_Click()
    OH_TankInfo "m208"
End Sub
Private Sub m209_Click()
    OH_TankInfo "m209"
End Sub
Private Sub m210_Click()
    OH_TankInfo "m210"
End Sub
Private Sub m211_Click()
    OH_TankInfo "m211"
End Sub
Private Sub m212_Click()
    OH_TankInfo "m212"
End Sub
Private Sub m213_Click()
    OH_TankInfo "m213"
End Sub
Private Sub m214_Click()
    OH_TankInfo "m214"
End Sub
Private Sub m301_Click()
    OH_TankInfo "m301"
End Sub
Private Sub m302_Click()
    OH_TankInfo "m302"
End Sub
Private Sub m303_Click()
    OH_TankInfo "m303"
End Sub
Private Sub m304_Click()
    OH_TankInfo "m304"
End Sub
Private Sub m305_Click()
    OH_TankInfo "m305"
End Sub
Private Sub m306_Click()
    OH_TankInfo "m306"
End Sub
Private Sub m307_Click()
    OH_TankInfo "m307"
End Sub
Private Sub m308_Click()
    OH_TankInfo "m308"
End Sub
Private Sub m309_Click()
    OH_TankInfo "m309"
End Sub
Private Sub m310_Click()
    OH_TankInfo "m310"
End Sub
Private Sub m311_Click()
    OH_TankInfo "m311"
End Sub
Private Sub m312_Click()
    OH_TankInfo "m312"
End Sub
Private Sub m313_Click()
    OH_TankInfo "m313"
End Sub
Private Sub m314_Click()
    OH_TankInfo "m314"
End Sub
Private Function OH_TankInfo(strM As String)
    Dim strOption As String
    s = Me(strM).Tag
    If Me!ogTank = 1 Then
        strOption = "Tankinhalt"
    Else
        strOption = "Produktübersicht"
    End If
    t = strOption & " " & Me!lstTank.column(0)
    MsgBox s, , t
End Function
Private Function OH_TankUser(Optional strT As String = "") As String
On Error GoTo ErrMsg
    OH_A "@x = 'TankUser'" & _
        ", @i = " & lguser & _
         ",@f = '" & strT & "',@a = " & Me!ogTank, , Me
    If strT <> "" Then
        OH_EX
    Else
        OH_r r
        If Me!ogTank = 1 Then
            OH_TankUser = r!tanknr
        Else
            OH_TankUser = r!Artikel
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "OH_TankUser"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub oFrigutec_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    lstTankAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "oFrigutec_BeforeUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub ogTank_AfterUpdate()
On Error GoTo ErrMsg
    Me!lstTankAct = 0
    strT = ""
    If Me!ogTank = 2 Then
        Me!oFrigutec.Visible = True
        Me!lbloFrigutec.Visible = True
        lgFrigutec = Me!oFrigutec.Visible
        Me.oFrigutec.Value = False
    Else
        Me!oFrigutec.Visible = False
        Me!lbloFrigutec.Visible = False
    End If
    lstTankAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "OH_TankUser"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
