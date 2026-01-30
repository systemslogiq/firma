Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim strArtK As String
Dim strP As String, strf As String
Dim strFreigabe As String
Dim intWidth As Integer
Dim intLeft As Integer
Dim blEuro As Boolean
Dim irt As Long
Dim blOhnePreise As Boolean
Dim lgPF As Long
Dim blLogoAlleSeiten As Boolean
Dim strReport As String
Dim blFeldSF As Long
Dim lgHeightLogoU As Long
Dim blAnredeVisible As Boolean
Dim strOA As String
Dim lgtopLogo As Long
Dim lgtopLogo2 As Long
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    strOA = Nz(Me.OpenArgs, "")
    strReport = Nz(VarAntw, "")
    x = 1
    strSQL = "Exec dbo.spa_B_VG " & _
            " @x = 'B_VG'" & _
            ", @f = '" & strReport & _
            "',@d = '" & strOA & "'"
    Cancel = OH_B(Me, , , strSQL)
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "Report_B_VG.Report_Open"
    Resume ErrM
ErrM:
    Cancel = True
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Report_activate()
On Error GoTo ErrMsg
    OH_InitLg Me, Nz(Me!VGSprache, "Deutsch")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.Report_activate"
    Resume ErrEnd
End Sub
Private Sub Report_Deactivate()
On Error GoTo ErrMsg
    VarAntw = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.Report_Deactivate"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim N As Long
    If Me!RabattVG = 0 Then
        Me!RabattVG.Visible = False
    Else
        Me!RabattVG.Visible = Me!blRabatt <> 0
    End If
    If IsNull(Me!VGDetTxt1) Then
        Me!VGDettxt.Visible = False
    Else
        Me!VGDettxt.Visible = True
        Me!VGDettxt = Me!DetTxt1 & ": " & Me!VGDetTxt1
    End If
    Me!BemVGDet.Visible = Not IsNull(Me!BemVGDet)
    Me!EPreis = Null
    Select Case Me!Druckvorlage
    Case "Lieferantenerklärung"
        strSQL = "Exec dbo.spa_B_VG " & _
                "@x = '" & Me!Druckvorlage & "'," & _
                "@i = " & Me!nrVGDet
        OH_r r
        If r.BOF = False Then
            Me!EPreis.Visible = True
            Me!EPreis = r!BemStichwort
        End If
        OH_ResetRS r
    Case Else
        Me!EPreis = Me!EPreisDet
    End Select
    If blOhnePreise = True Then
        Me!RabattVG.Visible = False
        Me!EinzelpreisVG.Visible = False
        Me!EPreis.Visible = False
    End If
    Me!nextPage.Visible = False
    Me!nextPageSum.Visible = False
    Me!SeiteBeeinflussen.Visible = False
    Me!SeiteBeeinflussen = Null
    If Nz(Me!Position, 0) > 0 And Not Nz(Me!Druckvorlage, "") Like "Text" Then
        Me.Det.Visible = True
    Else
        Me.Det.Visible = False
    End If
    Select Case Nz(Me!MoveRecord, 0)
    Case Is > 0
        If Me!MoveRecord < 30 Then
            Me!SeiteBeeinflussen.Visible = True
            For i = 1 To Me!MoveRecord
                Me!SeiteBeeinflussen = Me!SeiteBeeinflussen & vbNewLine & "Move Record"
            Next i
        Else
            Me.Det.Visible = False '<R46>
        End If
    Case -1
        Me!nextPage.top = 0
        Me!nextPage.Visible = True
    Case -2
        Me!nextPage.top = Me!liniedetHelp.top + 0.051 * 567
        Me!nextPage.Visible = True
    Case -3
        Me!nextPageSum.Visible = True
    End Select
    'wenn nur eine Position enthalten ist, wird das Feld Pos-Nr. ausgeblendet
    Me!txtPos.Visible = Me!countPos > 0
    Me!Posnr.Visible = Me!countPos > 0
    Me!SK1.Visible = Me!countPos > 0
    For i = 1 To 6
        Me("SK" & i).Visible = True
        '140707 wenn nach dem letzten Artikel ein Seitensprung gewünscht ist, darf die Überschrift nicht mehr erscheinen
        If Me!countPos = Val(Nz(Me!Posnr, "")) Then
            If Me!MoveRecord = -2 Then
                Me("SK" & i).Visible = False
            End If
        End If
        If Me!Druckvorlage Like "Lieferung" Or _
            blOhnePreise Then
            If i > 3 Then
                Me("SK" & i).Visible = False
            End If
        End If
    Next i
    If Me!EPreis >= 1000000 Then
        Me!EPreis.FontName = "Arial Narrow"
    Else
        Me!EPreis.FontName = Me!AnzahlEinheitF.FontName 'Korrektur Input Dirk 230414
    End If
    If Me!RabattVG = 100 Then
        Me!RabattVG.FontName = "Arial Narrow"
    Else
        Me!RabattVG.FontName = Me!AnzahlEinheitF.FontName 'Korrektur Input Dirk 230414
    End If
    Me!liniedetHelp.Visible = Me!rowNumber = Me!countPos
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.det_Format"
    Resume ErrEnd
End Sub
Private Sub GFA_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    For i = 1 To 6
        Me("SK" & i).Visible = False
    Next i
    Me!TotalText.Visible = Not blOhnePreise
    Me!TextGesamtpreis.Visible = Not blOhnePreise
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.GFA_Format"
    Resume ErrEnd
End Sub
Private Sub GFID_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    If glGFIDnotvisible Then
        Me.gfID.Visible = False
    Else
        If blOhnePreise = False Then
        '2. Unterschrift
            Me!Mitarbeiter2.Visible = False
            Me!UnterschriftPic2.Visible = False
            If Nz(Me!NrMA2, 0) > 0 Then
                'Hole Infos zu 2. Unterschrift
                strSQL = "Exec dbo.spa_B_VG " & _
                        " @x = 'Unterschrift2'" & _
                        ", @i = " & Me!NrMA2 & _
                        ", @s = '" & gllg & "'"
                OH_r r
                If r.BOF Then
                    MsgBox "Mitarbeiter nicht gefunden", vbCritical, "2. Unterschrift"
                    Exit Sub
                End If
                Me!Mitarbeiter2 = r!unterschrift2
                Me!Mitarbeiter2.Visible = True
                If Me!UnterschriftPic.Visible = True Then
                    Me!UnterschriftPic2.Visible = True
                    Me!UnterschriftPic2.picture = OH_GetPic(Me!NrMA2, "+Unterschrift")
                End If
                OH_ResetRS r
                If intLeft > 20 Then
                    Me!Gruss.left = 0
                    Me!Mitarbeiter2.left = 0
                    Me!UnterschriftPic2.left = 0
                    Me!TX_EFName.left = 0
                End If
            End If
        Else
            Me.gfID.Visible = False
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.GFID_Format"
    Resume ErrEnd
End Sub
Private Sub gfMWST_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim blvM As Boolean
    Select Case Me!Druckvorlage
    Case "Text", "Lieferung", "Lieferschein", "Lieferschein-Rückstand"
    Case Else
        If Me!VGPrint <> 0 Then
            If blOhnePreise = False Then
                blvM = Nz(Me!MWSTx, 0) > 0
                Me!MWSt_Anzeige.Visible = blvM
                Me!Zwischentotal2.Visible = blvM
                Me!E_MWSt.Visible = blvM
                Me.gfMWST.Visible = True
                Me!MWSt_Anzeige = lg("MWSt") & " " & OH_Runde(Nz(Me!MWSTx, 0)) & " % " & lg("von")
           End If
        End If
        Me.gfMWST.Visible = blvM
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.gfMWST_Format"
    Resume ErrEnd
End Sub
Private Sub GFRT_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me.GFRT.Visible = Nz(Me!VGBemerkung, "") <> "" _
                    Or Nz(Me!Schluss, "") <> "" _
                    Or Me!Stempel = 1 '--<R222>
    'neue Seite für Bemerkungen steuern....
    If Me!VGBEMNeueSeite > 0 Then
        Me.GFRT.ForceNewPage = 1
    End If
    If Me!Stempel = 1 Then '<R222>
        With Me!picSignatureInvoice
            .Visible = Me!Stempel
            'Me!picSignatureInvoice.BackColor = vbRed
            .Width = 4 * 567
            .Height = 4 * 567
            .left = 10 * 567
            .top = 0.7 * 567
            .picture = OH_GetPic(Me!NrMitarbeiter, "+Rechnung Stempel Unterschrift")
        End With
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.GFRT_Format"
    Resume ErrEnd
End Sub
Private Sub ghPosNr_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!nextPagePosnr.Visible = False
    Me!SeiteBeeinflussenPosnr.Visible = False
    Me!SeiteBeeinflussenPosnr = Null
    If Me!TitelNr > 0 And Position = 0 Then
        Me.ghPosnr.Visible = True
        If Me!VGPrint = 0 Then
            Me!SumTitelNr.Visible = False
        Else
            Me!SumTitelNr.Visible = True
            'berechne Teilsumme
            strSQL = "Exec dbo.spa_B_VG " & _
                    " @x = 'Teilsumme'," & _
                    " @i = " & Me!id1 & " ," & _
                    " @v = " & Me!TitelNr
            OH_r r
            Me!SumTitelNr = r!ZS
        End If
        Select Case Nz(Me!MoveRecord, 0)
        Case Is > 0
            Me!SeiteBeeinflussenPosnr.Visible = True
            For i = 1 To Me!MoveRecord
                Me!SeiteBeeinflussenPosnr = Me!SeiteBeeinflussenPosnr & vbNewLine & "Move Record"
            Next i
        Case -1
            Me!nextPagePosnr.Visible = True
        End Select
    Else
        Me.ghPosnr.Visible = False
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.ghPosNr_Format"
    Resume ErrEnd
End Sub
Private Sub GFVG_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim strBau As String
    Dim strFirma As String
    Me!TxtAttachment = Null
    Me!Attachment = Null
    Me!TxtCC = Null
    Me!CC = Null
    'suche ob in Zuordnungen "CC's" erfasst sind,
    'wenn ja ausdrucken mit Namen und Funktion
    strSQL = "Exec dbo.spa_B_VG " & _
        " @x = 'CCs'," & _
        " @i = " & Me!id1
    OH_r rx
    If Not rx.BOF Then
        Me.GFVG.Height = 2 * 567
        Me!TxtCC.top = 1 * 567
        Me!CC.top = Me!TxtCC.top
        If rx!ArtZuord Like "CC" Then
            Me!TxtCC = lg("zur Kenntnis") & ":"
        Else
            Me!TxtCC = lg(rx!ArtZuord) & ":"
        End If
        rx.MoveFirst
        While Not rx.EOF
            strFirma = vbNewLine
            If rx!NrF <> Me!NrFirma Then
                If rx!NrF <> rx!NrP Then
                    strFirma = ", " & rx!Firma & vbNewLine
                End If
            End If
            If IsNull(rx!BauBuero) Then
                strBau = "  "
            Else
                strBau = ", " & rx!BauBuero & " "
            End If
            Me!CC = Trim(Me!CC & rx!VorNachnameKurz & strBau & rx!Bemerkung) & strFirma
        rx.MoveNext
        Wend
    End If
    If Me!countPos = -1 Then 'Brief von Adressen aus
        If Nz(Me!idt8, "") <> "" Then
            Me!TxtAttachment = lg("Anlagen") & ":"
            Me!Attachment = Me!idt8
        End If
    Else
        'suche ob in Stichworte "Anlagen" erfasst sind,
        strSQL = "Exec dbo.spa_B_VG " & _
            " @x = 'Anlagen'," & _
            " @i = " & Me!id1
        OH_r rx
        If Not rx.BOF Then
            Me!TxtAttachment = lg("Anlagen") & ": "
            rx.MoveFirst
            While Not rx.EOF
                Me!Attachment = Trim(Me!Attachment & " " & HyperlinkPart(rx!StichwortHyperlink, acDisplayText))
            rx.MoveNext
            Wend
        End If
        OH_ResetRS rx
        strSQL = "Exec dbo.spa_B_VG " & _
            " @x = 'AnlagenPS'," & _
            " @i = " & Me!id1
        OH_r r
        While Not r.EOF
            If r!txt = "Anlagen" Then
                If IsNull(Me!Attachment) Then
                    Me!TxtAttachment = lg("Anlagen") & ": "
                    Me!Attachment = r!txtV
                Else
                    Me!Attachment = Me!Attachment & vbNewLine & r!txtV
                End If
            End If
            If r!txt = "PS" Then
                Me!txtPS = "PS: " & r!txtV
            End If
        r.MoveNext
        Wend
    End If
    Me.GFVG.Visible = Nz(Me!Attachment, "") <> "" _
                    Or Nz(Me!CC, "") <> "" _
                    Or Nz(Me!AnhangVorgang, "") <> "" _
                    Or Nz(Me!txtPS, "") <> "" _
                    Or Nz(Me!Gesamtübersicht, 0) = 2 _
                    Or Nz(Me!Gesamtübersicht, 0) = 1 _
                    Or Nz(Me!SwissQRCode, 0) = 1 _
                    Or Nz(Me!Rahmenvertrag, 0) <> 0
    Me.GesamtübersichtSeitenumbruch.Visible = Len(Nz(Me!AnhangVorgang, "")) > 500
    Me.UB_VGGesamtÜbersicht.Visible = False
    Select Case Me!Gesamtübersicht
    Case 1
        Me.UB_VGGesamtÜbersicht.Visible = True
    Case 2
        Me.UB_VGGesamtÜbersicht.Visible = True
        Me.GesamtübersichtSeitenumbruch.Visible = True
    End Select
    Me.UB_VGRahmenvertrag.Visible = Me!Rahmenvertrag = 1
    If Nz(Me!SwissQRCode, 0) Then
        '############# Swiss QR-Code ###############
          'QR-Zahlschein erzeugen
          OH_CreateQRBillPicture Me.picQRBill
        '###########################################
    End If
    Me!TextEinzelPreis.Visible = Me!SK4.Visible
    Me!Rabatt.Visible = Me!SK5.Visible
    Me!TextEPreis.Visible = Me!SK6.Visible
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.GFVG_Format"
    Resume ErrEnd
End Sub
Private Sub pf_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim blvpf As Boolean
    Dim lgTopFeldSF As Long
    blvpf = True
    Me.pf.Visible = blvpf
    If Me!Druckvorlage Like "Auftragsbestätigung" Then
        s = lg("Auftragsbestätigung")
    Else
        s = lg(Me!QK)
    End If
    If Me!Druckvorlage Like "Rechnung" Then
        s = s & " Nr. " & Me!VGNr & "-" & Me!VGID
    Else
        s = s & " Nr. " & Me!VNr & "-" & Me!VGID
    End If
    If lgHeightLogoU > 0 Then
        Me.pf.Height = Me!LogoSeiteU.top + lgHeightLogoU + Me!FeldSF.Height + 10
        Me!LogoSeiteU.Height = lgHeightLogoU
        blvpf = True
    End If
    Me!FeldSF = getPageNr(Me!pages, Me!page, Me!id1)
    If blFeldSF = True And Me!page = 1 Then
        Me!FeldSF.Visible = False
    Else
        blvpf = True
        Me!FeldSF.Visible = blvpf
       ' Me!FeldSF.Top = Me.pf.Height - Me!FeldSF.Height
        lgTopFeldSF = Me!LogoSeiteU.top + Me!LogoSeiteU.Height
        If lgTopFeldSF < 0 Then
            lgTopFeldSF = 0
        End If
        Me!FeldSF.top = lgTopFeldSF
        If Nz(Me!FeldSF, "") = "" Then
            blvpf = False
        End If
    End If
    If lgPF > 0 Then
        Me.pf.Height = lgPF
    End If
    Select Case Nz(right(Me!FeldSF, 1), "")
    Case "1", " ", ""
        Me!FeldSF.Visible = False
    Case Else
        Me!FeldSF.Visible = True
        If Me!IDQK >= 90 Then
            Me!FeldSF = Replace(Me!FeldSF, "Brief, Fax, EMail", strReport)
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.pf_Format"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim lgSKTop As Long
    gllg = Nz(Me!VGSprache, "Deutsch")
    Me!LogoSeiteO.top = lgtopLogo
    If Me.page = 1 Then
        Me!LogoSeiteO.Visible = True
        Me!LogoSeiteO2.Visible = False
        For i = 1 To 6
            Me("SK" & i).top = 0
            Me("SK" & i).Visible = False
        Next i
    Else
        If lgtopLogo2 > 0 Then
            lgSKTop = Me!LogoSeiteO2.Height + Me!LogoSeiteO2.top
            Me!LogoSeiteO.Visible = False
            Me!LogoSeiteO2.Visible = True
        Else
            lgSKTop = Me!LogoSeiteO.Height + Me!LogoSeiteO.top
            Me!LogoSeiteO.Visible = blLogoAlleSeiten
        End If
        If Me!SK1.Visible = True Then
            For i = 1 To 6
                Me("SK" & i).top = lgSKTop
            Next i
        Else
            For i = 1 To 6
                Me("SK" & i).top = 0
            Next i
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.ph_Format"
    Resume ErrEnd
End Sub
Private Sub GKID_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim strLL As String
    Dim strBS As String
    Dim lenText As Integer
    Dim strKZ As String
    Dim rsa As ADODB.Recordset
    Dim lgTop As Long
    Dim N As Long
    Dim lgLeft As Long
    Dim lgHeight As Long
    Dim lgWidth As Long
    Dim lgtopAdresse As Long
    Dim strC As String
    Dim strC1 As String
    Dim strC2 As String
    Dim strCx As String
    strArtK = strReport
    If InStr(strReport, "Brief") > 0 Then
        strArtK = "Brief"
    End If
    If InStr(strReport, "Notiz") > 0 Then
        strArtK = "Brief"
    End If
    If InStr(strReport, "B2B") > 0 Then
        strArtK = "eMail"
    End If
    If InStr(strReport, "eMail") > 0 Then
        strArtK = "eMail"
    End If
    If InStr(strReport, "pdf-File") > 0 Then
        strArtK = "eMail"
    End If
    If InStr(strReport, "ohne Preise") > 0 Then
        blOhnePreise = True
    Else
        blOhnePreise = Me!VGPrint = 4
    End If
    strSQL = "Exec dbo.spa_B_VG " & _
            "  @x = 'rsA'" & _
            ", @i = " & Me!NrMitarbeiter & _
            ", @f = '" & strArtK & _
            "',@d = '" & strReport & _
            "',@s = '" & gllg & "'"
    OH_r rsa, , , , True
    OH_EFAbsender Me!NrMitarbeiter, strReport
    EFFirma = rsa!AF_Nachname
    Me!FeldDatum = rsa!AF_Ort & ", " & Format(Me!vgdatumX, "dd.mm.yyyy")
    Select Case Me!Xunterschrift
    Case "1"
        Me!Mitarbeiter = rsa!NameDU
    Case "0"
        Me!Mitarbeiter = rsa!Mitarbeiter
    Case Else
        Me!Mitarbeiter = Me!Xunterschrift
    End Select
    Me!VGBrief.Visible = False
    Me!Anrede.Visible = False
    If Me!VGAbschluss = 0 Then
        'suche in Stichworten nach Eintrag "Achtung"
        'siehe auch Report_Close()
        If InStr(strP, " " & Me!Personadresse & " ") = 0 Then
            If strP = "" Then
                strP = " " & Me!Personadresse & " "
            Else
                strP = strP & " , " & Me!Personadresse & " "
            End If
        End If
        If InStr(strf, " " & Me!FirmaAdresse & " ") = 0 Then
            If strf = "" Then
                strf = " " & Me!FirmaAdresse & " "
            Else
                strf = strf & " , " & Me!FirmaAdresse & " "
            End If
        End If
    End If
'alle Felder auf visible setzen und anschliessend individuell entscheiden, ob sichtbar
    Me!RabattVG.Visible = True
    Me!RabattRech_Anzeige.Visible = True
    Me!RabattRech_Anzeige1.Visible = True
    Me!E_Rabatt.Visible = True
    Me!E_Rabatt1.Visible = True
    Me!E_Rabattf.Visible = True
    Me!E_Rabatt1f.Visible = True
    Me!E_RabattText.Visible = True
    Me!E_RabattText1.Visible = True
    Me!MWSt_Anzeige.Visible = True
    Me!Zwischentotal2.Visible = True
    Me!E_MWSt.Visible = True
    Me!Total.Visible = True
    Me!TotalText.Visible = True
    Me!TextEinzelPreis.Visible = True
    Me!Rabatt.Visible = True
    Me!TextEPreis.Visible = True
 'wenn kein Rabatt, Feld nicht drucken
    If Nz(Me!VGRabatt, 0) = 0 Then
        Me!RabattRech_Anzeige.Visible = False
        Me!E_Rabatt.Visible = False
        Me!E_Rabattf.Visible = False
        Me!E_RabattText.Visible = False
    End If
    If Nz(Me!VGRabatt1, 0) = 0 Then
        Me!RabattRech_Anzeige1.Visible = False
        Me!E_Rabatt1.Visible = False
        Me!E_Rabatt1f.Visible = False
        Me!E_RabattText1.Visible = False
    End If

    If Me!E_MWSt = 0 Then
        Me!MWSt_Anzeige.Visible = False
        Me!Zwischentotal2.Visible = False
        Me!E_MWSt.Visible = False
    End If
    Me.Caption = Me!ReportCaption
    'da aus der Caption der Name für das PDF-File gebildet wird, dürfen keine Sonderzeichen enthalten sein!
    If strArtK = "Email" Then
        strC = Me.Caption
        For i = 1 To Len(strC)
            strC1 = Mid(strC, i, 1)
            strC2 = "_"
            Select Case Asc(strC1)
            Case 32, 45, 160
                strC2 = strC1
            Case Is < 48
            Case 92, 59
            Case Else
                strC2 = strC1
            End Select
            strCx = strCx & strC2
        Next i
        Me.Caption = strCx
    End If
    For i = 1 To 6
        Me("SK" & i).Visible = False
    Next i
    Me!GesamttotalEuro1.Visible = blEuro
    Select Case Me!Druckvorlage
    Case "Lieferschein", "Lieferschein-Rückstand", "Lieferung"
        Me.GFRech.Visible = False
        Me.gfID.Visible = False
        Me.GFA.Visible = False
        Me!RabattVG.Visible = False
        Me!Rabatt.Visible = Me!Rahmenvertrag = 2
        Me!EPreis.Visible = False
        Me!EinzelpreisVG.Visible = False
        Me!TextEPreis.Visible = False
        Me!TextEinzelPreis.Visible = False
        Me!SK4.Visible = False
        Me!SK5.Visible = False
        Me!SK6.Visible = False
        Me.gfMWST.Visible = False
        Me!Anrede.Visible = False
    Case "Rechnung"
        Me.GFRech.Visible = True
        Me.gfID.Visible = False
        Me.GFA.Visible = False
    Case "Gutschrift"
        Me.GFRech.Visible = True
       ' Me.gfID.Visible = True
        Me.GFA.Visible = False
    Case "Lieferantenerklärung"
        Me.GFRech.Visible = False
        Me.GFA.Visible = False
        Me!RabattVG.Visible = False
        Me!Rabatt.Visible = False
        Me!EPreis.Visible = False
        Me!EinzelpreisVG.Visible = False
        Me!TextAnzahl.Visible = False
        Me!Liefereinheit.Visible = False
        Me!AnzahlEinheitF.Visible = False
        Me!TextEinzelPreis.Visible = False
        Me!SK3.Visible = False
        Me!SK4.Visible = False
        Me!SK5.Visible = False
        Me!SK6.Visible = False
        Me!UB_Stichwort.Visible = False
    Case Else
        Me.gfID.Visible = True
        Select Case Me!VGPrint
        Case -1, 1, 2
            Me.GFA.Visible = Not Me.gfMWST.Visible   '101211
            Me.GFRech.Visible = Me.gfMWST.Visible    '130723
        Case 0
            Me.GFA.Visible = False
            Me.GFRech.Visible = False
        End Select
        Me!Anrede.Visible = blAnredeVisible
        '130731
        If Me!Druckvorlage = "Auftragsbestätigung" Then
            Me!Anrede.Visible = False
        End If
    End Select
    'Rabatt und Euro-Anzeige notwendig?
    If Me.GFA.Visible = True Then
        If Me!VGRabatt = 0 And Me!VGRabatt1 = 0 Then
            Me.GFA1.Visible = blEuro
        Else
            Me.GFA1.Visible = True
            Me!Total.Visible = True
            Me!TotalText.Visible = True
            Me!LinieTotal.top = Me!Gesamtpreis.top + Me!Gesamtpreis.Height + 40
            Me!LinieTotal1.top = Me!LinieTotal.top + 20
        End If
    Else
        Me.GFA1.Visible = False
    End If
    If Me.GFRech.Visible = True Then
        If Me!Zwischentotal1 = Me!SumVGTot Then
            Me.GFRech1.Visible = False
        Else
            Me.GFRech1.Visible = True
        End If
    Else
        Me.GFRech1.Visible = False
    End If
    Me!TX_EFAbsender = vbNullString
    Me!TX_EFKlein = vbNullString
    rsa.MoveFirst
    rsa.Find "Stichwort='+Fontsize Kurz-Adresse'"
    If rsa.EOF = False Then
        If InStr(rsa!BemStichwort, strArtK) > 0 Then
            If Nz(Me!Absenderadresse, "") = "" Then
                Me!TX_EFKlein = EFAbsenderKlein
            Else
                Me!TX_EFKlein = Me!Absenderadresse
            End If
        End If
        x = Val(rsa!BemStichwort)
        If x > 0 Then
            Me!TX_EFKlein.FontSize = x
        Else
            Me!TX_EFKlein = vbNullString
        End If
    End If
    Select Case strArtK
    Case "Brief"
        Me!UnterschriftPic.Visible = False
    Case "B2B", "Email"
        Me!UnterschriftPic.Visible = True
        Me!UnterschriftPic.picture = OH_GetPic(Me!NrMitarbeiter, "+Unterschrift")
        Me!TX_EFAbsender = EFAbsender
        If Nz(Me!Absenderadresse, "") = "" Then
            Me!TX_EFKlein = EFAbsenderKlein
        Else
            Me!TX_EFKlein = Me!Absenderadresse
        End If
    End Select
    Me!TX_EFName = EFFirma
    rsa.MoveFirst
    rsa.Find "Stichwort='+Fontsize Adresse'"
    If rsa.EOF = False Then
        strBS = rsa!BemStichwort
        lgtopAdresse = Val(Mid(strBS, InStr(strBS, "topAdresse") + 11, 4)) * 567
        lgTop = Val(Mid(strBS, InStr(strBS, "oben") + 5, 4)) * 567
        lgLeft = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
        lgWidth = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
        lgHeight = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
        blAnredeVisible = InStr(strBS, "OhneAnrede") = 0
       ' Me!Adresse.Height = lgHeight
        If lgtopAdresse > 0 Then
            If Me!TX_EFKlein = "" Then
                Me!Adresse.top = lgtopAdresse
                Me!TX_EFKlein.top = lgtopAdresse
            Else
                If lgtopAdresse > Me!TX_EFKlein.top Then
                    Me.GKID.Height = lgtopAdresse + Me!Adresse.Height
                    Me!Adresse.top = lgtopAdresse
                    N = lgtopAdresse - (0.7 * 567)
                    If N < 0 Then
                        N = 0
                    End If
                    Me!TX_EFKlein.top = N
                End If
            End If
        End If
        If InStr(strBS, strArtK) > 0 Then
            If Len(Nz(rsa!HL, "")) = 0 Then
                Me!TX_EFAbsender = EFAbsender
                Me!TX_EFAbsender.Visible = True
                x = Val(rsa!BemStichwort)
                If x > 0 Then
                    Me!TX_EFAbsender.FontSize = x
                    Me!TX_EFAbsender.top = lgTop
                    Me!TX_EFAbsender.left = lgLeft
                    Me!TX_EFAbsender.Width = lgWidth
                    Me!TX_EFAbsender.Height = lgHeight
                Else
                    Me!TX_EFAbsender = vbNullString
                End If
                Me!LogoAdresse.Visible = False
            Else
                Me!TX_EFAbsender.Visible = False
                Me!LogoAdresse.Visible = True
                Me!LogoAdresse.top = lgTop
                Me!LogoAdresse.Width = 0
                Me!LogoAdresse.left = lgLeft
                Me!LogoAdresse.Width = lgWidth
                Me!LogoAdresse.Height = lgHeight
                Me!LogoAdresse.picture = OH_checkFile(rsa!HL, True)
            End If
        End If
        'Steuerung der Lage der eigenen Adresse
        x = Me!Adresse.top + Me!Adresse.Height
        If x > lgHeight + lgTop Then
            lgHeight = x
        Else
            lgHeight = lgHeight + lgTop
        End If
        If lgLeft = 0 Then
            intLeft = Me!TextEinzelPreis.left - 1 * 567 '(PG 121129)
            intWidth = 17 * 567 - intLeft
            Me!Gruss.Width = intWidth
            Me!TX_EFKlein.Width = intWidth
            Me!Adresse.Width = intWidth
            Me!Gruss.Width = intWidth
            Me!TX_EFName.Width = intWidth
            Me!UnterschriftPic.Width = intWidth
            Me!Mitarbeiter.Width = intWidth
            Me!TX_EFKlein.left = intLeft
            Me!Adresse.left = intLeft
            Me!Gruss.left = intLeft
            Me!TX_EFName.left = intLeft
            Me!UnterschriftPic.left = intLeft
            Me!Mitarbeiter.left = intLeft
        End If
    End If
    rsa.MoveFirst
    rsa.Find "Stichwort='+Empfängeradresse'"
    If Not rsa.EOF Then
        strBS = rsa!BemStichwort
        lgTop = Val(Mid(strBS, InStr(strBS, "oben") + 5, 4)) * 567
        lgLeft = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
        lgWidth = 18 * 567 - lgLeft
        Me!Adresse.Width = lgWidth
        Me!Adresse.left = lgLeft
        Me!Adresse.top = lgTop
        Me!UnterschriftPic.Width = lgWidth
        Me!Mitarbeiter.Width = lgWidth
        Me!UnterschriftPic.left = lgLeft
        Me!Mitarbeiter.left = lgLeft
        Me!TX_EFName.Width = lgWidth
        Me!Gruss.Width = lgWidth
        Me!TX_EFName.left = lgLeft
        Me!Gruss.left = lgLeft
    End If

    rsa.MoveFirst
    strlink = "HLL ='+Logo oben" & Me!LayoutLand & "'"
    '1 suche, ob ein Hyperlink so aufhört  (Beispiel "D" für Deutschland)
    rsa.Find strlink
    If rsa.EOF Then
        strlink = "Stichwort ='+Logo oben'"
        rsa.MoveFirst
        rsa.Find strlink
    End If
    If Not rsa.EOF Then
        strBS = Nz(rsa!BemStichwort, "")
        blLogoAlleSeiten = False
        If InStr(strBS, "Alle Seiten") > 0 Then
            blLogoAlleSeiten = True
            Me!LogoSeiteO.Height = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
        End If
        If InStr(strBS, strArtK) > 0 Then
            If rsa!HL <> "" Then
                Me!LogoSeiteO.picture = OH_checkFile(rsa!HL, True)
                Me!LogoSeiteO.Visible = True
                Me!LogoSeiteO.Width = 0
                Me!LogoSeiteO.left = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
                Me!LogoSeiteO.Width = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
                Me!LogoSeiteO.Height = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
                N = Val(Mid(strBS, InStr(strBS, "oberer Seitenrand") + 18, 4)) * 567
                If N > 0 Then
                    lgtopLogo = N
                End If
            End If
        End If
        Me!TX_EFKlein.Visible = Not InStr(strBS, "Ohne Adresse") > 0
    End If
    If Me!TX_EFKlein.Visible = False Then
        Me!Adresse.top = Me!TX_EFKlein.top
    End If

    rsa.MoveFirst
    strlink = "Stichwort ='+Logo oben Folgeblatt'"
    rsa.Find strlink
    If Not rsa.EOF Then
        strBS = Nz(rsa!BemStichwort, "")
        If InStr(strBS, strArtK) > 0 Then
            If rsa!HL <> "" Then
                Me!LogoSeiteO2.picture = OH_checkFile(rsa!HL, True)
                Me!LogoSeiteO2.Width = 0
                Me!LogoSeiteO2.left = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
                Me!LogoSeiteO2.Width = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
                Me!LogoSeiteO2.Height = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
                N = Val(Mid(strBS, InStr(strBS, "oberer Seitenrand") + 18, 4)) * 567
                lgtopLogo2 = 1
                If N > 0 Then
                    lgtopLogo2 = N
                End If
            End If
        End If
    End If
    rsa.MoveFirst
    strlink = "HLL ='+Logo unten" & Me!LayoutLand & "'"
    '1 suche, ob ein Hyperlink so aufhört  (Beispiel "D" für Deutschland)
    rsa.Find strlink
    If rsa.EOF Then
        strlink = "Stichwort ='+Logo unten'"
        rsa.MoveFirst
        rsa.Find strlink
    End If
    Me!LogoSeiteU.Height = 0
    If rsa.EOF = False Then
        strBS = rsa!BemStichwort
        lgPF = Val(Mid(strBS, InStr(strBS, "pf ") + 3, 4)) * 567
        If InStr(strBS, strArtK) > 0 Then
            If rsa!HL <> "" Then
                lgHeightLogoU = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
                Me!LogoSeiteU.Height = 0
                Me!LogoSeiteU.picture = OH_checkFile(rsa!HL, True)
                Me!LogoSeiteU.Visible = True
                Me!LogoSeiteU.Width = 0
                Me!LogoSeiteU.left = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
                Me!LogoSeiteU.Width = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
               ' MsgBox Me!LogoSeiteU.Width / 567
                Me!LogoSeiteU.Height = lgHeightLogoU
            End If
        End If
    End If
    rsa.MoveFirst
    rsa.Find "Stichwort='+Euro anzeigen'"
    If rsa.EOF = False Then
        blEuro = rsa!BemStichwort = "JA"
    End If
    If Nz(Me!GesamttotalEuro, "") = "" Then
        blEuro = False
    End If
    Select Case strReport
    Case "Brief leer"
        Me!TX_EFAbsender = vbNullString
        Me!TX_EFKlein = vbNullString
        Me!TX_EFName = vbNullString
    End Select
    If blOhnePreise = True Then
        Me!SK4.Visible = False
        Me!SK5.Visible = False
        Me!SK6.Visible = False
        Me.GFA.Visible = False
        Me.GFA1.Visible = False
        Me.gfID.Visible = False
        Me.GFRech.Visible = False
        Me.GFRech1.Visible = False
        Me!TX_EFKlein.Visible = False
        Me!TextEinzelPreis.Visible = False
        Me!TextEPreis.Visible = False
        Me!Rabatt.Visible = False
    End If
    rsa.MoveFirst
    rsa.Find "Stichwort='+FeldSF 1.Seite'"
    If Not rsa.EOF Then
        If rsa!BemStichwort = "Nein" Then
            blFeldSF = True
        End If
    End If
    s = "drucke " & Me.Caption & " auf " & Me.Printer.DeviceName & " mit Kopie " & Me.Printer.Copies & " Fach " & Me.Printer.PaperBin
    SysCmd acSysCmdSetStatus, s
    Select Case Me!Druckvorlage
    Case "Text"
        Me.GKVG.Visible = False
        Me.GFRech.Visible = False
        Me.GFRech1.Visible = False
        Me.gfID.Visible = True
        Me.GFA.Visible = False
        Me.GFA1.Visible = False
        Me.GKAnrede.Visible = True
        Me!VGBrief.Visible = True
        blAnredeVisible = True
        Me!Anrede.Visible = blAnredeVisible
        Me.ghMWStx.Visible = False
        Me.ghPosnr.Visible = False
        Me.Det.Visible = False
        Me.gfMWST.Visible = False
        Me!VGBrief.Visible = True
    Case "Angebot"
        Me.GKAnrede.Visible = True
    Case Else
        Me.GKAnrede.Visible = False
    End Select
    OH_ResetRS rsa
    If Not Me!LogoAdresse.Visible Or Len(Me!LogoAdresse.picture) < 10 Then
        Me.GKID.Height = 0
    End If
    If Me!Adresse.left > Me!TX_EFAbsender.left Then
        Me!FeldDatum.left = Me!Adresse.left
    Else
        Me!FeldDatum.left = Me!TX_EFAbsender.left
    End If
    If Me!LogoAdresse.Visible Then
        Me!FeldDatum.Width = Me!LogoAdresse.Width
        Me!FeldDatum.left = Me!LogoAdresse.left
    End If
    'if me!CountArticles = 1 then
        'me!txtPos.visible = False
        'me!txtEinheit.visible = False
    'else
    'end if
    If InStr(strReport, "Notiz") > 0 Then
        Me.GFRT.Visible = True
        Me.GKID.Visible = True
        Me.GKVG.Visible = True
        Me.Det.Visible = True
        Me.ph.Visible = False
        Me.GKAnrede.Visible = False
        Me.ghMWStx.Visible = False
        Me.ghPosnr.Visible = False
        Me.gfMWST.Visible = False
        Me.GFA.Visible = False
        Me.GFA1.Visible = False
        Me.GFRech1.Visible = False
        Me.GFRech.Visible = False
        Me.gfID.Visible = False
        Me.pf.Visible = False
        Me!VGArt.BackColor = 10092543 'leicht gelb
        Me!VGtext.BackColor = 10092543 'leicht gelb
        Me!VGArt.BorderStyle = 1
        Me!VGtext.BorderStyle = 1
    End If
    If Me.GFA.Visible = True Then '<R11>
        Me.GFA.Visible = Nz(Me!Gesamtpreis, 0) > 0
    End If
    Me!Rabatt.Visible = Me!blRabatt <> 0 And blOhnePreise = False
    OH_ResetRS rsa
    If Len(Me!Barcodetxt) > 1 Then
        OH_setBarCode Me!picBC, Me!Barcodetxt
    End If
    N = Me!Adresse.top + Me!Adresse.Height + 1 * 567
    Me!FAXEmailInfo.top = N
    Me!FeldDatum.top = N
    Me.GKID.Height = N + 1 * 567
    For Each ctl In Me.GKVG.Controls
        If InStr(ctl.Tag, "lblÜberschriften") > 0 Then '250515
            If Me!MoveRecord = -1 Then 'nächste Seite
                ctl.Visible = False
            End If
        End If
    Next ctl

    OH_setRahmenvertrag
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "B_VG: Vorgang drucken"
    Resume ErrEnd
End Sub
Private Sub GFRech_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!GesamttotalEuro.Visible = blEuro 'siehe Eintrag in Stichworten Mandant unter "Euro Unterdrücken"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.GFRech_Format"
    Resume ErrEnd
End Sub
Private Sub Report_Close()
On Error GoTo ErrMsg
    Dim g As String
    t = Me.Caption
    If Nz(Me!Achtung, "") <> "" Then
        MsgBox "ACHTUNG!!!!!!!!!!!!!" & vbNewLine & _
                Me!Achtung, vbInformation, t
    End If
    If OH_Lagerbuchung Then
        SysCmd acSysCmdSetStatus, "Lagerbuchung erfolgt"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2427
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.Report_Close"
    End Select
    Resume ErrEnd
End Sub

'############# Swiss QR-Code ###############
'Standard-Routine zum Erzeugen des QR-Zahlscheins K:\1Firma\SQL\Office Swiss QR-Code
Private Sub OH_CreateQRBillPicture(ByRef QRBillPicture As Object)
On Error GoTo ErrMsg

    Dim objQRBill As Object
    Dim lgLanguage As Long
    Dim strR As String
    Dim strMSG As String
    Dim lgC As Long
    Set objQRBill = CreateObject("STP_OffQRBill.QRBillGenerator") 'late Binding, weil nur ALMATech das braucht
    'Lizenzinformationen
    objQRBill.License.Key = "NETCT7-JC67N2-038AV8-ZE7TTL-T6Z19O-87CMH1-2T6AA9-65ZC13-9I2TWW-6T3OJJ"
    objQRBill.License.Name = "Ingenieurbüro Ohnemus - Developer Edition - 1 Entwickler"

    'Sprache
    Select Case Me!VGSprache
    Case "Italienisch"
        lgLanguage = 3
    Case "Französisch"
        lgLanguage = 1
    Case Else
        lgLanguage = 2
    End Select
    objQRBill.Language = 2

    'Schneideanweisungen
    objQRBill.BoundaryLines = True
    objQRBill.SeparationInstruction = False
    objQRBill.ScissorsSymbol = True

    'Zahlungsempfänger (strukturierter Adresstyp)
    strSQL = "Exec dbo.spa_B_VG " & _
      "@x = 'GetQR_Infos' " & _
      ",@i  = " & Me!NrVG
    OH_r r
    While Not r.EOF
        If r!Art = "Creditor" Then
            With objQRBill.Creditor
                .Account = r!Account
                .Name = r!Name
                .AddressType = 0 'CreditorAddressType_S
                .Street = r!Street
                .HouseNumber = ""
                .PostalCode = r!PostalCode
                .City = r!City
                .Country = r!Country
            End With
        Else
            With objQRBill.Debtor
                .Name = r!Name
                .AddressType = 1 'DebtorAddressType_K
                .AddressLine(0) = r!Street
                .AddressLine(1) = r!PostalCode & " " & r!City
                .Country = r!Country
            End With
        End If
        strMSG = r!UnstructuredMessage
        strR = r!referenz
        lgC = r!PaymentCurrency
        r.MoveNext
    Wend
    objQRBill.Reference.Type = 2 'ReferenceType_QRR = 0  ReferenceType_SCOR = 1, ReferenceType_NON = 2
    objQRBill.Payment.Currency = lgC
    objQRBill.AdditionalInformation.UnstructuredMessage = strMSG
    objQRBill.Reference.number = strR

    '(Endgültiger) Zahlungsempfänger
    'Darf nach aktuellen Vorgaben nicht gesetzt werden
    objQRBill.UltimateCreditor.SameAsCreditor = False

    'Zahlungspflichtiger (unstrukturierter/kompakter Adresstyp)

    objQRBill.Payment.Amount = Me!SumVGTot
    objQRBill.Payment.Currency = 0

    'Zusätzliche Informationen
    'objQRBill.AdditionalInformation.BillInformation = ""

    'Alternative Verfahren
    ' objQRBill.AlternativeSchemes.Parameter(0) = Nz(me!AV1, "")
    ' objQRBill.AlternativeSchemes.Parameter(1) = Nz(me!AV2, "")

    'Offset vom linken Rand,
    'falls links Teile des Empfangsschein abgeschnitten werden
    '(Angabe in Millimeter)
    objQRBill.PrinterOffset = 0

    'Pfad zur temporären Zahlschein-Grafik merken
    mQRBillFile = objQRBill.GetTempQRBillFilePath(False)

    'Zahlschein-Grafik positionieren
    With QRBillPicture
        .Height = 10 * 567
        .picture = mQRBillFile
        .Visible = True
    End With

    Set objQRBill = Nothing

    'temporäre Zahlscheingrafik wieder löschen
    If Dir(mQRBillFile) <> "" Then
        Kill mQRBillFile
    End If

ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2427
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_VG.OH_CreateQRBillPicture"
    End Select
    Resume ErrEnd
End Sub 'OH_CreateQRBillPicture
'###########################################
Private Function OH_setRahmenvertrag()
    Dim lgC As Long
    If Me!Rahmenvertrag = 2 Then
        Me!SK4.Visible = True
        Me!SK6.Visible = False
        Me!bestellt.Visible = True
        Me!TextEPreis.Visible = False
        Me!TextEinzelPreis.Visible = True
        For lgC = 1 To 3
            Select Case lgC
            Case 1
                Set ctl = Me!SK5
            Case 2
                Set ctl = Me!Rabatt
            Case 3
                Set ctl = Me!Rückstand
            End Select
            With ctl
                .Visible = True
                .left = Me!SK4.left + Me!SK4.Width
                .Width = 2 * 567
            End With
        Next lgC
    Else
        Me!bestellt.Visible = False
        Me!Rückstand.Visible = False
    End If
End Function
