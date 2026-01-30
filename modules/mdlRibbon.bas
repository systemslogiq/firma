Attribute VB_Name = "mdlRibbon"
Option Compare Database
Option Explicit
Public objRibbon As IRibbonUI
Public strEditBox As String
Sub OnLoad(ribbon As IRibbonUI)
    'beim Laden wird ein Verweis auf das Ribbon gesetzt,
    'um es später wieder verwenden zu könnnen
    Set objRibbon = ribbon
    objRibbon.ActivateTab "tabMain"
End Sub
Function OH_LoadRibbons()
On Error GoTo ErrMsg
    Dim strV As String
    Dim strP As String
    Dim prn As Printer
    strV = SysCmd(acSysCmdAccessVer)
    i = 0
    For Each prn In Application.Printers
        strP = strP & " <button id= ""prn" & i & """"
        strP = strP & " label =""" & prn.DeviceName & """"
        strP = strP & " onAction=""OH_RibbonAction"" />"
        i = i + 1
    Next prn
    strSQL = "Exec dbo.spa_Menu " & _
            " @x='Ribbon'," & _
            " @f = '" & strV & "'," & _
            " @d = '" & strP & "'"
    OH_r r
    While Not r.EOF
        Application.LoadCustomUI r!RibbonName, r!r1 & " " & r!r2 & " " & r!r3 'OH 190105
    r.MoveNext
    Wend
    OH_ResetRS r
    OH_CreateCBEmpty
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 32609, 32610
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_LoadRibbons"
        Resume ErrEnd
    End Select
End Function
Sub OH_RibbonAction(control As IRibbonControl)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strA As String
    Dim lgid As Long
    t = control.ID
    Select Case control.ID
    Case "GotonewRecord"
        OH_New
    Case "Copy"
        OH_Copy
    Case "Delete"
        OH_DeleteRS Screen.ActiveForm, 0
    Case "FilePrintPreview"
        If Application.CurrentObjectType = acForm Then
            OH_tlbPrint
        Else
            DoCmd.OpenReport Screen.ActiveReport.Name, acViewNormal
        End If
    Case "Help"
        OH_HelpMsgBox Screen.ActiveForm
    Case "PrintPreviewClose"
        If Application.CurrentObjectType = acForm Then
            If Screen.ActiveForm.Name = "menu" Then
                If MsgBox("Möchten Sie  FIRMA jetzt schliessen?", _
                    vbOKCancel + vbDefaultButton2 + vbQuestion, _
                    "Menu schliessen = Firma verlassen") = vbCancel Then
                    GoTo ErrEnd
                Else
                    DoCmd.Close acForm, "Menu"
                    Application.Quit
                End If
            End If
            DoCmd.Close
        Else
            DoCmd.Close acReport, Screen.ActiveReport.Name
        End If
    Case "OH_back"
        OH_BackForward 0
    Case "OH_Forward"
        OH_BackForward 1
    Case "OH_tlbVerlauf"
        OH_tlbVerlauf
    Case "SpellingAccess"    ' <R22>
        t = "Rechtschreibprüfung"
        Set ctl = Screen.ActiveControl
        Select Case ctl.ControlType
            Case acTextBox
                If IsNull(Len(ctl.Text)) Or Len(ctl.Text) = 0 Then
                    s = "enthält keinen Text!"
                    GoTo ErrM
                End If
                With ctl
                    .SetFocus
                    .SelStart = 0
                    .SelLength = Len(ctl.Text)
                End With
                DoCmd.SetWarnings False
                DoCmd.RunCommand acCmdSpelling
                DoCmd.SetWarnings True
            Case Else
                s = "Rechtschreibprüfung funktioniert nur für Textfelder"
                GoTo ErrM
        End Select
    Case "lastcall"
        OH_lastcall
    Case "VGAbschluss"
        If Application.CurrentObjectType = acForm Then
            Set f = Screen.ActiveForm
            If f.Name = "F_VG" Or f.Caption = "Vorgänge in Tabellenform" Then
                lgid = Nz(f!NrVG, 0)
                strSQL = "spa_VG " & _
                        " @x = '" & control.ID & "'," & _
                        " @i = " & lgid
                OH_EX
                OH_RQf Forms!F_VG
                If f.Name <> "F_VG" Then
                    f.RecordSource = "qdfTab"
                    OH_FB f, "NrVG = " & lgid
                End If
            End If
        End If
    Case "PrintDialog"
        If Application.CurrentObjectType = acForm Then
            OH_tlbPrint
        Else
            DoCmd.RunCommand acCmdPrint
        End If
    Case "PreviewEmail", "PreviewB2B", "PreviewBrief"
        Select Case Application.CurrentObjectName
        Case glstrB_VG
            lgid = f!NrVG '171017 bereits hier in Variable, da bei Statusversendet bereits ein anderer Vorgang angeclickt sein kann (Jörn)
            Select Case control.ID
            Case "PreviewEmail"
                '170208 als versendet eintragen 190526 <R61>
                strSQL = "Exec spa_VG " & _
                    " @x = 'Statusversendet'" & _
                    ",@i = " & lgid
                OH_r r
                SysCmd acSysCmdSetStatus, r!Msg
                strSQL = "Exec spa_VG " & _
                        "@x = 'comprint' " & _
                        ",@f = 'Email mit Standard-Signatur'"
                OH_r r
                f!comPrint = r!NrFilter
                f.comPrint_AfterUpdate
                If control.ID = "PreviewEmail" And glDMS <> "" And f!NrQK = 37 Then
                    If MsgBox("Letztes Mail in DMS speichern!", vbOKCancel + vbQuestion, t) = vbCancel Then
                        OH_RQf f
                        GoTo ErrEnd
                    End If
                    f.lstExplorerAct = 12
                Else
                    f.lstExplorerAct = 9
                End If
                f.lstExplorerAct_AfterUpdate
                OH_RQf f
            Case "PreviewB2B"
                If OH_B2B(f!NrVG) Then
                    GoTo ErrEnd
                End If
            Case Else
                DoCmd.OutputTo acReport, glstrB_VG
            End Select
            Select Case f!NrQK
            Case 51
                OH_CheckRechnungsVersand lgid  'besondere Versandanschrift?
                OH_CheckGelangensbestätigung lgid '<R206>
            End Select
            OH_ResetRS r
        Case "F_VG"
            Set f = Forms!F_VG
            If OH_closeObj(glstrB_VG, acReport) Then
                GoTo ErrEnd
            End If
            VarAntw = Replace(control.ID, "Preview", "")
            i = OH_PrintReport(f, 1, glstrB_VG)
            If i = 0 Then
                GoTo ErrEnd
            End If
            DoCmd.RunCommand gllgSizePreview
             OH_closeObj "rptAnalysenZertifikat", acReport
        Case "F_Adresse"
            With Forms!F_Adresse
                .RegMain = 1
                .btnStartEmail_Click
            End With
        Case Else
            DoCmd.openForm "F_VG"
        End Select
    Case "PDFOutlook"
        If OH_isloaded("F_VG") = False Then
            s = "Vorgänge starten, um den aktuell angezeigten Vorgang als PDF ins Outlook zu senden?"
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
                DoCmd.openForm "F_VG"
            End If
            GoTo ErrEnd
        End If
        Set f = Forms!F_VG
        OH_PDFOutlook f!NrVG
    Case "ReformatXml"
        OH_eRechnung_DisplayXML
    Case "Startoptionen"
        s = "Access-Startoptionen freigeben! (Wirksam nach Neustart)"
        i = MsgBox(s, vbYesNoCancel + vbQuestion + vbDefaultButton2, t)
        Select Case i
        Case vbYes
            OH_Shift_Start True
            DoCmd.SelectObject acTable, , True
        Case vbNo
            OH_Shift_Start False
            DoCmd.NavigateTo "acNavigationCategoryObjectType"
            DoCmd.RunCommand acCmdWindowHide
        End Select
    Case Else
        If left(control.ID, 3) = "prn" Then
            If Application.CurrentObjectType = acForm Then
                OH_tlbPrint
            Else
                OH_setPrinter Screen.ActiveReport, 0, right(control.ID, 1)
                DoCmd.OpenReport Screen.ActiveReport.Name, acViewNormal
            End If
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        Resume ErrEnd
    Case Else
        s = Err & " " & Err.Description
        t = "OH_RibbonAction(control As IRibbonControl)"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Sub openForm(control As IRibbonControl)
On Error GoTo ErrMsg
    OH_closeObj "PF_Stichwort"
    Select Case control.ID
    Case "Menu"
        VarAntw = "UPDATE"
        DoCmd.Close acForm, "Menu"
        AutoExec
        VarAntw = ""
        SysCmd acSysCmdSetStatus, "Menu wurde kurz geschlossen und mit AUTOEXEC wieder geöffnet um " & Now()
        GoTo ErrEnd
    Case "PF_Filter"
        OH_OpenPF_Filter
        GoTo ErrEnd
    Case "Translation"
        OH_GoogleTranslation
        GoTo ErrEnd
    Case "EC" '231023 Button EC
        OH_OF "frmProjekt"
        Forms!frmProjekt!lstProjektAct = 11
        Forms!frmProjekt.lstProjektAct_AfterUpdate
        GoTo ErrEnd
    End Select
    OH_OF control.ID
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "openForm(control As IRibbonControl)"
        Resume ErrEnd
    End Select
End Sub
Public Function OH_OpenPF_Filter()
    If Screen.ActiveForm.Name = "menu" Then
        OH_OF "F_Adresse"
    End If
    DoCmd.openForm "PF_Filter", , , , , , Screen.ActiveForm.Name
End Function
Sub Ribbonexplorer(control As IRibbonControl)
On Error GoTo ErrMsg
    Select Case control.ID
    Case "cmdExplorer"
        Select Case Screen.ActiveForm.Name
        Case "F_Q"
            Forms!F_Q.OH_explorerQM
        Case Else
            OH_explorer
        End Select
    Case "cmdOutlook"
        OH_Outlook
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Ribbonexplorer"
        Resume ErrEnd
    End Select
End Sub
Sub tlbFilterField(control As IRibbonControl)
    OH_tlbFilterField
End Sub
Sub DataRefreshAll(control As IRibbonControl)
On Error GoTo ErrMsg
    Dim lgid As Long
    Set frm = Screen.ActiveForm
    Select Case frm.Name
    Case "Menu"
        frm.OH_Suche
    Case Else
        lgid = frm!f0
        frm.txtFind_AfterUpdate
        If lgid > 0 Then
            OH_OF frm.Name, lgid
            OH_setLst frm!lstDet, lgid
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2475 'Report
        DoCmd.Close
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "DataRefreshAll"
        Resume ErrEnd
    End Select
End Sub
Sub RibbonMarker(control As IRibbonControl)
On Error GoTo ErrMsg
    If Screen.ActiveForm.Name = "menu" Then
        OH_OF "F_Adresse"
    End If
    Set frm = Screen.ActiveForm
    Set ctl = frm!lstMdo
    ctl.SetFocus
    Set frm = Screen.ActiveForm
    If ctl <> 1 Then
        ctl = 1
    End If
    Select Case control.ID
    Case "cmdMarker"
        frm!lstM.Selected(1) = True
        frm.lstM_AfterUpdate
    Case "cmdMarkerSet"
        ctl = 1
        frm.lstMdo_AfterUpdate
    Case "cmdMarkerDelete"
        ctl = 6
        frm.lstMdo_AfterUpdate
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "RibbonMarker"
        Resume ErrEnd
    End Select
End Sub
'Sub EditBoxCallbackOnChange(control As IRibbonControl, _
'                              strText As String)
'On Error GoTo ErrMsg
'    Select Case control.ID
'        Case "EditBox"
'            strEditBox = strText
'            tlbOH_F strEditBox
'            'siehe OnLoad  EditBox soll wieder leer gemacht werden
'            objRibbon.InvalidateControl "EditBox"
'    End Select
'ErrEnd:
'    Exit Sub
'ErrMsg:
'    Select Case err.Number
'    Case Else
'        MsgBox err.Number & " " & err.Description, vbCritical, "EditBoxCallbackOnChange"
'    End Select
'    Resume ErrEnd
'End Sub
'Sub EditBoxCallbackgetText(control As IRibbonControl, _
'                             ByRef strText)
'    Select Case control.ID
'        Case "EditBox"
'            strText = ""
'    End Select
'End Sub
'Sub RibbonNew(control As IRibbonControl)
'    OH_New
'End Sub
'Sub Ribboncopy(control As IRibbonControl)
'    OH_Copy
'End Sub
Public Function OH_GoogleTranslation()
On Error GoTo ErrMsg
    Dim strE As String
    Dim strES As String
    Dim strL As String
    Dim strTr As String
    Dim strLanguage As String
    Dim strL2 As String
    DoCmd.Hourglass True
    Set frm = Screen.ActiveForm
    Select Case frm.Name
    Case "Menu"
        strL = OH_TranslateByGoogle("Beispiel", "DE", "EN")
        GoTo ErrEnd
    Case "F_Language"
        strLanguage = Nz(frm!Language, "")
    Case "F_Adresse"
        strLanguage = Nz(frm!comSprache, "")
    Case "F_VG"
        strLanguage = Nz(frm!VGSprache, "")
    End Select
    Select Case strLanguage
    Case "", "Deutsch"
        strLanguage = "englisch"
    End Select
    strL2 = left(strLanguage, 2)
    Set ctl = Screen.ActiveControl
    Select Case ctl.ControlType
    Case 109, 111
        strE = Application.PlainText(Nz(ctl.Value, "-"))
        strES = strE
        If ctl.SelLength > 0 Then
            strES = Trim(Nz(Mid(strES, ctl.SelStart + 1, ctl.SelLength), ""))
        End If
    End Select
    t = "Übersetze markierten Text in " & strLanguage
    strL = OH_TranslateByGoogle(strES, "DE", strL2)
    If strE <> "-" Then
        s = "Google-Vorschlag als  Übersetzung für:" & vbNewLine & _
            left(strES, 50)
        If Len(strES) > 50 Then
            s = s & "....."
        End If
        strTr = InputBox(s, t, strL)
        Select Case strTr
        Case "", strES
        Case Else
            Select Case frm.Name
            Case "F_Language"
                frm!l2 = Replace(ctl.Value, strES, strTr)
                frm.btnSave_Click
                GoTo ErrEnd
            Case Else
                ctl = Replace(ctl.Value, strES, strTr)
            End Select

            strSQL = "EXEC spa_Language " & _
                " @x = 'lstact' " & _
                ", @a = 11 " & _
                ", @f = '" & OH_RPL(strES) & _
                "', @s = '" & OH_RPL(strTr) & _
                "',@d = '" & strLanguage & "'"
            OH_r r
            s = "Übersetzungs-Eintrag in " & strLanguage
            If r!Ergebnis = 0 Then
                s = s & " schon vorhanden oder NICHT eingetragen"
            Else
                s = s & " soeben vorgenommen"
            End If
            SysCmd acSysCmdSetStatus, s & ": " & strTr
        End Select
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 2474
        s = "Bitte setzen Sie den Cursor in das zu übersetzende Feld!"
    Case Else
        s = Err & " " & Err.Description
    End Select
    t = "OH_GoogleTranslation"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_CreateCmb(ctl As control, Optional ctlSourceQ As control, Optional frm As Form)
On Error Resume Next
    Dim strCB As String
    Dim cmb As CommandBar
    Dim cmbBtn As CommandBarButton
    If frm Is Nothing Then
        Set frm = ctl.Parent
    End If
    strCB = "cb" & frm.Name
    CommandBars(strCB).Delete
    Set cmb = CommandBars.Add(strCB, msoBarPopup, False, False)
    With cmb
        If ctlSourceQ Is Nothing Then
            Set ctlSourceQ = frm!lstact
        End If
        strSQL = ctlSourceQ.Recordset.Source
        OH_r r
        While Not r.EOF
            Set cmbBtn = .Controls.Add(msoControlButton, , , , True)
            With cmbBtn
                .Caption = r(1)
                .OnAction = "=OH_fncOnActionBtn('" & r(0) & "," & ctlSourceQ.Name & "')"
                If InStr(.Caption, "zwischenablage") > 0 Then
                    .FaceId = 938
                End If
                If InStr(.Caption, "lösch") > 0 Or InStr(.Caption, "entfernen") > 0 Then
                    .FaceId = 478
                End If
                If InStr(.Caption, "hinzufügen") > 0 Or InStr(.Caption, "neu") Then
                    .FaceId = 539
                End If
                If InStr(.Caption, "kopier") > 0 Then
                    .FaceId = 19
                End If
                If InStr(.Caption, "such") > 0 Then
                    .FaceId = 25
                End If
                If InStr(.Caption, "anzeigen") > 0 Then
                    .FaceId = 941
                End If
                If InStr(.Caption, "einfügen") > 0 Then
                    .FaceId = 213
                End If
                If InStr(.Caption, "Import") > 0 Then
                    .FaceId = 296
                End If
                If InStr(.Caption, "export") > 0 Then
                    .FaceId = 296
                End If
                If InStr(.Caption, "ändern") > 0 Then
                    .FaceId = 162
                End If
                If InStr(.Caption, "nummerieren") > 0 Then
                    .FaceId = 11
                End If
                If InStr(.Caption, " oben") > 0 Then
                    .FaceId = 705
                End If
                If InStr(.Caption, " unten") > 0 Then
                    .FaceId = 706
                End If
                If InStr(.Caption, "drucken") > 0 Then
                    .FaceId = 4
                End If
                If InStr(.Caption, "excel") > 0 Then
                    .FaceId = 263
                End If
            End With
        r.MoveNext
        Wend
    End With
    ctl.ShortcutMenuBar = strCB
    Set cmb = Nothing
End Function
Public Function OH_fncOnActionBtn(strCB As String)
On Error Resume Next
    Dim lgcb As Long
    lgcb = Val(strCB)
    strCB = Trim(Mid(strCB, InStr(strCB, ",") + 1))
    Set frm = Screen.ActiveForm
    frm(strCB) = lgcb
    CallByName frm, strCB & "_Afterupdate", VbMethod
End Function
Public Function OH_fncOnActionBtnlst()
On Error Resume Next
    OH_HelpMsgBox Screen.ActiveForm
End Function
Public Function OH_CreateCBEmpty()
On Error Resume Next
    Dim strCB As String
    Dim cmb As CommandBar
    Dim cmbBtn As CommandBarButton
    strCB = "cbEmpty"
    CommandBars(strCB).Delete
    Set cmb = CommandBars.Add(strCB, msoBarPopup, False, False)
    With cmb
        Set cmbBtn = .Controls.Add(msoControlButton, , , , True)
        With cmbBtn
            .Caption = "Hilfe-Funktion öffnen"
            .FaceId = 124
            .OnAction = "OH_fncOnActionBtnlst"
        End With
    End With
    Set cmb = Nothing
End Function
