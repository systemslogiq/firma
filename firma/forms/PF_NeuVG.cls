Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim lgOld As Long
Dim lgNew As Long
Dim frmVG As Form
Dim lgNrFunktion As Long
Dim lgNrFirma As Long
Dim strAnschrift As String
Dim strAnrede As String
Dim strlblVGID As String
Dim lgVGid As Long
Dim strW As String
Dim blDuSie As Boolean
Dim strlinkVGDet As String
Dim btArtikelPreis As Byte
Dim blC As Boolean
Dim blKopieBemerkung As Boolean
Dim lgVGInfo As Long
Dim strVGbem As String
Dim strOA As String

Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim rsO As ADODB.Recordset
    Set frmVG = Forms!F_VG
    Me.Caption = "Vorgänge erstellen / kopieren für " & Forms!Menu!lstMandant.column(2)
    lgOld = Val(Mid(Nz(Me.OpenArgs), 2))
    strSQL = "EXEC spa_QK @x = 'NrQK'"
    OH_A "NrQK", strSQL, Me
    strSQL = "Exec dbo.spa_VG @x = 'VGWährung'"
    OH_A "VGWährung", strSQL, Me
    Me!lblVGID.Caption = "Click, um ein Projekt anzuwählen (blaues Feld)"
    Me!NrQK.DefaultValue = gllgNeuerVorgang
    strOA = left(Nz(Me.OpenArgs), 1)
    Select Case strOA
    Case "A"
        strSQL = "Exec dbo.spI_VGDiv " & _
                        "@x = 'vonAdresse'" & _
                        ", @id1 = " & gllgNeuerVorgang & _
                        ", @id3 = " & lgOld
        OH_r rsO
        Me!OAdr = -1
        Me!ONeu = -1
        Me!TxtVG.Visible = False
        Me!OGVGID = 0
        'OVGID_AfterUpdate
        OGVGID_AfterUpdate
        Me!OVG = 0
        OVG_AfterUpdate
        Me!OVG.Visible = False
        Me!OmitArtikel.Visible = False
        Me!OmitBem.Visible = False
        Me!OmitInfo.Visible = False
        Me!OmitStichwort.Visible = False
        Me!oMitTeilnehmer.Visible = False
        Me!OmitTechDat.Visible = False
        lgOld = frmVG!NrVG
    Case "V", "X"
        strSQL = "Exec dbo.spI_VGDiv " & _
                    "@x = 'VGKopie'" & _
                    ", @id3 = " & lgOld
        OH_r rsO
        Me!OmitInfo = rsO!OmitInfo
        lgVGInfo = rsO!OmitInfo
        Me!ONeu = 0
        Me!TxtVG = "kopiere: " & rsO!ANr & " " & rsO!VG
        Me!VGID = rsO!VGID
        Me!VGIDu = rsO!VGIDu
        Me!VG = rsO!VG
        Me!lblVGID.Caption = "ergänze " & Me!VG
        lgVGid = rsO!VGID
        Me!NrVG = rsO!NrVG
        Me!NrQK = Nz(rsO!nextQK, rsO!NrQK)
        If IsNull(rsO!VGDat1) = False Then
            Me!VGDat1 = CDate(rsO!VGDat1)
        End If
    End Select
    If IsNull(Me!VGWährung) Then
        Me!VGWährung = Me!VGWährung.column(0, 0)
    End If
    Me!NrMitarbeiter = lguser
    Me!Mitarbeiter = strUser
    Me!NrFirma = rsO!NrFirma
    Me!Land = rsO!LandFirma
    lgNrFunktion = rsO!NrFunktion
    Me!NrFunktion = lgNrFunktion
    Me!txtAdr = left(rsO!Firma, 30) & vbNewLine & _
                rsO!NamePerson
    blDuSie = rsO!DuSie
    'siehe Bemerkung in spI_VGDiv
    'bei den QK-Stichworten ist hinterlegt, welcher QK als nächster folgen soll
    NrQK_AfterUpdate
    OH_Achtung '090717
    s = "Durch die Eingabe einer Zahl wird ein Datum erzeugt (ausgehend vom " & Primo(Date) & ")" & vbNewLine & _
        "Mit Doppel-Klick wird das heutige Datm eingetragen!"
    Me!VGDat1.ControlTipText = s
    s = "Zeigt Adressen-Auswahl im <Navigator>" & vbNewLine & _
        "Als Adressen-Art (Firmen / Personen) wird die zuletzt verwendete Adressenart der ausgewählten Vorgangsart vorgeschlagen!"
    Me!btnNavigator.ControlTipText = s
    OH_ResetRS rsO
    If strOA = "X" Then
        OH_Move Me, 200, 0, 95, 200
        With Me!vgbem
            .Visible = True
            .top = Me!ogVG.top + Me!ogVG.Height + 50
            .left = Me!ogVG.left
            .Width = Me!ogVG.Width
            .Height = 6 * 567
            Me!btnOK.top = .top + .Height + 100
            Me!btnEscape.top = Me!btnOK.top
            strVGbem = "Hier Ihre Infos eintragen..."
            .Value = strVGbem
        End With
        Me!OGVGID = 1
        Me!OmitBem = 0
    Else
        OH_Move Me, 100, 50, 95, 160
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btncomVGID_Click()
' OH 30. August 2005
On Error GoTo ErrMsg
    VarAntw = Null
    'Me!OGVGID = -1
    'OGVGID_AfterUpdate
    strSQL = "Exec dbo.spa_Z @x = 'Projektliste'"
    OH_A "comVGID", strSQL, Me
    Me!comVGID.Visible = True
    Me!comVGID.SetFocus
    Me!comVGID.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btncomVGID_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btncomNrVG_Click()
' OH 30. August 2005
On Error GoTo ErrMsg
    btncomVGID_Click
    VarAntw = "NrVG"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btncomNrVG_Click"
    End Select
    Resume ErrEnd
End Sub

Private Sub btnNrMitarbeiter_Click()
' OH 30. August 2005
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Z @x = 'NrMitarbeiter'"
    OH_A "NrMitarbeiter", strSQL, Me
    Me!NrMitarbeiter.Visible = True
    Me!NrMitarbeiter.SetFocus
    Me!NrMitarbeiter.Dropdown
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btnNrMitarbeiter_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnVGL_Click()
On Error GoTo ErrMsg
    Dim strVG As String
    Dim lgid As Long
    Dim lgBoss As Long
    strVG = Nz(Me!VG, "")
    If strVG = "" Then
        Me!comVGL.SetFocus
        Me!comVGL.SetFocus
    Else
        strSQL = "Exec dbo.spa_Lexikon" & _
                " @x = 'InsertLex', " & _
                " @d = 'Projekttitel', " & _
                " @f = '" & strVG & "'"
        OH_r r
        lgid = r!ID
        lgBoss = r!NrBoss
        s = strVG & vbNewLine & _
                "ist als Projekt-Titel im Lexikon abgelegt!" & vbNewLine & vbNewLine & _
                "Lexikon jetzt öffnen?"
        If MsgBox(s, _
                vbInformation + vbYesNo + vbDefaultButton2, _
                "Vorgabe Projekt-Titel") = vbYes Then
            DoCmd.Close acForm, Me.Name
            OH_OF "F_Lexikon"
            Forms!F_Lexikon.OH_FindLex lgBoss, lgid
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btnVGL_Click"
    End Select
    Resume ErrEnd
End Sub

Private Sub comVG_GotFocus()
On Error GoTo ErrMsg
    strSQL = "execute spa_VG @x = 'VG'"
    OH_A "ComVG", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.comVG_GotFocus"
    End Select
    Resume ErrEnd
End Sub
Private Sub comVG_AfterUpdate()
    Me!VG = Me!ComVG
End Sub
Private Sub comVGL_GotFocus()
On Error GoTo ErrMsg
    OH_Lex Me!comVGL, "Projekttitel"
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.comVGL_GotFocus"
    End Select
    Resume ErrEnd
End Sub
Private Sub comVGL_AfterUpdate()
    Me!VG = Me!comVGL
End Sub
Private Sub comVGID_AfterUpdate()
On Error GoTo ErrMsg
    Me!VGID = Me!comVGID.column(6)
    lgVGid = Me!VGID
    Me!VG = Me!comVGID.column(1)
    Me!VGIDu = Me!comVGID.column(7)
    strlblVGID = "ergänze " & Me!VG
    Me!lblVGID.Caption = strlblVGID
    If VarAntw = "NrVG" Then
        Me!NrVG = Me!comVGID.column(3) 'OH 051207
    Else
        Me!NrVG = frmVG!NrVG
    End If
    VarAntw = Null
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.comVGID_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub comVGID_Enter()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Z @x = 'Projektliste'"
    OH_A "comVGID", strSQL
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comVGID_Enter"
    Resume ErrEnd
End Sub

Private Sub Form_Close()
    'siehe Artikel Stichwort Artikelhinzufügen
    strMSG(1) = ""
End Sub

Private Sub NrFunktion_Enter()
' OHNEMUS, Samstag, 7. Oktober 2006
On Error GoTo ErrMsg
    OH_NrFunktionRowSource
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.NrFunktion_Enter"
    End Select
    Resume ErrEnd
End Sub
Private Sub NrMitarbeiter_AfterUpdate()
    Me!Mitarbeiter = Me!NrMitarbeiter.column(1)
    Me.Caption = "Vorgänge erstellen / kopieren für " & Me!NrMitarbeiter.column(1)
End Sub
Private Sub btnEscape_Click()
    DoCmd.Close acForm, Me.Name
End Sub
Public Sub btnNavigator_Click()
' OHNEMUS, Samstag, 11. September 2004
' Hinweise :
On Error GoTo ErrMsg
    Dim lgLastArtAdresse As Long
    lgLastArtAdresse = 20
    OH_NrFunktionRowSource
    If Me!OAdr = -1 Then
    '210807 Gerd:diejenige ArtAdresse angewählt sein, die im letzten entspr. Vorgang benutzt wurde…
        strSQL = "Exec dbo.spa_VG @x = 'lastVG',@i = " & Me!NrQK
        OH_r r
        If Not r.BOF Then
            lgLastArtAdresse = r!LastArtAdresse
        End If
        OH_Navigator 20
        Forms!pf_Navigator!lstStatus = lgLastArtAdresse
    Else
        Me!NrFunktion.SetFocus
        Me!NrFunktion.Dropdown
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btnNavigator_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub OH_NrFunktionRowSource()
' OHNEMUS,  1. September 2005
' Hinweise :
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Z @x = 'FunktionRowSource'"
    OH_A "NrFunktion", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.OH_NrFunktionRowSource"
    End Select
    Resume ErrEnd
End Sub
Private Sub btnVGIDu_Click()
' OHNEMUS, Juni 2005
On Error GoTo ErrMsg
    If IsNull(Me!VGID) And Me!VGID.Visible = True Then
        Me!VGID.SetFocus
        Me!VGID.Dropdown
    Else
        s = Nz(Me!VG, "")
        Me!VGIDu = OH_getVGIDu(Me!VGID) + 1
        Me!VG = s
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuVG.btnVGIDu_Click"
    End Select
    Resume ErrEnd
End Sub
Private Function OH_getVGIDu(lgVG As Long)
' OHNEMUS, Juni 2005
On Error GoTo ErrMsg
    Dim rsVGID As ADODB.Recordset
    strSQL = "Exec dbo.spI_VGDiv @x = 'NextVGIDu', @id2 = " & lgVG
    OH_r rsVGID
    If rsVGID.BOF Then
        OH_getVGIDu = 0
    Else
        OH_getVGIDu = rsVGID!VGIDu
        Me!VG = rsVGID!VG
    End If
    OH_ResetRS rsVGID
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_getVGIDu"
    End Select
    Resume ErrEnd
End Function
Public Sub NrQK_AfterUpdate()
On Error GoTo ErrMsg
    'siehe Bemerkung in spI_VGDiv
    Dim blV As Boolean
    Dim strC As String
    Dim strFrei As String
    btArtikelPreis = 0
    If Not IsNull(Me!VGID) Then
        strSQL = "Exec dbo.spI_VGdiv " & _
            " @x ='Firma aus QK'" & _
            ",@id1 = " & Nz(Me!NrQK) & _
            ",@id2 = " & Nz(Me!VGID) & _
            ",@a = " & Nz(frmVG!NrFirma, 0) & _
            ",@m = " & Nz(Me!OGVGID, 0)
        OH_r r
        strC = Nz(r!ChangeFirma, "")
        blKopieBemerkung = r!KopieBemerkung
        If r!NrFunktion > 0 Then
            If Me!NrFunktion <> r!NrFunktion Then
                Me!NrFunktion = r!NrFunktion
                Me!lblVGDat1.Caption = Nz(r!lblVGDat1, "")
            End If
        Else
            Me!lblVGDat1.Caption = Nz(r!lblVGDat1, "")
            strSQL = "Exec dbo.spI_VGdiv " & _
            " @x ='FirmaAusArtikel'," & _
            " @id1 = " & Nz(Me!NrQK) & " ," & _
            " @id2 = " & lgOld
            OH_r r
            If r.BOF = False Then
                If r!NrFunktion > 0 Then
                    Me!lblVGDat1.Caption = Nz(r!lblVGDat1, "")
                    strW = Trim(Nz(r!EKWährung, "EUR"))
                    If Me!NrFunktion <> r!NrFunktion Then
                        Me!NrFunktion = r!NrFunktion
                    End If
                    If Me!VGWährung <> strW Then
                        s = "Soll die Währung geändert werden?" & vbNewLine & _
                            "Nein, Alt" & vbTab & Me!VGWährung & vbNewLine & _
                            "Ja, Neu" & vbTab & strW
                        t = "WÄHRUNG checken!"
                        i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
                        Select Case i
                        Case vbYes
                            Me!VGWährung = strW
                            Me!VGWährung.BackColor = vbRed
                        Case vbCancel
                            btnEscape_Click
                            GoTo ErrEnd
                        End Select
                    End If
                    btArtikelPreis = 2
                End If
            End If
        End If
    End If
    blV = Me!lblVGDat1.Caption <> ""
    Me!lblVGDat1.Visible = blV
    Me!VGDat1.Visible = blV
    Me!SpinButtonVGDat1.Visible = blV

    Me!txtFrei.Visible = False
    Me!lbltxtFrei.Visible = False
    Me!txtFrei = ""
    Me!lbltxtFrei.Caption = ""
    Select Case Me!NrQK
    Case 53 'ULI HVL
        strFrei = "Auftragsnummer"
        strSQL = "Exec dbo.spA_VG " & _
                 " @x = 'CheckText'" & _
                ", @i = " & lgOld & _
                ", @f ='" & strFrei & "'"
        OH_r r
        If Not r.BOF Then
            s = Nz(r!txtV)
            If Me!OVG <> 1 Then
                s = ""
            End If
            Set ctl = Me!txtFrei
            ctl = s
            Me!lbltxtFrei.Caption = strFrei
            Me!lbltxtFrei.Visible = True
            ctl.Visible = True
        End If
    Case 56 '<R217>
        If frmVG!NrQK = 51 Then
            Me!VGdatum = frmVG!VGdatum
        End If
    End Select


    If Not IsNull(Me!NrFunktion) Then
        NrFunktion_AfterUpdate
        blC = True
    End If
    If strC <> "" Then
        Me!txtAdr.ForeColor = vbRed
        Me!txtAdr.ControlTipText = strC
    Else
        Me!txtAdr.ForeColor = vbBlack
    End If
    OVG_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "NrQK_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub OGVGID_AfterUpdate()
On Error GoTo ErrMsg
    Dim blV As Boolean
    Me!VG.SetFocus
    Select Case Me!OGVGID
    Case 1
        blV = True
    Case 0
        blV = False
        strSQL = "Exec dbo.spI_VGdiv " & _
                    " @x ='maxVGID'"
        OH_r r
        Me!VGIDNeu = r!maxVGID
        Me!VGIDu = 0
    End Select
    Me!comVGID.Visible = blV
    Me!VGIDNeu.Visible = Not blV
    Me!VGID.Visible = blV
    Me!btnVGIDu.Visible = blV
    Me!VGIDu.Visible = blV
    Me!btncomVGID.Visible = blV
    Me!btncomNrVG.Visible = blV
    If Me!NrQK = 53 Then
        Me!VGDat1.SetFocus
    Else
        If Me!VGIDu.Visible = True Then
            Me!VGIDu.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OGVGID_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub OmitTechDat_AfterUpdate()
    If Me!OmitTechDat = -1 Then
        Me!OmitArtikel = -1
    End If
End Sub
Private Sub OmitArtikel_AfterUpdate()
    If Me!OmitArtikel = 0 Then
        Me!OmitTechDat = 0
    End If
End Sub
Private Sub ONeu_AfterUpdate()
    Me!OVG = Not Me!ONeu
    OVG_AfterUpdate
    Me!OGVGID = Not Me!ONeu
    OVGID_AfterUpdate
    OGVGID_AfterUpdate
    Me!OAdr = Not Me!ONeu
End Sub
Public Sub OAdr_AfterUpdate()
    btnNavigator_Click
End Sub
Public Sub OVG_AfterUpdate()
    Me!TxtVG.Enabled = Me!OVG
    Me!TxtVG.Locked = Me!OVG
    Me!OmitArtikel = Me!OVG
    Me!OmitBem = Me!OVG
    Me!OmitInfo = lgVGInfo
    Me!OmitStichwort = Me!OVG
    Me!oMitTeilnehmer = Me!OVG
    Me!OmitTechDat = Me!OVG
    Me!ONeu = Not Me!OVG
    If Me!OmitBem And Not blKopieBemerkung Then
        Me!OmitBem = 0
    End If
End Sub
Private Sub OVGID_AfterUpdate()
On Error GoTo ErrMsg
    Me!VGID = lgVGid
    VGID_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OVGID_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub txtFrei_Enter()
On Error GoTo ErrMsg
    s = Nz(Me!txtFrei, "")
    i = InStr(s, "/")
    If i > 0 Then
        i = 1
        If right(s, 1) = "9" Then
            i = 2
        End If
        Me!txtFrei.SelStart = Len(s) - i
        Me!txtFrei.SelLength = i
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "txtFrei_Enter"
    Resume ErrEnd
End Sub

Private Sub vgbem_GotFocus()
    If InStr(Me!vgbem, strVGbem) > 0 Then
        Me!vgbem = ""
    End If
End Sub

Private Sub VGDat1_KeyDown(KeyCode As Integer, Shift As Integer) '200527
On Error GoTo ErrMsg
    Dim strD() As String
    Dim dd As Long
    Dim mm As Long
    Dim yy As Long
    Dim N As Long
    ' Idee Uli Lips: Wenn man nur den Tag/Monat eingibt, soll automatisch das passende Datum eingetragen werden
    Select Case KeyCode
    Case 13, 9
        ' Idee Uli Lips: Wenn man nur den Tag/Monat eingibt, soll automatisch das passende Datum eingetragen werden
        s = Replace(Nz(Me!VGDat1.Text, ""), ",", ".")
        If s = "" Then
            GoTo ErrEnd
        End If
        strD() = Split(s, ".")
        i = UBound(strD)
        dd = Val(strD(0))
        If i > 0 Then
            mm = Val(strD(1))
        End If
        If i > 1 Then
            yy = Val(strD(2))
        End If
        If dd < 1 Or dd > 31 Then
            dd = Day(Date)
        End If
        If mm < 1 Or mm > 12 Then
            mm = Month(Date)
        End If
        If yy < 1 Then
            yy = Year(Date)
        Else
            If yy < 100 Then
                yy = 2000 + yy
            End If
        End If
        Me!VGDat1 = DateSerial(yy, mm, dd)
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGDat1_KeyDown"
    Resume ErrEnd
End Sub
Private Sub VGDat1_DblClick(Cancel As Integer)
    Me!VGDat1 = Date
End Sub
Private Sub VGDat1_Enter()
On Error GoTo ErrMsg
    Me!VGDat1 = Nz(Me!VGDat1, Date)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "VGDat1_Enter"
    Resume ErrEnd
End Sub
Private Sub VGID_BeforeUpdate(Cancel As Integer)
' OHNEMUS, Juni 2005
On Error GoTo ErrMsg
    Dim rsVGID As ADODB.Recordset
    Dim lgid As Long
    t = "Ändern der Projektnr."
    lgid = Nz(Me!VGID, 0)
    If lgid = 0 Then
        s = "Bitte richtige Projektnr. eingeben!"
        GoTo ErrM
    End If
    strSQL = "Execute spI_VGDiv " & _
            " @x = 'CheckVGID' " & _
            ", @id2 = " & Nz(Me!VGID)
    OH_r rsVGID, strSQL
    If rsVGID.BOF Then
        MsgBox "Bitte prüfen Sie die Projekt-Nr.!" & vbNewLine & _
                "Die Nummer " & Me!VGID & " gibt es NICHT!", _
                vbCritical, "WICHTIGER HINWEIS"
        strSQL = "Execute spI_VGDiv " & _
                " @x = 'maxVGID' "
        OH_r rsVGID, strSQL
        If rsVGID!VGID < Val(Me!VGID) Then
            MsgBox "Bitte prüfen Sie die Projekt-Nr.!" & vbNewLine & _
                    "Die Nummer " & Me!VGID & " gibt es NICHT!" & vbNewLine & _
                    "Die nächst höhere Nummer wäre aber " & rsVGID!VGID + 1, _
                    vbCritical, "WICHTIGER HINWEIS"
        End If
    End If
    OH_ResetRS rsVGID
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = "VGID_BeforeUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    Cancel = True
    GoTo ErrEnd
End Sub
Private Sub VGID_AfterUpdate()
On Error GoTo ErrMsg
    strlblVGID = "ergänze Vorgang <" & Me!VG & ">"
    Me!lblVGID.Caption = strlblVGID
    lgVGid = Me!VGID
    Me!VGIDu = OH_getVGIDu(lgVGid)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub NrFunktion_AfterUpdate()
On Error GoTo ErrMsg
    Dim strW1 As String
    Dim strW2 As String
    If Me!NrFunktion.RowSource = "" Then
        OH_NrFunktionRowSource
    End If
    '110905 Listenfeld bringt nur erste 10'000 Datensätze
    strSQL = "Exec dbo.spa_Z " & _
            " @x = 'FunktionRowSource', " & _
            " @id= " & Me!NrFunktion
    OH_r r
    If Not r.BOF Then
        If left(r!FA, 2) = "<>" Then
            MsgBox r!p1 & vbNewLine & _
                   "Funktion nicht mehr aktiv??", vbExclamation, Me.Caption
        End If
        Me!txtAdr = r!p1 & vbNewLine & _
                    r!FA & " " & r!p2
        Me!NrFirma = r!NrF
        lgNrFunktion = Val(Me!NrFunktion)
        blDuSie = r!DuSie
        strW1 = Nz(Trim(r!VGWährung), "")
        strW2 = Nz(r!WährungFirma, strW1)
        If Nz(Me!VGWährung, strW2) <> strW2 Then
            If blC Then
                t = "WÄHRUNG checken!"
                s = "Die vorgeschlagene Währung weicht ab von der Landeswährung, in der die Firma beheimatet ist!" & vbNewLine & vbNewLine & _
                    "Soll die Währung geändert werden?"
                OH_msgbox s, _
                        Array("Nein" & vbNewLine & "belassen bei   " & Me!VGWährung, _
                            "Ja" & vbNewLine & "ändern auf   " & strW2), vbQuestion, t
                Select Case Val(strMSG(1))
                Case 2
                    Me!VGWährung = strW2
                    Me!VGWährung.BackColor = vbRed
                Case 0
                    btnEscape_Click
                    GoTo ErrEnd
                End Select
            End If
        End If
        If strW1 <> strW2 Then
            Me!lblWährung.Caption = "Achtung Währung <> " & strW1
            Me!lblWährung.ForeColor = vbRed
            Me!lblWährung.BackColor = vbYellow
        Else
            Me!lblWährung.Caption = "Währung"
            Me!lblWährung.ForeColor = vbBlack
            Me!lblWährung.BackColor = Me.Det.BackColor
        End If
        OH_Achtung
        Me!btnNavigator.SetFocus
        'check Insert comEmailPDF
        strSQL = "Execute spa_VG " & _
                    "@x = 'comEmailPDF' " & _
                    ",@i = " & Me!NrFunktion & _
                    ",@b = " & Me!NrQK
        OH_A "comEmailPDF", strSQL, Me
        With Me!comEmailPDF
            i = .ListCount
            If i > 0 Then
                .Value = .column(0, 0)
                If .Value = "x" Then
                    i = 0
                End If
                .Visible = i > 0
                If i > 1 Then
                    Me!lblcomEmailPDF.BackColor = vbYellow
                    Me!lblcomEmailPDF.Caption = "PDF (" & i & ")"
                End If
            End If
        End With
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox OH_Err(Err, Err.Description), vbCritical
    Resume ErrEnd
End Sub
Private Function OH_CheckRabattsatz() As Single
On Error GoTo ErrMsg
    'Rabattsätze Artikel berücksichtigen?
    'unter Stichwort 'Rabattsatz Produkt' bei einer Firma kann ein Rabatt hinterlegt werden
    strSQL = "Exec dbo.spI_VGDiv @x = 'Rabattsatz', @id3 = " & Me!NrFirma
    OH_r r
    If Not r.BOF Then
        If r!Rabatt > 0 Then
            s = "Für " & Me!txtAdr & vbNewLine & _
                      "ist ein Rabatt von " & r!Rabatt & " % hinterlegt!" & vbNewLine & vbNewLine & _
                      "Soll dieser Rabatt übernommen werden?"
            If MsgBox(s, vbYesNo + vbQuestion, "Rabatt") = vbYes Then
                OH_CheckRabattsatz = r!Rabatt
            Else
                OH_CheckRabattsatz = 0
            End If
        End If
    End If
    OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Rabattsatz hinterlegt"
    Resume ErrEnd
End Function
Private Sub VGIDu_Enter()
    If Me!VGIDu.RowSource = "" Then
        strSQL = 1
        For i = 2 To 300
            strSQL = strSQL & ";" & i
        Next i
        Me!VGIDu.RowSource = strSQL
    End If
End Sub
Private Sub VGIDu_DblClick(Cancel As Integer)
    If Me!VGIDu = frmVG!VGIDu Then
        btnVGIDu_Click
    Else
        Me!VGID = frmVG!VGID
        Me!VGIDu = frmVG!VGIDu
    End If
End Sub
Public Sub btnOK_Click()
On Error GoTo ErrMsg
    Dim strT As String
    Dim N As Long
    Dim lgVGid As Long
    Dim lgVGidu As Long
    Dim sgRabatt As Single
    Dim strField As String
    Dim strS As String
    Dim lgLstdet As Long
    DoCmd.Hourglass True
    strT = "Erstelle einen neuen Vorgang"
    If OH_Perm("U", Me, "VG", , Me!NrQK) Then
        GoTo ErrEnd
    End If
    If Me!vgbem = strVGbem And Me!vgbem.Visible Then
        s = strVGbem & vbNewLine & vbNewLine & "eintragen oder entfernen"
        GoTo ErrM
    End If
    If Nz(Me!VGWährung.column(1), "") = "" Then
        s = "Für " & Me!VGWährung & " fehlt der Kurs!"
        t = "Admin fragen"
        GoTo ErrM
    End If
    If OH_Validate(Me!VG, "Projektbezeichnung") = True Then
        GoTo ErrEnd
    End If
    If OH_Validate(Me!NrMitarbeiter, "Mandant") = True Then
        GoTo ErrEnd
    End If
    If OH_Validate(Me!VGWährung, "Währung") = True Then
        GoTo ErrEnd
    End If
    If Me!VGID.Visible = True Then '180625 Nur abfragen, wenn auch sichtbar!!
        If OH_Validate(Me!VGID, "Projekt-Nr.") = True Then
            GoTo ErrEnd
        End If
    End If
    If InStr(Me!lblVGDat1.Caption, "Leistung") > 0 Then
        If OH_Validate(Me!VGDat1, Me!lblVGDat1.Caption) = True Then
            Me!VGDat1.SetFocus
            Me!VGDat1.BackColor = vbRed
            GoTo ErrEnd
        End If
    End If
    If Me!OGVGID = 1 Then
        lgVGid = Me!VGID
        lgVGidu = Me!VGIDu
    Else
        '171017 wenn 2 User gleichzeitig eine neue VGID wollen und einer länger wartet, könnte es zur GLEICHEN VGID führen
        'Deshalb wird die Neue VGID direkt vor dem Erstellen nochmal abgefragt.
        lgVGid = Me!VGIDNeu
        strSQL = "Exec dbo.spI_VGdiv " & _
                    " @x ='maxVGID'"
        OH_r r
        N = r!maxVGID
        Me!VGIDNeu = r!maxVGID
        lgVGidu = 0
        If lgVGid <> N Then
            t = "Prüfe die neu zu vergebende Projekt-Nummer"
            s = "Hinweis" & vbNewLine & _
                "Zwischenzeitlich hat ein anderer User bereits die neue Projekt-Nr. " & Me!VGIDNeu & vbNewLine & _
            "erstellt." & vbNewLine & vbNewLine & _
            "Sie erhalten jetzt diese neue Nummer: " & N
            If MsgBox(s, vbOKCancel + vbExclamation, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        lgVGid = N
    End If
    If Me!OmitArtikel Then
        If btArtikelPreis <> 2 Then
            btArtikelPreis = 1
        End If
    Else
        btArtikelPreis = 0  'OH080401
    End If
    If OH_Projektstopp(lgVGid, lgVGidu) Then
        GoTo ErrEnd
    End If
    If Me!comAnzahl <> 1 Then
        s = "Bitte bestätigen Sie, dass " & Me!comAnzahl & " Vorgänge erfasst werden sollen!"
        If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, strT) = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    SysCmd acSysCmdSetStatus, strT & " 1: SQL-Server ist am Arbeiten"
    sgRabatt = OH_CheckRabattsatz
    If Me!OVG Then 'hat sich inzwischen die Anschrift der Fa. geändert

    End If
    strSQL = "Exec dbo.spI_VG " & _
                  "  @IDVG = " & lgOld & _
                  ", @qkn = " & Val(Me!NrQK) & _
                  ", @VGID = " & lgVGid & _
                  ", @VGIDu = " & lgVGidu & _
                  ", @VG = '" & OH_RPL(Me!VG) & _
                  "',@MA = " & Me!NrMitarbeiter & _
                  ", @IdF = " & Me!NrFunktion & _
                  ", @VGDatum = '" & Format(Me!VGdatum, "yyyymmdd") & _
                  "',@VGDat1 = '" & Format(Nz(Me!VGDat1, ""), "yyyymmdd") & _
                  "',@VGWährung = '" & Me!VGWährung & "'" & _
                  ", @VGRabatt = " & sgRabatt & _
                  ", @Copy = " & Me!OVG & _
                  ", @ArtikelPreis = " & btArtikelPreis & _
                  ", @TechnDatenCopy = " & Me!OmitTechDat & _
                  ", @BemCopy = " & Me!OmitBem & _
                  ", @InfoCopy =" & Me!OmitInfo & _
                  ", @StichwortCopy = " & Me!OmitStichwort & _
                  ", @KontaktCopy = " & Me!oMitTeilnehmer & _
                  ", @txtFrei = '" & Me!lbltxtFrei.Caption & _
                  "',@txtVFrei = '" & Me!txtFrei & _
                  "',@Copies = " & Me!comAnzahl & _
                  ", @VGBem = '" & OH_RPL(Me!vgbem) & _
                  "', @EmailVersand = '" & Nz(Me!comEmailPDF) & "'"
    OH_r r
    lgNew = r!ID
    s = r!Msg
    If lgNew = 0 Or s <> "" Then
        s = Me.Caption & vbNewLine & vbNewLine & _
               s
        GoTo ErrM
    End If
    SysCmd acSysCmdSetStatus, strT & " 2: Suche neuen Vorgang und Update der Listen"
    OH_OF frmVG.Name, lgNew
    frmVG!LastUpdate = Now
    If frmVG!NrQK = 51 Then
        'Prüfe auf mehrere Rechnungsanschriften
        strSQL = "Exec dbo.spI_VGdiv " & _
                " @x ='Rechnungsanschrift'," & _
                " @id1 = " & Me!NrFirma
        OH_r r
        If r!CT > 1 Then
            s = "Diese Firma hat " & r!CT & " Rechnungsanschriften!" & vbNewLine & _
                "Im gelben Auswahlfeld neben der Anschrift können Sie diese auswählen!"
            MsgBox s, vbExclamation, strT
        End If
    End If
    If Len(glstrPS) > 0 Then
        frmVG!PS = glstrPS
    End If
    If glMWStPflichtig = 0 Then '210130
        frmVG!inclMWST = 1
        frmVG!MWSt = 0
        frmVG!MWSt1 = 0
    End If
    OH_SaveRS frmVG
    SysCmd acSysCmdSetStatus, strT & " 3 MWST - Kontrolle"
    VarAntw = "CheckMWST"
    frmVG.MWSt_Enter
'============================
    If btArtikelPreis > 0 Then
        frmVG.OH_Calcsum Nz(frmVG!NrVG, 0)
    End If
    frmVG.OH_CheckSollHaben
    OH_SaveRS frmVG
    If strMSG(1) = "ArtikelHinzufügen" Then
        i = 1
        strSQL = "Exec dbo.spI_VGdiv " & _
                " @x ='NeuArtikelVGdet'," & _
                " @id1 = " & Val(strMSG(2)) & " ," & _
                " @id2 = " & lgNew & "," & _
                " @r1 =  " & Val(strMSG(3))
        OH_r r
        If r(0) = 0 Then
            MsgBox "Artikel nicht übernommen!", vbCritical, _
                    "Fehlt Lieferant oder Währung?"
        End If
    End If
    'Bei Erstellung Vorgänge schliessen
    strS = "Exec dbo.spI_VGdiv " & _
        " @x ='+Bei Erstellung Vorgänge schliessen'" & _
        ", @id1 = " & lgNew & _
        ", @id2 = " & Me!NrQK
    OH_r r, strS
    s = r!Msg
    If s <> "" Then
        s = "Zu diesem Projekt " & frmVG!VGID & " gibt es offene Vorgänge:" & vbNewLine & _
            s & vbNewLine & vbNewLine & _
            "Abschliessen?"
        If MsgBox(s, vbYesNo + vbQuestion, strT) = vbYes Then
            strSQL = strS & ",@i = 1"
            OH_EX
        End If
    End If
    DoCmd.Close acForm, Me.Name
    SysCmd acSysCmdSetStatus, strT & " Fertig"
    If glVGFix = False Then
        strSQL = frmVG!lstDet.Recordset.Source
        i = InStr(strSQL, ", @n")
        If i > 0 Then
            strSQL = left(strSQL, i - 1)
        End If
        strSQL = strSQL & ", @n = " & lgNew
        OH_A "lstdet", strSQL, frmVG, lgNew
        OH_setLst frmVG!lstDet, lgNew
    Else
        OH_setLst frmVG!lstDet, Val(frmVG!lstDet.Tag)
    End If
ErrEnd:
    DoCmd.Hourglass False
    SysCmd acSysCmdRemoveMeter
    OH_ResetRS rs
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = strT
    Resume ErrM
ErrM:
   MsgBox s, vbCritical, t
GoTo ErrEnd
End Sub
Private Sub SpinButtonVGdatum_SpinDown()
    Me!VGdatum = Me!VGdatum - 1
End Sub
Private Sub SpinButtonVGdatum_Spinup()
    Me!VGdatum = Me!VGdatum + 1
End Sub
Private Sub SpinButtonVGdat1_SpinDown()
    Me!VGDat1 = Nz(Me!VGDat1, Date) - 1
End Sub
Private Sub SpinButtonVGdat1_Spinup()
    Me!VGDat1 = Nz(Me!VGDat1, Date) + 1
End Sub
Private Function OH_Achtung()
On Error GoTo ErrMsg
    'rote Anzeige, wenn zur Firma in Stichworten ein ACHTUNG hinterlegt ist
    'wenn Adresse inaktiv
    '201010 wenn die Firma austehende Gelangensbestätigungen hat <R134>
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x ='Achtung'" & _
            ", @i = " & Me!NrFunktion & _
            ", @u = " & lguser & _
            ", @a = " & Me!NrQK
    OH_r r
    If Len(r!Achtung) < 8 Then
        Me!lblAchtung.Visible = False
    Else
        Me!lblAchtung.Visible = True
        Me!lblAchtung.Caption = r!Achtung
    End If
ErrEnd:
    SysCmd acSysCmdRemoveMeter
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_Achtung"
    End Select
Resume ErrEnd
End Function
Private Sub comAnzahl_GotFocus()
    OH_Number Me, Me!comAnzahl, 50
End Sub
