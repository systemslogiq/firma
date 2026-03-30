Attribute VB_Name = "mdlTlb"
Option Compare Database
Option Explicit
Public Function OH_ActivateTab(strTab As String)
    If Not objRibbon Is Nothing Then
        objRibbon.ActivateTab strTab
    End If
End Function

Public Function OH_Adresse()  'Toolbar setzen für Adressen
On Error GoTo ErrMsg
    OH_OF "F_Adresse", 0
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.OH_Adresse"
    End Select
    Resume ErrEnd
End Function
Public Function OH_VG()  'Toolbar setzen für Vorgänge
On Error GoTo ErrMsg
    OH_OF "F_VG"
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.F_VG"
    End Select
    Resume ErrEnd
End Function
Public Function OH_Leistung()  'Toolbar setzen für Vorgänge
On Error GoTo ErrMsg
    OH_OF "F_Leistung"
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.F_VG"
    End Select
    Resume ErrEnd
End Function
Public Function OH_Artikel()
On Error GoTo ErrMsg
    OH_OF "F_Artikel"
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.OH_Artikel"
    End Select
    Resume ErrEnd
End Function
Public Function OH_tlbMarker()
On Error GoTo ErrMsg
    Dim frmM As Form
    Dim strBM As String
    'setzt für die markierten Datensätze
    'in einem Formular oder Listenfeld den "Marker" ==>User-Eintrag in MArker-Feld
    Dim lgM As Long
    Dim strID As String
    VarAntw = "noForm_Current"
    Set frmM = OH_tlbStartForm
    lgM = frmM!f0
    strID = frmM!f0.ControlSource
    Select Case left(strID, 2)
    Case "nr", "ID" 'OH071228
    Case Else
        SysCmd acSysCmdSetStatus, "Kein Marker vorhanden!"
        GoTo ErrEnd
    End Select
    strBM = strID & " = " & lgM
    i = frmM.SelHeight
    If i < 1 Then
        strSQL = "spI_Marker " & Mid(strID, 3) & ",'" & lgM & "'"
        OH_EX
    Else
        OH_r r, frmM.RecordSource
        If frmM.FilterOn = True Then
            r.Filter = OH_replaceFilter(frmM.Filter, frmM.Name)
        End If
       ' Move to the first record in the recordset.
        r.MoveFirst
       ' Move to the first selected record.
        r.Move frmM.SelTop - 1
       ' Mark selected records presenting the first field (=ID)
        For i = 1 To frmM.SelHeight
            lgM = r(strID).Value
            OH_EX ("spI_Marker " & Mid(strID, 3) & ",'" & lgM & "'")
         r.MoveNext
        Next i
       OH_ResetRS r
    End If
    OH_RQf frmM
    OH_RQ frmM!lstM
    frmM!lstM.SetFocus
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2474
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_tlbMarker"
    End Select
    Resume ErrEnd
End Function
Public Function OH_BackForward(lgB As Long, _
                               Optional lgid As Long = 0) As Boolean
On Error GoTo ErrMsg
    Dim strf As String
    Dim strST As String
    Dim lg0 As Long
    Dim lg1 As Long
    t = "Verlauf "
    If lgB = 0 Then
        t = t & "zurück"
    Else
        t = t & "vorwärts"
    End If
    strSQL = "Exec dbo.spi_Verlauf " & _
                    "  @x = 'BackForward'" & _
                    ", @u = " & lguser & _
                    ", @i = " & lgid & _
                    ", @b= " & lgB
    OH_r r
    If Not r.BOF Then
        lg1 = r!lg1
        lg0 = r!lg0
        OH_BackForward = True
        strf = Trim(r!frmName)
        lgid = r!ID
        OH_OF strf, lgid, 3
        SysCmd acSysCmdSetStatus, "Weitere Verläufe: " & lg0 & " vorwärts    " & lg1 & " zurück"
    End If
    OH_ResetRS r
    OH_ResetRS rs
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "mdlTlb.OH_BackForward"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
End Function
Public Function OH_tlbVerlauf()
On Error GoTo ErrMsg
    Dim frmP As Form
    Dim strhelp
    Dim vararray As Variant
    Dim lgReportNr As Long
    Dim lgAntw As Long
    Dim strA(1 To 2) As String
    strA(1) = "gehe zu markiertem Formular"
    strA(2) = "Verlauf leeren"
    vararray = Array(strA(1), strA(2))
    t = "Verlaufsanzeige"
    strhelp = "Ihre letzten (max. 20) besuchten Formulare, Datensätze" & vbNewLine & _
              "Mit Doppel-Klick anzeigen lassen!"
    strSQL = "Exec dbo.spi_Verlauf 'VerlaufAnzeige', " & lguser
    OH_r r
    If r.BOF = True Then
        MsgBox "Für Sie ist kein Verlauf vorhanden!", vbExclamation, "Ihr Administrator"
        Exit Function
    End If
    '=============
    OH_msgbox s, vararray, vbQuestion, t, strhelp, , , strSQL, 4, "0;10;80"
    '============
    lgAntw = Val(strMSG(1))
    Select Case strMSG(2)
    Case strA(1)
        OH_BackForward 5, Val(strMSG(3))
    Case strA(2)
        strSQL = "Exec dbo.spi_Verlauf 'deleteVerlauf', " & lguser
        OH_EX
    End Select

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 6
        'MsgBox "Verlauf wurde zwischenzeitlich gelöscht!", vbExclamation, "Vorwärts"
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.OH_tlbVerlauf"
    End Select
    Resume ErrEnd
End Function
Public Function OH_deleteLst() 'lösche den in einer Liste definierten Datensatz
On Error GoTo ErrMsg
    Set ctl = Screen.ActiveControl
    Set frm = Screen.ActiveForm
    If left(ctl.Name, 3) = "lst" Then
        If OH_Delete("Lösche markierte Zeile in " & ctl.Name & vbNewLine & _
                    ctl.ControlTipText, _
                     "Lösche Markierte Daten in Listenfeld") = True Then
            GoTo ErrEnd
        End If
        Select Case ctl.Name
        Case "lstStichwort"
            OH_EX "spA_Stichwort" & _
                " @id = " & ctl.Value & _
                ",@st = 14"
        Case "lstVG"
            OH_EX "spI_Delete 'T_VG',''," & ctl.Value
            OH_RQ frm!lstDet
        Case "lstLeistung"
            OH_EX "spI_Delete 'T_Leistung',''," & ctl.Value
            OH_RQ ctl
        Case Else
            MsgBox "noch nicht aktiviert", , "Philipp"
        End Select
        OH_RQ ctl
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdlTlb.F_VG"
    End Select
    Resume ErrEnd
End Function
Sub PrintPreviewClose(control As IRibbonControl)
On Error GoTo ErrMsg
    t = db.Properties("AppTitle")
    If Application.CurrentObjectType = acForm Then
        If Screen.ActiveForm.Name = "menu" Then
            If MsgBox("Möchten Sie " & t & " jetzt schliessen?", _
                vbOKCancel + vbDefaultButton2 + vbQuestion, _
                "Menu schliessen = " & t & " verlassen") = vbCancel Then
                Exit Sub
            Else
                DoCmd.Close acForm, "Menu"
                Application.Quit
            End If
        End If
    End If
    DoCmd.Close
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2475 'Report
        DoCmd.Close
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "PrintPreviewClose"
        Resume ErrEnd
    End Select
End Sub
Sub cmdTabelle(control As IRibbonControl)
On Error GoTo ErrMsg
    OH_Tabelle control.ID
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "cmdTabelle"
        Resume ErrEnd
    End Select
End Sub
Public Function OH_Tabelle(Optional strT As String)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strFi As String
    Dim strA As String
    Dim frmT As Form
    Set frmT = Screen.ActiveForm
    strf = frmT.Name
    Select Case strf
    Case "menu"
        OH_OF "F_Adresse"
        OH_PF_Tab "F_Adresse"
    Case "PF_TAB"
        If frmT.Filter <> "" And frmT.FilterOn = True Then
            strFi = frmT.Filter
            strFi = OH_replaceFilter(strFi, "[qdfTAB]") '--<R20>
            strSQL = db.QueryDefs("QDFTAB").SQL & " , @f = '" & strFi & "'"
            OH_EX
        End If
        Set frmT = Forms(frmT.Tag)
        DoCmd.openForm frmT.Name
        strf = frmT.Tag
        Select Case strf
        Case "Funktion"
            strf = "Adresse"
        End Select
        If strFi <> "" Then
            OH_OF "F_VG", 0, 10
        Else
            strFi = "Kein Filter gesetzt!    "
        End If
        strFi = Replace(Replace(strFi, "[", ""), "]", "")
        SysCmd acSysCmdSetStatus, frmT.Tag & " letzter Tabellenfilter: " & strFi
    Case Else
        OH_PF_Tab strf
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2501
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "cmdTabelle"
        Resume ErrEnd
    End Select
End Function
