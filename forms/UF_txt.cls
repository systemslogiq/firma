Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub Form_Current()
On Error GoTo ErrMsg
'191022 <R87>
    Me!txt.Locked = False
    Me!txtV.Locked = False
    Me!txtMarker.Locked = False
    Me!txtV.LimitToList = False      'nur Listeneinträge erlaubt zurücksetzen
    Select Case Me!txt
    Case "Tank-Nr."
        s = "Tank-Statistik"
    Case Else
        s = "Vorgabe Lexikon"
    End Select
    Me!btnTXT.Caption = s
    Select Case Me!txtMarker  '<R206>
    Case 8
        Me!txt.Locked = True
        Me!txtV.Locked = True
        Me!txtMarker.Locked = True
    End Select
    If Me!txt = "Lieferadresse" Then 'EC 251205 Anpassungen eRechnung
        Me!txt.Locked = True
        Me!txtV.Locked = False          'bleibt editierbar
        Me!txtV.LimitToList = True      'nur Listeneinträge erlaubt
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2424
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txt.Form_Current"
    End Select
    Resume ErrEnd
End Sub
Private Sub txtV_NotInList(NewData As String, Response As Integer) 'EC 251205 Anpassungen eRechnung
    If Me!txt = "Lieferadresse" Then
        MsgBox "Bitte nur einen Wert aus der Liste auswählen!", vbExclamation, "Ungültige Eingabe"
        Response = acDataErrContinue
    End If
End Sub
Public Sub Form_Load()
On Error GoTo ErrMsg
    strSQL = "EXEC spa_Stichwort @x = 'Markerstichwort'"
    OH_A "txtmarker", strSQL, Me
    Me!comtxt.Visible = False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    Dim lgid As Long
    lgid = Nz(Parent!NrVG)
    Me!NrVG = lgid
    If Me.Parent.Name = "F_VG" Then
        If OH_Perm("u", Parent, , , Parent!NrQK) Then
            Cancel = True
            GoTo ErrEnd
        End If
        If OH_CheckAbschluss Then
            Cancel = True
            Me.Undo
        End If
    End If
    Cancel = Not OH_SaveRecord
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "UF_txt.Form_BeforeUpdate"
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strFile As String
    Dim strSSMS As String
    Dim strC As String
    Dim strConn() As String
    DoCmd.Hourglass True
    t = "Doppelklick in Texten"
    Select Case Parent.Name
    Case "F_VG"
        Select Case Me!txt
        Case "Kreditlimit"
            txt_DblClick (0)
        Case "Referenzperson"
            If Nz(Me!txtV, "") = "" Then
                Me!txtV = Parent!NamePerson
            End If
        Case Else
            i = vbNo
            strFile = Nz(Me!txtV, "")
            If Len(Dir(strFile)) > 0 Then
                s = strFile & vbNewLine & "JA" & vbTab & "File öffnen" & vbNewLine & _
                    "Nein" & vbTab & "Übersicht anzeigen"
                i = MsgBox(s, vbYesNoCancel + vbQuestion, t)
                If i = vbCancel Then
                    GoTo ErrEnd
                End If
            Else
                If InStr(strFile, "Server=") Then
                    strSSMS = "ssms"
                    strConn() = Split(strFile, ";")
                    For i = 1 To UBound(strConn)
                        strC = strConn(i)
                        Select Case VBA.left(strC, 3)
                        Case "DAT"
                            strC = VBA.Mid(strC, 10)
                            strSSMS = strSSMS & " -d " & strC
                        Case "SER"
                            strC = VBA.Mid(strC, 8)
                            strSSMS = strSSMS & " -S " & strC
                        End Select
                    Next
                    MsgBox strSSMS
                    Shell strSSMS
                End If
            End If
            If i = vbNo Then
                DoCmd.openForm "pfrmtxt", , , , , , "VG"
                OH_FB Forms!pfrmtxt, "nrTxt = " & Me!f0, "txtV"
            Else
                OH_LaunchDocument 1, strFile
            End If
        End Select
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.Form_DblClick"
    Resume ErrEnd
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
On Error GoTo ErrMsg
    Response = acDataErrContinue
    Cancel = OH_Delete("markierte Texte löschen?", Parent.Caption)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.Form_BeforeDelConfirm"
    Resume ErrEnd
End Sub
Private Sub btnTXT_click()  '<R87>
On Error GoTo ErrMsg
    txt_DblClick (0)
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.btnTXT_click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnDelete_click()  '<R83>
On Error GoTo ErrMsg
    Dim lgleer As Long
    DoCmd.Hourglass True
    t = "Texte löschen"
    strSQL = "Exec dbo.spa_VG " & _
                " @x = 'deleteTXT'" & _
                ", @i = " & Parent!NrVG
    OH_r r
    i = r!CT
    lgleer = Nz(r!leer, 0)
    Select Case i
    Case 0
        s = "Keine Texte vorhanden"
        GoTo ErrM
    Case 1
        s = "Den Text-Nr. " & Me!TxtNr & " " & Me!txt & " löschen!"
    Case Else
        s = "Geben Sie unten kommagetrennt die Nummern ein, die Sie löschen wollen." & vbNewLine & vbNewLine & _
            "mit< x bis y > können Sie ganze zusamenhängende Bereiche löschen" & vbNewLine & vbNewLine & _
            "Um alle " & i & " Texte zu löschen, geben Sie <ALLE> ein." & vbNewLine & vbNewLine & _
            "Vorgeschlagen ist der aktuell markierte Text mit der Nummer " & Me!TxtNr
    End Select
    If lgleer > 0 Then
        s = s & vbNewLine & vbNewLine & _
            "mit <Leere> können Sie "
        If lgleer = 1 Then
            s = s & "den Text löschen, der keinen Eintrag hat"
        Else
            s = s & "die " & lgleer & " Texte löschen, die keinen Eintrag haben"
        End If
    End If
    s = InputBox(s, t, Me!TxtNr)
    If s = "" Then
        GoTo ErrEnd
    End If
    strSQL = strSQL & _
            ",@f = '" & s & "'"
    OH_EX
    OH_RQf Me
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.btnDelete_click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnAdd_click()  '<R83>
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    t = "Texte Hinzufügen"
    strSQL = "Exec dbo.spa_VG " & _
                " @x = 'comtxt'" & _
                ", @i = " & Parent!NrVG & _
                ",@f = '" & Parent!NrQK.column(1) & "'"
    Me!comtxt.Visible = True
    OH_A "comtxt", strSQL, Me
    Me!comtxt.SetFocus
    Me!comtxt.Dropdown
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.btnAdd_click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub btnCopy_click()  '<R83>
On Error GoTo ErrMsg
    Dim lgid As Long
    DoCmd.Hourglass True
    lgid = Nz(Me!NrTxt, 0)
    If lgid = 0 Then
        s = "Bitte den zu kopierenden Text markieren!"
        GoTo ErrM
    End If
    t = "Texte Kopieren"
    s = Me!txt & vbNewLine & _
        "wird jetzt kopiert und als Nr. " & Me!TxtNr + 1 & " eingereiht"
    If MsgBox(s, vbQuestion + vbOKCancel, t) = vbOK Then
        strSQL = "Exec dbo.spa_VG " & _
                    " @x = 'copytxt'" & _
                    ", @i = " & lgid
        OH_r r
        lgid = r!ID
        Me!txt.SetFocus
        OH_RQf Me, lgid, "txtV"
        Me!txtV.SetFocus
        Me!txtV.Dropdown
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.btnCopy_click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Public Function OH_SaveRecord() As Boolean
On Error GoTo ErrMsg
    Dim lgVG As Long
    Dim lgtxt As Long
    Dim strf As String
    lgVG = Nz(Parent!NrVG, 0)
    lgtxt = Nz(Me!NrTxt, 0)
    If Nz(Me!txt, "") = "" Then
        Me!txt.SetFocus
        s = "Bitte Texte ausfüllen!"
        GoTo ErrM
    End If
    Select Case Me!txt
    Case "Leistungsdatum" 'EC 251201 eRechnung
        If Me!txtV <> "" Then
            strSQL = "EXECUTE dbo.spA_VG" & _
                        " @x = 'Check_Leistungsdatum'" & _
                        ",@i = " & Me!NrVG & _
                        ",@f = '" & Me!txtV & "'"
            OH_r r
            If r!ParseOK = 0 Then
                s = "Bitte im Feld Leistungsdatum ein gültiges Datum eingeben."
                t = "Änderung Leistungsdatum"
                GoTo ErrM
            End If
        End If
    End Select
    strSQL = "Select * from T_TXT where NrTxt=" & lgtxt
    OH_r rx, , , rrLockOptimistic
    If rx.BOF Then
        MsgBox "OH_SaveRecord T_TXT", vbCritical, "PHILIPP!!!!!"""
    Else
        For i = 1 To rx.Fields.count - 1
            strf = rx.Fields(i).Name
            Select Case strf
            Case "NrTxt", "created_on", "created_by", "modified_on", "modified_by"
            Case Else
                rx(strf) = Me(strf)
            End Select
        Next i
        rx.Update
    End If
    Me.Undo
    Me!txt.SetFocus
    OH_RQf Me, lgtxt, "txtV"
    OH_ResetRS rx
    If InStr(Me!txt, "USt-Id") > 0 Then
        VarAntw = "CheckMWST"
        Parent.MWSt_Enter
        Parent.OH_CheckSollHaben
    End If
    OH_SaveRecord = True
    Me!comtxt.Visible = False
ErrEnd:
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.OH_SaveRecord"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub comtxtv_AfterUpdate()
On Error GoTo ErrMsg
    Me!txtV = Replace(Me!comtxtv, " | ", Chr(13) + Chr(10))
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.comtxtv_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub comtxtv_Enter()
On Error GoTo ErrMsg
    DoEvents
    strSQL = "Exec dbo.spa_VG " & _
                " @x = 'comtxtv'," & _
                " @f = '" & Me!txt & "'"
    OH_A "comtxtv", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.comtxtv_Enter"
    Resume ErrEnd
End Sub
Private Sub txt_AfterUpdate()
On Error GoTo ErrMsg
    If IsNull(Me!TxtNr) Then
        Me!NrVG = Nz(Parent!NrVG)
        Me!TxtNr = OH_GetNr("txtNrVG", Parent!NrVG)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.txt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txt_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strhelp As String
    Dim vararray As Variant
    Dim strQ As String
    Select Case Me!txt
    Case "Tank-Nr."
        vararray = Array("OK", "Tank-Statistik JA", "Tank-Statistik NEIN")
        strhelp = "Hier können Sie definieren, ob der Artikel in die Tankstatistik soll oder nicht." & vbNewLine & _
                  "einfach entsprechende Position markieren und unten den zutreffenden Button drücken."
        t = "Welcher Artikel soll in Tank-Statistik ==> JA / NEIN"
        s = ""
        strSQL = "EXECUTE spa_VGDet " & _
                " @x = 'lstVGdetTank'" & _
                ",@i = " & Parent!NrVG
        x = OH_msgbox(s, vararray, vbQuestion, t, strhelp, , , _
                strSQL, 5, "0;15;20;60")
        Select Case Val(x)
        Case 2, 3
            strSQL = strSQL & _
                    ",@a = " & Val(x) & _
                    ",@b = " & Val(strMSG(3))
            OH_EX
            txt_DblClick (0)
        End Select
    Case "Kreditlimit"
        If OH_SetKreditlimit(Me!NrVG) Then
            OH_RQf Me, Me!NrTxt, "txtv"
        End If
    Case Else
        OH_Openlexikon Trim(Me!txt), Trim(Nz(Me!txtV)), , "txtv", Me
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.txt_DblClick"
    Resume ErrEnd
End Sub
Private Sub comtxt_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgtxt As Long
    Dim lgNr As Long
    Dim lgVG As Long
    lgVG = Nz(Parent!NrVG, 0)
    lgNr = OH_GetNr("txtNrVG", lgVG)
    strSQL = "EXECUTE dbo.spa_VG " & _
            " @x = 'InsertTXT' " & _
            " ,@i = " & lgVG & _
            ", @a = " & lgNr & _
            ", @f = '" & Me!comtxt & "'"
    OH_r r
    lgtxt = r!ID
    OH_RQf Me, lgtxt, "txtv"
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.txt_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub TxtNr_AfterUpdate()
On Error GoTo ErrMsg
    OH_ResetNr Me, "TXTNr", Me!TxtNr, Me!NrTxt, "", Parent!NrVG
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.TxtNr_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub txtV_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    '111206 , da ein Datum eingegeben werden konnte ==>SQL-Fehler
    t = "Prüfe Eingabe " & Me!txt
    Select Case Me!txt
    Case "gehört zu Kontrakt"
        If Not IsNull(Me!txtV) Then
            strSQL = "Exec dbo.spa_VG " & _
                    " @x = 'CheckKontrakt', " & _
                    " @f = '" & Me!txtV & "'"
            OH_r r
            If r!CheckKontrakt = 0 Then
                s = Me!txt & ": Bitte eine existierende Nummer eingeben (NUR Zahlen, ohne Punkt und Buchstaben...)"
                Cancel = True
                GoTo ErrM
            End If
        End If
    Case "Rechn-Nr./Datum", "Rechn-Nr."
        If glDMS = "DATEV DMS" And Len(Me!txtV) > 12 Then
            s = "Bitte nur max 12 Buchstaben eingeben wegen Übergabe an " & glDMS
            Cancel = True
            GoTo ErrM
        End If
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err.number & " " & Err.Description
    t = " UF_txt.txtV_BeforeUpdate"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    Cancel = True
    GoTo ErrEnd
End Sub
Private Sub txtV_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgOldV As Long
    Dim lgNewV As Long
    Dim lgM As Long
    Dim strECSyncClient As String
    Dim lgStatus As Long
    DoCmd.Hourglass True
    Set ctl = Me!txtV 'siehe comFirma_afterupdate
    lgM = Val(Nz(ctl.column(5), ""))
    If lgM <> 0 Then
        Me!txtMarker = lgM
    End If
    If Nz(Me!txtV.column(4), "") = "Beschreibung" Then
        strSQL = "EXECUTE spa_Lexikon " & _
                    " @x = 'getbeschreibung'" & _
                    ",@f = '" & Nz(Me!txt, "") & _
                    "',@d ='" & OH_RPL(Me!txtV) & "'"
        OH_r r
        If Not r.BOF Then
            If r!Beschreibung <> Me!txtV Then
                Me!txtV = r!Beschreibung
            End If
        End If
    Else
        Select Case Me!txt
        Case "gehört zu Kontrakt"
            lgOldV = Val(Nz(ctl.OldValue, ""))
            If lgOldV <> 0 Then
                lgNewV = Val(Nz(ctl, -1))
                strSQL = "Exec dbo.spI_Statistik " & _
                    " @x = 'ChangeGehörtzuKontrakt'" & _
                    ",@i = " & Me!NrVG & _
                    ",@f = " & lgOldV
                OH_r r
                If r!CT > 0 Then
                    t = "Auswirkung der Kontrakt-Nr. Änderung!"
                    s = "Die Kontrakt-Statistik sollte aktualisiert werden!"
                    MsgBox s, vbInformation, t
                End If
            End If
        Case "ec_editable" '<R206> <R220>
            If Me!txtV <> "" Then
                strSQL = "EXECUTE dbo.spA_VG" & _
                    " @x = 'Update_ec_editable'" & _
                    ",@i = " & Me!NrVG & _
                    ",@f = '" & Me!txtV & "'"
                OH_r r
                s = r!message
                Select Case Me!txtV
                    Case "false"
                        s = s & " Die Gelangensbestätigung kann nun im Web nicht mehr bearbeitet werden."
                    Case "true"
                        s = s & " Die Gelangensbestätigung kann nun im Web wieder bearbeitet werden."
                End Select
                t = "Änderung Gelangensbestätigung"
                MsgBox s, vbInformation, t
            End If
        End Select
        Select Case ctl.Value
        Case "Firma auswählen", "Firma auswählen mit Tel. und Fax", "Kontaktperson auswählen"
            Select Case ctl
            Case "Firma auswählen"
                OH_Navigator 70
            Case "Firma auswählen mit Tel. und Fax"
                OH_Navigator 71
            Case "Kontaktperson auswählen"
                OH_Navigator 72
            End Select
            Set ctl = Me!txtV
            ctl.Undo
            ctl = Null
            GoTo ErrEnd '200723
        Case "Zahlungsbedingung Kunde"
            ctl.Undo
            ctl = Null
            GoTo ErrEnd
        Case "Brief", "Fax", "Email", _
             "Brief ohne Preise", "Fax ohne Preise", "Email ohne Preise"
        Case "Aktuelles Datum"
            ctl = Format(Date, "dd.mm.YYYY")
        Case "                    mit Uhrzeit"
            ctl = Format(Now, "dd.mm.yyyy hh:NN")
        Case "                    als Kalenderwoche"
            ctl = lg("KW") & " " & Format(OH_GetYearKW(CLng(Date)), "0000-00")
        Case "                    als Monat"
            ctl = Format(Date, "MMMM YYYY")
        Case "                    als Jahr"
            ctl = lg("Jahr") & " " & Format(Date, "YYYY")
        Case "Monatsanfang"
            ctl = Format(Primo(Date), "dd.mm.YYYY")
        Case "Anfang letzter Monat"
            ctl = Format(Primo(Primo(Date) - 1), "dd.mm.YYYY")
        Case "Anfang nächster Monat"
            ctl = Format(Ultimo(Date) + 1, "dd.mm.YYYY")
        Case "Monatsende"
            ctl = Format(Ultimo(Date), "dd.mm.YYYY")
        Case "Ende letzter Monat"
            ctl = Format(Primo(Date) - 1, "dd.mm.YYYY")
        Case "Ende nächster Monat"
            ctl = Format(Ultimo(Ultimo(Date) + 1), "dd.mm.YYYY")
        Case "als PDF-File per Mail"
            s = ""
            strSQL = "Exec dbo.spa_VG " & _
                    " @x = '" & Me!txtV & _
                    "',@i = " & Parent!NrFunktion & _
                    ",@a = " & Parent!NrFirma
            OH_r r
            If r.BOF = False Then
                If r!mailfirma <> "" And r!mailkontakt <> "" Then
                    i = MsgBox("JA" & vbTab & r!mailfirma & vbNewLine & _
                            "NEIN" & vbTab & r!mailkontakt, _
                            vbYesNoCancel, Me!txt & " " & Me!txtV)
                    Select Case i
                    Case vbYes
                        s = r!mailfirma
                    Case vbNo
                        s = r!mailkontakt
                    End Select
                Else
                    If r!mailfirma <> "" Then
                        s = r!mailfirma
                    Else
                        s = r!mailkontakt
                    End If
                End If
            End If
            ctl = ctl.Value & " an " & s
        Case Else
            If left(ctl, 15) Like "Kalender Öffnen" Then
                s = ctl
                ctl = Null
                If OH_OpenKalender(ctl) Then
                    If Len(s) > 15 Then
                        With Forms!PF_Kalender
                            s = Trim(Mid(s, 16, 20))
                            Select Case s
                            Case "Termin"
                                !comStd.SetFocus
                                !comStd.Dropdown
                            Case Else
                                !comShow = s
                            End Select
                        End With
                    End If
                    GoTo ErrEnd '190427 Input Dirk
                End If
            End If
            If Not gllg Like "Deutsch" Then
                If Not Me!txt Like "Kontaktart" Then
                    strSQL = "Exec dbo.spa_Lexikon " & _
                            " @x = 'GetBegriff' " & _
                            ",@d = '" & Nz(ctl.Value, "") & "'"
                    OH_r r
                    If r.BOF = False Then
                        ctl = lg(ctl.Value)
                    End If
                    OH_ResetRS r
                End If
            End If
        End Select
    End If
    If OH_SaveRecord Then
    'gehe zum nächsten Datensatz
        DoCmd.GoToRecord , , acNext
    Else
        Me.Undo
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2105
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.txtV_AfterUpdate"
    End Select
    Resume ErrEnd
End Sub
Private Sub txtV_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strT As String
    Dim strV As String
    Dim frmV As Form
    Dim lgid As Long
    DoCmd.Hourglass True
    t = "Doppel-Klick auf txtV"
    Select Case Parent.Name
    Case "F_VG"
        strV = left(Nz(Me!txtV), 40)
        strT = Nz(Me!txt)
        lgid = Nz(Me!NrVG)
        t = t & " " & strT & " " & strV
        Select Case strT
        Case "Ihr Zeichen", "bestellt von"
            If Nz(Me!txtV, "") = "" And Parent!VGAbschluss = 0 Then
                Me!txtV = Parent!NamePerson
            Else
                Form_DblClick (0)
            End If
        Case "Anfrage-Datum"
            If Nz(Me!txtV, "") = "" And Parent!VGAbschluss = 0 Then
                Me!txtV = Nz(Parent!VGDat1, Date)
            Else
                Form_DblClick (0)
            End If
        Case "Tank-Nr."
            DoCmd.openForm "frmTank", , , , , , strV
        Case "Analyse"
            OH_ResetID
            strSQL = "Exec spa_B " & _
                "@x = 'rptAnalysenzertifikat' " & _
                ",@id = " & Me!NrVG
            OH_r r
            If r!CT > 0 Then
                DoCmd.OpenReport "rptAnalysenzertifikat", acViewPreview
            Else
                s = "keine Daten für ein Zertifikat"
                SysCmd acSysCmdSetStatus, s
            End If
        Case "entry_certificate_guid" '<R206>
            Application.FollowHyperlink "https://hc.hvl-online.com/?id=" & Me!txtV '230519
        Case "OperationalIndicationCode"
            OH_AttachDocument Me!txtV
        Case Else
            Form_DblClick (0)
        End Select
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 2501
        s = "Keine Daten vorhanden"
    Case Else
        s = Err.number & " " & Err.Description
        t = " UF_txt.txtV_DblClick"
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
End Sub
Private Sub txtV_GotFocus()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strT As String
    Dim strTT As String
    DoCmd.Hourglass True
    '<R57>
    strTT = "Liste der im Lexikon hinterlegten Begriffe zur Gruppe <" & Me!txt & ">"
    If Parent!VGAbschluss <> 0 Then
        GoTo ErrEnd
    End If
    OH_Lex Me!txtV, Nz(Me!txt), Me
    Select Case Me!txt
    Case "Hinweis"
        strTT = strTT & vbNewLine & " " & vbNewLine & _
                "Eingetragen wird nicht der Begriff, sondern die Beschreibung dazu!"
    Case "Bankverbindung", "Bestellt von"
        strSQL = "Exec dbo.spa_VG " & _
                " @x = '" & Me!txt & _
                "', @i = " & EFNrFktn & _
                ",@a = " & Parent!NrFirma
        OH_r r
        If r.EOF Then
            strSQL = "Select 'KEINE Bankverbindung' as BV"
        End If
        OH_A "txtV", strSQL, Me
    Case "Ihre USt-Id"
        strSQL = "Exec dbo.spa_VG " & _
                " @x = 'USt-Id'," & _
                " @i = " & Parent!NrFirma
        OH_A "txtV", strSQL, Me
        GoTo ErrEnd
    Case "unsere USt-Id"
        strSQL = "Exec dbo.spa_VG " & _
                " @x = 'USt-Id'," & _
                " @i = " & EFNr
        OH_A "txtV", strSQL, Me
        GoTo ErrEnd
    Case "Rechn-Nr./Datum", "Rechn-Nr."
        If glDMS <> "" Then
            strTT = strTT & vbNewLine & _
                "PFLICHTFELD: Bitte nur max 12 Buchstaben eingeben wegen Übergabe an " & glDMS
        End If
    Case "Tank-Nr."
        strTT = strTT & vbNewLine & _
            "mit Doppel-Klick wird die Tankübersicht (Verlauf über 14 Tage) geöffnet"
    Case "Liefertermin"
        Select Case Parent!Dat2
        Case "Einlagerung", "Auslagerung"
            strTT = strTT & vbNewLine & _
                "Ein hier eingegebenes Datum wird übertragen in das Feld " & Parent!Dat2
        End Select
    Case "Analyse"
        strTT = strTT & vbNewLine & _
            "Doppel-Klick auf das JA zeigt das Analysenzertifikat (sofern Daten vorhanden)"
    Case "Leistungsdatum"  '190520 Input Jörn
        If Nz(Me!txtV, "") = "" Then
            If Parent!VGAbschluss = 0 And Not IsNull(Parent!VGDat1) Then
                Me!txtV = lg(Format(Parent!VGDat1, "dddd")) & ", " & Format(Parent!VGDat1, "dd.mm.yyyy") '180224 Übersetzung des Datums!
            End If
        End If
    Case "Bestimmungs-BL.", "Vers.-Land"
        If Nz(Me!txtV, "") = "" Then
            strSQL = "Exec dbo.spa_VG " & _
                    "  @x = 'CheckTXT' " & _
                    ", @i = " & Me!NrVG & _
                    ", @f = '" & Me!txt & "'"
            OH_r r
            If r!Msg <> "" Then
                Me!txtV = r!Msg
            End If
        End If
    End Select
    Select Case right(Me!txt, 7)
    Case "Adresse"
        strT = left(Me!txt, 6)
    Case "schrift"
        strT = left(Me!txt, 7) '250804
    End Select
    If strT <> "" Then '250828
        strT = Replace(Replace(Me!txt, "Adresse", ""), "anschrift", "")
        If Len(strT) <> Me!txt Then
            strSQL = "Exec dbo.spa_Adresse " & _
                    " @x = 'Anschrift' " & _
                    ",@i = " & Parent!VGID & _
                    ",@f ='" & strT & "'"
            OH_A "txtV", strSQL, Me
        End If
    End If
    Me!txtV.ControlTipText = strTT
    If Me.Dirty Then
        OH_SaveRecord
    End If
    Me!comtxt.Visible = False
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, " UF_txt.txtV_GotFocus"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Public Function OH_AttachDocument(strDocu As String)
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    t = "Speichere Dokument zum Vorgang"
    DoCmd.openForm "frmSchlagwort", , , , , , "VG"
    Set frm = Forms!frmSchlagwort
    frm!lstSchlagwortAct = 13 'markierte Files
    frm.lstSchlagwortAct_AfterUpdate
    Select Case strDocu
    Case "PAC-MEE", "COA-MEE"
        strSQL = "Exec dbo.DMS " & _
                    " @x = 'setSchlagwort'" & _
                    ", @f = '" & strDocu & "'"
        OH_EX
        frm!cboDelete = 0
        OH_RQf frm
    End Select

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 2501
        s = "Keine Daten vorhanden"
    Case Else
        s = Err.number & " " & Err.Description
        t = " UF_txt.OH_AttachDocument"
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
End Function
