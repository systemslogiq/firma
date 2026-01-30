Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim varOldTelefon
Dim varOldFax
Dim varOldeMail
Dim varOldInternet
Dim varOldMobil
Dim strFilterExplorer As String
Dim lgVGActVorgabe As Long
Dim blCWichtigeInfo As Boolean
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    'OH_ReSizeForm Me
    OH_FormHeight Me
    OH_ControlTiptext Me
    Me!txtMemo.Value = vbNullString
    OH_A "lstTxtMemo", , Me
    OH_A "lstTopA", , Me
    OH_A "lstOrder", , Me
    OH_A "lstAktiv", , Me
    OH_A "lstFeld", , Me
    OH_A "lstA", , Me
    OH_A "lstV", , Me
    OH_A "comAnredeWie", , Me
    OH_A "comArtZuord", , Me
    lstTopA_AfterUpdate
    s = "Dieser Text wird als <Betreff> aufgenommen!" & vbNewLine & _
        "Doppel-Klick trägt <Bitte um Rückruf ein>"
    Me!StandardText.ControlTipText = s
    s = "Filtern nach Zuordnungen (siehe <Kontakte>)!" & vbNewLine & _
        "Doppel-Klick entfernt das Suchkriteium"
    Me!comArtZuord.ControlTipText = s
    s = "Filtern nach Feldern!"
    Me!lstfeld.ControlTipText = s
    s = "Anzeige wichtiger Infos pro Adresse" & vbNewLine & _
        "Zum Erfassen / Ändern / Löschen"
    s = "Handling zum Filtern der Stichworte" & vbNewLine & _
        "Doppelklick entfernt / setzt Filter." & vbNewLine & _
        "Wenn ein Filter gesetzt ist , erscheint ein Grüner Rand!"
    Me!comStichwortFilter.ControlTipText = s
    s = "Handling der (markierten) Stichworte" & vbNewLine & _
        "Oft benutzte Stichworte im Lexikon ablegen in Gruppe <Stichworte Adresse>" & vbNewLine & _
        "ALLE mit einem <X> in <Bedingung1> werden automitsch hinzugefügt."
    Me!lstStichwortAct.ControlTipText = s
    OH_SetFontRT Me!txtMemo
    OH_SetFontRT Me!BemFunktion
    OH_SetFontRT Me!BemAdresse
    OH_SetFontRT Me!wichtigeInfo
    OH_A "@x = '+Standardregister Adresse',@u = " & lguser, , Me
    OH_r r
    Me.regd = r!Default
    OH_A "lstStichwortGr", , Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_Current()  '<R98>
On Error GoTo ErrMsg
'Loop through all files in a folder
    If Me.RecordSource = "" Then
        GoTo ErrEnd
    End If
    Me.Caption = "Adresse " & Me!namen
    Me!RegMain.Visible = True
    Me!regd.Visible = True
    If glPersonaladministration = 1 Then
        If Me!NrAdrZuord = EFNr Then
            Me!RegMain.Visible = False
            Me!regd.Visible = False
            Me!txtWichtigeInfos.Visible = False
            Me!Pic.Visible = False
            Me!lstPic.Visible = False
            Me.Caption = Me!namen & " Aus Datenschutz-Gründen NICHT einsehbar!"
            GoTo ErrEnd
        End If
    End If
    OH_A "@x ='lstPicture'" & _
        ", @a = 1 " & _
        ", @i = " & Nz(Me!NrFunktion, 0), , Me
    OH_A "lstPic", strSQL, Me
    If Me!lstPic.ListCount = 0 Then
        Me!lstPic.Visible = False
        Me!Pic.Visible = False
        Me!Pic.picture = ""
    Else
        Me!lstPic.Visible = True
        Me!Pic.Visible = True
        Me!lstPic = Me!lstPic.column(0, 0)
        lstPic_AfterUpdate
    End If
    'OH201210 Artikel-Page soll nur bei Firmen gezeigt werden
    Me.PageArtikel.Visible = Me!FP <> 0
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_Current"
    Resume ErrEnd
End Sub
Private Sub ArtAdresse_Enter()
On Error GoTo ErrMsg
    OH_A "ArtAdresse", , Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.ArtAdresse_Enter"
    Resume ErrEnd
End Sub
Private Sub BemAdresse_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_RT Me!BemAdresse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.BemAdresse_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnBemFunktion_Click()
On Error GoTo ErrMsg
    OH_RT Me!BemFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnBemFunktion_Click"
    Resume ErrEnd
End Sub
Private Sub BemFunktion_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_RT Me!BemFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.BemFunktion_DblClick"
    Resume ErrEnd
End Sub
Private Sub comEmail_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_CB Me!comEmail
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.comEmail_DblClick"
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstA_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstA = 0
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.countRec_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strQ As String
    Dim strA As String
    Dim strN As String
    Dim strS As String
    Dim strf As String
    Dim strT As String
    Dim lgA As Long
    Dim lgAA(1 To 2) As Long
    Dim lgNA(1 To 2) As Long
    Dim strhelp As String
    Dim vararray As Variant
    Dim strX(1 To 3) As String
    DoCmd.Hourglass True
    lgA = Nz(Me!lstact, 10)
    t = Nz(Me!lstact.column(1))
    strT = t
    OH_A "@x = 'lstact'" & _
        ", @i = " & Me!NrFunktion & _
        ", @a = " & lgA
    strQ = strSQL
    Select Case lgA
    Case 12
       DoCmd.openForm "pfrmAdresseCheck"
    Case 19 '171107 neuer Standort erfassen können, EO
        s = "bitte korrigieren Sie unten ggf. den Firmen-Namen"
        t = "neuer Standort / Niederlassung für " & Me!Nachname
        s = InputBox(s, t, Me!Nachname)
        DoCmd.Hourglass True
        If s = "" Then
            GoTo ErrEnd
        End If
        If Len(s) < 4 Then
            s = s & "   ist keine korrekte Eingabe!" & vbNewLine & _
                    "Sie müssen mehr als 3 Buchstaben eingeben"
            GoTo ErrM
        End If
        strSQL = strQ & _
                ", @f = '" & s & _
                "',@b = " & Me!NrAdrZuord & _
                ",@n = " & Me!NrFunktion
        OH_r r
        If r!ID > 0 Then
            s = r!mldg
            Me!txtFind = s
            txtFind_AfterUpdate
            GoTo ErrM
        End If
        i = r!CT
        If i > 0 Then
            s = "Sollen die Stichworte (" & i & " ) kopiert werden?" & vbNewLine & vbNewLine & _
                "JA" & vbTab & "Kopieren" & vbNewLine & _
                "Nein" & vbTab & "NICHT Kopieren"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
            If i = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        strSQL = strSQL & _
                ",@z = " & i
        OH_r r
        s = r!mldg
        If s = "OK" Then
            OH_OF "F_Adresse", r!ID
            s = "bitte aktualisieren Sie die Standortdaten wie Strasse, Ort, Telefon, etc."
            MsgBox s, vbInformation, t
            Me!Strasse.SetFocus
        End If
    Case 24 'Neue Abteilung
        s = "bitte geben Sie unten die Abteilungsbezeichnung ein"
        t = "neue Abteilung für " & Me!Nachname
        s = InputBox(s, t)
        DoCmd.Hourglass True
        If s = "" Then
            GoTo ErrEnd
        End If
        If Len(s) < 5 Then
            s = s & "   ist keine korrekte Einagbe!" & vbNewLine & _
                    "Sie müssen mehr als 4 Buchstaben eingeben"
            GoTo ErrM
        End If
        strSQL = strQ & _
                ", @f = '" & s & _
                "',@b = " & Me!NrAdrZuord
        OH_r r
        If r!mldg <> "" Then
            s = r!mldg
            GoTo ErrM
        End If
        OH_OF "F_Adresse", r!ID
    Case 25 'Funktion <Privat> von
        strSQL = strQ & _
            ", @b = " & Me!IDAdresse
        OH_r r
        s = r!Msg
        Select Case r!x
        Case 1, 4
            If r!x = 1 Then
                s = s & vbNewLine & _
                    "Private Funktion anzeigen?"
                If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                    OH_OF "F_Adresse", r!ID
                End If
            Else
                s = s & vbNewLine & _
                    "JA" & vbTab & "Private Funktion anzeigen?" & vbNewLine & _
                    "NEIN" & vbTab & "Umwandeln in privat = " & Me!namen
                i = MsgBox(s, vbQuestion + vbDefaultButton3 + vbYesNoCancel, t)
                Select Case i
                Case vbCancel
                    GoTo ErrEnd
                Case vbNo
                    strSQL = strSQL & _
                        ", @n = 1"
                    OH_EX
                    OH_OF "F_Adresse", Me!IDAdresse
                End Select
            End If
            GoTo ErrEnd
        End Select
        s = "Möchten Sie für <" & Me!namen & ">" & vbNewLine & _
            "private Daten (Funktion = privat) erfassen?"
        If r!x = 2 Then
            i = MsgBox(s, vbOKCancel + vbQuestion, t)
        End If
        If r!x = 3 Then
            s = s & vbNewLine & vbNewLine & _
                "JA" & vbTab & "incl. " & r!ID & " Stichwort(e)" & vbNewLine & _
                "NEIN" & vbTab & "Ohne Stichworte"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
        End If
        If i = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strSQL & _
            ", @n = " & i
        OH_r r
        strf = r!Msg
        OH_OF "F_Adresse", r!ID
        If strf <> "OK" Then
            s = strf
            GoTo ErrM
        End If
    Case 28 'Firmenwechsel
        OH_Navigator 90
    Case 29 'gleiche Anschrift wie...
        OH_Navigator 100
    Case Is < 30
        OH_New
        If OH_isloaded("PF_neuAdresse") Then
            Set frm = Forms!PF_NeuAdresse
            t = Nz(Me!lstact.column(1))
            frm.Caption = t
            Select Case lgA
            Case 10 'neue Firma
                frm!lstActNeu = 10
            Case 11
                frm!lstActNeu = 11 'Neue Firma und Mitarbeiter..'
            Case 20 ' - Kollege/in von '
                frm!lstActNeu = 11
                frm.lstActNeu_AfterUpdate
                OH_A "@x = 'lstActNeu'" & _
                    ",@a = 13" & _
                    ",@i = " & Me!NrAdrZuord, , Me
                OH_r r
                If r.BOF Then
                    s = "KEINE Firma erkannt"
                    DoCmd.Close acForm, "PF_neuAdresse"
                    GoTo ErrM
                End If
                frm!NrFunktion = r!NrFunktion
                frm!Nachname = r!Nachname
                frm!Nachname1.SetFocus
                GoTo ErrEnd
            Case 22 ' - Mitarbeiter/in von '
                frm!lstActNeu = 11
                frm.lstActNeu_AfterUpdate
                frm!NrFunktion = Me!NrFunktion
                frm!Nachname = Me!Nachname
                frm!Nachname1.SetFocus
                GoTo ErrEnd
            Case 26 ' - (Ehe)-Partner '
                frm!lstActNeu = lgA + 4
                frm.lstActNeu_AfterUpdate
                If Me!ArtAdresse = "Herr" Then
                    frm!NrFunktion = Me!NrFunktion
                    frm!Nachname = Me!Nachname
                    frm!Vorname = Me!Vorname
                    frm!Nachname1.SetFocus
                    frm!btnSuch1.Visible = True
                Else
                    frm!NrFunktion1 = Me!NrFunktion
                    frm!Nachname1 = Me!Nachname
                    frm!vorname1 = Me!Vorname
                    frm!Nachname.SetFocus
                    frm!btnSuch.Visible = True
                End If
                GoTo ErrEnd
            End Select
            frm!btnOK.SetFocus
            frm.lstActNeu_AfterUpdate
        End If
    Case 31
        Me!lstExplorer.SetFocus
    Case 32
        OH_A "@x = 'AnzahlVG', " & _
            " @i = " & Me!NrFunktion
        OH_r r
        If r!CT > 0 Then
            s = "Drucke Adress-Info" & vbNewLine & vbNewLine & _
                    "JA" & vbTab & "mit Vorgängen (" & r!CT & ")" & vbNewLine & _
                    "Nein" & vbTab & "ohne Vorgänge"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, "INFO zu Adresse " & Me!namen)
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            Case vbYes
                Me!StandardText = "Adress-Infos mit Vorgängen"
            Case vbNo
                Me!StandardText = "Adress-Infos OHNE Vorgänge"
            End Select
        End If
        strMSG(4) = Nz(Me!StandardText, "kein Standardtext") '110608
        OH_PrintReport Me, 1, "B_Info", Nz(Me!StandardText, "")
    Case 33
        t = t & " " & Me.pageFunktion.Caption
        strSQL = "Exec dbo.spa_Adresse " & _
                " @x = 'AdressInfos', " & _
                " @i = " & Me!NrFunktion
        OH_r r
        s = r!AdressInfos
        OH_CB s
        MsgBox s & vbNewLine & vbNewLine & " wurde in den Zwischenspeicher kopiert", _
            vbInformation, t
        GoTo ErrEnd
    Case 34
        t = "Bilder zu " & Me!Vorname & " " & Me!Nachname
        OH_A "@x = 'ZeigeBilder', " & _
            " @i = " & Me!NrFunktion
        OH_r r
        If r.BOF Then
            i = MsgBox("Kein Bild (gif, png, bmp, jpg, pdf) hinterlegt!" & vbNewLine & vbNewLine & _
                    "Wenn Sie ein Bild als Hyperlink hinzufügen wollen," & vbNewLine & _
                    "können Sie jetzt unter >Stichworten< einen neuen Eintrag erstellen!", _
                    vbQuestion + vbOKCancel + vbDefaultButton2, t)
            If i = vbOK Then
                OH_OpenStichwort Me
                Forms!PF_Stichwort!UF_Stichwort.SetFocus
                Forms!PF_Stichwort!UF_Stichwort.Form!btnNeu.SetFocus
            End If
        Else
            While Not r.EOF
                strf = OH_HyperlinkPartAddress(r!StichwortHyperlink)
                FollowHyperlink strf
            r.MoveNext
            Wend
        End If
    Case 35
        Me!lstWvAct = 10
        lstWvAct_AfterUpdate
    Case 36
        strSQL = "Exec dbo.spA_Adresse " & _
            " @x = 'Mailadressen' " & _
            ",@i = " & Me!NrAdrZuord
        OH_r r
        s = r!mails
        OH_CB s
        MsgBox Replace(s, ";", vbNewLine), vbExclamation, t
    Case 37  'Web-Suche  <R103>
        If Me!ArtAdresse = "Firma" Then
            strS = Me!Nachname & " " & Me!Ort
        Else
            strS = Me!Vorname & " " & Me!Nachname
            strS = "%22" & strS & "%22"
       End If
        OH_LaunchURL 1, "http://www.google.de/search?q=" + strS
    Case 40
        i = Nz(Me!CounterFunktion, 0)
        s = Me!Vorname & " " & Me!Nachname & vbNewLine & _
            "wurde bisher " & i & " angewählt." & vbNewLine & vbNewLine & _
            "Um die Sortierung zu beeinflussen, könnnen Sie jetzt eine andere Zahl eingeben!"
        s = InputBox(s, t, 0)
        If s = "" Then
            GoTo ErrEnd
        End If
        i = Val(s)
        strSQL = "Exec dbo.spA_Adresse " & _
            " @x = 'CountAction' " & _
            ",@i = " & Me!NrFunktion & _
            ",@a = 1 " & _
            ",@b = " & i
        OH_EX
        OH_RQf Me
    Case 50, 51, 52
        Select Case lgA
        Case 51
            s = "Warum inaktiv setzen?" & vbNewLine
            strMSG(1) = "hat Firma verlassen"
            strMSG(2) = "hat Firma gewechselt"
            strMSG(3) = "wurde pensioniert"
            strMSG(4) = "inaktiv nach DSVGO"
            strMSG(5) = "Email failed"
            strMSG(6) = "gestorben"
            For i = 1 To 6
                s = s & vbNewLine & _
                        i & vbTab & strMSG(i)
            Next i
            s = s & vbNewLine & vbNewLine & _
                    "Bitte eine der Zahlen 1 bis 7 eingeben" & _
                    vbNewLine & "(ggf. mit Bemerkung z.b. <5 Geburtstag>)" & _
                    vbNewLine & vbNewLine & "oder eine andere Begründung eingeben..."
            strS = InputBox(s, Me!namen & " INAKTIV??", 1)
            If strS = "" Then
                GoTo ErrEnd
            End If
            i = Val(strS)
            If i > 0 And i < 7 Then
                strS = strMSG(i) & " " & Replace(strS, i, "")
            End If
        Case 52
            If IsNull(Me!EndeFunktion) = True Then
                s = "Adresse ist doch noch aktiv!=!!?"
                GoTo ErrM
            End If
        End Select
        DoCmd.Hourglass True
        strSQL = Me!lstact.Recordset.Source & _
                ", @a = " & lgA & _
                ", @o = '" & strS & "'"
        OH_EX
        OH_RQf Me
        regMain_Change
        Me!EndeFunktion.BackColor = vbYellow
    Case 53
        t = Me!lstact.column(1)
        s = "Hiermit können Sie ALLE Adressen INAKTIV setzen," & vbNewLine & _
         "die seit X Jahren nicht mehr benutzt oder geändert wurden." & vbNewLine & vbNewLine & _
         "Geben Sie unten die Jahre ein (Vorschlag = 10)"
        i = Val(InputBox(s, t, 10))
        Select Case i
        Case 1, 2, 3, 4, 5
            s = "Bitte bestätigen Sie, dass Sie alle Adressen inaktiv setzen wollen, " & vbNewLine & _
            "die seit " & i & " Jahren nicht mehr benutzt wurden!!"
            If MsgBox(s & vbNewLine & vbNewLine & _
                    "Anschliessend folgt eine weitere Sicherheitsabfrage", vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        Case Is > 5
        Case Else
            GoTo ErrEnd
        End Select
        DoCmd.Hourglass True
        strSQL = Me!lstact.Recordset.Source & _
                ",@a = " & lgA & _
                ",@m = " & i
        OH_r r
        i = r!CT
        Select Case i
        Case 0
            s = s & vbNewLine & vbNewLine & _
                "Keine Adressen gefunden!"
            GoTo ErrM
        Case 1
        Case Else
            s = s & vbNewLine & vbNewLine & _
                i & " Adressen werden jetzt INAKTIV gesetzt!"
            If MsgBox(s, vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End Select
        strSQL = strSQL & ",@z = " & i
        OH_EX
        OH_RQf Me
    Case 54
        s = "Für uns nicht mehr zuständig"
        DoCmd.Hourglass True
        strSQL = Me!lstact.Recordset.Source & _
                ",@a = " & lgA & _
                ",@s = '" & strUserKZ & _
                "',@o = '" & s & "'"
        OH_EX
        OH_RQf Me
    Case 70 'Ersetze eine Adresse durch eine andere 241004
        strSQL = strQ
        OH_r r
        i = 0
        While Not r.EOF
            lgNA(1) = r!ID
            lgNA(2) = r!FP
            strN = r!namen
            i = i + 1
            r.MoveNext
        Wend
        lgAA(1) = Me!NrFunktion
        lgAA(2) = Me!FP
        strA = Me!namen
        strhelp = "So funktioniert das Ersetzen: " & vbNewLine & vbNewLine & _
                "(siehe auch Wordfile <Adressen bereinigen.docx> vom 04.10.2024)" & vbNewLine & _
              "1. Entfernen Sie alle Marker" & vbNewLine & _
              "2. Markieren Sie die künftig gültige Adresse" & vbNewLine & _
              "3. Gehen Sie zur ''ungültigen''  Adresse, deren Daten Sie ersetzen wollen" & vbNewLine & _
              "4. WICHTIG: Sie können nur Firmen durch Firmen oder Personen durch Personen ersetzen" & vbNewLine & _
              "5. Starten Sie hier noch einmal" & vbNewLine & vbNewLine

        If i <> 1 Or lgAA(1) <> Me!NrFunktion Or lgAA(2) <> lgNA(2) Or lgAA(1) = lgNA(1) Then
            s = ""
            If lgAA(1) = lgNA(1) Then
                s = "Bitte eine andere Adresse auswählen, da die Adressen identisch sind."
            End If
            If lgAA(2) <> lgNA(2) Then
                s = 4
            End If
            If lgNA(1) <> Me!NrFunktion Then
                s = 3
            End If
            If lgAA(1) = 0 Then
                s = 2
            End If
            If i <> 1 Then
                s = "Sie haben " & i & " Adressen markiert statt EINER, Regel 1/2 verletzt!"
            End If
            If Len(s) = 1 Then
                s = "Sie haben Regel " & s & " verletzt!"
            End If
            If s <> "" Then
                s = s & vbNewLine & vbNewLine & strhelp
                GoTo ErrM
            End If
        End If
        strQ = strQ & _
            ",@n = " & lgNA(1) & _
            ",@m = "
        strSQL = strQ & "1"
        OH_r r
        s = r!Msg
        If r!OK = 0 Then
            GoTo ErrM
        End If
        i = r!Anzahl
       s = "Sie sind sich sicher, dass Sie Daten von" & vbNewLine & vbNewLine & _
            strA & "   ID = " & lgAA(1) & " (grünes Feld)" & vbNewLine & vbNewLine & _
            "verschieben wollen auf" & vbNewLine & vbNewLine & _
            strN & "   ID = " & lgNA(1) & vbNewLine & vbNewLine & _
            "Anzahl Funktionalitäten" & vbNewLine & _
            "========================" & vbNewLine & _
            r!Msg
        strX(1) = "Daten verschieben / Inaktiv setzen" & vbNewLine & left(strA, 50)
        strX(2) = "Daten verschieben / Löschen" & vbNewLine & left(strA, 50)
        strX(3) = "nicht verschieben / Anzeigen" & vbNewLine & left(strN, 50)
        vararray = Array(strX(1), strX(2), strX(3))
        OH_msgbox s, vararray, vbQuestion, t, strhelp
        Select Case strMSG(2)
        Case "", "Abbrechen"
            GoTo ErrEnd
        Case strX(1)
            strSQL = strQ & "2"
        Case strX(2)
            strSQL = strQ & "3"
        Case strX(3)
            OH_OF "F_Adresse", lgNA(1)
            GoTo ErrEnd
        End Select
        DoCmd.Hourglass True
        OH_r r
        s = r!Msg
        If left(s, 2) = "ok" Then
            txtFind_AfterUpdate
            Me!lstDet = lgNA(1)
            OH_OF "F_Adresse", lgNA(1)
        Else
            s = "Aktion ist fehlgeschlagen; bitte Info an ADMIN!" & vbNewLine & s
            GoTo ErrM
        End If
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstact_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub

Private Sub lstDet_GotFocus()
    OH_SaveRS Me, True
End Sub
Private Sub lstExplorer_dblclick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstExplorerAct = 19
    lstExplorerAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstExplorer_dblclick"
    Resume ErrEnd
End Sub
Private Sub lstKontaktActA_AfterUpdate()
    regD_Change
End Sub
Private Sub lstM_DblClick(Cancel As Integer)
    OH_NoDblClick True
End Sub

Private Sub lstPic_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    strf = Nz(Me!lstPic, "")
    Me!Pic.picture = strf
ErrEnd:
    Exit Sub
ErrMsg:
    SysCmd acSysCmdSetStatus, "Bild_Anzeige Fehler: " & strf
    Me!Pic.picture = ""
    Resume ErrEnd
End Sub

Private Sub lstPicture_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    i = Val(Nz(Me!lstPicture.column(1), -1))
    t = "Funktionalität Bilder zu Adressen"
    Select Case i
    Case -1
        s = "Gruppe = 'Database' und Begriff = 'Ordner Bilder'" & vbNewLine & vbNewLine & _
            "Dieser Eintrag fehlt Ihnen im Lexikon."
        t = "Admin: Bilder-Ablage??, PHILIPP fragen"
        GoTo ErrM
    Case 0
        strf = Me!lstPicture.column(2)
        s = strf & vbNewLine & vbNewLine & _
        "In diesem Ordner können Sie Bilder hinterlegen." & vbNewLine & _
        "Wenn der Filename mit dem Nachname gefolgt vom Vorname beginnt, wird das Bild hier angezeigt" & vbNewLine & vbNewLine & _
        "Soll der Ordner geöffnet werden?"
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
            OH_LaunchFolder 1, strf
        End If
    Case Else
        Select Case right(Me!lstPicture, 3)
        Case "PDF"
            OH_LaunchDocument 1, Nz(Me!lstPicture, "KEIN FILE")
        Case Else
            Me!picture.picture = Me!lstPicture
        End Select
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstPicture_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstPicture_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_LaunchDocument 1, Nz(Me!lstPicture, "KEIN FILE")
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstPicture_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstPictureAct_Afterupdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    Dim strExt As String
    Dim strQ As String
    Dim strN As String
    Dim strFO As String
    Dim strFoS As String
    Dim strB As String
    Dim strFN As String
    DoCmd.Hourglass True
    s = Me!lstPicture.column(2, 1)
    t = Nz(Me!lstPictureAct.column(1), "")
    If left(s, 3) = "Im " Then
        GoTo ErrM
    End If
    OH_A "@x = 'lstPictureAct'" & _
                ",@a = " & Me!lstPictureAct & _
                ",@i = " & Me!IDAdresse, , Me
    strQ = strSQL
    lgact = Val(Nz(Me!lstPictureAct, 0))
    Select Case lgact
    Case 10
        lstPicture_DblClick (0)
    Case 20 'Markiertes Bild zuordnen'
        strB = Me!lstPicture.column(2, 1)
        If Len(Dir(strB, vbDirectory)) = 0 Then
            s = "Es ist kein Bilderordner hinterlegt"
            GoTo ErrM
        End If
        If OH_GetSelectedFilesInWinExplorers(Me!NrFunktion, 0) = 0 Then
            GoTo ErrEnd
        End If
        OH_r r, strQ
        If r.BOF Then
            s = "Keine Datei markiert"
            GoTo ErrM
        End If
        strFO = r!FileN
        strN = r!nv
        strExt = r!ext
        strFoS = r!FileNS
        If left(strFoS, Len(strN)) = strN Then
            strFN = strB & strFoS
        Else
            strFN = strB & strN + strExt
        End If
        i = 0
        While Len(Dir(strFN)) > 0
            i = i + 1
            strFN = strB & strN & "_" & i & strExt
        Wend
        s = strFO & vbNewLine & vbNewLine & _
            "File wird jetzt so zugeordnet zu" & vbNewLine & _
            strN & vbNewLine & _
            strB
        If r!ispicture = 0 Then
            s = s & vbNewLine & vbNewLine & _
                "Hinweis: es handelt sich nicht um ein Bild und kann deswegen links nicht angezeigt werden!"
        End If
        strFN = InputBox(s, t, strFN)
        If strFN = "" Then
            GoTo ErrEnd
        End If
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
            FileCopy strFO, strFN
            regD_Change
        End If
    Case 30
        s = Me!Nachname & " " & Me!Vorname & " " & Year(Date)
        s = InputBox("dieser Vorschlag als Bildname wird in die Zwischenablage kopiert", t, s)
        If s <> "" Then
            OH_A "@x = 'PictureFolder'"
            OH_r r
            s = r!PictureFolder & s
            OH_CB s
        End If
    Case 40
        strFN = Nz(Me!lstPicture.column(0))
        If Len(Dir(strFN)) = 0 Then
            s = "Bitte ein bestehendes File markieren"
        Else
            s = strFN & vbNewLine & vbNewLine & _
                "File löschen?"
            If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbOK Then
                OH_KILL strFN
                OH_RQ Me!lstPicture
            End If
        End If
    Case 50, 51
        If lgact = 50 Then
            strFO = Nz(Me!lstPicture.column(0))
        Else
            If OH_GetSelectedFilesInWinExplorers(Me!NrFunktion, 0) = 0 Then
                GoTo ErrEnd
            End If
            OH_r r, strQ
            If r.BOF Then
                s = "Keine Datei markiert"
                GoTo ErrM
            End If
            strFO = r!FileN
        End If
        If Len(Dir(strFO)) > 0 Then
            strB = OH_GetPathPart(strFO)
            strFO = OH_GetNamePart(strFO)
            strSQL = "execute dbo.usp_Image " & _
                    "@x = 'Import' " & _
                    ",@PicName = '" & strFO & _
                    "',@ImageFolderPath = '" & strB & _
                    "',@Filename = '" & strFO & _
                    "',@i = " & Me!IDAdresse & _
                    ",@d = 'NrADresse'"
            OH_EX
        End If
    Case 52
        OH_r r, strQ
        strB = glstrTempPath
        While Not r.EOF
            strSQL = "execute dbo.usp_Image " & _
                    "@x = 'Export' " & _
                    ",@ImageFolderPath = '" & strB & _
                    "',@i = " & r!NrPicture
            OH_r rs
            If rs.BOF = False Then
                OH_LaunchDocument 2, rs!Filename
            End If
            r.MoveNext
        Wend
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstPictureAct_Afterupdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnAdrSecurity_Click()
On Error GoTo ErrMsg
    oh_AdrSecurityMldg
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnAdrSecurity_Click"
    Resume ErrEnd
End Sub
Private Sub btnBauBuero_Click() 'alle, die im gleichen Büro sitzen
On Error GoTo ErrMsg
    Dim strB As String
    strB = Nz(Me!BauBuero, "")
    t = Me!BauBuero.ControlTipText
    If strB = "" Then
        s = "Es wurde noch kein Büro/Bau zugewiesen."
        GoTo ErrM
    End If
    Me!txtFind = "Bau:" & strB
    txtFind_AfterUpdate
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.btnBauBuero_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Function OH_Fillcc(ctl As control, Optional bcc As Boolean)
On Error GoTo ErrMsg
    Dim N As Long
    Dim ctlCC As control
    Set ctlCC = Me!CC
    If bcc Then
        Set ctlCC = Me!bcc
    End If
    t = ctl.ControlTipText
    ctl.SetFocus
    Select Case ctl.Name
    Case "lstStichwort"
        If left(ctl.column(2), 5) = "email" And InStr(ctl.column(3), "@") > 1 Then
            If IsNull(Me!comEmail) Then
                Me!comEmail = ctl.column(3)
            Else
                If IsNull(ctlCC) Then
                    ctlCC = ctl.column(3)
                Else
                    If InStr(ctlCC, ctl.column(3)) = 0 Then
                        ctlCC = ctlCC & ";" & ctl.column(3)
                    End If
                End If
            End If
            GoTo ErrEnd
        End If
        N = 1
    Case "lstKontakt"
            strSQL = "EXEC spA_Adresse " & _
                        "@x = 'EmailfromID' " & _
                        ", @i = " & Nz(ctl.Value, 0)
            OH_r r
            If Not r.BOF Then
                If IsNull(ctlCC) Then
                    ctlCC = r(0)
                Else
                    If InStr(ctlCC, r(0)) = 0 Then
                        ctlCC = ctlCC & ";" & r(0)
                    End If
               End If
            End If
        GoTo ErrEnd
    Case "lstM"
        i = Me!countM
        N = 1
    Case "lstdet"
        i = Me!countRec
        N = 0
    Case Else
        GoTo ErrEnd
    End Select
    If i = 0 Then
        MsgBox "Sie haben keine Adressen zur Auswahl!", vbInformation, t
    Else
        For i = N To ctl.ListCount - 1
            strSQL = "EXEC spA_Adresse " & _
                        "@x = 'EmailfromID'" & _
                        ",@i = " & Nz(ctl.column(0, i), 0) & _
                        ",@e = '" & Nz(Me!comMailArt, "") & "'"
            OH_r r
            If Not r.BOF Then
                If IsNull(ctlCC) Then
                    If IsNull(Me!comEmail) Then
                        Me!comEmail = r(0)
                    Else
                        If Nz(Me!comEmail) <> r(0) Then
                            ctlCC = r(0)
                        Else
                            MsgBox r(0) & vbNewLine & _
                                    "ist bereits in der Mail-Adresse enthalten!", vbInformation, t
                        End If
                    End If
                Else
                    If InStr(Me!comEmail & ctlCC, r(0)) = 0 Then
                        ctlCC = ctlCC & ";" & r(0)
                    End If
                End If
            End If
        Next i
        If left(ctlCC, 1) = ";" Then
            ctlCC = Mid(ctlCC, 2, 1000)
        End If
        OH_CB ctlCC.Value
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_Fillcc"
    Resume ErrEnd
End Function
Private Sub btnGoogleMap_Click()
On Error GoTo ErrMsg
    OH_GoogleMap "place"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnGoogleMap_Click"
    Resume ErrEnd
End Sub
Private Sub btnGoogleMapRoute_Click()
On Error GoTo ErrMsg
    OH_GoogleMap "dir"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnGoogleMapRoute_Click"
    Resume ErrEnd
End Sub
Private Sub btnWhatsApp_Click()
On Error GoTo ErrMsg
    OH_WhatsApp
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnWhatsApp_Click"
    Resume ErrEnd
End Sub
Private Function OH_WhatsApp()
On Error GoTo ErrMsg
' Öffnet WhatsApp mit der übergebenen Mobilnr. und einzugebendem Text
    Dim strURL_BASE As String
    Dim strArt As String
    Dim strMobil As String
    Dim strURL As String
    Dim SW_SHOWMAXIMIZED As Long
    Dim strTxt As String
    t = Me!btnWhatsApp.Caption & " an " & Me!pageFunktion.Caption
    strURL_BASE = "https://wa.me/"
    strMobil = Nz(Me!Mobil, "")
    If strMobil = "" Then
        s = "Keine MobilNummer ausgefüllt !"
        GoTo ErrM
    End If
    strMobil = Replace(strMobil, " ", "")   'sonst geht die Seite nicht auf
    s = "Bitte hier einen kurzen Text eingeben"
    strTxt = InputBox(s, t)
    If StrPtr(strTxt) = 0 Then
        GoTo ErrEnd
    End If
    strURL = strURL_BASE & strMobil & "/?text=" & strTxt
    SW_SHOWMAXIMIZED = 3
    OH_LaunchURL SW_SHOWMAXIMIZED, strURL
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_GoogleMap"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Private Function OH_GoogleMap(Optional strG As String)
On Error GoTo ErrMsg
' The basic map URL without the strAdress information.
    Dim strURL_BASE As String
    strURL_BASE = "http://maps.google.de/maps/" & strG
    Dim strArt As String
    Dim strAdr As String
    Dim strURL As String
    Dim SW_SHOWMAXIMIZED As Long

    ' A very simple strURL encoding.
        'Hole Anschrift der zugeordneten Adressre
    strSQL = "Exec dbo.spa_Adresse @x = 'AnschriftFirma' " & _
                ",@i = " & Me!IDAdresse & _
                ",@a = " & Me!NrAdrZuord
    If strG = "dir" Then
        strSQL = strSQL & ",@b = " & EFNr
    End If
    OH_r r
    strAdr = r!AnschriftFirma
    If strAdr = "" Then
        GoTo ErrEnd
    End If
    strAdr = Replace(strAdr, " ", "+")
    strAdr = Replace(strAdr, ",", "%2c")
    strAdr = Replace(strAdr, "ß", "ss")
    strAdr = Replace(strAdr, "ä", "ae")
    strAdr = Replace(strAdr, "ö", "oe")
    strAdr = Replace(strAdr, "ü", "ue")

    strURL = strURL_BASE & "/" & strAdr
    SW_SHOWMAXIMIZED = 3
    OH_LaunchURL SW_SHOWMAXIMIZED, strURL
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_GoogleMap"
    Resume ErrEnd
End Function
Private Sub comCC_AfterUpdate()
On Error GoTo ErrMsg
    If InStr(Nz(Me!CC, ""), Me!comCC) = 0 Then
        If IsNull(Me!CC) Then
            Me!CC = Me!comCC
        Else
            Me!CC = Me!CC & ";" & Me!comCC
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comCC_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comCC_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Adresse " & _
            "@x = 'comCC'" & _
            ",@i =  " & Me!NrFunktion & _
            ",@a =  " & Me!NrAdrZuord
    OH_A "comCC", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comCC_Enter"
    Resume ErrEnd
End Sub
Private Sub comEmail_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Adresse " & _
            "@x = 'comemail'" & _
            ",@i =  " & Me!NrFunktion & _
            ",@a =  " & Me!IDAdresse & _
            ",@b =  " & Me!NrAdrZuord
    OH_A "comEmail", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comEmail_Enter"
    Resume ErrEnd
End Sub
Private Sub comKArt_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!comKArt) Then
        GoTo ErrEnd
    End If
    Me!lstKontaktAct.SetFocus
    OH_Navigator 10
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comKArt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnLeistungNeu_Click()
On Error GoTo ErrMsg
    Dim lgVGdet As Long
    lgVGdet = Me!LstLeistung.column(1)
    VarAntw = "lstLeistungAdresse"
    DoCmd.openForm "PF_Leistung", , , , , , lgVGdet
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnLeistungNeu_Click"
    Resume ErrEnd
End Sub
Public Sub btnStartEmail_Click()
On Error GoTo ErrMsg
    Dim strSignatur As String
    Dim strM As String
    Dim strP As String
    Dim strTxt As String
    Dim lgA As Long
    Dim rO As ADODB.Recordset
    DoCmd.Hourglass True
    t = Me!btnStartEmail.ControlTipText
    strM = Nz(Me!comMailServer, "outlook")
    strEmail = Nz(Me!comEmail, Nz(Me!EMail, ""))
    If InStr(strEmail, "@") = 0 Then
        s = "Email-Addresse fehlt!"
        Me!comEmail.SetFocus
        Me!comEmail.BackColor = vbRed
        GoTo ErrM
    End If
    If OH_Validate(Me!NrMitarbeiter, "Mitarbeiter") Then
        GoTo ErrEnd
    End If
    strTxt = OH_rtf2html3(Nz(Me!txtMemo))
    If InStr(strTxt, "Happy Birthday") Or InStr(strTxt, "Glückwünsche") Then
        s = "Geburtstagsmail"
        OH_A "@x = '" & s & _
            "',@i = " & Me!NrFunktion
        OH_r r
        If Not r.BOF Then
            s = Me!namen & " will  K E I N E  " & s & vbNewLine & _
                "(siehe Stichwort-Eintrag)"
            GoTo ErrM
        End If
    End If
    OH_CountAction
    If InStr(Me!comAnschrift, "Abteilung") > 0 Then
        strSQL = "Select dbo.fx_Div( 'AbteilungInfo',1,'" & Me!comAnschrift & "' ,'','') as email"
        OH_r r
        If InStr(r!EMail, "@") > 1 Then
            strEmail = r!EMail
        End If
    End If
    If Me!lstTxtMemo = 799 Then
        strSignatur = "Standard-Signatur"
    End If
    Select Case strM
    Case "Outlook"
        lgA = Me!IDAdresse
        Select Case Me!lstTxtMemo
        Case 799, 800, 910, 911
        Case Else
            OH_InsertID Me!NrFunktion, , True
        End Select
        OH_r rO, "Execute spi_ID @x = 'SelectID'"
        While Not rO.EOF
            If OH_OutlookMail _
                (strEmail, _
                Nz(Me!StandardText, ""), _
                strTxt, _
                rO!ID, _
                Nz(Me!comBeilage, ""), _
                Nz(Me!CC, ""), _
                False, _
                Nz(Me!bcc, ""), _
                Nz(Me!OutlookVorlage, ""), _
                Me) = False Then
                    rO.MoveLast
            End If
            rO.MoveNext
        Wend
    End Select
ErrEnd:
    OH_ResetRS r
    OH_ResetRS rO
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.btnStartEmail_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnAppoitment_Click()
On Error GoTo ErrMsg
    Dim strRecipient As String
    Dim strSubject As String
    strRecipient = Nz(Me!comEmail, "")
    t = Me!btnAppoitment.Caption & " mit " & strRecipient
    strSubject = Nz(Me!StandardText, "")
    If strSubject = "" Then
        Me!StandardText.SetFocus
        s = "Bitte ausfüllen"
        GoTo ErrM
    End If
    If Not IsNull(Me!CC) Then
        s = "Termin: " & strSubject & vbNewLine & vbNewLine & _
            "CC: " & Me!CC & vbNewLine & _
            "auch einladen zum Metting?"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbYes
            strRecipient = strRecipient & ";" & Me!CC
        End Select
    End If
    OH_OutlookAppointment _
        strRecipient, _
        strSubject, _
        Format(Me!txtDate, "dd.mm.yyyy hh:nn"), _
        Format(DateAdd("n", 30, Me!txtDate), "dd.mm.yyyy hh:nn"), _
         Nz(PlainText(Me!txtMemo), ""), _
        "", _
        30
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.btnAppoitment_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub

Private Sub btncomAnschrift_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Anschrift"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btncomAnschrift_Click"
    Resume ErrEnd
End Sub
Private Sub btncomBeilage_Click()
On Error GoTo ErrMsg
    Dim strFile As String, strPath As String
    t = "Beilagen"
    strPath = OH_StichwortExplorer("explorer")
    If Len(strPath) > 0 Then
        Set fd = Application.FileDialog(msoFileDialogFolderPicker)
        With fd
          .Title = t
          .filters.Clear
          .InitialFileName = strPath
          .Show
        End With
        If fd.SelectedItems.count > 0 Then
            strFile = fd.SelectedItems(1)
            If IsNull(Me!comBeilage) Then
                Me!comBeilage = strFile
            Else
                Me!comBeilage = Me!comBeilage & "; " & strFile
            End If
        End If
    End If
    OH_ResetRS r
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btncomBeilage_Click"
    Resume ErrEnd
End Sub
Private Sub comBeilage_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strB As String
    t = "Beilagen"
    If IsNull(Me!comBeilage) Then
        btncomBeilage_Click
    Else
        strB = Me!comBeilage
        While InStr(strB, ";") > 0 = True
            i = InStr(strB, ";")
            FollowHyperlink (left(strB, i - 1))
            strB = Trim(right(strB, Len(strB) - i))
        Wend
        FollowHyperlink (strB)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 16388 'Abbrechen
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comBeilage_DblClick"
        Resume ErrEnd
    End Select
End Sub
Private Sub btnContactinOutlook_Click()
On Error GoTo ErrMsg
    s = Me!namen & ", " & Me!Funktion & vbNewLine & vbNewLine & _
            "JA" & vbTab & "abgleichen und anzeigen" & vbNewLine & _
            "Nein" & vbTab & "Nur abgleichen, aber nicht anzeigen!"
    i = MsgBox(s, _
             vbQuestion + vbYesNoCancel, "Adresse in Outlook abgleichen?")
    Select Case i
    Case vbYes, vbNo
        OH_SaveRS Me
        OH_ResetID
        OH_InsertID Me!NrFunktion
        OH_SyncAddContactOutlook i
    Case Else
        GoTo ErrEnd
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnContactinOutlook_Click"
    Resume ErrEnd
End Sub
Private Sub btnPLZ_Click()
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Land"
    OH_FB Forms!PF_Land, "LandKz like '" & Nz(Me!Land) & "'", "Landkz"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnPLZ_Click"
    Resume ErrEnd
End Sub
Private Sub btnSprache_Click()
On Error GoTo ErrMsg
    Dim strHilfe As String
    s = "Übersetzungs-Tabelle öffnen?"
    strHilfe = "T_Language ist eine Tabelle, um Übersetzungen definieren zu können!"
    x = OH_msgbox(s, Array("nur anschauen", "Zum Bearbeiten", "Nein"), _
                vbQuestion, _
                s, _
                strHilfe)
    Select Case Val(x)
    Case 1
        DoCmd.OpenTable "T_Language", acViewNormal, acReadOnly
    Case 2
        DoCmd.OpenTable "T_Language", acViewNormal, acEdit
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnSprache_Click"
    Resume ErrEnd
End Sub
Private Sub btnTxtDate_Click()
On Error GoTo ErrMsg
    OH_OpenKalender Me!txtDate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnTxtDate_Click"
    Resume ErrEnd
End Sub
Private Sub btnUpdateAnschrift_Click()
On Error GoTo ErrMsg
    comAnschrift_AfterUpdate
    OH_CB Me!Anschrift
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnUpdateAnschrift_Click"
    Resume ErrEnd
End Sub
Private Sub btnTelefon1_Click()
On Error GoTo ErrMsg
    Dim strS As String
    strS = vbNewLine & "Siehe unter Stichworten: " & vbNewLine
    s = Me!namen & vbNewLine & _
            Me!Funktionen & vbNewLine & _
            Me!Wo & vbNewLine & vbNewLine & _
            "Tel" & vbTab & Nz(Me!Telefon, "-") & vbNewLine & _
            "Fax" & vbTab & Nz(Me!Fax, "-") & vbNewLine & _
            "eMail" & vbTab & Nz(Me!EMail, "-") & vbNewLine & _
            "WEB" & vbTab & Nz(HyperlinkPart(Me!Internet, acAddress), "-") & vbNewLine & _
            "Mobil" & vbTab & Nz(Me!Mobil, "-") & vbNewLine & vbNewLine
    OH_A " @x = 'btnTelefon1' , " & _
         " @i = " & Me!NrFunktion
    OH_r r
    If r!mldg <> "" Then
        s = s & strS & r!mldg
    End If
    OH_ResetRS r
    i = MsgBox(s & vbNewLine & vbNewLine & _
            "Möchten Sie weitere Nummern erfassen?" & vbNewLine & _
             "Stichwortliste wird hierzu geöffnet!" & vbNewLine & vbNewLine & _
             "JA" & vbTab & "Weitere Infos eintragen" & vbNewLine & _
             "NEIN" & vbTab & "In Zwischenablage kopieren", _
             vbQuestion + vbYesNoCancel + vbDefaultButton2, _
             Me!btnTelefon1.ControlTipText)
    Select Case i
    Case vbYes
        OH_OpenStichwort Me, "Neu"
    Case vbNo
        OH_CB Replace(s, strS, "")
    End Select

ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnTelefon1_Click"
    Resume ErrEnd
End Sub
Public Sub comAnschrift_AfterUpdate()
On Error GoTo ErrMsg
    Me!Anschrift = Me!comAnschrift.column(2)
    Me!comAnrede = Me!comAnschrift.column(3)
    Me!comEmail = Me!comEmail.column(0, 0)
    comEmail_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comAnschrift_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub comEmail_AfterUpdate()
On Error GoTo ErrMsg
    i = vbYellow
    Select Case Me!comEmail.column(2)
    Case 0
        i = vbWhite
    Case 1
        i = vbGreen
    Case 3
        i = vbRed
    End Select
    Me!comEmail.BackColor = i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comEmail_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comAnredeWie_AfterUpdate()
On Error GoTo ErrMsg
    regMain_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comAnredeWie_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comAnredeWie_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If Nz(Me!comAnredeWie, 1) = 1 Then
        Me!comAnredeWie = 0
    Else
        Me!comAnredeWie = 1
    End If
    comAnredeWie_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comAnredeWie_DblClick"
    Resume ErrEnd
End Sub
Private Sub comKArt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Zuordnung zu Kontakt", Nz(Me!comKArt)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comKArt_DblClick"
    Resume ErrEnd
End Sub
Private Sub comKArt_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!comKArt, "Zuordnung zu Kontakt"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comKArt_Enter"
    Resume ErrEnd
End Sub
Private Sub comKArt_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "Zuordnung zu Kontakt", "lstKontaktAct"
    comKArt_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comKArt_NotInList"
    Resume ErrEnd
End Sub
Private Sub comNrAdresse_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgF As Long
    Dim lgA As Long
    Dim lgB As Long
    lgF = Me!NrFunktion
    lgA = Me!IDAdresse
    lgB = Me!IDAdresse
    Set ctl = Me!comNrAdresse
    lgB = Nz(ctl.Value, 0)
    s = ctl.column(1)
    If lgB <> Me!IDAdresse Then
        If OH_CheckAdmin("+Eigene Firma") = True Then
            Exit Sub
        End If
        If MsgBox("Wollen Sie die Zuordnung ändern??" & vbNewLine & _
                    Me!f2 & Me!f3 & vbNewLine & vbNewLine & _
                   "bisher:" & vbTab & Me!f1 & vbNewLine & _
                   "neu:" & vbTab & s, _
                   vbDefaultButton2 + vbQuestion + vbOKCancel, _
                   "Adressenzuordnung " & Me!Wo) = vbOK Then
            OH_A "@x ='ChangeNrAdrZuord'," & _
                    " @i = " & lgF & "," & _
                    " @a = " & lgA & "," & _
                    " @b = " & lgB
            OH_EX
            MsgBox "Überprüfen Sie bitte die restlichen Adressdaten!", vbExclamation, "Adress-Änderung!"
            OH_SetRS Me, lgB
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comNrAdresse_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comNrAdresse_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comNrAdresse_Enter"
    Resume ErrEnd
End Sub
Private Sub comSprache_AfterUpdate()
On Error GoTo ErrMsg
    gllg = Nz(Me!comSprache, "Deutsch")
    regMain_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comSprache_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comSprache_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comSprache_Enter"
    Resume ErrEnd
End Sub

Private Sub Form_Deactivate()
On Error GoTo ErrMsg
    OH_closeObj "PF_NeuAdresse"
    OH_closeObj "frmInfo"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_Deactivate"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    Me.RecordSource = ""
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_Unload"
    Resume ErrEnd
End Sub
Private Sub Internet_GotFocus()
On Error GoTo ErrMsg
    If Len(Nz(Me!Internet)) < 7 Then
        strSQL = "select dbo.fx_Div('FindInternet'," & _
                                    Me!NrAdrZuord & ",'" & _
                                    Me!Land & "','','')"
        OH_r r
        If Not IsNull(r(0)) Then
            Me!Internet = r(0)
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Internet_GotFocus"
    Resume ErrEnd
End Sub
Private Sub lstKontaktAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strA As String
    Dim strQ As String
    Dim c As control
    Dim N As Long
    DoCmd.Hourglass True
    Set ctl = Me!lstKontakt
    Set c = Me!lstKontaktAct
    strA = ctl.column(3) & vbNewLine & _
            vbTab & "ist DIREKT zugeordnet zu" & vbNewLine & _
            ctl.column(5) & vbNewLine & _
            vbTab & "als" & vbNewLine & _
            ctl.column(6) & vbNewLine & vbNewLine
    lgid = Nz(ctl.column(0), 0)
    t = Me!namen & " " & c.column(1)
    OH_A "@x = 'lstkontaktact'" & _
        ", @a = " & c
    strQ = strSQL
    Select Case c
    Case 35, 36, 37, 40
        If lgid = 0 Then
            s = "Bitte in der Liste rechts einen Datensatz markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case c
    Case 10
        OH_New
    Case 20
        OH_RQ ctl
    Case 30
        OH_Lex Me!comKArt, "Zuordnung zu Kontakt"
        With Me!comKArt
            If IsNull(.Value) Then
                .Visible = True
                .SetFocus
                .Dropdown
            Else
                comKArt_AfterUpdate
            End If
        End With
    Case 31, 32
        If c = 31 Then
            s = "Lead"
        Else
            s = "Bitte geben Sie das Kurzzeichen des verantwortlichen Mitarbeiters ein"
            strA = InputBox(s, t, Forms!Menu!lstMandant.column(1))
            If strA = "" Then
                GoTo ErrEnd
            End If
            s = "verantw. Mitarbeiter"
            strSQL = strQ & _
                    ",@i = " & Me!NrFunktion & _
                    ",@f = '" & s & _
                    "',@d = '" & strA & "'"
            OH_r r
            s = r!Msg
            MsgBox s, vbInformation, t
            regD_Change
            GoTo ErrEnd
        End If
        With Me!comKArt
            .Visible = True
            .SetFocus
            .Value = s
        End With
        comKArt_AfterUpdate
    Case 34, 35, 36, 37, 38
        If ctl.column(1) = 0 Then
            s = strA & _
                    "Zum Ändern können Sie jetzt zur entsprechenden Adresse wechseln!"
            If MsgBox(s, vbOKCancel + vbDefaultButton2 + vbQuestion, t) = vbOK Then
                OH_OF "F_Adresse", lgid
            End If
        Else
            lgid = Me!NrFunktion
            strSQL = strQ & _
                ", @i = " & lgid & _
                ", @b = " & Me!lstKontakt.column(1)
            s = "lfd. Nr. " & Me!lstKontakt.column(2) & ": " & Me!lstKontakt.column(3) & vbNewLine & Me!lstKontakt.column(4)
            Select Case c
            Case 35
                 OH_r r
                 i = r!Anzahl
                 If i = 1 Then
                     s = "Es ist nur EIN Datensatz zugeordnet," & vbNewLine & _
                         " Reihenfolge ändern ist deshalb sinnlos!"
                     GoTo ErrM
                 End If
                 s = "Bitte geben Sie eine Zahl zwischen 1 und " & i & " ein!"
                 N = Val(InputBox(s, t, 1))
                 If N >= 1 And N <= i Then
                     strSQL = strSQL & _
                             ", @n = " & N
                     OH_EX
                     OH_RQ Me!lstKontakt
                     SysCmd acSysCmdSetStatus, "Sortierung: neu erstellt"
                 Else
                     SysCmd acSysCmdSetStatus, "Sortierung: Falsche Werte eingegeben!"
                 End If
             Case Else
                t = "Zuordnung ändern: " & Me!lstKontaktAct.column(1)
                Select Case c
                Case 34, 36 'Art
                    strA = Nz(Me!lstKontakt.column(4))
                Case 37 'Anzahl
                    strA = Nz(Me!lstKontakt.column(5))
                Case 38 'Bemerkungen
                    strA = Nz(Me!lstKontakt.column(8))
                End Select
                 s = t & vbNewLine & _
                    s
                 s = InputBox(s, t, strA)
                 If StrPtr(s) = 0 Then
                     GoTo ErrEnd
                 End If
                 strSQL = strSQL & _
                         ", @f = '" & s & "'"
                 OH_EX
                 OH_RQ Me!lstKontakt
             End Select
        End If
    Case 40, 41
        If c = 40 Then
            lgid = ctl.column(1)
            If lgid = 0 Then
                s = strA & _
                        "Löschen können Sie im Register <Adressen managen>"
                If MsgBox(s, vbOKCancel + vbExclamation, t) = vbOK Then
                    Me!lstMdo.SetFocus
                End If
                GoTo ErrEnd
            End If
            strA = ctl.column(2) & " " & ctl.column(3)
        Else
            strA = Me!namen
            lgid = Me!f0
        End If
        If MsgBox(strA, vbQuestion + vbOKCancel, t) = vbOK Then
            strSQL = strQ & _
                ", @i = " & lgid
            OH_EX
            OH_RQ ctl
        End If
    Case 50, 51
        strA = Nz(ctl.column(10), "")
        If strA = "" Then
            s = ctl.column(3) & vbNewLine & _
                    "hat keine Email-Adresse!"
            GoTo ErrM
        End If
        If left(ctl.column(6), 2) = "<>" Then
            s = ctl.column(3) & vbNewLine & _
                    "ist inaktiv gesetzt!"
            GoTo ErrM
        End If
        If c = 50 Then
            Set ctl = Me!comEmail
        Else
            Set ctl = Me!CC
        End If
        If InStr(Nz(ctl, ""), strA) = 0 Then
            ctl.SetFocus
            If IsNull(ctl) Then
                ctl = strA
            Else
                ctl = ctl & ";" & strA
            End If
        Else
            s = strA & vbNewLine & _
                    "ist bereits zugeordnet!"
            GoTo ErrM
        End If
    Case 52
        OH_A "@x = 'GetEmailListe'" & _
            ", @a = " & Me!NrAdrZuord & _
            ", @i = " & Me!NrFunktion & _
            ",@d = '" & Me!comEmail & "'"
        OH_r r
        Me!CC = r!EmailListe
        OH_CB Me!CC
        SysCmd acSysCmdSetStatus, "CC-Liste ist auch im Zwischenspeicher: " & left(Me!CC, 150) & "...."
    Case 60
        OH_InsertID_LST Me!lstKontakt
        strSQL = "Exec dbo.spI_Marker " & _
                " @Tag = 'Funktion'" & _
                ",@art = 'I'"
        OH_EX
        Me!lstM.SetFocus
    Case 70, 71, 72, 73
        lstKontaktActA_AfterUpdate
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstKontaktAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstOutlook_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstOutlookAct = 30
    lstOutlookAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstOutlook_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_AfterUpdate()
On Error GoTo ErrMsg
    'OH_SetBemStichwort Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwort_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub lstStichwort_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Select Case KeyCode
    Case 46
        Me!lstStichwortAct = 20
        t = "Stichwort endgültig löschen ?"
        s = Me!lstStichwort.column(2) & vbNewLine & vbNewLine & _
            "Löschen??"
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbOK Then
            Me!lstStichwortAct = 20
            lstStichwortAct_AfterUpdate
        End If
        Me!lstStichwortAct = Null
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwort_KeyDown"
    Resume ErrEnd
End Sub

Private Sub lstStichwort_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    OH_SortListeSQL Me!lstStichwort, x, Y
    lgX(2) = x
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwort_MouseDown"
    Resume ErrEnd
End Sub
Private Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strSignatur As String
    OH_CountAction
    t = Me!namen & ": Doppelklick auf Stichwort"
    With Me!lstStichwort
        Select Case left(.column(2), 3)
        Case "Tel", "Han", "Mob"
            If IsNumeric(Mid(.column(3), 2, 1)) Then
                s = Me!namen & vbNewLine & vbNewLine & .column(2) & vbTab & .column(3)
                OH_msgbox s, Array("anrufen", "Stichwort anzeigen", "Nummer kopieren in Zwischenablage"), vbQuestion, t
                i = Val(strMSG(1))
                Select Case i
                Case 0
                    GoTo ErrEnd
                Case 1
                    Me!tempFeld = .column(3)
                    OH_DialTelefon Me!NrFunktion, Me!tempFeld, Me!namen
                    GoTo ErrEnd
                Case 3
                    OH_CB .column(2) & "" & .column(3)
                    GoTo ErrEnd
                End Select
            End If
        Case "ema"
            strEmail = .column(3)
            t = "Bitte Auswahltreffen mit <" & .column(2) & ">"
            If InStr(strEmail, "@") > 0 Then
                If OH_Validate(Me!NrMitarbeiter, "Mandant") = True Then
                    GoTo ErrEnd
                End If
                s = strEmail & vbNewLine & vbNewLine & _
                    "1" & vbTab & "Mail an " & .column(2) & vbNewLine & _
                    "2" & vbTab & "Stichwort anzeigen" & vbNewLine & _
                    "3" & vbTab & "in Zwischenspeicher kopieren" & vbNewLine & _
                    "4" & vbTab & "als <An> eintragen" & vbNewLine & _
                    "5" & vbTab & "als <cc> eintragen" & vbNewLine & _
                    "6" & vbTab & "als <Bcc> eintragen"
                i = InStr(strEmail, " ")
                If i > 0 Then
                    strEmail = Trim(left(strEmail, i))
                End If
                i = InStr(strEmail, vbNewLine) 'falls z.B. Passwort auch noch (nach Zeilenumbruch) hinterlegt ist
                If i > 0 Then
                    strEmail = Trim(left(strEmail, i))
                End If
                i = Val(InputBox(s, t, 1))
                Select Case i
                Case 1
                    OH_OutlookMail _
                        strEmail, _
                        "", _
                        Me!NrFunktion, _
                        Nz(Me!comBeilage), , , , , , Me
                Case 2
                    OH_OpenStichwort Me, , , lgX(2)
                Case 3
                    OH_CB strEmail
                Case 4
                    Me!comEmail = strEmail
                    Me!comEmail.SetFocus
                Case 5
                    Me!CC = strEmail
                    Me!CC.SetFocus
                Case 6
                    Me!bcc = strEmail
                    Me!bcc.SetFocus
                End Select
            End If
            GoTo ErrEnd
        Case "UST"
            If .column(2) = "USt-Id" And Nz(.column(3), "") <> "" Then
                i = MsgBox("JA" & vbTab & vbTab & "Überprüfe " & .column(2) & " " & .column(3) & vbNewLine & _
                                vbTab & vbTab & "beim Bundeszentralamt für Steuern" & vbNewLine & vbNewLine & _
                           "Nein" & vbTab & vbTab & "Stichwort anzeigen" & vbNewLine & _
                           "Abbrechen" & vbTab & "in Zwischenspeicher kopieren", _
                           vbQuestion + vbYesNoCancel, Me!namen)
                Select Case i
                Case vbYes
                    OH_CheckUSTID Me!NrAdrZuord, .column(3), True, True
                    GoTo ErrEnd
                Case vbCancel
                    OH_CB .column(3)
                    GoTo ErrEnd
                End Select

            End If
        End Select
    End With
    OH_OpenStichwort Me, , , lgX(2)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwort_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwortAct_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub comStichwortFilter_AfterUpdate()
On Error GoTo ErrMsg
    Dim strFilter As String
    Dim lgcolor As Long
    t = "Stichwort-Filter"
    strFilter = Nz(Me!comStichwortFilter, "")
    If strFilter = "kein Filter" Then
        Me!comStichwortFilter = ""
        strFilter = ""
    End If
    strSQL = "Exec dbo.spA_Stichwort " & _
            " @x = 'comStichwortFilter' " & _
            ",@fi = '" & strFilter & "'"
    OH_A "comStichwortFilter", strSQL, Me
    regD_Change
    If strFilter = "" Then
        lgcolor = Me!lstStichwortAct.BackColor
    Else
        If Me!lstStichwort.ListCount < 1 Then
            lgcolor = vbRed
        Else
            lgcolor = vbGreen
        End If
    End If
    Me!comStichwortFilter.BackColor = lgcolor
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "comStichwortFilter_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
End Sub

Private Sub comStichwortFilter_DblClick(Cancel As Integer)
    If Nz(Me!comStichwortFilter, "") = "" Then
        s = Nz(Me!lstStichwort.column(2), "")
    Else
        s = ""
    End If
    Me!comStichwortFilter = s
    comStichwortFilter_AfterUpdate
End Sub
Private Sub lstStichwortGr_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!lstStichwortGr
    Case "wichtige Infos"
        OH_ShowWichtigeInfo "large"
    Case Else
        regD_Change
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwortGr_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub lstStichwortGr_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstStichwortGr = Me!lstStichwortGr.DefaultValue
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstStichwortGr_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstTopA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstTopA.SetFocus
    Me!pageMarker.Caption = Me!lstTopA.column(1) & " managen"
    If Me.regd = 5 Then
        lstMdo_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstTopA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstOrder_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstOrder.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstOrder"
    Resume ErrEnd
End Sub
Private Sub lstV_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstV.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstV_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstFeld_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstfeld.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstFeld"
    Resume ErrEnd
End Sub
Private Sub lstVG_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    OH_SortListeSQL Me!lstVG, x, Y
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstVG_MouseDown"
    Resume ErrEnd
End Sub
Private Sub lstVGAct_AfterUpdate()
    Dim lgid As Long
    Dim lgact As Long
    Set ctl = Me!lstVG
    lgid = Nz(ctl.column(0), 0)
    t = Me!lstVGAct.column(1)
    lgact = Nz(Me!lstVGAct, 0)
    Select Case lgact
    Case 11, 12, 30, 40, 50, 51
    If lgid = 0 Then
            s = "Bitte in der Liste rechts den entsprechenden Datensatz markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case lgact
    Case 1, 2, 3, 4
        Select Case lgact
        Case 1, 2           ' Prüfen, ob beim User das Stichwort '+Anzeige Vorgänge in Adressen' eingetragen ist
            If lgVGActVorgabe = 0 Then
                OH_A "@x = 'lstVGAct'" & _
                    ", @i = " & lguser & _
                    ", @a = " & lgact
                OH_r r
                Select Case r!Msg
                Case 0      'User kann entscheiden, ob Standard = alle oder offene Vorgänge
                    t = "Auswahl der Standardanzeige für Vorgänge"
                    s = "Welche Vorgänge sollen künftig als Standard angezeigt werden?" & vbNewLine & _
                        "Ja" & vbTab & "ALLE Vorgänge" & vbNewLine & _
                        "Nein" & vbTab & "nur OFFENE Vorgänge"
                    i = MsgBox(s, vbQuestion + vbYesNo, t)
                    strSQL = strSQL & _
                            ", @b = " & i
                    OH_r r
                End Select
                lgVGActVorgabe = r!Msg
            End If
        End Select
        regD_Change
    Case 10, 11
        s = "Erstelle einen neuen Vorgang mit" & vbNewLine & _
                    Me!namen & vbNewLine & vbNewLine & _
            "Geöffnet wird jetzt der letzte Vorgang mit dieser Adresse." & vbNewLine & _
            "Falls es noch keinen gibt, wird der zuletzt von Ihnen erstellte Vorgang geöffnet."
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        If lgact = 10 Then
            OH_A "@x = 'GetNrVG'" & _
                ", @i = " & Me!NrFunktion & _
                ", @a = " & Me!NrAdrZuord & _
                ", @u = " & lguser
            OH_r r
            lgid = r!NrVG
        End If
        OH_OF "F_VG", lgid
        If lgact = 10 Then
            DoCmd.openForm "PF_NeuVG", , , , , , "A" & Me!NrFunktion
        Else
            OH_Copy
        End If
        If OH_isloaded("PF_NeuVG") Then
            Set frm = Forms!PF_NeuVG
            If frm!NrFunktion <> Me!NrFunktion Then
                frm!NrFunktion = Me!NrFunktion
                frm.NrFunktion_AfterUpdate
            End If
        End If
    Case 12 'ergänze den markierten Vorgang...
        OH_OF "F_VG", lgid
        DoCmd.openForm "PF_NeuVG", , , , , , "X" & lgid
    Case 30
        lstVG_DblClick (0)
    Case 40
        strSQL = "spI_Marker" & _
                " @Tag = 'VG'," & _
                " @ID = " & lgid & "," & _
                " @art = 'M'"
        OH_EX
        OH_RQ Me!lstVG
        If Me!lstVG <> lgid Then
            Me!lstVG = lgid
        End If
    Case 50, 51 'verschiebe Vorgang...'
        i = Me!lstVG.ListCount - 1
        s = Me!namen & vbNewLine & vbNewLine
        If lgact = 50 Or i = 1 Then
            s = s & Me!lstVG.column(2) & " " & Me!lstVG.column(3) & vbNewLine & _
                "Wollen Sie diesen Vorgang verschieben?"
        Else
            s = s & "Wollen Sie ALLE " & i & " Vorgänge verschieben?"
        End If
        t = t & " auf eine andere auszuwählende Adresse"
        s = t & vbNewLine & vbNewLine & s
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
            OH_ResetID
            If lgact = 50 Then
                OH_InsertID Me!lstVG
            Else
                OH_InsertID_LST Me!lstVG
            End If
            OH_Navigator 60
        End If
    Case 60
        s = "Sind Sie sich absolut sicher, diesen Vorgang und alle zugehörigen Daten zu löschen??"
        If OH_JA Then
            OH_EX
            OH_RQ Me!lstVG
        End If
    End Select
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstVGAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
End Sub
Private Sub lstVGSum_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    lgact = Nz(Me!lstVGAct, 0)
    If lgact > 3 Then
        lgact = 0
    End If
    OH_A "lstVG", " @a = " & lgact & _
                 ", @b = " & Nz(Me!lstVGSum, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstVGSum_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstArtikelAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgArtikel As Long
    Dim lgid As Long
    Dim lgact As Long
    Dim strR As String
    Dim strT As String
    Dim strQ As String
    Dim strB As String
    Dim lgR As Long
    Dim N As Long
    Set ctl = Me!LstArtikel
    lgid = Nz(ctl.column(0), 0)
    t = Me!LstArtikelAct.column(1)
    lgact = Nz(Me!LstArtikelAct, 0)
    lgArtikel = Nz(ctl.column(0), 0)
    If Me.PageArtikel.Caption = "Artikel mit Rabatt" Then
        lgArtikel = Nz(ctl.column(1), 0)
    End If
    lgact = Nz(Me!LstArtikelAct, 0)
    OH_A "@x = 'lstartikelAct' " & _
        ", @a = " & lgact, , Me
    strQ = strSQL
    strB = Nz(Me!LstArtikel.column(1, 0), "")
    Select Case lgact
    Case 11, 12, 13
        If strB <> "Bezeichnung" Then
            s = "Bitte zuerst <Liefer-Artikel> in dieser Liste anklicken"
            Me!LstArtikelAct = Null
            GoTo ErrM
        End If
    Case 51, 52, 53
        If strB <> "NrZuord" Then
            s = "Bitte zuerst <Artikel mit Rabatt> in dieser Liste anklicken"
            GoTo ErrM
        End If
    End Select
    Select Case lgact
    Case 10, 50
        OH_A "@x = 'lstartikel' " & _
            ", @i = " & Me!NrAdrZuord & _
            ", @z = " & Me!NrFunktion & _
            ", @a  = " & lgact
        OH_A "LstArtikel", strSQL
        If lgact = 10 Then
            Me.PageArtikel.Caption = "Liefer-Artikel"
        Else
            Me.PageArtikel.Caption = "Artikel mit Rabatt"
        End If
    Case 12, 13, 30, 40, 52, 53
        If lgid = 0 Then
            s = "Bitte in der Liste rechts den entsprechenden Datensatz markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case lgact
    Case 11
        s = "Erstelle einen neuen Artikel mit" & vbNewLine & _
                    Me!namen & vbNewLine & _
                    "als Lieferanten"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        If lgact = 10 Then
            strSQL = "Exec dbo.spa_Artikel " & _
                    " @x = 'Neuer Artikel mit Lieferant'," & _
                    " @i = " & Me!NrAdrZuord
            OH_r r
            lgid = r(0)
        End If
        OH_OF "F_Artikel", lgid
        Forms!F_Artikel!regd = 1
    Case 12
        OH_OF "F_Artikel", lgid
        Forms!F_Artikel!regd = 1
        OH_Copy
    Case 30
        lstArtikel_DblClick (0)
    Case 40
        strSQL = "spI_Marker" & _
                " @Tag = 'Artikel'," & _
                " @ID = " & lgArtikel & "," & _
                " @art = 'M'"
        OH_EX
        OH_RQ Me!LstArtikel, lgid
    Case 50
    Case 51
        If Me!FP = 0 Then
            GoTo ErrEnd
        End If
        t = "Rabatte hinzufügen über Artikel oder Warengruppen"
        s = "Wollen Sie einzelne Artikel rabattieren oder ganze Warengruppen?" & vbNewLine & vbNewLine & _
            "JA" & vbTab & "Artikel" & vbNewLine & _
            "NEIN" & vbTab & "Warengruppen"
        i = MsgBox(s, vbQuestion + vbYesNoCancel + vbDefaultButton3, t)
        Select Case i
        Case vbYes
            DoCmd.openForm "PF_Artikel"
            Set frm = Forms!PF_Artikel
            frm!woher = "RabattAdresse"
        Case vbNo
            strSQL = "EXEC spA_Artikel " & _
                    "@x = 'lstRabattAct'" & _
                    ",@a = 20 " & _
                    ",@w = 'Warengruppe'" & _
                    ",@n = " & Me!NrFunktion
            OH_r r
            i = r!CT
            If i = 0 Then
                s = "Keine Rabatte für Firma " & r!Firma
                GoTo ErrM
            End If
            DoCmd.openForm "PF_Rabatt"
        End Select
    Case 52
errnochmal:
        t = "Rabattsatz ändern " & Me!namen
        s = Me!LstArtikel.column(2) & vbNewLine & _
            "Ändern das Rabattsatzes"
        strT = Me!LstArtikel.column(6)
        s = InputBox(s, t, strT)
        If s = strT Then
            GoTo errnochmal
        End If
        s = Replace(s, ",", ".")
        If IsNumeric(s) = False Then
            s = "Bitte eine Zahl > 0 und <= 100 eingeben"
            GoTo ErrM
        End If
        lgR = s * 100
        If lgR < 1 Or lgR > 10000 Then
            s = "Bitte eine Zahl > 0 und <= 100 eingeben"
            GoTo ErrM
        End If
        N = 0
        For i = 0 To Me!LstArtikel.ListCount - 1
            If Me!LstArtikel.column(6, i) = strT Then
                N = N + 1
            End If
        Next i
        i = vbNo
        If N > 1 Then
            s = "Sollen alle " & N & " Artikel mit dem Rabatt " & strT & " geändert werden?" & vbNewLine & vbNewLine & _
                "JA" & vbTab & "Alle ändern" & vbNewLine & _
                "Nein" & vbTab & "Nur der markierte Artikel"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        End If
        strSQL = strQ & _
            ", @i = " & Nz(Me!LstArtikel.column(1), 0) & _
            ", @b = " & i & _
            ", @n  = " & lgR
        OH_EX
        OH_RQ Me!LstArtikel, lgid
    Case 53
        t = "Artikel mit Rabatt aufheben"
        N = -1
        For i = 0 To Me!LstArtikel.ListCount - 1
            N = N + 1
        Next i
        s = "Löschen mit ==>JA"
        If N > 1 Then
            s = s & vbNewLine & vbNewLine & _
                "Sollen alle " & N & " Artikel mit Rabatt gelöscht werden?" & vbNewLine & _
                "==>JA ALLE"
        End If
        s = InputBox(s, t, "NEIN")
        Select Case s
        Case "JA", "JA Alle"
        Case Else
            GoTo ErrEnd
        End Select
        strSQL = strQ & _
            ", @i = " & Nz(Me!LstArtikel.column(1), 0) & _
            ", @n = " & Me!NrFunktion & _
            ", @f = '" & s & "'"
        OH_EX
        OH_RQ Me!LstArtikel, lgid
    Case 60
        OH_EX strQ
        OH_OF "F_Adresse", , 10
        Me!LstArtikelAct = 50
        lstArtikelAct_AfterUpdate
    Case 70
        s = "Erstelle EXCEL-Liste mit Rabatten" & vbNewLine & vbNewLine & _
            "JA" & vbTab & Me!namen & vbNewLine & _
            "Nein" & vbTab & "Alle Kunden"
        i = MsgBox(s, vbYesNoCancel + vbQuestion + vbDefaultButton3, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbYes
            lgid = Me!NrFunktion
        Case vbNo
            lgid = 0
        End Select
        strSQL = strQ & ",@i = " & lgid
        OH_EXCEL strSQL, "Rabatt-Liste aus Firma"
    End Select
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstArtikelAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstExplorerSource_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    DoCmd.openForm "frmSchlagwort", , , , , , "Adresse"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstExplorerSource_DblClick"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstExplorerSource_AfterUpdate()
On Error GoTo ErrMsg
    OH_A "lstExplorerAct", "@f = '" & Me!lstExplorerSource & "'"
    Me!lstExplorerAct = 8
    OH_CreateCmb Me!lstExplorer, Me!lstExplorerAct, Me
    lstExplorerAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstExplorerSource_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstExplorerAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim lgDoc As Long
    Dim strQ As String
    Dim strID As String
    Dim strD As String
    Dim strP As String
    Dim strf As String
    Dim strE As String
    Dim strTT As String
    Dim lgCC As Long
    Dim strCW As String
    DoCmd.Hourglass True
    Set ctl = Me!lstExplorer
    strID = Nz(ctl.column(0), "")
    t = Nz(Me!lstExplorerAct.column(1), "--")
    If t = "" Then
        GoTo ErrEnd
    End If
    strD = Nz(Me!lstExplorerSource, "DMS")
    lgA = Me!lstExplorerAct
    Me!lstExplorer.Visible = True
    OH_A "@x = 'lstExplorerAct' " & _
            ",@a = " & lgA & _
            ",@e = '" & Me!lstExplorerSource & _
            "',@f = '" & glDMS & _
            "',@i = " & Me!NrFunktion, , Me
    strQ = strSQL
    Select Case lgA
    Case 21
        strP = OH_explorer
        If strP <> "" Then
            OH_LoadFileFromDB strID, strP
        End If
    Case 3, 4 'Windows Basis Ordner, Outlook Basis-Ordner
        If Me!lstExplorerSource <> "Windows Explorer" Then
            Me!lstExplorerSource = "Windows Explorer"
        End If
        If lgA = 3 Then
            OH_StichwortExplorer "explorer", True, Me
        Else
            OH_Outlook
        End If
        lstExplorerSource_AfterUpdate
    Case 8, Is > 20 'Liste aktualisieren
        Select Case lgA
        Case 8, 31
            strFilterExplorer = ""
        Case 30 'filtere...
            t = "Filter im Dateinamen oder Unterordner-Namen"
            s = "Bitte geben Sie unten den gewünschten Suchstring ein"
            strFilterExplorer = Replace(strFilterExplorer, "*", "")
            s = InputBox(s, t, strFilterExplorer)
            If s <> "" Then
                s = "*" & s & "*"
            End If
            strFilterExplorer = s
            strTT = strTT & vbNewLine & _
                    "momentan gesetzter Filter = " & strFilterExplorer
        Case 40 'Lösche Datei...'
            If strID = "" Then
                s = "File muss in der Liste rechts markiert sein!"
                GoTo ErrM
            End If
            If glDMS = "DATEV DMS" Then
                s = "VERBOTEN"
                GoTo ErrM
            End If
            s = "JA          Lösche nur markierte Zeile!" & vbNewLine & Me!lstExplorer.column(1) & vbNewLine
            i = Me!lstExplorer.ListCount - 1
            If Me!lstExplorer.column(1, 1) = "Basis-Ordner" Then
                i = i - 1
            End If
            i = OH_JA(, , i)
            If i = 0 Then
                GoTo ErrEnd
            End If
            If strD = "DMS" Then
                strSQL = strQ & _
                        ",@b = " & i & _
                        ",@n = " & Val(strID)
                OH_EX
            Else
                If i = 1 Then
                    OH_KILL strID
                Else
                    For i = 1 To Me!lstExplorer.ListCount
                        OH_KILL Nz(Me!lstExplorer.column(0, i))
                    Next i
                End If
            End If
            Me!lstExplorerAct = 8
            lstExplorerAct_AfterUpdate
            GoTo ErrEnd
        Case 98, 99 'Hilfe anzeigen
            strFilterExplorer = ""
            strSQL = strQ
            lgCC = 2
            strCW = OH_ColumnWidthsMM("0,10")
        Case Is > 30, Is < 39
            strFilterExplorer = lstExplorerAct.column(1)
            If strFilterExplorer = "kein Filter" Then
                strFilterExplorer = ""
            End If
        End Select
        OH_ResetID
        strSQL = strQ & _
            ",@d = '" & strFilterExplorer & "'"
        strCW = OH_ColumnWidthsMM("15;90;20;20;70")
        lgCC = 5
        Select Case strD
        Case "DMS"
            Select Case glDMS
            Case "DATEV DMS"
                OH_ListDMS Me!NrAdrZuord, "", "Funktion"
                strCW = OH_ColumnWidthsMM("0;70;20")
                lgCC = 3
            Case "ELO" '<R216>
                strSQL = "Execute dbo.DMS_ELO " & _
                        " @x = 'ELO_Dokliste'" & _
                        ",@f = 'KD'" & _
                        ",@i = " & Me!NrAdrZuord & _
                        ",@a = 2"
                OH_A "lstexplorer", strSQL, Me
            GoTo ErrEnd
            End Select
        Case "ALTE DATEN"
            OH_A "lstExplorer", strSQL
        End Select
        With Me!lstExplorer
            .ColumnCount = lgCC
            .ColumnWidths = strCW
             OH_A "lstexplorer", strSQL, Me
             Select Case left(Me!lstExplorer.column(1, 1), 9)
             Case "Noch kein", "String or"
                OH_A "lstExplorerAct", "@f = 'StopAnzeige'", Me
                Me!lstExplorerAct = 99
                lstExplorerAct_AfterUpdate
             End Select
        End With
    Case 10, 11, 12, 13, 14
        DoCmd.openForm "frmSchlagwort", , , , , , "Adresse"
    Case 19, 20
        If ctl.ListCount <= 1 And lgA = 20 Then
            OH_explorer
            GoTo ErrEnd
        End If
        If strID = "" Then
            s = "Bitte in der Liste rechts den entsprechenden Datensatz markieren!"
            GoTo ErrM
        End If
        If lgA = 20 And InStr(right(strID, 5), ".") > 0 Then
            strID = OH_GetPathPart(strID)
        End If
        If InStr(strID, "\") > 0 Then
            OH_LaunchDocument 0, strID
        Else
            Select Case glDMS
            Case "SQL"
                If strID <> "" Then
                    strID = OH_LoadFileFromDB(strID)
                End If
                If strID <> "" Then
                    OH_LaunchDocument 1, strID
                End If
            Case "ELO"
                OH_ELO_ShowFile Val(strID)
            Case Else
                OH_ShowDMSDocument strID
            End Select
        End If
    Case Else
        GoTo ErrEnd
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstExplorerAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstOutlookAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strf As String
    Dim strE As String
    Dim strQ As String
    Dim lgact As Long
    Dim N As Long
    DoCmd.Hourglass True
    lgact = Nz(Me!lstOutlookAct, 0)
    Set ctl = Me!lstOutlook

    strQ = "Exec dbo.spa_Adresse " & _
             " @x = 'lstOutlookAct'" & _
             ", @a =" & lgact & _
             ", @n =" & Me!NrFunktion & _
             ", @u =" & lguser
    t = Me!lstOutlookAct.column(1)
    Select Case lgact
    Case 0
        N = 0
        For Each x In ctl.ItemsSelected
            lgid = Val(Nz(ctl.column(0, x), 0))
            If lgid > 0 Then
                OH_OF "F_Adresse", lgid
            Else
                strE = ctl.column(1, x)
                Me!txtFind = strE
                txtFind_AfterUpdate
                s = strE & vbNewLine & _
                    "ist NICHT mit Outlook synchronisiert!"
                GoTo ErrM
            End If
            GoTo ErrEnd
        Next x
        If N = 0 Then
            s = "Bitte rechts eine Adresse markieren!"
            GoTo ErrM
        End If
    Case 10, 11, 12
        i = 12
        If Me!lstOutlookAct = 12 Then
            s = "Liste die letzten x neu erstellten Outlook-Kontakte auf"
            i = Val(InputBox(s, t, i))
        End If
        If i = 0 Then
            GoTo ErrEnd
        End If
        i = OH_ContactOutlook(i)
        If i > 0 Then
            strSQL = "Exec dbo.spa_Adresse " & _
                    " @x = 'ContactOutlook'"
        Else
            strSQL = ""
        End If
        OH_A "lstOutlook", strSQL
    Case 20, 21 'Liste neue Datenbank-Kontake
        If lgact = 21 Then 'Datum anpassen
            s = "Bitte Datum anpassen" & vbNewLine & _
                "Mit diesem Datum können Sie definieren, welche Datenbank-Kontakte gezeigt werden sollen (Änderungsdatum)"
            s = InputBox(s, t, Trim(Me!lstOutlookAct.column(1)))
            If s = "" Then
                GoTo ErrEnd
            End If
            s = LTrim(Replace(s, "seit", ""))
            s = OH_CheckDatumTxt(s, True)
            If s = "" Then
                GoTo ErrEnd
            End If
        End If
        strSQL = strQ & _
                    ", @dt ='" & s & "'"
        OH_A "lstOutlook", strSQL
    Case 30     'markierte Kontakte in Outlook abgleichen
                'Schleife durch Liste
        N = OH_InsertID_LST(Me!lstOutlook, True, True)
        If N = 0 Then
            s = "Bitte rechts mindestens eine Adresse markieren!"
            GoTo ErrM
        Else
            s = "markierte Adressen (" & N & ") nach Outlook schicken?"
            If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        N = OH_SyncAddContactOutlook(0, 1)
        If N > 0 Then   'das erfolgreiche Synchronisieren eintragen in Stichworte
            OH_A "@x = 'OutlookKontakt' , @a = 2,@u = " & lguser
            OH_EX
            regD_Change
        End If
    Case 35
        Set ctl = Me!lstOutlook
        N = 0
        For Each x In ctl.ItemsSelected
            N = N + 1
        Next x
        If N = 0 Then
            s = "Bitte rechts mindestens eine Adresse markieren!"
            GoTo ErrM
        End If
        s = "markierte Adressen (" & N & ") " & vbNewLine & _
                    "in Outlook unwiderruflich löschen?"
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbCancel Then
            GoTo ErrEnd
        End If
        N = 0
        For Each x In ctl.ItemsSelected
           N = N + OH_SyncContactOutlook(Val(ctl.column(0, x)), Nz(ctl.column(2), ""), 35)
        Next x
        If N > 0 Then
            s = "markierte Adressen (" & N & ")" & vbNewLine & _
                    "wurden in Outlook unwiderruflich gelöscht!"
            MsgBox s, vbInformation, t
        Else
            s = "Abgleich war nicht erfolgreich!" & vbNewLine & _
                    "ID bzw. Emailadresse war nicht zu finden in Outlook!"
            GoTo ErrM
        End If
    Case 37
        s = ""
        strSQL = "Exec dbo.spa_Adresse " & _
                " @x = 'OutlookKontakt' " & _
                ",@i = " & lguser & _
                ",@a = 1"
        OH_r r
        If r.BOF Then
            s = "Vorschlag letzte 30 Tage"
            strE = Format(Date - 30, "yyyymmdd")
        Else
            strE = Format(r!Date, "yyyymmdd")
            s = "Ihr letzter Outlook-Abgleich war am:"
        End If
        OH_SyncAddContactOutlook 0, 0, strE
    Case 40
        s = "JA" & vbNewLine & "Jetzt werden A L L E von der Datenbank angelegten Adressen in Outlook gelöscht " & _
            "und alle aktiven Adressen wieder nach Outlook kopiert!" & vbNewLine & vbNewLine & _
            "NEIN" & vbNewLine & "Nur die von mir  als <IMMER abgleichen> gekennzeichneten Adressen synchonisieren"
        i = MsgBox(s, vbQuestion + vbYesNoCancel + vbDefaultButton2, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbYes
            strSQL = "Exec dbo.spa_Adresse " & _
                    "@x = 'OutlookKontakt' " & _
                    ",@a = 3"
            OH_r r
            i = r!CT
            s = "Wollen Sie wirklich " & i & " Adressen abgleichen?"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
            OH_SyncAddContactOutlook 0, 4
        Case vbNo
            OH_SyncAddContactOutlook 0, 5
        End Select
    Case 41
        s = "Nur die von mir  als <IMMER abgleichen> gekennzeichneten Adressen synchonisieren"
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
            OH_SyncAddContactOutlook 0, 5
        End If
    Case 50, 51 '50 = zeige Mails an Adresse, 51 = zeige Mails von Adresse'
        For Each x In ctl.ItemsSelected
            strE = ctl.column(2, x)
            If strE = "" Then
                s = "keine Mailadresse vorhanden"
                GoTo ErrM
            End If
            If Me!lstOutlookAct = 50 Then
                s = "an"
            Else
                s = "von"
            End If
            Dim myOlApp As New Outlook.Application
            myOlApp.ActiveExplorer.ClearSearch
            s = s & ":(" & strE & ")"
            myOlApp.ActiveExplorer.search s, olSearchScopeAllFolders
        Next x
        myOlApp.ActiveWindow
        Set myOlApp = Nothing
    Case 60, 61 'Immer mit Outlook abgleichen' 'Nie mit Outlook abgleichen'
        OH_EX strQ
        If lgact = 60 Then
            OH_ResetID
            OH_InsertID Me!NrFunktion
            OH_SyncAddContactOutlook i
        End If
        If lgact = 61 Then
            i = OH_SyncContactOutlook(Me!NrFunktion, Nz(Me!EMail, ""), 35)
            If i <> 0 Then
                s = Nz(Me!EMail, "") & " wurde in Outlook gelöscht!"
                GoTo ErrM
            End If
        End If
    Case 70, 71 'Liste Immer mit Outlook abgleichen' 'Nie mit Outlook abgleichen'
        OH_A "lstOutlook", strQ
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstOutlookAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstWichtigeInfoAct_AfterUpdate() '251014 neu nach ULIS Einwand
On Error GoTo ErrMsg
    Dim lgact As Long
    Dim lgid As Long
    Dim strQ As String
    Dim strWichtigeInfoTitel As String
    Dim strWichtigeInfo As String
    t = "WICHTIGE INFOS " & Nz(Me!lstWichtigeInfoAct.column(1))
    strWichtigeInfoTitel = OH_RPL(Me!wichtigeInfoTitel)
    strWichtigeInfo = OH_RPL(Me!wichtigeInfo)
    lgact = Nz(Me!lstWichtigeInfoAct, 0)
    lgid = Nz(Me!lstWichtigeInfo.column(0), 0)
    OH_A "@x = 'lstWichtigeInfoAct'" & _
        ",@a = " & lgact & _
        ",@i = " & Nz(Me!NrFunktion, 0) & _
        ",@n = " & lgid & _
        ",@f = '" & strWichtigeInfoTitel & _
        "',@d = '" & strWichtigeInfo & "'"
    strQ = strSQL
    Select Case lgact
    Case 10
         Me!lstWichtigeInfoAct.Tag = 10
         Me!wichtigeInfoTitel = ""
         Me!wichtigeInfoTitel.SetFocus
         Me!wichtigeInfo = ""
    Case 20
         Me!wichtigeInfoTitel.SetFocus
    Case 21
        strSQL = strQ & _
            ",@s = '" & Me!lstWichtigeInfoAct.Tag & "'"
        Me!lstWichtigeInfoAct.Tag = ""
        s = "NEUE Wichtige Info"
        Select Case strWichtigeInfoTitel
        Case s, ""
            Me!wichtigeInfoTitel.SetFocus
            s = s & vbNewLine & vbNewLine & "Titel BITTE anpassen"
        End Select
        If Nz(Me!wichtigeInfo, "") = "" Then
            s = s & vbNewLine & vbNewLine & "Bitte Beschreibung"
        End If
        If Len(s) > 20 Then
            If MsgBox(s, vbExclamation + vbOKCancel, t) = vbCancel Then
                Me!btnwichtigeInfoSave.Enabled = False
            End If
            GoTo ErrEnd
        End If
        OH_r r
        lgid = r!ID
        OH_RQ Me!lstWichtigeInfo, lgid
        lstWichtigeInfo_AfterUpdate
        Me!btnwichtigeInfoSave.Enabled = False
    Case 40, 41
        If lgact = 41 And lgid > 0 Then
            s = "Bitte bestätigen"
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        OH_EX
        OH_RQ Me!lstWichtigeInfo
        Me!lstWichtigeInfo = Me!lstWichtigeInfo.column(0, 1)
        lstWichtigeInfo_AfterUpdate
        OH_ShowWichtigeInfo "change"
    Case 100
        OH_ShowWichtigeInfo "change"
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstWichtigeInfoAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstWichtigeInfo_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strWichtigeInfoTitel As String
    Dim strWichtigeInfo As String
    lgid = Nz(Me!lstWichtigeInfo.column(0), 0)
    If lgid = 0 Then
        strWichtigeInfoTitel = ""
        strWichtigeInfo = ""
    Else
        OH_A "@x = 'lstWichtigeInfoAct'" & _
            ",@a = 20 " & _
            ",@i = " & lgid
        OH_r r
        strWichtigeInfoTitel = Nz(r!Stichwort, "")
        strWichtigeInfo = Nz(r!BemStichwort, "")
    End If
    Me!wichtigeInfoTitel = strWichtigeInfoTitel
    Me!wichtigeInfoTitel.SetFocus
    Me!wichtigeInfo = strWichtigeInfo
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_Adresse.lstWichtigeInfo_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub wichtigeInfoTitel_AfterUpdate()
    Me!wichtigeInfo.SetFocus
End Sub
Private Sub wichtigeInfoTitel_Change()
    Me!btnwichtigeInfoSave.Enabled = True
End Sub
Private Sub wichtigeInfo_Change()
    Me!btnwichtigeInfoSave.Enabled = True
End Sub
Private Sub btnwichtigeInfoSave_Click()
On Error GoTo ErrMsg
    Me!lstWichtigeInfoAct = 21
    lstWichtigeInfoAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnwichtigeInfoSave"
    Resume ErrEnd
End Sub
Private Sub btnWichtigeInfo_Click()
On Error GoTo ErrMsg
    OH_ShowWichtigeInfo "change"
    Me.regd = 12
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnWichtigeInfo_Click"
    Resume ErrEnd
End Sub

Private Sub lstWv_Click()
On Error GoTo ErrMsg
    OH_lstWV_CLick Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstWv_Click"
    Resume ErrEnd
End Sub
Private Sub Nachname_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!FP = 0 Then
        s = Me!Vorname & " " & Me!Nachname
    Else
        s = Me!Nachname & ", " & Me!Ort
    End If
    OH_CB s
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Nachname_DblClick"
    Resume ErrEnd
End Sub

Private Sub NrFunktion_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_MarkerYesOne Me
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.NrFunktion_DblClick"
    Resume ErrEnd
End Sub

Private Sub OutlookVorlage_GotFocus()
On Error GoTo ErrMsg
    OH_A "OutlookVorlage"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.OutlookVorlage_GotFocus"
    Resume ErrEnd
End Sub
Private Sub comMailServer_GotFocus()
    OH_A "comMailServer"
End Sub
Private Sub pic_Click() '<R98>
On Error GoTo ErrMsg
    i = Me!lstPic.ListIndex + 1
    If i >= Me!lstPic.ListCount Then
        i = 0
    End If
    Me!lstPic = Me!lstPic.column(0, i)
    lstPic_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.pic_Click"
    Resume ErrEnd
End Sub
Private Sub Pic_DblClick(Cancel As Integer) '<R98>
    OH_LaunchProgram 1, Me!Pic.picture
End Sub
Private Sub txtDate_DblClick(Cancel As Integer)
    OH_OpenKalender
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgI As Long
    Dim strf As String
    Dim strFeld As String
    DoCmd.Hourglass True
    Me.RegMain = 0
    OH_SaveRS Me, True
    Me!txtFind.SetFocus
    strf = Replace(Nz(Me!txtFind.Text, ""), "*", "%")
    Select Case left(Me!txtFind, 2)
    Case "N:", "V:"
        OH_VG
        Set frm = Forms!F_VG
        If left(strf, 2) = "V:" Then
            strf = Trim(Mid(strf, 3))
        End If
        frm!txtFind = strf
        frm.txtFind_AfterUpdate
        GoTo ErrEnd
    Case "S:"
        Me!lstV = 0
        If Me!lstA > 2 Then
            Me!lstA = 0
        End If
    End Select
    strFeld = Nz(Me!lstfeld.column(0), "0")
    Select Case strFeld
    Case "TelefonSuche", "Mobilsuche"
        strf = Replace(strf, " ", "")
    End Select
    lgI = Nz(Me!lstA, 0)
    OH_A " @x = 'lst' " & _
         ", @i = " & lgI & _
         ", @a = " & Nz(Me!lstAktiv, 0) & _
         ", @b = " & Nz(Me!lstOrder, 0) & _
         ", @f = '" & OH_RPL(strf) & _
         "',@d = " & Nz(Me!lstTopA, "0") & _
         ", @e = '" & Nz(Me!comArtZuord, "0") & _
         "',@g = '" & strFeld & _
         "',@n = " & Nz(Me!lstTopA, 0) & _
         ", @u = " & lguser & _
         ", @o = " & Nz(Me!lstV, 0), , Me
    OH_txtFind Me, strSQL
    If lgI = 14 And Me!countRec > 0 Then
        Me!lstWv.SetFocus
    End If
    If (lgI <> 0 _
        Or Me!lstfeld <> "0" _
        Or Me!comArtZuord <> 0 _
        Or Me!lstV <> 0 _
        Or Me!lstAktiv <> 1) And Me!countRec = 0 Then
        t = Trim(Me!lstA.column(1)) & ": Adress-Suche NICHT erfolgreich"
        s = "Nix zu finden mit *" & strf & "*" & vbNewLine & vbNewLine & _
            "Soll in ALLEN (aktiven) Adressen nochmal gesucht werden?"
        If MsgBox(s, vbExclamation + vbOKCancel, t) = vbCancel Then
            Me!txtFind = ""
        End If
        OH_ResetFilterFrm
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Function OH_ResetFilterFrm()
On Error GoTo ErrMsg
    Me!lstA = 0
    Me!lstV = 0
    Me!lstAktiv = 1
    Me!lstfeld = "0"
    Me!comArtZuord = 0
    lstA_AfterUpdate
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_ResetFilterFrm"
    Resume ErrEnd
End Function
Private Sub comArtZuord_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!comArtZuord = "0"
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comArtZuord"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.txtFind_DblClick"
    Resume ErrEnd
End Sub
Private Sub btntxtFind_Click()
    txtFind_AfterUpdate
End Sub
Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!comtxtFind
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comArtZuord_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comArtZuord"
    Resume ErrEnd
End Sub
Private Sub btnPF_Tab_Click()
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse btnPF_Tab_Click"
    Resume ErrEnd
End Sub

Private Sub OH_CheckNummern()
On Error GoTo ErrMsg
    Dim lgA As Long
    If OH_ChangeSameNr("Telefon", varOldTelefon) = 2 Then GoTo ErrEnd
    If OH_ChangeSameNr("Fax", varOldFax) = 2 Then GoTo ErrEnd
    If OH_ChangeSameNr("eMail", varOldeMail) = 2 Then GoTo ErrEnd
    If OH_ChangeSameNr("Internet", varOldInternet) = 2 Then GoTo ErrEnd
    If OH_ChangeSameNr("Mobil", varOldMobil) = 2 Then GoTo ErrEnd
    If IsNull(varOldeMail) And _
        Not IsNull(Me!EMail) And _
        Me!FunktionErfasst = Date Then
            lgA = MsgBox("Mail mit <Ihre persönlichen Daten> senden?" & vbNewLine & vbNewLine & _
                    "Ja" & vbTab & vbTab & "Outlook sofort öffnen mit Standard-Text" & vbNewLine & _
                    "Nein" & vbTab & vbTab & "Standard-Text vorher bearbeiten!" & vbNewLine & _
                    "Abbrechen" & vbTab & "keine Aktion starten!", _
                     vbExclamation + vbYesNoCancel, Me!namen)
            If lgA = vbCancel Then
                Exit Sub
            Else
                Me!StandardText = "Ihre persönlichen Daten"
                StandardText_AfterUpdate
            End If
            If lgA = vbYes Then
                OH_tlbPrint
            End If
    Else
        varOldeMail = Null
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_CheckNummern"
    Resume ErrEnd
End Sub
Private Sub Funktion_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Select Case Me!Funktion
    Case "privat"
        s = "Hobby"
    Case "Zentrale", "Tochter"
        s = "Kd.-Nr."
    Case Else
        s = "Abteilung"
    End Select
    Me!lblAbteil.Caption = s
    Me!lblAbteil.ControlTipText = "Alle Adressen anzeigen mit " & s & "= " & Me!Funktion
    Me!Abteil.ControlTipText = s

ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Funktion_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub funktion_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!Funktion
    Case "Geschäftsführer"
        If IsNull(Me!Abteil) Then Me!Abteil = "Geschäftsführung"
    Case "Ehepartner"
        strSQL = "SELECT * FROM A_FunktionAdresse " & _
                " WHERE IDAdresse=" & Me!NrAdrZuord & _
                " AND NrAdrZuord=" & Me!NrAdrZuord
        OH_r r
        If Not r.BOF Then
            If IsNull(Me!Strasse) Then Me!Strasse = r!Strasse
            If IsNull(Me!PostAdr) Then Me!PostAdr = r!PostAdr
            If IsNull(Me!Land) Then Me!Land = r!Land
            If IsNull(Me!PLZStrasse) Then Me!PLZStrasse = r!PLZStrasse
            If IsNull(Me!Ort) Then Me!Ort = r!Ort
            If IsNull(Me!Telefon) Then Me!Telefon = r!Telefon
            If IsNull(Me!Fax) Then Me!Fax = r!Fax
            If IsNull(Me!EMail) Then Me!EMail = r!EMail
            If IsNull(Me!Mobil) Then Me!Mobil = r!Mobil
            If IsNull(Me!Internet) Then Me!Internet = r!Internet
        End If
    End Select
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.funktion_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub GebTag_Change()
On Error GoTo ErrMsg
    If Len(Me!GebTag.Text) = 4 And InStr(Me!GebTag.Text, ".") = 0 Then
        Me!GebTag = "01.01." & Me!GebTag.Text
        Me!Strasse.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.GebTag_Change"
    Resume ErrEnd
End Sub
Private Sub GebTag_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Me!GebTag.BackColor = vbWhite
    If Format(Nz(Me!GebTag, ""), "ddmm") = Format(Date, "ddmm") Then
        Me!GebTag.BackColor = vbGreen
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.GebTag_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Gebtag_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_FilterDate Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Gebtag_DblClick"
    Resume ErrEnd
End Sub
Private Sub Land_AfterUpdate()
On Error GoTo ErrMsg
    Me!PLZStrasse.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Land_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Land_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Land_Enter"
    Resume ErrEnd
End Sub
Private Sub Land_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Dim strLand As String
    Response = acDataErrContinue
    Me!Land.Undo
    s = NewData & " jetzt als Land erfassen?" & vbNewLine & vbNewLine & _
            "bitte gut überlegen, ob nicht schon mit ähnlichem Namen vorhanden!" & vbNewLine & _
            "In der Ländertabelle sollten Sie anschliessend auch die Währung und den Kurs eintragen!" & vbNewLine & _
            "Tragen Sie unten den Ländernamen ein!"
    OH_msgbox s, Array("Land eintragen"), vbQuestion, _
                        NewData & " ist noch nicht erfasst.", , "Ländername"
    If Val(strMSG(1)) = 1 Then
        If InStr(strMSG(3), "Ländername") = 0 Then
            OH_A " @x = 'InsertLand', " & _
                " @f = '" & NewData & "', " & _
                " @d = '" & strMSG(3) & "'"
            OH_EX
            OH_RQ Me!Land
            Me!Land = NewData
            Me!PLZStrasse.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Land_NotInList"
    Resume ErrEnd
End Sub
Private Sub EndeFunktion_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!EndeFunktion <= Date And Me!CounterFunktion > 0 Then
        If MsgBox(Me!namen & " wurde " & Me!CounterFunktion & " mal angewählt!" & vbNewLine & _
                  "Zähler <Anzahl Anwahl> - siehe Register Änderungen- zurücksetzen auf 0?", _
                  vbYesNo + vbQuestion, _
                  "Ende der Funktion am " & Me!EndeFunktion) = vbYes Then
            Me!CounterFunktion = 0
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.EndeFunktion_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub EndeFunktion_AfterUpdate()
On Error GoTo ErrMsg
    If Me!EndeFunktion <= Date Then
        Me!Nachname.BackColor = vbRed
        Me.Det.BackColor = 14277119
    Else
        Me!Nachname.BackColor = vbWhite
        Me.Det.BackColor = -2147483633
    End If
    Me!EndeFunktion.BackColor = Me!Nachname.BackColor
    Me!Anschrift.BackColor = Me!Nachname.BackColor
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.EndeFunktion_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub EndeFunktion_LostFocus()
On Error GoTo ErrMsg
    If Me.Dirty = True Then
        EndeFunktion_AfterUpdate
        EndeFunktion_BeforeUpdate (0)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.EndeFunktion_LostFocus"
    Resume ErrEnd
End Sub

Private Sub EndeFunktion_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!EndeFunktion) Then
        Me!EndeFunktion = Date
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.EndeFunktion_DblClick"
    Resume ErrEnd
End Sub


Private Sub lstKontakt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_CountAction
    OH_SetRS Me, Me!lstKontakt
    Me!lstKontakt.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstKontakt_DblClick"
End Sub
Private Sub LstLeistung_AfterUpdate()
On Error GoTo ErrMsg
    Me!btnLeistungNeu.Visible = True
    Me!btnLeistungNeu.Caption = "erstelle neue Leistung zu Projekt " & Me!LstLeistung.column(7)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.LstLeistung_AfterUpdate"
End Sub
Private Sub LstLeistung_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strf As String
    OH_CountAction
    strf = "F_Leistung"
    OH_OF strf, Nz(Me!LstLeistung, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.LstLeistung_DblClick"
    Resume ErrEnd
End Sub
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!lstM, 0)
    If lgid > 0 Then
        OH_SetRS Me, lgid
    End If
    Me!lstM.SetFocus
    Select Case Me!lstMdo
    Case 300 'doppelte Adressen
        OH_A "@x = 'Top'" & _
                    ",@i = 302" & _
                    ",@a = " & Me!lstM
        OH_EX
        strSQL = "Exec dbo.spa_Adresse vwID"
        OH_A "lstDet", strSQL, Me
        Me!countRec = Me!lstDet.ListCount
        Me!lstDet.Selected(1) = True
        Me.lstDet_AfterUpdate
        Me!lstA = 0
        Me!lstV = 0
        Me!lstAktiv = 2
        Me!txtFind = Null
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstM_Afterupdate"
    Resume ErrEnd
End Sub
Private Sub lstVG_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_CountAction
    OH_OF "F_VG", Nz(Me!lstVG, 0)
    Forms!F_VG!lstFirma.SetFocus
    Me!lstVG.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstVG_DblClick"
    Resume ErrEnd
End Sub
Private Sub Marker_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    OH_tlbMarker
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Marker_MouseDown"
    Resume ErrEnd
End Sub
Private Sub Nachname_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If OH_Validate(Me!Nachname, "Name", False) = True Then
        Cancel = True
    Else
        Cancel = OH_CheckChange(Me!Nachname, Me)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Nachname_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Nachname_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    If Me!FP = 0 Then
        Me!Vorname.SetFocus
    Else
        Me!Beruf.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Nachname_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub NrMitarbeiter_beforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
'EFAbsenderKlein Einstellung des Absenders für Etiketten-Kurzabsender!
    If Nz(Me!NrMitarbeiter, 0) <> 0 Then
        regMain_Change
        lguser = Me!NrMitarbeiter
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.NrMitarbeiter_beforeUpdate"
    Resume ErrEnd
End Sub
Private Sub NrMitarbeiter1_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Z " & _
            " @x = 'NrMitarbeiter'"
    OH_A "NrMitarbeiter1", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.NrMitarbeiter1_Enter"
    Resume ErrEnd
End Sub
Private Sub NrVG_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgVG As Long
    lgVG = Nz(Me!NrVG, 0)
    If lgVG > 0 Then
        strSQL = "Exec dbo.spa_VG " & _
                " @x = 'InsertBem' , " & _
                " @f = 'VG'," & _
                " @i = " & lgVG
        OH_r r
        Me!StandardText = Me!NrVG.column(2)
        Me!txtMemo = r!Bem
    End If
    StandardText_AfterUpdate
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.NrVG_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub lstAktiv_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind.SetFocus
    txtFind_AfterUpdate
    Me!lstAktiv.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstAktiv_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Dim strQ As String
    Dim strf As String
    Dim strX As String
    DoCmd.Hourglass True
    OH_SaveRS Me, True
    strX = Nz(Trim(Me!pageFunktion.Caption))
    Select Case Me.regd
    Case 0
        strf = Nz(Me!comStichwortFilter, "")
        strSQL = "EXECUTE spa_Stichwort " & _
            " @x = 'mitFilter'" & _
            ",@cID =  '" & Nz(Me!lstStichwortGr, "") & _
            "',@ID =  " & Nz(Me!NrFunktion, 0) & _
            ",@fi = '" & OH_RPL(strf) & "'"
        OH_A "lstStichwort", strSQL, Me
        OH_lstStichwortAct Me
        OH_CreateCmb Me!lstStichwort, Me!lstStichwortAct, Me
        If strf = "" Then
            Me!lstStichwort.BorderColor = vbBlack
            Me!lstStichwort.BorderWidth = 1
        Else
            If Me!lstStichwort.ListCount < 1 Then
                Me!lstStichwort.BorderColor = vbRed
            Else
                Me!lstStichwort.BorderColor = vbGreen
            End If
            Me!lstStichwort.BorderWidth = 5
        End If
    Case 1
        OH_A "lstKontaktAct", , Me
        OH_A "lstKontaktActA", , Me
        OH_A "lstKontakt", _
            " @i = " & Me!NrFunktion & _
            ",@a = " & Me!lstKontaktAct & _
            ",@b = " & Nz(Me!lstKontaktActA, 1), Me
        OH_CreateCmb Me!lstKontakt, Me!lstKontaktAct, Me
    Case 2
        If lgVGActVorgabe = 0 Then   'Stichworte des aktuellen Users suchen
            OH_A "@x = 'lstVGAct'" & _
                ", @i = " & lguser & _
                ", @a = 3"
            OH_r r
            lgVGActVorgabe = r!Msg
            Me!lstVGAct = lgVGActVorgabe
            If lgVGActVorgabe = 0 Then
                Me!lstVGAct = 2
            End If
        End If
        If Me!IDAdresse = Me!NrAdrZuord Then
            s = Me!Nachname & " und MA's"
        Else
            s = Me!Wo
        End If
        s = left("Vorgänge mit " & s & vbNewLine & _
            "direkte Vorgänge mit " & strX & " = (X)" & vbNewLine & _
            "Vorgänge zu Firma = (Z)" & vbNewLine & _
            "Zugeordnete Vorgänge = (Z)" & vbNewLine & _
            "Sortierung:  Datum abst., ProjektNr abst. , lastUpdate abs.", 255)
        If Nz(Me!lstVGAct, 5) > 4 Then
            Me!lstVGAct = 2
        End If
        OH_A "@x = 'lstVGAct'" & _
            ",@i = " & Me!NrFunktion & _
            ",@b = " & Me!NrAdrZuord & _
            ",@a =-1"
        OH_EX
        OH_A "lstVG", "@a = " & Nz(Me!lstVGAct)
        Me!lstVG.ControlTipText = s
        OH_A "lstVGSum"
        OH_A "lstVGAct", "@f = '" & OH_RPL(strX) & "'" '250820
        OH_CreateCmb Me!lstVG, Me!lstVGAct, Me
    Case 3
        strSQL = "Exec dbo.spa_Adresse 'lstLeistung'"
        Select Case Me!FP
        Case 0
           strSQL = strSQL & " ," & Me!NrFunktion & ",0"
        Case Else
           strSQL = strSQL & " ," & Me!NrAdrZuord & ",1"
        End Select
        OH_A "LstLeistung", strSQL
        If IsNull(Me!LstLeistung.column(3)) Then
            Me!btnLeistungNeu.Visible = False
        Else
            Me!btnLeistungNeu.Visible = True
            Me!btnLeistungNeu.Caption = "erstelle eine neue Leistung zum markierten Projekt"
        End If
    Case 4
        s = "Artikel-Aktionen mit " & Me!Nachname
        Me!LstArtikelAct.ControlTipText = s
        OH_A "lstArtikelAct", , Me
        Select Case Me!LstArtikelAct
        Case 10, 50
        Case Else
            Me!LstArtikelAct = 10
        End Select
        lstArtikelAct_AfterUpdate
        OH_CreateCmb Me!LstArtikel, Me!LstArtikelAct, Me
    Case 5
        lstMdo_AfterUpdate
        Me!lstM.ColumnWidths = "0cm;7cm;7cm;5cm"
    Case 6
        OH_A "lstOutlookAct", "@u = " & lguser
        OH_CreateCmb Me!lstOutlook, Me!lstOutlookAct, Me
    Case 7
        OH_A "lstPictureAct"
        OH_A "@x ='lstPicture'," & _
            " @i = " & Me!NrFunktion, , Me
        OH_A "lstPicture", strSQL
        Me!picture.picture = ""
        Me!lblBilder.Visible = True
        If Me!lstPicture.ListCount > 1 Then
            Me!lblBilder.Visible = False
            strf = Nz(Me!lstPicture.column(0, 2), "")
            If strf <> "" Then
                If Len(Dir(strf)) > 0 Then
                    Me!lstPicture = strf
                    Select Case right(Nz(Me!lstPicture, ""), 3)
                    Case "PDF"
                    Case Else
                        Me!picture.picture = Nz(Me!lstPicture, "")
                    End Select
                End If
            End If
        End If
        OH_CreateCmb Me!lstPicture, Me!lstPictureAct, Me
   Case 8
        OH_A "lstExplorerSource", , Me
        lstExplorerSource_AfterUpdate
    Case 9
        OH_lstWv Me
        OH_CreateCmb Me!lstWv, Me!lstWvAct, Me
    Case 10
        strSQL = "Exec dbo.spA_Audit 'lstAuditAct'"
        OH_A "lstAuditAct", strSQL
        Me!lstAuditAct = 10
        lstAuditAct_AfterUpdate
        OH_CreateCmb Me!lstAudit, Me!lstAuditAct, Me
    Case 11
        OH_A "lstDSGVOact", , Me
        OH_A "@x ='lstDSGVO'" & _
            ",@i = " & Me!NrFunktion, , Me
        OH_A "lstDSGVO", strSQL
        OH_CreateCmb Me!lstDSGVO, Me!lstDSGVOact, Me
    Case 12
        OH_A "lstWichtigeInfoAct", , Me
        OH_A "@x ='lstWichtigeInfo'" & _
            ",@i = " & Me!NrFunktion, , Me
        OH_A "lstWichtigeInfo", strSQL
        Me!lstWichtigeInfo = Me!lstWichtigeInfo.column(0, 1)
        lstWichtigeInfo_AfterUpdate
        OH_CreateCmb Me!lstWichtigeInfo, Me!lstWichtigeInfoAct, Me
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 52 'Dateiname falsch
        Resume ErrEnd
    Case Else
        s = Err.number & " " & Err.Description
        t = "F_Adresse.regD_Change"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Titel_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Titel_Enter"
    Resume ErrEnd
End Sub
Private Sub AdrSecurity_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter 0, Me!ArtAdresse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.AdrSecurity_Enter"
    Resume ErrEnd
End Sub
Private Sub Beruf_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter 0, Me!ArtAdresse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Beruf_Enter"
    Resume ErrEnd
End Sub
Private Sub Funktion_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter 0, Me!ArtAdresse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Funktion_Enter"
    Resume ErrEnd
End Sub
Private Sub Abteil_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter Me!NrAdrZuord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Abteil_Enter"
    Resume ErrEnd
End Sub
Private Sub BauBuero_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter Me!NrAdrZuord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.BauBuero_Enter"
    Resume ErrEnd
End Sub
Private Sub NrVG_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter Me!NrAdrZuord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.NrVG_Enter"
    Resume ErrEnd
End Sub
Private Sub comNrAdrZuord_Enter()
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_A "comNrAdrZuord"
    Me!comNrAdrZuord = Me!NrAdrZuord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.comNrAdrZuord_Enter"
    Resume ErrEnd
End Sub
Private Function OH_FCopy(ctlF As control)
On Error GoTo ErrMsg
    If Not OH_Validate(ctlF, ctlF.ControlTipText) Then
        OH_CB (ctlF)
        ctlF.SetFocus
        Beep
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.OH_FCopy"
    Resume ErrEnd
End Function
Private Sub btnCopyTelefon_Click()
On Error GoTo ErrMsg
    OH_FCopy Me!Telefon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnCopyTelefon_Click"
    Resume ErrEnd
End Sub
Private Sub btnCopyFax_Click()
On Error GoTo ErrMsg
    OH_FCopy Me!Fax
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnCopyFax_Click"
    Resume ErrEnd
End Sub
Private Sub btnCopyeMail_Click()
On Error GoTo ErrMsg
    OH_FCopy Me!EMail
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnCopyeMail_Click"
    Resume ErrEnd
End Sub
Private Sub btnCopyInternet_Click()
On Error GoTo ErrMsg
    OH_FCopy Me!Internet
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnCopyInternet_Click"
    Resume ErrEnd
End Sub
Private Sub btnCopyHandy_Click()
On Error GoTo ErrMsg
    OH_FCopy Me!Mobil
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnCopyHandy_Click"
    Resume ErrEnd
End Sub
Public Sub OH_VorgangSchieben()
On Error GoTo ErrMsg
    Me!lstVG.SetFocus
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_VorgangSchieben"
    Resume ErrEnd
End Sub
Public Sub OH_SucheGebTage()
On Error GoTo ErrMsg
    Dim lgReportNr As Long
    Dim von As Long
    Dim bis As Long
    t = "Suche Geburtstage nach verschiedenen Kriterien"
    x = "AS [" & t & "]"
    strSQL = "SELECT 0 AS Nr, 'letzte 7 Tage bis heute' " & x & _
      " Union Select 1 as Nr, 'H E U T E' " & x & _
      " Union Select 2 as Nr, 'letzte 14 Tage bis heute' " & x & _
      " Union Select 3 as Nr, 'letzte 30 Tage bis heute' " & x & _
      " Union Select 4 as Nr, 'in den nächsten 7 Tagen' " & x & _
      " Union Select 5 as Nr, 'letzte 7 Tage bis nächste 7 Tage' " & x & _
      " Union Select 6 as Nr, 'Runder Geburtstag dieses Jahr' " & x & _
      " Union Select 7 as Nr, 'AKTUELLER MONAT' " & x & _
      " Union Select 8 as Nr, 'Janauar' " & x & _
      " Union Select 9 as Nr, 'Februar' " & x & _
      " Union Select 10 as Nr, 'März' " & x & _
      " Union Select 11 as Nr, 'April' " & x & _
      " Union Select 12 as Nr, 'Mai' " & x & _
      " Union Select 13 as Nr, 'Juni' " & x & _
      " Union Select 14 as Nr, 'Juli' " & x & _
      " Union Select 15 as Nr, 'August' " & x & _
      " Union Select 16 as Nr, 'September' " & x & _
      " Union Select 17 as Nr, 'Oktober' " & x & _
      " Union Select 18 as Nr, 'November' " & x & _
      " Union Select 19 as Nr, 'Dezember' " & x
    OH_msgbox "", Array("Alle", "männlich", "weiblich"), _
                  vbQuestion, t, _
                  "Clicken Sie die gewünschte Suche an", , , strSQL, 2, "00"
    '============
    lgReportNr = Val(strMSG(3))
    Select Case Val(strMSG(1))
    Case 1
        strlink = "FP = 0"
    Case 2
        strlink = "ArtAdresse like ''Herr''"
    Case 3
        strlink = "ArtAdresse like ''Frau''"
    Case 0
        Exit Sub
    End Select
    Select Case lgReportNr
    Case 0
        von = 7
        bis = 0
    Case 1
        von = 0
        bis = 0
    Case 2
        von = 14
        bis = 0
    Case 3
        von = 30
        bis = 0
    Case 4
        von = 0
        bis = 7
    Case 5
        von = 7
        bis = 7
    Case 6
        strlink = strlink & " and right(datediff(YYYY,getdate(),[Gebtag]),1)=0"
    Case 7
        strlink = strlink & " and MonatG= " & Month(Date)
    Case Is > 7
        strlink = strlink & " and MonatG= " & lgReportNr - 7
    End Select
    If lgReportNr <= 5 Then
        strSQL = "select cast(getdate() as int)"
        OH_r r
        von = r(0) - von
        bis = r(0) + bis
        strlink = "(" & strlink & " and cast(DateAdd(yyyy, GebAlter, Gebtag) as int) Between " & von & " And " & bis & ") Or (" & _
                  strlink & " and cast(DateAdd(yyyy, GebAlter-1, Gebtag) as int) Between " & von & " And " & bis & ") Or (" & _
                  strlink & " and cast(DateAdd(yyyy, GebAlter+1, Gebtag) as int) Between " & von & " And " & bis & ")"
    End If
    OH_OF "F_Adresse", 0, 0, strlink
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_SucheGebTage"
    Resume ErrEnd
End Sub
Private Sub CounterFunktion_GotFocus()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.CounterFunktion_GotFocus"
    Resume ErrEnd
End Sub
Private Sub CounterFunktion_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Set ctl = Me!CounterFunktion
    If ctl.OldValue <> ctl Or IsNull(ctl) Or IsNull(ctl.OldValue) Then
        If MsgBox("Anwahl-Zähler wirklich von Hand ändern?", _
                vbQuestion + vbOKCancel, _
                Me!namen & " " & ctl.OldValue & " ==> " & ctl) = vbCancel Then
            Cancel = True
            ctl.Undo
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.CounterFunktion_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Fax_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_onlyNumeric KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Fax_KeyPress"
    Resume ErrEnd
End Sub
Private Sub GebTag_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!GebTag, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.GebTag_KeyPress"
    Resume ErrEnd
End Sub
Private Sub ArtAdresse_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
        'Änderungen einiger ctls in Abhängigkeit Firma / Person
    Cancel = OH_CheckChange(Me!ArtAdresse, Me)
    If Me!FP = 0 Then
        Me!DuSie.Visible = True
        Me!lblAbteil.Caption = "Abteilung"
        Me!Titel.ControlTipText = "Titel, z.B. <Dr.>"
        Me!Nachname.Width = Me!Titel.left + Me!Titel.Width - Me!Nachname.left
        Me!Beruf.Width = Me!Nachname.Width
        Me!Vorname.ControlTipText = "Vorname"
        Me!Vorname.top = Me!Nachname.top
        Me!btnGebTag.Caption = "Geb.-Tag"
        Me!GebTag.ControlTipText = "Geburtstag (mit +/- Taste um einen Tag ändern)"
    Else
        Me!DuSie.Visible = False
        Me!lblAbteil.Caption = Me!ArtAdresse & "-Nr."
        Me!Nachname.Width = Me!Strasse.Width
        Me!Vorname.ControlTipText = "Synonym, anderer Name"
        Me!Vorname.top = Me!Kurzzeichen.top
        Me!Titel.ControlTipText = "Form, z.B. <AG> oder <GmbH>"
        Me!btnGebTag.Caption = "Seit..."
        Me!GebTag.ControlTipText = "gibt es seit... (mit +/- Taste um einen Tag ändern)" & vbNewLine & _
                                    "Sie können auch nur eine 4stellige Jahreszahl eingeben..."
    End If
    Me!Du.Visible = Me!DuSie.Visible
    Me!Beruf.ControlTipText = Me!txtBeruf
    Me!Beruf.Width = Me!Nachname.Width
    Me!Rufname.Visible = Me!DuSie.Visible
    Me!Kurzzeichen.Visible = Me!DuSie.Visible
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.ArtAdresse_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub ArtAdresse_AfterUpdate()
On Error GoTo ErrMsg
    Me!Nachname.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.ArtAdresse_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnName_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!IDAdresse, 1
    Me!regd = 1
    Me!lstKontakt = Me!NrFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnName_Click"
    Resume ErrEnd
End Sub
Public Sub btnZuord_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!NrAdrZuord, 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnZuord_Click"
    Resume ErrEnd
End Sub
Private Sub Ort_Enter()
On Error GoTo ErrMsg
    If IsNull(Me!Land) Then
        Me!Land.SetFocus
    Else
        OH_RS_Enter 0, Nz(Me!Land)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Ort_Enter"
    Resume ErrEnd
End Sub
Private Sub Ort_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!PLZStrasse) And Not IsNull(Me!Ort) Then
        strSQL = "Exec dbo.spa_Z PLZvonOrt,0,'" & Me!Ort & "'"
        OH_r r
        If Not r.BOF Then
            Me!PLZStrasse = r!plz
        End If
    End If
    Me!Funktion.SetFocus
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Ort_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub OrtP_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OrtP_Enter"
    Resume ErrEnd
End Sub
Private Sub PLZStrasse_Enter()
On Error GoTo ErrMsg
    If IsNull(Me!Land) Then
        Me!Land.SetFocus
    Else
        OH_RS_Enter 0, Nz(Me!Land)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.PLZStrasse_Enter"
    Resume ErrEnd
End Sub
Private Sub Strasse_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Strasse_Enter"
    Resume ErrEnd
End Sub
Private Sub Strasse_AfterUpdate()
On Error GoTo ErrMsg
    Dim strhelp
    Dim vararray As Variant
    Dim strL As String
    Dim strlistwidth As String
    Dim lglistcount As Long
    Dim lgColumnCount As Long
    Dim strcolumnWidth As String
    Dim lgCount As Long
    If IsNull(ctl) = True Then
        Exit Sub
    End If
    Set ctl = Me!Strasse
    strSQL = "Exec dbo.spa_Z " & _
                    " @x = 'Strasse_Afterupdate'" & _
                    ",@fi = '" & OH_RPL(ctl.Value) & "'"
    t = "Adress-Daten übernehmen von Strasse: " & ctl
    strhelp = "Wählen Sie die Adresse aus, von der Sie die Daten übernehmen wollen"
    lglistcount = 4
    strlistwidth = "0;40;40"
    OH_r rx, , , , True
    If rx.BOF = True Then
        Exit Sub
    Else
        While rx.EOF = False
            lgCount = lgCount + 1
            If lgCount = 1 Then
                strL = rx!ID
            Else
                If Len(strL) < 2000 Then
                    strL = strL & "," & rx!ID
                End If
            End If
        rx.MoveNext
        Wend
    End If
    vararray = Array("Alle Adress-Infos aus der markierten Adresse übernehmen", _
                    "Nur Land, PLZ und Ort übernehmen")
    OH_msgbox s, vararray, vbQuestion, t, strhelp, , , strSQL, lglistcount, strlistwidth
    Select Case Val(strMSG(1))
    Case 1, 2
        rx.MoveFirst
        rx.Find "ID = " & Val(strMSG(3))
        If Not rx.EOF Then
            Me!Land = rx!Land
            Me!PLZStrasse = rx!PLZStrasse
            Me!Ort = rx!Ort
            Me!PostAdr = rx!PostAdr
            If Val(strMSG(1)) = 1 Then
                Me!Telefon = rx!Telefon
                Me!Fax = rx!Fax
                Me!EMail = rx!EMail
                Me!Internet = rx!Internet
                Me!Mobil = rx!Mobil
            End If
        End If
    End Select
    OH_ResetRS rx
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Strasse_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub OrtP_AfterUpdate()
On Error GoTo ErrMsg
    If Len(Nz(Me!OrtP.column(2), "")) > 0 Then
        If IsNull(Me!Land) Then
            Me!Land = Me!OrtP.column(2)
        Else
            If Len(Nz(Me!PLZStrasse.column(1), "")) > 0 Then
                Me!Land = Me!OrtP.column(2)
            End If
        End If
    End If
    If Len(Nz(Me!OrtP.column(1), "")) > 0 Then
        If IsNull(Me!PLZStrasse) Then
            Me!PLZStrasse = Me!OrtP.column(1)
        Else
            If Len(Nz(Me!PLZStrasse.column(1), "")) > 0 Then
                Me!PLZStrasse = Me!OrtP.column(1)
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OrtP_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub PLZStrasse_afterupdate()
On Error GoTo ErrMsg
    Me!Ort = Nz(Me!PLZStrasse.column(1), Me!Ort)
    Me!Land = Nz(Me!PLZStrasse.column(2), Me!Land)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.PLZStrasse_afterupdate"
    Resume ErrEnd
End Sub
Private Sub regMain_Change()
On Error GoTo ErrMsg
    OH_SaveRS Me
    Select Case Me!RegMain.Value
    Case 0
        OH_A "lstact", _
            " @i = " & Me!NrFunktion & ", " & _
            " @f = '" & Me!ArtAdresse & "', " & _
            " @d = '" & OH_RPL(Me!namen) & "'," & _
            " @dt = '" & Nz(Format(Me!EndeFunktion, "YYYYMMDD"), "") & "'", Me
        Me!lstact = 11
        GebTag_BeforeUpdate (0) 'Farbe setzen
    Case 1
        strSQL = "Exec dbo.spa_Z " & _
                " @x = 'NrMitarbeiter'"
        OH_A "NrMitarbeiter", strSQL, Me
        If Nz(Me!NrMitarbeiter, 0) = 0 Then
            Me!NrMitarbeiter = lguser
            NrMitarbeiter_beforeUpdate (0)
        End If
        strSQL = "Exec dbo.spa_VG " & _
            " @x = 'comAnschrift' " & _
            ", @i = " & Me!NrFunktion & _
            ", @b = " & Me!comAnredeWie & _
            ", @d = '" & Me!comSprache & _
            "',@i2 = " & Me!DuSie  '160811 Trick, um bei DUSIE-Änderung eine neue Abfrage zu erzwingen
        OH_A "comAnschrift", strSQL, Me
        Select Case Me!ArtAdresse
        Case "Firma"
            If Not Me!comAnschrift Like "Firma" Then
                Me!comAnschrift = "Firma"
            End If
        Case Else
            If Me!comAnschrift Like "Firma" Then
                Me!comAnschrift = "Person/Abteilung"
            End If
        End Select
        strSQL = "Exec dbo.spa_Adresse 'ComEmail', " & Me!NrFunktion
        OH_A "comEmail", strSQL, Me
        comAnschrift_AfterUpdate
        Select Case left(Me!StandardText, 10)
        Case "Happy Birt", "Geburtstag"
            StandardText_AfterUpdate
        End Select
        glstrFont = Nz(Me!NrMitarbeiter.column(7), glstrFontA)
        If glstrFont = "" Then
            glstrFont = "Arial 10"
        End If
        OH_A "comGruss", _
            " @a = " & Me!comAnredeWie & _
            ",@i = " & Me!DuSie & _
            ", @d = '" & Me!comSprache & _
            "', @f = '" & OH_RPL(Me!Ort) & "'", Me
        Me!comGruss = Me!comGruss.column(0, 0)
        Me!txtDate = Format(DateAdd("n", 60, Now), "dd.mm.yy HH:00")
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.regMain_Change"
    Resume ErrEnd
End Sub
Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_CountAction
    OH_OF "F_Artikel", Nz(Me!LstArtikel, 0)
    Forms!F_Artikel!lstFirmaArtikel.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstArtikel_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnCreatePostAdresse_Click()
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_Postadr True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnCreatePostAdresse_Click"
    Resume ErrEnd
End Sub
Private Sub btnGebTag_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.btnGebTag_Click"
    Resume ErrEnd
End Sub
Private Sub EndeFunktion_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!StartFunktion, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.EndeFunktion_KeyPress"
    Resume ErrEnd
End Sub
Private Sub StartFunktion_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!StartFunktion, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.StartFunktion_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strf As String
    Dim rsa As ADODB.Recordset
    Dim rsF As ADODB.Recordset
    Dim lgA As Long
    Dim lgF As Long
    Dim blP As Boolean
    lgA = Nz(Me!IDAdresse)
    lgF = Nz(Me!NrFunktion)
    If DirtyRecord(Me) Then GoTo ErrEnd
    t = "Adress-Prüfung vor Speichern"
    strSQL = "Select * from T_Adresse where NrAdresse=" & lgA
    OH_r rsa, , , rrLockOptimistic
    If rsa.BOF Then
        s = "OH_SaveRecord T_Adresse"
        GoTo ErrM
    End If
    strSQL = "Select * from T_Funktion where NrFunktion=" & lgF
    OH_r rsF, , , rrLockOptimistic
    If rsF.BOF Then
        s = "OH_SaveRecord T_Funktion"
        GoTo ErrM
    End If
    If Me!NrAdrZuord = EFNr Then
        Cancel = OH_CheckAdmin("+Eigene Firma")
        If Cancel = True Then
            Me.Undo
            GoTo ErrEnd
        End If
    End If
    'ursprüngl. Einträge absuchen
    If OH_Validate(Me!Nachname, "Nachname") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If OH_Validate(Me!NrAdrZuord, "Zuordnung") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If IsNull(Me!Funktion) = True Then
        Me!Funktion = "unbekannt"
    End If
    If OH_Validate(Me!Land, "Land") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If Nz(Me!Land) <> Nz(Me!Land.OldValue) Or _
        Nz(Me!Strasse) <> Nz(Me!Strasse.OldValue) Or _
        Nz(Me!PLZStrasse) <> Nz(Me!PLZStrasse.OldValue) Or _
        Nz(Me!Ort) <> Nz(Me!Ort.OldValue) Then
            blP = True
    End If
    If Not Me.NewRecord Then
        strSQL = "select Telefon,Fax,email,Internet,Mobil from T_Funktion where " & _
                 "NrFunktion=" & Nz(Me!NrFunktion, 0)
        OH_r r
        If Not r.BOF Then
            varOldTelefon = r!Telefon
            varOldFax = r!Fax
            varOldeMail = r!EMail
            varOldInternet = r!Internet
            varOldMobil = r!Mobil
        End If
    Else
        varOldTelefon = Null
        varOldFax = Null
        varOldeMail = Null
        varOldInternet = Null
        varOldMobil = Null
    End If
    For i = 1 To rsa.Fields.count - 1
        strf = rsa.Fields(i).Name
        Select Case strf
        Case "NrAdresse", "TempHelp"
        Case Else
            rsa(strf) = Me(strf)
        End Select
    Next i
    rsa.Update
    For i = 1 To rsF.Fields.count - 1
        strf = rsF.Fields(i).Name
        Select Case strf
        Case "NrFunktion", "TempHelp"
        Case "NrAdresse"
            rsF(strf) = Me!IDAdresse
        Case Else
            rsF(strf) = Me(strf)
        End Select
    Next i
    rsF.Update
    lgA = 0
    Me.Undo
    OH_RQf Me
    OH_CheckNummern
    If blP = True And Nz(Me!Ort, "") <> "" Then
        If Nz(Me!PostAdr, "") = "" Then
            OH_Postadr False
        Else
            OH_Postadr True
        End If
    End If
    VarAntw = ""
    If Me!ArtAdresse = "Firma" Then
        OH_RQ Me!comNrAdrZuord
    End If
    If OH_isloaded("F_VG") Then
        If InStr(Forms!F_VG!Anschrift, Me!Nachname) > 0 Then
            OH_RQf Forms!F_VG
        End If
    End If
    '171204 EO & OH prüft, ob das Artikelformular offen ist und setzt ein requery auf dem Feld NrFirma
    If OH_isloaded("F_Artikel") Then
        OH_RQ Forms!F_Artikel!NrFirma
    End If
ErrEnd:
    OH_ResetRS rsa
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, "F_Adresse.Form_BeforeUpdate"
End Sub
Public Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!regd = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub comNrAdrZuord_AfterUpdate()
On Error GoTo ErrMsg
    Set ctl = Me!comNrAdrZuord
    If OH_Validate(ctl, "Zuordnung", False) = False Then
        If Not ctl Like Me!NrAdrZuord Then
            t = "Gravierende Änderung! der Adresse"
            s = "Achtung auch ev. vorhandene Vorgänge werden mitgenommen!" & vbNewLine & _
                    "Wollen Sie wirklich" & vbNewLine & _
                    vbTab & Me!namen & vbNewLine & vbNewLine & _
                    "zuordnen zu" & vbNewLine & _
                    vbTab & ctl.column(1) & " ??" & vbNewLine & vbNewLine & _
                    "Bitte ein <JA> eingeben, falls ok!"
            s = InputBox(s, t, "nein")
            Select Case s
            Case "JA", "<JA>"
                OH_EX "spA_Adresse 'ChangeZuordnung'," & Nz(Me!NrFunktion, 0) & "," & ctl.Value
                OH_RQf Me
            Case "Nein", ""
            Case Else
                MsgBox "nur JA, Nein oder abbrechen erlaubt!", vbCritical, t
            End Select
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comNrAdrZuord_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comNrAdrZuord_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    Me!NrAdrZuord.Undo
    Me!btnZuord.SetFocus
    s = "Zum Erfassen neuer Adressen (Firmen, Personen)" & vbNewLine & _
              "gehen Sie bitte über den Schalter <Neuer Datensatz> (Links oben)!" & vbNewLine & vbNewLine
    MsgBox s, vbExclamation, NewData & " nicht erfasst."
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.comNrAdrZuord_NotInList"
    Resume ErrEnd
End Sub
Public Sub btnEmail_Click()
On Error GoTo ErrMsg
    If IsNull(Me!EMail) Then
        MsgBox "Bevor Sie ein Mail schreiben können, muss die Adresse eingetragen werden!", _
                vbInformation, "eMail-Adresse fehlt!"
        Me!EMail.SetFocus
    Else
        OH_CountAction
        Me!StandardText.SetFocus
        OH_CB Me!EMail

    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnEmail_Click"
    Resume ErrEnd
End Sub
Private Sub btnStartFunktion_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnStartFunktion_Click"
    Resume ErrEnd
End Sub
Private Sub btnEndeFunktion_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnEndeFunktion_Click"
    Resume ErrEnd
End Sub
Private Sub Telefon_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_onlyNumeric KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Telefon_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Telefon_Enter()
On Error GoTo ErrMsg
    Dim lgS As Long
    If Trim(Nz(Me!Telefon, "")) = "" Then
        strSQL = "select dbo.fx_Div('FindTelefon'," & _
                                    Me!NrAdrZuord & ",'" & _
                                    Me!Land & "','','')"
        OH_r r
        If Not r.BOF Then
            Me!Telefon = r(0) & " "
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Telefon_Enter"
    Resume ErrEnd
End Sub
Private Sub Telefon_LostFocus()
On Error GoTo ErrMsg
    If Me.Dirty Then
        If Len(Me!Telefon) < 5 Then
            Me!Telefon = Null
            SysCmd acSysCmdSetStatus, "Telefon-Nummern mit weniger als 5 Zeichen werden gelöscht!"
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Telefon_LostFocus"
    Resume ErrEnd
End Sub
Private Sub Fax_Enter()
On Error GoTo ErrMsg
    If Nz(Me!Fax, "") = "" Then
        strSQL = "select dbo.fx_Div('FindFAx'," & _
                                    Me!NrAdrZuord & ",'" & _
                                    Me!Land & "','','')"
        OH_r r
        If Not IsNull(r(0)) Then
            Me!Fax = r(0)
        Else
            If Not IsNull(Me!Telefon) Then
                Me!Fax = Me!Telefon
            End If
        End If
    End If
    If Nz(Me!Fax, "") <> "" Then
        Me!Fax.SelStart = Len(Me!Fax) - 2
        Me!Fax.SelLength = 2
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Fax_Enter"
    Resume ErrEnd
End Sub
Private Sub email_Enter()
On Error GoTo ErrMsg
    Dim strMid1 As String
    Dim lgL As Long
    'erstellt Email-name aus Vor und Nachname und falls vorhanden
    'mit @-Endung von anderen Personen derselben Firma
    If Nz(Me!EMail, "") = "" Then
        Internet_GotFocus
        strSQL = "select dbo.fx_Div('FindMail'," & _
                                    Me!NrFunktion & ",'','','')"
        OH_r r
        If Not IsNull(r(0)) Then
            Me!EMail = r(0)
            OH_Valid_Mail_URL Me!EMail
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.email_Enter"
    Resume ErrEnd
End Sub
Private Sub EMail_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = Not OH_Valid_Mail_URL(Nz(Me!EMail))
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.EMail_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Email_Exit(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strE As String  ' hier wird die Email Domäne eingetragen
    Dim lgid As Long    ' ID Funktion dieser Adresse
    If Nz(Me!EMail, "") = "" Then
        GoTo ErrEnd
    End If
    If right(Me!EMail, 1) = "@" Then
        Me!EMail = Null
    End If
    If Me.Dirty Then
        OH_Valid_Mail_URL Nz(Me!EMail), , Me!EMail
        strE = Mid(Me!EMail, InStr(Me!EMail, "@"), Len(Me!EMail))
        lgid = Me!NrFunktion
        strSQL = "Exec dbo.spa_adresse" & _
                    " @x = 'CheckDomain'," & _
                    " @i = " & lgid & "," & _
                    " @f = '" & strE & "'"
        OH_r r  'Antwort = 0 wenn keine Änderung
                '        > 0 für Anzahl gleicher Domainen
        i = r!Antwort
        If i > 0 Then
            i = MsgBox("Soll die neue @+Endung " & strE & vbNewLine & _
                    "auch für alle anderen Mailadressen (" & i & ")" & vbNewLine & _
                    "mit der 'alten' Domaine (" & r!oldDomain & ") gelten?", _
                        vbYesNo + vbQuestion, _
                        "Domäne der Email ändern")
            If i = vbYes Then
                strSQL = "Exec dbo.spa_adresse" & _
                         " @x = 'CheckDomain'," & _
                         " @i = " & lgid & "," & _
                         " @a = " & r!NrAdrZuord & "," & _
                         " @f = '" & strE & "'"
                OH_EX
            End If
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Email_Exit"
    Resume ErrEnd
End Sub
Private Sub Internet_Exit(Cancel As Integer)
On Error GoTo ErrMsg
    If right(Me!Internet, 1) = "." _
        Or Me!Internet = vbNullString Then
        Me!Internet = Null
    Else
        If OH_Valid_Mail_URL(Nz(Me!Internet), "internet") = False Then
            Me!Internet = Null
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Internet_Exit"
    Resume ErrEnd
End Sub
Private Sub Mobil_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_onlyNumeric KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Mobil_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Mobil_Enter()
On Error GoTo ErrMsg
    Dim lgS As Long
    If Trim(Nz(Me!Mobil, "")) = "" Then
        strSQL = "select dbo.fx_Div('FindMobil'," & _
                                    Me!NrAdrZuord & ",'" & _
                                    Me!Land & "','','')"
        OH_r r
        If Not r.BOF Then
            Me!Mobil = r(0) & " "
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Mobil_Enter"
    Resume ErrEnd
End Sub
Private Sub Mobil_LostFocus()
On Error GoTo ErrMsg
    If Me.Dirty Then
        If Len(Me!Mobil) < 5 Then
            Me!Mobil = Null
            SysCmd acSysCmdSetStatus, "Mobil-Nummern mit weniger als 5 Zeichen werden gelöscht!"
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Mobil_LostFocus"
    Resume ErrEnd
End Sub
Public Sub btnTelefon_Click()
On Error GoTo ErrMsg
    OH_CountAction
    If OH_Validate(Me!Telefon, "Tel-Nr.") Then
        Telefon_Enter
    Else
        OH_DialTelefon Me!NrFunktion, Me!Telefon, Me!namen
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnTelefon_Click"
    Resume ErrEnd
End Sub
Private Sub btnMobil_Click()
On Error GoTo ErrMsg
    OH_CountAction
    If OH_Validate(Me!Mobil, "Mobil-Nr.") Then
        Me!Mobil.SetFocus
    Else
        OH_DialTelefon Me!NrFunktion, Me!Mobil, Me!namen
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnMobil_Click"
    Resume ErrEnd
End Sub
Private Sub btnInternet_Click()
On Error GoTo ErrMsg
    OH_CountAction
    If OH_Validate(Me!Internet, "Internet-Adresse") Then
        email_Enter
    Else
        FollowHyperlink HyperlinkPart(Me!Internet, acAddress), , True
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnInternet_Click"
    Resume ErrEnd
End Sub
Private Sub btnFax_Click()
On Error GoTo ErrMsg
    OH_CountAction
    Me!StandardText.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnFax_Click"
    Resume ErrEnd
End Sub
Private Sub btnTelefonF_Click()
On Error GoTo ErrMsg
    OH_Suche "TelefonSuche"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnTelefonF_Click"
    Resume ErrEnd
End Sub
Private Sub btnFaxF_Click()
On Error GoTo ErrMsg
    OH_Suche "FaxSuche"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnFaxF_Click"
    Resume ErrEnd
End Sub
Private Sub btnMobilF_Click()
On Error GoTo ErrMsg
    OH_Suche "Mobilsuche"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.btnMobilF_Click"
    Resume ErrEnd
End Sub
Private Sub OH_Suche(strWas As String)
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Filter", , , , , , "F_Adresse"
    Set frm = Forms!PF_Filter
    frm!f.SetFocus
    OH_FB frm, "f ='" & strWas & "'"
    frm!e.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_Suche"
    Resume ErrEnd
End Sub
Private Sub StandardText_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.StandardText_Enter"
    Resume ErrEnd
End Sub
Private Sub btnRückruf_Click()
On Error GoTo ErrMsg
    Me!btnStartEmail.SetFocus
    Me!StandardText = "telefonisch nicht erreicht / Bitte zurückrufen"
    StandardText_AfterUpdate
    btnStartEmail_Click
    Me!btnRückruf.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.StandardText_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnRückruf1_Click()
    btnRückruf_Click
    Me!btnRückruf1.SetFocus
End Sub
Private Sub StandardText_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    btnRückruf_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.StandardText_DblClick"
    Resume ErrEnd
End Sub
Public Sub StandardText_AfterUpdate()
On Error GoTo ErrMsg
    Dim strTel As String
    Dim strTxt As String
    Dim strtxtAct As String
    Dim strBeilage As String
    Dim strA As String
    If left(Me!StandardText, 5) = "Deine" And Me!DuSie = 0 Then
        Me!StandardText = Replace(Me!StandardText, "Deine", "Ihre")
    End If
    If left(Me!StandardText, 4) = "Ihre" And Me!DuSie = 1 Then
        Me!StandardText = Replace(Me!StandardText, "Ihre", "Deine")
    End If
    'Beschreibung ist MEMO-Feld und kann nicht durch das Kombifeld übertragen werden!
    i = Val(Nz(Me!StandardText.column(2), 0))
    If i = 0 Then
        strTxt = vbNullString
    Else
        OH_A "@x = 'StandardText_AfterUpdate'," & _
            " @i = " & i, , Me
        OH_r r
        strTxt = r!ST
    End If
    strtxtAct = Nz(PlainText(Me!txtMemo), "")
    strBeilage = Nz(Me!comBeilage, "")
    If Len(strTxt) + Len(strBeilage) > 5 And Len(strtxtAct) > 0 Then
        s = vbNullString
        If Len(strtxtAct) > 5 Then
            s = "bestehenden Text:" & vbNewLine & vbNewLine & _
                       left(strtxtAct, 100) & " ......" & vbNewLine & vbNewLine
        End If
        If Len(strBeilage) > 5 Then
            s = s & "Beilage:" & vbNewLine & _
                       left(strBeilage, 100) & " ......" & vbNewLine
        End If
        If InStr(Me!StandardText, "Birthday") > 0 Or InStr(Me!StandardText, "Geburtstag") > 0 Then
            i = vbYes
        Else
            If strtxtAct <> strTxt Then
                i = MsgBox(s & vbNewLine & vbNewLine & _
                           "überschreiben (löschen)?", _
                           vbQuestion + vbYesNoCancel, _
                           Me!namen)
                If i = vbCancel Then
                    Me!StandardText = Null
                    Me!txtMemo = Null
                    Me!comBeilage = Null
                End If
            End If
        End If
        If i = vbNo Then
            Me!txtMemo = strtxtAct & vbNewLine & strTxt
        Else
            Me!txtMemo = strTxt
            Me!comBeilage = Null
        End If
    Else
        If Len(strTxt) > 0 Then
            Me!txtMemo = strTxt
        End If
    End If
    Select Case right(Me!StandardText, 18)
    Case "sch nicht erreicht", " Bitte zurückrufen"
        If Me!DuSie = 1 Then
            Me!txtMemo = lg("Telefonisch hab' ich Dich soeben nicht erreicht.") & "<br>" & _
                                      lg("Ruf' mich bitte zurück.")
        End If
        s = ""
        If Nz(Me!Telefon, "") <> "" Then
            s = "(Tel: " & Me!Telefon & ")" & "<br>"
        End If
        If Nz(Me!Mobil, "") <> "" Then
            s = s & "(Mob: " & Me!Mobil & ")" & "<br>"
        End If
        s = s & Format(Now(), "dd. mmmm yyyy  hh:nn") & lg(" Uhr")
        OH_A "@x ='TelefonUser'," & _
            " @i = " & lguser & ", " & _
            " @f = '" & Me!Land & "'"
        OH_r r
        strTel = r!TelefonUser
        Me!txtMemo = s & "<br>" & _
                 Me!txtMemo & "<br>" & "==> " & strTel
    Case "persönlichen Daten", "Your personal Data"
        Me!txtMemo = strTxt & "<br>" & _
                              "<br>" & _
                              "================================" & _
                              "<br>" & _
                              OH_CheckPersData(Me!NrFunktion)
        GoTo ErrEnd
    Case "egen neuer Version"
        Me!txtMemo = Replace(Me!txtMemo, "Version", "Version V" & Format(Date, "yymmdd"))
    End Select
    If InStr(Me!StandardText, "Birthday") > 0 Or InStr(Me!StandardText, "Geburtstag") > 0 Then
        If IsNull(Me!GebTag) Then
            Me!txtMemo = "Geburtstag fehlt für " & Me!namen
        Else
            If Format(Date, "DDMM") <> Format(Me!GebTag, "DDMM") Then
                OH_A "@x = 'GeburtstagsCheck', " & _
                    " @i =  " & Me!IDAdresse, , Me
                OH_r r
                i = r!days
            Else
                i = 0
            End If
            Select Case i
            Case Is < 0
                Me!txtMemo = Me!namen & " hat erst am " & Format(Me!GebTag, "dd.mm.") & " Geburtstag!"
            Case Is > 7
                Me!txtMemo = Me!namen & " hatte bereits am " & Format(Me!GebTag, "dd.mm.") & " Geburtstag!"
            Case Else
                strA = Nz(Me!GebAlter)
                If Len(strA) = 2 Then
                    Select Case right(strA, 1)
                    Case left(strA, 1)
                        strA = left(strA, 1) & ". Schnapszahl-"
                    Case "0"
                        strA = "RUNDEN "
                    Case "5"
                        strA = "HALB-RUNDEN "
                    End Select
                End If
                If Len(strA) < 5 Then
                    strA = strA & ". "
                End If
                Me!txtMemo = Replace(strTxt, "zum Geburtstag", "zum " & strA & "Geburtstag")
                If i <> 0 Then
                    Me!txtMemo = Replace(Me!txtMemo, "Glückwünsche zum", "Glückwünsche nachträglich zum")
                    Me!txtMemo = Me!txtMemo & "<br>" & "<br>" & _
                                "Sorry für die " & i & "-tägige Verspätung, soll nicht wieder vorkommen!"
                End If
            End Select
            i = 0
            s = ""
            Select Case Month(Date)
            Case 1
                If Day(Date) < 15 Then
                    i = Year(Date)
                End If
            Case 12
                If Day(Date) > 20 Then
                    i = Year(Date) + 1
                    If Day(Date) < 25 Then
                        s = "<br><br>und FROHE WEIHNACHTEN"
                    End If
                End If
            End Select
            If s <> "" Then
                Me!txtMemo = Me!txtMemo & s
            End If
            If i > 0 Then
                s = "<br>und VIEL ERFOLG im neuen Jahr " & i & "!"
                Me!txtMemo = Me!txtMemo & s
            End If
        End If
        GoTo ErrEnd
    End If
    If Not Nz(Me!comSprache.column(1), "Deutsch") Like "Deutsch" Then
        Me!txtMemo = lg(Me!txtMemo)
        Me!StandardText = lg(Me!StandardText)
    End If
    If Len(strTxt) = 0 Then
        Me!txtMemo.SetFocus
        With Me!txtMemo
            .SelStart = 0
            .SelLength = Len(Nz(Me!txtMemo))
        End With
    End If
    Me!lstTxtMemo = 71
    OH_setRTFont Me, Me!txtMemo, "EMAIL"
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.StandardText_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub OH_CountAction()
On Error GoTo ErrMsg
'zählt anzahl Anwahl und erhöht um 1
    If Not IsNull(Me!NrFunktion) Then
        If Me.Dirty Then
            OH_SaveRS Me
        End If
        OH_A "@x = 'CountAction'" & _
            ",@i = " & Me!NrFunktion
        OH_EX
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_CountAction"
    Resume ErrEnd
End Sub
Private Function OH_ChangeSameNr(strcom As String, varOldcom) As Long
On Error GoTo ErrMsg
    Dim strA(1 To 2)
    Dim vararray As Variant
    Dim strL As String
    Dim strhelp As String
    'sucht und ändert gleiche Tel./Fax/eMail-Nrn.
    'Achtung Formular muss unter "Datensätz sperren" <keine Sperrungen> enthalten!
    OH_ChangeSameNr = 2
    If IsNull(varOldcom) Then GoTo ErrEnd
    If IsEmpty(varOldcom) Then GoTo ErrEnd
    If varOldcom = Me(strcom) Then GoTo ErrEnd
    s = strcom & "-Nummer"
    strL = "NrFunktion <> " & Me!NrFunktion & _
                   " and " & strcom & " = '" & varOldcom & "'"
    strSQL = "SELECT T_Funktion.NrFunktion, " & _
                   " A1.Vorname + ' ' + A1.Nachname as Name, " & _
                   " Funktion , " & _
                   " A.Vorname + ' ' + A.Nachname as Zuordnung " & _
                   " FROM T_Adresse AS A1 INNER JOIN " & _
                   " (T_Adresse as A INNER JOIN T_Funktion ON A.NrAdresse = T_Funktion.NrAdrZuord) " & _
                   " ON A1.NrAdresse = T_Funktion.NrAdresse" & _
                   " where " & strL
    OH_r r, , , , True
    If r.BOF = True Then
        GoTo ErrEnd
    End If
    r.MoveLast
    i = r.RecordCount & ""
    Select Case i
    Case 1
        strA(1) = s & " ebenfalls ändern auf" & vbNewLine & Me(strcom) & "!"
        vararray = Array(strA(1))
    Case Else
        strA(1) = "Alle " & s & "n ebenfalls ändern auf" & vbNewLine & Me(strcom) & "!"
        strA(2) = "Nur für markierte Adressen " & s & "n ändern!"
        vararray = Array(strA(1), strA(2))
    End Select
    t = "Abgleich gleiche " & strcom & "-Nummern"
    strhelp = "Die Liste zeigt alle Adressen, die die gleiche Nummer besitzen wie der aktuelle Datensatz!" & vbNewLine & _
             "Sie können hiermit für alle oder nur für die markierten Adressen die Nummern auch ändern."
    OH_msgbox "", vararray, vbQuestion, t, strhelp, , , strSQL, 4, "0;30;30"
    Select Case strMSG(2)
    Case "", "Abbrechen"
        GoTo ErrEnd
    Case strA(2)
        strL = "NrFunktion in(" & strMSG(3) & ")"
    Case strA(2)
    End Select
    OH_EX "Update T_Funktion set " & strcom & " = '" & Me(strcom) & _
               "' where " & strL & ";"
ErrEnd:
    varOldcom = Null
    VarAntw = 1
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_ChangeSameNr"
    Resume ErrEnd
End Function
Private Sub StartFunktion_AfterUpdate()
On Error GoTo ErrMsg
    OH_EnterStartDate Me!StartFunktion, Me!GebTag
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.StartFunktion_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub GebTag_afterupdate()
On Error GoTo ErrMsg
    OH_EnterStartDate Me!GebTag, Me!StartFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.GebTag_afterupdate"
    Resume ErrEnd
End Sub
Private Sub OH_EnterStartDate(start1 As control, start2 As control)
On Error GoTo ErrMsg
    'bei Firmen wird nachgeschaut, obe es sich um die Zentrale handelt
    'wenn ja wird das Gründungsjahr(GebTag) autom. in das StartFunktion übertragen
    If Me!ArtAdresse = "Firma" And Funktion = "Zentrale" Then
        If Nz(start1, 0) * Nz(start2, 0) = 0 Then
            If MsgBox("Gründungsjahr " & start1 & " und Starttermin " & start2 & " werden abgeglichen!", _
                      vbQuestion + vbYesNo, "Eingabeerleichterung") = vbYes Then
                If IsNull(start1) Then
                    start1 = start2
                Else
                    start2 = start1
                End If
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_EnterStartDate"
    Resume ErrEnd
End Sub
Private Sub txtDate_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!txtDate, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.txtDate_KeyPress"
    Resume ErrEnd
End Sub
Public Sub lstTxtMemo_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim lgC As Long
    Dim lgid As Long
    Dim strT As String
    DoCmd.Hourglass True
    t = Me!lstTxtMemo.column(1)
    If OH_Perm("U", Me, "Adresse") Then
        GoTo ErrEnd
    End If
    OH_SaveRS Me
    lgA = Val(Nz(Me!lstTxtMemo, 0))
    Select Case lgA
    Case 10, 11 'markierte Adressen als CC, bcc einfügen
        Select Case Me!regd
        Case 0
            Set ctl = Me!lstStichwort
        Case 1
            Set ctl = Me!lstKontakt
        Case Else
            Set ctl = Me!lstM
        End Select
        OH_Fillcc ctl, lgA = 11
    Case 20, 21 'gefilterte Adressen als CC, bcc einfügen
        OH_Fillcc Me!lstDet, lgA = 21
    Case 12, 22 'Adressen in Zwichenablage einfügen
        If lgA = 12 Then
            OH_InsertID_LST Me!lstM
        Else
            OH_InsertID_LST Me!lstDet
        End If
        t = "Adressen in Zwichenablage eingefügt"
        OH_A "@x = 'lstTxtMemo'" & _
            ",@a = " & lgA & _
            ",@f = '" & t & "'"
        OH_r r
        s = r!Info
        If InStr(s, t) = 0 Then
            GoTo ErrM
        End If
        OH_CB r!MailListe
        MsgBox s, vbInformation, t
    Case 25, 26
        strSQL = Me!lstTxtMemo.Recordset.Source & _
                    ",@a = " & lgA & _
                    ", @i = " & Me!NrAdrZuord & _
                    ",@d = '" & Nz(Me!comEmail, "") & _
                    "',@e = '" & Nz(Me!comMailArt, "") & "'"
        OH_r r
        If lgA = 25 Then
            Me!CC = r!CC
        Else
            Me!bcc = r!CC
        End If
    Case 30
        Me!CC = Null
        Me!bcc = Null
    Case 40
        Me!NrVG.SetFocus
        Me!NrVG.Dropdown
    Case 60
        btnUpdateAnschrift_Click
    Case 70
        Me!txtMemo.SetFocus
        OH_RT Me!txtMemo
    Case 71
        If Nz(Me!txtMemo, "") = "" Then
            MsgBox "Kein Text zum Kopieren vorhanden!", vbExclamation, t
        Else
            Me!txtMemo.SetFocus
            OH_CB (Me!StandardText & vbNewLine & Me!txtMemo)
            Beep
        End If
    Case 72
        Me!txtMemo = Null
        Me!StandardText = Null
        Me!comBeilage = Null
        Me!txtMemo.SetFocus
    Case 73
        Me!NrVG.Visible = True
        Me!NrVG.SetFocus
        Me!NrVG.Dropdown
    Case 74
        Me!StandardText.Visible = True
        Me!StandardText.SetFocus
        Me!StandardText.Dropdown
    Case 75 'Standards bearbeiten'
        OH_A "@x = 'Standardtext', " & _
              "@f = '" & Me!StandardText & "'", , Me
        OH_r r
        lgid = r!ID
        lgC = r!NrBoss
        OH_OF "F_Lexikon"
        Forms!F_Lexikon.OH_FindLex lgC, lgid
   Case 76, 77
        If Me!lstTxtMemo = 76 Then
            s = "Email"
        Else
            s = ""
        End If
        OH_setRTFont Me, Me!txtMemo, s
        If Nz(PlainText(Me!txtMemo), "") = "" Then
            OH_RT Me!txtMemo
        End If
    Case 78 'akt.Titel/Betreff und Bemerkung als Standard eintragen'
        s = Nz(Me!StandardText, "")
        If s = "" Then
            s = "Bitte einen Standard-Text eintragen"
            Me!StandardText.SetFocus
            GoTo ErrM
        End If
        strT = Nz(Me!txtMemo, "")
        If strT = "" Then
            s = "Bitte einen Text ins Memo-Feld eintragen"
            Me!txtMemo.SetFocus
            GoTo ErrM
        End If
        OH_A "@x = 'Standardtext'" & _
              ",@f = '" & OH_RPL(s) & _
             "',@d = '" & OH_RPL(strT) & "'", , Me
        OH_EX
        SysCmd acSysCmdSetStatus, s & ": Eintrag im Lexikon erfolgt"
    Case 798
        btnAppoitment_Click
    Case 799, 800, 910, 911
        OH_ResetID
        Select Case lgA
        Case 910
            OH_InsertID_LST Me!lstDet
        Case 911
            strSQL = "Exec dbo.spI_Marker @TAG = 'Funktion', @ID = '0', @art = 'F'"
            OH_EX
        Case Else
            OH_InsertID Me!NrFunktion
        End Select
        btnStartEmail_Click
    Case 801, 802, 803, 900, 901
        OH_ResetID
        Select Case lgA
        Case 900
            OH_InsertID_LST Me!lstDet
        Case 901
            strSQL = "Exec dbo.spI_Marker @TAG = 'Funktion', @ID = '0', @art = 'F'"
            OH_EX
        Case Else
            OH_InsertID Me!NrFunktion, Me!lstTxtMemo
        End Select
        OH_setBriefInfo Me
        Select Case lgA
        Case 801, 900
            VarAntw = "Brief"
        Case 802
            VarAntw = "Brief privat"
        Case 803
            OH_CB Nz(Me!Fax, "Fax-Nummer fehlt")
            VarAntw = "Fax"
        End Select
        strMSG(1) = 1
        If OH_closeObj(glstrB_VG, acReport) Then
            GoTo ErrEnd
        End If
        DoCmd.OpenReport glstrB_VG, acViewPreview, , , , "B_Brief"
    Case 804 ' Wordfile erstellen
        s = Application.PlainText(Nz(Me!txtMemo, ""))
        OH_startWord _
            "", _
            Me!NrMitarbeiter, _
            Me!Anschrift, _
            Me!StandardText, _
            s, _
            Me!comAnrede, _
            Me!txtDate, _
            Me!comBeilage
    Case 805
        s = "NeueSeite" & vbNewLine
        If InStr(Me!txtMemo, s) > 0 Then
            Me!txtMemo = Replace(Me!txtMemo, s, "")
        Else
            Me!txtMemo = s & Me!txtMemo
        End If
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        s = Err & " " & Err.Description & vbNewLine & vbNewLine & _
            "Keine Daten vorhanden."
        GoTo ErrM
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstTxtMemo_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub ogSie_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    OH_DuSie
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.ogSie_MouseDown"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstDet_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    OH_lstdetKeydown Me, KeyCode
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstDet_KeyDown"
    Resume ErrEnd
End Sub
Private Sub ogDu_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    OH_DuSie
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.ogDu_MouseDown"
    Resume ErrEnd
End Sub
Private Sub Unterschrift_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Adresse 'Unterschrift'"
    OH_A "Unterschrift", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.Unterschrift_Enter"
    Resume ErrEnd
End Sub
Private Function OH_DuSie()
On Error GoTo ErrMsg
    Dim lgF As Long
    lgF = Me!NrFunktion
    OH_SaveRS Me
    OH_EX "spA_Adresse 'DuSie'," & Nz(Me!IDAdresse, 0)
    OH_RQf Me
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.OH_DuSie"
    Resume ErrEnd
End Function
Public Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgC As Long
    Dim strW As String
    lgC = 3
    Select Case Nz(Me!lstA, 0)
    Case 0, 2, 3, 4, 9, 30
        strW = "0;30;30"
    Case 40
        t = "Kontrolle der Adressen"
        s = "jezt werden alle Adressen aufgelistet, die sie kontrollieren sollten" & vbNewLine & _
            "-Duplikate" & vbNewLine & _
            "-Ohne Zuordnungen" & vbNewLine & _
            "-Name zu Kurz" & vbNewLine & _
            "-Name fängt mit Leerschlag an"
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbNo Then
            GoTo ErrEnd
        End If
        strW = "0;45;20"
    Case Is >= 20
        strW = "0;22;15;17;6;6"
        lgC = 6
    Case Else
        strW = "0;45;20"
    End Select
    Me!lstDet.ColumnWidths = OH_ColumnWidthsMM(strW)
    Me!lstDet.ColumnCount = lgC
    Select Case Val(Me!lstA)
    Case 5
        Me!txtFind = Null
    Case Is > 4
        Me!lstV = 0
    End Select
    Me!txtFind.SetFocus
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Dim lgA As Long
    Dim lgNew As Long
    t = Nz(Me!lstMdo.column(1), "")
    s = "Liste der Datensätze, die von mir markiert wurden"
    Me!lstM.ControlTipText = s
    lgA = Val(Nz(Me!lstMdo, 0))
    Select Case lgA
    Case 0, 100
        Me!lstMdo = 100
        OH_MarkerLST Me
    Case 1
        OH_MarkerYesOne Me
    Case 2
        OH_MarkerYes Me
    Case 3
        OH_MarkerYesSelected Me
    Case 5
        OH_MarkerNoOne Me
    Case 6
        OH_MarkerNo Me
    Case 9, 10
        Select Case Me!NrFunktion
        Case Is < 5, EFNrFktn, lguser
            MsgBox "Löschen verboten!", vbCritical, Me!namen & Space(10) & "Eigene Firma, User"
        Case Else
            OH_DeleteRS Me, Me!lstMdo
        End Select
    Case 30
        t = "markierte Adressen inaktiv setzen"
        Select Case Me!countM
        Case Is <= 0
            s = "Sie haben keine Adresse ausgewählt"
            GoTo ErrM
        Case 1
            s = Me!lstM.column(1, 1)
        Case Else
            s = "Wollen Sie die gezeigten Adressen (" & Me!countM & ")"
            If Me!countM > 10 Then
                If MsgBox("Erste von zwei Sicherheitsabfragen!!" & vbNewLine & vbNewLine & _
                        "Soviele (" & Me!countM & ") inaktiv setzen...??", vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                    GoTo ErrEnd
                End If
                s = "Bitte NOCHMAL bestätigen!" & vbNewLine & s
            End If
        End Select
        s = s & " inaktiv setzen?"
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
            GoTo ErrEnd
        End If
        If left(Me!lstM.column(3, 0), 7) <> "Letztes" Then
            s = "ACHTUNG!!!!!!!!!!!!!" & vbNewLine & _
            "Wollen Sie wirklich die MARKIERTEN Adressen (" & Me!countM & ") inaktiv setzen?"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        OH_InsertID_LST Me!lstM
        OH_A " @x = 'lstmdo'" & _
             ",@i = " & Me!lstMdo
        OH_EX
    Case 200
        i = Val(InputBox("Bitte Anzahl Jahre (> 0) eingeben", t))
        If i <= 0 Then
            GoTo ErrEnd
        End If
        OH_MarkerNo Me
        OH_A " @x = 'lstmdo'" & _
             ",@a = " & Me!lstMdo & _
             ",@i = " & i & _
             ",@z = " & EFNr
        OH_A "lstM", strSQL
        Me!countM = Me!lstM.ListCount
        s = "Liste der Adressen, die nicht mehr geändert wurden" & vbNewLine & _
            "und denen kein Vorgang zugeordnet ist" & vbNewLine & _
            "seit " & i & " Jahren"
        Me!lstM.ControlTipText = s
    Case Is > 100, Is < 200, 300, 301
        OH_A "@x ='top'" & _
            ", @i = " & Nz(Me!lstMdo, 100) & _
            ", @a = " & Me!lstTopA & _
            ", @n = " & Nz(Me!lstM, 0) & _
            ", @m = " & Nz(Me!NrFunktion, 0) & _
            ", @z = " & Nz(Me!IDAdresse, 0) & _
            ", @b = " & Me!lstAktiv, , Me
        If lgA = 301 Then
            Me!lstact = 70
            lstAct_AfterUpdate
        Else
            OH_A "lstM", strSQL
        End If
    End Select
    If Val(Me!lstMdo) < 100 Then
        Me!lstMdo = 100
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstMdo_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Function OH_Postadr(blP As Boolean) As String
On Error GoTo ErrMsg
    Dim strM As String
    OH_SaveRS Me
    t = "Prüfe postalische Vorschriften für " & Me.pageFunktion.Caption
    s = "Hinweis: " & vbNewLine & _
            Me!PostAdr.ControlTipText & vbNewLine & _
            "===========================================" & vbNewLine & _
            "Die aktuelle Postadresse entspricht den Vorschriften"
    If IsNull(Me!Ort) Then
        strM = "Achtung: Ort fehlt"
    End If
    If IsNull(Me!PLZStrasse) Then
        strM = strM & vbNewLine & _
                "Achtung: PLZ fehlt"
    End If
    If IsNull(Me!Strasse) Then
        strM = strM & vbNewLine & _
                "Achtung: Strasse fehlt"
    End If
    If blP Then
        If Nz(Me!PostAdr) = Me!postadrv Then
            MsgBox s & vbNewLine & strM, vbInformation, t
            GoTo ErrEnd
        Else
            If MsgBox(s & " NICHT! (oder weicht davon ab)" & vbNewLine & _
                    strM & vbNewLine & _
                    "Soll diese Adresse eingetragen werden?" & vbNewLine & vbNewLine & _
                    Me!postadrv, vbQuestion + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
    Else
        If strM <> "" Then
            GoTo ErrEnd
        End If
    End If
    OH_A "@x = 'UpdatePostadr', " & _
        " @i = " & Me!IDAdresse
    OH_EX
    OH_RQf Me
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_Postadr"
    Resume ErrEnd
End Function
Public Function OH_newOutlookContact(lgid As Long)
On Error GoTo ErrMsg
    Dim strf As String
    Dim lgF As Long
    OH_A "@x = 'OH_newOutlookContact'," & _
        " @i = " & lgid & "," & _
        " @a = 0"
    OH_r rx
    If rx.BOF Then
        s = "Keine Daten zu finden"
        GoTo ErrMsg1
    End If
    If rx!ogAdresse > 0 Then
        DoCmd.openForm "PF_NeuAdresse", , , , , , "o" & lgid
    End If
ErrEnd:
    OH_ResetRS rx
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.OH_newOutlookContact"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox s, vbInformation, "F_Adresse.OH_newOutlookContact"
    GoTo ErrEnd
End Function
Private Sub lstWvAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstWvAct Me, Me!lstWvAct
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstWvAct_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstWv_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_lstWv_DblClick Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstWv_DblClick"
    Resume ErrEnd
End Sub
Private Sub txtWV_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_lstWv_DblClick Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.txtWV_DblClick"
    Resume ErrEnd
End Sub
Private Sub lstWv_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    Me!lstWv.Tag = x
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstWv_MouseDown"
    Resume ErrEnd
End Sub
Private Sub lstAuditAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_Audit Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Adresse.lstAuditAct_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstAudit_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!lstAudit, 0)
    If lgid = 0 Then
        GoTo ErrEnd
    End If
    OH_OF "F_Audit", lgid
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.lstAudit_DblClick"
    Resume ErrEnd
End Sub
Private Sub Fax_AfterUpdate()
On Error GoTo ErrMsg
    If Not IsNull(Me!Fax) Then
        Me!Fax = Trim(Replace(Me!Fax, "fax", ""))
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.Fax_AfterUpdate"
    Resume ErrEnd
End Sub
Public Function OH_AdresseCurrent()
On Error GoTo ErrMsg
    Dim lgA As Long
    t = "Aktuelle Adresse"
    Me!btnName.ControlTipText = Nz(Me!namen, "") & " : zeige alle Funktionen"
    Me!btnZuord.ControlTipText = Me!namen & " " & Me!Wo & " : zeige alle zugeordneten Adressen"
    Select Case Me!ArtAdresse
    Case "Firma"
        s = "Firmen-Bezeichnung:"
    Case Else
        s = "Nachname der Person:"
    End Select
    Me!Nachname.ControlTipText = s & vbNewLine & vbNewLine & Me!Nachname & vbNewLine & _
            "Doppelcick nimmgt die Adresse in den Zwischenspeicher!"
    Me!Wo.ControlTipText = "Die aktuelle Adresse " & vbNewLine & _
                            Me!Nachname & vbNewLine & _
                            "ist zugeordnet zu" & vbNewLine & _
                            Me!Wo
    If Me.RegMain = 1 Then
        If Len(Nz(Me!CC, "")) > 0 Then
            If MsgBox(left(Me!CC, 50) & "..." & vbNewLine & _
                      "CC entfernen?", vbQuestion + vbYesNo, _
                      "Wechsel der Adresse; CC ist ausgefüllt") = vbYes Then
                Me!CC = Null
            End If
        End If
    End If
    lgA = Nz(Me!IDAdresse, 0)
    Me!Nachname.BackColor = vbWhite
    EndeFunktion_AfterUpdate
    If InStr(Me!Nachname, "Ohnemus") > 0 Then
        Me!Nachname.BackColor = vbYellow
    End If
    If InStr(Me!Nachname, "Ohnemus") > 0 Then
        Me!Nachname.BackColor = vbYellow
    End If
    ArtAdresse_BeforeUpdate (0)
    Funktion_BeforeUpdate (0)
    regMain_Change
    regD_Change
    Me.Visible = True
    OH_ShowWichtigeInfo "equal"
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        s = Err.number & " " & Err.Description
        t = "F_Adresse.OH_AdresseCurrent"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Function
Private Sub lstDSGVOact_AfterUpdate()
On Error GoTo ErrMsg
Dim lgact As Long
Dim strQ As String
Dim lgid As Long
    OH_SaveRS Me
    t = "DSGVO: " & Nz(Me!lstDSGVOact.column(1), "") & " ==> " & Me!Vorname & " " & Me!Nachname
    lgact = Nz(Me!lstDSGVOact, 10)
    OH_A "@x = 'lstDSGVOAct'" & _
        ", @a = " & lgact & _
        ", @z = " & Me!DuSie & _
        ", @i = " & Me!NrFunktion & _
        ", @d = '" & Nz(Me!comSprache, "deutsch") & "'"
    strQ = strSQL
    Select Case lgact
    Case 10 'Einverständnis per Mail holen
        OH_r r
        If r.BOF Then 'keine Daten gefunden
            s = "Keine Daten gefunden."
            GoTo ErrM
        End If
        If IsNull(r!EMail) Then
            s = "Bitte hinterlegen Sie eine gültige E-Mailadresse."
            GoTo ErrM
        End If
        If OH_OutlookMail(r!EMail, r!Subject, r!body, Me!NrFunktion, , , , , , Me) = True Then
            strSQL = strQ & ", @b = 1"
            OH_EX
            OH_RQ Me!lstDSGVO
        End If
    Case 20 'Rückmeldung
        s = "Bitte tragen Sie die Rückmeldung bzgl. DSGVO ein."
        s = InputBox(s, t)
        If s <> "" Then
            strSQL = strQ & ", @f = '" & s & "'"
            OH_EX
            OH_RQ Me!lstDSGVO
        End If
    Case 22   'rechts Einträge entfernen...'<R6>
        OH_r r
        Select Case r!CT
        Case 0
            s = "Keine Einträge vorhanden"
            GoTo ErrM
        Case 1
            s = "Diesen einzigen DSGVO-Eintrag entfernen?"
            s = InputBox(s, t, "<Entfernen>")
        Case Else
DSGVOagain:
            lgid = Nz(Me!lstDSGVO.column(0), 0)
            If lgid > 0 Then
                s = "<ALLE>" & vbTab & "Alle " & r!CT & "DSGVO-Einträge entfernen?" & vbNewLine & _
                    "<Markiert> en Eintrag entfernen"
            Else
                s = "<Alle> " & r!CT & " Einträge entfernen?"
            End If
            s = InputBox(s, t, "<Alle> oder <markiert>")
        End Select
        Select Case s
        Case ""
            GoTo ErrEnd
        Case "<Alle>", "<Markiert>", "<Entfernen>", "Alle", "Markiert", "Entfernen"
            strSQL = strQ & _
                ",@f ='" & s & _
                "',@b = " & lgid
            OH_EX
            OH_RQ Me!lstDSGVO
            Me!lstDSGVOact = 0
        Case Else
            GoTo DSGVOagain
        End Select
    Case 40 'Adresse inaktiv setzen...
        Me!lstact = 51
        lstAct_AfterUpdate
    Case 50 'Adresse komplett löschen...
        Select Case Me!ArtAdresse
        Case "Herr", "Frau"
            If Me!NrAdrZuord = EFNr Then
                s = "Dieses Feature kann nicht auf Mitarbeiter angewendet werden!"
                GoTo ErrM
            End If
            s = "Wenn der zu löschenden Adresse Vorgänge zugeordnet sind, werden diese Vorgänge auf die Firma" & vbNewLine & _
                Me!Wo & vbNewLine & _
                "verschoben und bleiben somit erhalten!" & vbNewLine & vbNewLine & _
                "Bitte das komplette Löschen mit einem JA bestätigen."
            s = InputBox(s, t, "NEIN")
            If s = "JA" Then
                strSQL = strQ & ", @b = " & Me!IDAdresse
                OH_r r
                MsgBox r!Msg, vbInformation, t
                Me!lstA = 0
                Me!txtFind = Me!Wo
                txtFind_AfterUpdate
            End If
        Case Else
            s = "Dieses Feature kann nur auf Personen angewendet werden!"
            GoTo ErrM
        End Select
    Case 60  'Checke USt-Id'
        OH_CheckUSTID Me!NrAdrZuord, , , True
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        s = Err.number & " " & Err.Description
        t = "F_Adresse.lstDSGVOact_AfterUpdate"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Sub

Private Sub btnAn_Click()
    Me!comEmail.SetFocus
    OH_tlbZoom
End Sub
Private Sub btncc_Click()
    Me!CC.SetFocus
    OH_tlbZoom
End Sub
Private Sub btnbcc_Click()
    Me!bcc.SetFocus
    OH_tlbZoom
End Sub
Private Sub comMailArt_GotFocus()
    OH_A "comMailArt"
    Me!lstTxtMemo = 0
End Sub
Private Sub comMailArt_DblClick(Cancel As Integer)
    Me!comMailArt = Me!comMailArt.column(0, 0)
End Sub
Private Function OH_ShowWichtigeInfo(strHeight As String)
On Error GoTo ErrMsg
    Dim lgHLarge As Long
    Dim lgHSmall As Long
    Dim lgH As Long
    Dim lgWidth As Long
    lgHLarge = glFormHeight * 567 / 10
    lgHSmall = 0.5 * 567
    Select Case strHeight
    Case "Large"
        lgH = lgHLarge
    Case "Small"
        lgH = lgHSmall
    Case "Equal"
        Select Case Me!txtWichtigeInfos.Height
        Case lgHSmall, lgHLarge
            lgH = Me!txtWichtigeInfos.Height
        Case Else
            lgH = lgHSmall
        End Select
    Case "Change"
        Select Case Me!txtWichtigeInfos.Height
        Case lgHSmall
            lgH = lgHLarge
        Case Else
            lgH = lgHSmall
        End Select
    End Select
    OH_A "@x = 'OH_ShowWichtigeInfo'" & _
        ",@i = " & Me!NrFunktion & _
        ",@a = " & Me!NrAdrZuord, , Me
    OH_r r, strSQL
    s = Nz(r!txtWichtigeInfos, "")
    Me!txtWichtigeInfos = s
    i = r!AnzahlWichtigeInfos
    Select Case i
    Case 0
        s = ""
        Me!txtWichtigeInfos.Visible = False
        lgH = lgHSmall 'OH 250419 Bild wieder anzeigen
    Case 1
        s = "EINE wichtige Info"
        Me!txtWichtigeInfos.Visible = True
    Case Else
        s = i & " wichtige Infos"
        Me!txtWichtigeInfos.Visible = True
    End Select
    Me.pageFunktion.Caption = left(Me!namen & "  " & s & Space(50), 50)
    'Einstellen der Breite für die "wichtigen Infos"
    With Me!txtWichtigeInfos
        .Height = lgH
        lgWidth = glFormWidth / 10 'aktuelle Bildschirmbreite in cm
        If lgWidth > 48 Then
            lgWidth = 48
        End If
        i = lgWidth - (.left / 567)
        If i < 1 Or i > 20 Then 'wenn die berechnte Breite kleiner 1 cm oder > 20 cm==>stelle 10 cm ein
            i = 10
        End If
        .Width = i * 567
    End With
    Me!Pic.Visible = lgH < 567
    Me!lstPic.Visible = lgH < 567
    If strHeight <> "equal" Then
        Me!regd = 12
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.OH_ShowWichtigeInfo"
    Resume ErrEnd
End Function
Private Sub txtWichtigeInfos_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_ShowWichtigeInfo "change"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Adresse.txtWichtigeInfos_DblClick"
    Resume ErrEnd
End Sub
