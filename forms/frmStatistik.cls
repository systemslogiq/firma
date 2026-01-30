Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim strS As String
Private Sub Form_Load()
On Error GoTo ErrMsg
    Me!lstQk.ColumnWidths = "0cm;1.5cm;2cm;2cm;0.5cm"
    OH_A "comArt", , Me
    OH_A "lstMandant", , Me
    OH_A "lstQKChart", , Me
    OH_A "@x = 'Curr'", , Me
    OH_r r
    Me!DBWährung.Caption = r!curr
    OH_A "JB", , Me
    OH_A "JV", , Me
    Me!JV = Me!JV.column(0, 0)
    Me!JB = Year(Date)
    Me!lstQKChart = 51
    lstQKChart_AfterUpdate
    Me.Caption = "etwas Statistik"
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikForm_Load"
    Resume Next
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikForm_Activate"
    Resume ErrEnd
End Sub
Private Sub lstQKChart_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    lstQKChart_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistiklstQKChart_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_Error(DataErr As Integer, Response As Integer)
On Error GoTo ErrMsg
   Select Case DataErr
    Case 2260
        Response = acDataErrContinue
    Case Else
        MsgBox DataErr
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikForm_Error"
    Resume ErrEnd
End Sub
Private Sub lstMandant_AfterUpdate()
On Error GoTo ErrMsg
    lstQKChart_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "lstMandant_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub JB_AfterUpdate()
On Error GoTo ErrMsg
    lstQKChart_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikJB_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub JV_AfterUpdate()
On Error GoTo ErrMsg
    JB_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikJV_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comart_AfterUpdate()
On Error GoTo ErrMsg
    JB_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistikcomart_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstQk_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Me!lstQk
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistiklstQk_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstQKFirma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!lstQKFirma, 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "lstQKFirma_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstQKProjekt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Me!lstQKProjekt
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistiklstQKProjekt_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstQKChart_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgMandant As Long
    Dim lgQK As Long
    Dim strL As String
    Dim dblTot As Double
    Dim varStart As Variant
    Dim varEnd As Variant
    Dim countMonth As Integer
    Dim countQK As Integer
    Dim N As Long
    Dim lgV As Long
    Dim lgB As Long
    Dim wrk As Workbook
    Dim ws As Worksheet
    Dim chtChart As Chart

    DoCmd.Hourglass True
    lgV = Val(Nz(Me!JV, Year(Date)))
    lgB = Val(Nz(Me!JB, Year(Date)))
    lgQK = Me!lstQKChart
    lgMandant = Val(Nz(Me!lstMandant, 0))
    Select Case lgQK
    Case Is < 1000
        Me!lstQKChart.Tag = Me!lstQKChart.column(1)
        For i = 1 To 9
            Select Case i
            Case 1
                strL = "lstQK"
            Case 2
                strL = "lstQKMonat"
            Case 3
                strL = "lstQKJahr"
            Case 4
                strL = "lstQKFirma"
            Case 5
                strL = "lstQKProjekt"
            Case 6
                strL = "lstQKTotal"
            Case 7
                strL = "QKTotal"
            Case 8
                strL = "lstQKChart"
            Case 9
                strL = "comArt"
            End Select
            OH_A " @x = '" & strL & "'," & _
                " @i =  " & lgQK & _
                ", @a = " & lgV & _
                ", @m = " & lgMandant & _
                ", @q = " & lgB, , Me
            If i = 7 Then
                OH_r r
                If r.BOF Then
                Else
                    varStart = r!mind
                    varEnd = r!maxd
                    countQK = Nz(r!countQK, 0)
                    dblTot = Nz(r!sumqk, 0)
                    countMonth = Nz(r!countMonth, 0)
                End If
                If countQK > 0 And countMonth > 0 Then
                    Me!AverageMonth = countMonth & " Monate ø " & Format(dblTot / countMonth, "#'##0")
                    Me!AverageQK = "Anzahl: " & countQK & "   ø " & Format(dblTot / countQK, "#'##0")
                    Me!AverageYear = Format(countMonth / 12, "0.0") & " J. ø " & Format(dblTot / countMonth * 12, "#'##0")
                    Me!CountFirma = Me!lstQKFirma.ListCount & " Firmen"
                Else
                    Me!AverageMonth = ""
                    Me!AverageQK = ""
                    Me!AverageYear = ""
                    Me!CountFirma = ""
                End If
            Else
                OH_A strL, strSQL, Me
            End If
        Next i
        Me!CountVG = Me!lstQKProjekt.ListCount & " Projekte"
    Case Is > 1000
        Select Case lgQK
        Case 2000
            strL = Me!lstQKChart.Tag
        Case Else
            strL = Trim(Me!lstQKChart.column(1))
        End Select
        OH_A "@x = 'Chart'" & _
            ", @i = " & lgV & _
            ", @a = " & lgB & _
            ", @n = " & Me!lstQKChart & _
            ", @q = " & Val(Me!lstQKChart.Tag) & _
            ", @f = '" & OH_RPL(Me!comArt) & "'", , Me
        Set wrk = OH_EXCEL(strSQL, strL)
        If wrk Is Nothing Then
            GoTo ErrEnd
        End If
        Set ws = wrk.Sheets(1)
        ws.Range("e2").Select
        'Create a new chart.
        Set chtChart = wrk.Charts.Add
        With chtChart
           .HasTitle = True
            .Name = "Chart " & strL
            '.ChartTitle.Text = strL
            Select Case lgQK
            Case 2000, 5000
                .ChartType = xlColumnClustered
            Case Else
                .ChartType = xlLineMarkers
            End Select
           'Link to the source data range.
            i = ws.UsedRange.Rows.count
            N = ws.UsedRange.Columns.count
            .SetSourceData Source:=ws.UsedRange
            .Axes(xlValue).TickLabels.NumberFormat = "#.##0"
            Select Case lgQK
            Case Is <> 5000
                .Axes(xlCategory, xlPrimary).HasTitle = True
                .Axes(xlCategory, xlPrimary).AxisTitle.Characters.Text = Me!comArt
                .Axes(xlValue, xlPrimary).HasTitle = True
                .Axes(xlValue, xlPrimary).AxisTitle.Characters.Text = "Betrag in Kilo"
            End Select
            Select Case lgQK
            Case 6000
                .SeriesCollection(1).Delete
                With .SeriesCollection(3).Format.Line
                    .Visible = msoTrue
                    .ForeColor.ObjectThemeColor = msoThemeColorAccent1
                    .ForeColor.TintAndShade = 0
                    .ForeColor.Brightness = 0
                    .ForeColor.RGB = RGB(0, 176, 80)
                    .Transparency = 0
                    .Weight = 5
                End With
                With .SeriesCollection(3)
                    .MarkerStyle = 2
                    .MarkerSize = 6
                End With
            Case 3000
                .Axes(xlValue, xlPrimary).AxisTitle.Characters.Text = "verrechenbare Stunden"
            End Select
        End With
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "frmStatistiklstQKChart_AfterUpdate"
    Resume ErrEnd
End Sub
