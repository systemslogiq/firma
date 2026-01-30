Attribute VB_Name = "mdl_Printer"
Option Compare Database
Option Explicit
    Dim strTxt As String
    Global strEmailNr(1 To 500) As String
    Global strEMailName(1 To 500) As String
    Global lgEMailNrAdresse(1 To 500) As Long
    Global strEmail As String
    Dim strAnredeEmail As String
    Dim lgE As Long
    Dim lgDefault As Long
    Dim strDefaultPrinter As String
    Dim strCC As String
    Dim strBCC As String
    Dim strSignatur As String
    Dim strA(1 To 5) As String
    Dim strAnrede As String
Public Function OH_tlbPrint(Optional lgPrint As Long = 0)
On Error GoTo ErrMsg
    Dim frmP As Form
    Dim strEmailCC As String
    Dim N As Long
    Dim IDA As Long
    Dim strEnr As String
    Dim strEnr1 As String
    Dim lge1 As Long
    Dim strEName As String
    Dim strEName1 As String
    Dim strTitel As String
    Dim strhelp As String
    Dim lgCountFilter As Long
    Dim lgCountMarker As Long
    Dim vararray As Variant
    Dim lgReportNr As Long
    Dim lgAntw As Long
    Dim strCaption As String
    Dim strFilename As String
    Dim strAttach As String
    Dim strKontaktart As String
    Dim strBetreff As String
    Dim strAttaches(1 To 2) As String
    Dim rsReport As ADODB.Recordset
    Dim strFormName As String
    Dim strRechnungsformat As String
    Dim strTag As String
    Dim strStart As String
    Dim strEnd As String
    Dim strf As String

    Dim strAb As String
    Dim strECstatus As String
    Dim strECguid As String
    Dim strECurl As String
    Dim strECSyncClient As String
    Dim strECmail As String
    Dim strLanguage As String
    Dim strQ As String

    If lgPrint <> 0 Then
        Set frmP = Forms!F_VG
    Else
        Set frmP = OH_tlbStartForm
    End If
    strSignatur = ""
    strEmail = ""
    Select Case frmP.Name
    Case "UF_txt"
        Set frmP = Forms!F_VG
    Case "Menu"
        OH_Adresse
        Set frmP = Forms!F_Adresse
    Case Else
    End Select
    strFormName = frmP.Name
    strTitel = "Drucken " & frmP.Caption
    strTitel = strTitel & " " & OH_getTitel(frmP)
    Select Case left(frmP.Name, 3)
    Case "PF_"
        DoCmd.Minimize
    End Select
    strTag = frmP.Tag
    OH_SaveRS frmP
    OH_ResetID
    Select Case strTag
    Case "Adresse"
        If frmP!RegMain = 0 Then
            frmP.comAnschrift_AfterUpdate
        Else
            If Screen.ActiveControl.Name Like "StandardText" Then
                frmP!btnRTF.SetFocus
            End If
        End If
        If frmP!NrMitarbeiter.Visible = True Then
            If IsNull(frmP!NrMitarbeiter) Then
                strSQL = "SELECT T_VG.NrMitarbeiter" & _
                        " FROM T_Funktion AS FM INNER JOIN (T_Funktion AS FK INNER JOIN T_VG ON FK.NrFunktion = T_VG.NrFunktion) ON FM.NrFunktion = T_VG.NrMitarbeiter" & _
                        " WHERE (FK.NrAdresse = " & frmP!IDAdresse & _
                        " or FK.NrAdrZuord = " & frmP!IDAdresse & _
                        ") And FM.NrAdresse = " & lgUserNrAdr & _
                        " ORDER BY T_VG.NrVG DESC;"
                OH_r r
                If r.BOF = False Then
                    r.MoveFirst
                    frmP!NrMitarbeiter = r!NrMitarbeiter
                End If
            End If
            If OH_Validate(frmP!NrMitarbeiter, "Mandant") = True Then
                frmP!NrMitarbeiter.Dropdown
                GoTo ErrEnd
            End If
        End If
        strTxt = frmP!txtMemo
        strEmail = Nz(frmP!EMail, "")
    Case "VG"
        OH_SaveRS frmP!UF_txt.Form
        OH_A "@x = 'checkTexteVG'" & _
             ",@i = " & frmP!NrVG & _
             ",@f ='Liefertermin'", , frmP
        OH_r r
        s = r!Msg
        If left(s, 7) = "Hinweis" Then
            frmP.OH_Hinweis s
        End If
        If frmP!NrQK = 23 Then
            If InStr(frmP!Einleitung, "xxx") Then
                MsgBox frmP!Einleitung & vbNewLine & vbNewLine & _
                        frmP!btnVGDat1.Caption & " fehlt noch!", vbExclamation, "xxx in Einleitung!"
                frmP!VGDat1.SetFocus
                GoTo ErrEnd
            End If
            OH_A "@x = 'StundensatzArtikel', " & _
                " @i = " & frmP!NrVG, , frmP
            OH_r rsReport
            If rsReport.BOF = False Then
                If frmP!VGPrint = -1 Then
                    x = MsgBox("Sie haben einen Artikel im Stundensatz angeboten!" & vbNewLine & _
                             "Möchten Sie wirklich die Gesamtsumme im Angebot anzeigen?" & vbNewLine & vbNewLine & _
                             "JA:" & vbTab & "Gesamtsumme anzeigen!" & vbNewLine & _
                             "Nein:" & vbTab & "Gesamtsumme NICHT anzeigen!" _
                             , vbQuestion + vbYesNoCancel, "Stundensatz - Check")
                    Select Case x
                    Case vbCancel
                        GoTo ErrEnd
                    Case vbNo
                        OH_A "@x = 'StundensatzArtikel', " & _
                            " @i = " & frmP!NrVG & "," & _
                            " @a = 1", , frmP
                        OH_EX
                        OH_RQf frmP
                    End Select
                End If
            End If
            OH_ResetRS r
        End If
        If InStr(frmP!Anschrift, "Abteilung") > 0 Then
            strSQL = "Select dbo.fx_Div( 'AbteilungInfo',1,'" & frmP!Anschrift & "' ,'','') as email"
            OH_r r
            If InStr(r!EMail, "@") > 1 Then
                strEmail = r!EMail
            End If
        End If
        If strEmail = "" Then
            strEmail = Nz(frmP!EMail, "")
        End If
    End Select
    strhelp = "Sie können über dieses Feature die Druckvorlagen (in der Seitenansicht) starten!" & vbNewLine & _
              "Auch mit Doppel-Klick in der Liste startet der Bericht!" & vbNewLine & vbNewLine & _
             "Die Überschrift eines Berichtes kann geändert werden, wenn unter Report ein (X) eingetragen ist!" & vbNewLine & _
             "Der jeweils zuletzt angewählte Bericht erscheint an erster Stelle!!"
    OH_ResetRS r
    Select Case strTag
    Case "q"
        lgCountMarker = 0
        lgCountFilter = 0
    Case "Audit", "QK"
        lgCountFilter = Nz(frmP!countRec, 0)
        lgCountMarker = 0
    Case "Leistung"
        lgCountFilter = Nz(frmP!countRec, 0)
        lgCountMarker = Nz(frmP!countM, 0)
        If Not IsNull(frmP!NrVGdetR) Then
            strA(5) = "zugehörige Rechnung"
        End If
    Case Else
        lgCountFilter = Nz(frmP!countRec, 0)
        lgCountMarker = Nz(frmP!countM, 0)
    End Select
    strA(1) = "aktuell"
    strA(2) = "gefiltert (" & lgCountFilter & ")"
    strA(3) = "markiert (" & lgCountMarker & ")"
    strA(4) = "Alle"

   ' OH_080129
    vararray = Array(strA(1), strA(2), strA(3), strA(4))
    If strA(5) <> "" Then
        vararray = Array(strA(1), strA(2), strA(3), strA(4), strA(5))
    End If
    '111223
     If lgPrint > 0 Then
        lgDefault = 0
    End If
    strSQL = "Exec dbo.spI_Print " & _
                " @x = 'Reports'," & _
                " @i = " & lgDefault & _
                ", @f = '" & strFormName & "'"
    OH_r rsReport
    If rsReport.BOF = True Then
        MsgBox "Für dieses Formular ist kein Bericht zum Druck in der Tabelle T_Filter hinterlegt!", _
                vbExclamation, _
                "Ihr Administrator"
        GoTo ErrEnd
    End If
'=============
    If lgPrint > 0 Then
        strMSG(1) = 1
        strMSG(3) = frmP!comPrint
    Else
        OH_msgbox s, vararray, vbQuestion, strTitel, strhelp, , , strSQL, 4, "0;0;40"
    End If
'============
    lgAntw = Val(strMSG(1))
    If lgAntw = 0 Then
        GoTo ErrEnd
    End If
    Select Case lgAntw
    Case 3
        If lgCountMarker = 0 Then
            MsgBox "Sie haben keine Daten markiert!", vbExclamation, strTitel
            GoTo ErrEnd
        End If
    End Select
    lgReportNr = Val(strMSG(3))
    strSQL = "exec dbo.spI_Print " & _
                " @x = 'IDReport'" & _
                ", @i = " & lgReportNr
    OH_r rsReport
    If rsReport.BOF = False Then
        strDocname = Nz(rsReport!FieldName, "")
        If strDocname = "B_VG" Then
            strDocname = glstrB_VG
        End If

        VarAntw = rsReport!FieldN
        If strMSG(4) = "" Then
            strMSG(4) = VarAntw
        End If
        lgReportNr = Nz(rsReport!ReportNr, 0)
        lgDefault = rsReport!NrFilter
        strMSG(5) = Nz(rsReport!BemFilter)
        strf = Nz(rsReport!FindSQL)
    End If
    strCaption = strMSG(4)
    strTitel = strCaption
    strlink = "T_" & strTag & ".Nr" & strTag & "=" & frmP("Nr" & strTag)
    '=======================
    Select Case lgAntw
    Case 5
        Select Case frmP.Name
        Case "F_Leistung"
        Case Else
            GoTo ErrEnd
        End Select
    End Select
    '===============================110905
'    OH_closeObj strDocname, acReport
'    Select Case strDocname
'    Case glstrB_VG
'        If OH_CheckB_VG = vbCancel Then
'            GoTo Errend
'        End If
'    End Select
    '====================================
    Select Case lgReportNr
    Case 101, 130, 104, 117 'Brief
        If frmP.OH_VGDat = True Then GoTo ErrEnd     'prüfe VGDatum
    Case 102, 105
        If frmP.OH_VGDat = True Then GoTo ErrEnd      'prüfe VGdatum
        strEnr = Nz(frmP!Fax, "")
        If strEnr = "" Then
            s = "FAX-Nr von " & frmP!NamePerson & " fehlt." & vbNewLine & _
               "Wenn Sie eine Korrekte FAX-Nummer eingeben, wird diese auch gleichzeitig gespeichert!" & vbNewLine & _
               "Mit einem <X> könnnen Sie dennoch drucken!" & vbNewLine & vbNewLine & _
               "Fax-Nummer hier eingeben (oder ein X):"
            strEnr = InputBox(s, strTitel)
            Select Case strEnr
            Case vbNullString
                GoTo ErrEnd
            Case "X"
            Case Else
                strSQL = "Exec dbo.spa_Adresse " & _
                        " @x = 'InsertFax', " & _
                        " @i = " & frmP!NrFunktion & ", " & _
                        " @f = '" & strEnr & "'"
                OH_EX
                OH_RQf frmP
                If OH_isloaded("F_Adresse") Then
                    If Forms!F_Adresse!NrFunktion = frmP!NrFunktion Then
                        OH_RQf Forms!F_Adresse
                    End If
                End If
            End Select
            VarAntw = "FAX"
        End If
        OH_CBx strEnr
    Case 103, 106, 109, 110, 124, 125, 271
        If lgReportNr = 103 And lgCountFilter > 1 And lgAntw <> 1 Then 'EMAIL mit filter
            MsgBox "Noch können Sie NICHT mehrere Emails (" & lgCountFilter & ") auf einmal erstellen", _
                    vbCritical, "Gruss PHILIPP"
            OH_tlbPrint
            GoTo ErrEnd
        End If
        If frmP.OH_VGDat Then GoTo ErrEnd       'prüfe VGsdatum
        strSQL = "Select txt,txtv from A_txtVG " & _
                " where txt in('Betreff','Anlagen','Beilagen','Kontaktart','Versandart') " & _
                " and txtv is not null and NrVG = " & frmP!NrVG
        OH_r r
        strBetreff = frmP!VG
        While Not r.EOF
            Select Case r!txt
            Case "Betreff"
                strBetreff = r!txtV
            Case "Anlagen", "Beilagen"
                strAttach = r!txtV
            Case "Kontaktart"
                strKontaktart = r!txtV
            Case "Versandart"
                strEmail = r!txtV
            End Select
        r.MoveNext
        Wend
        i = InStr(strEmail, "@")
        If i > 0 Then
            For N = i - 1 To 1 Step -1      '20180212: Emailadresse kann aus nur einem Zeichen vor dem @ bestehen. i - 2 geändert in i -1
                If Mid(strEmail, N, 1) = " " Or N = 0 Then
                    strEmail = Trim(Mid(strEmail, N))
                    strEmail = Replace(strEmail, " ", "")
                    strEmail = Replace(strEmail, ",", ";")
                    Exit For
                End If
            Next N
        Else
            strEmail = Nz(frmP!EMail)
            If Len(strEmail) < 5 Then
                s = "eMail-Adresse von " & frmP!Nachname & " fehlt."
againEmail:
                strEmail = InputBox(s & vbNewLine & _
                "Bitte hier unten eingeben:", frmP!VG)
                If strEmail = vbNullString Then
                    GoTo ErrEnd
                Else
                    If Not OH_Valid_Mail_URL(strEmail) Then
                        s = s & vbNewLine & _
                                "Eine korrekte Mail-Adresse sollte mindestens ein <@> enthalten und mehr als 5 Buchstaben haben"
                        GoTo againEmail
                    Else
                        OH_EX "spa_Adresse 'UpdateEmail'," & frmP!NrFunktion & ",@f='" & strEmail & "'"
                        OH_RQf frmP
                    End If
                End If
            End If
        End If
        If (frmP!IDQK = 90 And left(strKontaktart, 5) = "email") Or _
            lgReportNr = 125 Then
            OH_OutlookMail _
                strEmail, _
                 strBetreff, _
                "<br><br>" & _
                "<br><br>" & _
                frmP!QK & " " & frmP!ANr & " vom " & frmP!VGdatum & _
                 "<br><br>" & _
               OH_rtf2html3(Nz(frmP!vgbem)), _
                frmP!NrFunktion, _
                strAttach, , , , Nz(frmP!OutlookVorlage), frmP
        Else
            '241221 C:\Firma-Ablage wegen BULLSHIT eliminiert; MERCI ELENA fürs Feststellen
            If frmP!IDQK >= 90 And lgAntw = 3 Then
                If strKontaktart = "" Then
                    strKontaktart = strTitel
                End If
            End If
            If OH_PrintReport(frmP, lgAntw, strDocname, strTitel, lgReportNr) = 0 Then
                GoTo ErrEnd
            End If
            strFilename = glstrTempPath & Reports(strDocname)!FileN
            strRechnungsformat = Reports(strDocname)!Rechnungsformat '251205 ermittle das Format Zugferd, xml, Standard aus dem Report
            OH_KILL strFilename
            DoEvents
            s = OH_Create_PDF(frmP!NrVG, strFilename, strRechnungsformat) 'erstellt das PDF und ggf. auch die ERechnung mit XML
            If left(s, 7) <> "Success" Then
                GoTo ErrM
            End If
            If OH_isloaded("rptAnalysenZertifikat", acReport) = True Then
                strAttaches(1) = Replace(strFilename, glstrTempPath, glstrTempPath & "Zertifikat")
                OH_KILL strAttaches(1)
                DoCmd.OutputTo acReport, "rptAnalysenZertifikat", OH_GetOutputFormatPDF, strAttaches(1), False
            End If
            DoEvents
            Select Case lgReportNr
            Case 110
                strTitel = strFilename & vbNewLine & _
                        "Öffne Pdf-File zum Abspeichern in einen anderen Ordner?"
            Case Else
                strTitel = "Starte Outlook mit Pdf-File als Beilage?"
            End Select
            If lgPrint <> 2 Then
                s = s & vbNewLine & vbNewLine & _
                            "JA" & vbTab & "Diese Seitenansicht schliessen" & vbNewLine & _
                            "Nein" & vbTab & "  ''" & Space(20) & "''        geöffnet lassen!" & vbNewLine & vbNewLine & _
                            "Abbrechen" & vbTab & "Outlook NICHT starten!"
                Y = MsgBox(s, vbQuestion + vbYesNoCancel, strTitel)
                Select Case Y
                Case vbYes
                    DoCmd.Close acReport, strDocname
                Case vbCancel
                    GoTo ErrEnd
                End Select
            End If
            If Len(Dir(strFilename)) = 0 Then
                If MsgBox("PDF-File wurde nicht gefunden" & vbNewLine & _
                            "Nochmal probieren?", _
                            vbQuestion + vbYesNo, strFilename) = vbNo Then
                    GoTo ErrEnd
                End If
            End If
            DoEvents
            Select Case lgReportNr
            Case 110
                OH_LaunchDocument 2, strFilename
            Case Else
                If OH_MailDocument(frmP, strFilename) Then
                    OH_KILL strFilename
                Else
                    GoTo ErrEnd
                End If
            End Select
        End If
        GoTo ErrEnd
    Case 114
        strlink = "id = " & frmP!NrVG
        VarAntw = strCaption
        OH_PrintReport frmP, lgAntw, "Nichtdrucken"
        strlink = Replace(strlink, "[T_VG].[NrVG]", "[id]")
        DoCmd.OpenReport strDocname, acViewPreview
        GoTo ErrEnd
    Case 116
        If OH_Etikette1(strCaption) = True Then GoTo ErrEnd
    Case 120
        If lgAntw > 1 Then
            MsgBox "Sie können nur den AKTUELLEN Stundenbericht ausdrucken!", vbExclamation, strTitel
        End If
        strA(1) = OH_GetPathPartFE
        strA(2) = strA(1) & strDocname
        strA(1) = strA(1) & "Stundenbericht.xls"
        If Len(Dir(strA(2))) = 0 Then
            MsgBox strA(2) & vbNewLine & "Datei existiert nicht!", vbCritical, strTitel
            GoTo ErrEnd
        End If
        OH_KILL strA(1)
        FileCopy strA(2), strA(1)
        If OH_InitializeEXCEL = False Then
            GoTo ErrEnd
        End If
        Dim nParts() As String
        Set frm = Forms!F_VG
        nParts() = Split(frm!Anschrift, vbNewLine)
        With appEXCEL
            Set wb = .Workbooks.Open(strA(1))
            Set ws = wb.Worksheets("Stundenbericht")
            ws.Activate
            ws.Range("A1").Select
            ws.Range("B2").Value = frm!Firma
            ws.Range("B3").Value = Format(frm!VGdatum, "dd.mm.yy") & " Nummer: " & frm!ANr & " " & frm!VG
            For i = 0 To UBound(nParts)
                ws.Range("B" & 6 + i).Value = nParts(i)
            Next i
            ws.Range("B12").Value = frm!Telefon
        End With
        wb.Save
        Set appEXCEL = Nothing
        FollowHyperlink strA(1)
        GoTo ErrEnd
    Case 126
        strSQL = "Exec dbo.spa_VG " & _
            " @x ='OH_OutlookAppointment', " & _
             "@i = " & frmP!NrVG
        OH_r r
        OH_OutlookAppointment _
            Nz(r!EMail, ""), _
            Nz(r!VG, ""), _
            r!Start, _
            r!Ende, _
            r!txt, _
            r!location, _
            r!duration
        GoTo ErrEnd
    Case 127 'Wordbrief
        OH_startWord _
            "+Word-Brief", _
            lguser, _
            frmP!Anschrift, _
            frmP!VG, _
            frmP!vgbem, _
            frmP!VGAnrede, _
            frmP!VGdatum
        GoTo ErrEnd
    Case 128
        OH_ResetID
        OH_InsertID frmP!VGID
        strSQL = "Select * from vwProjektstatistik order by Unr"
        OH_EXCEL strSQL
        GoTo ErrEnd
    Case 201
        strlink = "NrAdresse = " & frmP!IDAdresse
    Case 131
        OH_PrintReport frmP, lgAntw, "NichtDrucken"
        strSQL = "Exec dbo.spa_VG " & _
                " @x = 'rptVgdet'"
        OH_r r
        s = r!mldg
        If s = "" Then
            s = "Keine Daten für Ihre Auswahl vorhanden!"
            GoTo ErrM
        End If
        If r!Anzahl > 1 Then
            strTitel = "Liste der Artikel in den Vorgängen!"
            s = InputBox("Die unten angezeigten Einheiten kommen in Ihrer Auswahl vor!" & vbNewLine & _
                            "Bestimmen Sie, welche davon angezeigt werden sollen!" & vbNewLine & _
                            "(mit Komma getrennt)" & vbNewLine & _
                            "Welche Einheiten wollen Sie sehen?", strTitel, s)
            If s = "" Then
                GoTo ErrEnd
            End If
        End If
        DoCmd.Hourglass True
        strSQL = strSQL & _
                ", @f = '" & s & "'"
        OH_EXCEL strSQL, "Vorgänge mit Artikel"
        GoTo ErrEnd
    Case 202, 203, 204
        s = "Betreff hier eintragen"
        If frmP!StandardText Like s Then
            If MsgBox("Betreff: " & s & vbNewLine & "Wollen Sie wirklich DIESEN Betreff verwenden?", _
                vbCritical + vbOKCancel + vbDefaultButton2, strTitel) = vbCancel Then
                frmP!StandardText.SetFocus
                GoTo ErrEnd
            End If
        End If
        s = Nz(frmP!txtMemo, "")
        If s = "" Then '140725
            If MsgBox("Wollen Sie keinen Text eintragen?", vbQuestion + vbOKCancel, strTitel) = vbCancel Then
                frmP!StandardText.SetFocus
                GoTo ErrEnd
            End If
        End If
        If lgReportNr = 204 Then
            If OH_Validate(frmP!Fax, "Fax-Nummer") Then GoTo ErrEnd
            OH_CB Replace(frmP!Fax, "+", "00")
        End If
        Select Case lgAntw
        Case 1
        Case Else
            N = OH_PrintReport(frmP, lgAntw, "NichtDrucken")
            strTitel = strCaption
            If N > 1 Then
                s = "Sie haben " & N & " Adressen ausgewählt!" & vbNewLine & _
                        "Wie möchten Sie vorgehen?"
                x = OH_msgbox(s, _
                    Array("> " & left(frmP!Nachname, 10) & " mit " & N - 1 & " CC", _
                          strCaption & " einzeln an " & N & " Adressen"), _
                     vbQuestion, strTitel, _
                     "Sie möchten mehr als einen Datensatz ausdrucken!" & vbNewLine & vbNewLine & _
                     "Sind Sie sich sicher????")
                VarAntw = Null
                Select Case Val(x)
                Case 1
                    OH_r rs, frmP.RecordSource, , , True
                    rs.MoveFirst
                    While rs.EOF = False
                        If Not frmP!NrFunktion = rs!NrFunktion Then
                            strCC = strCC & " - " & rs!Nachname & ", " & rs!Ort & vbNewLine
                        End If
                        rs.MoveNext
                    Wend
                    VarAntw = strCC
                    DoCmd.OpenReport strDocname, acViewPreview, , "NrFunktion= " & frmP!NrFunktion
                    GoTo ErrEnd
                Case 2
                Case 0
                    GoTo ErrEnd
                End Select
            End If
        End Select
    Case 205, 206, 270, 271
        x = strCaption
        If x = "EMail" Then
            If OH_Validate(frmP!EMail, "Email-Nummer") = True Then
                GoTo ErrEnd
            End If
            lgE = generateEmailListe(frmP, lgAntw)
        Else
            If frmP.Name = "F_Adresse" Then
                If frmP!Funktion = "Privat" Then
                    If OH_Validate(frmP!EMail, "Email-Nummer") = True Then
                        GoTo ErrEnd
                    End If
                End If
                lgE = generateEmailListe(frmP, lgAntw, "privat")
            End If
        End If
        Select Case lgReportNr
        Case 270, 271
            If strf = "" Then
                s = "KEINEN ORDNER MIT OUTLOOK - Vorlagen gefunden!"
                GoTo ErrM
                If Len(Dir(strf, vbDirectory)) = 0 Then
                    s = "Vorlagen-Ordner ist nicht vorhanden!" & vbNewLine & _
                        strf
                End If
            End If
            strEmail = Nz(frmP!EMail, "")
            strTitel = "Outlook-Vorlage auswählen!"
            OH_OutlookMail _
                strEmail, _
                Nz(frmP!VG, ""), _
                "", _
                frmP!NrFunktion, _
                "", _
                , , , Nz(frmP!OutlookVorlage, ""), _
                frmP
            GoTo ErrEnd
        End Select
        'http://support.microsoft.com/support/kb/articles/Q209/9/48.ASP?LNG=ENG&SA=ALLKB&FR=0
        If lgE > 0 Then
            strTxt = frmP!txtMemo
            strTitel = frmP!NrMitarbeiter.column(1) & " ==> " & strCaption & "(" & lgE & ")"
            Select Case lgE
            Case 1
                OH_OutlookMail _
                    strEmail, _
                    Nz(frmP!StandardText, ""), _
                    strTxt, _
                    frmP!NrFunktion, _
                    Nz(frmP!comBeilage, ""), , , , _
                    Nz(frmP!OutlookVorlage, ""), _
                    frmP
                GoTo ErrEnd
            Case Else
                strEnr = "Möchten Sie Outlook starten?" & vbNewLine
                For i = 1 To lgE
                    strEnr = strEnr & vbNewLine & "- " & strEMailName(i) & ",   " & strEmailNr(i)
                    If lgEMailNrAdresse(i) = frmP!IDAdresse Then
                        strEName1 = strEMailName(i)
                        strEnr1 = strEmailNr(i)
                        lge1 = i
                    Else
                        If Len(strEmailCC) = 0 Then
                            strEmailCC = strEmailNr(i)
                        Else
                            strEmailCC = strEmailCC & ";" & strEmailNr(i)
                        End If
                    End If
                    If i < 10 Then
                        s = strEnr
                    Else
                        If i < 20 Then
                            s = s & "." & vbNewLine
                        End If
                    End If
                Next i
            End Select
            If i > 10 Then
                s = "Wollen Sie wirklich soviele Email-Adressen (" & lgE & ")  übernehmen?" & vbNewLine & _
                             s
            End If
            x = OH_msgbox(s & vbNewLine & _
                "Die eMail-Adressen sind im Zwischenspeicher (mit CTRL V verfügbar)!", _
                Array("> " & frmP!Vorname & " " & frmP!Nachname & " mit " & lgE - 1 & " CC", _
                      "1 Mail an " & lgE & " Adressen", _
                      lgE & " Mails (einzeln)"), _
                 vbQuestion, strTitel, _
                 "Sie möchten mehr als einen Datensatz ausdrucken")
            Select Case Val(x)
            Case 1 'ein Mail strto, andere CC
                strEmail = strEnr1
                strCC = strEmailCC
                lgE = 1
            Case 2 'ein Mail strto = ALLE
                lgE = 1
                strCC = ""
            Case 3 'einzelne Mails
                strCC = ""
            Case 0
                GoTo ErrEnd
            End Select
            If Len(strEnr1) = 0 Then
                MsgBox "es fehlt die " & strCaption & " von " & frmP!Vorname & "" & frmP!Nachname, vbCritical, strTitel
            Else
                For N = 1 To lgE
                    If lgE > 1 Then
                        strEmail = strEmailNr(N)
                        lge1 = N
                    End If
                    strSignatur = ""

                    If Val(x) = 2 Then
                        strAnrede = lgR(strAnredeEmail)
                    End If
                    OH_OutlookMail _
                        strEmail, _
                        Nz(frmP!StandardText, ""), _
                        strTxt, _
                        frmP!NrFunktion, _
                        Nz(frmP!comBeilage, ""), _
                        strCC, _
                         , , _
                        Nz(frmP!OutlookVorlage, ""), _
                        frmP, _
                        ""
                Next N
            End If
        End If
        GoTo ErrEnd
    Case 207, 208
        If OH_Validate(frmP!NrMitarbeiter, "Mandant im Druckmenu, Wer schreibt den Brief??") = True Then
            GoTo ErrEnd
        End If
        If OH_Validate(frmP!Anschrift, "Anschrift im Druckmenu") = True Then
            GoTo ErrEnd
        End If
        If OH_Validate(frmP!comAnrede, "Anrede im Druckmenu") = True Then
            GoTo ErrEnd
        End If
        If IsNull(frmP!StandardText) = True Then
            If MsgBox("Im Druckmenu fehlt der Eintrag <Betreff>!", vbOKCancel + vbQuestion, strTitel) = vbCancel Then
                frmP!StandardText.SetFocus
                GoTo ErrEnd
            End If
        End If
        OH_startWord "+" & strCaption, _
                     frmP!NrMitarbeiter, _
                     frmP!Anschrift, _
                     frmP!StandardText, _
                     Application.PlainText(frmP!txtMemo), _
                     frmP!comAnrede, _
                     frmP!txtDate, _
                     frmP!comBeilage
        GoTo ErrEnd
    Case 209, 222
        frmP!StandardText = strCaption
        strlink = "Fun =" & frmP!NrFunktion
    Case 210
        strlink = "NrFunktion =" & frmP!NrFunktion
        Select Case lgAntw
        Case 4
            s = ""
            strSQL = "Exec dbo.spa_Adresse " & _
                    "@x = 'OutlookKontakt' " & _
                    ",@i = " & lguser & _
                    ",@a = 1"
            OH_r r
            If r.BOF Then
                s = "Vorschlag letzte 30 Tage"
                strStart = Format(Date - 30, "dd.mm.yyyy")
            Else
                strStart = Format(r!Date, "dd.mm.yyyy")
                s = "Ihr letzter Outlook-Abgleich war am:"
            End If
nochmalOutlook:
            s = "Geben Sie unten <ALLE> ein, wenn Sie ALLE  vorhandenen Outlook-Kontakte LÖSCHEN und " & vbNewLine & _
                    "und anschliessend NEU anlegen möchten mit diesen Adress-Daten aus Ihrer SQL-Datenbank." & vbNewLine & vbNewLine & _
                 "Wenn Sie unten ein Datum eingeben, werden nur die Adressen in Outlook abgegelichen, die sich seither geändert haben oder die neu angelegt wurden." & vbNewLine & vbNewLine & _
                 s
            i = 0
            strStart = InputBox(s, strCaption, strStart)
            Select Case strStart
            Case ""
                GoTo ErrEnd
            Case "Alle"
                strStart = "01.01." & Year(Date) - 20
            Case Else
                If Len(strStart) = 10 And Val(Replace(strStart, ".", "")) > 0 Then
                    If Not IsDate(CDate(strStart)) Then
                        i = 1
                    End If
                Else
                    i = 1
                End If
            End Select
            If i = 1 Then
                s = vbNewLine & "Bitte ein gültiges Datum im Format <tt.mm.jjjj> eintragen"
                strStart = Format(Date - 30, "dd.mm.yyyy")
                GoTo nochmalOutlook
            End If
            i = -1
            strStart = Format(CDate(strStart), "yyyymmdd")
        End Select
        If strStart = "" Then
            i = OH_PrintReport(frmP, lgAntw, "NichtDrucken")
            If i < 1 Then
                s = "Keine Daten vorhanden"
                GoTo ErrM
            End If
        Else
            lgAntw = i
        End If
        OH_SyncAddContactOutlook vbNo, lgAntw, strStart
        GoTo ErrEnd
    Case 211
        If lgAntw = 1 Then
            x = MsgBox("Liste für alle gefilterten eMail-Adressen?" & vbNewLine & vbNewLine & _
                      "JA" & vbTab & "Alle gefilterten Adressen" & vbNewLine & _
                      "Nein" & vbTab & "Nur die aktuelle Adresse " & frmP!Nachname, _
                     vbQuestion + vbYesNoCancel, _
                     "Aktuell ==> Gefiltert")
            If x = vbYes Then
                OH_tlbPrint
                GoTo ErrEnd
            End If
            If x = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        lgE = generateEmailListe(frmP, lgAntw)
        If lgE > 0 Then
            If MsgBox(s & vbNewLine & _
                      "Die eMail-Adressen sind im Zwischenspeicher (mit CTRL V verfügbar)!", _
                       vbQuestion + vbOKCancel, strCaption & "  (" & lgE & ")") = vbOK Then
                For i = 1 To lgE
                    If i = 1 Then
                        s = strEmailNr(i)
                    Else
                        s = s & ";" & strEmailNr(i)
                    End If
                Next i
                OH_CB s
            End If
        End If
        GoTo ErrEnd
    Case 212
        OH_PrintReport frmP, lgAntw, strDocname
        GoTo ErrEnd
    Case 213
        OH_CB frmP!Anschrift
        MsgBox frmP!Anschrift & vbNewLine & vbNewLine & " wurde in den Zwischenspeicher kopiert!", vbInformation
        GoTo ErrEnd
    Case 223
        frmP!Anschrift.Visible = True
        frmP!Anschrift.SetFocus
        s = frmP!Anschrift
        If lgReportNr = 223 Then
            strSQL = "Exec dbo.spa_Adresse " & _
                    " @x = 'AdressInfos', " & _
                    " @i = " & frmP!NrFunktion
            OH_r r
            s = s & vbNewLine & _
                    r!AdressInfos & vbNewLine & vbNewLine & _
                    frmP!PostAdr
        End If
        OH_CB s
        frmP!txtMemo = s
        MsgBox s & vbNewLine & vbNewLine & " wurde in den Zwischenspeicher kopiert" & vbNewLine & _
               "und im Textfeld eingetragen!", vbInformation, VarAntw
        GoTo ErrEnd
    Case 215, 216, 217, 218, 219, 220, 224, 228, 229
        Select Case frmP.Name
        Case "F_Adresse"
            If frmP.RegMain = 0 Then
                frmP.RegMain = 1
            End If
        End Select
        If InStr(strCaption, "Couvert") > 0 Then
            mdl_DB.OH_WordAnschrift strCaption
            GoTo ErrEnd
        Else
            If OH_Etikette1(strCaption) = True Then GoTo ErrEnd
        End If
    Case 221
        If Len(Nz(frmP!txtMemo, "")) < 5 Then
            frmP!StandardText = "auf 3 Zeilen beschränken"
            frmP!txtMemo = "Tragen Sie bitte hier im gelben Feld Ihren Text ein"
            frmP!txtMemo.SetFocus
        Else
            VarAntw = "VonAdresse"
            DoCmd.OpenReport strDocname, acViewPreview
        End If
        GoTo ErrEnd
    Case 303
        OH_PrintReport frmP, lgAntw, "NichtDrucken"
        If Len(strlink) > 0 Then
            strlink = " Where " & strlink
        End If
        strDocname = "Artikelübersicht"
        'OHxxx
'        strSQL = "TRANSFORM Sum(Format([AnzahlVG],'Standard')) & ' - ' & Sum(Format([AnzahlVG]*[VGKurs]*[EinzelpreisVG],'Standard')) AS [Anzahl -Betrag]" & _
'                " SELECT ([Nachname] & ', ' & [Ort]) AS Lieferant, T_Artikel.Artikel, T_Artikel.ArtikelNr, T_Artikel.Artikelname, T_Artikel.Liefereinheit " & _
'                " FROM (T_Adresse INNER JOIN T_Artikel ON T_Adresse.NrAdresse = T_Artikel.NrFirma) INNER JOIN (T_QK INNER JOIN (T_VG INNER JOIN T_VGDet ON T_VG.NrVG = T_VGDet.NrVG) ON T_QK.IDQK = T_VG.NrQK) ON T_Artikel.NrArtikel = T_VGDet.NrArtikel " & _
'                strlink & _
'                " GROUP BY [Nachname] & ', ' & [Ort], T_Artikel.Artikel, T_Artikel.ArtikelNr, T_Artikel.Artikelname, T_Artikel.Liefereinheit " & _
'                " ORDER BY T_Artikel.Artikel, T_Artikel.ArtikelNr, T_Artikel.Artikelname, IDQK & '-' & QK " & _
'                " PIVOT IDQK & '-'& QK;"
'        db.QueryDefs(strDocname).SQL = strSQL
'        If DCount("Artikel", strDocname) = 0 Then
'            MsgBox "Keine Daten zu finden für Ihre Auswahl", vbExclamation, strDocname
'            goto errend
'        End If
'        DoCmd.OpenQuery strDocname
        GoTo ErrEnd
    Case 308
        OH_PrintReport frmP, lgAntw, "NichtDrucken"
        OH_StartKatalog strDocname
        GoTo ErrEnd
    Case 404
        OH_PrintReport frmP, lgAntw, "NichtDrucken"
        OH_EXCEL "Exec dbo.spa_leistung 'Excel'", "Leistungen"
        GoTo ErrEnd
    Case 500
        For i = 31 To frmP!AnzahlRegister Step -1 ' suche höchsten Registereintrag
            lge1 = i
            If Not IsNull(frmP("[" & i & "]")) Then Exit For
        Next i
        If frmP!AnzahlRegister <> lge1 Then
            OH_EX ("UPDATE T_Ablage SET T_Ablage.AnzahlRegister = " & lge1)
        Else
            lge1 = frmP!AnzahlRegister
        End If
        s = "Bitte Anzahl Register eintragen!" & _
                  vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & _
                  "Werte zwischen 1 und 31"
nochmal:
        VarAntw = Val(InputBox(s, "Anzahl Register für Ordner-Inhalt", lge1))
        If VarAntw = 0 Then GoTo ErrEnd
        If VarAntw < 1 Or VarAntw > 32 Then
            s = "Nur Werte zwischen 1 und 31 zulässig!"
            GoTo nochmal
        End If
        If VarAntw <> frmP!AnzahlRegister Then
            OH_EX ("UPDATE T_Ablage SET T_Ablage.AnzahlRegister = " & VarAntw)
        End If
    Case 501, 502
    Case 504, 505
        If OH_Etikette1(strDocname) = True Then
            GoTo ErrEnd
        End If
    Case 230 'weihnachten
        GoTo ErrEnd
    Case 200 '<R206> <R211>
        OH_CheckGelangensbestätigung frmP!NrVG, "print_ec"
        GoTo ErrEnd
    End Select
    OH_PrintReport frmP, lgAntw, strDocname, strCaption, lgReportNr
    VarAntw = Null

ErrEnd:
    OH_ResetRS rsReport
    OH_ResetRS rs
    strEmail = ""
    strCC = ""
    Exit Function
ErrMsg:
    Select Case Err
    Case 2501 'keine Daten im Report
        Resume Next
    Case 53
        MsgBox "Das File ist nicht zu finden oder wurde nicht erstellt!" & vbNewLine & _
                "prüfen Sie Ihre Drucker!", vbCritical, _
                "PDF-Files aus Firma heraus generieren!"
    Case 70
        MsgBox Err.Description & vbNewLine & _
                "Das PDF-File ist u.U. bereits geöffnet!", vbCritical, _
                "PDF-Files aus Firma heraus generieren!"
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_tlbPrint"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, strTitel
    GoTo ErrEnd
End Function
Public Function OH_setBriefInfo(frm As Form)
On Error GoTo ErrMsg
    Dim strN As String
    If frm!comAnredeWie = 1 And frm!DuSie = 1 Then
        strN = frm!NrMitarbeiter.column(8)
    Else
        strN = frm!NrMitarbeiter.column(9)
    End If
    strSQL = "Exec spA_B_VG " & _
                " @x = 'setBriefInfo'" & _
                ",@f ='" & Val(Nz(frm!NrMitarbeiter, 0)) & _
                        "|" & Val(Nz(frm!NrMitarbeiter1, 0)) & _
                        "|" & OH_RPL(left(Nz(frm!StandardText, ""), 150)) & _
                        "|" & OH_RPL(left(Nz(frm!comAnrede, ""), 50)) & _
                        "|" & OH_RPL(left(Nz(frm!Anschrift, ""), 150)) & _
                        "|" & OH_RPL(left(Nz(frm!txtMemo, ""), 4000)) & _
                        "|" & strN & _
                        "|" & Nz(frm!comSprache, "Deutsch") & _
                        "|" & Nz(frm!comGruss, "Mit freundlichen Grüssen") & _
                        "|" & Nz(frm!lstTxtMemo, "802") & _
                        "|" & Nz(frm!comBeilage, "") & _
                        "|" & Format(Nz(frm!txtDate, Date), "yyyymmdd") & _
                        "|" & Nz(frm!lstTxtMemo, "") & _
                        "|" & Nz(frm!NrFunktion, 0) & "'"
    OH_EX
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_setBriefInfo"
    Resume ErrEnd
End Function

Public Function generateEmailListe(frmE As Form, lgFilter As Long, Optional strA As String) As Long
'Email-Liste generieren und in Zwischenspeicher kopieren
'aus den ausgewählten Adressen)
    Dim lgH As Long
    Dim lgF As Long
    Dim lgG As Long
    Dim strEListe As String
    s = vbNullString
    lgE = OH_PrintReport(frmE, lgFilter, "NichtDrucken")
    generateEmailListe = lgE
    Select Case lgE
    Case 0
        Exit Function
    End Select
    lgE = 0
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'EmailArray'" & _
            ", @f = '" & strA & "'"
    OH_r r
    strEmail = ""
    If r.BOF = False Then
        r.MoveFirst
        While r.EOF = False
            lgG = lgG + 1
            lgE = lgE + 1
            strEmailNr(lgE) = r!emailnr
            If strEmail = "" Then
                strEmail = strEmailNr(lgE)
            Else
                strEmail = strEmail & ";" & strEmailNr(lgE)
            End If
            strEMailName(lgE) = Trim(r!Nachname & " " & r!Vorname)
            lgEMailNrAdresse(lgE) = r!NrAdresse
            Select Case r!ArtAdresse
            Case "Herr"
                lgH = lgH + 1
            Case "Frau"
                lgF = lgF + 1
            End Select
        r.MoveNext
        Wend
    End If
    strAnredeEmail = "Sehr geehrte Damen und Herren"
    If lgG = lgH Then
        strAnredeEmail = "Sehr geehrte Herren"
    End If
    If lgG = lgF Then
        strAnredeEmail = "Sehr geehrte Damen"
    End If
    OH_ResetRS r
    generateEmailListe = lgE
    If lgE = 0 Then
        MsgBox "Keine Email-Adressen zu finden", vbCritical, "EMAIL"
    End If

End Function
Public Function OH_setPrinter(rpt As Report, _
                              lgReportNr As Long, _
                              Optional lgPrn As Long, _
                              Optional strFrm As String) As Boolean
On Error GoTo ErrMsg
    'Festlegen des Druckers für den Ausdruck
    'Erwartet wird als Parameter die im System verwendete
    'Bezeichnung des Druckers
    'Rückgabewert: True  = OK
    '              False = Drucker nicht gefunden
    Dim lgPaperbin As Long
    Dim lgCopies As Long
    Dim lgQK As Long
    Dim strQK As String
    Dim rP As ADODB.Recordset
    Dim N As Integer
    Dim strf As String
    Dim strP As String
    Dim strE As String
    Dim frmP As Form
    Dim prn As Printer
    OH_setPrinter = False
    lgPaperbin = 1
    lgCopies = 1
    strDefaultPrinter = Application.Printer.DeviceName
    Select Case lgReportNr
    Case 103, 110 'PDF über Mailer
        OH_setPrinter = True
        strP = "PDF"
        GoTo ErrEnd
    Case 0
    Case Else
        strSQL = "Exec dbo.spA_Stichwort " & _
                " @id = " & lgReportNr & ", " & _
                " @st = 19"
        OH_r rP
        If Not rP.EOF Then '120123
            strP = rP!Drucker
            lgPaperbin = Val(rP!Fach)
            lgCopies = Val(rP!Kopie)
            strQK = Nz(rP!QK)
        End If
        Select Case rpt.Name
        Case glstrB_VG
            If strFrm = "" Then
                Set frmP = Forms!F_VG
                lgQK = Forms!F_VG!NrQK
                If strQK <> "" Then
                    If InStr(strQK, lgQK) = 0 Then
                        SysCmd acSysCmdSetStatus, "Printer: " & strDefaultPrinter & " Fach " & lgPaperbin & "  Kopien: " & lgCopies
                        GoTo ErrEnd
                    End If
                End If
            End If
        End Select
    End Select
    If lgReportNr > 100 Then
        If strP <> "" Then
            For Each prn In Application.Printers
                If InStr(prn.DeviceName, strP) > 0 Then
                    OH_setPrinter = True
                    Exit For
                End If
            Next prn
            If OH_setPrinter = False Then
                s = "Hinweis: der Drucker" & _
                    vbNewLine & vbNewLine & strP & vbNewLine & vbNewLine & _
                    "ist nicht zu finden!" & vbNewLine & vbNewLine & _
                    "Der Standard-Drucker " & strDefaultPrinter & " wird verwendet!"
                If MsgBox(s, vbOKCancel + vbInformation, t) = vbCancel Then
                    GoTo ErrEnd
                End If
                Set prn = Application.Printer
            End If
            rpt.Printer = prn
            If prn.PaperBin <> lgPaperbin And lgPaperbin > 0 Then
                prn.PaperBin = lgPaperbin
            End If
            If prn.Copies <> lgCopies And lgCopies > 0 Then
                prn.Copies = lgCopies
            End If
            SysCmd acSysCmdSetStatus, "Printer: " & strP & " Fach " & prn.PaperBin & "  Kopien: " & prn.Copies
        Else
            OH_setPrinter = True
        End If
    Else
        Set prn = Printers(lgPrn)
        If InStr(rpt.Name, "Quer") > 0 Then
            prn.Orientation = acPRORLandscape
        End If
        rpt.Printer = prn
        OH_setPrinter = True
    End If
ErrEnd:
    OH_ResetRS rP
    Exit Function
ErrMsg:
    Select Case Err
    Case 5
        SysCmd acSysCmdSetStatus, strP & " ==> Drucker kann in dieser Access-Version nicht so eingestellt werden!"
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_setPrinter"
        Resume ErrEnd
    End Select
ErrM:
    MsgBox s, vbCritical, "Setze den Drucker"
    GoTo ErrEnd
End Function
Public Function OH_CheckB_VG() As Boolean
On Error GoTo ErrMsg
    Dim strHinweis As String
    Dim strUstID As String
    Dim strXX As String
    Dim lgFirma As Long
    '110905 // <R137>
    t = "Diverse Checks beim Ausdrucken"
    Set f = Forms!F_VG
    OH_CheckB_VG = True
    'nur kontrollieren am gleichen Tag des Updates
    If DateDiff("d", f!LastUpdate, Date) > 0 Then
        GoTo ErrEnd
    End If
    strSQL = "Exec dbo.spa_VG " & _
            " @x = 'CheckB_VG', " & _
            " @i = " & f!NrVG
    OH_r r
    strHinweis = Nz(r!Msg, "")
    If strHinweis <> "" Then
        s = r!Msg & vbNewLine & vbNewLine & _
            "JA" & vbTab & "dennoch starten?" & vbNewLine & _
            "Nein" & vbTab & "Abbrechen"
        i = MsgBox(s, vbQuestion + vbYesNo + vbDefaultButton2, t)
        If i = vbNo Then
            OH_CheckB_VG = False
            GoTo ErrEnd
        End If
    End If
    strUstID = r!USTID
    lgFirma = r!NrFirma
    If Len(strUstID) > 2 Then
        If Not OH_CheckUSTID(lgFirma, strUstID, False, True) Then '250717 '210303
            t = "Prüfung der USt-Id NICHT ERFOLGREICH"
            s = "Unklarheiten mit " & strUstID & vbNewLine & vbNewLine & _
                "Dennoch weiterfahren?"
            If MsgBox(s, vbCritical + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                OH_CheckB_VG = False
                GoTo ErrEnd
            End If
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CheckB_VG"
    Resume ErrEnd
End Function
Public Function OH_MailDocument(frmP As Form, _
                                strAttach As String, _
                                Optional strBody As String, _
                                Optional strB2bFolder As String, _
                                Optional lgSendMail As Long = 0) As Boolean
On Error GoTo ErrMsg
    Dim N As Long
    Dim strAttaches As String
    Dim strAtt() As String
    Dim strBetreff As String
    Dim strAbsender As String
    If strEmail = "" Then
        strEmail = Nz(frmP!EMail, "")
    End If
    strSQL = "Exec dbo.spI_Print " & _
           " @x = 'MailCC' " & _
           ", @i = " & frmP!NrVG & _
           ", @a = " & lguser
    OH_r r
    strCC = Nz(r!CC, "")
    strBCC = Nz(r!bcc, "")
    If strBody = "" Then
        strBody = Nz(r!body, "")
    End If
    strBody = OH_rtf2html3(strBody)

    strAbsender = Nz(r!Absender, "")
    strBetreff = Nz(r!Betreff, "")
    strA(1) = Nz(r!Anrede, "")
    'Signatur holen
    'wenn man mit jemanden per Du ist, soll man bei einem Email entscheiden können, wie die Anrede erfolgen soll
    N = frmP!NrFunktion
    Select Case frmP!NrQK
    Case 30
        strSQL = "Exec spa_VG " & _
             "@x = 'Bestellt von Bestätigung'" & _
            ", @i = " & frmP!NrVG
        OH_r r
        If Not r.BOF Then
            If strA(1) <> "" Then
                strA(3) = Nz(r!Anrede, "Anrede fehlt!")
            End If
            strA(2) = "Bestellt von " & r!namen & vbNewLine & _
                    "Soll die Auftrags-Bestätigung an den Besteller geschickt werden?"
            i = MsgBox(strA(2), vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            Case vbYes
                strA(1) = strA(3)
                N = r!ID
                If strCC = "" Then '180623
                    strCC = strEmail
                Else
                    If InStr(strCC, strEmail) = 0 Then
                        strCC = strCC & ";" & strEmail
                    End If
                End If
                strEmail = r!EMail
            End Select
        End If
    End Select
    '180429 Automatische Attachments (siehe Beschreibung "Beilagen in Vorgängen.docx")
    '221106 <R202> Standard-Attachments pro Vorgang (siehe Beschreibung "Standard-Beilagen zu Vorgängen.docx")
    strAttaches = strAttach '180430
    strSQL = "Exec dbo.spA_B_VG @x = 'Attachment'"
    OH_r r
    If Not r.BOF Then
        If strAttach = "" Then
            strAttaches = r!Attachment
        Else
            strAttaches = strAttach & ";" & r!Attachment
        End If
'        If R!Addtobody <> "" Then  'ULI will das nicht
'            strBody = strBody & "<br>" & R!Addtobody
'        End If
    End If
    If strAttaches <> "" Then 'Gibt's die Files??
        strAtt = Split(strAttaches, ";")
        For N = 0 To UBound(strAtt)
            If Len(Dir(strAtt(N))) = 0 Then
                t = "Kontrolle der Attachments"
                s = "Beilage" & vbNewLine & strAtt(N) & vbNewLine & _
                    "EXISITIERT NICHT!"
                MsgBox s, vbInformation, t
                strAttaches = Replace(strAttaches, strAtt(N), "")
            End If
        Next N
    End If
    '251209 gibt es das Textfeld Versnadart mit Mail-Adressee?
    strSQL = "Select txt,txtv from A_txtVG " & _
        " where txt in('Versandart') " & _
        " and charindex('@',txtv)>0 and NrVG = " & frmP!NrVG
    OH_r r
    If Not r.BOF Then
        strEmail = r!txtV
        i = InStr(strEmail, "@")
        For N = i - 1 To 1 Step -1      '20180212: Emailadresse kann aus nur einem Zeichen vor dem @ bestehen. i - 2 geändert in i -1
            If Mid(strEmail, N, 1) = " " Or N = 0 Then
                strEmail = Trim(Mid(strEmail, N))
                strEmail = Replace(strEmail, " ", "")
                strEmail = Replace(strEmail, ",", ";")
                Exit For
            End If
        Next N
    End If

    OH_MailDocument = OH_OutlookMail _
        (strEmail, _
         strBetreff, _
        strBody, _
        N, _
        strAttaches, _
        strCC, _
        lgSendMail, _
        strBCC, _
        Nz(frmP!OutlookVorlage, ""), _
        frmP, _
        strAbsender, _
        strA(1), _
        strB2bFolder)
    DoEvents
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_MailDocument"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
End Function
