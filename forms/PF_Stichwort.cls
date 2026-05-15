Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Compare Database
Option Explicit
Dim MitBemerkung As Boolean
Dim strW As String
Dim frmST As Form
Dim frmU As Form
Dim iC As Integer
Dim strF1 As String
Dim strF2 As String
Dim strCaption0 As String
Dim strCaption1 As String
Dim lglstAct As Long
Private Sub Form_Load()
On Error GoTo ErrMsg
    strlink1 = ""
    strlink = ""
    s = ""
    OH_MoveMe "open"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Stichwort.Form_Load"
    End Select
    Resume ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    Select Case frmST.Name
    Case "UF_VGDet"
        OH_RQ Forms!F_VG!lstStichwort
    Case "F_Adresse" '250204
        If OH_isloaded(frmST.Name) Then
            OH_RQ frmST!lstStichwort, Y '250204 kleiner Trick mit y
        End If
        If frmST.lstStichwortGr = "wichtige Infos" Then
            frmST.regD_Change
        End If
    Case Else
        If OH_isloaded(frmST.Name) Then
            OH_RQ frmST!lstStichwort, Y '250204 kleiner Trick
        End If
    End Select
    OH_MoveMe "close"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Stichwort.Form_Close"
    Resume ErrEnd
End Sub
Private Function OH_MoveMe(strHow As String)
On Error GoTo ErrMsg
    Dim lgTop As Long
    Dim lgLeft As Long
    lgLeft = Me.WindowLeft / 56.7
    lgTop = Me.WindowTop / 56.7
    s = "left:" & lgLeft & " Top:" & lgTop
    t = "OH_MoveMe " & strHow
    strSQL = "EXECUTE spI_Verlauf @x = 'OH_MoveMe'" & _
        ",@txt = 'Lage Stichwortfenster'" & _
        ",@b = " & lguser & _
        ",@f = '" & strHow & _
        "',@d = '" & s & "'"
    If strHow = "open" Then
        OH_r r
        lgLeft = r!left
        lgTop = r!top
        OH_Move Me, lgLeft, lgTop, 135, 220
    Else
        OH_EX
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Stichwort.OH_MoveMe"
    Resume ErrEnd
End Function
Private Sub BemStichwort_AfterUpdate()
On Error GoTo ErrMsg
    Me!aktBemStichwort = Me!BemStichwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_Stichwort.BemStichwort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comStichwort_Enter()
    OH_A "comStichwort", , Me
End Sub
Private Sub OH_HL()
On Error GoTo ErrMsg
    Dim strN As String
    Dim strV As String
    Dim strL As String
    Dim strH1 As String
    Dim strH2 As String
    strV = Nz(Me!comTransVon)
    strN = Nz(Me!comTransNach)
    If Len(Dir(strN, vbDirectory)) = 0 Then
        s = "Im Feld <nach> muss ein existierender Ordner eingetragen sein!"
        GoTo ErrMsg1
    End If
    strL = "where charindex('" & strV & "',hyperlink)=1"
    strSQL = "Select * from A_Stichwort " & strL
    OH_r rs, , 3
    i = 0
    If rs.BOF Then
        s = strV & vbNewLine & _
                "es wurden keine entsprechenden Hyperlinks gefunden!"
        GoTo ErrMsg1
    Else
        rs.MoveLast
        i = rs.RecordCount & ""
    End If
    If MsgBox("Soll für die gefundenen Hyperlinks ( " & i & ") der Ordner" & vbNewLine & _
             "von  " & strV & vbNewLine & _
             "auf  " & strN & vbNewLine & _
             "geändert werden?", vbOKCancel + vbQuestion, t) = vbCancel Then
        Exit Sub
    End If
    rs.MoveFirst
    i = 0
    While rs.EOF = False
        strH1 = HyperlinkPart(rs!StichwortHyperlink, 1)
        If InStr(strH1, strV) = 1 Then
            strH1 = strN & right(strH1, Len(strH1) - Len(strV))
        End If
        strH2 = HyperlinkPart(rs!StichwortHyperlink, 2)
        If InStr(strH2, strV) = 1 Then
            strH2 = strN & right(strH2, Len(strH2) - Len(strV))
        End If
            rs!StichwortHyperlink = strH1 & "#" & strH2 & "#"
        rs.Update
        i = i + 1
    rs.MoveNext
    Wend
    Select Case i
    Case 0
        MsgBox "es wurden keine Hyperlinks geändert!", vbExclamation, t
    Case 1
        MsgBox "EIN Hyperlink wurde geändert!", vbExclamation, t
    Case Else
        MsgBox "Es wurden " & i & " Hyperlinks geändert!", vbExclamation, t
    End Select
    If i > 0 Then
        OH_RQ frmST!lstD
        OH_RQf Me!UF_Stichwort.Form
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    Select Case Err
    Case 13
        s = "Im Feld <nach> muss ein existierender Ordner eingetragen sein!"
        GoTo ErrMsg1
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "btnHL_Click, Hyperlink bearbeiten"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox s, vbCritical, "Hyperlink bearbeiten"
    GoTo ErrEnd
End Sub
Public Sub OH_SetForm(frm As Form, _
                      strWas As String, _
                      Optional strS As String)
    'Das Feld "ID" wird als Zwischenpuffer benutzt
    'Eigenschaft ".Tag" wird mit dem Namen belegt, Der Wert kommt in die Recordsource
    On Error GoTo ErrMsg
    Dim strStGr As String
    t = "Stichworte"
    Set frmST = frm
'MsgBox frm.Name
    strW = frmST.Tag
    If InStr(frm!lstStichwort.Recordset.Source, "NrVGDET") > 0 Then
        strW = "VGDet"
    End If
    t = "Stichworte " & OH_getTitel(frmST)
    Set frmU = Me!UF_Stichwort.Form
    If frmU.RecordSource <> "" Then
        If frmU.Dirty Then  'wenn im Unterformular noch nicht gepeichert wurde,
            OH_SaveRS frmU     'muss gespeichert werden,
        End If              'damit das Stichwort nicht auf dem falschen Datensatz landet
    End If
    Select Case strW
    Case "Artikel", "VGdet"
        strStGr = Nz(frmST!lstStichwortGr1, "")
    End Select
    Me!ID.Tag = "nr" & strW
    If Me!ID.Tag = "nrQK" Then
         Me!ID.Tag = "IDQK"
    End If
    Me!ID = frmST(Me!ID.Tag)
    strSQL = "Exec dbo.spA_Stichwort " & _
                "@cid = '" & Me!ID.Tag & _
                "',@id =  " & Me!ID & _
                ",@st = 0" & _
                ",@d = '" & strStGr & "'"
    OH_SetRS frmU, Me!ID, strSQL, , False
    strCaption0 = t
    strCaption1 = "Generelles Managen von Stichworten in " & strW
    Me.Caption = t
    reg_Change
    Select Case strWas
    Case "neu"
        Me!UF_Stichwort.Form.btnNeu_Click
    Case "Manage"
        Me!Reg = 1
        Me!Stichwort.SetFocus
        If strS <> "" Then
            Me!txtFirst = left(strS, 1)
            txtFirst_AfterUpdate
            For i = 0 To Me!Stichwort.ListCount - 1
                Me!Stichwort.Selected(i) = False
                If Me!Stichwort.column(0, i) = strS Then
                    Me!Stichwort.Selected(i) = True
                    Exit For
                End If
            Next i
        End If
        GoTo ErrEnd
    Case "lstCopy"
        Me!lstCopy.SetFocus
    Case "Übertragen"
        OH_M
    Case Else
        If OH_RecordcountForm(frmU) = 0 Then
            i = MsgBox(Me.Caption & vbNewLine & vbNewLine & _
                        "Möchten Sie ein neues Stichwort erfassen?", _
                        vbYesNoCancel + vbQuestion, "Noch kein Stichwort erfasst")
            Select Case i
            Case vbYes
                frmU.btnNeu_Click
            Case vbNo
                Me!Reg = 1
                Me!Stichwort.SetFocus
            Case vbCancel
                DoCmd.Close acForm, Me.Name
                Exit Sub
            End Select
        End If
    End Select
    Select Case strWas
    Case "NEU", "lstcopy"
    Case Else
        For Each ctl In frmST.Det.Controls
            If ctl.Tag Like "del1" Then
                strF1 = ctl.ControlSource
            End If
            If ctl.Tag Like "del2" Then
                strF2 = ctl.ControlSource
            End If
        Next ctl
        If Me.Reg = 0 Then
            If left(frmST.Name, 2) <> "UF" Then
                OH_FB Me!UF_Stichwort.Form, _
                        "NrStichwort = " & Nz(frmST!lstStichwort, 0), "Stichwort"
            End If
        End If
        frmU!BemStichwort.SetFocus
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnBemEintragen_Click()
    If IsNull(Me!BemStichwort.column(1)) Then
        MsgBox "bitte eine Bemerkung markieren!", vbExclamation, "Stichworte übertragen?"
        Me!BemStichwort.SetFocus
    Else
        MitBemerkung = True
        btnEintragen_Click
        MitBemerkung = False
    End If
End Sub
Private Sub btnclose_Click()
On Error GoTo ErrMsg
    DoCmd.Close acForm, "PF_Stichwort"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnClose_Click"
    Resume ErrEnd
End Sub
Private Sub OH_M()
On Error GoTo ErrMsg
    'Idee Stichworte von anderen Datensätzen übertragen, User kann auswählen woher
    Dim varA As Variant
    Dim strA(1 To 10) As String
    Dim strColumnWidths As String
    Dim lgColumnCount As Long
    Dim lgCount As Long
    Dim strhelp As String
    Dim strL As String
    Dim strFormName As String
    Dim strFormID As String
    Dim strFilter As String
    t = "Stichworte eintragen für " & Me.Caption
    s = "Sie können hiermit verschiedene Stichwort-Eintragungen für " & vbNewLine & _
            Space(10) & Me.Caption & vbNewLine & _
            "vornehmen." & vbNewLine & _
            "Ihre DB überprüft dabei, dass keine doppelten Eintragungen vorkommen!"
    strhelp = "Eine entsprechende Liste wird geöffnet, die anzeigt, wieviele Stichworte jeweils enthalten sind." & vbNewLine & _
              "mit <Liste filtern...> können Sie diese Liste begrenzen!" & vbNewLine & vbNewLine & _
              "Wählen Sie die gewünschte Zeile aus; diese Stichworte werden dann übertragen!" & vbNewLine & _
              "Klicken Sie in die Liste; die Auswahl erfolgt dann durch die Eingabe des Anfangsbuchstabens oder mit den Pfeil-Tasten auf / ab"
    strA(6) = "Von Vorgabe Artikel"
    strA(7) = "von Vorgabe Begriff"
    strA(8) = "Liste filtern..."
    Select Case strW
    Case "Ablage", "Begriff", "Chronik", "Leistung", "QK", "Lexikon"
        strA(1) = "von anderem " & strW & "-Eintrag"
        varA = Array(strA(1))
    Case "Funktion"
        strA(2) = "von anderer Adresse"
        varA = Array(strA(2))
    Case "VG"
        strA(3) = "von anderem Vorgang"
        strA(4) = "Von Vorgabe " & frmST!QK & " oder andere Vorgangsart"
        varA = Array(strA(3), strA(4))
    Case "VGDet"
        strA(5) = "von anderem Vorgangs-Detail"
        varA = Array(strA(5), strA(6), strA(7))
    Case "Artikel"
        strA(8) = "von anderem Artikel"
        varA = Array(strA(8), strA(7))
    End Select
'============
    OH_msgbox s, varA, vbQuestion, t, strhelp
'============
setzeFilter:
    Select Case strMSG(2)
    Case ""
        GoTo ErrEnd
    Case strA(1), strA(4), strA(7)
        Select Case strMSG(2)
        Case strA(4)
            strW = "QK"
        Case strA(7)
            strW = "Begriff"
        End Select
        strFormName = "F_" & strW
        strFormID = "Nr" & strW
        Select Case strW
        Case "Ablage"
            strSQL = "SELECT DISTINCT a.NrAblage, " & _
                     " Nummer, " & _
                     " AblageArt , " & _
                     " F1 + ' ' + F2 as Was, " & _
                     " Count(s.Stichwort) AS [Anzahl Stichworte] " & _
                     " FROM A_Ablage as a INNER JOIN T_Stichwort  as s ON a.NrAblage = s.NrAblage " & _
                     strFilter & _
                     " GROUP BY  a.NrAblage, a.Nummer, AblageArt,  F1 + ' ' + F2 " & _
                     " HAVING a.NrAblage <> " & frmST!NrAblage & " and Count(s.Stichwort) > 0 " & _
                     " ORDER BY Nummer;"
            strColumnWidths = "0;10;20;40;10"
            lgColumnCount = 5
        Case "Begriff"
            Select Case frmST.Name
            Case "UF_VGDet"
                strlink = frmST!ArtikelText
            Case "F_Artikel"
                strlink = frmST!Artikel
            Case Else
                strlink = frmST(strW)
            End Select
            strSQL = "SELECT DISTINCT b.NrBegriff, " & _
                     " Begriff, " & _
                     " cast(BemBegriff as Char(50)) AS Bemerkung, " & _
                     " Count(s.Stichwort) AS [Anzahl Stichworte], " & _
                     " case when Begriff like '" & strlink & "' then 0 else 1 end as  Sort " & _
                     " FROM A_Begriff  as b INNER JOIN T_Stichwort  as s ON b.NrBegriff = s.NrBegriff " & _
                     strFilter & _
                     " GROUP BY b.NrBegriff, Begriff, cast(BemBegriff as Char(50)) " & _
                     " HAVING Count(s.Stichwort) > 0 " & _
                     " ORDER BY case when Begriff like '" & strlink & "' then 0 else 1 end,Begriff;"
            strColumnWidths = "0;40;30;10"
            lgColumnCount = 4
        Case "Chronik"
            strSQL = "SELECT DISTINCT c.NrChronik, " & _
                     " DatumEreignis as Datum, " & _
                     " Zeitraum , " & _
                     " Wer, " & _
                     " Count(s.Stichwort) AS [Anzahl Stichworte] " & _
                     " FROM A_Chronik as c INNER JOIN T_Stichwort  as s ON c.NrChronik = s.NrChronik " & _
                     strFilter & _
                     " GROUP BY c.NrChronik, DatumEreignis, Zeitraum, Wer " & _
                     " HAVING c.NrChronik <> " & frmST!NrChronik & " and Count(s.Stichwort) > 0 " & _
                     " ORDER BY DatumEreignis Desc, Zeitraum;"
            strColumnWidths = "0;20;40;40;10"
            lgColumnCount = 5
        Case "Leistung"
            strSQL = "SELECT DISTINCT l.NrLeistung, " & _
                    " convert(char(10),l.DatumTag,104) AS [L-Datum], " & _
                    " v.VG, " & _
                    " Left([BemLeistung],50) AS Bemerkung, " & _
                    " Count(s.Stichwort) AS [Anzahl Stichworte]," & _
                    " l.DatumTag " & _
                    " FROM T_VG as v INNER JOIN (T_VGDet as d INNER JOIN (A_Leistung  as l INNER JOIN T_Stichwort  as s ON " & _
                    " l.NrLeistung = s.NrLeistung) ON d.NrVGDet = l.NrVGDet) ON v.NrVG = d.NrVG" & _
                     strFilter & _
                    " GROUP BY l.NrLeistung," & _
                    " convert(char(10),l.DatumTag,104) ," & _
                    " v.VG," & _
                    " Left([BemLeistung],50), l.DatumTag " & _
                    " HAVING l.NrLeistung <>" & frmST!NrLeistung & " And Count(s.Stichwort) > 0" & _
                    " ORDER BY l.DatumTag DESC;"
            strColumnWidths = "0;16;40;20;10"
            lgColumnCount = 5
        Case "QK"
            strSQL = "SELECT DISTINCT IDQK, " & _
                     " IDQK AS Nr, " & _
                     " QK AS Vorgangsart, " & _
                     " Count(s.Stichwort) AS [Anzahl Stichworte] " & _
                     " FROM A_QK as q INNER JOIN s ON q.IDQK = s.NrQK " & _
                     strFilter & _
                     " GROUP BY  IDQK, QK " & _
                     " HAVING Count(s.Stichwort) > 0 " & _
                     " ORDER BY IDQK;"
            strColumnWidths = "0;10;50;10"
            lgColumnCount = 4
        Case "Lexikon"
            strSQL = "SELECT DISTINCT l.NrLexikon, " & _
                     " GruppeNr + ' ' + LexikonNr as [L-Nr], " & _
                     " Begriff AS Bezeichnung, " & _
                     " Count(s.Stichwort) AS [Anzahl Stichworte] " & _
                     " FROM A_Lexikon as l INNER JOIN T_Stichwort  as s ON l.NrLexikon = s.NrLexikon " & _
                     strFilter & _
                     " GROUP BY l.NrLexikon, GruppeNr + ' ' + LexikonNr, Begriff " & _
                     " HAVING l.NrLexikon <> " & frmST!nrlexikon & " and Count(s.Stichwort) > 0 " & _
                     " ORDER BY GruppeNr + ' ' + LexikonNr;"
            strColumnWidths = "0;20;50;10"
            lgColumnCount = 4
        End Select
    Case strA(2)
        strSQL = "SELECT DISTINCT s.NrFunktion, " & _
                 " Namen, " & _
                 " wo + ' ' + Funktion AS [Funktion in Firma]," & _
                 " Count(s.Stichwort) AS [Anzahl] " & _
                 " FROM A_Adressefrm AS a INNER JOIN T_Stichwort  as s ON a.NrFunktion = s.NrFunktion " & _
                strFilter & _
                " GROUP BY s.NrFunktion, Namen, wo + ' ' + Funktion  " & _
                 " HAVING s.NrFunktion <> " & frmST!NrFunktion & " and Count(s.Stichwort) > 0 " & _
                 " ORDER BY Namen;"
        strColumnWidths = "0;40;70;10"
        lgColumnCount = 4
        strFormName = "F_Adresse"
        strFormID = "NrFunktion"
    Case strA(3)
        strSQL = "SELECT DISTINCT v.NrVG, " & _
                 " VGID AS ProjektNr, " & _
                 " convert(char(10),v.VGDatum,104) AS [Datum], " & _
                 " QK + ' ' + VG AS Vorgang," & _
                 " Count(s.Stichwort) AS [Anzahl] " & _
                 " FROM A_QK  as q INNER JOIN (A_VG  as v INNER JOIN T_Stichwort  as s ON v.NrVG = s.NrVG) ON q.IDQK = v.NrQK " & _
                strFilter & _
                 " GROUP BY  v.NrVG, VGID, " & _
                 " convert(char(10),v.VGDatum,104), " & _
                 " QK + ' ' + VG " & _
                 " HAVING v.NrVG <> " & frmST!NrVG & " and Count(s.Stichwort) > 0 " & _
                 " ORDER BY VGID desc ,QK + ' ' + VG;"
        strColumnWidths = "0;10;16;70;10"
        lgColumnCount = 5
        strFormName = "F_VG"
        strFormID = "NrVG"
    Case strA(5)
        If strFilter <> "" Then
            strFilter = " Where charindex('" & strFilter & "',WHEREMATCH)>0"
        End If
        strSQL = "SELECT DISTINCT d.NrVGDet, " & _
                " v.VGID AS ProjektNr, " & _
                " d.Position, " & _
                " convert(char(10),v.VGDatum,104) AS [Datum], " & _
                " [QK] + ' ' + [VG] + ' ' + [Artikeltext] AS Vorgang, " & _
                " Count(s.Stichwort) AS Anzahl" & _
                " FROM T_Stichwort as s INNER JOIN ((A_QK as q INNER JOIN A_VG  as v ON q.IDQK = v.NrQK) " & _
                " INNER JOIN T_VGDet as d ON v.NrVG = d.NrVG) ON s.NrVGDet = d.NrVGDet" & _
                " GROUP BY d.NrVGDet, v.VGID, d.Position," & _
                " convert(char(10),v.VGDatum,104), " & _
                " [QK] + ' ' + [VG] + ' ' + [Artikeltext] " & _
                " HAVING d.NrVGDet <> " & frmST!nrVGDet & "  And Count(s.Stichwort) > 0 " & _
                " ORDER BY v.VGID DESC , d.Position, [QK] + ' ' + [VG] + ' ' + [Artikeltext];"
        strColumnWidths = "0;15;10;16;60;10"
        lgColumnCount = 6
        strFormName = "F_VG"
        strFormID = "NrVGDet"
    Case strA(6), strA(8)
        Select Case strW
        Case "VGDet"
            strlink = frmST!ArtikelText
        Case Else
            strlink = frmST(strW)
        End Select
        strSQL = "SELECT DISTINCT a.NrArtikel, " & _
                 " Artikel, " & _
                 " Artikelname as TYP, " & _
                 " ArtikelNr, " & _
                 " Count(s.Stichwort) AS [Anzahl Stichworte], " & _
                 " case when artikel like '" & strlink & "' then 0 else 1 end  as Sort " & _
                 " FROM A_Artikel as a INNER JOIN T_Stichwort as s ON a.NrArtikel = s.NrArtikel " & _
                 strFilter & _
                 " GROUP BY a.NrArtikel, Artikel, Artikelname,ArtikelNr " & _
                 " HAVING Count(s.Stichwort) > 0 " & _
                 " ORDER BY case when artikel like '" & strlink & "' then 0 else 1 end ,Artikel,Artikelname;"
        strColumnWidths = "0;40;35;30;10"
        lgColumnCount = 5
        strFormName = "F_Artikel"
        strFormID = "NrArtikel"
    Case Else
        GoTo ErrEnd
    End Select
    OH_r rs, , 3
    If rs.BOF = True Then
        MsgBox "Es sind noch KEINE Stichworte erfasst!", vbExclamation, t
        GoTo ErrEnd
    End If
    strA(1) = "übertragen"
    strA(2) = "Stichworte zuerst zeigen...."
    strA(3) = "Daten anzeigen"
    varA = Array(strA(1), strA(2), strA(3), strA(8))
'===================
    OH_msgbox s, varA, vbQuestion, t, strhelp, , , strSQL, lgColumnCount, strColumnWidths
'===================
    strlink = strFormID & " in (" & strMSG(3) & ")"
    Select Case strMSG(2)
    Case ""
        GoTo ErrEnd
    Case strA(1)
        OH_CopyRS "T_Stichwort", strlink, Me!ID.Tag, Me!ID, True
        Me!UF_Stichwort.SetFocus
        OH_RQf Me!UF_Stichwort.Form
        With Me!UF_Stichwort.Form
            !StichwortNr.SetFocus
            .StichwortNr_AfterUpdate
        End With
    Case strA(2)
        strSQL = "SELECT A.NrStichwort as ID, " & _
                " A.StichwortNr as Nr, " & _
                " A.Stichwort as Stichwort, " & _
                " A.BemStichwort as Zusatz, " & _
                " isnull((Select max(Stichwort) as M from T_Stichwort where Stichwort like [A].[Stichwort] and " & Me!ID.Tag & "= " & Me!ID & "),0) AS VorhandenJaNein " & _
                " FROM T_Stichwort as A" & _
                " WHERE A." & strlink & ";"
        strL = vbNullString
        lgCount = 0
        OH_r rs
        While rs.EOF = False
            If rs!VorhandenJaNein = 0 Then
                If Len(strL) = 0 Then
                    strL = rs!ID
                Else
                    strL = strL & "," & rs!ID
                End If
                lgCount = lgCount + 1
            End If
        rs.MoveNext
        Wend
        If lgCount = 0 Then
            strA(3) = "Diese Stichworte sind bereits vorhanden!"
            varA = Array(strA(3))
        Else
            strA(1) = "Alle übertragen (" & lgCount & ")"
            strA(2) = "Nur markierte übertragen"
            varA = Array(strA(1), strA(2))
        End If
        strColumnWidths = "0;5;40;25;0;15"
        lgColumnCount = 6
        strhelp = "Die Liste zeigt die Stichworte an, die Sie ausgewählt haben!" & vbNewLine & _
                "Wenn in der Spalte <vorhanden> (rechts) ein ja steht, ist dieses Stichwort bereits vorhanden und wird NICHT übertragen!" & vbNewLine & vbNewLine & _
                "Markieren Sie mit der SHIFT / CTRL-Taste diejenigen Daten, die Sie übertragen wollen!"
        OH_msgbox s, varA, vbQuestion, t, strhelp, , , strSQL, lgColumnCount, strColumnWidths
        strlink = strFormID & " in (" & strMSG(3) & ")"
        Select Case strMSG(2)
        Case ""
            GoTo ErrEnd
        Case strA(1)
        Case strA(2)
            strL = strMSG(3)
        Case Else
            GoTo ErrEnd
        End Select
        strlink = "NrStichwort in (" & strL & ")"
        OH_CopyRS "T_Stichwort", strlink, Me!ID.Tag, Me!ID, True
        Me!UF_Stichwort.SetFocus
        OH_RQf Me!UF_Stichwort.Form
        With Me!UF_Stichwort.Form
            !StichwortNr.SetFocus
            .StichwortNr_AfterUpdate
        End With
    Case strA(3)
        OH_OF frmST.Name, Val(strMSG(3))
    Case strA(8)
        s = "Bitte den gewünschten Filter eingeben"
        strFilter = InputBox(s, "Filtern der Stichwort-Liste")
        If strFilter = "" Then
            GoTo ErrEnd
        Else
            strFilter = " Where charindex('" & strFilter & "',wherematch)>0"
        End If
        GoTo setzeFilter
    Case Else
        GoTo ErrEnd
    End Select
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_M 'Idee Stichworte von anderen Datensätzen übertragen"
    Resume ErrEnd
End Sub
Private Sub OH_transfer()
On Error GoTo ErrMsg
    Dim strnext As String
    Dim strnext1 As String
    Dim strlS As String
    Dim lgST As Long
    Dim strlfirst As String
    strlink = " FROM T_Stichwort WHERE Nr" & strW & " = " & frmST("Nr" & strW) & ";"
    strSQL = "SELECT * " & strlink
    OH_r r, , , , True
    strlS = "Nr" & strW & " <> " & frmST("Nr" & strW)
    If r.BOF Then
        MsgBox "Keine Stichworte eingetragen!", , t
    Else
        OH_r rx, frmST.RecordSource, , , True
        lgST = rx.RecordCount & ""
        Select Case lgST
        Case 1
            MsgBox "Keine Adresse zum Übertragen zu finden!" & vbNewLine & _
                   "(Mindestens 2 Datensätze filtern!)", vbCritical, t
            OH_ResetRS r
            GoTo ErrEnd
        Case Else
            i = 0
            rx.Find strlS
            While Not rx.EOF And i < 10
                i = i + 1
                Select Case i
                Case 1
                    strnext1 = rx(strF1) & " " & rx(strF2)
                    strlfirst = "Nr" & strW & " = " & rx("Nr" & strW)
                Case 2
                    strnext = rx(strF1) & " " & rx(strF2)
                Case Else
                    strnext = strnext & ", " & rx(strF1) & " " & rx(strF2)
                End Select
                rx.Find strlS
            Wend
            strnext = "alle " & lgST - 1 & " gefilterten Datensätze!"
        End Select
        r.MoveLast
        x = r.RecordCount & ""
        x = OH_msgbox("Stichworte übertragen auf die Datensätze in der Liste! " & vbNewLine & vbNewLine & vbNewLine & _
                    "Möchten Sie die " & x & " Stichworte " & vbNewLine & _
                    "von " & frmST(strF1) & " " & frmST(strF2) & vbNewLine & _
                    "auf andere Datesätze übertragen?", _
                   Array("Übertragen auf " & strnext1, "übertragen auf " & strnext) _
                    , vbQuestion, t, _
                    "Sie können damit auf einen Schlag alle Stichwörter eines Datensatzes komplett auf andere Datensätze übertragen!" & vbNewLine & _
                    "Filtern Sie vorher im Haptformular alle gewünschten Datensätze heraus!" & vbNewLine & _
                    "Nach dem Übertragen können Sie die Stichwörter des Hauptdatensatzes " & frmST(strF1) & " löschen.")
        Select Case x
        Case 1
            rx.Find strlfirst
            OH_CopyRS "T_Stichwort", "Nr" & strW & " = " & frmST("Nr" & strW), "Nr" & strW, rx("Nr" & strW), True
        Case 2
            rx.MoveFirst
            Do Until rx.EOF
                If rx("Nr" & strW) <> frmST("Nr" & strW) Then
                    OH_CopyRS "T_Stichwort", "Nr" & strW & " = " & frmST("Nr" & strW), "Nr" & strW, rx("Nr" & strW), True
                End If
            rx.MoveNext
            Loop
            s = "Möchten Sie die " & lgST & " Stichworte " & vbNewLine & _
                "von " & frmST(strF1) & " " & frmST(strF2) & vbNewLine & _
                "jetzt löschen?"
            x = MsgBox(s, vbQuestion + vbYesNo, t)
            If x = vbYes Then
                OH_EX ("DELETE  " & strlink)
            End If
        Case 3
        End Select
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Stichworte übertragen"
    Resume ErrEnd
End Sub
Private Sub comStichwort_Afterupdate()
On Error GoTo ErrMsg
    Dim strLst As String
    If Len(strW) = 0 Then
        strW = "Funktion"
    End If
    Select Case Me!comStichwort
    Case "Alle"
        strLst = ""
    Case "+"
        strLst = "''+'' and ''+''"
    Case "A-Z"
        strLst = "''A'' and ''Z''"
    Case "A-G"
        strLst = "''A'' and ''G''"
    Case "H-O"
        strLst = "''H'' and ''O''"
    Case "P-Z"
        strLst = "''P'' and ''Z''"
    Case "1-9"
        strLst = "''1'' and ''9''"
    End Select
    If Len(strLst) > 1 Then
        strLst = "left(Stichwort,1) between " & strLst
    End If
    If Not IsNull(Me!txtFirst) Then
        strLst = "left(Stichwort," & Len(Me!txtFirst) & " ) like  ''" & Me!txtFirst & "''"
    End If
    OH_A "Stichwort", "@cID = 'Nr" & strW & _
                    "',@f =  '" & strLst & "'", Me
    If Me!Stichwort.ListCount > 0 Then
        Me!Stichwort.Selected(0) = True
        Stichwort_AfterUpdate
    Else
        If iC = 0 Then
            iC = iC + 1
            MsgBox Me!comStichwort & vbNewLine & "nix zu finden!", vbCritical, "Alle Stichworte wieder anzeigen"
            Me!comStichwort = "ALLE"
            comStichwort_Afterupdate
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Stichworte eingrenzen"
    Resume ErrEnd
End Sub
Public Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strST(1) As Variant
    t = Me!lstact.column(1)
    'Me!txtWie.Visible = False
    lglstAct = Me!lstact
    Select Case lglstAct
    Case 0 'Stichworte
        Me!NeueStichwortNr.SetFocus
        Me!NeueStichwortNr.Dropdown
    Case 1 '
        If OH_Validate(Me!aktStichwort, "Stichwort") = False Then
            strST(1) = Me!aktStichwort
            OH_Eintragen 1, strST, Nz(Me!aktBemStichwort, ""), Nz(Me!aktHL, "")
        End If
    Case 2 'Stichworte von anderen Daten
        OH_M
    Case 3 '
        Me!txtwie.Visible = True
        s = "Im Feld <von> bitte den (alten) Ordner eintragen, der ersetzt werden soll" & vbNewLine & _
                 "Im Feld <nach> den (neuen) Ordner eintragen, der den alten ersetzen soll"
        Me!txtwie = s
        If IsNull(Me!comTransNach) Or IsNull(Me!comTransVon) Then
            GoTo ErrMsg1
        End If
        OH_HL
    Case 4 '
        If Nz(Me!comTransNach, 0) * Nz(Me!comTransVon, 0) = 0 Then
            GoTo ErrMsg1
        End If
        OH_A "@x = 'MoveStichwort'" & _
            ",@cid = '" & strW & _
            "',@id = " & Nz(Me!comTransNach, 0) & _
            ", @o = " & Nz(Me!comTransVon, 0), , Me
        OH_EX
        OH_RQ frmST!lstStichwort
    Case 5 '
        If Nz(Me!comTransNach, 0) * Nz(Me!comTransVon, 0) = 0 Then
            GoTo ErrMsg1
        End If
        OH_A "@x = 'CopyStichwort'" & _
            ",@cid = '" & strW & _
            "',@id = " & Nz(Me!comTransNach, 0) & _
            ", @o = " & Nz(Me!comTransVon, 0), , Me
        OH_EX
        OH_RQ frmST!lstStichwort
    Case 6
        OH_transfer
    End Select
    Me!lstact = Null
    SysCmd acSysCmdSetStatus, t & " erledigt"
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Stichworte.lstAct_AfterUpdate"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox "<Von> und <Nach> müssen ausgefüllt sein!", vbCritical, t
    Me!comTransVon.SetFocus
    GoTo ErrEnd
End Sub
Public Sub NeueStichwortNr_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgPos As Long
    Dim strS As String
    Dim strB As String
    If OH_Validate(Me!aktStichwort, "Stichwort") Then
        GoTo ErrEnd
    End If
    strS = Nz(Me!aktStichwort)
    strB = Nz(Me!aktBemStichwort)
    t = left("Nummer ändern : " & strS & " " & strB, 100)
    lgPos = Nz(Me!NeueStichwortNr, 0)
    If MsgBox("Möchten Sie generell die bestehenden Lauf-Nummern ändern?" & vbNewLine & vbNewLine & _
               "neue Nummer:" & vbTab & lgPos & vbNewLine & vbNewLine & _
               "Hinweis:" & vbNewLine & _
               "Falls die Nummer grösser ist als die Anzahl Stichwörter," & vbNewLine & _
               "setzt Ihre DB automatisch den nächst höheren Wert ein!", _
               vbOKCancel + vbQuestion, t) = vbCancel Then
        GoTo ErrEnd
    End If
    DoCmd.Hourglass True
    OH_A "@x='ChangeStichwortNr' " & _
         ",@id = " & lgPos & _
         ",@cid = '" & strW & _
         "',@o = '" & strS & _
         "',@fi = '" & strB & "'"
    OH_r r
    s = "Anzahl" & vbTab & "WAS" & vbNewLine & _
            "==============================================" & vbNewLine & _
            r!ctx & vbTab & t & vbNewLine & _
            r!cta & vbTab & "Kontrollierte Stichwörter" & vbNewLine & _
            r!ctu & vbTab & "Geänderte Stichwörter (neue Nrn.)" & vbNewLine & vbNewLine & vbNewLine & _
            "Hinweis: Falls die Nr. grösser ist als die Anzahl Stichworte," & vbNewLine & _
            "wurde die grösste Nummer eingetragen!"
    If r!ctu = 0 Then
        s = s & vbNewLine & vbNewLine & _
                "An der Reihenfolge hat sich nichts geändert," & vbNewLine & _
                "da sich die Stichwörter bereits in der gewünschten Sortierung befinden!!"
    Else
        OH_RQf Me!UF_Stichwort.Form
        Me!UF_Stichwort.SetFocus
    End If
    MsgBox s, , t
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "NeueStichwortNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub reg_Change()
On Error GoTo ErrMsg
    Dim strTag As String
    strTag = Mid(Me!ID.Tag, 3, 20)
    Set frm = Me!UF_Stichwort.Form
    Select Case Reg
    Case 0
        Me.Caption = strCaption0
        OH_A "Stichwort", "@cid ='" & Me!ID.Tag & "'", Me
    Case 1
        Me.Caption = strCaption1
        OH_A "@st = 23", "comStichwort"
        comStichwort_Afterupdate
        Me!aktStichwort = Null
        Me!aktBemStichwort = Null
        Me!aktHL = Null
        With Me!Stichwort
            For Each x In .ItemsSelected
                If Len(Nz(.column(0, i))) > 0 Then
                    Me!aktStichwort = .column(0, x)
                    Exit For
                End If
            Next x
        End With
        With Me!BemStichwort
            For Each x In .ItemsSelected
                If Len(Nz(.column(0, i))) > 0 Then
                    Me!aktBemStichwort = .column(0, x)
                    Exit For
                End If
            Next x
        End With
    Case 2
        OH_Number Me, Me!NeueStichwortNr
        Me.Caption = strCaption1
        If OH_RecordcountForm(frm) > 0 Then
            Me!aktStichwort = frm!Stichwort
            Me!aktBemStichwort = frm!BemStichwort
            Me!aktHL = frm!StichwortHyperlink
        End If
        Me!comTransVon = frmST("Nr" & strW)
        OH_A "lstAct", , Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Reg_Change"
    Resume ErrEnd
End Sub
Private Sub comTransVon_Enter()
    OH_A "comTransVon", "@cid='" & strW & "'"
End Sub
Private Sub comTransNach_Enter()
    OH_A "comTransNach", "@cid='" & strW & _
                      "', @id = " & Nz(Me!comTransVon, 0)
End Sub
Private Sub SucheBemStichwort_Click()
    If IsNull(Me!BemStichwort.column(1)) Then
        MsgBox "bitte eine Bemerkung markieren!", vbExclamation, _
               SucheBemStichwort.ControlTipText
        Me!BemStichwort.SetFocus
    Else
        BemStichwort_DblClick (0)
    End If
End Sub
Private Sub BemStichwort_DblClick(Cancel As Integer)
    OH_SucheStichwort Nz(Me!BemStichwort, "")
End Sub
Private Sub btnBemStichwortchange_Click()
On Error GoTo ErrMsg
    Dim strStichwortalt As String
    Dim strBemStichwortalt As String
    If IsNull(Me!BemStichwort.column(1)) Then
        s = "Sie haben keine Bemerkung markiert !" & vbNewLine
        s = s & "Bitte mindestens eine markieren!"
        MsgBox s, vbInformation, "Ändern ?!": GoTo ErrEnd
    End If
    strStichwortalt = Me!BemStichwort.column(1)
    strBemStichwortalt = Me!BemStichwort
    If OH_CheckAdmin(strStichwortalt & " ALT Ändern") = True Then
        GoTo ErrEnd
    End If
    If OH_CheckAdmin(Me!BemStichwort & " in Neu Ändern") = True Then
        GoTo ErrEnd
    End If
    VarAntw = InputBox(strBemStichwortalt & ": Name unten ändern !", "Bemerkung ändern", strBemStichwortalt)
    If VarAntw = vbNullString Then GoTo ErrEnd
    If VarAntw = strBemStichwortalt Then GoTo ErrEnd
    OH_A "@x = 'updateBemStichwort' " & _
        ",@fi = '" & OH_RPL(VarAntw) & _
        "',@f = '" & OH_RPL(strBemStichwortalt) & _
        "',@d = '" & OH_RPL(strStichwortalt) & _
        "',@cID = '" & strW & "'"
    OH_EX
    OH_RQ Me!BemStichwort
ErrEnd:
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd

End Sub
Private Sub btnEintragen_Click()
On Error GoTo ErrMsg
Dim lgS() As Long
Dim strST() As Variant
Dim nST As Long
Dim yST As Long
    'markierte Stichworte zur Adresse hinzufügen
    s = vbNullString
    t = "Markierte Stichworte übertragen ?"
    Set ctl = Me!Stichwort
    yST = 0
    For Each x In ctl.ItemsSelected
        If OH_CheckAdmin(ctl.column(0, x) & " " & t) = True Then
            GoTo ErrEnd
        End If
        s = s & vbNewLine & ctl.column(0, x)
        yST = yST + 1
        ReDim Preserve strST(yST) As Variant
        strST(yST) = ctl.column(0, x)
    Next x
    If yST = 0 Then
        s = "Sie haben kein Stichwort markiert." & vbNewLine & _
                   "Bitte mindestens eine Stichwort markieren!"
        MsgBox s, vbInformation, t
        GoTo ErrEnd
    End If
    If MitBemerkung = False Then
        Me!BemStichwort = Null
    End If
    OH_Eintragen yST, strST, Nz(Me!BemStichwort, "")
ErrEnd:
    Exit Sub
ErrMsg:
    If Err = 3022 Then Resume Next
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnChange_Click()
On Error GoTo ErrMsg
    Dim strStichwortalt As String
    Dim strLDel As String
    Set frm = Forms!PF_Stichwort
    Set ctl = frm!Stichwort
    i = 0
    For Each x In ctl.ItemsSelected
        i = i + 1
        strStichwortalt = ctl.column(0, x)
    Next x
    Select Case i
    Case 0
        s = "Sie haben kein Stichwort markiert !" & vbNewLine
        s = s & "Bitte mindestens eines markieren!"
    Case Is > 1
         s = "Sie haben " & i & "  Stichworte markiert !" & vbNewLine
         s = s & "Bitte nur ein Stichwort markieren!"
         Me!Stichwort = Null
    End Select
    If i <> 1 Then
        MsgBox s, 32, "Ändern ?!"
        GoTo ErrEnd
    Else
        If OH_CheckAdmin(strStichwortalt & " Ändern") = True Then
            GoTo ErrEnd
        End If
    End If
    VarAntw = InputBox(strStichwortalt & ": Name unten ändern !", "Stichwort ändern", strStichwortalt)
    If VarAntw = vbNullString Then GoTo ErrEnd
    If VarAntw = strStichwortalt Then
        GoTo ErrEnd
    End If
    OH_A "@x = 'updateStichwort' " & _
        ",@fi = '" & OH_RPL(VarAntw) & _
       "',@f = '" & OH_RPL(strStichwortalt) & _
       "',@cID = '" & strW & "'"
    OH_EX
    OH_RQ Me!Stichwort
    If OH_isloaded("F_Adresse") Then
        OH_RQf Forms!F_Adresse
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    Select Case Err
    Case 3022 ' wenn es doppelte Einträge geben würde!
        rs.Delete
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical
    End Select
    Resume ErrEnd
End Sub
Private Sub btnDelete_click()
    Me!Stichwort = Null
    OH_RQ Me!BemStichwort, , 1
End Sub
Private Sub btnDeleteStichwort_Click()
On Error GoTo ErrMsg
Dim Stichwort As String
    Set frm = Forms!PF_Stichwort
    Set ctl = frm!Stichwort
    i = 0
    s = ""
    For Each x In ctl.ItemsSelected
        i = i + 1
        VarAntw = ctl.column(0, x)
        If i < 10 Then
            s = s & VarAntw & vbNewLine
        Else
            s = s & "."
        End If
        If i = 1 Then
            strlink = "''" & VarAntw & "''"
        Else
            strlink = strlink & ",''" & VarAntw & "''"
        End If
        If OH_CheckAdmin(VarAntw) = True Then
            GoTo ErrEnd
        End If
    Next x
    Select Case i
    Case 0
        s = "Sie haben kein Stichwort markiert !" & vbNewLine & _
                  "Bitte mindestens eines markieren!"
        MsgBox s, vbExclamation, "Löschen"
    Case Is > 0
        strlink = "(Stichwort in (" & strlink & ")) and " & _
                  "Nr" & strW & " >0"
        s = "Sie haben " & i & "  Stichwort(e) markiert:" & vbNewLine & vbNewLine & _
                   s & vbNewLine & vbNewLine
        i = OH_CountStichwort(strlink)
        If i = 1 Then
            s = s & "Sie löschen jetzt den einen betroffenen Datensatz!"
        Else
            s = s & "Achtung: Sie löschen jetzt " & i & "  davon betroffenen Datensätze!"
        End If
        If MsgBox(s, vbQuestion + vbOKCancel, "Stichworte KOMPLETT löschen ?") = vbOK Then
            OH_A "@x = 'DeleteStichwort'" & _
                ",@fi ='" & strlink & "'"
            OH_EX
            OH_RQ Me!Stichwort
            OH_RQ Me!BemStichwort
            OH_RQf Me!UF_Stichwort.Form
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnSuch_Click()
On Error GoTo ErrMsg
    OH_SucheStichwort
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Stichworte btnSuch_Click"
    Resume ErrEnd
End Sub
Private Function OH_SucheStichwort(Optional strBem As String = "")
On Error GoTo ErrMsg
    Set ctl = Me!Stichwort
    For Each x In ctl.ItemsSelected
        s = Nz(ctl.column(0, x), "")
    Next x
    s = "S:" & Trim(s & " " & strBem)
    frmST!txtFind = s
    frmST.txtFind_AfterUpdate
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Stichworte OH_SucheStichwort"
    Resume ErrEnd
End Function
Private Sub Stichwort_AfterUpdate()
On Error GoTo ErrMsg
    Set ctl = Me!Stichwort
    i = 0
    For Each x In ctl.ItemsSelected
        s = Nz(ctl.column(0, x), "")
        Me!aktStichwort = s
    Next x
    OH_A "BemStichwort", _
        "@cID ='" & strW & _
        "',@fi ='" & OH_RPL(s) & "'", Me
    s = "Alle Bemerkungen zum Stichwort < " & s & " >"
    Me!BemStichwort.ControlTipText = s
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Stichwort_Afterupdate()"
    Resume ErrEnd
End Sub
Private Sub Stichwort_KeyUp(KeyCode As Integer, Shift As Integer)
    Stichwort_AfterUpdate
End Sub
Private Sub Stichwort_DblClick(Cancel As Integer)
    OH_SucheStichwort
End Sub
Private Sub txtFirst_AfterUpdate()
    comStichwort_Afterupdate
End Sub
Private Sub btnBemStichwortDelete_Click()
On Error GoTo ErrMsg
    If IsNull(Me!BemStichwort.column(1)) Then
        s = "Sie haben keine Bemerkung markiert !" & vbNewLine & _
                  "Bitte mindestens eine markieren!"
        MsgBox s, vbExclamation, "Löschen"
        GoTo ErrEnd
    End If
    If OH_CheckAdmin(Me!BemStichwort.column(1) & " Löschen") = False Then
        strlink = "A_Stichwort.BemerkungStichwort =  ''" & Me!BemStichwort & _
                  "'' and Stichwort =  ''" & Me!BemStichwort.column(1) & "'' and " & _
                  "Nr" & strW & " >0"
        i = OH_CountStichwort(strlink)
        If i = 1 Then
            s = "Sie löschen jetzt diesen einen betroffenen Datensatz!"
        Else
            s = "Achtung: Sie löschen jetzt diese " & i & "  davon betroffenen Datensätze!"
        End If
        If MsgBox(Me!BemStichwort.column(1) & " " & Me!BemStichwort & vbNewLine & _
                 s, vbQuestion + vbOKCancel, "Stichwort KOMPLETT löschen ?") = vbOK Then
            OH_A "@x = 'DeleteStichwort'" & _
                ",@fi ='" & strlink & "'"
            OH_EX
            OH_RQ Me!Stichwort
            OH_RQ Me!BemStichwort
            OH_RQf Me!UF_Stichwort.Form
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub OH_Eintragen( _
            lgI As Long, _
            varST() As Variant, _
            strStBem As String, _
            Optional strHL As String)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgFi As Long
    Dim lgM As Long
    Dim strAct As String
    Dim lgS() As Long
    Dim yST As Long
    DoCmd.Hourglass True
    t = "Stichworte übertragen ?"
    Select Case strW
    Case "Funktion"
        strAct = frmST!namen
        lgFi = Nz(frmST!countRec, 0)
    Case "Artikel"
        strAct = frmST!Artikel & " " & frmST!ArtikelName
        lgFi = Nz(frmST!countRec, 0)
    Case "Begriff"
        strAct = frmST!Begriff
        lgFi = Nz(frmST!countRec, 0)
    Case "VG"
        strAct = frmST!QK & " " & frmST!VG
        lgFi = Nz(frmST!countRec, 0)
    Case "VGdet"
        strAct = left(frmST!ArtikelText, 20)
        lgFi = 1
    End Select
    If Len(varST(1)) > 0 Then
        strSQL = "EXEC spI_Marker @tag = '" & strW & _
                               "',@Art = 'C'"
        OH_r r
        lgM = r!UsersMarker
        x = OH_msgbox(vbNewLine & _
                 "Die Stichwortliste können Sie jetzt ergänzen:" & vbNewLine & vbNewLine & _
                 "Stichwort:  " & varST(1) & vbNewLine & _
                 "Bemerkung:  " & strStBem & vbNewLine & vbNewLine & _
                 "Der Aktuelle Datensatz: " & strAct & vbNewLine & vbNewLine & _
                 "Übertrage diese Stichwort auf folgende Datensätze:", _
                 Array("Aktuell (nur 1)", "gefiltert (" & lgFi & ")", "Markierte (" & lgM & ")"), _
                 vbQuestion, t, _
                 "Prüfen Sie sorgfältig die gefilterten Daten, für die das Stichwort eingefügt werden soll!")
        Select Case Val(x)
        Case 1
            yST = 1
            frmST!lstDet.SetFocus
            strSQL = frmST.Recordset.Source
        Case 2
            yST = lgFi
            frmST!lstDet.SetFocus
            strSQL = frmST!lstDet.Recordset.Source
        Case 3
            yST = lgM
            frmST!lstM.SetFocus
            strSQL = frmST!lstM.Recordset.Source
        Case 4, 0
            GoTo ErrEnd
        End Select
        If yST > 10 Then
            If MsgBox("Sicherheitshalber nochmal bestätigen!" & vbNewLine & vbNewLine & _
                        "Wirklich auf alle " & yST & " Datensätze anwenden?", _
                        vbDefaultButton2 + vbOKCancel + vbQuestion, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        If yST > 100 Then
            If MsgBox("Sicherheitshalber ein 2. Mal bestätigen!" & vbNewLine & vbNewLine & _
                        "Wirklich auf alle " & yST & " Datensätze anwenden???????", _
                        vbDefaultButton2 + vbOKCancel + vbQuestion, t & " Mehr als 100 Datensätze!") = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        OH_r r
        yST = 0
        For i = 1 To lgI
            While r.EOF = False
                lgid = Nz(r.Fields(0), 0)
                If lgid > 0 Then
                    strSQL = "Exec spa_Stichwort " & _
                                "@x = 'InsertStichwort'" & _
                                ", @ID = " & lgid & _
                                ", @cID = '" & strW & _
                                "',@o = '" & OH_RPL(varST(i)) & _
                                "',@d = '" & strHL & _
                                "',@fi = '" & OH_RPL(strStBem) & "'"
                    OH_EX
                    SysCmd acSysCmdSetStatus, yST & "  Stichworte eintragen " & varST(i) & " " & strStBem & " " & lgid
                End If
            r.MoveNext
            Wend
        Next i
        OH_RQf Me!UF_Stichwort.Form
        OH_RQ Me!Stichwort
        OH_RQ frmST!lstStichwort
    End If
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    If Err = 3022 Then Resume Next
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Function OH_CountStichwort(strL As String) As Integer
On Error GoTo ErrMsg
'zählt Anzahl Stichworte pro Where-Bedingung
    OH_A "@x = 'CountStichworte' " & _
         ",@fi ='" & strL & "'", , Me
    OH_r r
    OH_CountStichwort = r(0)
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    If Err = 3022 Then Resume Next
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CountStichwort"
    Resume ErrEnd
End Function
Private Sub btnVon_Click()
    Me!comTransVon.SetFocus
    If IsNull(Me!comTransVon) Then
        Me!comTransVon = frmST!NrFunktion
    Else
        OH_OF "F_Adresse", Me!comTransVon
    End If
End Sub
Private Sub btnNach_Click()
    Me!comTransNach.SetFocus
    If IsNull(Me!comTransNach) Then
        Me!comTransNach = frmST!NrFunktion
    Else
        OH_OF "F_Adresse", Me!comTransNach
    End If
End Sub
Private Sub btnCopy_click()
On Error GoTo ErrMsg
    t = "Kopiere Stichworte"
    i = OH_InsertID_LST(Me!lstCopy, True)
    If i = 0 Then
        s = "Bitte mindestens eine Zeile markieren (Nutzen Sie mit SHIFT / CTRL)"
        GoTo ErrM
    End If
    strSQL = Me!lstCopy.Recordset.Source
    i = InStr(strSQL, ",@st")
    strSQL = left(strSQL, i - 1)
    OH_r r
    i = r!CT
    SysCmd acSysCmdSetStatus, i & " Stichworte angefügt"
    If i > 0 Then
        OH_RQ frmST!lstStichwort
    End If
    Select Case i
    Case 0, Me!lstCopy.ListCount - 1
        DoCmd.Close acForm, Me.Name
    End Select

ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstArtikel_afterupdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
