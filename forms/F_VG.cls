Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'111104  Rundungsfehler in SumVGTotA_AfterUpdate, AO
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim btFirma As Byte
Dim ctlV As control
Dim strSignatur As String
Dim sgT As Single
Dim strcomtxtFindRS As String
Dim strhelp As String
Dim blS As Boolean
Dim blDirty As Boolean
Dim lgTitelNr As Long
Dim lgPosition As Long
Dim strS As String
Dim lgVGdet As Long
Dim lgLstdet As Long
Dim strFileBearbeitung As String
Dim strPathBearbeitung As String
Dim strFilterExplorer As String
Dim strOB As String 'Die Sortierung in lstVG soll beibehalten werden, wenn 410 bis 493 angewählt wurde
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
MsgBox KeyCode
End Sub
Public Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    i = gllgWidthVG
    If i < 400 Then
        i = 400
    End If
    If i > 480 Then
        i = 480
    End If
    i = i * 56.7  'umstellen von mm auf TWIPS
    Me!RegMain.left = i - Me!RegMain.Width
    Me!regd.left = Me!RegMain.left
    i = Me!RegMain.left - Me!lstMandant.left - 56.7
    Me!lstMandant.Width = i
    Me!comA.Width = i - Me!comAA.Width
    Me!lstA.Width = i
    Me!comFirma.Width = i
    Me!txtFind.Width = i - (5 * 56.7)
    Me!lstDet.Width = Me!lstA.left + i - Me!lstDet.left
    Me!comtxtFind.left = Me!lstA.left + i - Me!comtxtFind.Width
    OH_lstDetColumns 0
    OH_GenerellesPSFarbe
    strSQL = "EXEC spa_QK @x = 'NrQK'"
    OH_A "NrQK", strSQL, Me
    OH_A "lstA", "@u = " & lguser, Me
    OH_A "comA", strSQL, Me
    OH_A "lstTopA", , Me
    OH_A "lstAktiv", , Me
    s = "Auswahl der Vorgänge nach Status"
    Me!lstAktiv.ControlTipText = s
    Me!lstAktiv = 2
    OH_A "comVGAbschluss", , Me
    OH_A "comAA", , Me
    OH_A "comTage", , Me
    OH_A "lstOrder", , Me
    OH_A "lstMandant", , Me
    OH_A "nrQK", , Me
    OH_A "VGPrint", , Me
    OH_A "inclMWST", , Me
    OH_A "lstActBemVG", , Me
    OH_A "comPrint", , Me
    OH_A "comFirma", , Me
    Me!comPrint = Me!comPrint.column(0, 0)
    OH_A "Priority", , Me
    strSQL = "Exec dbo.spa_z VGSprache"
    OH_A "VGSprache", strSQL, Me
    Me!lstMandant = glMandant
    OH_SetFontRT Me!vgbem
    OH_SetFontRT Me!BemVGDet
    With Me!comtxtFind
        strcomtxtFindRS = "A: Sucht in Adressen;" & _
                    "N: Projekt-Nummern;" & _
                    "S: Stichworte;" & _
                    "D0: Vorgangs-Datum;" & _
                    "D1: Datum 1;" & _
                    "D2: Datum 2;" & _
                    "LN: lfd.-Nr.;" & _
                    "FA: Firmenname"
        .RowSource = strcomtxtFindRS
    End With
    With Me.lstDet
        .top = Me.regd.top + 0.55 * 567
        .Height = Me.regd.top + Me.regd.Height - Me!lstDet.top - 10
    End With
    OH_comTage
    s = "Auswahl der Vorgänge nach Datum Zeitraum ab..." & vbNewLine & _
        "Doppel-Klick zum Entfernen des Eintrages"
    Me!datVon.ControlTipText = s
    s = Replace(s, "ab...", "bis...")
    Me!DatBis.ControlTipText = s
    s = "A: Sucht in Adressen" & vbNewLine & _
        "N: Projekt-Nummern" & vbNewLine & _
        "V: Vorgängen" & vbNewLine & _
        "S: Stichworte" & vbNewLine & _
        "D0: Vorgangs -Datum" & vbNewLine & _
        "D1: Datum 1" & vbNewLine & _
        "D2: Datum 2" & vbNewLine & _
        "FA: Firmenname" & vbNewLine & _
        "1, 2 Buchstaben==> suche nach Anfang des Firmennamens" & vbNewLine & _
        "*:Wildcard Datum, Projekt-Nr.,Firma, Person, Titel, Anschrift etc."
    Me!txtFind.ControlTipText = s
    If Val(Nz(Me.OpenArgs, 0)) <> -1 Then
        txtFind_AfterUpdate
        Me!txtFind.SetFocus
        OH_VGCurrent
    End If
    s = "Vorgänge mit den oben eingestellten Bedingungen unten anzeigen." & vbNewLine & _
        "Die wichtigsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen Wert." & vbNewLine & _
        "Doppel-Klick = Liste fix / nicht fix einstellen"
    Me!btntxtFind.ControlTipText = s
    strS = "Exec dbo.spa_VGDet" & _
                " @x = '"
    If glintCursor_in_UF_VGDet = 3 Then
        Me!BemVGDet.TabStop = True
    End If
    If glintCursor_in_UF_VGDet = 1 Then
        Me!EinzelpreisVG.TabStop = False
        Me!BemVGDet.TabStop = False
    End If
    lgTitelNr = 0
    strSQL = strS & "Konto'"
    OH_A "Habenkonto", strSQL, Me
    OH_A "Sollkonto", strSQL, Me
    OH_A "WarengruppeDet", strS & "WarengruppeDet'", Me
   ' OH_A "nrWer", strS & "nrWer'", Me  'Nicht mehr anzeigen HVL
    OH_A "MoveRecord", strS & "MoveRecord'", Me
    OH_Number Me, Me!Position, 100
    OH_Number Me, Me!TitelNr, 100
    OH_Lex Me!LiefereinheitVG, "Liefereinheit", Me
    Me!AnzahlVG.Format = glstrFormatAnzahl
    OH_Lex Me!VGStatus, "Vorgang Status", Me
    OH_ChangeVGdet False
    Me!txtFind.SetFocus
    s = "Interne Bemerkungen zum Vorgang, die aber nicht ausgedruckt werden." & vbNewLine & _
        "Beginnt der Text mit <copy>, werden diese Infos beim Kopieren übernommen." & vbNewLine & _
        "Nutzen Sie hierfür einfach den Button."
    Me!VGInfo.ControlTipText = s
    Me!btnVGInfo.ControlTipText = "Steuern des Kopierverhaltens:" & vbNewLine & s
    OH_A " @x = 'lstVGIDAct'", , Me
    Me!oglstVG = 1
    Me!lstVGIDAct = 503 'Standard-Filter setzen
    lstVGIDAct_AfterUpdate
    Me!LstArtikelAct.Height = 9 * 567
    Me!lstArtikelVorgemerkt.Visible = False
    Me!lstVGIDAct = 0
    lstVGID_AfterUpdate
    Me!lstVGIDAct = 0
    Me!pgB2B.Visible = glB2B
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.Form_Activate"
    Resume ErrEnd
End Sub
Public Function OH_VGCurrent()
On Error GoTo ErrMsg
    Dim strN As String
    Dim strTT As String
    glstrFont = Nz(Me!VGAbteilung.column(2), "")
    If glstrFont = "" Then
        glstrFont = glstrFontA
    End If
    If Me!vgbem.FontName <> glstrFont Then
        Me!vgbem.FontName = glstrFont
    End If
    If Not IsNull(Me!NrVG) Then
        OH_CaptionQK
        regMain_Change
        regD_Change
        If Val(Me!txtHinweis.Tag) <> Me!NrVG Then
            OH_Hinweis ""
        End If
        VGSprache_AfterUpdate
    End If
    strN = left(Me!Firma, 30)
    strN = Replace(Me!Firma, Chr(13) & Chr(10), " ")
    '<R41>, 'Beschriftung des Vorgangs auf Formular F_VG zusätzlich mit Projekt-Nr.','OH/AO','Input HVL'
    Me!pageVorgang.Caption = Me!IDText & " - " & Me!projektNr & " - " & left(strN & Space(30), 25) & " - " & left(Me!VG & Space(30), 25)
    Me.Visible = True
    If Me!VGAbschluss = 0 Then
        Me!btnVGAbschluss1.Enabled = True
        Me!btnVGAbschluss1.Caption = "Vorgang abschliessen"
    Else
        Me!btnVGAbschluss1.Enabled = False
        Me!btnVGAbschluss1.Caption = Me!NrQK & "er ist abgeschlossen!"
    End If
    Me!btnCheckVG.Visible = Me!SollHaben
    blS = Me!VGStatus = glStrStatus
    s = "Status des Vorganges"
    If blS Then
        s = s & vbNewLine & _
            "kann nicht geändert werden, da Status = <" & glStrStatus & ">"""
        Me!pageVorgang.Caption = "GoBD gesperrt!!!! " & Me!pageVorgang.Caption
    End If
    Me!VGStatus.ControlTipText = s
    For Each ctl In Me.Controls 'wegen GoDB (Uli Lips)
        Select Case ctl.ControlType
        Case 109, 111, 106
            Select Case ctl.Name
            Case "Vgdat1", _
                    "VGINFO", _
                    "VGPrint", _
                    "comPrint", _
                    "OutlookVorlage", _
                    "vgdat2D", _
                    "VGSng1", _
                    "VGDat2", _
                    "txtFind", _
                    "comtxtFind", _
                    "countRec", _
                    "comA", _
                    "DatBis", _
                    "DatVon", _
                    "Comtage", _
                    "comAA", _
                    "comStatistikY", _
                    "Kontrakt", _
                    "comVGAbschluss", _
                    "comFirma", _
                    "VGAbschluss"
                ctl.Locked = False
            Case "vgstatus"
                ctl.Locked = blS
                ctl.Enabled = Not blS
            Case Else
                ctl.Locked = blS
            End Select
        Case Else
        End Select
    Next ctl
    Me!btnVGStatus.Enabled = Not blS
    Me!VGDat1D.BackColor = vbWhite
    With Me!UF_txt.Form
        !btnAdd.Enabled = Not blS
        .AllowEdits = Not blS
        !btnDelete.Enabled = Not blS
    End With
    Me!btnCheckVGArtikel.Visible = Nz(Me!WarengruppeDet, "") <> ""
    Me!btnCheckVGArtikel.Enabled = Not blS
    'Versuche, in der Liste lstDet den aktuellen Datensatz zu markieren.
    If glVGFix = False Then
        lgLstdet = Me!NrVG
    End If
    OH_setLst Me!lstDet, lgLstdet
    If Me!VGWarnung = 1 Then
        Me!VGInfo.BackColor = vbRed
        Me.pageVorgang.Caption = "W A R N U N G !!!!!!:" & Me.pageVorgang.Caption
    Else
        Me!VGInfo.BackColor = RGB(255, 255, 204) 'mattes gelb
    End If
    Me!VGWährungA = Me!VGWährung
    Me!btnFirma.Caption = "Firma"
    If Me!NrPerson = Me!NrFirma Then
        Me!btnKunde.Visible = False
        If Me!ArtAdresse <> "Firma" Then
            Me!btnFirma.Caption = "Partner"
        End If
    Else
        Me!btnKunde.Visible = True
    End If
    If Me!Kreditlimitdiff < 0 Then 'opos
        If OH_SetKreditlimit(Me!NrVG) = True Then
            OH_RQf Me!UF_txt.Form
        End If
    End If
    Me!VGStatus.BackColor = Me!VGStatusColor
    Select Case Me!QK
    Case "Lagerabruf"
        s = "B2B"
        strTT = "Öffne Übersicht Lagerabrufe B2B"
        i = 1
    Case Else
        s = "Art"
        strTT = "Öffne Vorgangsart " & Me!NrQK & " " & Me!QK & vbNewLine & "ggf. zum Anpassen der Texte"
        i = 0
    End Select
    With Me!btnVG
        .Caption = s
        .ControlTipText = strTT
        .FontBold = i = 1
    End With

ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.OH_VGCurrent"
    Resume ErrEnd
End Function
Public Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgVGNr As Long
    DoCmd.Hourglass True
    t = "Kontrolle vor Speichern!"
    If Screen.ActiveControl.Name = "Marker" Then
        GoTo ErrEnd
    End If
    If OH_Perm("u", Me, , , Me!NrQK) Then
        GoTo ErrEnd
    End If
    If OH_CheckAbschluss(Me!VGStatus.OldValue) Then
        Cancel = True
        Me.Undo
        OH_RQf Me, Me!NrVG '220915 Input Christina
        GoTo ErrEnd
    End If
    If Me!VGRabatt > 0 And Me!VGRabatt1 > 0 Then
        If Me!RabattArt = Me!RabattArt1 Then
            s = Me!RabattArt & vbNewLine & _
                    "Bitte eine der Rabattarten umbenennen"
            GoTo ErrM
        End If
    End If
    Einleitung_AfterUpdate
    If IsNull(Me!VGAbteilung) Then
        Me!VGAbteilung = 1
        VGAbteilung_AfterUpdate
        GoTo ErrEnd
    End If
    If OH_Validate(Me!NrMitarbeiter, "Mitarbeiter") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If IsNull(Me!VGKurs) Then
        Me!VGKurs = 1
    End If
    If OH_Validate(Me!VG, "Projektname") Then
        Cancel = True
        GoTo ErrEnd
    End If
    If Val(Nz(Me!NrMitarbeiter.column(5), 0)) <> lgUserNrAdr Then
        If Not Me!whoUpdate.OldValue Like Me!whoUpdate Then
            If MsgBox("Ersteller:" & vbTab & vbTab & Me!NrMitarbeiter.column(1) & vbNewLine & _
                      "aktueller User:" & vbTab & strUser & vbNewLine & _
                      "letzte Änderung:" & vbTab & Me!LastUpdate & vbNewLine & _
                      "von:" & vbTab & vbTab & Me!whoUpdate & vbNewLine & vbNewLine & _
                      "Hinweis:" & vbTab & " Sie ändern Daten, für die Sie NICHT als Ersteller" & _
                      " eingetragen sind und die Sie nicht als Letzter geändert haben!!", _
                      vbQuestion + vbOKCancel, _
                      Me!QK & " " & Me!ANr & " " & Me!VG) = vbCancel Then
                Cancel = True
                Me.Undo
                GoTo ErrEnd
            End If
        End If
    End If
    If InStr(Me!Dat1, "Leistung") > 0 Then '190113 Input HVL
        If OH_Validate(Me!VGDat1, Me!Dat1) Then
            Cancel = True
            GoTo ErrEnd
        End If
    End If
    If Len(Me!vgbem) > 4000 Then
        Me!vgbem = left(Me!vgbem, 4000)
        MsgBox "Bemerkungen werden gekürzt auf max 4000 Zeichen!", , "Philipp"
    End If
    If InStr(Me!Sng1, "Pflicht") > 0 Then
        If Nz(Me!VGSng1, 0) = 0 Then
            Me!VGSng1.SetFocus
            s = "Bitte das aktuelle Feld " & Me!Sng1 & " ausfüllen!"
            GoTo ErrM
        End If
    End If
    If Me!NrMitarbeiter = Nz(Me!NrMitarbeiter2, 0) Then
        Me!NrMitarbeiter.SetFocus
        s = "Sie können nicht 2 gleiche Unterschriften setzen!!"
        GoTo ErrM
    End If
    If Me!NrFunktion <> Me!NrFunktion.OldValue Then
        MsgBox Me!NrFunktion & " <> " & Me!NrFunktion.OldValue
    End If
    If Year(Me!VGdatum.OldValue) <> Year(Me!VGdatum) Then
        lgVGNr = OH_GetNr("VGNr", Me!NrQK, Me!VGAbteilung, Me!VGdatum)
        If Me!VGNr <> lgVGNr Then
            s = "Die lfd.-Nr. " & Me!VGNr & "  wurde neu berechnet in ==>" & lgVGNr & vbNewLine & vbNewLine & _
                "JA" & vbTab & "ist ok! " & vbNewLine & _
                "Nein" & vbTab & "alte Nummer belassen!"
            t = "Änderung des Datums"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
            Select Case i
            Case vbYes
                Me!VGNr = lgVGNr
            Case vbCancel
                Cancel = True
                GoTo ErrEnd
            End Select
        End If
    End If

'    If Me!VGAbschluss <> 0 And Me!Dat2 = "bezahlt am" Then
'        if  nz(me!VGDat2,0) = 0 or
'        End If
'    End If
    If DirtyRecord(Me) Then GoTo ErrEnd
    OH_SaveRecord
    regD_Change
    If OH_isloaded("frmProjekt") Then
        Forms!frmProjekt!lstProjektAct = 10
        Forms!frmProjekt.lstProjektAct_AfterUpdate
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2474, 2165 'Steuerelement ausblenden
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.Form_BeforeUpdate"
        Resume ErrEnd
    End Select
ErrM:
    MsgBox s, vbCritical, t
    Cancel = True
    GoTo ErrEnd
End Sub
Private Sub Form_Delete(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
    OH_DeleteRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.Form_Delete"
    Resume Next
End Sub
Public Function OH_refreshVGDet(lgVGdet As Long)
On Error GoTo ErrMsg
    regD_Change
    OH_RQ Me!LstArtikel, lgVGdet
    OH_lstArtikelafterupdate Me!LstArtikel
    If Me!AnzahlVG.Visible Then
        Me!AnzahlVG.SetFocus
    End If
    blDirty = True
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.OH_refreshVGDet"
    Resume Next
End Function
Private Sub btnCheckVG_Click()
On Error GoTo ErrMsg
    DoCmd.openForm "pfrmCheckVG"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.btnCheckVG_Click"
    End Select
    Resume ErrEnd
End Sub

Private Sub btnCheckVGArtikel_Click()
    btnCheckVG_Click
End Sub
Public Sub btnGenerellesPS_Click()
On Error GoTo ErrMsg
    Dim glstrPSOld As String
    glstrPSOld = glstrPS
    OH_GenerellesPS Me
    If Not glstrPSOld Like glstrPS Then
        If Len(glstrPS) = 0 Then
            Me!PS = Null
            Me!btnGenerellesPS.SetFocus
        Else
            Me!PS = glstrPS
            Me!PS.SetFocus
        End If
        OH_SaveRS Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.btnGenerellesPS_Click"
    Resume Next
End Sub
Private Function OH_GenerellesPSFarbe()
On Error GoTo ErrMsg
    If Len(glstrPS) = 0 Then
        Me!btnGenerellesPS.ForeColor = vbBlack
    Else
        Me!btnGenerellesPS.ForeColor = vbBlue
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.OH_GenerellesPSFarbe"
    Resume Next
End Function
Private Sub comA_AfterUpdate()
On Error GoTo ErrMsg
' 121105 AO: inklusiv oder exklusiv (siehe comAA) des hier ausgewählten Vorgangs
    If Me!comA < 1 Then
        OH_A "lsta", "@i = " & Me!comA
    End If
    txtFind_AfterUpdate
    Me!comA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.comA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comA_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    t = "Individuelles Festlegen der Sortierung"
    s = "Festlegen der Sortierung der Vorgangs-Arten-Liste" & vbNewLine & vbNewLine & _
        "JA" & vbTab & "Nummer" & vbNewLine & _
        "NEIN" & vbTab & "Häufigkeit"
    i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
    If i = vbCancel Then
        GoTo ErrEnd
    End If
    OH_A "lstA", "@u = " & lguser & _
                ",@i = " & i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.comA_DblClick"
    Resume ErrEnd
End Sub


Private Sub comAA_AfterUpdate()
On Error GoTo ErrMsg
' 121105 AO: inklusiv oder exklusiv des hier ausgewählten Vorgangs (siehe comA)
    txtFind_AfterUpdate
    Me!comAA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.comAA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ComAnzahlZuord_AfterUpdate()
On Error GoTo ErrMsg
    comKArt_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.ComAnzahlZuord_AfterUpdate"
    Resume Next
End Sub
Private Sub ComAnzahlZuord_Enter()
On Error GoTo ErrMsg
    OH_A "comAnzahlZuord"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.ComAnzahlZuord_Enter"
    Resume Next
End Sub
Private Sub comKArt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Zuordnung zu Kontakt", Nz(Me!comKArt)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.comKArt_DblClick"
    Resume Next
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.countRec_DblClick"
    Resume Next
End Sub
Private Sub inclMWST_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.inclMWST_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstA_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub LstArtikelAct_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstKontaktAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim N As Long
    Dim strA As String
    Dim strB As String
    Dim strf As String
    Dim c As control
    Set c = Me!lstKontaktAct
    Set ctl = Me!lstKontakt
    strA = ctl.column(3) & vbNewLine & _
            vbTab & "ist DIREKT zugeordnet zu" & vbNewLine & _
            Me!pageVorgang.Caption & vbNewLine & _
            vbTab & "als" & vbNewLine & _
            ctl.column(4) & " " & ctl.column(6) & vbNewLine & vbNewLine
    lgid = Nz(ctl.column(0), 0)
    t = c.column(1)
    Select Case c
    Case 20, 35, 40
        If lgid = 0 Then
            s = "Bitte in der Liste rechts einen Datensatz markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case c
    Case 10, 11
        OH_Lex Me!comKArt, "Zuordnung zu Kontakt"
        If strhelp = "" Then
            With Me!comKArt
                .Visible = True
                .SetFocus
                .Dropdown
            End With
        Else
            Me!comKArt = strhelp
            comKArt_AfterUpdate
        End If
    Case 12
        Me!comKArt = "Provision"
        comKArt_AfterUpdate
    Case 13
        Me!comKArt = "Fix-Provision"
        comKArt_AfterUpdate
    Case 20
        OH_OF "F_Adresse", lgid
        Forms!F_Adresse!lstKontakt.SetFocus
    Case 30
    Case 35, 36, 37, 38
        If ctl.column(1) = 0 Then
            Select Case ctl.column(4)
            Case "Partner"
                s = "Zum Ändern bitte links oben Roten Button <ändere Partner> benutzen."
            Case "Mitarbeiter"
                s = "Zum Ändern bitte rechts oben den <Ersteller, MA 1> ändern!"
            End Select
            s = strA & _
                    s
             GoTo ErrM
        End If
        strA = "lfd. Nr. " & ctl.column(2) & ": " & vbNewLine & _
        ctl.column(3) & vbNewLine & ctl.column(4) & vbNewLine & vbNewLine
        t = "Zuordnung ändern " & t
        lgid = Me!NrVG
        OH_A "@x = 'lstKontaktAct'" & _
            ", @i = " & lgid & _
            ", @a = " & c & _
            ", @b = " & ctl.column(1)
        Select Case c
        Case Is <= 36
            c = 36
            OH_r r
            i = r!Anzahl
            If i = 1 Then
                s = strA & _
                    "Es ist nur EIN Datensatz zugeordnet," & vbNewLine & _
                    " Reihenfolge ändern ist deshalb sinnlos!"
                GoTo ErrM
            End If
            s = strA & "Bitte geben Sie eine Zahl zwischen 1 und " & i & " ein!"
            N = Val(InputBox(s, t, 1))
            If N >= 1 And N <= i Then
                strSQL = strSQL & _
                        ", @n = " & N
                OH_EX
                OH_RQ ctl
                SysCmd acSysCmdSetStatus, "Sortierung: neu erstellt"
            Else
                SysCmd acSysCmdSetStatus, "Sortierung: Falsche Werte eingegeben!"
            End If
        Case 37, 38
            If c = 37 Then
                strB = Nz(ctl.column(5))
                strf = "wieviel"
            Else
                strB = Nz(ctl.column(8))
                strf = "Bemerkung"
            End If
            s = "Bitte  <" & strf & ">  eintragen für" & vbNewLine & _
                strA
            s = InputBox(s, t, strB)
            If StrPtr(s) = 0 Then
                GoTo ErrEnd
            End If
            If c = 37 Then
                s = Replace(s, ",", ".")
                If Not IsNumeric(s) Then
                    s = s & " : FALSCHE Eingabe" & vbNewLine & _
                        "Nur Zahlen sind erlaubt!"
                    GoTo ErrM
                End If
            End If
            strSQL = strSQL & _
                    ", @f = '" & s & "'"
            OH_EX
            OH_RQ ctl
        End Select
    Case 40, 41
        If c = 40 Then
            lgid = ctl.column(1)
            If lgid = 0 Then
                s = strA & _
                        "Diese Zuordnung könnnen Sie oben nur ändern, aber nicht löschen"
                MsgBox s, vbExclamation, t
                GoTo ErrEnd
            End If
            strA = ctl.column(2) & " " & ctl.column(3) & vbNewLine & ctl.column(4) & " " & ctl.column(5)
        Else
            strA = Me!pageVorgang.Caption
            lgid = Me!NrVG
        End If
        If MsgBox(strA, vbQuestion + vbOKCancel, t) = vbOK Then
            OH_A "@x = 'lstkontaktact'" & _
                ", @i = " & lgid & _
                ", @a = " & c
            OH_EX
            OH_RQ ctl
        End If
    Case 50 'Checke Provisionen...'
        OH_A "@x = 'lstkontaktact'," & _
            " @a = " & c & _
            ", @i = " & Me!NrVG & _
            ", @m = " & Me!VGID & _
            ", @n = " & Me!VGIDu & _
            ", @b = " & Nz(Me!lstKontakt.column(1), 0)
        OH_r r
        s = "Provisions-Info zu diesem Vorgang" & vbNewLine
        If r.BOF Then
            s = "Keine " & s
            GoTo ErrM
        Else
            While Not r.EOF
                s = s & vbNewLine & _
                    r!Profiteur & " " & r!Provision & " " & r!Prozent & " " & r!woher
            r.MoveNext
            Wend
            MsgBox s, vbInformation, t
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Vorgänge lstKontaktAct_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
End Sub
Private Sub btnLayout_Click()
On Error GoTo ErrMsg
    Dim strL As String
    Dim strLtxt As String
    strL = Me!LandFirma
    OH_A "@x = 'GetLayoutLand'," & _
         "  @i = " & Me!NrVG
    OH_r r
    s = "Aktuell verwendetes Land-Layout:" & vbNewLine & _
              r!txtl & vbNewLine & vbNewLine & _
              "Mögl. Layouts (Logo-Hyperlinks):" & vbNewLine & _
              r!LL & vbNewLine & vbNewLine & _
              "Zum Ändern bitte eine der Möglichkeiten eingeben!"
    strL = InputBox(s, "Layout-Möglichkeiten der Logos", r!txtl)
    If strL = "" Or strL = Nz(r!txtl) Then
        GoTo ErrEnd
    Else
        If Len(strL) > 2 Then
            GoTo ErrEnd
        End If
        If InStr(r!LL, strL) = 0 Then
            GoTo ErrEnd
        End If
        OH_A "@x = 'SetLayoutLand'," & _
             "  @i = " & Me!NrVG & "," & _
             " @f = '" & strL & "'"
        OH_r r
        OH_RQ Me!lstStichwort
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnLayout_Click in Adressen"
    Resume ErrEnd
End Sub
Private Sub btnPF_Tab_Click()
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_VG btnPF_Tab_Click"
    Resume ErrEnd
End Sub
Private Sub COMAnrede_Enter()
    OH_A "comAnrede", "@f = '" & Me!VGSprache & "'"
End Sub
Private Sub comAnschrift_Enter()
On Error GoTo ErrMsg
    OH_A "comAnschrift", _
        "@i = " & Me!NrFunktion & _
        ", @b = " & Me!DuSieVG & _
        ", @d = '" & Me!VGSprache & "'"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comAnschrift_Enter"
    Resume ErrEnd
End Sub
Private Sub comKArt_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgP As Long
    Dim lgA As Long
    If IsNull(Me!comKArt) Then
        Me!comKArt.SetFocus
        Me!comKArt.Dropdown
        GoTo ErrEnd
    End If
    Me!ComAnzahlZuord.Visible = True
    s = Me!VG
    Me!lstKontaktAct.SetFocus
    Select Case Me!comKArt
    Case "Provision", "Fix-Provision"
        t = Me!projektNr & "  " & Me!comKArt & " zuordnen"
        If Me!VGAbschluss <> 0 Then
            s = s & vbNewLine & _
                "Der Vorgang ist bereits abgeschlossen!" & vbNewLine & _
                "Provision dennoch checken bzw. zuordnen??"
            If MsgBox(s, vbOKCancel + vbExclamation, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        OH_A "@x = 'CheckProvision'" & _
            ", @i = " & Me!NrVG & _
            ", @a = " & Me!VGID & _
            ", @b = " & Me!VGIDu
        OH_r r
        If r!Profiteur <> "" Then
            s = "Diese Profiteure sind bereits zugeordnet:" & vbNewLine & _
                r!Profiteur & vbNewLine & vbNewLine & _
                "Möchten Sie weitere zuordnen?"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                OH_RQ Me!lstKontakt
                GoTo ErrEnd
            End If
        End If
        If r!idp = 0 Then
            Me!ComAnzahlZuord.SetFocus
            If Nz(Me!ComAnzahlZuord, 0) = 0 Then
                Me!ComAnzahlZuord.Dropdown
                GoTo ErrEnd
            End If
        Else
            If Nz(Me!ComAnzahlZuord, 0) = 0 Then
                If r!p > 0 Then
                    Me!ComAnzahlZuord = r!p
                End If
            End If
            lgP = r!idp
            lgA = r!IDA
        End If
        Select Case Me!ComAnzahlZuord
        Case 0
            GoTo ErrEnd
        End Select
        s = Me!ComAnzahlZuord & " Prozent Provision " & t
    Case Else
        Me!ComAnzahlZuord = 1
    End Select
    Select Case Val(Me!lstKontaktAct)
    Case 11
        OH_Navigator 31
    Case Else
        OH_Navigator 30
    End Select

    strhelp = Me!comKArt
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comKArt_AfterUpdate in Vorgängen"
    Resume ErrEnd
End Sub
Private Sub btnNavigator_Click()
' OHNEMUS, Samstag, 11. September 2004
' Hinweise :
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_Navigator 40
    With Forms!pf_Navigator
        !btnOK.Visible = True
        !btnQK.Visible = False
        !comQK.Visible = False
        !btnVG.Visible = False
        !ComVG.Visible = False
        !btnLeistung.Visible = False
        !txtFind = Me!Firma
        .txtFind_AfterUpdate
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.btnNavigator_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnPrint_Click()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    OH_SaveRS Me
    If IsNull(Me!comPrint) Then
        Me!comPrint = 101
    End If
    VarAntw = Nz(Me!comPrint.column(1), "Brief")
    OH_tlbPrint 1
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnPrint_Click"
    Resume Next
End Sub
Public Sub comPrint_AfterUpdate()
On Error GoTo ErrMsg
    Dim strO As String
    strO = "OutlookVorlage"
    Select Case left(Me!comPrint.column(1), Len(strO))
    Case strO
        strSQL = "Exec dbo.spa_Adresse " & _
                "@x = '" & strO & "'"
        With Me(strO)
            OH_A strO, strSQL
            If .Visible = False Then
                .Visible = True
                .SetFocus
                .Dropdown
                GoTo ErrEnd
            End If
        End With
    Case Else
        Me!OutlookVorlage.Visible = False
    End Select
    btnPrint_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comPrint_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStichwortGr1_AfterUpdate()
'20180219  StichwortGruppe eingefügt
On Error GoTo ErrMsg
    Dim strGR As String
    strGR = Nz(Me!lstStichwortGr1, "")
    regD_Change
    Me!lstStichwortGr1.SetFocus
    Me!lstStichwortGr1 = strGR
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStichwortGr1_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub MoveRecord_DblClick(Cancel As Integer)
    If Nz(Me!MoveRecord, 1) <> 0 Then
        Me!MoveRecord = 0
        OH_ChangeVGdet
    End If
End Sub

Private Sub MWSt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!VGAbschluss = 0 Then
        If Me!MWSt = 0 Then
            OH_A " @x = 'CheckMWST' " & _
                ", @i = " & Me!NrVG, , Me
            OH_r r
            Me!MWSt = Nz(r!LandMWSt, 1)
        Else
            Me!MWSt = 0
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "MWSt_DblClick"
    Resume ErrEnd
End Sub

Private Sub MWSTDet_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!VGAbschluss = 0 Then
        OH_A " @x = 'CheckMWST1' " & _
            ", @i = " & Me!NrVG, , Me
        OH_r r
        Me!MWSTDet = r!MWSt1
        OH_ChangeVGdet
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "MWSTDet_DblClick"
    Resume ErrEnd
End Sub
Private Sub OutlookVorlage_AfterUpdate()
On Error GoTo ErrMsg
    btnPrint_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OutlookVorlage"
    Resume ErrEnd
End Sub
Private Sub btnPriority_Click()
On Error GoTo ErrMsg
    'OH071222
    Me!Priority.SetFocus
    Me!Priority.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnPriority_Click"
    Resume Next
End Sub

Private Sub btnPS_Click()
On Error GoTo ErrMsg
    Me!PS.SetFocus
    Me!PS.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume Next
End Sub

Private Sub BetragKasse_AfterUpdate()
On Error GoTo ErrMsg
    Me!VGRabatt = 0
    Me!MWSt = 0
    WährungKasse_AfterUpdate
    OH_reCalculate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnAnrede_Click()
On Error GoTo ErrMsg
    Dim strHilfe As String
    s = "Adressen-Arten-Tabelle öffnen?"
    strHilfe = "T_ArtAdresse ist eine Tabelle, in der die Adressenarten wie Herr oder Frau definiert sind!"
    x = OH_msgbox(s, Array("nur anschauen", "Zum Bearbeiten", "Nein"), _
                vbQuestion, _
                s, _
                strHilfe)
    Select Case Val(x)
    Case 1
        x = acReadOnly
    Case 2
        x = acEdit
    Case Else
        Exit Sub
    End Select
    DoCmd.OpenTable "T_ArtAdresse", acViewNormal, x
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, s
    Resume ErrEnd
End Sub

Private Sub btncomAnschrift_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Anschrift"
    comAnschrift_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnEinleitung_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Einleitung"
    Einleitung_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnTelefon_Click()
On Error GoTo ErrMsg
    OH_SaveRS Me
    If IsNull(Me!Telefon) = True Then
        If MsgBox(Me!NamePerson & " hat noch keine Telefon-Nummer hinterlegt!" & vbNewLine & _
                "Adresse öffnen, um Nummer zu erfassen?", vbYesNo + vbQuestion, "Anrufen") = vbYes Then
            btnKunde_Click
            Forms!F_Adresse!Telefon.SetFocus
        End If
    Else
        OH_DialTelefon Me!NrFunktion, Me!Telefon, Me!NamePerson
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnVGSprache_Click()
On Error GoTo ErrMsg
    OH_OF "F_Language"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, s
    Resume ErrEnd
End Sub
Private Sub COMAnrede_AfterUpdate()
On Error GoTo ErrMsg
    Dim strAnrede As String
    strAnrede = Nz(Me!comAnrede.column(1), "")
    Select Case Len(strAnrede)
    Case Is > 25
        Me!VGAnrede = strAnrede
    End Select
    If InStr(strAnrede, " ") > 0 Then
        Me!VGAnrede = strAnrede & " " & Trim(Me!Titel & " " & Me!Nachname)
    Else
        Me!VGAnrede = strAnrede & " " & Me!Vorname
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "COMAnrede_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comStText_Enter()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    OH_A "comsttext", _
        "@f = " & Me!NrQK & _
        ",@b = " & Nz(Me!lstActBemVG, 49)
    t = "Standardtexte im Lexikon"
    i = Me!comStText.ListCount
    If i = 0 And Me!lstActBemVG = 49 Then
        s = "für die Vorgangsart < " & Me!NrQK & " > sind noch keine Standard-Texte hinterlegt." & vbNewLine & vbNewLine & _
            "Lexikon hierzu öffnen?"
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
            OH_Openlexikon "Standardtext"
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comStText_Enter"
    Resume ErrEnd
End Sub
Private Sub comVGBem_Enter()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    OH_A "comVGBem", _
        "@a = " & Me!NrQK & _
        ",@b = " & Nz(Me!lstActBemVG, 41)
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGBem_Enter"
    Resume ErrEnd
End Sub

Private Sub lstLeistung_Click()
On Error GoTo ErrMsg
    'Artikel öffnen und den Artikel mit der markierten Leistung anzeigen
    Me.PageArtikelMain.SetFocus '171030 EO
   ' OH_FB SF, "Position= " & Nz(Me!LstLeistung.column(1), 1)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstLeistung_Click"
    Resume ErrEnd
End Sub
Private Sub lstLeistungAct_AfterUpdate() '<R5> 181115 EO Leistungen löschen von Vorgängen aus
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgact As Long
    Dim strLeistung As String
    lgid = Nz(Me!LstLeistung, 0)
    t = Me!lstLeistungAct.column(1)
    lgact = Nz(Me!lstLeistungAct, 0)
    strLeistung = Nz(Me!LstLeistung.column(5), "")
    Select Case lgact
    Case 10
        Me.RegMain = 2
        Me!LstArtikelAct = 90
        lstArtikelAct_AfterUpdate
    Case 20, 21, 30
        If lgid = 0 Or strLeistung = "" Then
            s = "bitte in der Liste rechts die entspr. Leistung markieren!"
            GoTo ErrM
        End If
        Select Case lgact
        Case 20
            s = strLeistung & vbNewLine & vbNewLine & _
                    "Bitte Anzahl in <" & Me!LstLeistung.column(3) & "> eingeben" & vbNewLine & _
                    "und anschliessend Datum etc. anpassen"
            s = InputBox(s, t)
            If s = "" Or Not IsNumeric(s) Then
                GoTo ErrEnd
            End If
            s = Replace(s, ",", ".")
            strlink = "NrLeistung = " & lgid
            lgid = OH_CopyRS("T_Leistung", strlink, "AnzahlLeistung", s, True, True)
            OH_RQ Me!LstLeistung, lgid
        Case 21
            s = strLeistung & vbNewLine & vbNewLine & _
                    "Soll die markierte Leistung wirklich gelöscht werden?"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
                OH_A "@x = 'lstLeistungAct'" & _
                        ",@a = " & lgact & _
                        ",@i = " & lgid
                OH_EX
                OH_RQ Me!LstLeistung
            End If
            GoTo ErrEnd
        End Select
        LstLeistung_DblClick (0)
    Case 40
        i = Me!LstLeistung.ListCount - 1
        If i > 0 Then
            lgid = Me!LstLeistung.column(0, i)
        End If
        If lgid = 0 Then
            s = "Da gibt's wohl nix zu verrechnen!"
            GoTo ErrM
        End If
        OH_OF "F_Leistung", lgid
        With Forms!F_Leistung
            !lstD.SetFocus
            !lstD = lgid
            !DatumTag.SetFocus
            If !NrLeistung = lgid Then 'prüfe, ob die übergebene und gefilterte Leistung übereinstimmt!
                .OH_ErstelleRechnung
            Else
                s = "Die Leistung " & lgid & " entspricht NICHT den Filterbedingungen!"
                GoTo ErrM
            End If
        End With
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstLeistungAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub lstTopAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_A "lsttop", _
        " @a = " & Nz(Me!lstTopAct, 0) & _
        ", @u = " & lguser
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstTopAct_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub NrMitarbeiter_DblClick(Cancel As Integer)
    OH_tlbFilterField
End Sub
Private Sub PS_Enter()
On Error GoTo ErrMsg
    OH_A "PS"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "PS_Enter"
    Resume ErrEnd
End Sub
Private Sub lstActBemVG_AfterUpdate()
On Error GoTo ErrMsg
    Dim strbegriff As String
    Dim strhelp As String
    Dim strQ As String
    Dim strT As String
    Dim strA(1 To 3) As String
    If OH_CheckAbschluss Then
        GoTo ErrEnd
    End If
    DoCmd.Hourglass True
    strT = Me!lstActBemVG.column(1)
    OH_A "@x = 'lstActBemVG'" & _
        ",@i = " & Me!NrVG & _
        ",@a = " & Me!lstActBemVG & _
        ",@f = " & Me!NrQK
    strQ = strSQL
    If OH_Perm("U", Me, "VG") Then
        GoTo ErrEnd
    End If
    OH_SaveRS Me
    Select Case Me!lstActBemVG
    Case 10 'Zoomen, Editieren'
        OH_RT Me!vgbem
    Case 20 'Kopie in Zwischenablage'
        Me!vgbem.SetFocus
        OH_CB Nz(Me!vgbem, "")
        Beep
    Case 30 'Lösche Bemerkungen' <R162>
        strT = strT & " (Sie sehen unten die ersten 50 Zeichen...)"
        s = Nz(Me!vgbem, "")
        If s <> "" Then
            OH_CB s
            s = left(Application.PlainText(s), 50)
            s = s & vbNewLine & vbNewLine & _
                "Bemerkungen löschen?" & vbNewLine & _
                "(steht aber in der Zwischenablage weiter zur Verfügung!"
            If MsgBox(s, vbQuestion + vbOKCancel, strT) = vbOK Then
                OH_EX strQ
                OH_RQf Me
            End If
        Else
            SysCmd acSysCmdSetStatus, "Letzte Aktion: Hier gibt's nix zu löschen!"
        End If
        Me!vgbem.SetFocus
    Case 40, 41 'Kopiere aus Vorgängen / Kopiere aus Vorgängen pro Vorgangs-Art'
        Me!comVGBem.Visible = True
        Me!comVGBem.SetFocus
        Me!comVGBem.Dropdown
    Case 49, 50 'Kopiere aus Standards pro Vorgangs-Art 50 'Kopiere aus Standards'
        Me!comStText.Visible = True
        Me!comStText.SetFocus
        Me!comStText.Dropdown
    Case 51 'Zwischenablage einfügen'
        OH_CBget Me!vgbem
    Case 60 'Standards bearbeiten'
        OH_Openlexikon "StandardText", , , "VGBem"
    Case 70 'Standard-Font verwenden'
        OH_setRTFont Me, Me!vgbem
    Case 80 'als Standard ablegen...'
        OH_SaveRS Me
        s = OH_RPL(Me!vgbem)
        i = Len(s)
        If i < 5 Then
            s = "Als Standard werden nur Einträge abgelegt, die mindestens 5 Zeichen haben!" & vbNewLine & vbNewLine & _
                "In Ihrem Bemerkungsfeld sind " & i & " Zeichen!"
            Me!vgbem.BackColor = vbRed
            GoTo ErrM
        End If
        OH_r r, strQ
        If r!Exists = 1 Then
            s = s & vbNewLine & vbNewLine & _
                "bereits erfasst!"
            GoTo ErrM
        Else
            strbegriff = "Bitte hier einen <griffigen> Namen für diesen Standard eingeben!"
            s = Application.PlainText(Me!vgbem)
nochmal:
            strA(1) = "Nur für die aktuelle Vorgangsart " & Me!NrQK
            strA(2) = "genereller Standard-Text"
            strA(3) = "Lexikon öffnen"
            strhelp = "der Text wird im Lexikon unter Standardtext abgelegt; im Feld <Fieldnamen> werden die Vorgangsarten definiert,"
            OH_msgbox s, Array(strA(1), strA(2), strA(3)), vbQuestion, strT, strhelp, strbegriff
            Select Case strMSG(2)
            Case strA(1)
                strA(1) = Me!NrQK
            Case strA(2)
                strA(1) = ""
            Case strA(3)
                OH_Openlexikon "Standardtext"
                GoTo ErrEnd
             Case strbegriff
                s = s & vbNewLine & vbNewLine & strbegriff
                GoTo nochmal:
            Case Else
                GoTo ErrEnd
            End Select
            Select Case strMSG(3)
            Case strbegriff
                s = s & vbNewLine & vbNewLine & strbegriff
                GoTo nochmal:
            Case ""
                GoTo ErrEnd
            End Select
            s = Trim(Replace(OH_RPL(strMSG(3)), strbegriff, ""))
            strSQL = strQ & _
                ", @d  = '" & s & _
                "',@s1 = '" & strA(1) & "'"
            OH_EX
        End If
    Case 90 'Neue Seite EIN / AUS'
        OH_A "@x = 'lstActBemVG', " & _
            " @i = " & Me!NrVG & _
            ",@a = " & Me!lstActBemVG
        OH_EX
        OH_RQf Me
    Case 310 'Kurz-Übersicht mit Bemerkungen'
        Me!lstVGIDAct = 310
        lgPosition = Me.regd
        lstVGIDAct_AfterUpdate
        Me.regd = lgPosition
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, strT
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, strT & " Aktionen mit den Bemerkungen"
    Me!vgbem.BackColor = vbWhite
    GoTo ErrEnd
End Sub
Private Sub lstEdit_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstEditAct = 20
    lstEditAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstEdit_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstEditAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strf As String
    Dim strC As String
    Dim strBem As String
    Dim strFile As String
    Dim strPath As String
    Dim lgct As Long
    Dim lgC As Long
    Dim lgid As Long
    Dim strT As String
    Dim strTitel As String
    Dim wrk As Excel.Workbook
    Dim ws As Excel.Worksheet
    Dim xComment As Excel.Comment
    Dim rg As Excel.Range
    Dim N As Long
    Dim Y As Long
    Dim z As Long
    Dim lgGreen As Long
    Dim lgred As Long
    Dim strX(1 To 2, 0 To 10) As String
    lgid = Nz(Me!lstEdit, 0)
    strT = Nz(Me!lstEdit.column(1), "")

    If lgid = 0 Then
        GoTo ErrEnd
    End If
    strTitel = Nz(Me!lstEditAct.column(1), "")
    DoCmd.Hourglass True
    Select Case Me!lstEditAct
    Case 20 'Liste in Excel bearbeiten'
        lgct = OH_InsertID_LST(Me!lstDet) + 1
        For i = 3 To 5
            strSQL = "Exec dbo.spA_Filter " & _
                    " @x ='lstedit', " & _
                    " @a = " & i & ", " & _
                    " @i = " & lgid
            Select Case i
            Case 3
                OH_r r
                If r.BOF Then
                    s = "im Lexikon fehlt der Eintrag <Ablage der Bearbeitungslisten>"
                    GoTo ErrM
                End If
                strPathBearbeitung = r!PathBearbeitung
                If Len(Dir(strPathBearbeitung, vbDirectory)) = 0 Then
                    s = strPathBearbeitung & vbNewLine & _
                        "im Lexikon stimmt der Eintrag <Ablage der Bearbeitungslisten> NICHT!"
                    GoTo ErrM
                End If
            Case 4
                OH_r r
                strBem = r!Bem
            End Select
        Next i
        Set wrk = OH_EXCEL(strSQL, strT, strPathBearbeitung)
        If wrk Is Nothing Then
            GoTo ErrEnd
        End If
        Set ws = wrk.Sheets(1)
        i = 1
        strT = ws.cells(1, i)
        While strT <> ""
            Set rg = ws.Range(ws.cells(2, i), ws.cells(lgct, i))
            If left(strT, 2) = "x_" Then
                rg.Locked = False
                rg.Interior.Color = vbWhite
                If left(ws.cells(1, i + 1), 2) <> "X_" Then
                    s = "Nur WEISSE Felder, die nach der Änderung farbig gekennzeichnet werden (aber NICHT ROT oder GRÜN), werden akzeptiert."
                    Set xComment = ws.cells(1, i).AddComment(s)
                    xComment.Visible = True
                    xComment.Shape.TextFrame.AutoSize = True
                End If
            Else
                rg.Locked = True
                rg.Interior.ColorIndex = 15
            End If
            i = i + 1
            strT = ws.cells(1, i)
            rg.Borders(xlEdgeLeft).LineStyle = xlContinuous
            rg.Borders(xlEdgeTop).LineStyle = xlContinuous
            rg.Borders(xlEdgeBottom).LineStyle = xlContinuous
            rg.Borders(xlEdgeRight).LineStyle = xlContinuous
            rg.Borders(xlInsideVertical).LineStyle = xlContinuous
            rg.Borders(xlInsideHorizontal).LineStyle = xlContinuous
        Wend
        ws.cells(1, i + 2) = strBem
        s = "F" & lgid
        Set xComment = ws.cells(1, 1).AddComment(s)
        xComment.Visible = False
        ws.Protect , , , , , True, True, False, False, False, False, False, True, True, True, False
        wrk.Protect

        wrk.Save
        strFileBearbeitung = wrk.FullName
        'AppActivate wrk.Application
    Case 21 'bearbeitete Liste einlesen'
        strFile = strFileBearbeitung
        If strFile <> "" Then
            strPath = OH_GetPathPart(strFile)
        End If
        If strPath = "" Then
            strPath = strPathBearbeitung
        End If
        i = vbNo
        If Len(Dir(strFile)) > 0 And strFile <> "" Then
            s = "JA" & vbTab & strFile & vbNewLine & _
                "NEIN" & vbTab & "anderes File..."
            i = MsgBox(s, vbYesNoCancel + vbQuestion, strTitel)
            If i = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        If i = vbNo Then
            Set fd = Application.FileDialog(msoFileDialogFilePicker)
            With fd
                .Title = strTitel
                .AllowMultiSelect = False
                .ButtonName = "Bearbeitungsfile auswählen u. öffnen"
                .filters.Clear
                .filters.Add "Excel-Dateien", "*.xl*"
                .FilterIndex = 2
                .InitialFileName = strPath
                If strFile <> "" Then
                   ' .InitialFileName = strfile
                End If
                .Show
            End With
            If fd.SelectedItems.count > 0 Then
                strFile = fd.SelectedItems(1)
                strFileBearbeitung = strFile
            Else
                GoTo ErrEnd
            End If
        End If
        If OH_InitializeEXCEL = False Then
            GoTo ErrEnd
        End If
        Set wrk = OH_CheckEXCELFile(strFile, True)
        If wrk Is Nothing Then
            GoTo ErrEnd
        End If
        Set ws = wrk.Sheets(1)
        'steht in A1 als Kommentar die NrFilter (erster Buchstabe ein "F")
        s = ""
        If Not ws.cells(1, 1).Comment Is Nothing Then
            s = ws.cells(1, 1).Comment.Text
        End If
        lgid = Val(Mid(s, 2))
        If left(s, 1) <> "F" Or lgid = 0 Then
            GoTo errm1
        End If
        Select Case left(ws.cells(1, 1), 2)
        Case "Nr", "ID"
        Case Else
            GoTo errm1
        End Select
        strSQL = "Exec dbo.spA_Filter " & _
                " @x ='lstedit' " & _
                ", @a = 5 " & _
                ", @i = " & lgid
        OH_r r
        For i = 0 To r.Fields.count - 1
            If ws.cells(1, i + 1) <> r.Fields(i).Name Then
                GoTo errm1
            End If
        Next i
        lgC = i
        appEXCEL.Visible = True
        N = ws.UsedRange.Rows.count
        If N < 2 Then
            s = "Keine Daten vorhanden"
            GoTo ErrM
        End If
        wrk.UnProtect
        ws.UnProtect
        For i = 2 To N
            For Y = 1 To lgC
                If Y = 1 Then
                    lgid = ws.cells(i, 1)
                End If
                Set rg = ws.cells(i, Y)
                s = ws.cells(1, Y)
                If left(s, 2) = "x_" Then
                    Select Case rg.Interior.Color
                    Case vbWhite, vbRed, vbGreen
                    Case Else
                        z = z + 1
                        strSQL = "Execute spa_Filter " & _
                                " @x = 'Update'" & _
                                ", @i = " & lgid & _
                                ", @d = '" & rg.Value & _
                                "', @f = '" & s & _
                                "', @o = '" & ws.cells(1, 1) & "'"
                        OH_r r
                        If r!ID = 1 Then
                             rg.Interior.Color = vbGreen
                             lgGreen = lgGreen + 1
                        Else
                            rg.Interior.Color = vbRed
                             lgred = lgred + 1
                        End If
                    End Select
                End If
            Next Y
        Next i
        Select Case z
        Case 0
            s = "Im EXCEL-File ist keine Änderung zu finden; alle zutreffenden Felder haben die Farbe weiss, rot oder grün!" & vbNewLine & vbNewLine & _
                "soll das EXCEL-File geschlossen werden?"
            If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                wrk.Close
                appEXCEL.Quit
                Set appEXCEL = Nothing
            End If
            GoTo ErrEnd
        End Select
        s = "Info zur Datenübernahme aus EXCEL" & vbNewLine & vbNewLine & _
            z & vbTab & "geprüfte Zellen" & vbNewLine & _
            lgGreen & vbTab & "Grün eingefärbt = Gespeichert" & vbNewLine & _
            lgred & vbTab & "Rot eingefärbt = NICHT Gespeichert"
        MsgBox s, vbInformation, strTitel
        OH_RQf Me
    Case 22
        strSQL = "Exec dbo.spA_Filter " & _
                " @x ='lstedit', " & _
                " @a = 3"
        OH_r r
        If r.BOF Then
            s = "im Lexikon fehlt der Eintrag <Ablage der Bearbeitungslisten>"
            GoTo ErrM
        End If
        strPathBearbeitung = r!PathBearbeitung
        OH_LaunchFolder 1, strPathBearbeitung
    Case 23 'so geht''s...'
        strSQL = "Exec dbo.spA_Filter " & _
                " @x ='lstedit'" & _
                ", @a = 22"
        OH_r r
        s = r!Msg
        MsgBox s, vbInformation, strTitel
    End Select
ErrEnd:
DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, strTitel
    If Not appEXCEL Is Nothing Then
        appEXCEL.Quit
        Set appEXCEL = Nothing
    End If
    GoTo ErrEnd
errm1:
    s = strFile & vbNewLine & vbNewLine & _
     "Dieses File ist nicht geeignet zum Einlesen!" & vbNewLine & _
    "In A1 muss eine ID stehen (Überschrift = Nr...) " & vbNewLine & _
    "In A1 muss ein Kommentar mit <F> gefolgt von der NrFilter vorhanden sein" & vbNewLine & _
    "In der Reihe 1 dürfen die Überschrifetn NICHT verändert werden" & vbNewLine & vbNewLine & _
    "Sie müssen zuerst ein File auslesen!" & vbNewLine & vbNewLine & _
    "Nutzen Sie <Liste in Excel bearbeiten>"
    GoTo ErrM
End Sub

Private Sub lstOrder_AfterUpdate()
    Me!lstVGIDAct = 400 + Me!lstOrder
    lstA_AfterUpdate
    Me!lstOrder.SetFocus
End Sub

Private Sub Einleitung_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!Einleitung
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Einleitung_Enter"
    Resume ErrEnd
End Sub
Private Sub Einleitung_AfterUpdate()
On Error GoTo ErrMsg
    If Not IsNull(Me!Einleitung) Then
        OH_Einleitung Me!VGdatum
        OH_Einleitung Me!VGDat1
        OH_Einleitung Me!VGDat2
        Me!Einleitung = OH_ReplaceTxt(Me!Einleitung)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Einleitung_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comAnschrift_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "ComAnschrift", "Anschrift"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub DuSieVG_AfterUpdate()
On Error GoTo ErrMsg
    comAnschrift_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "DuSieVG_AfterUpdate, Ändern der Anrede Du oder Sie"
    Resume ErrEnd
End Sub
Private Sub lstAktiv_AfterUpdate()
On Error GoTo ErrMsg
    lstA_AfterUpdate
    Me!lstAktiv.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstAktiv_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub comVGAbschluss_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!comVGAbschluss.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.comVGAbschluss_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub comVGAbschluss_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Select Case Me!comVGAbschluss
    Case -1
        Me!comVGAbschluss = 1
    Case 0
        Me!comVGAbschluss = 2
    Case 1
        Me!comVGAbschluss = 0
    Case 2
        Me!comVGAbschluss = -1
    End Select
    comVGAbschluss_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.comVGAbschluss_DblClick"
    End Select
    Resume ErrEnd
End Sub

Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Select Case Me!lstMdo
    Case 1, 2, 3
    Case Else
        Me!lstMdoVg = 0
    End Select
    s = ""
    t = "Markieren von Datensätzen"
    Select Case Me!lstMdo
    Case 1
        If Me!lstMdoVg = 1 Then
            strSQL = "spI_Marker 'Funktion'," & Me!NrFunktion & ",'A'"
            OH_EX
            s = Me!NamePerson & ": Ansprechpartner wurde markiert!"
        Else
            OH_MarkerYesOne Me
        End If
    Case 2
        If Me!lstMdoVg = 1 Then
            OH_InsertID_LST Me!lstDet
            strSQL = "spI_Marker @art = 'W'"
            OH_EX
            strSQL = "spI_Marker 'Funktion','','I'"
            OH_EX
            s = "Alle Ansprechpartner der links gefilterten Vorgänge wurden markiert!"
        Else
            OH_MarkerYes Me
        End If
    Case 3
        If Me!lstMdoVg = 1 Then
            OH_InsertID_LST Me!lstDet, True
            strSQL = "spI_Marker @art = 'W'"
            OH_EX
            strSQL = "spI_Marker 'Funktion','','I'"
            OH_EX
            s = "Alle Ansprechpartner der links markierten Vorgänge wurden markiert!"
        Else
            OH_MarkerYesSelected Me
        End If
    Case 5
        OH_MarkerNoOne Me
    Case 6
        OH_MarkerNo Me
    Case 9, 10, 11
        OH_DeleteRS Me, Me!lstMdo
        s = ""
    End Select
    If s <> "" Then
        s = s & vbNewLine & vbNewLine & "Sollen die markierten, aktuellen Adressen jetzt angezeigt werden?"
        If MsgBox(s, vbYesNo + vbQuestion, t) = vbYes Then
            OH_OF "F_Adresse", Me!NrFunktion
            Forms!F_Adresse!lstM.SetFocus
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstTop, 0)
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    Select Case Err.number
    Case 2115
        SysCmd acSysCmdSetStatus, s
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstTop_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub lstTop_dblclick(Cancel As Integer)
    OH_MarkerYesOne Me
End Sub

Private Sub lstTopA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstTopA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstTopA_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstMandant_AfterUpdate()
On Error GoTo ErrMsg
    glMandant = Me!lstMandant
    txtFind_AfterUpdate
    Me!lstMandant.SetFocus
    Forms!Menu!lstMandant = Me!lstMandant
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstMandant_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comFirma_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.comFirma_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comFirma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!comFirma = 0
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.comFirma_DblClick"
    Resume ErrEnd
End Sub

Private Sub comFirma_GotFocus()
On Error GoTo ErrMsg
    With Me!comFirma
        If .Value = 0 Then
           .Value = Null
            .Dropdown
        End If
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.comFirma_GotFocus"
    Resume ErrEnd
End Sub
Private Sub LstArtikeld_DblClick(Cancel As Integer)
    Me.RegMain = 2
End Sub
Public Sub lstArtikeld_afterupdate()
On Error GoTo ErrMsg
    Dim lgA As Long
    lgA = Nz(Me!LstArtikeld, 0)
    If lgA = 0 Then
        GoTo ErrEnd
    End If
    Me!LstArtikel = lgA
    Me!LstArtikeld = lgA
    OH_lstArtikelafterupdate Me!LstArtikeld
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
Public Function OH_lstArtikelafterupdate(ctlLst As control)
On Error GoTo ErrMsg
    Dim strN As String
    Dim blV As Boolean
    Dim lgHeight As Long
    t = "Actions mit Artikeln"
    If strS = "" Then
        s = "bitte Vorgang schliessen und nochmal öffnen"
        GoTo ErrM
    End If
    If Me!btnVGDetSave.Enabled Then
        btnVGDetSave_Click
    End If
    lgVGdet = Nz(ctlLst.column(0), 0)
    If lgVGdet = 0 Then
        blV = False
        Me!nrVGDet = 0
    Else
        strSQL = strS & "ID',@i = " & lgVGdet
        OH_r r
        blV = Not r.BOF
    End If
    If blV Then
        For i = 0 To r.Fields.count - 1
            strN = r.Fields(i).Name
            Select Case strN
            Case "Temphelp", "PrintMarkerVGdet", "MarkerVGdet", "NrWer", "VGDetProzent"
            Case "NrVG"
                Me!IdVG = r.Fields(i).Value
            Case "Whoupdate"
                Me!WhoUpdateDet = r.Fields(i).Value
            Case "Lastupdate"
                Me!LastUpdateDet = r.Fields(i).Value
            Case Else
                Me(strN).Visible = True
                Me(strN) = r.Fields(i).Value
            End Select
        Next i
    End If
    If blV = False Then
        s = "<div align=center><font size=4 color=red>Diesem Vorgang sind (noch) KEINE Artikel zugeordnet!</font></div>"
        With Me!BemVGDet
            .SetFocus
            .Value = s
            .Locked = True
        End With
        Me!btnArtikelAdd.Width = Me!LstArtikelAct.Width
        lgHeight = 25
    Else
        ctlLst.Visible = True
        ctlLst.SetFocus
        Me!BemVGDet.Locked = False
        Me!btnArtikelAdd.Width = btnArtikelCopy.left - Me!LstArtikelAct.left - 100
        lgHeight = 90
        If Me!lstArtikelVorgemerkt.Visible Then
            lgHeight = 55
        End If
   End If
    strSQL = strS & "lstArtikelact'" & _
            ",@i = " & lgVGdet & _
            ",@f = '" & Format(blS, 0) & _
            "',@b = " & Nz(Me!NrQK, 0)
    OH_A "lstArtikelact", strSQL, Me
    For Each ctl In Me.PageArtikelMain.Controls
        Select Case left(ctl.Tag, 5)
        Case "VGDET"
            ctl.Visible = blV
        End Select
    Next ctl
    Me!btnVGDetSave.ControlTipText = "Speichern Pos. " & ctlLst.column(2)
    Me!LstArtikelAct.Height = lgHeight * 56.7
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstArtikel_afterupdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Sub lstArtikel_afterupdate()
On Error GoTo ErrMsg
    Select Case Me!LstArtikelAct
    Case 32, 40
    Case Else
        OH_lstArtikelafterupdate Me!LstArtikel
        Select Case Me.regd
        Case 5
            Me!LstArtikeld = Me!LstArtikel
        Case 6
           regD_Change
        End Select
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
Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!LstArtikel, 0)
    t = Me!LstArtikelAct.column(1)
    If lgid = 0 Then
        GoTo ErrEnd
    End If
    If Me!RegMain <> 2 Then
        Me!RegMain = 2
        GoTo ErrEnd
    End If
    Select Case Me!LstArtikelAct
    Case 32
         lstArtikelAct_AfterUpdate
         Me!LstArtikel = lgid
         GoTo ErrEnd
    Case 40
        Select Case Nz(Me!LstArtikel)
        Case -2
            s = "Unten können Sie eine Preisliste doppelklicken==>" & vbNewLine & _
                    "Ihre DB übernimmt die Preise aus der Liste, falls übereinstimmende Artikel vorhanden sind" & vbNewLine & _
                    "(Der Vorgang darf noch nicht abgeschlossen sein)!" & vbNewLine & vbNewLine & _
                    "Die Kennzeichnung mit x bedeuted:" & vbNewLine & _
                     "xx" & vbTab & "wird bereits im aktuellen Vorgang angewendet" & vbNewLine & _
                     "x" & vbTab & "ist der aktuellen Firma (Kunden) zugeordnet(aber noch nicht angewendet)"

            MsgBox s, vbExclamation, t
        Case -1
            Me!LstArtikelAct = 10
            regMain_Change
        Case Else
            If Me!VGAbschluss <> 0 Then
                s = "Vorgang ist bereits abgeschlossen!"
                GoTo ErrM
            End If
            If Me!NrQK = 10 Then
                s = "Geht nicht bei" & vbNewLine & _
                            Me!pageVorgang.Caption
                GoTo ErrM
            End If
            If left(Me!LstArtikel.column(1), 3) = " xx" Then
                s = "Diese Liste wurde hier bereits schon mal angewendet (xx)!" & vbNewLine & _
                        "Soll mit dieser Liste neu gerechnet werden?" & vbNewLine & vbNewLine & _
                        "JA" & vbTab & "Preise neu berechnen" & vbNewLine & _
                        "NEIN" & vbTab & "Preise aus der Preisliste entfernen!"
                i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
                Select Case i
                Case vbNo
                    strSQL = "EXECUTE spa_VGDet @x = 'lstArtikelAct'" & _
                        ", @a = 42 " & _
                        ", @i = " & Me!NrVG
                    OH_EX
                    lstVGID_AfterUpdate
                    GoTo ErrEnd
                Case vbCancel
                    GoTo ErrEnd
                End Select
            End If
            s = "Ausgewählte Preisliste" & vbNewLine & _
                    Me!LstArtikel.column(1) & "" & Me!LstArtikel.column(2) & "" & Me!LstArtikel.column(3) & vbNewLine & vbNewLine & _
                    "Sollen die Artikelpreise mit dieser Liste abgeglichen werden?"
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
                    strSQL = "EXECUTE spa_VGDet @x = 'lstArtikelAct'" & _
                    ", @a = 41" & _
                    ", @i = " & Me!NrVG & _
                    ", @p = " & Me!LstArtikel
                OH_r r
                Select Case r(0)
                Case 0
                    s = "Es wurden keine übereinstimmenden Artikel gefunden" & vbNewLine & _
                            "oder die Preise sind bereits abgeglichen"
                    GoTo ErrM
                Case Else
                    s = "bei " & r(0) & " Artikel(n) wurde der Preis / Rabatt aus der Preisliste übernommen!"
                    MsgBox s, vbExclamation, t
                    lstVGID_AfterUpdate
                End Select
            End If
        End Select
    Case Else
        OH_OF "F_Artikel", Nz(Me!LstArtikel.column(1), 0) '190206
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstArtikel_DblClick"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
    lgLstdet = Me!NrVG
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
   Cancel = True
End Sub
Private Sub lstDet_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    OH_lstdetKeydown Me, KeyCode
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_VG.lstDet_KeyDown"
    Resume ErrEnd
End Sub
Private Sub lstKontakt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!lstKontakt, 0)
    If lgid > 0 Then
        OH_OF "F_Adresse", lgid
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstKontakt_DblClick"
    Resume ErrEnd
End Sub
Private Sub LstLeistung_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!LstLeistung, 0)
    OH_OF "F_Leistung", lgid
    With Forms!F_Leistung
        If lgid > 0 Then
            !lstD.SetFocus
            !lstD = lgid
            !DatumTag.SetFocus
        Else
            !txtFind = Me!projektNr
            .txtFind_AfterUpdate
        End If
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstLeistung_DblClick"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, "Doppel-Click auf Leistung"
    GoTo ErrEnd
End Sub

Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstM, 0)
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    Select Case Err.number
    Case 2115
        SysCmd acSysCmdSetStatus, s
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstM_DblClick"
    End Select
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
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Adressen lstStichwort_MouseDown"
    End Select
    Resume ErrEnd
End Sub
Public Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If OH_CheckAbschluss Then
        GoTo ErrEnd
    End If
    If OH_OpenStichwort(Me, , , lgX(2)) = 0 Then
        OH_FB Forms!PF_Stichwort!UF_Stichwort.Form, _
                    "NrStichwort = " & Nz(Me!lstStichwort, 0), "Stichwort"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "lstStichwort_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!lstStichwortAct
    Case 30, 31, 32, 40, 43
    Case Else
        If OH_CheckAbschluss Then
            GoTo ErrEnd
        End If
    End Select
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Vorgänge lstStichwortAct_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstVG_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!oglstVG
    Case 1
        OH_SetRS Me, Nz(Me!lstVG, 0)
        Me!lstVG.SetFocus
    Case 2
        OH_OF "F_Artikel", Nz(Me!lstVG, 0)
        Set frm = Forms!F_Artikel
        frm!comArtikelVG.SetFocus
        frm!comArtikelVG = 11
        frm!comArtikelVG1 = 0
        frm.comArtikelVG_AfterUpdate
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        SysCmd acSysCmdSetStatus, Err.number & " " & Err.Description
    End Select
    Resume ErrEnd
End Sub
Private Sub lstFirma_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstFirma, 0)
    Me!lstFirma.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        SysCmd acSysCmdSetStatus, Err.number & " " & Err.Description
    End Select
    Resume ErrEnd
End Sub
Private Sub lstFirmaAct_Afterupdate()
    regD_Change
End Sub
Private Sub lstVGID_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long '200109
    lgid = Nz(Me!lstVGID.column(1), 0)
    Me!lstVGIDAct = 400
    OH_SetRS Me, lgid
    Me!lstVGID.SetFocus
    Me!lstVGID = Me!VGIDu
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstVGID_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub oglstVG_AfterUpdate()
On Error GoTo ErrMsg
    OH_setlstVG
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "oglstVG_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub MWSt_Enter()
On Error GoTo ErrMsg
    Dim strWährungL As String
    GoTo ErrEnd
    Dim sgKursL As Single
    Dim sgMWSTL As Single, sgMWSTDB As Single
    If Me.Dirty Or VarAntw = "CheckMWST" Then
        VarAntw = Null
        '141016
        If Not IsNull(Me!LandFirma) Then
            OH_A " @x = 'CheckMWST' " & _
                 ", @i = " & Me!NrVG, , Me
            OH_r r
            sgKursL = Nz(r!Kurs, 1)
            sgMWSTL = Nz(r!LandMWSt, 1)
            strWährungL = Nz(r!Währung, 1)
            sgMWSTDB = Nz(r!dbLandMWSt, 1)
            If IsNull(Me!VGWährung) Then
                Me!VGWährung = strWährungL
            End If
            If IsNull(Me!VGKurs) Then
                Me!VGKurs = sgKursL
            End If
            x = r!MWSt
            If x - Me!MWSt <> 0 Then
                If MsgBox("Welche MwSt soll eingetragen werden:?" & vbNewLine & vbNewLine & _
                        "JA" & vbTab & x & " %" & vbNewLine & _
                        "Nein" & vbTab & Me!MWSt & " %", _
                        vbQuestion + vbYesNo, "Abweichende Mehrwertsteuer") = vbYes Then
                    Me!MWSt = x
                End If
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "MWST eintragen"
    Resume ErrEnd
End Sub
Private Sub NamePerson_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_tlbFilterField
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Rabatt_AfterUpdate()
On Error GoTo ErrMsg
    Dim dblR As Double
    If Nz(Me!VGDetSum, 0) = 0 Or IsNull(Me!Rabatt) Then
        GoTo ErrEnd
    End If
    dblR = Round(Me!Rabatt / Me!VGDetSum * 100, 5) '111105
    If Me!VGRabatt <> dblR Then
        If MsgBox("Möchten Sie den Rabattsatz neu festlegen?" & vbNewLine & _
                    Format(Me!Rabatt, "#'##0.00") & " / " & Format(Me!VGDetSum, "#'##0.00") & " = " & Format(dblR, "#0.00000") & "%", _
                    vbQuestion + vbYesNo, Me!Rabatt.ControlTipText) = vbYes Then
            Me!VGRabatt = dblR
            SumVGTotA_Enter
            OH_SaveRS Me
            Me!Rabatt.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!RabattArt
    Case "kein Rabatt"
        Me!RabattArt = Null
        Me!VGRabatt = 0
        OH_SaveRS Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Rabatt-Art"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt_GotFocus()
On Error GoTo ErrMsg
    OH_Lex Me!RabattArt, "Rabatt-Art"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "RabattArt_GotFocus"
    Resume ErrEnd
End Sub
Private Sub RabattArt_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "Rabatt-Art", "RabattArt"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "RabattArt_NotInList"
    Resume ErrEnd
End Sub
Private Sub txtFind_BeforeUpdate(Cancel As Integer)
    glLstDet = False
End Sub
Private Sub VGDat1D_DblClick(Cancel As Integer)
    If IsNull(Me!VGDat1) Then
        Me!VGDat1 = Date
    End If
End Sub

Private Sub VGPrint_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    t = Nz(Me!VGPrint.column(2), "")
    i = Me!VGPrint + 1
    If i > 4 Then
        i = -1
    End If
    Me!VGPrint = i
    Select Case Me!VGPrint
    Case 1, 2
        OH_Openlexikon "Database", "Gesamtübersicht", , , , Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "Form_F_VG.VGPrint_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub VGRabatt_AfterUpdate()
    OH_reCalculate
End Sub
Private Sub Rabatt1_AfterUpdate()
On Error GoTo ErrMsg
    Dim dblR As Double
    If Nz(Me!VGDetSum, 0) = 0 Or IsNull(Me!Rabatt1) Then
        GoTo ErrEnd
    End If
    dblR = Round(Me!Rabatt1 / (Me!VGDetSum - Me!Rabatt) * 100, 5) '111105
    If Me!VGRabatt1 <> dblR Then
        If MsgBox("Möchten Sie den Rabattsatz neu festlegen?" & vbNewLine & _
                    Format(Me!Rabatt1, "#'##0.00") & " / " & Format(Me!VGDetSum, "#'##0.00") & " = " & Format(dblR, "#0.00") & "%", _
                    vbQuestion + vbYesNo, Me!Rabatt.ControlTipText) = vbYes Then
            Me!VGRabatt1 = dblR
            SumVGTotA_Enter
            OH_SaveRS Me
            Me!Rabatt.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt1_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!RabattArt1
    Case "kein Rabatt"
        Me!RabattArt1 = Null
        Me!VGRabatt1 = 0
        OH_SaveRS Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt1_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Rabatt-Art"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub RabattArt1_GotFocus()
On Error GoTo ErrMsg
    OH_Lex Me!RabattArt1, "Rabatt-Art"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "RabattArt1_GotFocus"
    Resume ErrEnd
End Sub
Private Sub RabattArt1_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "Rabatt-Art", "RabattArt1"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub VGRabatt1_AfterUpdate()
    OH_reCalculate
End Sub
Public Sub regD_Change()
On Error GoTo ErrMsg
    Dim strStGr As String
    Dim strC As String
    Dim strStT As String
    Dim N As Long
    DoCmd.Hourglass True
    OH_lstDetColumns Me.regd.Value
    Select Case Me.regd.Value
    Case 0
        OH_A "lstVGIDAct", , Me
        OH_setlstVG
        OH_A "lstVGID", " @i =" & Nz(Me!VGID, 0), Me
        Me!lstVGID = Me!VGIDu
        Me!lstVG = Me!NrVG
    Case 2
        OH_A "lstFirmaAct", , Me  '140429
        OH_A "lstFirma", _
            "@i =" & Nz(Me!NrFirma, 0) & _
            ",@a =" & Nz(Me!lstFirmaAct, 0) & _
            ",@f ='" & Nz(Me!txtFindFa, "") & "'", Me
        With Me!lstFirma
            .Value = Me!NrVG
            .ColumnWidths = OH_ColumnWidthsMM("15;15;10;15;20;60;70;30")
            .ColumnCount = 9
            .ControlTipText = "Liste der markierten Vorgänge"
        End With
    Case 3
        OH_A "lstKontaktAct", , Me  '111209 siehe F_Leistung
        OH_A "lstKontakt", " @i = " & Nz(Me!NrVG, 0), Me
        Me!lstKontakt.SetFocus
    Case 4
        OH_A "lstLeistungAct", , Me
        OH_A "lstLeistung", "@i = " & Nz(Me!NrVG, 0), Me
    Case 5
        OH_A "LstArtikeld", " @i = " & Me!NrVG, Me
        If Me.RegMain = 2 Then
            Me!LstArtikeld = Me!LstArtikel
        Else
            Me!LstArtikeld = Me!LstArtikeld.column(0, 1)
            lstArtikeld_afterupdate
        End If
    Case 6
        strStT = "1;Stichworte zum Vorgang " & Me!pageVorgang.Caption
        Me!lstStichwortAct.SetFocus
        strStGr = Nz(Me!lstStichwortGr1, "Technische Daten")
        OH_lstStichwortAct Me, 0, strStGr
        strSQL = "Execute spa_Stichwort @x = 'lstStichwortGr1'"
        OH_A "lstStichwortGr1", strSQL, Me
        If lgVGdet <> 0 And Me!RegMain = 2 Then
            strStT = strStT & ";2;Stichworte zu Artikel Position " & Nz(Me!Position, "")
        End If
        Select Case Me!RegMain
        Case 0, 1
            strSQL = "Exec dbo.spA_Stichwort " & _
                " @cID ='NrVG'" & _
                ",@ID =  " & Nz(Me!NrVG, 0) & _
                ",@fi = '" & glDMS & "'"
        Case 2
            strSQL = "Exec dbo.spA_Stichwort " & _
                " @cID ='NrVGDet'" & _
                ",@ID =  " & Nz(Me!nrVGDet, 0) & _
                ",@d = '" & strStGr & _
                "',@o = '" & Nz(Me!Position, "") & "'"
            strStT = strStT & " Position " & Nz(Me!Position, "")
        End Select
        OH_A "lstStichwort", strSQL, Me
    Case 7
        OH_MarkerLST Me
        strSQL = "Exec dbo.spI_Marker @art = 'V'"
        OH_A "lstMdoVg", strSQL, Me
        With Me!lstM
            .Value = Me!NrVG
            .ColumnWidths = OH_ColumnWidthsMM("15;15;10;15;20;60;60;20")
            .ColumnCount = 9
            .ControlTipText = "Liste der markierten Vorgänge"
        End With
    Case 8
        strSQL = "Exec dbo.spA_VG 'lstTopAct'"
        OH_A "lstTopAct", strSQL, Me
        lstTopAct_AfterUpdate
        With Me!lstTop
            .Value = Me!NrVG
            .ColumnWidths = OH_ColumnWidthsMM("15;15;10;15;20;45;45;45;20")
            .ColumnCount = 11
            .ControlTipText = "Liste der Vorgänge sortiert nach der gelbem Auswahlliste links"
        End With
    Case 9 'Summe / Profit
        OH_InsertID_LST Me!lstDet
        OH_A "lstSum", , Me
        OH_A "lstProfit", "@i = " & Val(Nz(Me!VGID, 0)), Me
        With Me!lstProfitProvision
            OH_A "lstProfitProvision", "@i = " & Val(Nz(Me!VGID, 0)), Me
            .ColumnWidths = OH_ColumnWidthsMM("10;25;30;15;15;10;0")
            .ColumnCount = 7
            .ControlTipText = "Liste der Provisionen in diesem Projekt"
        End With
        strSQL = "Exec dbo.spA_Div " & _
                " @x = 'Cube Daten füllen...'" & _
                ", @i = -1"
        OH_r r
        Me!lblProfitProvision.Caption = "Liste der Provisionen Stand: " & r!letzteBerechnung
    Case 10 'Bearbeitungslisten
        For i = 1 To 2
            Select Case i
            Case 1
                strC = "lstEditAct"
            Case 2
                strC = "lstEdit"
            End Select
            strSQL = "Exec dbo.spA_Filter 'lstEdit', " & _
                    " @a = " & i & " , " & _
                    " @f = 'F_VG'"
            OH_A strC, strSQL, Me
        Next i
    Case 11
        OH_lstWv Me
    Case 12
        OH_A "lstExplorerSource", , Me
        OH_A "lstExplorerAct", , Me '170419
        Me!lstExplorerAct = 7
        lstExplorerAct_AfterUpdate
    Case 13
        strSQL = "Exec dbo.spI_Statistik 'comstatistikY'"
        OH_A "comStatistikY", strSQL, Me
        Me!comStatistikY = Nz(Me!comStatistikY, "Alle Jahre")
        strSQL = "Exec dbo.spI_Statistik 'Kontrakt'"
        OH_A "Kontrakt", strSQL, Me
        Me!Kontrakt = Nz(Me!Kontrakt, Me!VGID)

        strSQL = "Exec dbo.spI_Statistik @x = 'lstStatistik', @i = " & Nz(Me!NrVG, 0) '<R59>
        OH_A "lstStatistik", strSQL, Me
        N = Val(Nz(Me!lstStatistik.column(2, 1), 0))
        If N = 0 Then
            N = Me!VGID
        End If
        Me!Kontrakt = N
        Select Case Me!NrQK
        Case 30, 46, 60
            Me!lstStatistik = "Verkauf"
        Case 31, 45, 61
            Me!lstStatistik = "Einkauf"
        End Select
        lstStatistik_AfterUpdate
    Case 14
        strSQL = "Exec dbo.spA_Audit 'lstAuditAct'"
        OH_A "lstAuditAct", strSQL, Me
        Me!lstAuditAct = 10
        lstAuditAct_AfterUpdate
    Case 15
        strSQL = "Exec dbo.spA_B2B @x= 'lstB2bAct', @i = " & Me!NrVG
        OH_A "lstB2bAct", strSQL, Me
        Me!lstB2BAct = 10
        lstB2BAct_AfterUpdate
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "regd_Change"
    Resume ErrEnd
End Sub
Private Function OH_setlstVG()
On Error GoTo ErrMsg
    OH_A "@x = 'lstVG'" & _
        ", @m = " & Me!oglstVG & _
        ", @f = '" & Nz(Me!projektNr, "") & _
        "',@s =" & Nz(Me!lstVGIDAct, 0) & _
        ", @o ='" & strOB & "'", , Me
    OH_A "lstVG", strSQL, Me
    Me!lstVG.BackColor = 15066597
    Me!lstVG = Me!NrVG
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_setlstVG"
    Resume ErrEnd
End Function
Private Function OH_lstDetColumns(lgRegD As Long)
On Error GoTo ErrMsg
    Dim N As Long
    Dim lgW  As Long
    Dim lgCC  As Long
    Dim strCW  As String
    Dim lgY(1 To 1000)
    Dim Y As Long
    DoEvents
    Select Case lgRegD
    Case 1
        If Me!lstDet.ColumnCount <> 15 Then
            lgW = Me.regd.left + Me.regd.Width - Me!lstDet.left
            lgCC = 15
            N = lgW / 56.7
            N = (N - 240) / 2
            strCW = OH_ColumnWidthsMM("15;15;6;15;20;" & N & " ;30;" & N & " ;0;15;20;40;25;20")
        End If
    Case Else
        If Me!lstDet.ColumnCount <> 8 Then
            lgW = Me!lstA.left + Me!lstA.Width - Me!lstDet.left
            lgCC = 8
            N = lgW / 56.7
            N = (N - 13 - 6) / 2
            strCW = OH_ColumnWidthsMM("0;13;6;0;0;" & N & " ;0")
        End If
    End Select
    If lgW > 0 Then
        N = 0
        With Me!lstDet
            For Each x In .ItemsSelected
                N = N + 1
                If N > 1000 Then
                    Exit For
                Else
                    lgY(N) = .column(0, x)
                End If
            Next x
            .Width = lgW
            .ColumnCount = lgCC
            .ColumnWidths = strCW
            N = 1
            For i = 1 To .ListCount - 1
                If .column(0, i) = lgY(N) Then
                    N = N + 1
                    .Selected(i) = True
                End If
            Next i
        End With
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_lstDetColumns"
    Resume ErrEnd
End Function
Private Sub lstProfit_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgIDu As Long
    lgid = Nz(Me!lstProfit, 0)
    If lgid = 0 Then
        GoTo ErrEnd
    End If
    If Me!lstProfit.column(2) = "" Then
        lgIDu = -1
    Else
        lgIDu = Me!lstProfit.column(2)
    End If
    Me!txtFind = Me!lstProfit.column(1) & "-" & Me!lstProfit.column(2)
    strSQL = Me!lstProfit.Recordset.Source & _
            ", @a = " & lgIDu & _
            ",  @b = 1"
    OH_A "lstDet", strSQL
    Me!countRec = Me!lstDet.ListCount - 1
    SysCmd acSysCmdSetStatus, "letzte Aktion Doppel-Klick auf Rohgewinnliste: zeigt alle Vorgänge der gwählten Projekt-Nr. an"
    OH_SetRS Me, lgid
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstProfit_DblClick"
    Resume ErrEnd
End Sub
Private Sub telefon_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    btnTelefon_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "telefon_DblClick"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Dim strW As String
    Dim lgC As Long
    DoCmd.Hourglass True
    lgC = 4
    If IsNull(Me!lstA) Then
        Me!lstA = 0
    End If
    strW = "0cm;1.5cm;2.5cm;2cm"
    Me!txtFind.SetFocus
    Select Case Me!txtFind.Text
    Case "A:", _
         "N:", _
        "S:", _
        "D0:", _
        "D1:", _
        "D2:", _
        "FA:"
        SysCmd acSysCmdSetStatus, "Filter setzen: " & Me!txtFind
        Me!txtFind.SetFocus
        Me!txtFind.SelStart = 4
        s = "Bitte ergänzen Sie das Schlagwort " & Me!txtFind & vbNewLine & _
            "um einen Suchbegriff"
        t = "Suche mit Schlagworten"
        GoTo ErrM
    End Select
    OH_A "@x =  'lst', " & _
        " @i = " & Val(Nz(Me!lstA, 0)) & _
        ",@a = " & Nz(Me!lstAktiv, 0) & _
        ",@abschluss = " & Nz(Me!comVGAbschluss, -1) & _
        ",@b = " & Nz(Me!comTage, 0) & _
        ",@f = '" & Replace(OH_RPL(Me!txtFind.Text), "*", "%") & _
       "',@d = '" & Nz(Me!lstTopA, "0") & _
       "',@m = " & glMandant & _
        ",@u = " & lguser & _
        ",@i1 = " & Nz(Me!comA, 0) & _
        ",@i2 = " & Nz(Me!comAA, 0) & _
        ",@i3 = " & Nz(Me!comFirma, 0) & _
        ",@s = " & Nz(Me!lstOrder, 0) & _
        ",@dt = '" & Format(Nz(Me!datVon, ""), "yyyymmdd") & _
       "',@ds = '" & Format(Nz(Me!DatBis, ""), "yyyymmdd") & "'" _
        , , Me
    OH_txtFind Me, strSQL
    If Me!countRec.BackColor = vbRed Then
        regD_Change
    Else
        Select Case Me.regd
        Case 9
            regD_Change
        End Select
    End If
    Me!txtFind.SetFocus
    s = "letzter Filter:"
    If Me!lstTopA <> "0" Then
        s = s & " " & Me!lstTopA.column(1)
    End If
    If Me!lstAktiv <> "2" Then
        s = s & ", " & Me!lstAktiv.column(1)
    End If
    If Me!lstA <> 0 Then
        s = s & ", " & Me!lstA.column(1)
    End If
    If Me!lstOrder <> 0 Then
        s = s & ", sortiert nach: " & Me!lstOrder.column(1)
    End If
    If Not IsNull(Me!txtFind) Then
        s = s & ", Suchtext: * " & Me!txtFind & " *"
    End If
    Select Case Me!lstAktiv
    Case 5, 6
        Me!lstWv.SetFocus
        Me!lstWvAct = 22
        lstWvAct_AfterUpdate
    End Select
    SysCmd acSysCmdSetStatus, s
    s = Me!comtxtFind.RowSource
    i = InStr(s, left(strcomtxtFindRS, 12))
    Select Case i
    Case 0
        s = s & ";" & strcomtxtFindRS
    Case 1
        s = strcomtxtFindRS
    Case Else
        s = left(s, i - 2) & ";" & strcomtxtFindRS
    End Select
    Me!comtxtFind.RowSource = s
    Me!lstDet.SetFocus
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    Select Case Err.number
    Case 2110
        SysCmd acSysCmdSetStatus, s
    Case Else
        MsgBox s, vbCritical, "Form_F_VG.txtFind_AfterUpdate"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btntxtFind_Click()
    txtFind_AfterUpdate
End Sub
Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!comtxtFind
    Select Case Me!txtFind
    Case "A: Sucht in Adressen", _
         "N: Projekt-Nummern", _
        "S: Stichworte", _
        "D0: Vorgangs-Datum", _
        "D1: Datum 1", _
        "D2: Datum 2", _
        "LN: lfd.-Nr.", _
        "FA: Firmenname"
        SysCmd acSysCmdSetStatus, "Filter setzen: " & Me!txtFind
        Me!txtFind = left(Me!txtFind, InStr(Me!txtFind, ":"))
        Me!txtFind.SetFocus
        Me!txtFind.SelStart = Len(Me!txtFind)
        Select Case Me!txtFind
        Case "D0:", _
            "D1:", _
            "D2:"
            Me!txtFind = Me!txtFind & Format(Date, "dd.mm.yy")
            'sortierung einstellen je nach Datums-feld 190806 <R77>
            Me!lstOrder = 30 + Val(Mid(Me!txtFind, 2, 1)) * 10
        Case Else
            GoTo ErrEnd
        End Select
    End Select
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
    Select Case left(Me!txtFind, 3)
    Case "D0:", _
        "D1:", _
        "D2:"
        Me!txtFind.SelStart = 3
    Case Else
        GoTo ErrEnd
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = Null
End Sub
Private Sub txtfindFa_DblClick(Cancel As Integer)
    Me!txtFindFa = Null
    txtFindFa_AfterUpdate
End Sub
Private Sub txtFindFa_AfterUpdate()
    regD_Change
End Sub
Private Sub comTage_AfterUpdate()
On Error GoTo ErrMsg
    OH_comTage
    txtFind_AfterUpdate
    If Me!datVon.Visible Then
        Me!datVon.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comTage_AfterUpdate"
    Resume ErrEnd
End Sub
Private Function OH_comTage()
On Error GoTo ErrMsg
    Dim lgTop As Long
    Dim lgHeight As Long
    Select Case Me!comTage
    Case 13
        Me!datVon.Visible = True
        Me!DatBis.Visible = True
        lgTop = Me!DatBis.Height + Me!DatBis.top + 10
        lgHeight = Me!comFirma.top + Me!comFirma.Height - lgTop
        Me!datVon.SetFocus
    Case Else
        Me!datVon.Visible = False
        Me!DatBis.Visible = False
        lgTop = Me!comTage.Height + Me!comTage.top + 10
        lgHeight = Me!comFirma.top + Me!comFirma.Height - lgTop
    End Select
    Me!lstOrder.top = lgTop
    Me!lstOrder.Height = lgHeight
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comTage_AfterUpdate"
    Resume ErrEnd
End Function
Private Sub comTage_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!comTage = Nz(Me!comTage, 0) + 1
    If Me!comTage > 8 Then
        Me!comTage = 0
    End If
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comTage_DblClick"
    Resume ErrEnd
End Sub
Private Sub DatVon_DblClick(Cancel As Integer)
    Me!datVon = Null
    Me!DatBis.SetFocus
End Sub
Private Sub DatBis_DblClick(Cancel As Integer)
    Me!DatBis = Null
End Sub
Private Sub DatVon_AfterUpdate()
    txtFind_AfterUpdate
    Me!DatBis.SetFocus
End Sub
Private Sub DatBis_AfterUpdate()
    txtFind_AfterUpdate
    Me!datVon.SetFocus
End Sub
Private Sub VG_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Me!NrVG
    Me!txtFind = Me!VG
    txtFind_AfterUpdate
    If Me!NrVG <> lgid Then
        OH_OF "F_VG", lgid
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VG_DblClick"
    Resume ErrEnd
End Sub
Private Sub VGAbteilung_Enter()
On Error GoTo ErrMsg
    OH_A "VGAbteilung"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGAbteilung_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub VGDat1_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_FilterDate Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGDat1Det_DblClick"
    Resume ErrEnd
End Sub
Private Sub VGDat2_DblClick(Cancel As Integer)
    If IsNull(Me!VGDat2) Then
        Me!VGDat2 = Date
    End If
End Sub
Private Sub vgdat2D_DblClick(Cancel As Integer)
    If IsNull(Me!VGDat2) Then
        Me!VGDat2 = Date
    End If
End Sub

Private Sub VGDat1_Exit(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Einleitung Me!VGDat1
    If InStr(Me!btnVGDat1.Caption, "Leistung") > 0 Then
        If OH_Validate(Me!VGDat1, Me!btnVGDat1.Caption) = True Then
            Me!VGDat1D.SetFocus
            Me!VGDat1D.BackColor = vbRed
            Cancel = True
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub

Private Sub VGDat1D_LostFocus()
On Error GoTo ErrMsg
    If IsNull(Me!VGDat1) And InStr(Me!Dat1, "leistung") > 0 Then
        Me!VGDat1.SetFocus
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGDat1D_LostFocus"
    Resume ErrEnd
End Sub

Private Sub vgdat2D_AfterUpdate()
On Error GoTo ErrMsg
    Dim varD As Variant
    varD = DateSerial(Year(Date), Month(Date), Me!vgdat2D)
    If IsDate(varD) Then
        Me!VGDat2 = varD
    End If
    Me!vgdat2D = Null
    Me!VGDat2.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "vgdat2D_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub vgdat1D_AfterUpdate()
On Error GoTo ErrMsg
    Dim varD As Variant
    If IsNull(Me!VGDat1D) Then
        Me!VGDat1.SetFocus
    Else
        varD = DateSerial(Year(Date), Month(Date), Me!VGDat1D)
        If IsDate(varD) Then
            Me!VGDat1 = varD
            Me!VGDat1D = Null
            OH_Einleitung Me!VGDat1
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "vgdat1D_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub VGdatum_DblClick(Cancel As Integer)
    OH_tlbFilterField
End Sub

Private Sub VGDetSum_AfterUpdate()
    OH_reCalculate
    If Me!NrQK = 53 Then
        Me!vgdat2D.SetFocus
    End If
End Sub
Private Sub VGID_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstVGIDAct = 310
    lstVGIDAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub VGID_Enter()
On Error GoTo ErrMsg
    OH_A "VGID"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGID_Enter"
    Resume ErrEnd
End Sub
Private Sub VGIDu_Enter()
On Error GoTo ErrMsg
    OH_A "VGIDu", "@i = " & Me!VGID, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGIDu_Enter"
    Resume ErrEnd
End Sub
Private Sub MWSt_AfterUpdate()
    OH_reCalculate
End Sub
Public Sub NrMitarbeiter_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgMandant As Long
    lgMandant = Val(Me!NrMitarbeiter.column(4))
    Me!NrFunktion.SetFocus
    If IsNull(Me!NrFunktion) Then
        Me!NrFunktion.Dropdown
    End If
    If lgMandant <> Me!VGAbteilung Then
        If MsgBox("Möchten Sie wirklich den Mandanten wechseln?", _
                    vbQuestion + vbOKCancel, Me!ANr & " " & Me!VG) = vbOK Then
            Me!VGAbteilung = lgMandant
            VGAbteilung_AfterUpdate
            OH_SaveRS
        Else
            Me!NrMitarbeiter = Me!NrMitarbeiter.OldValue
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub

Private Sub SumVGTotA_BeforeUpdate(Cancel As Integer)
    If OH_CheckAbschluss Then
        Cancel = True
    End If
End Sub
Private Sub SumVGTotA_AfterUpdate()
On Error GoTo ErrMsg
    Dim strT As String
    Dim sgX As Single
    If Format(Nz(Me!SumVGTotA, 0), "0.00") Like Format(Nz(Me!SumVGTot, 0), "0.00") Then
        Exit Sub
    Else
        '\text{(Bruttobetrag/ 1+ Mehrwertsteuersatz) * Mehrwertsteuersatz = Mehrwertsteuerbetrag}
        strT = Format(Me!SumVGTotA, "Standard") & " " & Me!VGWährung
        sgX = Nz(Me!SumVGTotA, 0) * (1 - Me!VGRabatt / 100) / (100 + Me!MWSt) * 100
        x = Round(Nz(Me!SumVGTotA, 0) * (1 - Me!VGRabatt / 100) / (100 + Me!MWSt) * 100, 2)
        s = "Währung:" & vbTab & vbTab & vbTab & Me!VGWährung & vbNewLine & _
                  "MWST %:" & vbTab & vbTab & vbTab & Format(Me!MWSt, "Standard") & vbNewLine & _
                  "Rabatt:" & vbTab & vbTab & vbTab & Format(Me!VGRabatt, "Standard") & vbNewLine & _
                  "MWST:" & vbTab & vbTab & vbTab & Round(x * Me!MWSt / 100, 2) & vbNewLine & _
                  "Betrag ohne MWST:" & vbTab & vbTab & Format(x, "Standard") & vbNewLine & _
                  "===============================" & vbNewLine & _
                  "Betrag mit MWST:" & vbTab & vbTab & strT & vbNewLine & vbNewLine & _
                  "JA" & vbTab & "Werte ok" & vbNewLine & _
                  vbTab & "<" & Me!btnVGDat2.Caption & ">: " & Me!VGdatum & "  = " & strT & vbNewLine & _
                  "Nein" & vbTab & "Werte ok" & vbNewLine & _
                  vbTab & "<" & Me!btnVGDat2.Caption & "> leer lassen"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, Me!VGdatum & " / " & Me!VG)
        Select Case i
        Case vbYes
            Me!VGDetSum = Round(sgX, 2)     '111104 Rundungsfehler eliminiert  AO
            Me!VGDat2 = Me!VGdatum
            Me!VGSng1 = Me!SumVGTotA
        Case vbNo
            Me!VGDetSum = Round(x, 2)
            Me!VGDat2 = Null
            Me!VGSng1 = Null
        Case Else
            Me!SumVGTotA.Undo
        End Select
    End If
    OH_reCalculate
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.SumVGTotA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub VGKurs_GotFocus()
On Error GoTo ErrMsg
    OH_A "VGKurs"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGKurs_GotFocus"
    Resume ErrEnd
End Sub
Private Sub VGNr_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strNr As String
    If Me!VGIDu = 0 Then
        strNr = Me!VGID
    Else
        strNr = Me!projektNr
    End If
    Select Case Me!NrQK
    Case 51
        strNr = Me!VGNr & "-" & Year(Me!VGdatum) & "-" & strNr
    Case Else
        strNr = Me!VGAbteilung & "-" & Format(Me!VGNr, "0000") & "-" & right(Year(Me!VGdatum), 2) & "-" & strNr
    End Select
    Beep
    OH_CB strNr
    '130201 PG PSG hat ein Internet-Bestelltotal für Almatechnik, für das hier ein
    'csv-File erstellt wir, um wenigstens die Artikel einlesen zu können....
    strSQL = "Exec dbo.spa_VG " & _
            " @x = 'Bestellportal' " & _
            ", @a = " & Me!NrFirma
    OH_r r
    If r.BOF = False Then
        strf = r!path
        If strf <> "" Then
            strSQL = strSQL & _
                    ",@i = " & Me!NrVG
            If OH_EXCELCSV(strf) Then
                s = "erfolgreich"
            Else
                s = "NICHT!"
            End If
            t = "Projekt-Nr. " & strNr & " ist kopiert!"
            s = strf & vbNewLine & _
                    "File wurde " & s & " erstellt!"
            MsgBox s, vbExclamation, t
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGNr_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub VGSprache_DblClick(Cancel As Integer)
    OH_tlbFilterField
End Sub
Private Sub VGStatus_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!VGStatus
    Case "Abgeschlossen", "Storno"
        Me!VGAbschluss = -1
    End Select
    VGAbschluss_afterupdate
    If Me!VGStatus Like "offen" Then
        Me!comVGInfo.SetFocus
        Me!comVGInfo.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Status-Änderung"
    Resume ErrEnd
End Sub
Private Sub VGAbschluss_afterupdate()
On Error GoTo ErrMsg
Dim strA(1 To 4) As String
    If Me!VGAbschluss <> 0 Then
        If left(Me!VGStatus, 1) Like "†" Or InStr(Me!VGStatus, "abgeschlossen") > 0 Then
            OH_SaveRS Me
            If Me!QKAbschluss <> 0 Then
                OH_A "@x = 'offeneVorgänge'", _
                    "@i = " & Me!NrVG & _
                    ",@a = " & Me!VGID
                OH_r r
                If r.EOF = False Then
                    i = r.RecordCount & ""
                    If i > 1 Then
                        strA(1) = "nur aktuelles abmelden"
                        strA(2) = "zusätzlich die markierten abmelden"
                        strA(3) = "ALLE abmelden, da Projekt komplett beendet!"
                        OH_msgbox "", Array(strA(1), strA(2), strA(3)), vbQuestion, _
                                 "Abschluss des Projektes " & Me!ANr & " " & Me!VG, _
                                 "Sollen die zugehörigen, noch nicht abgeschlossenen Vorgänge" & vbNewLine & _
                                  "auch als abgeschlossen gekennzeichnet werden:" & vbNewLine & vbNewLine & _
                                  "-Vorgang als erledigt markieren" & vbNewLine & _
                                  "-ev. Wiedervorlagedatum löschen" & vbNewLine & _
                                  "-Status auf <" & Me!VGStatus & "> setzen?", , , _
                                  strSQL, 5, "0;16;10;40"
                        Select Case strMSG(2)
                        Case strA(1)
                            GoTo ErrEnd
                        Case strA(2)
                            strlink = "where nrVG in (" & strMSG(3) & ");"
                        Case strA(3)
                            strlink = strA(4)
                        Case Else
                            Me!VGStatus = "offen"
                            Me!VGAbschluss = 0
                            Me!VGStatus.SetFocus
                            GoTo ErrEnd
                        End Select
                        strSQL = "Update T_VG set" & _
                                 " VGAbschluss = 1, " & _
                                 " VGStatus = '" & Me!VGStatus & _
                                 "'" & strlink
                        OH_EX
                        Me.Refresh
                    End If
                    OH_ResetRS r
                End If
            End If
        Else
            With Me!VGStatus
                If .Enabled = True Then
                    .SetFocus
                    .Dropdown
                End If
            End With
        End If
    Else
        If Me!VGStatus Like "Abgeschlossen" Then
            Me!VGStatus = "offen"
        End If
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Vorgang abschliessen"
    Resume ErrEnd
End Sub
Private Sub lstVGIDAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strStatus As String
    Dim strf As String
    Dim strS As String
    Dim strFF As String
    Dim strFD() As String
    Dim strBody As String
    Dim strP As String
    Dim strPNeu As String
    Dim strX As String
    Dim lgA As Long
    Dim lgVGid As Long
    Dim lgVGIDNeu As Long
    Dim lgVGidu As Long
    Dim N As Long
    Dim Y As Long
    Dim strQ As String
    Dim strOBact As String
    OH_SaveRS Me
    DoCmd.Hourglass True
    t = Nz(Me!lstVGIDAct.column(1), "-")
    s = ""
    lgA = Nz(Me!lstVGIDAct, 0)
    If right(lgA, 1) = 9 Then 'keine Funktion 210411
        SysCmd acSysCmdSetStatus, "KEINE Funktion"
        GoTo ErrEnd
    End If
    SysCmd acSysCmdSetStatus, t
    strP = Nz(Me!lstVGID.column(2), "")
    If lgA <> 503 Then
        lgVGid = Nz(Me!VGID, 0)
    End If
    OH_A " @x = 'lstVGIDAct'" & _
         ",@a = " & lgA & _
         ",@u = " & lguser, , Me
    strQ = strSQL
    strOBact = Nz(Me!lstVGIDAct.column(2), "")
    If strOBact <> "" Then
        strOB = strOBact
    End If
    Select Case lgA
    Case 0, 1
        lstVGID_AfterUpdate
        Me!lstVGIDAct = lgA
    Case 10 '<R146>
        If Nz(Me!lstVGID.column(2), "") = "" Then
            MsgBox "Bitte Projekt-Nr. in der Liste unten markieren", vbExclamation, t
        Else
            i = Me!lstVGID.column(3)
            s = "Projekt " & strP & "  hat " & i & " Vorgänge"
            If i = 1 Then
                s = Replace(s, "Vorgänge", "Vorgang")
            End If
            If Nz(Me!VGStatus, "") = "Storno" Then
               strStatus = "Storno"
            Else
                strStatus = "Abgeschlossen"
            End If
            s = s & vbNewLine & vbNewLine & _
            "Als Status können Sie unten eintragen:" & vbNewLine & _
            vbTab & "-Abgeschlossen" & vbNewLine & _
            vbTab & "-in Arbeit (entspricht zurücksetzen)" & vbNewLine & _
            vbTab & "-Storno (entspricht abgeschlossen)"
nochmalStatus:
            strStatus = InputBox(s, t, strStatus)
            Select Case strStatus
            Case ""
                GoTo ErrEnd
            Case "Storno"
                strStatus = "Storno"
            Case "Abgeschlossen"
                strStatus = "Abgeschlossen"
            Case "in Arbeit"
                strStatus = "in Arbeit"
            Case Else
                s = s & vbNewLine & _
                    strStatus & " ist NICHT erlaubt!"
                    GoTo nochmalStatus
            End Select
        End If
    Case 30
        s = "Geben Sie unten (mit Punkt getrennt) eine andere Projekt-Nr. ein"
actAgain:
        strX = InputBox(s, t, strP)
        If strX = "" Then
            GoTo ErrEnd
        End If
        i = InStr(strX, ".")
        If i = 0 Then
            s = s & vbNewLine & "Bitte Punkt eingeben"
            GoTo actAgain
        End If
        lgVGid = Val(left(strX, i - 1))
        If lgVGid = 0 Then
            s = s & vbNewLine & "Bitte eine gültige Projekt-Nr. eingeben"
            GoTo actAgain
        End If
        lgVGidu = Val(Mid(strX, i + 1))
    Case 40
        DoCmd.openForm "pfrmClone"
    Case 50 'ergänze den markierten Vorgang...
        lgVGid = Nz(Me!lstVG.column(0), 0)
        If lgVGid = 0 Then
            lgVGid = Nz(Me!NrVG, 0)
        End If
        DoCmd.openForm "PF_NeuVG", , , , , , "X" & lgVGid
    Case 250
        t = "Prüfe Projekte auf Abschluss"
        strSQL = strSQL & _
            ", @i = " & EFNrFktn
        OH_r r
        i = r!CT
        Select Case i
        Case 0
            s = "KEINES IHRER Projekte hat sowohl gschlossene und nicht geschlossene Vorgänge; alles OK!"
            MsgBox s, vbInformation, t
            GoTo ErrEnd
        Case 1
            s = "EINES Ihrer Projekte hat"
        Case Else
            s = i & " Projekte, bei denen Sie betroffen sind, haben "
        End Select
        s = s & "sowohl" & vbNewLine & "- abgeschlossene als auch " & vbNewLine & _
            "- NICHT abgeschlossene Vorgänge!" & vbNewLine & vbNewLine & _
            "Vorgänge links anzeigen?"
        i = MsgBox(s, vbOKCancel + vbInformation + vbDefaultButton2, t)
        If i = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = "Exec dbo.spa_VG vwID"
        OH_A "lstDet", strSQL, Me
        Me!countRec = Me!lstDet.ListCount
        Me!lstDet.Selected(1) = True
        lstDet_AfterUpdate
        GoTo ErrEnd
    Case 310 'Kurz-Übersicht mit Bemerkungen'
        strSQL = strQ & ",@b = " & Me!VGID
        OH_r r
        s = "<div><font size=3><strong>Projektübersicht " & Me!VGID & "</strong></font></div><br>"
        While Not r.EOF
            s = s & r!f1 & r!f2
        r.MoveNext
        Wend
        DoCmd.openForm "pfrmRT", , , , , , Me!lstVGIDAct.column(1)
    Case Is < 500
        OH_setlstVG
    Case 500
        comA_DblClick 0
        GoTo ErrEnd
    Case 501
        s = "Die Breite dieses Formulares können Sie einstellen zwischen" & vbNewLine & _
            "minimal" & vbTab & "400 mm" & vbNewLine & _
            "maximal" & vbTab & "480 mm" & vbNewLine & vbNewLine & _
            "Bitte die gewünschte Breite unten in mm eingeben"
        i = Val(InputBox(s, t, 480))
        Select Case i
        Case 0
            GoTo ErrEnd
        Case Is < 400
            i = 400
        Case Is > 480
            i = 480
        End Select
        '+Formularbreite VG in mm'
        strSQL = strQ & ",@i = " & i & _
        OH_EX
        gllgWidthVG = i
        Form_Load
        GoTo ErrEnd
    Case 502 '--aktueller Filter = Standard Input Gerd 200830
        s = "Soll der aktuelle Filter: " & vbNewLine & vbNewLine & _
            "Top" & vbTab & Me!lstTopA.column(1) & vbNewLine & _
            "Abschluss" & vbTab & Me!comVGAbschluss.column(1) & vbNewLine & _
            "Status" & vbTab & Me!lstAktiv.column(1) & vbNewLine & _
            "Zeitraum" & vbTab & Me!comTage.column(1) & vbNewLine & _
            "Sort" & vbTab & Trim(Me!lstOrder.column(1)) & vbNewLine & _
            "Mandant" & vbTab & Me!lstMandant.column(1) & vbNewLine & _
            "Art" & vbTab & Me!lstA.column(1) & vbNewLine & vbNewLine & _
            "als STANDARD beim Öffnen eingestellt werden" & vbNewLine & _
            "= Stichwort <+Standard-Filter Vorgänge> setzen ?"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ & _
                ",@d = '" & Me!lstTopA & _
                    "," & Me!lstAktiv & _
                    "," & Me!comTage & _
                    "," & Me!lstOrder & _
                    "," & Me!lstMandant & _
                    "," & Me!lstA & _
                    "," & Me!comVGAbschluss & "'"
        OH_EX
        GoTo ErrEnd
    Case 503 '--aktueller Filter = Standard Input Gerd 200830
        strSQL = strQ
        i = 0
        If Me!txtFind <> "" Then
             Me!txtFind = ""
             i = 1
        End If
        OH_r r
        While Not r.EOF
            Select Case r!Nr
            Case 1
                strf = "lstTopA"
            Case 2
                strf = "lstAktiv"
            Case 3
                strf = "comTage"
            Case 4
                strf = "lstOrder"
            Case 5
                strf = "lstMandant"
            Case 6
                strf = "lstA"
            Case 7
                strf = "comVGAbschluss"
            End Select
            If Me(strf) <> Val(r!data) Then
                 Me(strf) = Val(r!data)
                 i = i + 1
            End If
        r.MoveNext
        Wend
        If i > 0 Then
            txtFind_AfterUpdate
        End If
        Me!lstVGIDAct = Null
        GoTo ErrEnd
    End Select
    SysCmd acSysCmdSetStatus, t
    strSQL = strQ & _
                ",@f = '" & strP & _
               "',@b = " & lgVGid & _
                ",@n = " & lgVGidu & _
                ",@i1 = " & Nz(Me!NrQK, 0) & _
                ",@s1 = '" & strS & _
                "',@status = '" & strStatus & "'"
    Select Case lgA
    Case 100
        t = Me!VGID & " ==> " & t
        OH_r r
        If r.BOF Then
            s = strP & " Projekt ist nicht zu finden"
            GoTo ErrM
        End If
        s = "Sie erstellen EIN Mail an" & vbNewLine & Me!Anschrift & vbNewLine & vbNewLine & _
            "mit allen ausgewählten Unternummern als Attachment!" & vbNewLine & vbNewLine & _
            "Bitte geben Sie die Unter-Nummern endweder als Bereich <von bis> ein oder einzeln semikolongetrennt"
        strP = InputBox(s, t, "von " & r!min & " bis " & r!Max)
        If strP = "" Then
            GoTo ErrEnd
        End If
        strSQL = strSQL & ",@d = '" & strP & "'"
        OH_r rs
        If r.BOF Then
            s = strP & " Projekt ist nicht zu finden"
            GoTo ErrM
        End If
        While Not rs.EOF
            OH_ResetID
            OH_InsertID rs!NrVG
            If OH_closeObj(glstrB_VG, acReport) Then
                GoTo ErrEnd
            End If
            VarAntw = "Email"
            DoCmd.OpenReport glstrB_VG, acViewPreview, , , , "F_VG"
            strf = glstrTempPath & rs!projektNr & "-" & rs!NrVG & ".pdf"
            OH_KILL strf
            DoCmd.OutputTo acOutputReport, glstrB_VG, acFormatPDF, strf
            If strFF = "" Then
                strFF = strf
            Else
                strFF = strFF & ";" & strf
            End If
        rs.MoveNext
        Wend
        OH_closeObj glstrB_VG
        If strFF <> "" Then
            strBody = "Anbei erhalten sie folgende Unterlagen<br><br> " & Replace(Replace(strFF, ";", "<br>"), glstrTempPath, "")
            OH_MailDocument Me, strFF, strBody
            strFD = Split(strFF, ";")
            N = UBound(strFD)
            For Y = 0 To N
                OH_KILL strFD(0)
            Next Y
        End If
    Case 200 '<R86>
        i = OH_InsertID_LST(Me!lstDet, True, True)
        s = "Sie haben links nix markiert." & vbNewLine & vbNewLine & _
            "(Markieren können Sie bis zu 1'000 Vorgänge mit gedrückter SHIFT / CTRL -Taste)." & vbNewLine & vbNewLine & _
            "mit PROJEKTE sind alle zum markierten Vorgang vorhandenen Projekt-Vorgänge betroffen."
        Select Case i
        Case 0
            GoTo ErrM
        Case 1
            s = Replace(s, "nix", "nur EINEN Vorgang")
        Case Else
            s = Replace(s, "nix", i & " Vorgänge")
        End Select
        t = "Aktionen mit links markierten Vorgängen"
        i = OH_msgbox(s, _
                    Array("Als markiert vormerken", _
                          "Vorgänge" & vbNewLine & "<Abgeschlossen>", _
                          "Vorgänge" & vbNewLine & "<in Arbeit>", _
                          "PROJEKTE" & vbNewLine & "<Abgeschlossen>...", _
                          "PROJEKTE" & vbNewLine & "<in Arbeit>..."), _
                    , t, _
                    t & vbNewLine & s)
        Select Case i
        Case 1, 2, 3, 4, 5
            Select Case i
            Case 4, 5
                s = s & vbNewLine & vbNewLine & _
                Replace(strMSG(2), "PROJEKTE", "Projekte in den Status versetzen = ") & vbNewLine & vbNewLine & _
                "Bitte bestätigen, das Sie nicht nur die markierten Vorgänge, sondern auch alle anderen entsprechenden Projekt-Vorgänge manipulieren wollen!"
                If MsgBox(s, vbQuestion + vbDefaultButton2 + vbOKCancel, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End Select
            OH_A "@x = 'linksMarkierte'" & _
                ",@a = " & i
            OH_EX
            OH_RQf Me
            OH_RQ Me!lstVG
            Me!lstVG.SetFocus
        End Select
    Case Else
        OH_EX
        OH_RQf Me
        OH_RQ Me!lstVG
        Me!lstVG.SetFocus
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        Resume ErrEnd
    Case Else
        s = Err & " " & Err.Description
        t = "lstVGIDAct_AfterUpdate"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstVGIDAct_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!lstVGIDAct >= 40 Then
        strSQL = Me!lstVG.Recordset.Source
        OH_EXCEL strSQL, Me!lstVGIDAct.column(1)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstVGIDAct_DblClick"
    Resume ErrEnd
End Sub

Private Sub btnVGAbschluss1_Click()
On Error GoTo ErrMsg
    Dim strE As String
    OH_SaveRS Me
    strE = "Abgeschlossen"
    If Me!VGAbschluss And Me!VGStatus = strE Then
        MsgBox Me!VG & " ist bereits " & strE & "!", vbInformation, Me!btnVGAbschluss1.Caption
    Else
        OH_A "@x='VGAbschluss1', " & _
            " @i = " & Me!NrVG
        OH_EX
        SysCmd acSysCmdSetStatus, Me!pageVorgang.Caption & "  wurde " & strE
        OH_RQf Me
        OH_VGCurrent
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGAbschluss1_Click"
    Resume ErrEnd
End Sub
Private Sub VGSprache_Enter()
On Error GoTo ErrMsg
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGSprache_Enter"
    Resume ErrEnd
End Sub
Private Sub VGSprache_AfterUpdate()
On Error GoTo ErrMsg
'siehe U-Trigger T_VG
    Dim lgid As Long
    lgid = Me!NrVG
    gllg = Nz(Me!VGSprache, "Deutsch")
    Dim strOLD As String
    strOLD = Nz(Me!VGSprache.OldValue, gllg)
    If strOLD Like gllg Then
        If Me.Dirty Then
            Me.Undo
        End If
    Else
        comAnschrift_AfterUpdate
        OH_RQf Me
        OH_FB Me, "nrVG = " & lgid
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGSprache_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub VGPrint_AfterUpdate()
On Error GoTo ErrMsg
    If Me!VGPrint = -1 Then
        Me!SumVGTotA.BackStyle = 1
        Me!SumVGTotA.ForeColor = vbBlack
    Else
        Me!SumVGTotA.BackStyle = 0
        Me!SumVGTotA.ForeColor = 9737364
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGPrint_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub VGSng1_AfterUpdate()
    Dim dblDiff As Double
    If Not IsNull(Me!VGSng1) And Not IsNull(Me!SumVGTot) Then
        dblDiff = Me!VGSng1 - Me!SumVGTot
        If dblDiff <> 0 Then
            MsgBox "Achtung Differenz von" & vbTab & Format(dblDiff, "Standard") & " " & Me!VGWährung & vbNewLine & _
                    "zwischen" & vbNewLine & _
                    "Gesamttotal" & vbTab & vbTab & Me!SumVGTot & vbNewLine & _
                    Me!VGSng1.ControlTipText & vbTab & vbTab & Me!VGSng1, _
                    vbExclamation, "Qualitätsprüfung"
        End If
    End If
End Sub
Private Sub VGStatus_Enter()
On Error GoTo ErrMsg
    Me!VGStatus.Locked = Me!VGStatus = glStrStatus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGStatus_Enter"
    Resume ErrEnd
End Sub
Private Sub StandardText_Enter()
On Error GoTo ErrMsg
    OH_RS_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "StandardText Enter"
    Resume ErrEnd
End Sub
Private Sub VGStatus_GotFocus()
    Me!VGStatus.BackColor = vbWhite
End Sub
Private Sub VGStatus_LostFocus()
    Me!VGStatus.BackColor = Me!VGStatusColor
End Sub

Private Sub WährungKasse_AfterUpdate()
    Me!VGKurs = Nz(Me!WährungKasse.column(1), 1)
End Sub
Private Sub btnVGAbschluss_Click()
On Error GoTo ErrMsg
    Me!VGAbschluss = Not Me!VGAbschluss
    If Me!VGStatus.Enabled Then
        Me!VGStatus.SetFocus
        Me!VGStatus.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGAbschluss_Click"
    Resume ErrEnd
End Sub
Private Sub StandardText_AfterUpdate()
On Error GoTo ErrMsg
    Dim intA As Integer
    'Beschreibung ist MEMO-Feld und kann nicht durch das Kombifeld übertragen werden!
    t = Me!btnStandardText.ControlTipText
    If Len(Nz(Me!vgbem, "")) > 0 Then
        s = "Vorhandenen Text <" & left(Me!vgbem, 10) & "....> überschreiben?"
        intA = MsgBox(s, vbYesNoCancel + vbQuestion, t)
    End If
    x = DLookup("BemLexikon", "T_Lexikon", "NrLexikon = " & Me!StandardText.column(2))
    Select Case intA
    Case vbYes
        Me!vgbem = x
    Case vbNo
        Me!vgbem = left(Me!vgbem, Len(Me!vgbem) - 1) & vbNewLine & x & right(Me!vgbem, 1)
    Case vbCancel
        Exit Sub
    End Select
    Me!VG = Me!StandardText
    If right(Me!StandardText, 18) = "persönlichen Daten" Then
        Me!vgbem = Me!vgbem & "<br><br>" & OH_CheckPersData(Me!NrFunktion)
    End If
    Me!vgbem.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, t
    Resume ErrEnd
End Sub
Private Sub btnStandardText_Click()
On Error GoTo ErrMsg
    OH_Openlexikon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnFirma_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!NrFirma, 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnKunde_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!NrFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnKurs_Click()
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Land"
    OH_FB Forms!PF_Land, "LandKZ= '" & Nz(Me!LandFirma) & "'", "Kurs"
    s = ""
    s = "https://wechselkurse-euro.de/"
    strSQL = "Exec dbo.spa_Lexikon " & _
            " @x = 'CheckBegriffDatabase', " & _
            " @f = 'Währungskurse im WEB', " & _
            " @d = '" & s & "'"
    OH_r r
    s = Nz(r!mldg, s)
    If MsgBox(s & vbNewLine & _
                "WEB-Site mit aktuellen Kursen öffnen?", _
                vbQuestion + vbYesNo, "Kurse im Netz") = vbYes Then
        OH_LaunchURL 1, s
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnVGDat1_Click()
On Error GoTo ErrMsg
    OH_NächsteWartung
    OH_OpenKalender Me!VGDat1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGDat1_Click"
    Resume ErrEnd
End Sub
Private Sub btnVGDat2_Click()
On Error GoTo ErrMsg
    OH_OpenKalender Me!VGDat2
    VGDat2_LostFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGDat2_Click"
    Resume ErrEnd
End Sub

Private Sub NrQK_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strHilfe As String
    Dim iHow As Integer
    Dim lgid As Long
    OH_SaveRS Me
    iHow = 2
    lgid = Nz(Me!NrQK, 0)
    OH_OF "F_QK", lgid
    Set frm = Forms!F_QK
    frm!lstA = 1
    frm!lstDet = 0
    OH_setLst frm!lstDet, lgid '<R62>
    frm.lstDet_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "NrQK_DblClick"
    Resume ErrEnd

End Sub
Public Sub btnVG_Click()
On Error GoTo ErrMsg
    OH_SaveRS Me
    NrQK_DblClick (0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVG_Click"
    Resume ErrEnd
End Sub
Private Sub btnVGStatus_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Vorgang Status"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub comAnschrift_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    comAnschrift_Enter
    OH_A " @x = 'ComAnschrift'" & _
        ", @i = " & Me!NrVG & _
        ", @a = 1 " & _
        ", @f = '" & OH_RPL(Me!comAnschrift.column(2)) & _
        "',@d =  '" & OH_RPL(Me!comAnschrift.column(3)) & _
        "',@s1 = '" & Me!VGSprache & "'"
    OH_EX
    OH_RQf Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub NrMitarbeiter2_Enter()
    strSQL = "Exec dbo.spa_z " & _
            "@x = 'NrMitarbeiter' " & _
            ", @id = " & Nz(Me!NrMitarbeiter2, 0)
    OH_A "NrMitarbeiter2", strSQL, Me
End Sub
Private Sub NrMitarbeiter_Enter()
    strSQL = "Exec dbo.spa_z " & _
            "@x = 'NrMitarbeiter' " & _
            ", @id = " & Nz(Me!NrMitarbeiter, 0)
    OH_A "NrMitarbeiter", strSQL, Me
End Sub
Private Sub NrQK_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If OH_Validate(Me!NrQK, "Vorgangsart", False) = True Then
        Cancel = True
    Else
        Cancel = OH_CheckChange(Me!NrQK, Me)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub NrQK_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_CaptionQK
    regMain_Change

' suche pro Jahr und Vorgang die jeweils nächst höhere Nummer
    If IsNull(Me!VGAbteilung) Then
        OH_A " @X = 'MandantNr', " & _
             " @i = " & EFNrFktn
        OH_r r
        Me!VGAbteilung = r!VGAbteilung
        OH_ResetRS r
    End If
    strSQL = "spI_txt @div = 'ChangeQK'," & _
                     "@qko= " & Me!NrQK.OldValue & "," & _
                     "@qkn= " & Me!NrQK & "," & _
                     "@vgo= " & Me!NrVG & "," & _
                     "@vgn= " & Me!NrVG
    OH_EX
    OH_RQf Me!UF_txt.Form
    If Me!NrQK <> Me!NrQK.OldValue Then  '111008
        Me!VGNr = OH_GetNr("VGNr", Me!NrQK, Me!VGAbteilung, Me!VGdatum)
    End If
    If IsNull(Me!NrFunktion) Then
        Me!comFirma.SetFocus
        Me!comFirma.Dropdown
    Else
        If IsNull(Me!VG) Then
            Me!VG.SetFocus
            Me!VG.Dropdown
        End If
    End If
    MWSt_Enter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub SumVGTotA_Enter()
On Error GoTo ErrMsg
    If Nz(Me!Rabatt) <> Nz(Me!SumVGRabatt) Then
        Me!Rabatt = Me!SumVGRabatt
    End If
    If Nz(Me!Rabatt1) <> Nz(Me!sumVGRabatt1) Then
        Me!Rabatt1 = Me!sumVGRabatt1
    End If
    If Nz(Me!SumVGTotA, 0) <> Nz(Me!SumVGTot, 0) Then
        Me!SumVGTotA = Me!SumVGTot
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub VG_AfterUpdate()
On Error GoTo ErrMsg
    Dim A As Long
    Dim lgP As Long
    Dim lgu As Long
    Dim strA(1 To 3) As String
    Dim strQ As String
    t = "Ändere Titel Projekt-Nr. " & Me!projektNr
    x = OH_RPL(Me!VG.OldValue)
    If x <> Me!VG Then
        OH_A " @x = 'TitelÄndern' " & _
             ", @f = '" & OH_RPL(Me!VG) & _
             "', @d = '" & x & _
             "', @m = " & Me!VGID & _
             ", @n = " & Me!VGIDu
        strQ = strSQL
        OH_r r
        lgP = r!p
        lgu = r!u
        If lgP > 1 Then
            strA(1) = "Nur für diesen Vorgang " & Me!QK & "!"
            strA(2) = "Gesamtes Projekt " & Me!VGID & vbNewLine & _
                        "<" & lgP & "> Datensätze"
            If lgP <> lgu Then
                strA(3) = "Nur im Unterprojekt " & Me!projektNr & vbNewLine & _
                            "<" & lgu & "> Datensätze"
            End If
            If lgP > 5 Then
                strA(2) = strA(2) & "..."
            End If
            OH_msgbox "Sie möchten den Titel ändern??" & vbNewLine & vbNewLine & _
                         "Alter Titel" & vbNewLine & _
                         Space(3) & Me!VG.OldValue & vbNewLine & vbNewLine & _
                         "Neuer Titel" & vbNewLine & _
                         Space(3) & Me!VG, _
                         Array(strA(1), strA(2), strA(3)), _
                         vbQuestion, _
                         t, _
                        "Sie können für das gleiche Projekt <im Beispiel Nr. " & Me!VGID & ">" & vbNewLine & _
                        "unterschiedliche Titel erfassen." & vbNewLine & _
                        "Mit dem 2. Button ändern Sie alle bestehenden Titel dieses Projektes ab!" & vbNewLine & _
                        "Mit dem 3. Button ändern Sie alle bestehenden Titel dieses Unter-Projektes ab!"
            A = Val(strMSG(1))
            Select Case A
            Case 0
                Me.Undo
            Case Else
                If lgP > 5 And A = 2 Then
                    s = Me!VG & vbNewLine & vbNewLine & _
                        "Bitte bestätigen Sie, dass Sie für alle " & lgP & " Vorgänge den Titel ändern möchten!!!!" & vbNewLine & vbNewLine & _
                        "Betroffen ist das ganze Projekt " & Me!VGID
                    If MsgBox(s, vbOKCancel + vbDefaultButton2 + vbExclamation, t) = vbCancel Then
                        GoTo ErrEnd
                    End If
                End If
                OH_SaveRS Me
                strSQL = strQ & _
                        ", @i = " & Me!NrVG & _
                        ", @a = " & A
                OH_EX
                OH_RQf Me
                SysCmd acSysCmdSetStatus, "Titel wurde angepasst: " & Me!VG
            End Select
            Me!VG.SetFocus
        End If
        OH_ResetRS
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, t
    Resume ErrEnd
End Sub
Private Sub VGDat2_LostFocus()
' OHNEMUS, Mittwoch, 15. August 2007
On Error GoTo ErrMsg
    If Not IsNull(Me!VGDat2) Then
        OH_Einleitung Me!VGDat2
        OH_NächsteWartung
        If Nz(Me!VGSng1, 0) = 0 Then
            OH_SaveRS Me
            If Me!VGAbschluss = 0 And InStr(Me!btnVGDat2.Caption, "bezahlt am") > 0 Then '180301
                s = Me!VGSng1.ControlTipText
                If Len(s) > 2 Then
                    s = s & ": " & Me!SumVGTot & " " & Me!VGWährung & vbNewLine & vbNewLine
                End If
                If MsgBox(s & _
                        Me!QK & vbNewLine & _
                        Me!VG & vbNewLine & vbNewLine & _
                        "als erledigt abhaken?", _
                        vbQuestion + vbYesNo, Me!btnVGDat2.Caption) = vbYes Then
                    '100806 wegen Fehlermeldung in Windows 7 korrigiert:
                    OH_A "@x='VGAbschluss1', " & _
                        " @i = " & Me!NrVG, , Me
                    OH_EX
                    OH_RQf Me
                End If
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGDat2_LostFocus"
    End Select
    Resume ErrEnd
End Sub
Private Sub VGDat2_KeyPress(KeyAscii As Integer)
    OH_DatePlusMinus Me!VGDat2, KeyAscii
End Sub

Private Sub VGStatus_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "Vorgang Status", "VGAbschluss"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btn2Unterschrift_Click()
    AdresseSuchen Me!NrMitarbeiter2
End Sub
Private Sub btnSchluss_Click()
On Error GoTo ErrMsg
    OH_Openlexikon Me!btnSchluss.Caption
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub VGID_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!VGID.OldValue <> Me!VGID Then
        s = "Projekt-Nummer ändern, die alle zugehörigen Vorgänge definiert!"
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, _
                 "Projekt-Nr. ändern: " & Me!VGID.OldValue & " ==> " & Me!VGID) = vbCancel Then
            Me!VGID.Undo
            Cancel = True
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGID_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub VGID_AfterUpdate()
On Error GoTo ErrMsg
    regMain_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGID_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub OH_Calcsum(lgVG As Long)
On Error GoTo ErrMsg
    If Not IsNull(Me!NrVG) Then
        Me.SumVGTotA_Enter
        Me!NrQK.SetFocus
        If glsgPreisFaktor <> 1 Then
            s = "Preisfaktor: " & glsgPreisFaktor
            If IsNull(Me!VGInfo) = True Then
                Me!VGInfo = s
            Else
                If InStr(Me!VGInfo, s) = 0 Then
                    Me!VGInfo = s & vbNewLine & Me!VGInfo
                End If
            End If
        End If
        OH_ResetRS r
        OH_SaveRS Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Kalkuliere Summe"
    Resume ErrEnd
End Sub
Private Sub VGWährung_Enter()
    OH_SaveRS Me
    OH_A "VGWährung"
End Sub
Private Sub VGWährungA_Enter()
    OH_A "VGWährungA"
End Sub
Private Sub VGWährung_AfterUpdate() '180508 vorher BeforeUpdate
On Error GoTo ErrMsg
    Dim oldCurr As String, oldRate As Single
    Dim newCurr As String, newRate As Single
    Dim calc As Single
    If IsNull(Me!VGWährung) Then
        Me!VGWährung = "EUR"
    End If
    oldCurr = Nz(Me!VGWährung.OldValue, "keine")
    newCurr = Me!VGWährung
    If Nz(Me!VGWährung.column(1), "") = "" Then
        MsgBox "Für " & Me!VGWährung & " fehlt der Kurs!", vbCritical, "Admin fragen"
        Me.Undo
        Me!VGWährungA = Me!VGWährung
        GoTo ErrEnd
    End If
    If OH_CheckAbschluss Then
        Me!VGWährungA = Me!VGWährung
        GoTo ErrEnd
    End If
    If Not oldCurr Like newCurr Then
        s = "Alt : " & vbTab & oldCurr & vbNewLine & _
                  "Neu :  " & vbTab & newCurr & vbNewLine & vbNewLine & _
                  "Soll mit den Umrechnungsfaktoren neu gerechnet werden?"
        i = MsgBox(s, vbYesNoCancel + vbQuestion, "Achtung Währung ändern?")
        Me!VGWährung.Undo
        Me.Undo
        Select Case i
        Case vbYes, vbNo
            strSQL = "Exec dbo.spI_VGdiv " & _
                        " @x ='Währungsänderung'," & _
                        " @id1 = " & Me!NrVG & " ," & _
                        " @id2 = " & i & "," & _
                        " @c = '" & newCurr & "'"
            OH_EX
            OH_RQf Me
            OH_refreshVGDet Nz(Me!nrVGDet, 0)
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGWährung_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub VGWährungA_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Me!LstArtikel
    VGWährung_Enter
    Me!VGWährung = Me!VGWährungA
    VGWährung_AfterUpdate
    regMain_Change
    Me!LstArtikel = lgid
    lstArtikel_afterupdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGWährungA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub VGDat1_KeyPress(KeyAscii As Integer)
    OH_DatePlusMinus Me!VGDat1, KeyAscii
End Sub

Private Sub VGdatum_KeyPress(KeyAscii As Integer)
    OH_DatePlusMinus Me!VGdatum, KeyAscii
End Sub
Public Sub VGAbteilung_AfterUpdate()
On Error GoTo ErrMsg
    Me!VGNr = OH_GetNr("VGNr", Me!NrQK, Me!VGAbteilung, Me!VGdatum)
    OH_SaveRS
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub VGAbteilung_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgMitarbeiter As Long
    Set ctl = Me!VGAbteilung
    If ctl.OldValue <> ctl And OH_CheckAbschluss = False Then
        i = MsgBox("Möchten Sie wirklich den Mandanten wechseln?", _
                    vbQuestion + vbOKCancel, Me!ANr & " " & Me!VG)
        If i = vbOK Then
            OH_A "@x = 'VGAbteilungChange'" & _
                ",@a = " & Me!NrMitarbeiter.column(5) & _
                ",@i = " & Val(ctl)
            OH_r r
            If r.BOF Then
                i = vbCancel
            Else
                lgMitarbeiter = r!NrFunktion
                Me!NrMitarbeiter = lgMitarbeiter
            End If
        End If
        If i = vbCancel Then
            Cancel = True
            Me.Undo
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Function OH_VGDat(Optional lgR As Long)
On Error GoTo ErrMsg
    Dim strQ As String
    OH_VGDat = False
    'check Freigabe
    If Me!Freigabe > 0 Then
        If Me!Freigabe <= Me!VGDetSum Then
            OH_A "@x = 'Freigabe'" & _
                   ", @i = " & Me!NrVG, , Me
            strQ = strSQL
            OH_r r
            If r.BOF Then
                t = "<Freigabe fehlt>"
                s = "Freigabe-Summe:" & vbTab & Format(Me!Freigabe, "Standard") & vbNewLine & _
                          "Angebots-Summe:" & vbTab & Format(Me!VGDetSum, "Standard") & vbNewLine & vbNewLine & _
                          "Soll Angebot freigegeben werden?"
                x = MsgBox(s, vbYesNoCancel + vbDefaultButton2 + vbExclamation, t)
                If x = vbCancel Then
                    OH_VGDat = True
                End If
                If x = vbYes Then       ' <R44>
                    If InStr(1, Me!FreigabeWer, Trim(left(Me!NrMitarbeiter.column(1), 3))) = 0 _
                        And InStr(1, Me!FreigabeWer, Trim(left(Me!NrMitarbeiter2.column(1), 3))) = 0 Then
                        MsgBox "Sie dürfen nicht freigeben!", vbCritical, strlink1
                    Else
                        strSQL = strQ & ", @a = " & lguser
                        OH_EX
                    End If
                End If
            End If
        End If
    End If
    If DateDiff("D", Me!VGdatum, Date) <> 0 Then
        OH_Hinweis "Hinweis:" & Me!QK & "-Datum <" & Me!VGdatum & ">" & _
                     "entspricht nicht HEUTE"
    End If
        'prüfe, ob Bestellnr ausgefüllt ist
    strSQL = "Exec dbo.spI_VGDiv 'BestellNr'," & _
                                 Me!NrVG
    OH_r r
    If Not r.EOF Then
        If Len(Nz(r(1), "")) < 2 Then
            If MsgBox("Bitte tragen Sie noch diese fehlende Information ein:" & vbNewLine & _
                   "< " & r(0) & " >", vbYesNo + vbInformation, "Kontrolle Bestell-Nr.") = vbYes Then
                OH_VGDat = True
            End If
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Private Sub comVGBem_AfterUpdate()
On Error GoTo ErrMsg
    OH_insertBem Me!comVGBem
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGBem_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comStText_AfterUpdate()
On Error GoTo ErrMsg
    OH_insertBem Me!comStText
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comStText_AfterUpdate"
    Resume ErrEnd
End Sub
Private Function OH_insertBem(ctl As control)
On Error GoTo ErrMsg
    Dim strC As String
    t = ctl.ControlTipText
    If Len(Nz(Me!vgbem, "")) > 0 Then
        s = left(Application.PlainText(Me!vgbem), 80)
        s = "<" & s & "....>" & vbNewLine & vbNewLine & _
                  "Vorhandener Text überschreiben?"
        i = MsgBox(s & vbNewLine & _
                    "Ja" & vbTab & "überschreiben" & vbNewLine & _
                    "Nein" & vbTab & "anhängen", _
                    vbQuestion + vbYesNoCancel, t)
    Else
        i = vbYes
    End If
    If i = vbCancel Then
        GoTo ErrEnd
    End If
    '<R88>
    OH_A "@x = 'InsertBem'" & _
        ", @a = " & Me!NrVG & _
        ", @b = " & ctl.Value & _
        ", @i = " & i & _
        ", @f = '" & ctl.Name & _
        "',@d = '" & glstrFont & "'"
    OH_EX
    OH_RQf Me
    Me!vgbem.SetFocus
    If InStr(Me!vgbem, "persönlichen Daten") > 0 Then
        Me!vgbem = Me!vgbem & "<br><br>" & OH_CheckPersData(Me!NrFunktion)
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strPos As String
    If Me!NrQK = 30 Then
        Me!regd = 4
    Else
        Me!regd = 1
    End If
    DoCmd.openForm "PF_Tab", acFormDS
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Firma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
   Me!lstFirma.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Firma_DblClick"
    Resume ErrEnd
End Sub
Public Sub regMain_Change()
On Error GoTo ErrMsg
    Dim strC As String
    OH_SaveRS Me
    If IsNull(Me!Dat1) Then
        Me!REPreis.BackStyle = 1
    Else
        Me!REPreis.BackStyle = 0
    End If
    Select Case Me!NrQK
    Case 30, 51
        If Me!PageLeistung.Visible = False Then
            Me!PageLeistung.Visible = True
        End If
    Case Else
'        If Me!regd = 3 Then
'            Me!regd = 0
'        End If
        If Me!PageLeistung.Visible = True Then
            Me!PageLeistung.Visible = False
        End If
    End Select
    Me.regd.pages(6).Caption = "Stichworte Vorgang"
    Select Case Me!RegMain.Value
    Case 0
        NrMitarbeiter_Enter
        NrMitarbeiter2_Enter
        Y = 6
        If IsNull(Me!Dat1) = False Then
            Me!btnVGDat1.Caption = Me!Dat1
            Me!VGDat1.ControlTipText = "Datum 1 " & Me!Dat1
        End If
        Me!btnVGDat1.Visible = Not IsNull(Me!Dat1)
        Me!VGDat1.Visible = Not IsNull(Me!Dat1)
        SumVGTotA_Enter
        Me!VGKurs.Visible = Me!WährungDBLand <> Me!VGWährung
        Me!VGKurs.ControlTipText = "aktueller Tages-Kurs " & Me!WährungDBLand & " zu " & Me!VGWährung
        Me!SumVGEURTot.Visible = Me!VGWährung <> "EUR"
        Me!SumVGMLtot.Visible = Me!WährungDBLand <> Me!VGWährung
        Me!WährungDBLand.Visible = Me!SumVGMLtot.Visible
        strC = Nz(Me!Sng1, "-")
        If strC = "-" Then
            Me!VGSng1.Visible = False
        Else
            Me!VGSng1.Visible = True
        End If
        Me!VGSng1.ControlTipText = strC
        For i = 1 To 2
            strC = Nz(Me("Dat" & i), "-")
            If strC = "-" Then
                Me("btnVGDat" & i).Visible = False
                Me("VGDat" & i).Visible = False
                Me("VGDat" & i & "D").Visible = False
            Else
                Me("btnVGDat" & i).Caption = strC
                Me("VGDat" & i).ControlTipText = "Datum " & i & " " & strC
                Me("VGDat" & i & "D").ControlTipText = "Datum " & i & " " & strC & vbNewLine & _
                                                      "Tageseingabe ==> Datum wird automatisch generiert aus dem aktuellen Monat" & vbNewLine & _
                                                      "Doppel-Klick==> heutiges Datum eintragen, wenn noch nichts eingetragen ist"
                Me("btnVGDat" & i).Visible = True
                Me("VGDat" & i).Visible = True
                Me("VGDat" & i & "D").Visible = True
            End If
        Next i
        VGPrint_AfterUpdate
        Me!Rabatt = Me!SumVGRabatt
        DoEvents
        strSQL = "Exec dbo.spa_VG" & _
                " @x = 'UF_TXT' " & _
                ",@i = " & Me!NrVG
        OH_SetRS Me!UF_txt.Form, , strSQL
        If Me!btnVGDat1.Caption = "Nächste Wartung" Then
            s = "Falls der nächste Wartungstermin noch nicht eingetragen ist," & vbNewLine & _
            "wird jetzt hiermit dieser Termin berechnet und eine Wiedervorlage vorgeschlagen!"
        Else
            s = "Öffne Kalender"
        End If
        Me!btnVGDat1.ControlTipText = s
        If blDirty = True Then 'weil sich in den zugeordneten Artikeln was geändert hat, muss aktualisiert werden: eventuell Preisänderung
            blDirty = False
            OH_RQf Me, Me!NrVG
            OH_VGCurrent
        End If
    Case 2
        OH_A "LstArtikel", " @i = " & Me!NrVG, Me
        Me!LstArtikel = Nz(Me!LstArtikel.column(0, 1), 0)
        lstArtikel_afterupdate
        If Me!AnzahlVG.Visible = True Then
            Me!AnzahlVG.SetFocus
            strSQL = strS & "VGDetPreis'" '180729
            OH_A "VGDetPreis", strSQL, Me
        End If
        Me.regd.pages(6).Caption = "Stichworte Artikel"
    End Select
    If Me.regd = 6 Then
        regD_Change
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 5, 2165
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "regMain_Change"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnVGID_Click()      'alle Vorgänge mit gleicher ProjektNr filtern
On Error GoTo ErrMsg
    Me!txtFind = "N:" & Me!projektNr
    txtFind_AfterUpdate
    Me!regd = 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGID_Click"
    Resume ErrEnd
End Sub

Private Sub btnNrMitarbeiter_Click()
    AdresseSuchen Me!NrMitarbeiter
End Sub
Private Sub btnVGDatum_Click()
On Error GoTo ErrMsg
    OH_OpenKalender Me!VGdatum
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGDatum_Click"
    Resume ErrEnd
End Sub
Private Sub OH_CaptionQK()
On Error GoTo ErrMsg
    Dim lgC As Long
    lgC = Nz(Me!QKFarbe, vbWhite)
    Me!VGID.BackColor = lgC
    Me!VGIDu.BackColor = lgC
    Me!NrQK.BackColor = lgC
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 13
        Resume ErrEnd
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_CaptionQK"
        Resume ErrEnd
    End Select
End Sub
Private Sub OH_reCalculate()
' OHNEMUS, Montag, 27. August 2007
On Error GoTo ErrMsg
    t = "Q-Prüfung"
    If Me!VGRabatt > 20 Then
        MsgBox "Rabatt ist grösser als 20 %", vbExclamation, t
        Me!VGRabatt.SetFocus
    End If
    If Me!VGRabatt1 > 20 Then
        MsgBox "Rabatt über alles ist grösser als 20 %", vbExclamation, t
        Me!VGRabatt1.SetFocus
    End If
    If Me!MWSt > 30 Then
        MsgBox "MWSt ist grösser als 30 %", vbExclamation, t
        Me!MWSt.SetFocus
    End If
    SumVGTotA_Enter
    Select Case Me!NrQK
    Case 52 'Kreditor oder Kasse
        Me!VGSng1 = Me!SumVGTotA
        Me!VGDat2 = Me!VGdatum
    End Select
   ' OH_SaveRS Me
    If IsNull(Me!VGDat2) Then
        If Me!VGDat2.Visible Then
             Me!VGDat2.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.OH_reCalculate"
    End Select
    Resume ErrEnd
End Sub
Private Sub VGdatum_Exit(Cancel As Integer)
On Error GoTo ErrMsg
    If Me.Dirty Then
        OH_Einleitung Me!VGdatum
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Function OH_CheckSollHaben() As Boolean
'110308, '2020-06-30' <R123>
On Error GoTo ErrMsg
    t = "Checke Soll und Haben-Konten"
    DoCmd.Hourglass True
    SysCmd acSysCmdSetStatus, t
    strSQL = "Exec dbo.spa_VG " & _
            " @x = 'CheckVG'" & _
            ",@i = " & Me!NrVG & _
            ",@f= 'CheckSollHaben'"
    OH_r r
    Select Case r!txt
    Case ""
    Case Else
        s = Me.pageVorgang.Caption & vbNewLine & vbNewLine & _
            r!txt
        GoTo ErrM
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_CheckSollHaben"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    strCheckUSTID = ""
    GoTo ErrEnd
End Function
Private Sub VG_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!VG, "Projekttitel"
    If Me.Dirty Then
        OH_SaveRS Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGV_Enter"
    Resume ErrEnd
End Sub
Private Sub Schluss_Enter()
    OH_Lex Me!Schluss
End Sub
Private Sub VGV_Enter()
On Error GoTo ErrMsg
    OH_A "VGV"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGV_Enter"
    Resume ErrEnd
End Sub
Private Sub EinleitungV_Enter()
On Error GoTo ErrMsg
    OH_A "EinleitungV"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EinleitungV_Enter"
    Resume ErrEnd
End Sub
Private Sub ComSchluss_Enter()
On Error GoTo ErrMsg
    OH_SaveRS Me
    OH_A "comSchluss"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ComSchluss_Enter"
    Resume ErrEnd
End Sub
Private Sub comSchluss_AfterUpdate()
On Error GoTo ErrMsg
    Dim strSchluss As String
    OH_A "@x = 'SetSchluss'" & _
                ",@i = " & Nz(Me!NrVG, 0) & _
                ",@a = " & Nz(Me!comSchluss, 0)
    OH_EX
    OH_RQf Me, Me!NrVG
    strSchluss = OH_ReplaceTxt(Me!Schluss)
    If strSchluss <> Me!Schluss Then
        Me!Schluss = strSchluss
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comSchluss_AfterUpdate"
    Resume ErrEnd
End Sub
Public Function OH_Hinweis(strHinweis As String)
On Error GoTo ErrMsg
    Me!txtHinweis = strHinweis
    If Len(strHinweis) = 0 Then
        Me!txtHinweis = vbNullString
        Me!NrMitarbeiter.BackColor = vbWhite
        Me!txtHinweis.Tag = 0
    Else
        Me!txtHinweis = strHinweis
        Me!txtHinweis.Tag = Me!NrVG
        Me!NrMitarbeiter.BackColor = vbRed
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Private Sub WährungKasse_GotFocus()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_VG @x = 'VGWährung'"
    OH_A "WährungKasse", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.WährungKasse_GotFocus"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstDet_KeyUp(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Select Case KeyCode
    Case 33, 34, 38, 40
    'Probleme mit Maustasten-Navigation
         OH_SetRS Me, Val(Nz(Me!lstDet.column(0, Nz(Me!lstDet.ListIndex + 1, 1))))
         Me!lstDet.SetFocus
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstDet_KeyUp"
    End Select
    Resume ErrEnd
End Sub
Private Function OH_SaveRecord()
On Error GoTo ErrMsg
    Dim lgVG As Long
    Dim strf As String
    lgVG = Nz(Me!NrVG, 0)
    strSQL = "Select * from T_VG where NrVG=" & lgVG
    OH_r rx, , , rrLockOptimistic
    If rx.BOF Then
        MsgBox "OH_SaveRecord T_VG", vbCritical, "PHILIPP!!!!!"""
    Else
        For i = 1 To rx.Fields.count - 1
            strf = rx.Fields(i).Name
            Select Case strf
            Case "NrVG"
            Case "temphelp"
                rx(strf) = Null
            Case Else
                rx(strf) = Me(strf)
            End Select
        Next i
        rx.Update
        If Me!SollHaben = True Then
            OH_CheckSollHaben
        End If
    End If
    Me.Undo
    OH_SetRS Me, lgVG
    OH_ResetRS rx
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "F_VG OH_SaveRecord"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_Einleitung(ctl As control) As String
On Error GoTo ErrMsg
    Dim strC As String
    Dim strD As String
    If Me.Dirty And Not IsNull(ctl) Then
        strC = "<" & ctl.Name & ">"
        strD = Format(ctl, "dd.mm.yyyy")
        If InStr(Me!Einleitung, strC) Then
            Me!Einleitung = Replace(Me!Einleitung, strC, strD)
        End If
        If InStr(Me!Schluss, strC) Then
            Me!Schluss = Replace(Me!Schluss, strC, strD)
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_Einleitung"
    End Select
    Resume ErrEnd
End Function
Public Function OH_ReplaceTxt(strC As String) As String
On Error GoTo ErrMsg
    Dim dteD As Date
    If InStr(strC, ">") > 0 Or InStr(strC, "xxx") > 0 Then
        If InStr(strC, "<VGdatum>") > 0 Then
            dteD = Me!VGdatum
        End If
        If InStr(strC, "<VGdat1>") > 0 Or InStr(strC, "xxx") Then
            dteD = Nz(Me!VGDat1, Date)
        End If
        If InStr(strC, "<VGdat2>") > 0 Then
            dteD = Nz(Me!VGDat2, 0)
        End If
        strC = Replace(strC, "'", "|")
        strSQL = "Exec dbo.spi_VGdiv" & _
                " @x = 'ReplaceTxt', " & _
                " @id1 = " & Me!NrVG & "," & _
                " @s1 = '" & strC & "', " & _
                " @c = '" & Format(Nz(dteD), "YYYYMMDD") & "'"
        OH_r r
        strC = Replace(Nz(r!replacetxt), "|", "'")
    End If
    OH_ReplaceTxt = strC
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_ReplaceTxt"
    End Select
    Resume ErrEnd
End Function
Public Sub btnArtikelAdd_Click()
On Error GoTo ErrMsg
    Me!LstArtikelAct = 10
    lstArtikelAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "btnArtikelAdd_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnArtikelCopy_Click()
On Error GoTo ErrMsg
    Me!LstArtikelAct = 12
    lstArtikelAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "btnArtikelCopy_Click"
    End Select
    Resume ErrEnd
End Sub
Public Sub lstArtikelAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim strCW As String
    Dim lgC As Long
    Dim lgid As Long
    Dim strTT As String
    Dim lgPos As Long
    Dim strf As String
    Dim strQ As String
    Dim strFN As String
    Dim lgCount As Long
    Dim lgact As Long
    If OH_CheckAbschluss Then
        GoTo ErrEnd
    End If
    lgact = Nz(Me!LstArtikelAct, 0)
    DoCmd.Hourglass True
    If OH_Perm("u", Me, , , Me!NrQK) Then
        GoTo ErrEnd
    End If
    If OH_Perm("u", Me) Then
        GoTo ErrEnd
    End If
    If Me!LstArtikel.ListCount > 0 Then
        lgVGdet = Nz(Me!LstArtikel, 0)
    Else
        lgVGdet = 0
    End If
    If Me!btnVGDetSave.Enabled Then
        btnVGDetSave_Click
        Me!LstArtikelAct.SetFocus
    End If
    strQ = strS & "lstArtikelAct'" & _
        ",@i = " & Nz(Me!NrVG, 0) & _
        ",@a = " & lgact & _
        ",@b = " & lgVGdet
    t = Nz(Me!LstArtikelAct.column(1), "Bitte auswählen!")
    lgC = 9
    strCW = "0;0;12;12;12;80;50;20;5"
    strTT = "Liste der im Vorgang verwendeten Artikel" & vbNewLine & _
           "Wenn rechts ein x ==> Preis des Artikels kommt aus einer Preisliste"
    Select Case lgact
    Case 10, 11, 14, 15, 16 '"Artikel hinzufügen", "Titel hinzufügen","Leerer Artikel hinzufügen
        If OH_Perm("I", Me) Then
            GoTo ErrEnd
        End If
        OH_SaveRS f
        Select Case lgact
        Case 10 '"Artikel hinzufügen"
            DoCmd.openForm "PF_Artikel"
            Set frm = Forms!PF_Artikel
            frm!woher = "Vorgang"
            If Me!NrQK = 31 Then
                frm!Firma.SetFocus
                frm!Firma = Me!Firma
            Else
                frm!ArtikelNr.SetFocus
            End If
            frm.OH_FillIn
        Case 11 '"Titel hinzufügen"
            strSQL = "Exec dbo.spI_VGdiv " & _
                " @x ='AddTitelNr'," & _
                " @id1 = " & Me!NrVG
            OH_r r
            If Not r.BOF Then
                lgVGdet = r(0)
                OH_refreshVGDet lgVGdet
            End If
        Case 14 'Leerartikel anfügen 100626 korrigiert am 140829
            OH_r r, strQ
            lgVGdet = r!ID
            If lgVGdet = 0 Then
                MsgBox "Datensatz wurde nicht erstellt", vbCritical, t
            Else
                OH_refreshVGDet lgVGdet
            End If
        Case 15
            OH_r r, strQ
            MsgBox r!mldg, vbExclamation, t
            OH_refreshVGDet lgVGdet
        Case 16
            If Not OH_isloaded("F_ARTIKEL") Then
                s = "Das Artikel-Formular ist nicht geöffnet"
                GoTo ErrM
            End If
            strSQL = "Exec dbo.spI_VGdiv " & _
                " @x ='NeuArtikelVGdet'" & _
                ", @id1 = " & Forms!F_Artikel!NrArtikel & _
                ", @id2 = " & Me!NrVG
            OH_r r
            lgVGdet = r(0)
            OH_refreshVGDet lgVGdet
            GoTo ErrEnd
        End Select
        OH_RQ Me!LstArtikelAct
    Case 12, 13 '"Artikel kopieren"
        If Nz(Me!nrVGDet, 0) > 0 And Me!LstArtikel.ListCount > 0 Then
            If Me!Position = 0 Then
                strf = "TitelNr"
                strFN = "ArtikelText"
            Else
                strf = "Position"
                strFN = "AnzahlVG"
            End If
            lgPos = OH_NewPosition(strf)
            If lgact = 12 Then
                i = lgPos
            Else
                i = Val(InputBox("Soll die " & strf & "  " & Me!Position & " kopiert werden" & vbNewLine & _
                         "und als neue  " & strf & "  " & lgPos & " hinzugefügt werden?", _
                            "Kopieren einer Position und ans Ende hängen", lgPos))
            End If
            If i > 0 Then
                lgPos = i
                strlink = "NrVGDet= " & Nz(Me!nrVGDet, 0)
                lgVGdet = OH_CopyRS("T_VGDet", strlink, strf, lgPos, True, True)
                OH_CopyRS "T_Stichwort", strlink, "NrVGDet", lgVGdet, True
                'Kopiere die "Kinder" eines Titels auch grad noch : Idee Michael
                If Me!TitelNr > 0 And Me!Position = 0 Then
                    strlink = "NrVG= " & Me!NrVG & _
                                " and TitelNr= " & Me!TitelNr & _
                                " and Position<>0"
                    strf = "TitelNr"
                    lgVGdet = OH_CopyRS("T_VGDet", strlink, strf, lgPos, True, True)
                End If
                OH_refreshVGDet lgVGdet
            End If
        Else
            Me!LstArtikelAct = 10
            lstArtikelAct_AfterUpdate
        End If
    Case 17 'siehe K:\1Firma\SQL\Beschreibungen\Provisorischer Preis.docx
        strSQL = strQ
        OH_EX
        btnRefresh_Click
    Case 20, 21 '"Artikel löschen", "Alle Artikel löschen"
        s = ""
        If Me!LstArtikel.ListCount = 0 Then
            s = "KEINE ARTIKEL vorhanden!"
            GoTo ErrM
        End If
        If Me!VGAbschluss And Me!VGStatus = "DATEV" Then '210617 BB
            s = "Vorgang ist bereits abgeschlossen!"
            GoTo ErrM
        End If
        t = t & " = Entgültig wegnehmen!"
        If DateDiff("d", Me!VGdatum, Date) > 1 Then
            s = s & vbNewLine & vbNewLine & _
                     "ACHTUNG Hinweis: " & Me!QK & " wurde bereits am " & Me!VGdatum & " erstellt!" & vbNewLine & vbNewLine
        End If
        If lgact = 21 Then
            strlink = Nz(Me!Position, 0)
        Else
            s = s & "Mögliche Einstellungen sind:" & vbNewLine & _
                    "Beispiel" & vbTab & "Beschreibung" & vbNewLine & _
                    "2" & vbTab & "Nur die Pos. 2" & vbNewLine & _
                    "3,4" & vbTab & "Pos. 3 und 4 (durch Komma getrennt)" & vbNewLine & _
                    "1-3" & vbTab & "Pos. 1 bis 3" & vbNewLine & _
                    "A" & vbTab & "Alle Positionen" & vbNewLine & vbNewLine
            s = s & "Welche Positionen sollen gelöscht werden?"
            strlink = InputBox(s, t, Me!Position, , 7 * 567)
            If strlink = "" Then
                GoTo ErrEnd
            End If
            strlink = Replace(strlink, "ALLE", "A") '181003
        End If
        lgPos = Me!Position - 1
        strSQL = "spI_Delete " & _
                "  @t= 'T_VGdet'" & _
                ",@a = " & Me!NrVG & _
                ",@l = '" & strlink & "'"
        OH_r r
        lgid = Nz(r!ID, 0) 'input Elena 180703
        SysCmd acSysCmdSetStatus, r!Deleted & " Artikel gelöscht: letzte Aktion um " & Now()
        OH_refreshVGDet lgid
    Case 25
        If lgVGdet = 0 Then
            s = "Sie haben keinen Artikel selektiert!"
            GoTo ErrM
        Else
            s = "EXECUTE spa_VGDet " & _
                    "@x = 'lstArtikelVorgemerkt'" & _
                    ",@i = " & lguser & _
                    ",@b = " & lgVGdet
            strSQL = s & _
                    ",@a = 10"
            OH_EX
            Me!LstArtikelAct.Height = 6 * 567
            Me!lstArtikelVorgemerkt.Visible = True
            OH_A "lstArtikelVorgemerkt", s, Me
        End If
    Case 26 'LAGER-Bestand prüfen...'
        strSQL = strQ
        OH_r r
        i = 0
        s = "INFO über Lagerbestand" & vbNewLine & vbNewLine & _
            "Pos" & vbTab & "Anzahl" & vbTab & "an Lager" & vbTab & "Rüstschein" & vbTab & "Hinweis" & vbNewLine & _
            "===================================="
        While Not r.EOF
            i = i + 1
            s = s & vbNewLine & _
                r!Position & vbTab & r!Anzahl & vbTab & r!LagerMenge & vbTab & r!Rüstschein & vbTab & vbTab & r!LAgerinfo
            r.MoveNext
        Wend
        If i > 0 Then
            s = s & vbNewLine & vbNewLine & _
                "in EXCEL darstellen!"
        End If
        If MsgBox(s, vbInformation + vbYesNo, t) = vbYes Then
            OH_EXCEL strSQL, left("Lagerbestand  " & Me!QK & " " & Me!Firma, 50)
        End If

    Case 31, 32 'Artikel einbuchen / ausbuchen'
        strSQL = "Exec dbo.spa_Lager" & _
                " @x = 'ArtikelbuchenVG'" & _
                ",@a = " & Nz(Me!nrVGDet, 0) & _
                ",@b = " & lguser & _
                ",@i = " & Nz(Me!NrArtikel, 0) & _
                ",@r = " & Replace(Nz(Me!AnzahlVG, 0), ",", ".") & _
                ",@act = " & lgact
        If lgact = 31 Then
            s = "an Lager legen"
        Else
            s = "aus Lager entnehmen"
        End If
        s = "ARTIKEL " & s & vbNewLine & vbNewLine
        If Me!Position = 1 And Me!LstArtikel.ListCount > 5 Then
            s = s & "JA" & vbTab & "Alle " & t & vbNewLine & _
                "NEIN" & vbTab & "Nur Postion 1"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbYes
                strSQL = strSQL & ",@y = " & Me!NrVG
            Case vbCancel
                GoTo ErrEnd
            End Select
        Else
            s = "Position " & Me!Position & vbNewLine & Me!ArtikelText & vbNewLine & vbNewLine & s
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        OH_r r
        lgid = r!ID
        s = "Ergebnis " & t & vbNewLine & r!Msg & vbNewLine & vbNewLine
        If InStr(s, "OK") > 0 Then
            If MsgBox(s & "Buchung anzeigen?", vbQuestion + vbYesNo + vbDefaultButton2, t) = vbNo Then
                OH_refreshVGDet lgVGdet
                GoTo ErrEnd
            Else
                OH_closeObj "PF_Lager"
                DoCmd.openForm "PF_Lager", , , , , , lgid & "F_VG"
            End If
        Else
            GoTo ErrM
        End If
    Case 33, 34 'Artikel ersetzen, Artikel komplett austauschen...
        DoCmd.openForm "PF_Artikel"
        Set frm = Forms!PF_Artikel
        frm!woher = left(Me!LstArtikelAct.column(1), 17)
        frm.Caption = "Aktuell im Vorgang markierte Pos. " & Me!Position & " " & Me!LstArtikelAct.column(1)
    Case 38
        OH_OpenArtikel
    Case 39
        OH_A "LstArtikel", "@i = " & Me!NrVG
        Me!LstArtikel.SetFocus
    Case 40
        OH_A "LstArtikel", strQ
        strCW = "0;70;70;10;20"
        lgC = 6
        strTT = "Aktuellen Preisliste" & vbNewLine & _
               "Wenn links ein x   ==> Der obigen Firma ist diese Preisliste hinterlegt" & vbNewLine & _
               "Wenn links zwei xx ==> Die Artikelpreise basieren auf dieser Preisliste"
    Case 70
        OH_EX strQ
        OH_refreshVGDet lgVGdet
    Case 80
        x = MsgBox("Sie können das Druckbild pro Artikel insofern anpassen," & vbNewLine & _
            "dass Sie den Zeilenabstand zum nächsten Artikel festlegen können." & vbNewLine & _
            "Auch einen Seitenumbruch können Sie hiermit erzwingen!", _
            vbExclamation + vbOKCancel, "Layout beeinflussen")
        If x = vbOK Then
            Me!MoveRecord.SetFocus
            Me!MoveRecord.Dropdown
        End If
    Case 90 'Leistungen...'
        Me.regd = 4
        DoCmd.openForm "PF_Leistung", , , , , , lgVGdet
    Case 100
        Me!lstStichwort.SetFocus
    Case 200 'Check-Formular öffnen'
        DoCmd.openForm "pfrmCheckVG"
    Case 210
        If Me!btnVGDetSave.Enabled Then
            btnVGDetSave_Click
        End If
        s = Me!projektNr
        strQ = "Exec dbo.spa_VG " & _
                    " @x = 'lstVGIDAct'" & _
                    ",@f = '" & s & _
                    "',@a ="
        strSQL = strQ & "9"
        strf = "Projekt <" & s & "> mit Firma " & Me!Firma & " "
        OH_r r
        If r!ID = 0 Then
            s = r!Msg
            s = strf & s
            GoTo ErrM
        Else
            strSQL = strQ & "10"
            s = strf & "jetzt komplett abmelden?"
            If MsgBox(s, vbOKCancel + vbDefaultButton2 + vbQuestion, t) = vbCancel Then
                GoTo ErrEnd
            End If
            OH_EX
            OH_RQf Me
            Me.regd = 0
        End If
    End Select
    Select Case lgact
    Case 40
    Case Is <> 12
        Me!LstArtikelAct = 10      'Artikel hinzufügen
    End Select
    With Me!LstArtikel
        If .ColumnCount <> lgC Then
            .ColumnWidths = OH_ColumnWidthsMM(strCW)
            .ColumnCount = lgC
            .ControlTipText = strTT
        End If
    End With
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstArtikelAct"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstArtikelVorgemerkt_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgVorgemerkt As Long
    Dim lgid As Long
    Dim lgact As Long
    Dim strQ As String
    If OH_CheckAbschluss Then
        GoTo ErrEnd
    End If
    DoCmd.Hourglass True
    If OH_Perm("u", Me) Then
        GoTo ErrEnd
    End If
    lgact = Nz(lstArtikelVorgemerkt, 0)
    lgVorgemerkt = Nz(lstArtikelVorgemerkt.column(1), 0)
    t = "Vorgemerkten Artikel " & Trim(Nz(lstArtikelVorgemerkt.column(4), ""))
    If lgVorgemerkt = 0 Then
        s = "Sie haben keinen vorgemerkten Artikel!" & vbNewLine & _
            "Bitte <Artikel vormerken...> vorher ausführen..."
        GoTo ErrM
    End If
    If lgVorgemerkt = lgVGdet And lgact <> 40 Then
        s = "vorgemerkter und aktueller Artikel sind identisch!"
        GoTo ErrM
    End If

    strQ = "Exec dbo.spA_VgDet " & _
            " @x = 'lstArtikelVorgemerkt'" & _
            ",@b = " & lgVorgemerkt & _
            ",@i = " & lguser & _
            ",@m = " & Me!NrVG
    OH_r r, strQ & " ,@a = 11"
    If r.BOF Then
        s = "Der vorgemerkte Artikel ist nicht mehr vorhanden!"
        GoTo ErrM
    Else
        If lgact <> 40 Then
            s = "Sie können jetzt den vorgemerkten Artikel" & vbNewLine & _
                "Position" & vbTab & vbTab & r!pos & vbNewLine & _
                "Artikel" & vbTab & vbTab & r!txt & vbNewLine & _
                "Bemerkung" & vbTab & r!Bem & vbNewLine & _
                "Einheit" & vbTab & vbTab & r!einheit & vbNewLine & vbNewLine & _
                t
            If r!bestehend = 1 Then
                s = s & vbNewLine & vbNewLine & _
                    "Hinweis: Artikel ist bereits schon zugeordnet (weitere Zuordnungen sind möglich)"
            End If
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
    End If
    strSQL = strQ & _
            ",@a = " & lgact
    If lgact = 40 Then
        OH_EX
        OH_RQ Me!lstArtikelVorgemerkt
    Else
        OH_r r
        lgid = r!IDmax
        OH_RQf Me, Me!NrVG 'muss auch refreshed werden!
        OH_refreshVGDet lgVGdet
    End If
    i = Me!lstArtikelVorgemerkt.ListCount
    If i < 1 Then
        Me!LstArtikelAct.SetFocus
        Me!LstArtikelAct.Height = 9 * 567
        Me!lstArtikelVorgemerkt.Visible = False
    End If
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstArtikelVorgemerkt"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstWvAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstWvAct Me, Me!lstWvAct
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Vorgänge lstWvAct_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub lstWv_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_lstWv_DblClick Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.lstWv_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstWv_Click()
On Error GoTo ErrMsg
    OH_lstWV_CLick Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Adressen lstOutlookAct_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub lstWv_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error GoTo ErrMsg
    Me!lstWv.Tag = x
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VGlstWv_MouseDown"
    End Select
    Resume ErrEnd
End Sub
Private Function OH_NächsteWartung()
On Error GoTo ErrMsg
    Dim strT As String
    strT = "Nächste Wartung"
    If Me!btnVGDat1.Caption <> strT Or Nz(Me!VGDat1, 0) <> 0 Then
        GoTo ErrEnd
    End If
    If IsNull(Me!VGDat1) Then
        If IsNull(Me!VGDat2) Then
            s = "Bitte tragen Sie unter <ausgeführt am> das Datum ein, an dem diese Wartungsarbeit ausgeführt (erledigt) wurde." & vbNewLine & _
            "Dies dient als Grundlage zur Berechnung des nächsten Wartungstermines!"
            Me!VGDat2.SetFocus
            GoTo ErrM
        End If
        strSQL = "Exec dbo.spa_VG " & _
                " @x = '" & strT & _
                "',@i = " & Me!NrVG & _
                ",@dt = '" & Format(Me!VGDat2, "yyyymmdd") & "'"
        OH_r r
        If r!nw <> "" Then
            t = "Wiedervorlage aufgrund des vorgegebenen Intervalles"
            Me!VGDat1 = r!nw
            s = "Wollen Sie für diese Wartung vom " & r!nw & " eine Wiedervorlage erstellen?" & vbNewLine & _
                "Ändern Sie ggf. das vorgeschlagene Wiedervorlage-Datum ab (30 Tage vor dem Wartungstermin)"
            s = InputBox(s, t, Format(r!WV, "dd.mm.yyyy"))
nocheinmal:
            If s = "" Then
                GoTo ErrEnd
            End If
            If IsDate(s) = False Then
                s = s & vbNewLine & _
                    "Bitte ein gültiges Datum eintragen!"
                GoTo nocheinmal:
            End If
            strSQL = "Exec dbo.spa_Adresse " & _
                    "  @x = 'Wiedervorlage'" & _
                    " ,@a = 100 " & _
                    " ,@i = " & Me!NrFunktion & _
                    " ,@u = " & Me!NrMitarbeiter & _
                    " ,@dt = '" & r!WV & _
                    "' ,@d = 'Nächste Wartung'" & _
                    ", @z = " & Me!NrVG
            OH_r r
            If r!ID > 0 Then
                OH_RQ Me!lstWv
            Else
                s = "Wiedervorlage wurde nicht akzeptiert!"
                GoTo ErrM
            End If
        End If
    End If

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_NächsteWartung"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub lstAuditAct_AfterUpdate()
    OH_Audit Me
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
    MsgBox Err & " " & Err.Description, vbCritical, "lstAudit_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnCubeAktualisieren_Click()
On Error GoTo ErrMsg
    Dim N As Long
    DoCmd.Hourglass True
    t = "Cube Daten füllen..."
    With Forms!Menu
        !lstA = 0
        .lstA_DblClick (0)
    End With
    regD_Change
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnCubeAktualisieren_Click"
    Resume ErrEnd
End Sub

Private Sub lstExplorerSource_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    DoCmd.openForm "frmSchlagwort", , , , , , "VG"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.lstExplorerSource_DblClick"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstExplorerSource_AfterUpdate()
On Error GoTo ErrMsg
    OH_A "lstExplorerAct", "@f = '" & Me!lstExplorerSource & "'"
    Me!lstExplorerAct = 7
    OH_CreateCmb Me!lstExplorer, Me!lstExplorerAct, Me
    lstExplorerAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.lstExplorerSource_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub lstExplorerAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim N(1 To 3) As Long
    Dim strQ As String
    Dim strID As String
    Dim strD As String
    Dim strf As String
    Dim strP As String
    Dim strE As String
    Dim strTT As String
    Dim lgCC As Long
    Dim strFilter As String
    Dim strCW As String
    Dim lgRec As Long
    Dim lgVGdet(1 To 100) As Long
    Dim strA(1 To 4)
    Dim vararray As Variant
    Dim strL As String
    Dim strhelp As String

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
    If strD <> "DMS" Then
        strE = OH_StichwortExplorer("explorer", , Me)
    End If
    OH_A "@x = 'lstExplorerAct' " & _
            ",@a = " & lgA & _
            ",@sql = '" & strE & _
            "',@e = '" & Me!lstExplorerSource & _
            "',@f = '" & glDMS & _
            "',@b = " & Me!NrVG & _
            ",@m = " & Me!VGID & _
            ",@i = " & Me!NrFunktion, , Me
    strQ = strSQL
    Select Case lgA
    Case 1, 2, 7, 31
        strFilterExplorer = ""
        Select Case lgA
        Case 1
            If strD <> "DMS" Then
                OH_StichwortExplorer "explorer", , Me
            End If
        End Select

    Case 3, 4
        If Me!lstExplorerSource <> "Windows Explorer" Then
            Me!lstExplorerSource = "Windows Explorer"
        End If
        If lgA = 3 Then
            strE = OH_StichwortExplorer("explorer", , Me)
            If strE <> "" Then
                OH_LaunchFolder 1, strE
            End If
        Else
            OH_Outlook
        End If
        GoTo ErrEnd
    Case 9
        If OH_CheckAbschluss Then
            s = "Der Vorgang ist bereits abgeschlossen!" & vbNewLine & _
                "Dennoch ausführen?"
            If MsgBox(s, vbCritical + vbYesNo + vbDefaultButton2, t) = vbNo Then
                GoTo ErrEnd
            End If
        End If
        Select Case Me!NrQK
        Case 50
            s = "Sollten Sie nicht besser die Rechnung des Kunden als PDF ablegen?" & vbNewLine & _
                "Möchten Sie wirklich diesen Kreditor als PDF erstellen und ablegen??"
            If MsgBox(s, vbCritical + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End Select
        If strhelp <> "Gefilterte Vorgänge zuordnen" Then  '<R16>
            s = "Ablageort = "
            If strD = "DMS" Then
                s = s & "DMS = " & glDMS
            Else
                s = s & "WINDOWS EXPLORER:" & vbNewLine & _
                    strE
            End If
            s = Me!NrQK & " - " & Me!projektNr & " - " & left(Me!Firma, 20) & vbNewLine & vbNewLine & _
                s & vbNewLine & vbNewLine & _
                "Soll ein PDF erzeugt und abgelegt werden?"
            If MsgBox(s, vbYesNo + vbQuestion, t) = vbNo Then
                GoTo ErrEnd
            End If
        End If
        strSQL = "EXEC dbo.DMS " & _
                " @x ='CreateAblagePDF'" & _
                ",@i = " & Me!NrVG & _
                ",@f = '" & Me!QK & _
                "',@s = '" & strD & _
                "',@d = '" & glDMS & "'"
        If glDMS = "ELO" And strD = "DMS" Then
            strSQL = Replace(strSQL, "dbo.DMS ", "dbo.DMS_ELO ")
        End If
        OH_r r
        If strD = "DMS" Then
            strf = glstrTempPath
            If r!Msg = Me!QK Then
                s = "In DMS gibt es bereits ein Dokument <" & Me!QK & ">" & vbNewLine & _
                    "Wollen Sie dennoch ein weiteres Dokument ablegen?"
                If MsgBox(s, vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End If
        Else
            strf = Replace(r!Msg & "\", "YYYY", Year(Me!VGdatum))
            If strf = "C:\Temp\" Then
                strf = OH_explorer & "\"
            End If
            If Len(Dir(strf, vbDirectory)) = 0 Then
                s = strf & vbNewLine & _
                    "Ordner existiert nicht (siehe Texte <+PDF-Ablage> unter QK " & Me!QK & ")"
                GoTo ErrM
            End If
        End If
        If Not OH_isloaded(glstrB_VG, acReport) Then
            OH_PrintReport Me, 1, glstrB_VG
        End If
        strf = strf & Reports(glstrB_VG)!FileN
        OH_KILL strf
        DoCmd.OutputTo acReport, glstrB_VG, OH_GetOutputFormatPDF, strf, False
        If Y = vbYes Then 'Input Dirk 160803
            DoCmd.Close acReport, glstrB_VG
        End If
        OH_ResetID
        strf = OH_RPL(strf)
        strSQL = "EXEC dbo.dms " & _
                "  @x = 'AddtoAblage' " & _
                ", @f ='" & strf & _
                "',@d ='" & OH_GetNamePart(strf) & _
                "',@n = 1 " & _
                ", @i = " & Me!NrFunktion & _
                ", @a = " & Me!NrVG & _
                ", @m = 1"
        OH_r r
        OH_closeObj glstrB_VG, acReport
        OH_FileCopyMove r!nrID, strD, True, strE
        Me!lstExplorerAct = 1
        lstExplorerAct_AfterUpdate
        GoTo ErrEnd
    Case 10, 11, 12, 13, 14
        DoCmd.openForm "frmSchlagwort", , , , , , "VG"
        GoTo ErrEnd
    Case 15 'Gefilterte Vorgänge zuordnen (PDF)'  --<R16>
        i = Me!countRec
        If i > 100 Then
            s = "Bitte reduzieren den Filter (" & i & ")." & vbNewLine & _
                "Mehr als 100 Vorgänge können Sie nicht gleichzeitig zuordnen!"
            GoTo ErrM
        End If
        For lgRec = 1 To Me!countRec
            lgVGdet(lgRec) = Me!lstDet.column(0, lgRec)
        Next lgRec
        strhelp = "Gefilterte Vorgänge zuordnen"
        For lgRec = 1 To Me!countRec
            OH_SetRS Me, lgVGdet(lgRec)
            s = "Gefilterte Vorgänge zuordnen (" & lgRec & " von  " & Me!countRec & ")" & vbNewLine & vbNewLine & _
                Me!pageVorgang.Caption
            Select Case MsgBox(s, vbYesNoCancel + vbQuestion, t)
            Case vbYes
                Me!lstExplorerAct = 9
                lstExplorerAct_AfterUpdate
            Case vbCancel
                GoTo ErrEnd
            End Select
        Next lgRec
        strhelp = ""
    Case 16 '161223
        s = "Projekt-Nr." & vbTab & Me!projektNr & vbNewLine & _
            "Mit diesem Feature können Sie bereits im DMS erfasste Dokumente nachträglich dem aktuellen Vorgang zuordnen!" & vbNewLine & _
            "Voraussetzung ist, dass Sie die korrekte DMS-DokNr. eintragen und dieses Dokument noch nicht verlinkt ist!" & vbNewLine & vbNewLine & _
            "Geben Sie unten bitte die DMS-DokNr. ein."
        i = Val(InputBox(s, t))
        If i = 0 Then
            GoTo ErrEnd
        End If
        OH_RQ Me!lstExplorer, i
        GoTo ErrEnd
    Case 17
        lstExplorer_dblclick (0)
        GoTo ErrEnd
    Case 20
        OH_LaunchProgram 0, glScanFolder
        GoTo ErrEnd
    Case 21
        t = t & " " & Me!NamePerson
        If strID = "" Then
            s = "Bitte das zu versendende Dokumenu anclicken (oder Doppel-Klicken)"
            GoTo ErrM
        End If
        strf = OH_ShowDMSDocument(strID, "SaveDoc")
        If strf <> "" Then
            s = "Das Dokument " & Me!lstExplorer.column(1) & " vom " & Me!lstExplorer.column(2) & vbNewLine & _
                "wird jetzt in Outlook als Attachment gestartet."
            If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
                GoTo ErrEnd
            End If
            OH_OutlookMail _
                Me!EMail, _
                Me!VG, _
                "Anbei " & Me!lstExplorer.column(1) & " " & Me!lstExplorer.column(3) & _
                 "<br><br>", _
                Me!NrFunktion, _
                strf, , , , , Me
                OH_KILL strf
        End If
    Case 25 '--<R19>
        s = "Erstelle eine Liste mit allen gefilterten Vorgängen (" & Me!countRec & ")," & vbNewLine & _
            "die anzeigt, ob die Ablage ins DMS erfolgt ist!"
        If glDMS = "" Then
            s = s & vbNewLine & vbNewLine & _
                "Nur bei DMS-Systemen"
            GoTo ErrM
        End If
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        OH_InsertID_LST Me!lstDet
        OH_A "@x = 'FillIDVG'"
        strf = strSQL
        OH_r r
        While Not r.EOF
            SysCmd acSysCmdSetStatus, r!ID & " " & r!QK
            i = OH_FindDMS(r!ID, r!QK)
            strSQL = strf & _
                    ",@a = 1" & _
                    ",@n = " & r!ID & _
                    ",@i = " & i
            OH_EX
        r.MoveNext
        Wend
        strSQL = strf & _
                ",@a = 2"
        OH_EXCEL strSQL, "INFO DMS"
     Case 30
        t = "Filter im Dateinamen oder Unterordner-Namen"
        s = "Bitte geben Sie unten den gewünschten Suchstring ein"
        strFilterExplorer = InputBox(s, t, strFilterExplorer)
        strFilterExplorer = Replace(strFilterExplorer, "*", "")
        strTT = strTT & vbNewLine & _
                "momentan gesetzter Filter = " & strFilterExplorer
    Case 31, 32
        strFilterExplorer = Nz(lstExplorerAct.column(1), "")
        If strFilterExplorer = "kein Filter" Then
            strFilterExplorer = ""
        End If
    Case 40
        If strID = "" Then
            s = "File muss in der Liste rechts markiert sein!"
            GoTo ErrM
        End If
        If glDMS = "DATEV DMS" Then
            s = "VERBOTEN"
            GoTo ErrM
        End If
        With Me!lstExplorer
            For i = 1 To .ListCount - 1
                If InStr(.column(1, i), "WINDOWS EXPLORER") > 0 Then
                    N(1) = Val(.column(3, i))
                    strE = .column(3, i) & " im WINDOWS EXPLORER..."
                End If
                If InStr(.column(1, i), "DMS = ") > 0 Then
                    N(2) = Val(.column(3, i))
                     strP = .column(3, i) & " in SQL-DB..."
                End If
            Next i
            strA(1) = "nur markiertes File:" & vbNewLine & Me!lstExplorer.column(1)
            vararray = Array(strA(1))
            If N(1) + N(2) > 1 Then
                If N(1) > 0 Then
                    strA(2) = strE
                    vararray = Array(strA(1), strA(2))
                    If N(2) > 0 Then
                       strA(3) = strP
                       strA(4) = "Alle " & N(1) + N(2) & " Files..."
                       vararray = Array(strA(1), strA(2), strA(3), strA(4))
                    End If
               Else
                    vararray = Array(strA(1), strA(2))
                End If
            End If
        End With
        s = "Löschen von Files, die dem Vorgang zugeordnet sind!" & vbNewLine & _
            "ACHTUNG: Löschen heisst unwiderrufliches Entfernen der Dateien!"
        strhelp = "Bitte sorgfäftig überdenken!!!!!" & vbNewLine & _
                 "Gelöschte Files sind weg; für immer!"
        t = "Löschen von Dateien"
        OH_msgbox s, vararray, vbQuestion, t, strhelp
        s = strMSG(2)
        Select Case s
        Case "", "Abbrechen"
            GoTo ErrEnd
        End Select
        If MsgBox(s & vbNewLine & vbNewLine & _
                    "Bitte LÖSCHEN nochmal bestätigen", vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ & _
                ",@n = " & Val(strID)
        If InStr(s, "nur markiertes File:") > 0 Then
            If Val(strID) > 0 Then
                OH_EX
            Else
                OH_KILL strID
            End If
        Else
            If InStr(s, "alle ") > 0 Or InStr(s, "SQL-DB") > 0 Then
                strSQL = strSQL & _
                        ",@u = 1"
                OH_EX
            End If
            If InStr(s, "alle ") > 0 Or InStr(s, "WINDOWS EXPLORER") > 0 Then
                For i = 1 To Me!lstExplorer.ListCount
                    strID = Nz(Me!lstExplorer.column(0, i))
                    If Val(strID) = 0 Then
                        OH_KILL Nz(Me!lstExplorer.column(0, i))
                    End If
                Next i
            End If
        End If
        Me!lstExplorerAct = 7
        lstExplorerAct_AfterUpdate
        GoTo ErrEnd
    Case 50
        s = InputBox("GUID", "erzeuge GUID", OH_GUID)
        GoTo ErrEnd
    Case 99
        strSQL = strQ
        lgCC = 2
        strCW = OH_ColumnWidthsMM("0,10")
        GoTo lstExplorerRequery
    Case Else
        GoTo ErrEnd
    End Select
    strSQL = strQ & _
        ",@d = '" & strFilterExplorer & "'"
    strCW = OH_ColumnWidthsMM("0;90;20;20;70")
    lgCC = 5
    Select Case strD
    Case "DMS"
        Select Case glDMS
        Case "DATEV DMS"
            strf = Me!projektNr
            Select Case Me!lstExplorerAct
            Case 2
                strf = Me!NrVG 'nur Vorgangsdokus
            End Select
            If strFilterExplorer <> "" Then
                s = "Filter für DATEV funktioniert (noch) nicht!"
                GoTo ErrM
            End If
            strSQL = OH_ListDMS(strf, , , strFilterExplorer)
            lgCC = 4
            strCW = OH_ColumnWidthsMM("0;70;20")
        Case "ELO"
            strSQL = "Execute dbo.dms_ELO " & _
                    " @x = 'ELO_Dokliste'" & _
                    ", @a = " & lgA & _
                    ", @i = " & Me!NrVG & _
                    ", @d = '" & Me!projektNr & _
                    "',@f = 'Rechnungswesen'"
            OH_A "lstexplorer", strSQL, Me
            GoTo ErrEnd
        End Select
    End Select
lstExplorerRequery:
    With Me!lstExplorer
        .ColumnCount = lgCC
        .ColumnWidths = strCW
        .ControlTipText = strTT
         OH_A "lstexplorer", strSQL, Me
         If left(Me!lstExplorer.column(1), 9) = "Noch kein" Then
            OH_A "lstExplorerAct", "@f = 'StopAnzeige'", Me
         End If
    End With

ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "F_VG.lstExplorerAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstExplorer_dblclick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strDoc As String
    DoCmd.Hourglass True
    DoEvents '170219 Input Dirk DMS-Dokus werden nicht IMMER angezeigt, vielleicht hilfts ja?!?!
    t = Me!lstExplorer.ControlTipText
    strf = Nz(Me!lstExplorer, "")
    If strf = "" Then
        GoTo ErrEnd
    End If
    Select Case Nz(Me!lstExplorerAct, 0)
    Case 10, 20, 21, 40
        lstExplorerAct_AfterUpdate
    Case Else
        Select Case glDMS
        Case "SQL"
            strDoc = Val(strf)
            If strDoc > 0 Then
                strf = OH_LoadFileFromDB(strDoc)
            End If
            If strf <> "" Then
                OH_LaunchDocument 1, strf
            End If
        Case "ELO"
            OH_ELO_ShowFile Val(strf)
        Case Else
            OH_ShowDMSDocument strf
        End Select
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstExplorer_DblClick"
    Resume ErrEnd
End Sub
Private Sub comVGInfo_GotFocus()
On Error GoTo ErrMsg
    OH_Lex Me!comVGInfo, "VG Info"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGInfo_GotFocus"
    Resume ErrEnd
End Sub
Private Sub comVGInfo_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    If NewLexikonEntry(NewData, "VG INFO", "VGINFO") Then
        OH_InsertVGINfo Nz(NewData, "")
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGInfo_NotInList"
    Resume ErrEnd
End Sub
Private Sub comVGInfo_AfterUpdate()
On Error GoTo ErrMsg
    OH_InsertVGINfo Nz(Me!comVGInfo, "")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGInfo_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnVGInfo_Click()
On Error GoTo ErrMsg
    t = "copy" & vbNewLine
    If left(Me!VGInfo, Len(t)) = t Then
        Me!VGInfo = Replace(Me!VGInfo, t, "")
    Else
        Me!VGInfo = t & Me!VGInfo
    End If
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGInfo_Click"
    Resume ErrEnd
End Sub
Private Function OH_InsertVGINfo(strX As String)
On Error GoTo ErrMsg
    If strX = "" Then
        GoTo ErrEnd
    End If
    If InStr(Me!VGInfo, strX) > 0 Then
        GoTo ErrEnd
    End If
    strX = Format(Now, "dd.mm.yy hh:nn") & " " & strUserKZ & vbNewLine & strX
    If Nz(Me!VGInfo, "") = "" Then
        Me!VGInfo = strX
    Else
        Me!VGInfo = strX & vbNewLine & Me!VGInfo
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_InsertVGINfo"
    Resume ErrEnd
End Function
Private Sub Kontrakt_AfterUpdate()
    lstStatistik_AfterUpdate
End Sub
Private Sub lstStatistik_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Select Case Me!lstStatistik
    Case "Verkauf", "Einkauf"
        If Nz(Me!Kontrakt, 0) = 0 Then
            Me!Kontrakt = Me!VGID
            Me!comStatistikY = "Alle Jahre"
        End If
    Case Else
        Me!Kontrakt = Null
        Me!comStatistikY = Year(Date)
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStatistik_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStatistik_AfterUpdate()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spI_Statistik " & _
            "@x = 'lstStatistikAct'" & _
            ",@f = '" & Nz(Me!lstStatistik, "") & _
            "',@a = 0"
    OH_r r
    OH_A "lstStatistikAct", r!SQL, Me
    Select Case Me!lstStatistikAct
    Case 10, 20
    Case Else
        Me!lstStatistikAct = 10
    End Select
    lstStatistikAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStatistik_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comStatistikY_AfterUpdate()
On Error GoTo ErrMsg
    lstStatistikAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comStatistikY_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstStatistikAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strSQ As String
    Dim strM As String
    Dim strCW As String
    Dim lgCC As Long
nochmalStatistik:
    DoCmd.Hourglass True
    t = Nz(Me!lstStatistikAct.column(1), "") & " KONTRAKT " & Nz(Me!Kontrakt, "??")
    lgid = Nz(Me!lstStatistikDet, 0)
    strSQ = "Exec dbo.spI_Statistik " & _
        " @x = 'lstStatistikAct'" & _
        ",@a = " & Me!lstStatistikAct & _
        ",@i = " & lgid & _
        ",@y = " & Val(Nz(Me!comStatistikY, 0)) & _
        ",@b = " & Nz(Me!Kontrakt, 0) & _
        ",@s1 = '" & Me!lstStatistik & _
        "',@f = '" & Nz(Me!lstStatistik.column(1), "") & "'"
    Select Case Me!lstStatistik
    Case "Verkauf", "Einkauf"
        If Nz(Me!Kontrakt, 0) = 0 Then
            s = "Soll das aktuelle Projekt " & Me!VGID & vbNewLine & _
                "verwendet werden?"
            If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
                GoTo ErrEnd
            Else
                Me!Kontrakt = Me!VGID
                Me!comStatistikY = "Alle Jahre"
                GoTo nochmalStatistik
            End If
        End If
        Select Case Me!lstStatistikAct
        Case 10, 20, 25, 30
            OH_Statistik Me!lstStatistik, Me!lstStatistikAct, strSQ
        Case 40, 50
            i = 0
            Set ctl = Me!lstStatistikDet
            For Each x In ctl.ItemsSelected
                s = Nz(ctl.column(11, x), "JA")
                i = i + 1
                Select Case Me!lstStatistikAct
                Case 40
                    Select Case left(s, 2)
                    Case "", "JA"
                        s = "Bitte nur Artikel in der Liste markieren mit <enthalten> = NEIN"
                        GoTo ErrM
                    End Select
                Case 50
                    Select Case s
                    Case "", "NE" 'NEIN
                        s = "Bitte nur Artikel in der Liste markieren mit <enthalten> = JA"
                        GoTo ErrM
                    End Select
                End Select
                If strM = "" Then
                    strM = ctl.column(0, x)
                Else
                    strM = strM & "," & ctl.column(0, x)
                End If
            Next x
            If i > 1 Or InStr(strM, "Artikel") > 0 Then
                s = i & " Artikel" & vbNewLine & vbNewLine & t
                If InStr(strM, "Artikel") > 0 Then
                    s = s & vbNewLine & vbNewLine & strM
                End If
                If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End If
            strSQL = strSQ & _
                    ", @d = '" & strM & "'"
            OH_EX
            OH_RQ Me!lstStatistikDet
            Me!lstStatistikDet = lgid
        Case 55
            strSQL = strSQ
            OH_EX
            Me!lstStatistikAct = 10
            lstStatistikAct_AfterUpdate
        End Select
    Case "Provisionen 53"
        Select Case Me!lstStatistikAct
        Case 10, 20, 21, 22, 23
            OH_Statistik Me!lstStatistik, Me!lstStatistikAct, strSQ
        End Select
    Case "Kreditor Debitor"
        Select Case Me!lstStatistikAct
        Case 10, 20, 21, 22, 23
            OH_Statistik Me!lstStatistik, Me!lstStatistikAct, strSQ
        End Select
    End Select
    If Me!lstStatistikAct = 60 Then
        strSQL = Me!lstStatistikDet.Recordset.Source & _
               ", @m = 1"
        s = Replace(Replace(Replace(Me!lstStatistikDet.ControlTipText, vbNewLine, "_"), "Liste ", ""), "Jahr ", "")
        OH_EXCEL strSQL, s
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStatistikAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Function OH_Statistik(strSSt As String, lgS As Long, strSQ As String)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strM As String
    Dim strCW As String
    Dim lgCC As Long
    DoCmd.Hourglass True
    strSQL = strSQ
    t = Nz(Me!lstStatistikAct.column(1), "")
    lgid = Nz(Me!lstStatistikDet, 0)
    s = "Liste " & Me!lstStatistik
    If Val(Nz(Me!comStatistikY, 0)) > 0 Then
        s = s & vbNewLine & "Jahr " & Me!comStatistikY
    End If
    If Val(Nz(Me!Kontrakt, 0)) > 0 Then
        s = s & vbNewLine & "Kontrakt " & Me!Kontrakt
    End If
    s = s & vbNewLine & t & vbNewLine
    Select Case strSSt
    Case "Verkauf", "Einkauf"
        Select Case lgS
        Case 10, 20, 25, 30
            strCW = OH_ColumnWidthsMM("0;0;15;15;20;10;45;25;8;20;50")
            lgCC = 14
            Select Case Me!lstStatistikAct
            Case 10
                s = s & "Zusammenfassung pro Artikel"
                strCW = OH_ColumnWidthsMM("0;15;20;100;20")
                lgCC = 5
            Case 20
                s = s & "Diese Artikel haben das Stichwort <Auswertung Kontrakt> mit der Kontrakt-Nr. " & Me!Kontrakt
            Case 25
                s = s & "Artikel OHNE Stichwort <Auswertung Kontrakt> mit der Kontrakt-Nr. " & Me!Kontrakt & vbNewLine & _
                        "Zu sehen sind Artikel des Projektes " & Me!Kontrakt & vbNewLine & _
                        "und der Vorgänge, die <gehört zu Kontrakt> " & Me!Kontrakt & " beinhalten," & vbNewLine & _
                        "mit Art = " & Me!lstStatistik.column(1) & ")"
            Case 30
                s = s & "Artikel mit Stichwort <Auswertung Kontrakt> mit der Kontrakt-Nr. " & Me!Kontrakt & vbNewLine & _
                        "und Artikel des Projektes " & Me!Kontrakt & vbNewLine & _
                        "und der Vorgänge, die <gehört zu Kontrakt> " & Me!Kontrakt & " beinhalten," & vbNewLine & _
                        "mit Art = " & Me!lstStatistik.column(1) & ")"
            End Select
        End Select
    Case "Provisionen 53"
        strCW = OH_ColumnWidthsMM("0;30;30;20;25;25;15;15;15;15;15")
        lgCC = 11
        Select Case lgS
        Case 10
            strCW = OH_ColumnWidthsMM("0;0;30;30;30")
            lgCC = 5
        Case 21, 22, 23
            strSQL = strSQL & ",@d = '" & Me!Firma & "'"
            s = s & vbNewLine & "Projektkunde = " & Me!Firma
            Select Case lgS
            Case 21
                If Me!NrQK <> 53 Then
                    s = "Bitte wechseln Sie zu einem 53-Vorgang, um dessen Firma als Projektkunde zu definieren!"
                    GoTo ErrM
                End If
            Case 22, 23
                strCW = OH_ColumnWidthsMM("0;0;60;30;30;30")
                lgCC = 6
            End Select
        End Select
    Case "Kreditor Debitor"
        strCW = OH_ColumnWidthsMM("0;15;10;10;30;15;10;5;15;15;15;40;15;15")
        lgCC = 14
        Select Case lgS
        Case 10
            strCW = OH_ColumnWidthsMM("0;0;30;30;30;20")
            lgCC = 6
        Case 20
            strCW = OH_ColumnWidthsMM("0;0;30;30;30;20")
            lgCC = 7
        Case 21
            strCW = OH_ColumnWidthsMM("0;0;70;30;30;20")
            lgCC = 6
        End Select
    End Select
    With Me!lstStatistikDet
        OH_A "lstStatistikDet", strSQL, Me
        .ColumnWidths = strCW
        .ColumnCount = lgCC
        .ControlTipText = left(s, 255)
        If .Value = 10 Then
            .BackColor = RGB(215, 255, 200)
        Else
            .BackColor = RGB(225, 245, 255)
        End If
        i = .ListCount
        s = Nz(left(.column(4, i - 1), 1), "")
        If s = "-" Then  'rot soll nur bei "Verkauf", "Einkauf" gezeigt werden (Input Christina)
            Select Case Me!lstStatistik
            Case "Verkauf", "Einkauf"
                .BackColor = vbRed
            End Select
        End If
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description '170926
    t = "OH_Statistik " & strSSt
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Private Sub lstStatistikDet_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strID As String
    strID = Nz(Me!lstStatistikDet.column(0), "")
    Select Case strID
    Case "Aktualisieren"
        Me!lstStatistikAct = 55
        lstStatistikAct_AfterUpdate
    Case Else
        lgid = Val(Nz(Me!lstStatistikDet.column(1), ""))
        If lgid > 0 Then
            OH_SetRS Me, lgid
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStatistik_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Kontrakt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!Kontrakt = Me!VGID
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Kontrakt_DblClick"
    Resume ErrEnd
End Sub
Public Sub btnVGDetSave_Click()
On Error GoTo ErrMsg
    Dim strf As String
    If Me!btnVGDetSave.Enabled = False Then
        GoTo ErrEnd
    End If
    DoCmd.Hourglass True
    lgVGdet = Nz(Me!nrVGDet, 0)
    t = "Artikel im Vorgang speichern"
    If lgVGdet = 0 Or Nz(Me!IdVG, 0) = 0 Then
        s = "Es gibt NIX zum Speichern!"
        SysCmd acSysCmdSetStatus, s
        GoTo ErrEnd
    End If
    If OH_Perm("u", Me, , , Me!NrQK) Then
        GoTo ErrEnd
    End If
    If OH_CheckAbschluss = True Then
        GoTo ErrEnd
    End If
    Me!AnzahlVG = Nz(Me!AnzahlVG, 1)
    Me!Position = Nz(Me!Position, 1) '211230
    Me!RabattVG = Nz(Me!RabattVG, 0)

    If Not IsNull(Me!NrArtikel) Then
        strSQL = strS & "Checkartikel' " & _
            ", @i = " & Me!NrArtikel
        OH_r r
        If Not r.BOF Then
            If glArtikelpreis = True Then
                s = Me!ArtikelText & vbNewLine & vbNewLine
                i = 0
                If Me!EKoVK = -1 Then
                    If r!Einzelpreis = 0 And Me!EinzelpreisVG <> 0 Then
                        i = MsgBox(s & _
                                  "Soll der Einzelpreis des Artikels von 0 auf " & Me!EinzelpreisVG & " geändert werden?", _
                                   vbQuestion + vbYesNo, _
                                   "Artikelpreis ist 0 und kann jetzt angepasst werden!")
                    End If
                Else
                    If r!Einkaufspreis = 0 And Me!EinzelpreisVG <> 0 Then
                        i = MsgBox(s & _
                                  "Soll der Einkaufspreis des Artikels von 0 auf " & Me!EinzelpreisVG & " geändert werden?", _
                                   vbQuestion + vbYesNo, _
                                   "Artikel-Einkaufspreis ist 0 und kann jetzt angepasst werden!")
                    End If
                End If
                If i = vbYes Then
                    strSQL = strSQL & _
                        ",@a = " & Me!EKoVK & _
                        ",@f = '" & Me!VGWährung & _
                        "',@d = '" & Replace(Me!EinzelpreisVG, ",", ".") & "'"
                    OH_EX
                End If
            End If
        End If
        If glsgPreisFaktor <> 1 Then
            Me!txtHinweis = "Es wurde ein Preisfaktor von " & glsgPreisFaktor & " verwendet!" & vbNewLine & _
                            "Siehe Lexikon <genereller Preisfaktor>"
        Else
            If left(Me!txtHinweis, 24) Like "Es wurde ein Preisfaktor" Then
                Me!txtHinweis = Null
            End If
        End If
        If Me!SollHaben = True Then
            Me.OH_CheckSollHaben
        End If
        If Me!Position = 1 Then
            If Me!MWSt = 0 And Me!NrQK = 51 Then
                VarAntw = "CheckMWST"
                MWSt_Enter
            End If
        End If
        If Me!LiefereinheitVG Like "Std." Then
            strSQL = strS & "StdSatz', " & _
                " @i = " & Me!NrVG & "," & _
                " @a = " & lgVGdet
            OH_r r
            If Not r.BOF Then
                s = "Sie haben unterschiedliche " & Me!VGWährung & "-Stundensätze !??" & vbNewLine & _
                            Space(20) & r!EinzelpreisVG & " <> " & Me!EinzelpreisVG & vbNewLine & _
                            "Bitte den Stundensatz eintragen, der für ALLE Positionen gelten soll!" & vbNewLine & _
                            "Falls die Unterschiede OK, bitte Abbrechen verwenden!"
                x = Replace(InputBox(s, "Abgleich der Stundensätze", Me!EinzelpreisVG), ",", ".")
                If IsNumeric(x) Then
                    strSQL = strSQL & "," & _
                            "@f = '" & x & "'"
                    OH_EX
                End If
            End If
        End If
    End If

    strSQL = "Select * from T_VGDet where NrVGdet=" & lgVGdet
    OH_r rx, , , rrLockOptimistic
    If rx.BOF Then
        s = "OH_SaveRecord T_VGDet"
        GoTo ErrM
    Else
        For i = 1 To rx.Fields.count - 1
            strf = rx.Fields(i).Name
            Select Case strf
            Case "NrVGdet"
            Case "nrVG"
                rx(strf) = Me!IdVG
            Case "Temphelp", "PrintMarkerVGdet", "MarkerVGdet", "NrWer", "VGDetProzent"
                rx(strf) = Null
            Case Else
                rx(strf) = Me(strf)
            End Select
        Next i
        rx.Update
        If Me!SollHaben = True Then
            OH_CheckSollHaben
        End If
    End If
    Me!Position.SetFocus
    Me!btnVGDetSave.Enabled = False
    Me!btnVGDetEscape.Enabled = False
    Me!LstArtikel.SetFocus
    OH_refreshVGDet lgVGdet
    blDirty = True
    Me!Position.SetFocus
    Me!btnVGDetSave.Enabled = False
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "btnVGDetSave_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub btnVGDetEscape_Click()
On Error GoTo ErrMsg
    Me!btnVGDetSave.Enabled = False
    Me!btnArtikelAdd.SetFocus
    Me!btnVGDetEscape.Enabled = False
    lstArtikel_afterupdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnVGDetEscape_Click"
    Resume ErrEnd
End Sub
Private Sub btnEinleitungDet_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Einleitungstext Artikel", , , , Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnEinleitungDet_Click"
    Resume ErrEnd
End Sub
Private Sub btnLiefereinheit_Click()
On Error GoTo ErrMsg
    If Me.CurrentRecord > 0 Then
        OH_Openlexikon "Liefereinheit", Nz(Me!LiefereinheitVG, ""), _
                       "An dieser Stelle können Sie die Einheit nicht ändern, da diese beim Artikel hinterlegt ist!", _
                       "LiefereinheitVG", Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.btnLiefereinheit_Click"
    End Select
    Resume ErrEnd
End Sub

Private Sub btnZoom_Click()
On Error GoTo ErrMsg
    If Me.CurrentRecord = 0 Then
        GoTo ErrEnd
    End If
    OH_RT Me!BemVGDet
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "btnZoom_Click"
        Resume ErrEnd
    End Select
End Sub

Private Sub ComTitel_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!comTitel, "Titel Vorgangsdetails", Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.ComTitel_Enter"
    Resume ErrEnd
End Sub
Private Sub ArtikelText_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Titel Vorgangsdetails", , , , Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ArtikelText_DblClick"
    Resume ErrEnd
End Sub
Private Sub EinleitungDet_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!EinleitungDet, "Einleitungstext Artikel", Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.EinleitungDet_Enter"
    Resume ErrEnd
End Sub
Public Function OH_OpenArtikel()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim lgVG As Long
    If Me.CurrentRecord = 0 Then
        GoTo ErrEnd
    End If
    lgA = Nz(Me!NrArtikel, 0)
    If lgA = 0 Then
        MsgBox "Das ist ein <Leer-Artikel>, der nicht gezeigt werden kann!", vbExclamation, "Zeige Artkel " & Me!ArtikelText
    Else
        OH_OF "F_Artikel", lgA
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Private Sub LiefereinheitVG_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgOld As Long
    Dim lgNew As Long
    Dim sgA As Single
    OH_ChangeVGdet
    strSQL = strS & "LiefereinheitWechsel', " & _
        " @f = '" & Me!LiefereinheitVG.OldValue & "'," & _
        " @d = '" & Me!LiefereinheitVG & "'"
    OH_r r
    If Nz(r!Faktor, 0) = 0 Then
        GoTo ErrEnd
    End If
    sgA = Me!AnzahlVG * r!Faktor
    If sgA <> Me!AnzahlVG Then
        i = MsgBox("Alt: " & Me!AnzahlVG & " " & Me!LiefereinheitVG.OldValue & vbNewLine & _
                  "Neu: " & sgA & " " & Me!LiefereinheitVG & vbNewLine & vbNewLine & _
                  "Neu berechnete Anzahl eintragen?", vbQuestion + vbYesNoCancel, _
                  "Änderung der Liefereinheit")
        Select Case i
        Case vbYes
            Me!AnzahlVG = sgA
        Case vbNo
        Case vbCancel
            Cancel = True
            Me!LiefereinheitVG.Undo
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.LiefereinheitVG_BeforeUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub MoveRecord_AfterUpdate()
On Error GoTo ErrMsg
    OH_SaveRS Me
    Me!MoveRecord.SetFocus
    'OH071229
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.MoveRecord_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub MWSTDet_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    t = "Abweichende Mehrwertsteuer!"
    If Not IsNull(Me!MWSTDet) Then
        If Nz(Me!MWSTDet, 0) - Nz(Me!MWSt, 0) = 0 Then
            MsgBox "Tragen Sie hier bitte nur dann die MWST ein," & vbNewLine & _
                    "wenn diese abweicht von der <Haupt>-MWSt " & Me!MWSt & "%", _
                    vbExclamation, t
            Cancel = True
            Me!MWSTDet.Undo
        Else
            If MsgBox("Bestätigen Sie bitte," & vbNewLine & _
                    "dass die MWST (" & Me!MWSTDet & "%) dieses Artikels abweicht von der <Haupt>-MWSt " & Me!MWSt & "%", _
                    vbExclamation + vbYesNo, t) = vbNo Then
                Cancel = True
                Me!MWSTDet.Undo
            Else
                s = "Achtung Pos. " & Me!Position & " enthält abweichende MWST!"
                    If InStr(Me!VGInfo, s) = 0 Then
                        Me!VGInfo = Trim(Me!VGInfo & " " & s)
                    End If
                    OH_ChangeVGdet
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_Open UF_VGDet"
    Resume ErrEnd
End Sub
Private Sub TitelNr_AfterUpdate()
On Error GoTo ErrMsg
    Dim Y As Long
    Dim lgIDVGdet As Long
    Dim lgOldTitelnr
    If Me!TitelNr <> Me!TitelNr.OldValue Then
        If Me!Position = 0 Then
            strSQL = " SELECT * from A_VGDet " & _
                     " Where NrVG = " & Me!NrVG & _
                     " and NrVGDet <> " & Me!nrVGDet & _
                     " ORDER BY Posnr ;"
            OH_r rs, , , rrLockOptimistic
            With rs
                i = 0
                While Not .EOF
                    If lgOldTitelnr <> !TitelNr And !Posnr > 0 Then
                        i = i + 1
                    End If
                    If i = Me!TitelNr Then
                        i = i + 1
                    End If
                    If i <> !TitelNr Then
                        Y = Y + 1
                        !TitelNr = i
                        .Update
                    End If
                    lgOldTitelnr = !TitelNr
                .MoveNext
                Wend
            End With
        Else
            Y = 1
        End If
        If Y > 0 Then
            lgIDVGdet = Me!nrVGDet
            OH_RQf Me
            OH_FB Me, "nrVGDet = " & lgIDVGdet, "TitelNr"
        End If
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "TitelNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub RabattVG_GotFocus()
    If Me!btnVGDetSave.Enabled Then
        btnVGDetSave_Click
        Me!RabattVG.SetFocus
    End If
End Sub
Private Sub RabattVG_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    t = Me!RabattVG & " % Rabatt gewähren"
    i = Me!LstArtikel.ListCount - 4
    If Me!RabattVG > 100 Then
        s = "Nicht mal SIE können mehr als 100% Rabatt gewähren!°"
        GoTo ErrM
    End If
    If i > 1 And Nz(Me!RabattVG, 0) > 0 Then
        s = t & vbNewLine & _
            "für alle " & i & " Artikel anwenden"
        i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
        Select Case i
        Case vbYes
            strSQL = strS & "RabattfürAlle'" & _
                    ",@i = " & Me!NrVG & _
                    ",@a = " & Me!nrVGDet & _
                    ",@dec = '" & Replace(Nz(Me!RabattVG, 0), ",", ".") & "'"
            OH_EX
        Case vbCancel
            Cancel = True
            GoTo ErrEnd
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "Form_F_VG.RabattVG_BeforeUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnRabattVG_Click()
On Error GoTo ErrMsg
    Dim sgRabatt As Single
    Dim lgZ As Long
    Dim strQ As String
    lgZ = vbCritical

    t = Me!btnRabattVG.ControlTipText
    s = "Für diesen Artikel mit ID " & Me!NrArtikel & " ist für" & vbNewLine & _
        Me!Firma & vbNewLine
    strQ = strS & "CheckRabatt'" & _
            ",@a = " & Me!nrVGDet & _
            ",@i = " & Me!NrVG
    OH_r r, strQ
    i = r!CT
    s = r!Msg
    Select Case i
    Case 0
        MsgBox s, vbInformation, t
    Case Else
        If InStr(s, "JA") Then
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        Else
            i = MsgBox(s, vbQuestion + vbOKCancel, t)
        End If
        If i = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ & ",@b = " & i
        OH_EX
        regMain_Change
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "Form_F_VG.btnRabattVG_Click"
    Resume ErrM
ErrM:
    MsgBox s, lgZ, t
    GoTo ErrEnd
End Sub
Private Sub AnzahlVG_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!AnzahlVG) Then
        Cancel = True
        MsgBox "Bei der Anzahl müssen Sie einen Wert eintragen!", vbExclamation, "Vorschlag:1"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.AnzahlVG_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub AnzahlVG_afterUpdate()
On Error GoTo ErrMsg
    Dim strD As String
    If glstrLagerKontrolle <> vbNullString Then
        If Not IsNull(Me!Markervgdet) Then
            i = MsgBox("Achtung, dieser Artikel wurde bereits im Lager abgebucht!" & vbNewLine & _
                    "Da Sie die Anzahl nachträglich geändert haben, sollten Sie im Artikelformular die Buchung manuell korrigieren", _
                    vbExclamation + vbYesNoCancel, "Nachträgliche Änderung der Stückzahl")
            Select Case i
            Case vbYes
                OH_OpenArtikel
                Forms!F_Artikel!LagerMenge.SetFocus
            Case vbNo
            Case vbCancel
                Me!AnzahlVG.Undo
            End Select
        End If
    End If
    'prüfe, ob in BemVGDet ein Datum steht
    strD = left(Application.PlainText(Me!BemVGDet), 10)
    If Not IsDate(strD) Then
        strD = left(strD, 8)
    End If
    If IsDate(strD) Then
        With Me!BemVGDet
            .SetFocus
            .SelStart = 0
            .SelLength = 2
        End With
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.AnzahlVG_afterUpdate"
    End Select
    Resume ErrEnd
End Sub
Public Function OH_NewPosition(strType) As Long
On Error GoTo ErrMsg
    strSQL = strS & "OH_NewPosition'" & _
            ", @i = " & Me!NrVG
    OH_r r
    OH_NewPosition = r!newposition
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.OH_NewPosition"
    End Select
    Resume ErrEnd
End Function
Private Sub SpinButtonAnzahlVG_SpinDown()
    Me!AnzahlVG = Nz(Me!AnzahlVG, 0) - 0.5
    OH_ChangeVGdet
End Sub
Private Sub SpinButtonAnzahlVG_Spinup()
    Me!AnzahlVG = Nz(Me!AnzahlVG, 0) + 0.5
    OH_ChangeVGdet
End Sub
Private Sub VGDetPreis_AfterUpdate()
On Error GoTo ErrMsg
    Dim strT As String
    Dim strB As String
    strT = Nz(Me!VGDetPreis.column(1), "")
    strB = Nz(Me!BemVGDet, "")
    Select Case strT
    Case "Preis anzeigen", "Preis nicht anzeigen:"
        i = Me!LstArtikel.ListCount - 3
        If i > 1 Then
            s = strT & vbNewLine & _
                "für alle " & i & " Artikel anwenden"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
            Select Case i
            Case vbYes
                strSQL = strS & "Preisanzeige'" & _
                        ",@i = " & Me!NrVG & _
                        ",@a = " & Me!nrVGDet & _
                        ",@b = " & Me!VGDetPreis
                OH_EX
            Case vbCancel
                GoTo ErrEnd
            End Select
        End If
    Case ""
        Me!VGDetPreis = 0
    Case Else
        Me!VGDetPreis = 1
        If InStr(strB, strT) = 0 Then
            If strB = "" Then
                strB = strT
            Else
                strB = strB & "<br />" & strT
            End If
        End If
        t = "Manipulation des einzelnen Artikel-Preises"
        s = "Der Preis für Position " & Me!Position & " wird NICHT angezeigt." & vbNewLine & _
           "In den Bemerkungen wird der gewählte Text (wenn nicht schon eingetragen) ergänzt:" & vbNewLine & vbNewLine & _
           strT
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
            Me!BemVGDet = strB
        Else
            Me!VGDetPreis = 0
        End If
    End Select
    OH_ChangeVGdet
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGDetPreis_DblClick"
    End Select
    Resume ErrEnd
End Sub

Private Sub VGDetPreis_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "Preis nicht anzeigen"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGDetPreis_DblClick"
    Resume ErrEnd
End Sub
Private Sub btnWarenGruppe_Click()
On Error GoTo ErrMsg
    Dim strWG As String
    strWG = Nz(Me!WarengruppeDet, "")
    OH_OF "F_Warengruppe"
    Set frm = Forms!F_warengruppe
    frm!txtFind = strWG
    frm.txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.VGDetPreis_DblClick"
    Resume ErrEnd
End Sub
Private Sub WarengruppeDet_AfterUpdate()
On Error GoTo ErrMsg
    Me!Habenkonto = 0
    Me!Sollkonto = 0
    OH_SaveRS Me
    Me!WarengruppeDet.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.WarengruppeDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comTitel_AfterUpdate()
    Me!ArtikelText = Me!comTitel
    OH_ChangeVGdet
End Sub
Public Function OH_ChangeVGdet(Optional blC As Boolean = True)
On Error GoTo ErrMsg
    If blS Then
        blC = False
    End If
    Me!btnVGDetSave.Enabled = blC
    Me!btnVGDetEscape.Enabled = blC
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_VG.OH_ChangeVGDET"
    Resume ErrEnd
End Function
Private Sub Position_Change()
    OH_ChangeVGdet
End Sub
Private Sub EinleitungDet_Change()
    OH_ChangeVGdet
End Sub
Private Sub TitelNr_Change()
    OH_ChangeVGdet
End Sub
Private Sub AnzahlVG_Change()
    OH_ChangeVGdet
End Sub
Private Sub Starttermin_Change()
    OH_ChangeVGdet
End Sub
Private Sub Endtermin_Change()
    OH_ChangeVGdet
End Sub
Private Sub RabattVG_Change()
    OH_ChangeVGdet
End Sub
Private Sub EinzelpreisVG_Change()
    OH_ChangeVGdet
End Sub
Private Sub MWSTDet_Change()
    OH_ChangeVGdet
End Sub
Private Sub ArtikelText_Change()
    OH_ChangeVGdet
End Sub
Private Sub BemVGDet_Change()
    OH_ChangeVGdet
End Sub
Private Sub VGDetTxt1_Change()
    OH_ChangeVGdet
End Sub
Private Sub WarengruppeDet_Change()
    OH_ChangeVGdet
End Sub
Private Sub Habenkonto_Change()
    OH_ChangeVGdet
End Sub
Private Sub Sollkonto_Change()
    OH_ChangeVGdet
End Sub
Private Sub VGDetPreis_Change()
    OH_ChangeVGdet
End Sub
Private Sub MoveRecord_Change()
    OH_ChangeVGdet
End Sub
Private Sub VGDetInfo_Change()
    OH_ChangeVGdet
End Sub
Private Sub VGDetProzent_Change()
    OH_ChangeVGdet
End Sub
Public Sub lstB2BAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    Dim lgid As Long
    Dim lgVG As Long
    Dim strQ As String
    Dim strJ As String
    Dim strJFormat As String
    Dim strProjektNr As String
    DoCmd.Hourglass True
    lgact = Nz(Me!lstB2BAct, 10)
    t = Nz(Me!lstB2BAct.column(1), "") & "  Input B2B NOORD NATIE"
    strProjektNr = Nz(Me!projektNr)
    lgVG = Nz(Me!NrVG, 0)
    lgid = Nz(Me!lstB2B.column(0), 0)
    strQ = "EXECUTE spa_B2B @x ='lstB2BAct'" & _
                            ",@a = " & lgact & _
                            ",@Nrvg = " & lgVG
    Select Case lgact
    Case 30, 59, 69, 99
        GoTo ErrEnd
    Case 10 'Zeige B2B Status
        OH_A "lstB2B", strQ
    Case 11
        If lgid = 0 Then
            s = "Bitte eine Zeile markieren"
            GoTo ErrM
        End If
        strQ = strQ & ",@message_nr = " & lgid
        strSQL = strQ
        OH_r r
        s = r!Msg
        strJ = r!Msgj
        strJFormat = "https://jsonformatter.org"
        s = s & vbNewLine & vbNewLine & _
            "mit  <OK>  " & strJFormat & " öffnen und CTRL V verwenden!"
        If InStr(s, "FeedbackCode:  OK") > 0 Then
            i = vbInformation
        Else
            i = vbCritical
        End If
        t = t & " ID " & r!NrVG
        If MsgBox(s, i + vbDefaultButton2 + vbOKCancel, t) = vbOK Then
            OH_CB strJ
            Application.FollowHyperlink strJFormat
        End If
    Case 37, 51, 60
nochmalB2B:
        Select Case lgact
        Case 37
            s = "Lieferschein"
        Case 51
            s = "Rechnung"
        Case 60
            s = "Lieferschein/Rechnung"
        End Select
        OH_r r, strQ
        i = r!ID
        s = r!Msg
        Select Case i
        Case 0
            GoTo ErrM
        Case -1
            If MsgBox(s, vbCritical + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            Else
                strQ = strQ & ",@f = 'Drop##B2b'"
                GoTo nochmalB2B
            End If
        End Select
        DoCmd.openForm "frmB2B"
        Forms!frmB2B!lstB2BEx.Tag = strQ
    Case 65 'B2B-Aktionen zurücksetzen
        If lgid = 0 Then
            s = "Bitte eine Zeile markieren"
            GoTo ErrM
        End If
        s = "Zugehörige 37er, 51er und 57 werden gelöscht, B2B-Status wird zurückgesetzt"
        If MsgBox(s, vbOKCancel + vbDefaultButton2 + vbExclamation, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ & " ,@f = '" & strProjektNr & "'"
        OH_EX
        OH_RQ Me!lstB2B
    Case 70
        OH_r r, strQ
        OH_IsB2BServiceReady r!url
    Case 100 'Filtere diese Lagerabrufe:'
        s = "Klicken Sie unten die Lagerabrufe an, die links gefiltert werden sollen"
        MsgBox s, vbInformation, t
    Case 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 200, 201, 202
        s = Nz(Me!lstB2BAct.column(1), "")
        strSQL = strQ & ",@f = '" & s & "'"
        OH_r r
        i = r!CT
        If i = 0 Then
            s = "Keine Daten zu " & s
            GoTo ErrM
        End If
        OH_Filter_vwID
        Me!lstB2BAct = lgact
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.lstB2BAct_AfterUpdate"
        Resume ErrEnd
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub lstB2B_DblClick(Cancel As Integer)
    Me!lstB2BAct = 40
    lstB2BAct_AfterUpdate
End Sub
Public Function OH_Filter_vwID()
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    strSQL = "Exec dbo.spa_VG vwID"
    OH_A "lstDet", strSQL, Me
    Me!countRec = Me!lstDet.ListCount
    Me!lstDet.Selected(1) = True
    lstDet_AfterUpdate
    SysCmd acSysCmdSetStatus, "FILTER in Vorgängen mit " & Me!countRec & " Daten"
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "F_VG.OH_Filter_vwID"
        Resume ErrEnd
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub btnRefresh_Click()
On Error GoTo ErrMsg
    Dim strT As String
    strT = "btnRefresh_Click"
    strSQL = "exec spi_VGCalc " & Nz(Me!NrVG, 0)
    OH_EX
    OH_refreshVGDet Nz(Me!nrVGDet, 0)
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, strT
    GoTo ErrEnd
End Sub
