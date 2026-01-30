Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim strlS As String
Dim xWV As Long
Dim xWI As Long
Dim blClose As Boolean
Dim strLastPathP As String

Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strf As String
    OH_FormHeight Me
    Me.Caption = "MENU"
 '=======================================================
    strSQL = "Exec dbo.spa_Z 'MandantMa'"
    OH_A "lstMandant", strSQL, Me
    Me!lstMandant = lguser
    Me.lstMandant_AfterUpdate
'=======================================================
    Me!suche.SetFocus
    blClose = True
    OH_A "@x = 'lstI'" & _
        ",@t = '" & SysCmd(acSysCmdAccessDir) & _
        "', @f = '" & CurrentProject.FullName & _
        "', @d = '" & OH_AppProjectName & "'", , Me
    OH_A "lstI", strSQL, Me
    OH_A "lstA", , Me
    OH_A "lstAct", , Me
    s = ""
    strSQL = "Exec dbo.spa_Menu " & _
            "@x = 'lastmsg'"
    OH_r r
    If Not r.BOF Then
        s = r!lastmsg
    End If
    If Len(s) < 5 Then
        Me!txtmsg.Visible = False
    Else
        Me!txtmsg.Visible = True
        Me!txtmsg = s
    End If
    Me.Det.BackColor = 12632256
    If InStr(strVersion, "TEST") > 0 Then
        Me.Det.BackColor = vbYellow
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 70 'Schreibschutz
        Resume Next
    Case Else
        s = Err & " " & Err.Description
        t = Err.Source
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Form_Activate()
On Error GoTo ErrMsg
    OH_ResetRSALL
    If lguser = 0 Then
        AutoExec
    End If
    OH_ActivateTab "tabMain"
    strSQL = "Exec dbo.spi_Verlauf 'neu'," & _
                    "@u = " & lguser & ", " & _
                    "@f = 'Menu', " & _
                    "@txt= 'Menu'"
    OH_EX
    strSQL = "Exec dbo.spa_Menu " & _
            " @x = 'lstS', " & _
            " @f = '" & strUserKZ & "'"
    OH_A "lstS", strSQL, Me
    strSQL = "Exec dbo.spa_Menu " & _
            " @x = 'lstWV', " & _
            " @i = " & lguser
    OH_A "lstWv", strSQL, Me
    i = Me!lstWv.ListCount
    Me!lstWv.BackColor = Me!lstS.BackColor
    Me!lstWv.ForeColor = vbBlack
    If i > 0 Then
        If left(Me!lstWv.column(3, 1), 1) = "x" Then
            Me!lstWv.BackColor = vbRed
            Me!lstWv.ForeColor = vbWhite
        End If
    End If
    Me!comGebTag = "H"
    comGebTag_Enter
    Me!lstB2B.Visible = False  'wenn kein B2B (bis jetzt nur HVL), dann erübrigt sich das folgende!
    If glB2B Then
        strSQL = "EXEC spa_B2B @x = 'lstB2B_Type_Status'" ' alle Einträge in [edi_messages] mit OFFENEN Vorgängen
        OH_A "lstB2B", strSQL, Me
        With Me!lstB2B
            If .ListCount = 0 Then
                .Visible = False
            Else
                If .column(1, 0) = "Error" Then
                    .BackColor = vbRed
                Else
                    .BackColor = Me!lstI.BackColor
                End If
                .Visible = True
            End If
        End With
    End If

ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Form_Deactivate()
On Error GoTo ErrMsg
    Me.TimerInterval = 0
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Menu deaktivieren"
    Resume ErrEnd
End Sub
Public Sub OH_CloseMenu()
On Error GoTo ErrMsg
    If glAdmin Then
        blClose = False
        i = MsgBox("JA" & vbTab & "Menu schliessen" & vbNewLine & _
                   "Nein" & vbTab & "im Design öffnen" & vbNewLine & _
                   "Abbr." & vbTab & "Datenbank schliessen (beenden)" _
                   , vbQuestion + vbYesNoCancel, "MENU SCHLIESSEN")
        Select Case i
        Case vbYes
            DoCmd.Close acForm, "Menu"
        Case vbNo
            DoCmd.openForm "menu", acDesign
        Case vbCancel
            blClose = False
            OH_ExitApplication False
        End Select
    Else
        OH_ExitApplication False
    End If
    blClose = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CloseMenu"
    Resume ErrEnd
End Sub
Private Sub comGebTag_DblClick(Cancel As Integer)
    Select Case Me!comGebTag
    Case "H"
        Me!comGebTag = "M"
    Case Else
        Me!comGebTag = "H"
    End Select
    comGebTag_AfterUpdate
End Sub

Private Sub comGebTag_AfterUpdate()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spi_Gebtag " & _
                "@fi = '" & Nz(Me!comGebTag, "h") & "'"
    OH_A "lstGebTag", strSQL, Me
    If Me!comGebTag = "H" Then
        '110927 Anzeige aktualisieren, wenn ein neuer Tag angebrochen ist...
        OH_A "comGebTag", , Me
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comGebTag_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comGebTag_Enter()
On Error GoTo ErrMsg
    OH_A "comGebTag", , Me, True
    comGebTag_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comGebTag_Enter"
    Resume ErrEnd
End Sub

Private Sub comtxtFind_AfterUpdate()
On Error GoTo ErrMsg
    Me!suche = Me!comtxtFind
    OH_Suche
    Me!suche.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "comtxtFind_AfterUpdate"
    Resume ErrEnd
End Sub
Public Sub lstA_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim N As Long
    Dim strL As String
    Dim strf As String
    Dim strA As String
    Dim strQ As String
    Dim strErrMldg As String
    Dim blOK As Boolean
    Dim d As Date
    DoCmd.Hourglass True
    strL = Nz(Me!lstA.column(2), "")
    strA = Me!lstA.column(1)
    t = strA
    Select Case strA
    Case "Export"
        If Nz(Me!lstMandant, 0) = 0 Then
            MsgBox "Bitte wählen Sie zuerst den betreffenden Mandanten aus der folgenden Liste aus.....", _
                    vbCritical, t
            Me!lstMandant.SetFocus
        Else
            DoCmd.openForm "PF_Export"
            Set frm = Forms!PF_Export
            frm.Caption = "Export Faktura " & Me!lstMandant.column(2) & " " & Me!lstMandant.column(3)
        End If
    Case "Auswertungen"
        strf = "Auswertung.XLSM"
        blOK = True
        'DB sucht einen Eintrag in den Stichworten "+Auswertung", der bei einem Mandant abgelegt sein sollte
        'als Hyperlink wird das EXCEL-File mit den Auswertungen erwartet!
        strSQL = "SELECT StichwortHyperlink as HL FROM T_Stichwort " & _
                 "WHERE NrFunktion is not null" & _
                 " and Stichwort='+Auswertung'"
        OH_r r
        If r.BOF = True Then
            blOK = False
        Else
            r.MoveFirst
            strf = Nz(r!HL, "")
            If Len(strf) = 0 Then
                blOK = False
            Else
                strf = HyperlinkPart(strf, acAddress)
                If Len(Dir(strf)) = 0 Then
                    blOK = False
                Else
                    FollowHyperlink strf
                End If
            End If
        End If
        If blOK = False Then
            If MsgBox("Tragen Sie bitte in den Stichworten zu " & Me!lstMandant.column(2) & " unter" & vbNewLine & _
                     "<Stichwort>" & vbTab & "+Auswertung" & vbNewLine & _
                     "<Hyperlink>" & vbTab & "das EXCEL-File mit den Auswertungen ein!", _
                     vbOKCancel + vbExclamation, "Auswertungen in EXCEL") = vbOK Then
                Me!lstact = 11
                lstAct_AfterUpdate
                DoEvents
              '  Forms!F_Adresse!UF_Stichwort.SetFocus
            End If
        End If
    Case "generelles PS"
        OH_GenerellesPS Me
    Case "Kurse"
        DoCmd.openForm "PF_Land"
    Case "Zugriffsberechtigungen"
        MsgBox "in Arbeit", , "Philipp"
    Case "Alle User Abmelden"
        s = "NICHT MEHR AKTIV"
        GoTo ErrM
    Case "Auswertungen in EXCEL", "          """
        If Me!lstA.column(2) = "Abfragen" Then
            OH_OF "F_Lexikon"
            With Forms!F_Lexikon
                !lstA = 80
                .txtFind_AfterUpdate
            End With
        Else
            strSQL = "Exec dbo.spa_Lexikon" & _
                    " @x ='Auswertungen in EXCEL'," & _
                    " @f ='" & strL & "'"
            OH_r r
            If r.EOF Then
                s = "Im Lexikon fehlt Ihnen unter Gruppe Database der entsprechende Eintrag: " & vbNewLine & _
                        "-Im Feld Begriff der Name des EXCEL-Files" & vbNewLine & _
                        "-Im Feld Bemerkungen: " & strL
                GoTo ErrM
            Else
                OH_EXCEL r!f, strL
            End If
        End If
    Case "Backup"
        SysCmd acSysCmdSetStatus, "erstelle Backup......"
        strSQL = "execute dbo.spI_BackupDatabase"
        OH_EX  'Hinweis funktioniert NICHT mit OH_R!!!!!
        strSQL = strSQL & " @i = 1"
        OH_r r
        s = r!Msg
        If s = "" Then
            s = "Backup nicht erfolgreich!"
            GoTo ErrM
        Else
            t = "Liste der vorhandenen Backup-Files (max. 10)"
            MsgBox s, vbInformation, t
        End If

    Case "Letzte Meldung"
        strSQL = "Exec dbo.spa_Lexikon " & _
            " @x = 'CheckBegriffDatabase', " & _
            " @f = '" & strA & "', " & _
            " @d = '" & OH_RPL(Nz(Me!txtmsg, "-")) & "'"
        OH_r r
        strL = Application.PlainText(r!mldg)
        MsgBox strL, vbInformation, t
    Case "Outlook-Ordner suchen..."
        mdl_Outlook.OH_FindFolder
    Case "Cube Daten füllen..."
        strf = "Exec dbo.spa_Div " & _
                " @x = '" & strA & "'"
        t = strL
        s = "1" & vbTab & "EXCEL-Auswertung öffnen" & vbNewLine & _
            "2" & vbTab & "KOMPLETT NEU RECHNEN" & vbNewLine & _
            "3" & vbTab & "Nur Aktuelles Jahr NEU RECHNEN"
        strSQL = strf & _
                ",@i = -1"
        DoCmd.Hourglass True
        OH_r r
        If r.BOF Then
            s = "File ist nicht im Lexikon definiert"
            GoTo ErrM
        End If
        strA = Nz(r!File, "")
        If Len(Dir(strA)) = 0 Then
            s = strA & vbNewLine & _
            "Das File ist nicht zu finden (falscher Eintrag im Lexikon??)"
            GoTo ErrM
        End If
        s = "Letzte Auswertung vom  " & r!letzteBerechnung & vbNewLine & vbNewLine & s
        N = Val(InputBox(s, t, 3))
        DoCmd.Hourglass True
        Select Case N
        Case 1
        Case 2, 3
            If N = 3 Then
                strf = strf & ",@a = " & Year(Date) - 1
            End If
            strf = strf & ",@i = "
            For i = 1 To 11
                SysCmd acSysCmdSetStatus, i & " von 11    " & strA & " " & strL & " " & Now()
                DoEvents
                strSQL = strf & i
                OH_EX
            Next i
            s = "Berechnung ist fertiggestellt!" & vbNewLine & vbNewLine & _
                strA & vbNewLine & _
            "Soll das EXCEL-File geöffnet werden?"
            If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                N = 1
            End If
        Case Else
            GoTo ErrEnd
        End Select
        If N = 1 Then
            DoCmd.Hourglass True
            OH_LaunchDocument 1, strA
        End If
    Case "Info Release"
        OH_A "@x = 'lsta'" & _
            ",@a = 500"
        OH_EXCEL strSQL
    Case "DATEV Export pro Monat"
        s = "Bitte Monat eintragen"
NochmalDatum:
        strf = Format(DateAdd("m", -2, Date), "yyyy-mm")
        strf = InputBox(s, t, strf)
        Select Case strf
        Case ""
            GoTo ErrEnd
        Case Else
            If Len(strf) <> 7 Then
                s = s & vbNewLine & "Bitte Format (yyyy-mm) beachten!"
                GoTo NochmalDatum
            End If
            d = DateSerial(Val(left(strf, 4)), Val(right(strf, 2)), 1)
            If DateDiff("m", d, Date) > 24 Then
                s = s & vbNewLine & "maximal 24 Monate zurück!"
                GoTo NochmalDatum
            End If
            If DateDiff("m", d, Date) < 0 Then
                s = s & vbNewLine & "in die Zukunft geht nicht!"
                GoTo NochmalDatum
            End If
            strQ = "Exec spA_VG @x = '" & strA & _
                                    "', @f = '" & strf & _
                                    "', @i = " & EFNrFktn
            strSQL = strQ & ", @a = 0"
            OH_r r
            strLastPathP = r!Pfad
            If Len(Dir(strLastPathP, vbDirectory)) = 0 Then
                s = strLastPathP & vbNewLine & "nicht gefunden"
                GoTo ErrM
            End If
            OH_DeleteFiles strLastPathP
            strSQL = strQ & ", @a = 1"
            OH_EXCEL strSQL, strA & "_" & strf & "_", strLastPathP
            strSQL = strQ & ", @a = 2"
            OH_r r
            i = r!ctv
            N = r!ctd
            If i <> N Then
                s = "Es gibt " & i & " Vorgänge, aber nur " & N & " Dateien." & vbNewLine & _
                    "Bitte die fehlenden Dateien im DMS ablegen!" & vbNewLine & _
                    "Trotzdem weitermachen?"
                If MsgBox(s, vbExclamation + vbYesNo + vbDefaultButton2, t) = vbNo Then
                    GoTo ErrEnd
                End If
            End If
            strSQL = strQ & ", @a = 3"
            OH_r r
            While Not r.EOF
                OH_LoadFileFromDB r!NrDoc, strLastPathP
            r.MoveNext
            Wend
            OH_LaunchFolder 1, strLastPathP
        End Select
    Case "Ordnerinhalte auflisten..."
        Set fd = Application.FileDialog(msoFileDialogFolderPicker)
        If strLastPathP = "" Then
            strLastPathP = OH_GetPathPartFE
        End If
        With fd
            .Title = t
            .AllowMultiSelect = False
            .ButtonName = "Ordner auswählen u. Inhalte in Excel auflisten lassen"
            .InitialFileName = strLastPathP
            .Show
        End With
        If fd.SelectedItems.count > 0 Then
            strLastPathP = fd.SelectedItems(1)
            OH_ResetID
            OH_ListFilesInFolder strLastPathP, True
            OH_A "@x = 'ListFiles'", , Me
            OH_EXCEL strSQL, left("Inhalt " & strLastPathP, 32), , True
        Else
            GoTo ErrEnd
        End If
    Case Else
        OH_PF_Tab Me.Name
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 432, 490
    MsgBox strf & vbNewLine & "scheint nicht zu existieren!" & strErrMldg, _
           vbCritical, "Link zu"
    Case 2501
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Menu.lstA_DblClick"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, strL
    GoTo ErrEnd
End Sub

Private Sub lstAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Select Case Me!lstact
    Case 10, 11 '10 = Mitarbeiter anzeigen (Adresse)
                '11 = Mandand anzeigen (Adresse)
        OH_OF "F_Adresse"
        Set frm = Forms!F_Adresse
        frm!lstA = 4
        frm.lstA_AfterUpdate
        With frm!lstDet
            For i = 0 To .ListCount - 1
                If lguser = .column(0, i) Then
                    .Selected(i) = True
                Else
                    .Selected(i) = False
                End If
            Next i
        End With
        frm.lstDet_AfterUpdate
        If Me!lstact = 11 Then
            OH_OF "F_Adresse", EFNrFktn
        End If
    Case 30, 31 'Gratuliere den Geburtstagskindern'
                'gehe zu markierten Geburtstagskindern'
        OH_ResetID
        With Me!lstGebTag
            For Each x In .ItemsSelected
                OH_InsertID .column(0, x)
                If lgid = 0 Then
                    lgid = .column(0, x)
                End If
            Next x
        End With
        If lgid = 0 Then
            With Me!lstGebTag
                For i = 1 To .ListCount - 1
                    OH_InsertID .column(0, i)
                    If lgid = 0 Then
                        lgid = .column(0, i)
                    End If
                Next i
            End With
        End If
        If lgid = 0 Then
            MsgBox "Mindestens 1 Geburtstags-Kind muss in der Liste enthalten sein!", _
                    vbInformation, "Markiere mehrere mit mit Shift /Strg-Taste"
        Else
            OH_OF "F_Adresse", lgid
            Set frm = Forms!F_Adresse
            frm!txtFind = Null
            frm!lstA = Me!comGebTag.column(2)
            frm.lstA_AfterUpdate
            If frm!NrFunktion <> lgid Then
                With frm!lstDet
                    For i = 0 To .ListCount - 1
                        .Selected(i) = lgid = .column(0, i)
                    Next i
                End With
                frm.lstDet_AfterUpdate
            End If
            i = frm!countRec
            If i > 0 Then
                Select Case Me!lstact
                Case 30
                    frm!StandardText = "Happy Birthday"
                    frm!StandardText.SetFocus
                    frm.StandardText_AfterUpdate
                    frm!StandardText.SetFocus
                Case 31
                    frm!txtFind.SetFocus
                End Select
            End If
        End If
    Case 99 'Beenden Ohne Rückfrage'
        blClose = False
        OH_ExitApplication False
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err.number
 '   Case 2501
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Menu.lstAct_AfterUpdate"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox s, vbExclamation, "Aktionen im Menu"
    GoTo ErrEnd
End Sub
Private Sub lstI_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgV As Long
    Dim strPath As String
    Dim strDB As String
    Dim strDBNew As String
    Dim objFSO As Object
    Dim appAccess As Access.Application
    t = "Infos Firma " & Me!lstI
    s = Me!lstI & vbNewLine & Me!lstI.column(1)
    DoCmd.Hourglass True
    Select Case Me!lstI
    Case "Applikation" '<R107>
        SysCmd acSysCmdSetStatus, "File maximal 2 mal zusätzlich öffnen"
        strPath = OH_GetPathPartFE
        s = "hiermit können Sie bis zu 3 mal diese Applikation öffnen." & vbNewLine & _
            "Voraussetzung: " & strPath & vbNewLine & _
            "muss ein vertrauenswürdiger Speicherort sein!" & vbNewLine & vbNewLine & _
            "Eine weitere Instanz erstellen?"
        If MsgBox(s, vbQuestion + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        strDB = Replace(Replace(CurrentProject.FullName, "1.", "."), "2.", ".")
        strDBNew = Replace(strDB, ".accdb", "1.accdb")
        For lgV = 1 To 2
            strDBNew = Replace(strDB, ".accdb", lgV & ".accdb")
            i = OH_IsFileOpen(strDBNew)
            Select Case i
            Case 0 'File gibt es nicht
                lgV = 2
            Case 1 'File gibt es , ist aber nicht geöffnet
                SysCmd acSysCmdSetStatus, strDBNew & " File wird gelöscht"
                OH_KILL strDBNew
                lgV = 2
            Case 2 'File ist geöffnet
                If lgV = 2 Then
                    s = "Haben Sie nicht schon mehrfach geöffnet??" & vbNewLine & _
                        "Mehr als 2 Versuche gibt es nicht!"
                    GoTo ErrM
                End If
            End Select
        Next lgV
        DoCmd.Hourglass True
        objFSO.CopyFile strDB, strDBNew
        SysCmd acSysCmdSetStatus, "File wird kopiert " & strDBNew
        Set appAccess = CreateObject("Access.Application")
        With appAccess
            .OpenCurrentDatabase strDBNew, False
            .Visible = True
            .RunCommand acCmdAppMaximize
        End With
        SysCmd acSysCmdSetStatus, "File wird geöffnet " & strDBNew
        GoTo ErrEnd
    Case "Aktueller User"
        s = s & vbNewLine & vbNewLine & _
                "Rollen:" & vbNewLine & _
                strRole
    Case "Anzahl User"
        OH_RQ Me!lstI
        strSQL = "EXEC spa_Menu" & _
                " @x = 'ActualLogins'"
        OH_r r
        MsgBox r!ActualLogins, vbInformation, t & " Actual Logins"
        GoTo ErrEnd
    End Select
    MsgBox s, vbExclamation, t & " (in Zwischenablage kopiert)"
    OH_CB s
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 0
    Case Else
        s = Err.number & " " & Err.Description
        t = "Form_Menu.lstI_AfterUpdate"
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstMandant_AfterUpdate()
On Error GoTo ErrMsg
    lguser = Me!lstMandant
    strSQL = "Exec dbo.spa_Z " & _
                " @x = 'MandantMa'" & _
                ",@ID = " & lguser
    OH_r r
    If r.BOF Then
        MsgBox "Probleme mit Mandant", vbCritical, Me.Caption
    Else
        EFNr = r!NrMandantFirma
        EFNrFktn = r!EFNrFun
        glMandant = r!MandantNr
        glstrB_VG = r!B_VG 'HVL hat den Bericht B_VG21 wegen Seitenränder = 0
    End If
    If OH_isloaded("F_VG") Then
        Forms!F_VG!lstMandant = glMandant
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_Menu.lstMandant_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub lstMandant_DblClick(Cancel As Integer)
    OH_OF "F_Adresse", Me!lstMandant
End Sub
Private Sub lstS_Click()
    Me!suche.SetFocus
End Sub
Private Sub lstS_DblClick(Cancel As Integer)
    OH_Suche
End Sub
Private Sub MyISDNCallServerObj_Anruf(strT As String)
On Error GoTo ErrMsg
'Anzeigen, wer anruft
'Prüfe dazu die Telefon-Nr. oder Handy-Nr. oder in Stichwort abgelegte Tel.-Nrn.
'Anruf-Ermittlung aktiv setzen "ISDNCall2001"
'http://www.rh-computer.de/support/isdncall/history.php
    If Len(strT) > 5 Then
        strSQL = "Exec dbo.spa_Adresse" & _
                " @x = 'FindContactTelefon', " & _
                " @f = '" & strT & "'"
        OH_r r
        If r!ID = 0 Then
            MsgBox "Uhrzeit" & vbTab & Now() & vbNewLine & vbNewLine & _
              "Adresse kann nicht identifiziert werden!", vbInformation, _
              "Hallo , Ihre DB meldet Anruf: " & strT
        Else
            If MsgBox("Uhrzeit" & vbTab & Now() & vbNewLine & vbNewLine & _
                       r!Anschrift & vbNewLine & vbNewLine & _
                      "Gesprächspartner im Adressenformular anzeigen?", vbQuestion & vbYesNo, _
                      "Hallo , Ihre DB meldet Anruf: " & strT) = vbYes Then
                OH_OF "F_Adresse", r!ID
                Forms!F_Adresse!Telefon.SetFocus
            End If
        End If
    End If
errExit:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume errExit
End Sub
Private Sub Det_Click()
' OHNEMUS, Mittwoch, 11. August 2004
' Hinweise :
On Error GoTo ErrMsg
    If OH_isloaded("Startup") Then
        DoCmd.Close acForm, "Startup"
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_Menu.Det_Click"
    End Select
    Resume ErrEnd
End Sub
Private Sub Form_Error(DataErr As Integer, Response As Integer)
'    strDel = vbNullString
'    Response = acDataErrContinue
'    MsgBox OH_Err(DataErr, Me.Caption), vbCritical, "Fehler in " & Me.Caption
End Sub
Private Sub lstGebtag_DblClick(Cancel As Integer)
    Me!lstact = 30
    lstAct_AfterUpdate
End Sub
Private Sub btnGruss_Click()
On Error GoTo ErrMsg
's = "80500220230615035202067395"
'    s = s & vbNewLine & "Prüfziffer: " & OH_GetPrüfzifferMod10Rekursiv(s)
    s = "Clipboard sollte jetzt geleert werden   OH_CB """
    MsgBox s
    OH_CB ""
    MsgBox "Clipboard sollte jetzt geleert sein"
    OH_A "@x = 'Test'", , Me
    OH_r r
    MsgBox r!XX
    Dim strHP As String
    strHP = "www.ohnemus.biz"
    s = "Grüsse vom Ersteller!" & vbNewLine & vbNewLine & _
            strHP & "  öffnen?"
    t = Me.Caption
    If MsgBox(s, vbYesNo + vbQuestion, t) = vbYes Then
        OH_LaunchDocument 3, strHP
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Function OH_ExitApplication(blmsg As Boolean) As Boolean
On Error GoTo ErrMsg
    blClose = blmsg
    OH_ResetRSALL
    Set oDMSth = Nothing
    Select Case blmsg
    Case True
        OH_ExitApplication = False
        Dim lgH As Long
        lgH = Val(Format(Now(), "hh"))
        Select Case lgH
        Case Is > 18
            s = "Jetzt dürfen Sie aussteigen!"
        Case Is > 12
            s = "Du willst schon aussteigen?"
        Case Else
            s = "Was, Sie wollen jetzt schon aussteigen??!!??"
        End Select
        i = vbYes
        i = MsgBox(Format(Now(), "hh:mm") & " Uhr" & vbNewLine & vbNewLine & _
            s, vbYesNo + vbQuestion, strUser & " will " & db.Properties!AppTitle & "  beenden")
    Case Else
        i = vbYes
    End Select
    If i = vbYes Then
        OH_Menu
        'Letzte Einstellung des Menus speichern
        strSQL = "Exec dbo.spi_Verlauf 'neu'," & _
            "@u = " & lguser & ", " & _
            "@f = 'Menu', " & _
            "@txt= '" & Me!lstMandant.column(2) & " " & Me!lstMandant.column(1) & "'"
        OH_EX
        'Audit logout
        DoEvents
        DBEngine.Idle
        Application.Quit
    Else
        OH_ExitApplication = True
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_ExitApplication"
    Resume ErrEnd
End Function
Private Sub Form_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    Dim qd As dao.QueryDef
    If CurrentProject.IsConnected Then
        db.QueryDefs.Refresh
        For Each qd In db.QueryDefs
            DoCmd.DeleteObject acQuery, qd.Name
        Next qd
        db.QueryDefs.Refresh
    'wenn das Formular Menu geschlossen wird, soll auch die Application beendet werden
        If Not Nz(VarAntw, "") Like "UPDATE" Then
            If blClose = False Then
                Cancel = False
            Else
                strSQL = "EXEC spa_Audit " & _
                        " @x = 'Abmeldung'" & _
                        ",@f = '" & Application.CurrentProject.FullName & "'"

                OH_EX
                Select Case strUserKZ
                    Case "OH", "EO", "AO"
                    Case Else
                        Cancel = OH_ExitApplication(True)
                End Select
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Menu entladen! Form_Unload"
    Resume ErrEnd
End Sub
Public Sub OH_Suche()
On Error GoTo ErrMsg
    'OH071228
    Dim lgL As Long
    Dim strf As String
    DoCmd.Hourglass True
    With Me!lstS
        .SetFocus
        strf = .column(1)
        Select Case strf
        Case "frmStatistik", "frmProjekt", "frmTank", "F_q" '170925 Tank"
            DoCmd.openForm strf
            GoTo ErrEnd
        Case "WV"
            DoCmd.openForm "F_Adresse"
            Set frm = Forms!F_Adresse
            frm!lstA = 9
            frm!lstV = 0
            frm!lstAktiv = 1
            frm!txtFind = Null
            frm.txtFind_AfterUpdate
            GoTo ErrEnd
        End Select
        OH_OF strf, -1
        Set frm = Forms(strf)
        lgL = .column(0)
        frm!txtFind.SetFocus
        frm!txtFind = Me!suche
        Select Case strf
        Case "F_Adresse"
            frm!lstAktiv = 1
            frm!lstA = lgL
            frm.lstA_AfterUpdate
            GoTo ErrEnd
        Case "F_VG"
            frm!lstA = lgL
        End Select
        frm!txtFind.SetFocus
        frm!txtFind = Me!suche
        frm.txtFind_AfterUpdate
        frm!txtFind.SetFocus
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub btnSuche_Click()
    OH_Suche
End Sub
Private Sub lstWv_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgF As Long
    Dim lgV As Long
    Dim strf As String
    t = "Doppel-Klick, um die Wiedervorlage zu öffnen"
    lgF = Nz(Me!lstWv.column(1), 0)
    lgV = Val(Nz(Me!lstWv.column(2), 0))
    strf = "F_Adresse"
    If lgV > 0 Then
        s = "Zeige die Wiedervorlage vom " & Me!lstWv.column(3) & vbNewLine & _
            Me!lstWv.column(4) & vbNewLine & vbNewLine & _
            "JA" & vbTab & "==>Vorgang" & vbNewLine & _
            "Nein" & vbTab & "==>Kontakt"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        Select Case i
        Case vbYes
            OH_OF "F_VG", lgV
            strf = "F_VG"
        Case vbNo
            OH_OF "F_Adresse", lgF
        End Select
    Else
        OH_OF "F_Adresse", lgF
    End If
    Forms(strf)!lstWv.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstWV_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub suche_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!suche = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "suche_DblClick"
    Resume ErrEnd
End Sub

Private Sub Suche_KeyDown(KeyCode As Integer, Shift As Integer)
'wenn Enter-Taste
On Error GoTo ErrMsg
    If KeyCode = 13 Then          '13 ASCII-Code für Enter Taste
        OH_SaveLastFind Me!suche, Me!comtxtFind
        OH_Suche
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub ogAdr1_AfterUpdate()
On Error GoTo ErrMsg
    'suche Adresse mit erstem Buchstaben
    Dim strFirstLetter As String
    OH_Adresse
    Select Case Me!ogAdr1
    Case Is <= 90
        strFirstLetter = Chr(Me!ogAdr1)
    Case 831
        strFirstLetter = "Sc"
    Case 832
        strFirstLetter = "St"
    Case 100, 101
        strFirstLetter = vbNullString
    End Select
    With Forms!F_Adresse
        !txtFind = strFirstLetter
        .txtFind_AfterUpdate
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Adresse suchen mit erstem Buchstaben"
    Resume ErrEnd
End Sub
Private Sub lstB2B_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    OH_OF "F_VG"
    With Forms!F_VG
        !lstA = 38
        .txtFind = ""
        .txtFind_AfterUpdate
        !lstB2B.SetFocus
        !lstB2BAct = Nz(Me!lstB2B, 0)
        .lstB2BAct_AfterUpdate
    End With
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "lstB2B_DblClick"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
