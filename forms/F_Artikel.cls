Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strL As String
Dim lgC As Long
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    OH_A "LstA", , Me
    OH_A "LstAktiv", , Me
    Me!lstAktiv = 10
    OH_A "LstTopA", , Me
    OH_A "LstArtikelKategorie", , Me
    OH_A "NrWarengruppe", , Me
    OH_A "NrFirma", , Me
    OH_A "ComFirma", , Me
    OH_A "ComLager", , Me
    OH_A "Hersteller", , Me
    OH_A "LstC", , Me
    s = "Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern" & vbNewLine & _
        "A: Sucht in Adressen" & vbNewLine & _
        "N: nach Projekt-Nummern" & vbNewLine & _
        "V: nach Vorgängen" & vbNewLine & _
        "S: Suche nach Stichworten" & vbNewLine & _
        "1 Buchstabe==> Anfangsbuchstabe Lieferant" & vbNewLine & _
        "ID:xxx suche nach der ID Artikel xxx"
    Me!txtFind.ControlTipText = s
    If OH_Perm("D", Me, "Stichwort", False) = False Then
        OH_A "@x ='lstc', " & _
            " @a = 1," & _
            " @i = " & lguser, , Me
        OH_r r
        Select Case r!lstC
        Case 20, 30
            Me!lstC = r!lstC
            VarAntw = "nichtBeimLaden"
            lstC_AfterUpdate
            GoTo ErrEnd
        End Select
    End If
    txtFind_AfterUpdate
    OH_SetFontRT Me!BemArtikel
   ' mdl_OH.OH_ListControlProps Me
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Current()
On Error GoTo ErrMsg
    Me!EinkaufspreismitRabatt.Visible = Me!EinkaufspreismitRabatt <> Me!Einkaufspreis
    Me!ArtikelLang.Visible = Me!ArtikelLang <> "" '250729
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2424
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Form_Current"
    End Select
    Resume ErrEnd
End Sub

Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_SyncS Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Form_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Löschbestätigung"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Dim sgLM As Single
    Dim strLO As String
    Dim strLF As String
    t = "Artikel ändern"
    If OH_CheckNotNull(Me) Then
        Cancel = True
        GoTo ErrEnd
    End If
    sgLM = Nz(Me!LagerMenge, 0)
    strLO = Nz(Me!Lagerort, "--")
    If sgLM <> Nz(Me!LagerMenge.OldValue, 0) Or strLO <> Nz(Me!Lagerort.OldValue, "--") Then
        t = t & " Lagerbuchung"
        s = "Lagerbuchung anpassen an" & vbNewLine & _
            strLO & " = " & sgLM & vbNewLine & vbNewLine & _
            "Die Buchungen werden so korrgiert, dass als Gesamtlagermenge = " & sgLM & " erscheint!"
        i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
        Select Case i
        Case vbYes
            If strLO = "--" Then
                strLO = "-"
                strLF = "-"
            Else
                i = InStr(strLO, "-")
                If i > 0 Then
                    strLF = Mid(strLO, i + 1)
                    strLO = left(strLO, i - 1)
                End If
            End If
            strSQL = "EXECUTE spa_Lager @x = 'SaveLager' " & _
                ",@a = " & Me!NrArtikel & _
                ",@b = " & lguser & _
                ",@r = '" & sgLM & _
                "',@f = '" & strLO & _
                "',@w = '" & strLF & _
                "',@d = '" & Format(Date, "yyyymmdd") & "'"
            OH_r r
            s = r!Msg
            If s <> "" Then
                MsgBox s, vbInformation, t
            End If
        Case vbCancel
            Cancel = True
            GoTo ErrEnd
        End Select
    End If
    OH_SaveRecord
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "Artikel Before Update"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!NrFirma) = False Then
        btnLieferant_Click
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub BemArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_RT Me!BemArtikel
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "BemArtikel_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "countRec_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub ArtikelKategorie_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_Openlexikon "ArtikelKategorie", Nz(Me!ArtikelKategorie), "", "ArtikelKategorie", Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.ArtikelKategorie_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub Artikel_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
    If InStr(Me!Artikel, vbNewLine) > 0 Then
        Me!Artikel.ControlTipText = left(Me!Artikel, 255)
    End If
End Sub
Private Sub Artikel_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "Artikel"
    Me!Artikel.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Artikel_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub ArtikelName_AfterUpdate()
    Me!ArtikelNr.SetFocus
End Sub
Private Sub ArtikelName_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "Artikelname", "@f = '" & OH_RPL(Nz(Me!Artikel, "")) & "'"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.ArtikelName_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub ArtikelNr_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "ArtikelNr"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.ArtikelNr_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnArtikelVG_Click()
On Error GoTo ErrMsg
    Dim lgIdArtikel As Long
    DoCmd.Hourglass True
    comArtikelVG_AfterUpdate
    If Me!comArtikelVG < 80 Then
        GoTo ErrEnd
    End If
    lgIdArtikel = Nz(Me!lstVG.column(0), 0)
    t = "Bestellung auslösen"
    If lgIdArtikel = 0 Then
        s = "Bitte einen Artikel markieren"
        GoTo ErrM
    End If
    Select Case Nz(Me!comArtikelVG1, 0)
    Case 0
        Me!comArtikelVG1.SetFocus
        Me!comArtikelVG1.Dropdown
        GoTo ErrEnd
    Case 10 'akt. markierten Artikel
    Case 20 'Alle Artikel markierter Lieferant'
    Case 30 'Alle Artikel'
    End Select
    t = t & " " & Nz(Me!comArtikelVG1.column(1), 0)
    OH_A "@x = 'Bestellvorschlag'" & _
        ",@i = " & lgIdArtikel & _
        ",@n = " & Me!comArtikelVG1
    OH_r r
    s = r!Msg
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
        GoTo ErrEnd
    End If
    strSQL = strSQL & _
        ",@a = 1" & _
        ",@u = " & lguser
    OH_r r
    s = r!Msg
    If r!CT = 0 Then
        GoTo ErrM
    End If
    t = "neue Bestellungen anzeigen"
    s = s & vbNewLine & vbNewLine & t
    If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
        GoTo ErrEnd
    End If
    OH_OF "F_VG", 0, 10
    comLager_AfterUpdate
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "btnArtikelVG_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Public Sub comArtikelVG_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgF As Long
    Dim lgVG As Long
    Dim strM As String
    Dim lgact As Long
    DoCmd.Hourglass True
    t = Nz(Me!comArtikelVG.column(1), "")
    lgact = Nz(Me!comArtikelVG, 0)
    Select Case lgact
    Case 10, 11, 20 'Alle Vorgänge mit diesem Artikel anzeigen ,'Letzter Vorgang pro Firma anzeigen
        OH_A "comArtikelVG1", "@i = " & Me!NrArtikel & _
                    ", @a = " & lgact, Me
        Me!comArtikelVG1.Visible = True
        Me!comArtikelVG1.ListWidth = 4 * 567
        OH_A "lstVG", "@i = " & Me!NrArtikel & _
            ", @a = " & lgact & _
            ", @n = " & Nz(Me!comArtikelVG1, 0)

    Case 30 'Firmen im Adressformular filtern
        If Me!lstVG.ListCount < 1 Then
            s = "Keine Firma gefiltert"
            GoTo ErrM
        End If
        strM = "Standard-Email verwenden"
        If Me!Artikel = "Sicherheitsdatenblatt" Then
            strM = "eMail-Adresse MSDS"
        End If
        s = "Jetzt können Sie folgende Aktionen automatisch ausführen lassen:" & vbNewLine & vbNewLine & _
            "1. Alle betroffenen Firmen im Adress-Formular filtern." & vbNewLine & _
            "2. Email-Bereich öffnen" & vbNewLine & _
            "  dort <" & Me!Artikel & "> im Titel/Betreff eintragen." & vbNewLine & _
            "3. Falls es sich um ein Sicherheitsdatenblatt handelt:" & vbNewLine & _
            "  als Mail-Adressen-Art wird <" & strM & "> eingestellt!" & vbNewLine & _
            "4. Gefundene Mailadressen werden in Bcc eingetragen"
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
            GoTo ErrEnd
        End If
        OH_OF "F_Adresse"
        OH_InsertID_LST Me!lstVG
        strSQL = Me!comArtikelVG.Recordset.Source & ",@a = 3"
        OH_EX
        OH_OF "F_Adresse", , 10
        Set frm = Forms!F_Adresse
        frm!StandardText = Me!Artikel & " " & Me!ArtikelNr & " " & Me!ArtikelName
        frm!comMailArt = strM
        frm!lstTxtMemo = 21
        frm!comEmail = ""
        frm!CC = ""
        frm!bcc = ""
        frm.lstTxtMemo_AfterUpdate
        frm!bcc.SetFocus
        If frm!bcc = "" Then
            s = "Leider keine Mailadressen " & strM & " gefunden"
            GoTo ErrM
        End If
    Case 40, 60 'Einen neuen Vorgang anlegen mit diesem Artikel        Case 60 'Alle gefilterten Artikel bestellen...
        OH_ResetID
        If lgact = 60 Then
            Me!comArtikelVG1.Visible = False
            i = Me!countRec
            s = "Bitte bestätigen, dass Sie die gefilteren Artikel (" & i & ") bestellen möchten."
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                Me!comArtikelVG = 1
                GoTo ErrEnd
            End If
            Me!comArtikelVG1 = 31
            OH_InsertID_LST Me!lstDet
        Else
            OH_InsertID Me!NrArtikel
        End If
        OH_A "@x ='comArtikelVG'" & _
            ",@a = " & lgact & _
            ",@i = " & Me!NrFirma
        OH_r r
        s = r!Msg
        If s <> "OK" Then
            GoTo ErrM
        End If
        lgF = r!NrFunktion
        lgVG = r!NrVG
        OH_OF "F_VG", lgVG
        OH_New
        If OH_isloaded("PF_NeuVG") Then
            Set frm = Forms!PF_NeuVG
            If frm!NrFunktion <> lgF Then
                frm!NrFunktion = lgF
                frm.NrFunktion_AfterUpdate
            End If
            frm!NrQK = Me!comArtikelVG1
            frm.Visible = True
        End If
        strMSG(1) = "ArtikelHinzufügen"
        Me!comArtikelVG = 1
    Case 50 'In allen Vorgängen ersetzen durch...'
        t = Me!ArtikelNr & " " & Me!comArtikelVG.column(1)
        s = t & vbNewLine & _
                 Me!comArtikelVG1.column(1) & " " & Me!comArtikelVG1.column(2)
        i = Me!lstVG.ListCount - 1
        If i < 1 Then
            MsgBox s & vbNewLine & vbNewLine & _
                    "Der Artikel wird bis jetzt noch nicht verwendet!", _
                    vbExclamation, t
        Else
            i = MsgBox(s & vbNewLine & vbNewLine & _
                        "Sind Sie sich ganz sicher?", _
                        vbQuestion + vbOKCancel + vbDefaultButton2, t)
            If i = vbOK Then
                strSQL = "spA_Artikel 'ErsetzeArtikel'," & Me!NrArtikel & "," & Me!comArtikelVG1
                OH_EX strSQL
                OH_RQ Me!lstVG
                i = MsgBox("Soll der nicht mehr benutzte Artikel gelöscht werden?", _
                        vbQuestion + vbYesNo + vbDefaultButton2, t)
                If i = vbYes Then
                    strSQL = "spA_Artikel 'löscheArtikel'," & Me!NrArtikel
                    OH_EX strSQL
                    OH_RQ Me!lstDet
                    lstDet_AfterUpdate
                End If
            End If
        End If
    Case 80, 90 'Bestell-Vorschlagsliste anzeigen',Lieferungen fehlen...
        OH_InsertID_LST Me!lstDet
        OH_A "lstVG", "@a = " & lgact & _
                     ",@b = " & Me!comLager, Me
        OH_A "comArtikelVG1", "@a = " & lgact, Me
        Me!comArtikelVG1.Visible = True
    End Select
    OH_ResetRS r

ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "comArtikelVG_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub comArtikelVG1_AfterUpdate()
On Error GoTo ErrMsg
    comArtikelVG_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comArtikelVG1_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comArtikelVG_DblClick(Cancel As Integer)
    comArtikelVG_AfterUpdate
End Sub
Private Sub comArtikelVG1_DblClick(Cancel As Integer)
    Me!comArtikelVG1 = 0
    comArtikelVG_AfterUpdate
End Sub
Private Sub comTop_AfterUpdate()
    regD_Change
End Sub

Private Sub Einkaufspreis_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!Einkaufspreis) Then
        Me!Einkaufspreis = 0
        MsgBox "Dieses Feld muss ausgefüllt sein; der Wert wird jetzt auf <0> gesetzt!", _
                vbInformation, "Einkaufspreis ist MUSS"
    End If
    OH_SaveRS Me
    Me!ArtikelRabatt.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Einkaufspreis_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub ArtikelRabatt_AfterUpdate()
    OH_SaveRS Me
    Me!PreisFaktor.SetFocus
End Sub
Private Sub ArtikelRabatt_GotFocus()
    OH_Number Me, Me!ArtikelRabatt, 100
End Sub
Private Sub btnKalkVp_Click()
On Error GoTo ErrMsg
    Dim sgKalkVPNew As Single
    Dim sKalkVPNew As String
    Dim sgKalkVPOld As Single
    OH_SaveRS Me
    t = Me!btnKalkVp.ControlTipText
    sgKalkVPOld = Nz(Me!KalkVP, 0)
    s = t & _
        vbNewLine & "Hinweis gerundet wird der VP auf 0.05" & _
        vbNewLine & "ab > 100 = 0.00" & _
        vbNewLine & vbNewLine & "Bisheriger Wert: " & Format(sgKalkVPOld, "#.00") & _
        vbNewLine & vbNewLine & "neuer Wert:"
    sKalkVPNew = InputBox(s, t, sgKalkVPOld)
    If sKalkVPNew = "" Then
        GoTo ErrEnd
    End If
    sgKalkVPNew = sKalkVPNew
    If sgKalkVPNew = sgKalkVPOld Then
        GoTo ErrEnd
    End If
    sKalkVPNew = Replace(sKalkVPNew, ",", ".")
    OH_A "@x = 'KalkVPNeu'" & _
        ",@i = " & Me!NrArtikel & _
        ",@dec = '" & sKalkVPNew & "'"
    OH_r r
    If r!Msg = 1 Then
        OH_RQf Me
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Select Case Err
    Case 13
        s = "Bitte eine Zahl eingeben"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub LagerMenge_Enter()
    OH_Number Me, Me!LagerMenge 'OA 180402
End Sub
Private Sub LagerMindestMenge_Enter()
    OH_Number Me, Me!LagerMindestMenge
End Sub
Private Sub lstArtikelAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim c As control
    Dim N As Long
    Dim strA As String
    Dim strB As String
    Dim strf As String
    DoCmd.Hourglass True
    Set ctl = Me!LstArtikel
    Set c = Me!LstArtikelAct
    lgid = Nz(ctl, 0)
    t = Nz(c.column(1), "Keine ID")
    Select Case Val(c)
    Case Is < 20
    Case Else
        If lgid = 0 Then
            s = "Bitte in der Liste rechts einen Artikel markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case c
    Case Is < 20
        If OH_Perm("I", Me) Then
            GoTo ErrEnd
        End If
        DoCmd.openForm "PF_Artikel"
        Set frm = Forms!PF_Artikel
        frm!woher = "ArtikelZuord"
        frm.Caption = "Hinzufügen als " & t
    Case 20
        lgid = Nz(Me!LstArtikel.column(1), 0)
        OH_OF "F_Artikel", lgid
    Case 30, 31, 32, 33, 34
        strA = "lfd. Nr. " & ctl.column(2) & ": " & vbNewLine & _
        ctl.column(4) & vbNewLine & ctl.column(5) & vbNewLine & ctl.column(6) & vbNewLine & vbNewLine
        t = "Zuordnung ändern " & t
        lgid = Me!NrArtikel
        OH_A "@x = 'lstArtikelAct'" & _
            ", @i = " & lgid & _
            ", @a = " & c & _
            ", @b = " & ctl
        Select Case c
        Case Is <= 31
            c = 31
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
        Case 32, 33
            If c = 32 Then
                strB = Nz(ctl.column(3))
                strf = "Anzahl"
            Else
                strB = Nz(ctl.column(10))
                strf = "Bemerkung"
            End If
            s = "Bitte " & strf & "  eintragen für" & vbNewLine & _
                strA
            s = InputBox(s, t, strB)
            If StrPtr(s) = 0 Then
                GoTo ErrEnd
            End If
            If c = 32 Then
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
        Case 34
            OH_EX
            OH_RQ ctl
        End Select
    Case 40, 41
        If OH_Perm("d", Me, "Zuord") Then
            GoTo ErrEnd
        End If
        If MsgBox("Zuordnung zu" & vbNewLine & _
                   Me!Artikel & "" & Me!ArtikelNr, _
                   vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        If c = 41 Then
            lgid = Me!NrArtikel
        End If
        OH_A "@x ='lstArtikelAct'," & _
             "@i = " & lgid & "," & _
             "@a = " & c
        OH_EX
        OH_RQ Me!LstArtikel
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstArtikelAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstRabatt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstRabattAct = 10
    lstRabattAct_AfterUpdate
    Forms!F_Adresse!LstArtikelAct = 50
    Forms!F_Adresse!LstArtikel.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstRabatt_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstRabattEbene_Afterupdate()
On Error GoTo ErrMsg
    OH_A "lstRabatt", _
        "@w = '" & Nz(Me!lstRabattEbene, "Warengruppe") & _
        "',@i =" & Me!NrArtikel & _
        ",@b = " & Me!NrWarengruppe _
        , Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstRabattEbene_Afterupdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub lstRabattAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgFirma As Long
    Dim lgact As Long
    Dim N As Long
    Dim lgWarengruppe As Long
    Dim strEbene As String
    Dim strA As String
    Dim strR As String
    Dim strf As String
    Dim strQ As String
    DoCmd.Hourglass True
    lgWarengruppe = Nz(Me!NrWarengruppe)
    strEbene = Nz(Me!lstRabattEbene, "Warengruppe")
    Set ctl = Me!lstRabatt
    lgact = Nz(Me!lstRabattAct, 0)
    lgid = Nz(ctl.Value, 0)
    t = Nz(Me!lstRabattAct.column(1), "Keine ID")
    OH_A "@x = 'lstRabattAct' " & _
            ",@a = " & lgact & _
            ",@i = " & lgid & _
            ",@w = '" & strEbene & "'", , Me
    strQ = strSQL
    Select Case lgact
    Case 20
    Case Else
        If lgid = 0 Then
            s = "Bitte in der Liste rechts eine Zeile markieren!"
            GoTo ErrM
        End If
    End Select
    Select Case lgact
    Case 10
        lgid = Nz(Me!lstRabatt.column(1), 0)
        OH_OF "F_Adresse", lgid
    Case 20, 30
        i = vbYes
        If lgact = 20 Then
            If OH_isloaded("F_Adresse") Then
                Set f = Forms!F_Adresse
                If f!FP = 0 Then
                    s = "Bitte öffnen Sie das Adress-Formular und filtern nach dem gewünschten Kunden und nicht nach einer Person:" & vbNewLine & _
                        f!namen
                    If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                        DoCmd.openForm "F_Adresse"
                    End If
                    GoTo ErrEnd
                End If
            Else
                s = "Bitte öffnen Sie das Adress-Formular und filtern nach dem gewünschten Kunden"
                If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                    DoCmd.openForm "F_Adresse"
                End If
                GoTo ErrEnd
            End If
            lgFirma = f!NrFunktion
            s = "Bitte bestätigen Sie, dass Rabatte gewährt werden sollen für den momentan aktuell geöffneten Kunden" & vbNewLine & vbNewLine & _
                "JA" & vbTab & f!namen & vbNewLine & _
                "Nein" & vbTab & "anderer Kunde im Adress-Fenster filtern"
            i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
        End If
        Select Case i
        Case vbYes
        Case vbNo
            DoCmd.openForm "F_Adresse"
            GoTo ErrEnd
        Case vbCancel
            GoTo ErrEnd
        End Select
        strSQL = strQ & " , @n = " & lgFirma & _
                            ", @u = " & Me!NrArtikel & _
                            ", @b = " & lgWarengruppe
        OH_r r
        i = r!CT
        If i = 0 Then
            s = "Keine Rabatte für Firma " & r!Firma
            GoTo ErrM
        End If
        DoCmd.openForm "PF_Rabatt"
    Case 40, 41
        s = "Artikel " & Me!Artikel & vbNewLine & _
            "Bitte bestätigen, dass Sie "
        If lgact = 40 Then
            s = s & "den aktuell markierten Rabatt entfernen wollen" & vbNewLine & _
                "Kunde = " & ctl.column(2)
        Else
            s = s & "alle Rabatte des Artikel entfernen wollen"
        End If
        i = MsgBox(s, vbOKCancel + vbDefaultButton2 + vbExclamation, t)
        If i = vbOK Then
            If strEbene = "Artikel" Then
                lgid = Nz(Me!NrArtikel, 0)
            Else
                lgid = Nz(Me!NrWarengruppe, 0)
            End If
            strSQL = strQ & _
                    ",@n = " & N & _
                    ",@b = " & lgid
            OH_EX
            OH_RQ ctl, lgid
        End If
    Case 50, 51, 52, 53
        strSQL = strQ & _
            ",@n = " & Me!NrArtikel & _
            ",@b = " & Me!NrWarengruppe
        OH_EXCEL strSQL, "Rabatt-Liste " & Trim(t)

    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstRabattAct_AfterUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstLager_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_closeObj "PF_Lager"
    Me!lstLagerAct = 11
    lstLagerAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstLager_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstLagerAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgI As Long
    Dim lgact As Long
    Dim strA As String
    Dim strC As String
    Dim strT As String
    Dim strOLD As String
    Dim strQ As String
    Dim ctld As control
    Set ctld = Me!lstLager
    lgact = Nz(Me!lstLagerAct, 0)
    lgid = Nz(Me!lstLager.column(0), 0)
    lgI = Nz(Me!NrArtikel, 0)
    strQ = "EXECUTE spa_lager @x = 'lstlagerAct',@b = " & lgact & ",@i = " & lgI
    t = Nz(Me!lstLagerAct.column(1), "")
        OH_closeObj ("PF_Lager")
        Select Case lgact
        Case 10, 20 'an Lager legen, vom LAger nehmen
            DoCmd.openForm "PF_lager", , , , , , Nz(Me!NrArtikel, 0) & "|" & lgid & "|ArtikelLagerbuchung"
            With Forms!PF_lager
                Select Case lgact
                Case 10
                    !EinAus = 1
                Case 20
                    !EinAus = -1
                Case 31
                    !EinAus = 0
                End Select
            End With
        Case 21 'verschieben...'
            strSQL = strQ
            OH_r r
            If r.BOF Then
                s = "Der Artikel mit ID = " & lgI & "  liegt NICHT an Lager!"
                GoTo ErrM
            End If
            s = "Menge Lagerort" & vbNewLine & _
                OH_Replicate("=", 20) & vbNewLine
            i = 0
            OH_ResetID
            While Not r.EOF
                i = i + 1
                s = s & r!m & OH_Replicate(" ", 10) & r!LO & vbNewLine
                strT = r!LO
                OH_InsertID i, strT 'Lagerfächer, die inaktiviert werden sollen, in T_ID zwischenspeichern
                If strOLD = "" Then
                    strOLD = strT
                Else
                    strOLD = strOLD & ";" & strT
                End If
            r.MoveNext
            Wend

            s = "Hiermit verschieben Sie ALLE an Lager liegenden Artikel mit der ID " & lgI & vbNewLine & _
                "in das Lager <X>" & vbNewLine & _
                "Der Artikel wird hier ausgebucht (Lager ggf. inaktiv setzen):" & vbNewLine & _
                s & vbNewLine & _
                "und in das neue Lager mit der entsprechenden Menge eingebucht." & vbNewLine & vbNewLine & _
                "ändere in einen bestehende(oder auch neuen) Lagerort/-Fach (durch Bindestrich getrennt):"
nochmalverschieben:
                x = OH_msgbox(s, _
                        Array("Verschieben", "Verschieben u. inaktiv setzen" & vbNewLine & strOLD, "Abbrechen"), _
                        vbQuestion, _
                        "Standardtext aus Lexikon übernehmen", _
                        , strT)
            Select Case Val(x)
            Case 1, 2
                strA = strMSG(4)
                Select Case strA
                Case ""
                    SysCmd acSysCmdSetStatus, t & " abgebrochen"
                    GoTo ErrEnd
                Case Else
                    s = s & vbNewLine & "anderen Lagerort eintragen!"
                    If InStr(strOLD, strA) > 0 Then
                        GoTo nochmalverschieben
                    End If
                End Select
                If InStr(strA, "-") = 0 Then
                    s = s & vbNewLine & "Bitte Lagerort und -fach mit einem Bindestrich trennen"
                    GoTo nochmalverschieben
                End If
                strSQL = strQ & _
                        ",@n = 1 " & _
                        ",@d  = '" & OH_RPL(strA) & "'"
                OH_r r
                If r.BOF Then
                    s = "<" & strA & "> gibt es noch nicht als Lagerort/-fach." & vbNewLine & _
                        "Verschiebung dorthin dennoch vornehmen?"
                    If MsgBox(s, vbQuestion + vbDefaultButton2 + vbOKCancel, t) = vbCancel Then
                        GoTo ErrEnd
                    End If
                End If
                strSQL = strQ & _
                        ",@n = 2 " & _
                        ",@d  = '" & OH_RPL(strA) & "'"
                OH_r r
                If r!CT = 0 Then
                    s = "Keine Umbuchungen erfolgt"
                    GoTo ErrM
                End If
                OH_RQ Me!lstLager
                If Val(x) = 2 Then 'Geräumte Lagerort(e) inaktiv setzen
                    strSQL = "EXECUTE dbo.spa_Artikel_LstL " & _
                                " @x = 'lstl'" & _
                                ",@a = 81 " & _
                                ",@b = 301 " & _
                                ",@y = 7"
                    OH_EX
                End If
            Case 3
                GoTo ErrEnd
            End Select
        Case 30 'Buchung ändern
            If lgid = 0 Then
                s = strA
                GoTo errm0
            Else
                DoCmd.openForm "PF_lager", , , , , , lgid & "F_Artikel"
            End If
        Case 31 'Inventur
            DoCmd.openForm "PF_lager", , , , , , Me!NrArtikel & "Inventur"
        Case 40 'Buchung löschen
            If lgid = 0 Then
                s = strA
                GoTo errm0
            End If
            strSQL = "EXECUTE spa_Lager @x='GetLagerbestand'" & _
                ",@a = " & lgid
            OH_r r
            If r!Menge < r!EinzelMenge Then
                s = "Diese Buchung können Sie nicht löschen, da sonst die Gesamt-Lagermenge auf MINUS geht!"
                GoTo ErrM
            End If
            s = "markiert ist Buchung vom: " & ctld.column(1) & vbNewLine & _
                "Menge: " & ctld.column(2) & vbNewLine & _
                "Lagerort: " & ctld.column(3) & "-" & ctld.column(4) & vbNewLine & vbNewLine & _
                     "Löschen mit JA bestätigen" & vbNewLine & vbNewLine & vbNewLine & _
                    "Zum Löschen ALLER Buchungen <JA ALLE> eingeben!"
            i = OH_JA
            If i <> 0 Then
                strSQL = "EXECUTE spa_Lager @x='deleteLager'" & _
                        ", @i = " & lgid & _
                        ", @a = " & lgI & _
                        ",@b = " & i
                OH_EX
                OH_RQ Me!lstLager
            End If
        Case 50
            s = "Bitte jetzt einen Artikel-Barcode abschiessen" & vbNewLine & _
                "oder einen Artikel-Barcode (ALxxxxxx) eingeben."
            s = InputBox(s, "BARCODE-Suche", "ALxxxxx")
            If s <> "" Then
                lgid = Val(Replace(s, "AL", ""))
                If lgid > 0 Then
                    OH_SetRS Me, lgid
                End If
            End If
        End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstBuchungAct_AfterUpdate"
    Resume ErrEnd
errm0:
    s = "Bitte den entsprechenden Datensatz rechts markieren!"
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstLagerAllAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim N As Long
    Dim lgI As Long
    Dim lgact As Long
    Dim strA As String
    Dim strC As String
    Dim strT As String
    Dim strOLD As String
    Dim strQ As String
    Dim ctld As control
    Set ctld = Me!lstLAgerAll
    lgact = Nz(Me!lstLagerAllAct, 0)
    lgid = Val(Nz(Me!lstLAgerAll.column(0), 0))
    Dim strLO As String
    strLO = Nz(Me!lstLAgerAll.column(0), "")
    strQ = "EXECUTE spa_Lager @x = 'lstLagerAllAct',@b = " & lgact
    strSQL = strQ & _
        ", @f = '" & OH_RPL(strLO) & "'"
    Select Case lgact
    Case 10
        Me!lstLagerAllAct.Tag = 1
        OH_A "lstLAgerAll", strSQL
    Case 20
        Me!lstLagerAllAct.Tag = 2
        OH_A "lstLAgerALL", strSQL
    Case 30
        strSQL = strSQL & _
            ",@y = " & Val(Me!lstLagerAllAct.Tag)
        OH_A "lstDet", strSQL
        Me!txtFind = Null
        Me!countRec = Me!lstDet.ListCount
        'Me!countRec.BackColor = vbGreen
        Me!countRec.BackColor = 9498256 'Green EO 191208
    Case 100, 101    'Lagerort umbenennen...'
        t = t & " " & Me!lstLAgerAll
        If lgact = 100 Then
             If Val(Me!lstLagerAllAct.Tag) <> 1 Then
                s = "hierzu muss  <Alle Lagerorte> ausgewählt sein."
                If MsgBox(s, vbOKCancel + vbInformation, t) = vbOK Then
                    Me!lstLagerAllAct = 10
                    lstLagerAllAct_AfterUpdate
                End If
                GoTo ErrEnd
             End If
             s = "Bitte geben Sie unten den gewünschten Lagerort ein"
nochmalLagerort:
            strA = InputBox(s, t, Me!lstLAgerAll)
            Select Case strA
            Case Me!lstLAgerAll
                s = s & vbNewLine & "Bitte einen anderen Lagerort eintragen"
                GoTo nochmalLagerort
            Case ""
                GoTo ErrEnd
            End Select

        End If
        If lgact = 101 Then     'Lagerfach umbenennen...'
            t = t & " " & Me!lstLAgerAll
            If Val(Me!lstLagerAllAct.Tag) <> 2 Then
                s = "hierzu muss  <...mit Lagerfach> ausgewählt sein."
                If MsgBox(s, vbOKCancel + vbInformation, t) = vbOK Then
                    Me!lstLagerAllAct = 20
                    lstLagerAllAct_AfterUpdate
                End If
                GoTo ErrEnd
            End If
            s = "Bitte geben Sie unten den gewünschten Lagerort mit -fach ein"
nochmalLagerfach:
            strA = InputBox(s, t, Me!lstLAgerAll)
            Select Case strA
            Case Me!lstLAgerAll
                s = s & vbNewLine & "Bitte ein anderes Lagerfach eintragen"
                GoTo nochmalLagerfach
            Case ""
                GoTo ErrEnd
            End Select
            If InStr(strA, "-") = 0 Then
                s = s & vbNewLine & "Bitte Lagerort und -fach mit einem Bindestrich trennen"
                GoTo nochmalLagerfach
            End If
        End If
        strSQL = strSQL & _
            ",@d = '" & OH_RPL(strA) & _
            "',@o = '" & OH_RPL(Me!lstLAgerAll) & "'"
        OH_r r
        If r!CT = 0 Then
            s = "Umbennenung war nicht erfolgfreich"
            GoTo ErrM
        Else
            OH_RQ Me!lstLAgerAll
            Me!lstLAgerAll = strA
        End If
    Case 200
        Me!lstLagerAllAct.Tag = 2
        OH_A "lstLAgerALL", strSQL
    Case 201
        If OH_Perm("D") Then
            GoTo ErrEnd
        End If
        If InStr(Me!lstLAgerAll.Recordset.Source, "@b = 200") = 0 Then
            s = "Lagerfächer können nur gelöscht werden, wenn Sie vorher" & vbNewLine & _
                "<Leere Lagerfächer>" & vbNewLine & _
                "angewählt haben." & vbNewLine & vbNewLine & _
                "Leere Lagerfächer anzeigen?"
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                GoTo ErrM
            End If
            Me!lstLagerAllAct = 200
            lstLagerAllAct_AfterUpdate
            GoTo ErrEnd
        End If
        strA = Nz(Me!lstLAgerAll, "")
        If strA = "" Then
            s = "Bitte ein leeres Lagerfach anwählen"
            GoTo ErrM
        End If
        s = "Soll das Lagerfach" & vbNewLine & vbNewLine & vbTab & strA & vbNewLine & vbNewLine & "gelöscht werden?" & _
            vbNewLine & vbNewLine & "HINWEIS: Damit löschen Sie auch alle jemals getätigten Buchungen dieses Lagerfaches!"
        If OH_JA Then
            OH_EX
            Me!lstLagerAllAct = 200
            lstLagerAllAct_AfterUpdate
        End If
    Case 300
        Me!lstLagerAllAct.Tag = 3
        OH_A "lstLAgerALL", strSQL
    Case 301
        If OH_Perm("D") Then
            GoTo ErrEnd
        End If
        If strLO = "" Then
            s = "Kein Lagerfach angewählt!"
            GoTo ErrM
        End If
        Select Case Val(Me!lstLagerAllAct.Tag)
        Case 2
            i = vbDefaultButton2
        Case 3
            i = vbDefaultButton1
        Case Else
            s = "Bitte zuerst auswählen:" & vbNewLine & vbNewLine & _
                "-akt.Lager-Orte mit Lagerfach" & vbNewLine & _
                "       oder" & vbNewLine & _
                "-inaktive Lagerfächer"
            GoTo ErrM
        End Select
        s = strLO & vbNewLine & vbNewLine & _
                "JA" & vbTab & "AKTIVIEREN" & vbNewLine & _
                "NEIN" & vbTab & "INAKTIVIEREN"
        i = MsgBox(s, vbQuestion + vbYesNoCancel + i, t)
        Select Case i
        Case vbCancel
            GoTo ErrEnd
        Case vbNo 'inaktiv
            If Me!lstLAgerAll.column(0, 0) = "leeres LAgerfach" Then
                N = 0
            Else
                N = Val(Me!lstLAgerAll.column(2))
            End If
            If N > 0 Then
                s = "Ein Lagerfach kann nur inaktiv gesetzt werden, wenn die Lagermenge 0 (nicht " & N & ") ist"
                GoTo ErrM
            End If
        End Select
        strSQL = strSQL & ",@y = " & i
        OH_EX
        OH_RQ Me!lstLAgerAll
    Case 400
        OH_EXCEL strQ, "aktueller Lagerbestand"
    Case 401
        OH_EXCELImport "aktueller Lagerbestand"
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstBuchungAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub
Private Sub lstC_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstC.SetFocus
    'Abspeichern, welche Anzeige der User angeclickt hat
    If Nz(VarAntw, "") <> "NichtBeimLAden" Then
        OH_A "@x ='lstc', " & _
            " @a = " & Me!lstC & "," & _
            " @i = " & lguser
        OH_EX
    End If
    VarAntw = Null
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstC_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub lstDet_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    OH_lstdetKeydown Me, KeyCode
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Artikel.lstDet_KeyDown"
    Resume ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
    Me!pgFirmaArtikel.Caption = "Artikel von " & left(Me!Firma & Space(16), 20)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstDet_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstDet_DblClick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstStichwortGr1_AfterUpdate()
'20180219  StichwortGruppe eingefügt
On Error GoTo ErrMsg
    regD_Change
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstStichwortGr1_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub NrFirma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!NrFirma) Then
        Me!NrFirma = EFNr
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "NrFirma_DblClick"
    Resume ErrEnd
End Sub
Private Sub Hersteller_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    If IsNull(Me!Hersteller) Then
        Me!Hersteller = Me!NrFirma.column(1)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Hersteller_DblClick"
    Resume ErrEnd
End Sub

Private Sub PreisFaktor_AfterUpdate()
    OH_SaveRS Me
    Me!Einzelpreis.SetFocus
End Sub
Public Sub lstAktiv_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstAktiv.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstAktiv_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Public Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstA_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Public Sub lstTopA_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstTopA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstTopA_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Public Sub lstArtikelKategorie_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstArtikelKategorie.SetFocus
    Select Case Me!lstArtikelKategorie
    Case "mit Analysen"
        Me!lstStichwortGr1.SetFocus
        Me!lstStichwortGr1 = "Analysen"
        lstStichwortGr1_AfterUpdate
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstArtikelKategorie_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstA_DblClick(Cancel As Integer)
    OH_OF "F_Warengruppe", Nz(Me!lstA, 0)
    Forms!F_warengruppe!lstDet = Nz(Me!lstA, 0)
End Sub
Private Sub lstFirmaArtikel_AfterUpdate()
    OH_SetRS Me, Nz(Me!lstFirmaArtikel, 0)
    Me!lstFirmaArtikel.SetFocus
End Sub
Public Sub lstM_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstM, 0)
    Me!lstM.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstM_Afterupdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstTop_dblclick(Cancel As Integer)
    OH_NoDblClick
End Sub
Private Sub lstTop_AfterUpdate()
On Error GoTo ErrMsg
    OH_SetRS Me, Nz(Me!lstTop, 0)
    Me!lstTop.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstTop_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub comFirma_AfterUpdate()
    txtFind_AfterUpdate
End Sub
Private Sub comFirma_DblClick(Cancel As Integer)
    Me!comFirma = 0
    txtFind_AfterUpdate
End Sub
Private Sub comLager_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Select Case Me!comLager
    Case 30 ', 'Alle gefilterten Artikel bestellen...'
        If Me!countRec > 0 And Me!comFirma > 0 Then
            Me!comArtikelVG.SetFocus
            Me!comArtikelVG = 10
            Me!comArtikelVG1 = 31
        End If
    Case 80
        With Me!comArtikelVG
            .SetFocus
            .Value = 100
            comArtikelVG_AfterUpdate
        End With
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.comLager_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub comLager_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!comLager = 0
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.comLager_DblClick"
    End Select
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    '240423 Anpassung für Alma
    Me!txtFind.SetFocus
    OH_A "@x = 'lst' " & _
        ", @i = " & Val(Me!lstA) & _
        ", @a = " & Me!lstC & _
        ", @n = " & Me!lstAktiv & _
        ", @b = " & Me!lstTopA & _
        ", @Firma = " & Nz(Me!comFirma, 0) & _
        ", @Lager = " & Nz(Me!comLager, 0) & _
        ", @d = '" & Me!lstArtikelKategorie & _
        "', @f = '" & OH_RPL(Me!txtFind.Text) & "'", , Me
    OH_txtFind Me, strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.txtFind_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer) '121216 gb
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
End Sub
Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!comtxtFind
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnPF_Tab_Click()
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Artikel btnPF_Tab_Click"
    Resume ErrEnd
End Sub
Private Sub btntxtFind_Click()
    txtFind_AfterUpdate
End Sub
Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    lstArtikelAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstArtikel_DblClick"
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
Private Sub lstStichwort_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OpenStichwort Me, , , lgX(2)
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstStichwort_DblClick"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstVG_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG", Me!lstVG
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstVG_DblClick"
    End Select
    Resume ErrEnd
End Sub

Private Sub NrWarengruppe_AfterUpdate()
'OH 071029
'Artikelnr generieren, wenn KZ in Warengruppe
On Error GoTo ErrMsg
    Dim strKZ As String
    strKZ = Me!NrWarengruppe.column(2)
    If strKZ <> "" Then
        If IsNull(Me!ArtikelNr) = False Then
            If MsgBox(strKZ & "......" & vbNewLine & _
                    "Soll die ArtikelNr neu gerechnet werden?", _
                        vbQuestion + vbYesNo, "Änderung der Warengruppe") = vbNo Then
                Exit Sub
            End If
        End If
        Me!ArtikelNr = OH_GetNr("Artikelnr", Nz(Me!NrArtikel, 0), , , strKZ)
    End If
    Me!Artikel.SetFocus
    If IsNull(Me!Artikel) Then
        Me!Artikel.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.NrWarengruppe_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub Preisfaktor_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "Preisfaktor"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Preisfaktor_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub Lagerort_Enter()
' OA 180402
On Error GoTo ErrMsg
    OH_A "Lagerort", , Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.Lagerort_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub EKWährung_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "EKWährung"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.EKWährung_Enter"
    End Select
    Resume ErrEnd
End Sub
Public Sub regD_Change()
' OHNEMUS, Freitag, 14. Dezember 2007
On Error GoTo ErrMsg
    Dim strStGr As String
    Dim strQ As String
    Select Case Me!regd
    Case 0
        strStGr = Nz(Me!lstStichwortGr1, "Technische Daten")
        strSQL = "Exec dbo.spA_Stichwort " & _
            " @cID ='NrArtikel'" & _
            ",@ID =  " & Nz(Me!NrArtikel, 0) & _
            ",@d = '" & strStGr & "'"
        OH_A "lstStichwort", strSQL, Me
        OH_lstStichwortAct Me, 0, strStGr
        strSQL = "Exec dbo.spA_Stichwort " & _
                " @x ='lstStichwortGr1'"
        OH_A "lstStichwortGr1", strSQL, Me
    Case 1
        OH_A "lstFirmaArtikel", "@i = " & Me!NrFirma, Me
    Case 2
        OH_A "comArtikelVG", , Me
        If Me!comArtikelVG <> 60 Then
            comArtikelVG_AfterUpdate
        End If
    Case 3
        OH_A "LstArtikel", "@i =" & Me!NrArtikel, Me
        OH_A "lstArtikelAct"
        lstRabattEbene_Afterupdate
    Case 4
        OH_A "lstRabattAct", , Me
        OH_A "lstRabattEbene", , Me
        lstRabattEbene_Afterupdate
    Case 5
        strQ = "Exec dbo.spa_Lager @x = 'lstLagerAct'"
        OH_A "lstLagerAct", strQ, Me
        strSQL = strQ & ",@b = 2 ,@i = " & Me!NrArtikel
        OH_A "lstLager", strSQL, Me
        strQ = "Exec dbo.spa_Lager @x = 'lstLagerAllAct'"
        OH_A "lstLagerALLAct", strQ, Me
        strSQL = strQ & ",@b = 2 ,@i = " & Me!NrArtikel
        OH_A "lstLagerALL", strSQL, Me
    Case 6
        OH_MarkerLST Me
    Case 7
        OH_TopLST Me
    Case 8
        OH_A "lstKatalogAct", , Me
        Me!lstKatalogAct = 10
        lstKatalogAct_Afterupdate
    Case 9
        strSQL = "Exec dbo.spA_Audit 'lstAuditAct'"
        OH_A "lstAuditAct", strSQL, Me
        Me!lstAuditAct = 10
        lstAuditAct_AfterUpdate
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.regArtikel_Change"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstStichwortAct_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstStichwortAct Me, Me!lstStichwortAct
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Adressen lstStichwortAct_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub

Private Sub txtFind_DblClick(Cancel As Integer)
    Me!txtFind = Null
End Sub
Private Sub VKWährung_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "VKWährung"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.VKWährung_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnBemArtikel_Click()
On Error GoTo ErrMsg
    OH_Openlexikon "Bemerkungen Artikel", , , "BemArtikel"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnBemArtikel_Click"
    Resume ErrEnd
End Sub
Private Sub comBemArtikel_AfterUpdate()
On Error GoTo ErrMsg
    Dim strA As String
    Dim strB As String
    Dim strC As String
    'Trick mit 3 Spalten wegen SQL-Meldung
    strA = Application.PlainText(Nz(Me!BemArtikel, ""))
    strSQL = Me!comBemArtikel.Recordset.Source & _
            ",@i = " & Me!comBemArtikel
    OH_r r
    If r.BOF Then
        GoTo ErrEnd
    End If
    strB = r!Beschreibung
    strC = r!bemLexikon
    If strB <> vbNullString Then
        If IsNull(Me!BemArtikel) Then
            Me!BemArtikel = strC
        Else
            x = OH_msgbox(vbNewLine & "Sie haben bereits Bemerkungen eingetragen:" & vbNewLine & vbNewLine & _
                        "Bestehend:      " & left(strA, 35) & "..." & vbNewLine & _
                        "Standard-Text:  " & left(strB, 35) & "...", _
                        Array("Überschreiben", "Anhängen", "Voranstellen"), _
                        vbQuestion, "Standardtext aus Lexikon übernehmen")
            Select Case Val(x)
            Case 1
                Me!BemArtikel = strC
            Case 2
                Me!BemArtikel = Me!BemArtikel & "<br>" & strC
            Case 3
                Me!BemArtikel = strC & "<br>" & Me!BemArtikel
            End Select
            Me!comBemArtikel = Null
        End If
    End If

ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnBemArtikel_Click"
    Resume ErrEnd
End Sub
Private Sub comBemArtikel_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!comBemArtikel, "Bemerkungen Artikel"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnBemArtikel_Click"
    Resume ErrEnd
End Sub
Private Sub btnWarenGruppe_Click()
On Error GoTo ErrMsg
    OH_OF "F_Warengruppe", Nz(Me!NrWarengruppe, 0)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, s
    Resume ErrEnd
End Sub
Private Sub Einzelpreis_Enter()
On Error GoTo ErrMsg
    If IsNull(Me!VKWährung) Then
        Me!VKWährung.SetFocus
        Me!VKWährung.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnArtikelName_Click()
On Error GoTo ErrMsg
    If IsNull(Me!ArtikelName) Then
        Me!ArtikelName.SetFocus
        Me!ArtikelName.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnArtikelNr_Click()
On Error GoTo ErrMsg
    If IsNull(Me!ArtikelNr) Or right(Me!ArtikelNr, 4) Like "Copy" Then
        Me!ArtikelNr = OH_GetNr("Artikelnr", Me!NrArtikel, , , Me!NrWarengruppe.column(2))
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnHersteller_Click()
On Error GoTo ErrMsg
    If IsNull(Me!Hersteller) Then
        Me!Hersteller.SetFocus
        Me!Hersteller.Dropdown
    Else
        Me!txtFind = Me!Hersteller
        txtFind_AfterUpdate
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnLiefereinheit_Click()
On Error GoTo ErrMsg
    OH_Openlexikon
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub EKWährung_DblClick(Cancel As Integer)
' OHNEMUS, Freitag, 13. August 2004
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Land"
    OH_FB Forms!PF_Land, "Währung like '" & Nz(Me!EKWährung) & "'", "Währung"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.EKWährung_DblClick"
    End Select
    Resume ErrEnd
    End Sub
Private Sub VKWährung_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Land"
    OH_FB Forms!PF_Land, "Währung like '" & Nz(Me!VKWährung) & "'", "Währung"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VKWährung_DblClick"
    Resume ErrEnd
End Sub
Private Sub Liefereinheit_GotFocus()
    OH_Lex Me!Liefereinheit, "Liefereinheit"
End Sub
Private Sub Liefereinheit_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "Liefereinheit", "Einkaufspreis"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub ArtikelNr_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    If Me!ArtikelNr.ControlSource = vbNullString Then GoTo ErrEnd
    If Me!ArtikelNr.OldValue <> Me!ArtikelNr Or _
    IsNull(Me!ArtikelNr.OldValue) Then 'prüfe, ob Nummer geändert wurde oder neu ist
        If DCount("ArtikelNr", "T_Artikel", "ArtikelNr= '" & Me!ArtikelNr & "'") > 0 Then
            If MsgBox("ArtikelNr.  " & Me!ArtikelNr & " exisitert bereits", _
                     vbExclamation + vbOKCancel + vbDefaultButton2, "Prüfung Artikel-Nummer") = vbCancel Then
                Cancel = True
                Me!ArtikelNr.Undo
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Artikel_AfterUpdate()
    Me!ArtikelName.SetFocus
End Sub
Public Sub NrFirma_AfterUpdate()
On Error GoTo ErrMsg
    Dim strN As String
    Dim lgid As Long
    '201203 wenn es sich um einen neuen Artikel handelt, soll keine weitere Aktion gestartet werden
    If DateDiff("H", Me!ArtikelErfasst, Now) < 2 Then
        GoTo ErrEnd
    End If
    lgid = Me!NrArtikel
    OH_InsertID_LST Me!lstDet
    OH_A "@x = 'LieferantChange'" & _
        ",@i = " & Me!NrArtikel & _
        ",@n = " & Me!NrFirma
    OH_r r
    i = r!CT
    s = "Sie haben "
    Select Case i
    Case 0
        GoTo ErrEnd
    Case 1
        s = s & "einen weiteren"
    Case Else
        s = s & i & " weitere"
    End Select
    strN = Me!NrFirma.column(1)
    t = "Ändern des Lieferanten in " & strN
    s = s & " Artikel des gleichen Lieferanten" & vbNewLine & _
        Me!Firma & vbNewLine & _
        "gefiltert." & vbNewLine & vbNewLine & _
        "Wollen Sie für diese Artikel auch den Lieferanten ändern?"
    If MsgBox(s, vbQuestion + vbYesNo + vbDefaultButton2, t) = vbNo Then
        GoTo ErrEnd
    End If
    strSQL = strSQL & _
            ",@a = 1"
    OH_EX
    Me!txtFind = strN
    txtFind_AfterUpdate
    Me!lstDet = lgid
    OH_SetRS Me, lgid
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub Hersteller_AfterUpdate()
On Error GoTo ErrMsg
    Dim strN As String
    Dim lgid As Long
    '201203 wenn es sich um einen neuen Artikel handelt, soll keine weitere Aktion gestartet werden
    If DateDiff("H", Me!ArtikelErfasst, Now) < 2 Then
        GoTo ErrEnd
    End If
    lgid = Me!NrArtikel
    strN = Me!Hersteller
    OH_InsertID_LST Me!lstDet
    OH_A "@x = 'HerstellerChange'" & _
        ",@f = '" & OH_RPL(Me!Hersteller.OldValue) & _
        "',@d = '" & OH_RPL(strN) & "'"
    OH_r r
    i = r!CT
    s = "Sie haben "
    Select Case i
    Case 0
        GoTo ErrEnd
    Case 1
        s = s & "einen weiteren"
    Case Else
        s = s & i & " weitere"
    End Select
    strN = Me!Hersteller
    t = "Ändern des Herstellers in " & strN
    s = s & " Artikel des gleichen Herstellers" & vbNewLine & _
        Me!Hersteller.OldValue & vbNewLine & _
        "gefiltert." & vbNewLine & vbNewLine & _
        "Wollen Sie für diese Artikel auch den Hersteller ändern?"
    If MsgBox(s, vbQuestion + vbYesNo + vbDefaultButton2, t) = vbNo Then
        GoTo ErrEnd
    End If
    strSQL = strSQL & _
            ",@a = 1"
    OH_EX
    Me!txtFind = "Hersteller:" & strN
    txtFind_AfterUpdate
    Me!lstDet = lgid
    OH_SetRS Me, lgid
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub NrFirma_Enter()
' OHNEMUS, Montag, 7. August 2006
On Error GoTo ErrMsg
    OH_A "NrFirma"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.NrFirma_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub NrFirma_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    If OH_newCompany(NewData) Then GoTo ErrEnd
    Me!Hersteller.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical   'eigene Fehlermeldungen
    Resume ErrEnd
End Sub
Private Sub Artikel_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    t = NewData & " ist noch nicht erfasst."
    Response = acDataErrContinue
    Me!Artikel.Undo
    s = NewData & vbNewLine & vbNewLine & _
            "jetzt als Bezeichnung erfassen und unter  <Begriffen> ablegen?" & vbNewLine & vbNewLine & _
            " bitte gut überlegen, ob nicht schon mit ähnlichem Namen vorhanden!"
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbOK Then
        strSQL = "EXEC spa_Begriff " & _
            " @x = 'checkBegriff'" & _
            ",@f = '" & OH_RPL(NewData) & "'"
        OH_r r
        lgid = r!NrBegriff
        Me!Artikel = NewData
        OH_RQ Me!Artikel
        Me!ArtikelName.SetFocus
        If MsgBox("Möchten Sie weitere Daten (techn. Spezifikationen) erfassen ?" _
                , vbYesNo + vbQuestion, "Bezeichnung : " & NewData) = vbYes Then
            OH_OF "F_Begriff", lgid
            Set frm = Forms!F_begriff
            frm!lstA = "A L L E  Gruppen"
            frm!txtFind = NewData
            frm.txtFind_AfterUpdate
        End If
    End If
ErrEnd:
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnLieferant_Click()
On Error GoTo ErrMsg
    t = Me!btnLieferant.ControlTipText
    If IsNull(Me!NrFirma) Then
        Me!NrFirma.SetFocus
        Me!NrFirma.Dropdown
    Else
        i = MsgBox("Lieferant anzeigen" & vbNewLine & _
                "JA" & vbTab & "Öffne Adress-Modul" & vbNewLine & _
                "NEIN" & vbTab & "Ändere den Lieferanten", vbQuestion + vbYesNoCancel, t)
        Select Case i
        Case vbYes
            OH_OF "F_Adresse", Me!NrFirma, 1
        Case vbNo
            DoCmd.openForm "PF_Navigator", , , , , , "Lieferant (Firma) zuordnen"
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnBegriff_Click()      'öffnet entspr. Begriffe
On Error GoTo ErrMsg
    Dim lgid As Long
    If IsNull(Me!Artikel) Then
        Me!Artikel.SetFocus
        Me!Artikel.Dropdown
    Else
        OH_OF "F_Begriff"
        Set frm = Forms!F_begriff
        frm!txtFind = Me!Artikel
        frm.txtFind_AfterUpdate
    End If
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnBegriff_Click"
    Resume ErrEnd
End Sub
Private Function OH_SaveRecord()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim strf As String
    lgA = Nz(Me!NrArtikel, 0)
    strSQL = "Select top 1 * from T_Artikel where NrArtikel = " & lgA
    OH_r rx, , , rrLockOptimistic
    For i = 1 To rx.Fields.count - 1
        strf = rx.Fields(i).Name
        Select Case strf
        Case "NrArtikel", "lastupdate", "whoupdate", "artikelerfasst"
        Case Else
            rx(strf) = Me(strf)
        End Select
    Next i
    rx.Update
    Me.Undo
    OH_SetRS Me, lgA
ErrEnd:
    OH_ResetRS rx
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "F_Artikel OH_SaveRecord"
    Resume ErrEnd
End Function
Public Sub lstMdo_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstMdo Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "lstMdo_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ArtikelKategorie_NotInList(NewData As String, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    NewLexikonEntry NewData, "ArtikelKategorie", "EANCode"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ArtikelKategorie_NotInList"
    Resume ErrEnd
End Sub
Private Sub ArtikelKategorie_Enter()
On Error GoTo ErrMsg
    OH_Lex Me!ArtikelKategorie, "ArtikelKategorie"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ArtikelKategorie_Enter"
    Resume ErrEnd
End Sub
Private Sub lstKatalogAct_Afterupdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgact As Long
    Dim strf As String
    Dim strFile As String
    Dim strFldr As String
    lgact = Nz(Me!lstKatalogAct)
    t = Nz(Me!lstKatalogAct.column(1))
    lgid = Nz(Me!NrArtikel)
    strSQL = "Exec dbo.spa_Artikel " & _
        " @x = 'lstKatalogAct' ," & _
        " @i = " & lgid & "," & _
        " @a = " & lgact
    Select Case lgact
    Case 0
        GoTo ErrEnd
    Case 10, 20, 21, 30, 31
        OH_r r
        For i = 1 To 2
            Select Case lgact
            Case 10
                If i = 1 Then
                    strf = "Katalog"
                Else
                    strf = "Sortiment"
                End If
            Case 20, 30
                i = 2
                strf = "Katalog"
            Case 21, 31
                i = 2
                strf = "Sortiment"
            End Select
            Me("lblBild" & strf).Visible = False
            strFldr = Nz(r(strf), "")
            strFile = strFldr & "\" & r!bildFile
            If strFldr <> "" Then
                Select Case lgact
                Case 30, 31
                    If Len(Dir(strFldr, vbDirectory)) = 0 Then
                        Me("Bild" & strf).picture = ""
                        s = "Ordner ist nicht zu finden!" & vbNewLine & _
                                strFldr
                        Me("lblBild" & strf).Caption = strFldr & vbNewLine & s
                        Me("lblBild" & strf).Visible = True
                    Else
                        OH_LaunchFolder 2, strFldr
                    End If
                End Select
                If Len(Dir(strFile)) = 0 Then
                    s = "Bild ist nicht zu finden!" & vbNewLine & _
                            strFile & vbNewLine & vbNewLine & _
                            "Der Bildname entspricht der Artikel-Nr. mit der Endung .jpg"
                    Me("lblBild" & strf).Caption = s
                    Me("lblBild" & strf).Visible = True
                    Me("Bild" & strf).picture = ""
                Else
                    If Me("Bild" & strf).picture <> strFile Then
                        Me("Bild" & strf).picture = strFile
                    End If
                    Me("Bild" & strf).Visible = True
                    Select Case lgact
                    Case 20, 21
                        OH_LaunchDocument 2, strFile
                    End Select
                End If
            Else
                s = "Ordner für " & strf & "-Bilder " & vbNewLine & _
                        "nicht definiert!"
                Me("lblBild" & strf).Caption = s
                Me("lblBild" & strf).Visible = True
                Me("Bild" & strf).picture = ""
                GoTo ErrEnd
            End If
        Next i
    End Select

ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2114
        Me("lblBild" & strf).Caption = Err.number & " " & Err.Description
        Me("lblBild" & strf).Visible = True
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_F_Artikel.lstKatalogAct_Afterupdate"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Sub

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
Private Sub Artikel_DblClick(Cancel As Integer)
    OH_tlbZoom
End Sub
Private Sub ArtikelName_DblClick(Cancel As Integer)
    OH_tlbZoom
End Sub
Private Sub ArtikelNr_DblClick(Cancel As Integer)
    OH_tlbZoom
End Sub
