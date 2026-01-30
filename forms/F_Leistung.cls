Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim strsqlA As String
Dim lgIDL As Long
Dim blID As Boolean
Private Sub Form_Error(DataErr As Integer, Response As Integer)
    Response = OH_Form_error(DataErr)
End Sub
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_FormHeight Me
    With Me!lstDet
        .ColumnCount = 7
        .ColumnWidths = OH_ColumnWidthsMM("0;16;5;10;15;40")
    End With
    OH_A "lstAktiv", , Me
    Me!lstAktiv = 11
    OH_A "lstOB", , Me
    OH_A "lstTopA", , Me
    Me!lstTopA = 40
    lstTopA_AfterUpdate
    OH_A "lstMitarbeiter", , Me
    OH_A "NrBearbeiter", , Me
    OH_A "lstBem", , Me
    Me!Rechnungbis = Date
    OH_Number Me, Me!StdAuswärts, 24, 1
    OH_Number Me, Me!Übernachtung, 10, 1
    txtFind_AfterUpdate
    OH_A "lstA", , Me
    OH_A "lstKunde", , Me
    OH_ControlTiptext Me
    OH_SetFontRT Me!BemLeistung
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ActivateTab "tabMain"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Form_Activate"
    Resume ErrEnd
End Sub
Private Sub Form_Current()
On Error GoTo ErrMsg
    If Me.RecordSource = "" Then
        GoTo ErrEnd
    End If
    s = "Anzahl in " & Me!LiefereinheitVG & " mit + / - Taste verändern" & vbNewLine & _
        "mit Doppel-Klick um 1 erhöhen"
    Me!AnzahlLeistung.ControlTipText = s
    If Nz(Me!lstKontakt, 0) <> Nz(Me!IDFunktion, 0) And Nz(Me!IDFunktion, 0) <> 0 Then
        txtfindKontakt_AfterUpdate
        If Me!lstKontakt.ListCount = 0 And Me!txtfindKontakt <> "" Then
            Me!txtfindKontakt = ""
            txtfindKontakt_AfterUpdate
        End If
        OH_SetIDinLst Me!lstKontakt, Me!IDFunktion
    End If
    Me!btnTelefon.Visible = Nz(Me!Telefon, "") <> ""
    Me!btnTelefon.ControlTipText = Me!NamePerson & " anrufen mit der Tel.-Nr.: " & Me!Telefon
    If Me!NrVGdetR > 0 Then
        s = "anzeigen"
        i = vbGreen
    Else
        s = "erstellen?"
        i = vbRed
    End If
    Me!btnRech.Caption = "Rechnung  " & s
    Me!btnRech.ForeColor = i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Form_Current"
    Resume ErrEnd
End Sub

Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    t = "Leistungen speichern!"
    If OH_Validate(Me!AnzahlLeistung, "Anzahl") Then Cancel = True: Exit Sub
    If Me!StatusLeistung = 0 And Me!StatusLeistung.OldValue <> 0 Then
        If MsgBox("Datum" & vbTab & Me!DatumTag & vbNewLine & _
                  "Anzahl" & vbTab & Me!AnzahlLeistung & " " & Me!LiefereinheitVG & vbNewLine & _
                  "Artikel" & vbTab & left(Me!Artikel, 50) & vbNewLine & vbNewLine & _
                  "Sind die Std. verrechenbar ?", _
                vbQuestion + vbYesNo, Me!VG) = vbYes Then
            Me!StatusLeistung = -1
        End If
    End If
    If Me!AnzahlLeistung = 0 Then
        If MsgBox("Hinweis: Sie haben keine (0) " & Me!LiefereinheitVG & " erfasst!" & vbNewLine & vbNewLine & _
                   "Ist das so in Ordnung???", vbExclamation + vbYesNo, _
                "Leistungen: " & Me!Firma & " " & Me!VG) = vbNo Then
            Cancel = True
            Me!AnzahlLeistung.SetFocus
        End If
    End If
    s = "Das Datum " & Me!DatumTag & " liegt "
    If DateDiff("D", Me!DatumTag, Date) < 0 Then
        s = s & "in der Zukunft"
        GoTo errMQ
    End If
    If DateDiff("D", Me!DatumTag, Date) > 60 Then
        s = s & "mehr als 2 Monate zurück"
        GoTo errMQ
    End If
    OH_SaveRecord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
errMQ:
    If MsgBox(s, vbExclamation + vbOKCancel, t) = vbCancel Then
        Cancel = True
        GoTo ErrEnd
    Else
        OH_SaveRecord
        GoTo ErrEnd
    End If
End Sub
Private Sub Form_DblClick(Cancel As Integer) 'öffne Formular Bestellungen
On Error GoTo ErrMsg
    btnProjekt_Click
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.RecordSource = ""
End Sub
Private Sub btnBemleistung_Click()
On Error GoTo ErrMsg
    OH_RT Me!BemLeistung
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnBemleistung_Click"
    Resume ErrEnd
End Sub
Private Sub btnBemleistungtextBaustein_Click()
On Error GoTo ErrMsg
    Dim strBN As String
    Dim strBO As String
    strBO = Nz(Me!BemLeistung, "")
    Me!BemLeistung.SetFocus
    OH_Openlexikon "Bemerkungen Leistungen", , , "BemLeistung", Me, False
    If strBO <> "" Then
        strBN = Nz(Me!BemLeistung, "")
        If strBN <> "" And strBN <> strBO Then
            t = "bestehender Eintrag!"
            s = "Soll der bestehende Eintrag überschrieben werden?"
            i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
            Select Case i
            Case vbCancel
                Me!BemLeistung = strBO
            Case vbNo
                Me!BemLeistung = strBO & strBN
            End Select
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnBemleistungtextBaustein_Click"
    Resume ErrEnd
End Sub
Private Sub btnInfoLeistung_Click()
On Error GoTo ErrMsg
    Dim strA(1 To 5) As String
    Dim vararray As Variant
    t = "Infos zu Leistung " & Me!Firma
    OH_A "@x = 'InfoLeistungLast'"
    strA(1) = "Auswahl eintragen, nicht verrechenbar"
    strA(2) = "Auswahl eintragen, verrechenbar"
    strA(3) = "Ich möchte lediglich editieren"
    strA(4) = "Eintrag komplett löschen" & vbNewLine & left(Me!InfoLeistung, 30)
    vararray = Array(strA(1), strA(2), strA(3))
    If Nz(Me!InfoLeistung, "") <> "" Then
        vararray = Array(strA(1), strA(2), strA(3), strA(4))
    End If
    strA(5) = "Die letzten 20 Einträge werden angezeigt"
    '=============
    OH_msgbox s, vararray, vbQuestion, t, strA(5), , , _
                strSQL, 1, "100"
    '============
    i = Val(strMSG(1))
    If i = 0 Then
        GoTo ErrEnd
    End If
    strMSG(3) = Mid(strMSG(3), 2, Len(strMSG(3)) - 2)
    Select Case strMSG(2)
    Case strA(1)
        Me!InfoLeistung = strMSG(3)
        Me!StatusLeistung = 0
    Case strA(2)
        Me!InfoLeistung = strMSG(3)
        Me!StatusLeistung = 1
    Case strA(3)
        OH_RT Me!InfoLeistung
    Case strA(4)
        Me!InfoLeistung = Null
    End Select
    OH_SaveRS Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnInfoLeistung_Click"
    Resume ErrEnd
End Sub
Private Sub countRec_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_PF_Tab Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.countRec_DblClick"
    Resume ErrEnd
End Sub
Private Sub Firma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_SetFilter1
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Firma_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    OH_DeleteRS Me
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Public Sub lstA_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim N As Long
    lgA = Nz(Me!lstA, 0)
    DoCmd.Hourglass True
    For N = 1 To 3
        OH_A "@x = 'lstA' " & _
            ", @i = " & Me!NrLeistung & _
            ", @a = " & lgA & _
            ", @n = " & N & _
            ", @b = " & Nz(Me!lstTopA, 100) & _
            ", @f = '" & Nz(Me!projektNr, "") & _
            "',@m = " & Nz(Me!VGID, 0), , Me
        Select Case N
        Case 1
            OH_A "lstact", strSQL, Me
        Case 2
            OH_r r
            With Me!lstD
                .ColumnCount = r!CC
                .ColumnWidths = OH_ColumnWidthsMM(r!CW)
            End With
            Select Case Me!lstA
            Case 40
                Me!lstact = 1
            Case 50
                Me!lstact = 30
            Case Else
                Me!lstact = 10
            End Select
        Case 3
            OH_A "lstD", strSQL, Me
            Me!countM = Me!lstD.ListCount - 1
        End Select
    Next N
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstA_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Sub
Public Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgDet As Long
    Dim lgQ As Long
    Dim lgV As Long
    Dim lgA As Long
    Dim lgK As Long
    Dim lgact As Long
    Dim N As Long
    Dim strP As String
    Dim strStartT As String
    Dim strStartD As String
    lgK = Nz(Me!lstKontakt, 0)
    lgA = Nz(Me!lstA, 0)
    lgact = Nz(Me!lstact, 0)
    lgV = Val(Nz(Me!lstD.column(1), 0))
    lgQ = Val(Nz(Me!lstD.column(2), 0))
    lgDet = Val(Nz(Me!lstD.column(0), 0))
    DoCmd.Hourglass True
    t = Me!lstA.column(1) & " ==> " & Me!lstact.column(1)
    Select Case lgA
    Case 10
        If lgV = 0 Then
            s = "Rechts das gewünschte Projekt markieren"
            GoTo ErrM
        End If
        Select Case lgact
        Case 10
            OH_OF "F_VG", lgV
        Case 20
            strSQL = "EXEC spa_VG " & _
                " @x = 'ID', " & _
                " @i = " & lgV
            OH_r r
            strP = r!projektNr
            Me!txtFind = "N:" & strP
            txtFind_AfterUpdate
        Case 29, 30, 31, 32, 33, 34
            If lgQ <> 30 Then
                s = "Bitte rechts in der Liste ein Projekt Art = 30 anwählen!"
                GoTo ErrM
            End If
            If Me!lstD.column(9) = "xx" Then
                s = "Dieses Projekt ist bereits abgeschlossen!"
                If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
                    GoTo ErrEnd
                End If
            End If
            Y = lgK
            i = 1
            Select Case lgact
            Case 32, 33
                If lgact = 32 Then
                    strStartT = "ANFANG"
                    strStartD = Primo(DateAdd("m", 1, Me!DatumTag))
                Else
                    strStartT = "ENDE"
                    strStartD = Ultimo(DateAdd("m", 1, Me!DatumTag))
                End If
                s = "Pro Monat wird jeweils am MONATS-" & strStartT & " eine Leistung erstellt für" & vbNewLine & _
                    "Projekt " & Me!Firma & " " & Me!projektNr & vbNewLine & _
                    Me!Artikel & vbNewLine & vbNewLine & _
                    "Erster Eintrag erfolgt am " & strStartD & vbNewLine & _
                    "Bitte ANZAHL MONATE eingeben:"
NochmalMonat:
                i = Val(InputBox(s, t, 11))
                If i < 1 Then
                    GoTo ErrEnd
                End If
                If i > 12 Then
                    s = s & vbNewLine & "Mehr als 12 Monate sind nicht vorgesehen!"
                    GoTo NochmalMonat
                End If
            End Select
            If lgact = 34 Then
                s = "Pro Jahr wird am " & Format(Me!DatumTag, "dd.mm") & " jeweils eine Leistung erstellt für" & vbNewLine & _
                    "Projekt " & Me!Firma & " " & Me!projektNr & vbNewLine & _
                    Me!Artikel & vbNewLine & vbNewLine & _
                    "Erster Eintrag erfolgt am " & DateAdd("y", 1, Me!DatumTag) & vbNewLine & _
                    "Bitte ANZAHL JAHRE (max = 5) eingeben:"
NochmalJahr:
                i = Val(InputBox(s, t, 5))
                If i < 1 Then
                    GoTo ErrEnd
                End If
                If i > 5 Then
                    s = s & vbNewLine & "Mehr als 5 Jahre sind nicht vorgesehen!"
                    GoTo NochmalJahr
                End If
            End If
            OH_A "@x = 'NeueLeistung' " & _
                ", @i = " & Me!NrLeistung & _
                ", @n = " & lgDet & _
                ", @y = " & lguser & _
                ", @a = " & lgact & _
                ", @m = " & i
            OH_r r
            lgIDL = r!ID
            If lgIDL > 0 Then
                OH_SetRS Me, lgIDL
            End If
            If lgact = 29 Then
                Me!lstBem = 22
                OH_SetIDinLst Me!lstKontakt, Y
                lstBem_AfterUpdate
            End If
            Me!txtFind = ""
            Me!lstKunde = 0
            Me!lstMitarbeiter = 0
            Me!lstAktiv = 12
            lstAktiv_AfterUpdate
            lstDet = lgIDL
        Case 35
            If Nz(Me!NrVGdetR, 0) > 0 Then
                s = Me!Artikel & vbNewLine & _
                    "ist bereits verechnet!"
                GoTo ErrM
            End If
            If lgQ <> 30 Then
                s = "Bitte rechts in der Liste ein Projekt Art = 30 anwählen!"
                GoTo ErrM
            End If
            If lgDet = Me!nrVGDet Then
                s = "Bitte rechts in der Liste eine andere Position anwählen!"
                GoTo ErrM
            End If
            s = "Verschiebe " & Me!AnzahlLeistung & " " & Me!LiefereinheitVG & " vom " & Me!DatumTag & vbNewLine & vbNewLine & _
                "von:" & vbTab & Me!Artikel & vbNewLine & _
                "auf:" & vbTab & Me!lstD.column(8)
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
                OH_A "@x = 'VerschiebeLeistung' " & _
                    ", @i = " & Me!NrLeistung & _
                    ", @a = " & lgDet
                OH_EX
                OH_RQf Me
            End If
        End Select
    Case 20
        If lgV = 0 Then
            s = "Rechts das gewünschte Projekt markieren"
            GoTo ErrM
        End If
        Select Case lgact
        Case 10
            OH_OF "F_VG", lgV
        Case 20
            strSQL = "EXEC spa_VG " & _
                    " @x = 'ID' " & _
                    ", @i = " & lgV
            OH_r r
            Me!txtFind = "N:" & r!projektNr
            txtFind_AfterUpdate
        Case 21
            strSQL = "EXEC spa_VG " & _
                    " @x = 'ID' " & _
                    ", @i = " & lgV
            OH_r r
            OH_OF "F_Adresse", r!NrFirma, 1
        Case 30
            OH_A "@x = 'NeueLeistung' " & _
                ", @n = " & lgDet & _
                ", @m = " & lguser & _
                ", @a = " & lgact
            OH_r r
            If r!ID > 0 Then
                OH_SetRS Me, r!ID
            End If
        Case 40 'abmelden
            strSQL = "EXEC spa_VG " & _
                    " @x = 'ID' " & _
                    ",@i = " & lgV
            OH_r r
            t = "Projekt abschliessen (nicht mehr offen)"
            Set ctl = Me!lstD
            s = r!VG & vbNewLine & _
                r!Firma & vbNewLine & _
                r!projektNr & vbNewLine & vbNewLine & _
                "abschliessen?"
            If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
                Y = ctl.ListIndex
                strSQL = "Exec dbo.spa_VG " & _
                    " @x='VGAbschluss1' " & _
                    ",@i = " & lgV & _
                    ",@a = 1"
                OH_EX
                If OH_isloaded("F_VG") Then
                    If Forms!F_VG!NrVG = lgV Then
                        OH_RQf Forms!F_VG
                    End If
                End If
                lstA_AfterUpdate
            End If
        End Select
    Case 30
        If lgDet = 0 Then
            s = "Rechts das gewünschte Projekt markieren"
            GoTo ErrM
        End If
        Select Case lgact
        Case 10
            Me!txtFind = "KW:" & lgDet
            txtFind_AfterUpdate
        End Select
    Case 40
        Select Case lgact
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
            OH_DeleteRS Me, lgact '170902
            OH_RQ Me!lstDet
        End Select
    Case 50
        OH_A "@x = 'lstA'" & _
            ",@a = " & lgA & _
            ",@i = " & Me!nrVGDet & _
            ",@n = 3 " & _
            ",@b = " & Me!lstTopA & _
            ",@m = " & lgact
        OH_A "lstD", strSQL, Me
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Sub
Private Sub lstBem_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgVG As Long
    Dim lgact As Long
    Dim lgL As Long
    Dim strT As String
    Dim f As Form
    Dim strQ As String
    t = Nz(Me!lstBem.column(1))
    strT = t
    lgact = Nz(Me!lstBem)
    i = OH_InsertID_LST(Me!lstKontakt, True, True)
    OH_A "@x = 'lstBem' " & _
        ", @i = " & Me!NrLeistung & _
        ", @a = " & lgact
    strQ = strSQL
    Select Case lgact
    Case 25
        'das komlette Feld markieren und die Mini-Toolbar zum Formatieren öffnen
        With Me!BemLeistung
         .SetFocus
         .SelStart = 0
         .SelLength = Len(Nz(.Text, ""))
        End With
        'DoCmd.ShowToolbar oder so???
        Me!BemLeistung = Application.PlainText(Me!BemLeistung)
    Case 26 '<R9>
        If Not OH_isloaded("F_VG") Then
            s = "Bitte das Projekt, auf das verschoben werden soll, als Vorgang öffnen!"
            GoTo ErrM
        End If
        Set f = Forms!F_VG
        If Nz(Me!NrVGdetR, 0) <> 0 Then
            s = "Die Leistung ist schon verrechnet, trotzdem weiter?"
            i = MsgBox(s, vbExclamation + vbOKCancel, t)
            If i = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        Select Case f!NrQK
        Case 30
        Case Else
            s = "Bitte in den Vorgängen einen 30er anwählen!"
            GoTo ErrM
        End Select
        DoCmd.openForm "F_VG"
        f!Position.SetFocus
        s = f!VGdatum & " " & f!VG & vbNewLine & _
            f!Firma
        s = s & vbNewLine & _
            "Position " & f!Position & " " & f!ArtikelText & vbNewLine & _
            "=====>>>>" & vbNewLine & _
            Me!DatumTag & " " & Me!AnzahlLeistung & " " & Me![LiefereinheitVG] & vbNewLine & vbNewLine & _
            "JA" & vbTab & "Verschiebe die aktuell angezeigte Leistung?" & vbNewLine & _
            "Nein" & vbTab & "Verschiebe die " & Me!countRec & " gefilterten Leistungen?"
        lgL = Nz(f!nrVGDet, 0)
        i = MsgBox(s, vbYesNoCancel + vbDefaultButton1 + vbQuestion, t)
        Select Case i
        Case vbYes, vbNo
            OH_ResetID
            If i = vbYes Then
                OH_InsertID Me!NrLeistung
            Else
                OH_InsertID_LST Me!lstDet, , False
            End If
            strSQL = strQ & _
                    ",@n = " & lgL
            OH_EX
            If i = vbYes Then
                OH_RQf Me
            Else
                OH_RQ Me!lstDet, Me!NrLeistung
            End If
        Case vbCancel
            GoTo ErrEnd
        End Select
        DoCmd.openForm "F_Leistung"
        Me!AnzahlLeistung.SetFocus
    Case 27 '<R143>
        If Not OH_isloaded("F_VG") Then
            s = "Bitte die Rechnung, mit der die Leistung verrechnet werden soll, als Vorgang öffnen!"
            GoTo ErrM
        End If
        Set f = Forms!F_VG
        If Nz(Me!NrVGdetR, 0) <> 0 Then
            s = "Die Leistung ist schon verrechnet, trotzdem weiter?"
            i = MsgBox(s, vbExclamation + vbOKCancel, t)
            If i = vbCancel Then
                GoTo ErrEnd
            End If

        End If
        Select Case f!NrQK
        Case 51
        Case Else
            s = "Bitte in den Vorgängen eine Rechnung (51er) anwählen!"
            GoTo ErrM
        End Select
        DoCmd.openForm "F_VG"
        f!Position.SetFocus
        s = "Verschiebe die aktuell angezeigte Leistung: " & vbNewLine & _
            Me!DatumTag & " " & Me!AnzahlLeistung & " " & Me![LiefereinheitVG] & vbNewLine & vbNewLine & _
            "auf die Rechnung:" & vbNewLine & _
            Format(f!VGdatum, "dd.mm.yy") & " " & f!VG & vbNewLine & _
            f!Firma & vbNewLine & _
            "Position " & f!Position & " " & f!ArtikelText
        lgL = Nz(f!nrVGDet, 0)
        i = MsgBox(s, vbOKCancel + vbDefaultButton1 + vbQuestion, t)
        Select Case i
        Case vbOK
            strSQL = strQ & _
                    ",@n = " & lgL
            OH_EX
            OH_RQf Me
        Case vbCancel
            GoTo ErrEnd
        End Select
        DoCmd.openForm "F_Leistung"
        Me!AnzahlLeistung.SetFocus
    Case 29 'NEUE ONLINE-Session mit...
        If Me!lstA <> 10 Then
            Me!lstA = 10
            lstA_AfterUpdate
        End If
        Me!lstact = 29
        lstAct_AfterUpdate
    Case 30
        Me!BemLeistung = Null
        Me!BemLeistung.SetFocus
        Me!DatumTag = Date
        Me!DatumTag.BackColor = vbGreen
        Me!AnzahlLeistung = 0
        Me!AnzahlLeistung.BackColor = vbRed
    Case 31
        i = OH_InsertID_LST(Me!lstDet, True, True)
        If i = 0 Then
            s = "Bitte rechts mindestens eine Leistung markieren!"
            GoTo ErrM
        Else
            s = "markierte Leistungen (" & i & ") nach als NICHT verrechenbar speichern?"
            If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbOK Then
                OH_EX strQ
                OH_RQf Me
            End If
        End If
    Case Else
        If DateDiff("d", Me!DatumTag, Date) > 1 Then
            If MsgBox("Achtung bitte!!!" & vbNewLine & _
                    "Datum liegt in der Vergangenheit!" & vbNewLine & vbNewLine & vbNewLine & _
                    "Änderung in der Bemerkung dennoch vornehmen?", _
                    vbDefaultButton2 + vbCritical + vbYesNo, _
                    strT) = vbNo Then
                GoTo ErrEnd
            End If
        End If
        SysCmd acSysCmdSetStatus, strT
        DoCmd.Hourglass True
        OH_SaveRS Me
        OH_EX strQ
        OH_RQf Me
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstBem_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstDet_AfterUpdate()
On Error GoTo ErrMsg
    OH_lstdet Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstDet_AfterUpdate"
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
    MsgBox Err & " " & Err.Description, vbCritical, "lstDet_KeyDown"
    Resume ErrEnd
End Sub
Private Sub lstD_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Select Case Me!lstA
    Case Is < 40
        lstAct_AfterUpdate
    Case Else
        OH_SetRS Me, Me!lstD.column(0)
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstD_DblClick"
    Resume ErrEnd
End Sub

Private Sub lstKontakt_DblClick(Cancel As Integer)
    OH_OF "F_Adresse", Nz(Me!lstKontakt, 0)
End Sub

Private Sub lstKunde_DblClick(Cancel As Integer)
    OH_OF "F_Adresse", Me!lstKunde, 1
End Sub

Private Sub lstTopA_AfterUpdate()
On Error GoTo ErrMsg
    OH_A "lstA", "@f = '" & Me!lstTopA.column(1) & "'", Me
    txtFind_AfterUpdate
    Me!lstTopA.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstTopA_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstOB_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstOB.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstOB_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstMitarbeiter_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstMitarbeiter.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstMitarbeiter_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub projektNr_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = "N:" & Me!projektNr
    txtFind_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.projektNr_DblClick"
    Resume ErrEnd
End Sub
Private Sub Rechnungbis_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!Rechnungbis = Date
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Rechnungbis_DblClick"
    Resume ErrEnd
End Sub
Private Sub Rechnungbis_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!Rechnungbis, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Rechnungbis_KeyPress"
    Resume ErrEnd
End Sub
Private Sub Rechnungvon_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!Rechnungvon, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Rechnungvon_KeyPress"
    Resume ErrEnd
End Sub
Private Sub SpinButtonRechnungvon_SpinDown()
On Error GoTo ErrMsg
    Me!Rechnungvon = Nz(Me!Rechnungvon, Date + 1) - 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonRechnungvon_SpinDown"
    Resume ErrEnd
End Sub
Private Sub SpinButtonRechnungvon_Spinup()
On Error GoTo ErrMsg
    Me!Rechnungvon = Nz(Me!Rechnungvon, Date - 1) + 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonRechnungvon_Spinup"
    Resume ErrEnd
End Sub
Private Sub SpinButtonRechnungbis_SpinDown()
On Error GoTo ErrMsg
    Me!Rechnungbis = Nz(Me!Rechnungbis, Date + 1) - 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonRechnungbis_SpinDown"
    Resume ErrEnd
End Sub
Private Sub SpinButtonRechnungbis_Spinup()
On Error GoTo ErrMsg
    Me!Rechnungbis = Nz(Me!Rechnungbis, Date - 1) + 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonRechnungbis_Spinup"
    Resume ErrEnd
End Sub
Private Sub DatumTag_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!DatumTag, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.DatumTag_KeyPress"
    Resume ErrEnd
End Sub
Private Sub AnzahlLeistung_KeyPress(KeyAscii As Integer)
On Error GoTo ErrMsg
    OH_DatePlusMinus Me!AnzahlLeistung, KeyAscii
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.AnzahlLeistung_KeyPress"
    Resume ErrEnd
End Sub
Private Sub AnzahlLeistung_Click()
On Error GoTo ErrMsg
    OH_closeObj "PF_Kalender"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.AnzahlLeistung_Click"
    Resume ErrEnd
End Sub
Private Sub AnzahlLeistung_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    i = Nz(Me!AnzahlLeistung, 0) + 1
    Me!AnzahlLeistung = i
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.AnzahlLeistung_Click"
    Resume ErrEnd
End Sub
Private Sub SpinButtonDatumTag_SpinDown()
On Error GoTo ErrMsg
    Me!DatumTag = Me!DatumTag - 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonDatumTag_SpinDown"
    Resume ErrEnd
End Sub
Private Sub SpinButtonDatumTag_Spinup()
On Error GoTo ErrMsg
    Me!DatumTag = Me!DatumTag + 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonDatumTag_Spinup"
    Resume ErrEnd
End Sub
Private Sub SpinButtonAnzahlLeistung_SpinUp()
On Error GoTo ErrMsg
    Select Case Round(Nz(Me!AnzahlLeistung, 0), 3)
    Case 0
        Me!AnzahlLeistung = 0.5
    Case Is < 0.5
        Me!AnzahlLeistung = Me!AnzahlLeistung + 0.1
    Case Else
        Me!AnzahlLeistung = Me!AnzahlLeistung + 0.5
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonAnzahlLeistung_SpinUP"
    Resume ErrEnd
End Sub
Private Sub SpinButtonAnzahlLeistung_SpinDown()
On Error GoTo ErrMsg
    Select Case Round(Nz(Me!AnzahlLeistung, 0), 3)
    Case Is <= 0
        Me!AnzahlLeistung = 0
    Case Is < 1
        Me!AnzahlLeistung = Me!AnzahlLeistung - 0.1
    Case Else
        Me!AnzahlLeistung = Me!AnzahlLeistung - 0.5
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.SpinButtonAnzahlLeistung_SpinDown"
    Resume ErrEnd
End Sub
Private Sub StatusLeistung_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strS As String
    Dim strGrund As String
    lgid = Nz(Me!NrLeistung, 0)
    s = ""
    t = Me![DatumTag] & " " & Me!AnzahlLeistung & " " & Me!LiefereinheitVG & "  Status ändern"
    If Me!StatusLeistung = 0 Then
        strS = "NICHT "
        strGrund = "VERSCHLAMPT"
    Else
        strGrund = "Korrektur"
    End If
    s = "Bitte Begründung eingeben." & vbNewLine & _
        "Status wird auf " & strS & "verrechenbar gesetzt"
    Me.Undo
    s = InputBox(s, t, strGrund)
    If s <> "" Then
        OH_A "@x = 'SetStatusLeistung' " & _
                ",@i = " & lgid & _
                ",@f = '" & s & "'"
        OH_EX
        blID = True
        txtFind_AfterUpdate
    End If
ErrEnd:
    blID = False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.StatusLeistung_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub StdAuswärts_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!LandAuswärts) Then
        Me!LandAuswärts = Me!LandFirma
    End If
    If Me!StdAuswärts = 0 Then
        Me!LandAuswärts = Null
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.StdAuswärts_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnProjekt_Click()
On Error GoTo ErrMsg
    OH_OF "F_VG", Me!NrVG
    Forms!F_VG!VG.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnProjekt_Click"
    Resume ErrEnd
End Sub
Private Sub btnFirma_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!NrFirma, 1
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnFirma_Click"
    Resume ErrEnd
End Sub
Private Sub btnPartner_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!IDFunktion
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnPartner_Click"
    Resume ErrEnd
End Sub
Private Sub btnNrBearbeiter_Click()
On Error GoTo ErrMsg
    OH_OF "F_Adresse", Me!NrBearbeiter
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnNrBearbeiter_Click"
    Resume ErrEnd
End Sub
Public Sub btnDatumTag_Click()
On Error GoTo ErrMsg
    OH_OpenKalender
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnDatumTag_Click"
    Resume ErrEnd
End Sub
Private Sub btnRech_Click()
On Error GoTo ErrMsg
    OH_ErstelleRechnung
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnRech_Click"
    Resume ErrEnd
End Sub
Public Function OH_ErstelleRechnung() As Byte
On Error GoTo ErrMsg
    Dim lgAntw As Long
    Dim strA(1 To 4) As String
    Dim strBis As String
    Dim strvon As String
    Dim strRechnungbis As String
    Dim strhelp As String
    Dim vararray As Variant
    DoCmd.Hourglass True
    If Me!StatusLeistung = 0 Then
        s = "Als  N I C H T  verrechenbar gekennzeichnet!"
        GoTo ErrM
    End If
    If Not IsNull(Me!NrVGdetR) Then
        strSQL = "Select dbo.fx_ConcatenateID ('NrVG_NrVGdet'," & Nz(Me!NrVGdetR) & ")"
        OH_r r
        lgAntw = Nz(r(0), 0)
        OH_OF "F_VG", lgAntw
        GoTo ErrEnd
    End If
    If IsNull(Me!Rechnungbis) Then
        Me!Rechnungbis = Date
    End If
    strBis = Format(Me!Rechnungbis, "yyyymmdd")
    strRechnungbis = Format(Me!Rechnungbis, "dd.mm.yy")
    t = strRechnungbis & ": Rechnung für " & Me!VG
    If Not IsNull(Me!Rechnungvon) Then
        strvon = Format(Me!Rechnungvon, "yyyymmdd")
        If Val(strvon) = Val(strBis) Then
            t = " NUR am " & t
        Else
            t = " von " & Format(Me!Rechnungvon, "dd.mm.yy") & " bis " & t
        End If
        If Val(strvon) > Val(strBis) Then
            s = "Das Datum >Leistung von< kann nicht grösser sein als >bis<" & vbNewLine & _
                    "und wird deshalb zurückgesetzt auf den " & strRechnungbis
            Me!Rechnungvon = Me!Rechnungbis
            GoTo ErrM
        End If
    Else
        t = " bis " & t
    End If
    t = "Leistungen " & t
    OH_ErstelleRechnung = vbCancel
    If IsNull(Me!NrVG) Then GoTo ErrEnd
    OH_SaveRS Me
    strSQL = "Exec dbo.spi_Rechnung " & _
            " @Art ='Check Leistung'," & _
            " @id = " & Me!NrVG & "," & _
            " @date ='" & strBis & "'," & _
            " @datevon ='" & strvon & "'"
    OH_r r
    If r.BOF Then
        s = "Keine Daten gefunden"
        GoTo ErrM
    End If
    Select Case r(0)
    Case "Keine Bestellnr"
        i = MsgBox("Bestellnummer fehlt!" & vbNewLine & vbNewLine & _
                    "Anschauen?", vbOKCancel + vbCritical, Me!VG)
        If i = vbOK Then
            btnProjekt_Click
        End If
        GoTo ErrEnd
    Case "Vorgangsart 51 <> Rechnung"
        s = "Vorgangsart 51 ist NICHT <Rechnung>"
        GoTo ErrM
    Case Else
        i = 0
        While Not r.EOF
            i = i + r!diffx
        r.MoveNext
        Wend
        If i = 0 Then  'es gibt NIX zu verrechnen
            strA(1) = "Keine Verrechnung möglich / erforderlich!"
            vararray = Array(strA(1))
        Else
            strA(2) = "Rechnung erstellen und sofort weiterbearbeiten"
            strA(3) = "Rechnung erstellen"
            vararray = Array(strA(2), strA(3))
        End If
    End Select
        strhelp = "Sie können über dieses Features Rechnungen (51) erstellen, sofern noch nicht verrechnete Leistungen erbracht sind!" & vbNewLine & _
              "Mit Doppel-Klick in der Liste können Sie die einzelne Leistung anschauen" & vbNewLine & _
              "Falls der ausgewählte Zeitraum eingeschränkt ist, werden im Feld Verrechnet auch ALLE (Gesamt...) verrechneten Leistungen angezeigt!"
    '=============
    OH_msgbox s, vararray, vbQuestion, t, strhelp, , , _
                strSQL, 7, "0;20;10;20;20;40;10"
    '============
    lgAntw = Val(strMSG(1))
    If lgAntw = 0 Then
        GoTo ErrEnd
    End If
    Select Case strMSG(2)
    Case strA(2), strA(3)
        strSQL = "Exec dbo.spi_Rechnung " & _
                " @Art ='Erstelle Rechnung'," & _
                " @user = " & lguser & "," & _
                " @id = " & Me!NrVG & "," & _
                " @date ='" & strBis & "'," & _
                " @datevon ='" & strvon & "'"
        OH_r r
        If r.BOF Then
            s = "Keine Daten gefunden"
            GoTo ErrM
        Else
            OH_RQ Me!lstD
            If r(0) = 0 Then
                s = r(1) & vbNewLine & _
                        "Rechnung konnte nicht erstellt werden"
                GoTo ErrM
            End If
            If strMSG(2) = strA(2) Then
                OH_OF "F_VG", r(0)
                Forms!F_VG!Firma.SetFocus
              End If
        End If
    Case 3
    End Select
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.OH_ErstelleRechnung"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, "Rechnung erstellen"
    GoTo ErrEnd
End Function
Private Sub DatumTag_AfterUpdate()
On Error GoTo ErrMsg
    Me!AnzahlLeistung.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.DatumTag_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstAktiv_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstAktiv.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstAktiv_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub lstAktiv_DblClick(Cancel As Integer)
    Cancel = True
End Sub
Private Sub lstKunde_AfterUpdate()
On Error GoTo ErrMsg
    txtFind_AfterUpdate
    Me!lstKunde.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.lstKunde_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub StdAuswärts_Enter()
On Error GoTo ErrMsg
    OH_A "Stdauswärts", , , , True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.StdAuswärts_Enter"
    Resume ErrEnd
End Sub
Private Sub LandAuswärts_Enter()
On Error GoTo ErrMsg
    OH_A "Landauswärts", , , , True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.LandAuswärts_Enter"
    Resume ErrEnd
End Sub
Private Sub txtfindKontakt_AfterUpdate()
On Error GoTo ErrMsg
    Dim strfind As String
    strfind = OH_RPL(Me!txtfindKontakt)
    OH_A "lstKontakt", "@a = " & Nz(Me!NrFirma, 0) & _
                        ",@i = " & Nz(Me!IDFunktion, 0) & _
                        ",@d = '" & strfind & "'", Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.txtfindKontakt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtfindKontakt_DblClick(Cancel As Integer)
    Me!txtfindKontakt = ""
    txtfindKontakt_AfterUpdate
End Sub
Private Sub Übernachtung_Enter()
On Error GoTo ErrMsg
    OH_A "Übernachtung", , , , True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.Übernachtung_Enter"
    Resume ErrEnd
End Sub
Private Sub txtFind_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!txtFind = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.txtFind_DblClick"
    Resume ErrEnd
End Sub
Public Sub txtFind_AfterUpdate()
On Error GoTo ErrMsg
    Dim strS As String
    Me!txtFind.SetFocus
    strS = Me!txtFind.Text
    strS = Replace(strS, "ID: ", "ID:")
    DoCmd.Hourglass True
    Me!txtFind.SetFocus
    strSQL = "Exec dbo.spa_Leistung " & _
            " @x = 'lst'" & _
            ",@a = " & Nz(Me!lstOB, 0) & _
            ",@b = " & Nz(Me!lstKunde, 0) & _
            ",@i = " & Nz(Me!lstAktiv, 0) & _
            ",@n = " & Nz(Me!lstTopA, 0) & _
            ",@m = " & Me!lstMitarbeiter & _
            ",@f = '" & strS & "'"
    OH_txtFind Me, strSQL
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.txtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtFind_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        txtFind_AfterUpdate
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.txtFind_KeyDown"
    Resume ErrEnd
End Sub
Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtFind = Me!comtxtFind
    txtFind_AfterUpdate
    Me!txtFind.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Private Function OH_SaveRecord()
On Error GoTo ErrMsg
    Dim lgA As Long
    Dim strf As String
    lgA = Nz(Me!NrLeistung, 0)
    strSQL = "Select top 1 * from T_Leistung where NrLeistung = " & lgA
    OH_r rx, , , rrLockOptimistic
    For i = 1 To rx.Fields.count - 1
        strf = rx.Fields(i).Name
        Select Case strf
        Case "NrLeistung", "lastupdate", "whoupdate", "Leistungerfasst"
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
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.OH_SaveRecord"
    Resume ErrEnd
End Function

Private Sub btnTelefon_Click()
On Error GoTo ErrMsg
    OH_DialTelefon Me!IDFunktion, Me!Telefon, Me!NamePerson
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "F_Leistung.btnTelefon_Click"
    Resume ErrEnd
End Sub

Private Sub btnNrBearbeiter_GotFocus()
    OH_SetForecolor Me!btnNrBearbeiter, True
End Sub
Private Sub btnNrBearbeiter_LostFocus()
    OH_SetForecolor Me!btnNrBearbeiter
End Sub
