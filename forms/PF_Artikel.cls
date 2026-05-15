Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strLinkA As String
Dim lgCount As Long
Dim frmAZ As Form
Dim lgM As Long
Dim sgAnzahl As Long
Private Sub Form_Load()
On Error GoTo ErrMsg
    lgCount = 0
    If Len(glstrStartCursor_in_PF_Artikel) > 0 Then
        Me!comFrei = glstrStartCursor_in_PF_Artikel
    End If
    Me!mitTechDat = glintPF_ArtikelmitTechDat
    OH_A "ComFrei", , Me
    OH_A "Lager", , Me
    Me!comFrei = "Alle"
    OH_A "Verfügbar", , Me
    OH_A "lstAct", , Me
    sgAnzahl = 0
    OH_Move Me, 240, 10, 175, 205
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub btnFrei_Click()
On Error GoTo ErrMsg
    Me!comFrei.SetFocus
    Me!comFrei.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.btnFrei_Click"
    Resume ErrEnd
End Sub
Private Sub comFrei_AfterUpdate()
On Error GoTo ErrMsg
    txtFrei_KeyDown 13, 0
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.comFrei_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstArtikel_afterupdate()
On Error GoTo ErrMsg
    i = 0
    With Me!LstArtikel
        For Each x In .ItemsSelected
            i = i + 1
            If i = 1 Then
                Me!NrArtikel = .column(0, x)
                OH_SetArtikel (Me!NrArtikel)
                Exit For
            End If
        Next x
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.lstArtikel_afterupdate"
    Resume ErrEnd
End Sub
Public Function OH_SetArtikel(lgid As Long)
On Error GoTo ErrMsg
    OH_A "@x = 'IDArtikel'," & _
         " @i = " & lgid, , Me
    OH_r r
    Me!Lager = r!Lager
    Me!Verfügbar = r!Verfügbar
    Me!WarenGruppe = r!WarenGruppe
    Me!Artikel = r!Artikel
    Me!ArtikelNr = r!ArtikelNr
    Me!ArtikelName = r!ArtikelName
    Me!Firma = r!Firma
    Me!Hersteller = r!Hersteller
    Me!Liefereinheit = r!Liefereinheit
    Me!VKWährung = r!EKWährung
    Me!NrArtikel = r!NrArtikel
    Me!BemVGDet = r!BemArtikel
    Me!showPreis = r!Einkaufspreis & "  " & r!BemArtikel
    If OH_isloaded("F_VG") Then '230727 Rabatt bei Bestellung
        If Forms!F_VG!EKoVK = 0 Then
            Me!RabattVG = r!ArtikelRabatt
        End If
    End If
    OH_ResetRS r
    Me!AnzahlVG.SetFocus
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.OH_SetArtikel"
    Resume ErrEnd
End Function
Private Sub lstArtikel_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!lstact = 6
    lstAct_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.lstArtikel_DblClick"
    Resume ErrEnd
End Sub
Private Sub RabattVG_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    Select Case KeyCode
    Case 13
        Me!lstact = 6
        Me!lstact.SetFocus
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.RabattVG_KeyDown"
    Resume ErrEnd
End Sub
Private Sub lstAct_Keydown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If Me!lstact = 6 Then
        Select Case KeyCode
        Case 13
            lstAct_AfterUpdate
            Me!ArtikelNr.SetFocus
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.lstAct_Keydown"
    Resume ErrEnd
End Sub
Private Sub Lager_AfterUpdate()
    OH_FillIn
End Sub
Private Sub Verfügbar_AfterUpdate()
    OH_FillIn
End Sub
Private Sub WarenGruppe_AfterUpdate()
    OH_FillIn
End Sub
Private Sub Artikel_AfterUpdate()
    OH_FillIn
End Sub
Private Sub ArtikelName_AfterUpdate()
    OH_FillIn
End Sub
Private Sub ArtikelNr_AfterUpdate()
    OH_FillIn
End Sub
Private Sub Firma_AfterUpdate()
    OH_FillIn
End Sub
Private Sub Hersteller_AfterUpdate()
    OH_FillIn
End Sub
Private Sub Liefereinheit_AfterUpdate()
    OH_FillIn
End Sub
Private Sub txtFrei_AfterUpdate()
    txtFrei_KeyDown 13, 10
End Sub
Private Sub txtFrei_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If KeyCode = 13 Then
        OH_FillIn
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.txtFrei_KeyDown"
    Resume ErrEnd
End Sub
Private Sub VKWährung_AfterUpdate()
    OH_FillIn
End Sub
Private Function OH_NewVGDet(lgA As Long) As Long
On Error GoTo ErrMsg
    Dim strC As String
    Dim lgV As Long
    Dim lgTitel As Long
    t = "Artikel hinzufügen"
    If sgAnzahl <> 0 Then
        If Nz(Me!AnzahlVG, 0) <> 1 And sgAnzahl = Me!AnzahlVG Then
            s = "Bitte gleiche Anzahl (" & Me!AnzahlVG & ") wie Position vorher bestätigen!"
            If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
                Me!AnzahlVG = 1
                GoTo ErrEnd
            End If
        End If
    End If
    sgAnzahl = Nz(Me!AnzahlVG, 0)
    lgV = frmAZ!NrVG
    If frmAZ!LstArtikel.ListCount > 0 Then
        lgTitel = Nz(frmAZ!TitelNr, 0)
    End If
    If Me!mitTechDat Then
        strC = "KopieTechDat"
    End If
    strSQL = "Exec dbo.spI_VGdiv " & _
                " @x = 'NeuArtikelVGdet'" & _
                ", @ID1 = " & lgA & _
                ", @ID2 = " & lgV & _
                ", @ID3 = " & lgTitel & _
                ", @c = '" & strC & _
                "',@r1 = " & Me!AnzahlVG & _
                ", @r2 = " & Me!RabattVG & _
                ", @s1 = '" & OH_RPL(Me!BemVGDet) & "'"
    OH_r r
    lgV = r(0)
    If lgV = 0 Then
        MsgBox "Artikel nicht übernommen mit ID " & lgA, vbCritical, "Fehlt Lieferant oder Währung?"
    Else
        frmAZ.OH_CheckSollHaben
        OH_NewVGDet = lgV
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.OH_NewVGDet"
    Resume ErrEnd
End Function
Private Sub WarenGruppe_Enter()
    OH_comF "Warengruppe"
End Sub
Private Sub Artikel_Enter()
    OH_comF "Artikel"
End Sub
Private Sub ArtikelName_Enter()
    OH_comF "ArtikelName"
End Sub
Private Sub ArtikelNr_Enter()
    OH_comF "ArtikelNr"
End Sub
Private Sub Firma_Enter()
    OH_comF "Firma"
End Sub
Private Sub Hersteller_Enter()
    OH_comF "Hersteller"
End Sub
Private Sub Liefereinheit_Enter()
    OH_comF "Liefereinheit"
End Sub
Private Sub VKWährung_Enter()
    OH_comF "VKWährung"
End Sub
Private Sub btnWarenGruppe_Click()
    Me!WarenGruppe = Null
End Sub
Private Sub btnArtikelName_Click()
    Me!ArtikelName = Null
End Sub
Private Sub btnArtikelNr_Click()
    Me!ArtikelNr = Null
End Sub
Private Sub btnBegriff_Click()
    Me!Artikel = Null
End Sub
Private Sub btnLieferant_Click()
    Me!Firma = Null
End Sub
Private Sub btnHersteller_Click()
    Me!Hersteller = Null
End Sub
Private Sub btnLiefereinheit_Click()
    Me!Liefereinheit = Null
End Sub
Private Sub btnVKWährung_Click()
    Me!VKWährung = Null
End Sub
Private Function getString() As String
On Error GoTo ErrMsg
    Dim strAnd As String
    Dim strA As String
    strlink = ""
    For i = 0 To 9
        Select Case i
        Case 0
            strA = "verfügbar"
        Case 1
            strA = "WarenGruppe"
        Case 2
            strA = "Artikel"
        Case 3
            strA = "ArtikelNr"
        Case 4
            strA = "ArtikelName"
        Case 5
            strA = "Hersteller"
        Case 6
            strA = "Liefereinheit"
        Case 7
            strA = "VKWährung"
        Case 8
            strA = "Firma"
        Case 9
            strA = "Lager"
        End Select
        If Nz(Me(strA), "Alle") <> "ALLE" Then
            'wenn ein Hochkomma vorkommt
            strlink = strA & " like ''" & OH_RPL(Me(strA), 2) & "''"
            If strA = "Lager" Then
                Select Case Me(strA)
                Case "Alle"
                    strlink = "Nrartikel > 0"
                Case "JA"
                    strlink = "Lagermenge > 0"
                Case "NEIN"
                    strlink = "isnull(LAgermenge,0) = 0"
                End Select
            End If
            If getString = "" Then
                getString = strlink
            Else
                getString = getString & " and " & strlink
            End If
        End If
    Next i
    If Not IsNull(Me!txtFrei) Then
        strA = " like ''%" & OH_RPL(Me!txtFrei, 2) & "%''"
        Select Case Nz(Me!comFrei, "Alle")
        Case "NrArtikel"
            strlink = "NrArtikel = " & Val(Me!txtFrei)
        Case "Artikel", "ArtikelName", "Hersteller", "Firma", "WarenGruppe"
            strlink = Me!comFrei & strA
        Case "ArtikelNr"
            strlink = "ArtikelNr " & strA
        Case "Standard"
            strlink = "NrArtikel in(Select NrArtikel from T_Stichwort " & _
                      "where Stichwort like ''Standard-Artikel'' and BemStichwort " & strA & ")"
        Case "Alle"
            strlink = "NrArtikel = " & Val(Me!txtFrei) & _
                     " or ArtikelNr " & strA & _
                     " or Artikel " & strA & _
                     " or ArtikelName " & strA & _
                     " or Hersteller " & strA & _
                     " or Firma " & strA
            If Me!Verfügbar <> "alle" Then
                strlink = strlink & " or Verfügbar " & strA
            End If
        End Select
        If getString = "" Then
            getString = strlink
        Else
            getString = getString & " and (" & strlink & ")"
        End If
    End If
    If strlink <> "" Then
        If getString = "" Then
            getString = strlink
        Else
            getString = getString & " and (" & strlink & ")"
        End If
    End If
    If getString <> "" Then
        getString = " where " & getString
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.getString"
    Resume ErrEnd
End Function
Public Function OH_FillIn() As Long
On Error GoTo ErrMsg
    lgCount = 0
    strlink = Trim(getString())
    s = "Doppel-Klick trägt den markierten Artikel ein!" & vbNewLine & _
        "Liste zeigt die "
    If strlink = "" Then
        s = s & "Top 50 benutzten Artikel."
    Else
        s = s & "oben gefilterten Artikel"
    End If
    Me!LstArtikel.ControlTipText = s
    OH_A "@x = 'lstArtikel'," & _
         " @w = '" & strlink & "'", , Me
    OH_r r, , , , True
    If r.BOF Then
        MsgBox "kein Treffer", vbInformation, "Suche Artikel " & strlink
    Else
        lgCount = r.RecordCount & ""
        OH_FillIn = lgCount
        OH_A "LstArtikel", strSQL
        Me!LstArtikel.Selected(1) = True
        If lgCount = 1 Then
            OH_SetArtikel r!IDArtikel
        End If
        lgCount = 0
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err
    Case 3075, 2110
    Case Else
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.OH_FillIn"
    End Select
    Resume ErrEnd
End Function
Private Sub lstArtikel_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'Sortierung der Liste Me!LISTE nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    OH_SortListe Me!LstArtikel, x, Y
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.lstArtikel_MouseDown"
    Resume ErrEnd
End Sub
Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgB As Long
    Dim lgAnzahl As Long
    Dim lgRabatt As Long
    Dim strBem As String
    Dim lgVGdet As Long
    Dim lgVGdet1 As Long
    Dim lgArtikel As Long
    DoCmd.Hourglass True
    Select Case Me!lstact
    Case 3, 10 'Auswahl entfernen' 'Top 50 Artikel'
        Me!Lager = "Alle"
        Me!Verfügbar = "Ja"
        Me!WarenGruppe = Null
        Me!Artikel = Null
        Me!ArtikelName = Null
        Me!ArtikelNr = Null
        Me!Firma = Null
        Me!Hersteller = Null
        Me!Liefereinheit = Null
        Me!VKWährung = Null
        Me!txtFrei = Null
        Me!showPreis = Null
        If Len(glstrStartCursor_in_PF_Artikel) > 0 Then
            Me(glstrStartCursor_in_PF_Artikel).SetFocus
        End If
        lgM = 0
        If Me!lstact = 3 Then
            Me!LstArtikel.RowSource = vbNullString
        Else
            OH_A "@x ='Top50Artikel'"
            OH_A "LstArtikel", strSQL
        End If
    Case 6, 7 'in Liste markierte Artikel...zuordnen und schliessen
        i = 0
        With Me!LstArtikel
            For Each x In .ItemsSelected
                i = i + 1
                If i = 1 Then
                    Exit For
                End If
            Next x
        End With
        If i = 0 Then
            s = "Bitte mindestens 1 Artikel in der Liste unten markieren (mit SHIFT- oder  CTRL-Taste)"
            GoTo ErrM
        End If
        Select Case Me!woher
        Case "Vorgang"
            Set frmAZ = Forms!F_VG
            i = 0
            With Me!LstArtikel
                For Each x In .ItemsSelected
                    i = i + 1
                    lgVGdet = OH_NewVGDet(.column(0, x))
                    If i = 1 Then
                        lgVGdet1 = lgVGdet
                    End If
                Next x
            End With
            '200304 Aktualisieren der Anzeige
            frmAZ.OH_refreshVGDet lgVGdet
            '200310 Jürg will alle Felder geleert haben
            If Me!lstact = 6 Then
                 Me!lstact = 3
                 lstAct_AfterUpdate
                 Me!lstact = Null
            End If
        Case "Artikel Ersetzen.", "Artikel Austausch"
            Set frmAZ = Forms!F_VG
            lgVGdet = frmAZ!nrVGDet
            strSQL = "Exec dbo.spI_VGdiv " & _
                " @x = '" & Me!woher & _
                "', @ID2 = " & lgVGdet & _
                ", @ID1 = " & Nz(Me!NrArtikel, 0) & _
                ", @m = " & Nz(Me!mitTechDat, 0) & _
                ", @s1 = '" & OH_RPL(Me!BemVGDet) & "'"
            OH_EX
            frmAZ.OH_refreshVGDet lgVGdet
        Case "ArtikelZuord"
            Set frmAZ = Forms!F_Artikel
            lgB = frmAZ!NrArtikel
            OH_InsertID_LST Me!LstArtikel, True
            lgAnzahl = Me!AnzahlVG * 100  'trick um als TXT übergeben
            strBem = Nz(Me!BemVGDet, "")
            strSQL = "Exec dbo.spa_Artikel" & _
                    " @x ='lstArtikelAct', " & _
                    " @i =" & lgB & ", " & _
                    " @a = " & frmAZ!LstArtikelAct & "," & _
                    " @f = '" & OH_RPL(strBem) & "', " & _
                    " @d= " & lgAnzahl
            OH_r r
            frmAZ.OH_refreshVGDet r!ID
        Case "Artikel"
            Me!lstact = 8
            lstAct_AfterUpdate
            GoTo ErrEnd
        Case "RabattAdresse"
            If Nz(Me!RabattVG, 0) = 0 Or Nz(Me!RabattVG, 0) > 100 Then
                s = "Bitte den Rabatt eintragen!"
                Me!RabattVG.BackColor = vbGreen
                Me!RabattVG.SetFocus
                GoTo ErrM
            End If
            Set frmAZ = Forms!F_Adresse
            lgB = frmAZ!NrFunktion
            OH_InsertID_LST Me!LstArtikel, True
            lgRabatt = Me!RabattVG * 100  'trick um als TXT übergeben
            lgAnzahl = Nz(Me!AnzahlVG, 1)
            strBem = Nz(Me!BemVGDet, "")
            strSQL = "Exec dbo.spa_Adresse" & _
                    " @x ='lstArtikelAct' " & _
                    ", @i =" & lgB & _
                    ", @a = " & frmAZ!LstArtikelAct & _
                    ", @f = '" & OH_RPL(strBem) & _
                    "',@n= " & lgRabatt & _
                    ", @z= " & lgAnzahl
            OH_r r
            OH_RQ frmAZ!LstArtikel, r!ID
        End Select
    Case 8 'anzeigen und schliessen
        If Not IsNull(Me!NrArtikel) Then
            strlink = "NrArtikel =" & Me!NrArtikel
        Else
            strlink = getString()
            strlink = Replace(strlink, "a.", "")
            If strlink = "NRArtikel>0" Then
                strlink = vbNullString
            End If
        End If
        OH_OF "F_Artikel", 0, 0, strlink
    End Select
    Select Case Me!lstact
    Case 1, 7, 8
        DoCmd.Close acForm, "PF_Artikel"
    End Select
ErrEnd:
    DoCmd.Hourglass False
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.lstAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Function OH_comF(strf As String)
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spA_PFArtikel " & _
            " @x = 'comF'," & _
            " @f = '" & OH_RPL(strf) & "'," & _
            " @w ='" & getString() & "'"
    OH_A strf, strSQL, Me
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Artikel.OH_comF"
    Resume ErrEnd
End Function
