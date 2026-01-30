Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim frma As Form
Dim lgAdr As Long
Dim lgAdr1 As Long
Dim lgF As Long
Dim lgO As Long 'outlook....
Dim strN1 As String
Dim strN2 As String
Dim strN3 As String
Dim strQ As String
Dim lgW1 As Long
Dim lgW2 As Long
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strS As String
    lgW1 = 8.5 * 567
    lgW2 = 5.5 * 567
    Set frma = Forms!F_Adresse
    Me.Caption = "eine neue Adresse erfassen"
    strS = Nz(Me.OpenArgs)
    strQ = "Exec dbo.spa_Adresse @x = '"
    strSQL = strQ & "ArtAdresse'"
    OH_A "ArtAdresse", strSQL, Me
    strSQL = strQ & "ArtAdresse',@a = 2"
    OH_A "ArtAdresse1", strSQL, Me
    strSQL = strQ & "lstActNeu'"
    OH_A "lstActNeu", strSQL, Me
    Me!lstActNeu = 10
    lstActNeu_AfterUpdate

    If left(strS, 1) = "o" Then 'aus Outlook'
        lgF = Mid(strS, 2)
        lgO = lgF
        strSQL = "Exec dbo.spa_Adresse" & _
                " @x = 'OH_newOutlookContact'," & _
                " @i = " & lgO & "," & _
                " @a = 0"
        OH_r rx
        If rx.BOF Then
            s = "Keine Daten zu finden"
            GoTo ErrMsg1
        End If
        If rx!ogAdresse > 0 Then
            Me!ArtAdresse = rx!ArtAdresse
            strN3 = Nz(rx!CompanyName)
            strN1 = Nz(rx!LastName)
            strN2 = Nz(rx!FirstName)
          '  Me!ogAdresse = rx!ogAdresse
          '  Me!comA2 = rx!NrFirma
            Select Case rx!ogAdresse
            Case 1
                Me!ArtAdresse = "Firma"
            Case 8, 81

            End Select
           ' ogAdresse_AfterUpdate
        End If
    Else
        lgF = Nz(Me.OpenArgs, 0)
    End If
    OH_Move Me, 150, 30, 170, 60
ErrEnd:
    OH_ResetRS r
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Form_PF_NeuAdresse.Form_Open"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox s, vbCritical, "Neue Adresse"
    DoCmd.Close acForm, Me.Name
    GoTo ErrEnd
End Sub
Private Sub Form_Close()
On Error GoTo ErrMsg
    t = "Formular <Neue Adresse> schliessen"
    If frma!Funktion = "unbekannt" Then
        frma!Funktion.SetFocus
    Else
        If IsNull(frma!Strasse) Then
            frma!Strasse.SetFocus
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Sub lstActNeu_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgact As Long
    Dim lgFirma As Long
    lgact = Nz(Me!lstActNeu, 0)
    If lgact = 0 Then
        GoTo ErrEnd
    End If
    t = Me!lstActNeu.column(1)
    Me.Caption = "NEUE ADRESSE erfassen " & t
    Select Case lgact
    Case 10, 11, 12 'Firma' 'Firma + Mitarbeiter'
        strSQL = strQ & "ArtAdresse',@a = 1"
        OH_A "ArtAdresse", strSQL, Me
        If Me!ArtAdresse <> "Firma" Or lgact = 10 Then
            Me!ArtAdresse = "Firma"
            Me!NrFunktion = Null
            ArtAdresse_AfterUpdate
            Me!Nachname.SetFocus
        End If
        OH_V1 lgact <> 10
        Me!btnSuch.Visible = False
        If lgact = 11 Then
            Me!ArtAdresse1 = "Herr"
        Else
            Me!ArtAdresse1 = "Frau"
        End If
        If lgact > 10 Then
            Me!btnSuch.Visible = True
            Me!Nachname1.Width = lgW2
            Me!Nachname1 = "Nachname eintragen"
            Me!vorname1 = "Vorname eintragen"
        End If
        Me!NrFunktion1 = Null
        If IsNull(Me!NrFunktion) Then
            Me!Nachname.SetFocus
        Else
            If Me!Nachname1.Visible Then
                Me!Nachname1.SetFocus
            End If
        End If
    Case 20, 21 'Mann privat Frau privat
        Select Case lgact
        Case 20
            Me!ArtAdresse = "Herr"
        Case Else
            Me!ArtAdresse = "Frau"
        End Select
        strSQL = strQ & "ArtAdresse',@a = 2"
        OH_A "ArtAdresse", strSQL, Me
        ArtAdresse_AfterUpdate
        OH_V1 False
        Me!Nachname.Width = lgW2
        Me!Nachname.SetFocus
        Me!NrFunktion = Null
        Me!NrFunktion1 = Null
    Case 30, 31 'Ehepartner'Partner
        If Me!ArtAdresse <> "Herr" Then
            strSQL = strQ & "ArtAdresse',@a = 2"
            OH_A "ArtAdresse", strSQL, Me
            Me!NrFunktion = Null
            Me!ArtAdresse = "Herr"
            ArtAdresse_AfterUpdate
        End If
        If Me!ArtAdresse1 <> "Frau" Or Not Me!ArtAdresse1.Visible Then
            Me!NrFunktion1 = Null
            Me!ArtAdresse1 = "Frau"
            ArtAdresse1_AfterUpdate
        End If
        OH_V1 True
        Me!Nachname.Width = lgW2
        Me!Nachname.SetFocus
        Me!lstActNeu = lgact
    Case 60 'abbrechen/schliessen'
        btnEscape_Click
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Function OH_V1(blV As Boolean)
    If blV Then
        Me!lstActNeu.SetFocus
    End If
    For Each ctl In Me.Det.Controls
        If ctl.Tag = "1" Then
            ctl.Visible = blV
        End If
    Next ctl
End Function
Private Sub ArtAdresse_AfterUpdate()
On Error GoTo ErrMsg
    Select Case Me!ArtAdresse
    Case "Frau", "Herr"
        Me!Nachname.Width = lgW2
        Me!Nachname = Me!ArtAdresse & ": Nachnamen eintragen"
        Me!Vorname = "Vornamen eintragen"
        Me!Vorname.Visible = True
        If Me!Nachname1.Visible = False Then
            If Me!ArtAdresse = "Herr" Then
                Me!lstActNeu = 20
            Else
                Me!lstActNeu = 21
            End If
        End If
    Case Else
        Me!Vorname.Visible = False
        Me!Nachname.Width = lgW1
        Me!Nachname = Me!ArtAdresse & ": Namen eintragen"
    End Select
    Me!NrFunktion = Null
    Me!Nachname.SetFocus
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ArtAdresse_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub ArtAdresse1_AfterUpdate()
On Error GoTo ErrMsg
    OH_V1 True
    Select Case Me!ArtAdresse1
    Case "Frau", "Herr"
        Me!Nachname1.Width = lgW2
        Me!Nachname1 = Me!ArtAdresse1 & ": Nachnamen eintragen"
        Me!vorname1 = "Vornamen eintragen"
        If Me!ArtAdresse = "Firma" Then
            If Me!ArtAdresse1 = "Frau" Then
                Me!lstActNeu = 12
            Else
                Me!lstActNeu = 11
            End If
        End If
    Case Else
        Me!vorname1.Visible = False
        Me!Nachname1.Width = lgW1
        Me!Nachname1 = Me!ArtAdresse1 & ": Namen eintragen"
    End Select
    Me!Nachname1.SetFocus
    Me!NrFunktion1 = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ArtAdresse1_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub btnEscape_Click()
On Error GoTo ErrMsg
    DoCmd.Close acForm, Me.Name
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AdressenNeubtnEscape_Click"
    Resume ErrEnd
End Sub
Private Sub Nachname_AfterUpdate()
On Error GoTo ErrMsg
    OH_FirstUcase Me!Nachname
    If Me!Vorname.Visible = True Then
        Me!Vorname.SetFocus
    End If
    Me!NrFunktion = Null
    If Me!lstActNeu = 30 Then 'Ehepartner
        If InStr(Me!Nachname1, ":") > 0 Then
            Me!Nachname1 = Me!Nachname
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AdressenNeuNachname_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Nachname_click()
    OH_Eintragen Me!Nachname
End Sub
Private Sub Nachname1_click()
    OH_Eintragen Me!Nachname1
End Sub
Private Sub vorname_click()
    OH_Eintragen Me!Vorname
End Sub
Private Sub vorname1_click()
    OH_Eintragen Me!vorname1
End Sub

Private Sub Vorname_AfterUpdate()
On Error GoTo ErrMsg
    OH_FirstUcase Me!Vorname
    If Me!Vorname.Visible = True Then
        Me!Vorname.SetFocus
    End If
    Me!NrFunktion = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AdressenNeuVorname_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Nachname1_AfterUpdate()
On Error GoTo ErrMsg
    OH_FirstUcase Me!Nachname1
    If Me!vorname1.Visible = True Then
        Me!vorname1.SetFocus
    End If
    Me!NrFunktion1 = Null
    If Me!lstActNeu = 30 Then 'Ehepartner
        If InStr(Me!Nachname, ":") > 0 Then
            Me!Nachname = Me!Nachname1
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AdressenNeuNachname1_AfterUpdate"
    Resume ErrEnd
End Sub
Private Sub Vorname1_AfterUpdate()
On Error GoTo ErrMsg
    OH_FirstUcase Me!Vorname
    If Me!vorname1.Visible = True Then
        Me!vorname1.SetFocus
    End If
    Me!NrFunktion1 = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "AdressenNeuVorname1_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub Nachname_DblClick(Cancel As Integer)
    Me!Nachname = Null
End Sub
Private Sub Nachname1_DblClick(Cancel As Integer)
    Me!Nachname1 = Null
End Sub
Private Sub Vorname_DblClick(Cancel As Integer)
    Me!Vorname = Null
End Sub
Private Sub Vorname1_DblClick(Cancel As Integer)
    Me!vorname1 = Null
End Sub
Public Function OH_NeueAdresse(strName As String, _
                            strVorname As String, _
                            strArtAdr As String, _
                            Optional strLand As String) As Long
On Error GoTo ErrMsg
    Dim strhelp
    Dim lgCount As Long
    Dim vararray As Variant
    Dim strL As String
    Dim lgid As Long
    Dim strA(1 To 2) As String
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'CheckDoppelAdresse', " & _
            " @f = '" & strArtAdr & "'," & _
            " @d =  '" & OH_RPL(strName) & "'," & _
            " @o =  '" & OH_RPL(strVorname) & "'"
    OH_r r, , 3
    i = 0
    If Not r.BOF Then
        While Not r.EOF
            i = i + 1
            If i = 1 Then
                strL = r!NrAdresse
            Else
                strL = strL & "," & r!NrAdresse
            End If
        r.MoveNext
        Wend
        i = r.RecordCount & ""
        s = "Es gibt bereits ähnliche Namen (" & i & ")" & vbNewLine & _
                 "Wollen Sie die Adresse dennoch erfassen?"
        t = "VERMEIDE doppelte Adressen!"
        strhelp = "Verglichen werden Art der Adresse, Vorname und Nachname!" & vbNewLine & _
                  "mit der *X* -Methode"
        strA(1) = "Adresse dennoch neu erfassen:" & vbNewLine & _
                   strVorname & " " & strName
        strA(2) = "doppelte Adressen anzeigen"
        OH_msgbox s, Array(strA(1), strA(2)), vbCritical, t, strhelp, , , strSQL, 3, "0;50"
        lgid = Val(strMSG(3))
        Select Case strMSG(2)
        Case strA(1)
        Case strA(2)
            OH_NeueAdresse = 0
            DoCmd.Close acForm, "PF_NeuAdresse"
            OH_OF "F_Adresse"
            frma!txtFind = strVorname & " " & strName
            frma!lstA = 2
            frma!lstAktiv = 2
            frma.txtFind_AfterUpdate
            GoTo ErrEnd
        Case Else
            OH_NeueAdresse = 0
            GoTo ErrEnd
        End Select
    End If
    strL = ""
'    If Me!ogAdresse = 8 And Me!comA2 = EFNr Then 'Kurzzeichen
'        strL = Trim(left(strVorname, 1) & left(strName, 1))
'    End If
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'NeueAdresse', " & _
            " @d = '" & strArtAdr & "|" & _
                        OH_RPL(strName) & "|" & _
                        OH_RPL(strVorname) & "|" & _
                        strLand & "|" & _
                        strL & "|" & _
                        lgO & "'"
    OH_r r
    If r.BOF Then
        OH_NeueAdresse = 0
    Else
        OH_NeueAdresse = r!ID
    End If
ErrEnd:
    OH_ResetRS r
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_NeueFunktion(lgA As Long, _
                                lgAz As Long, _
                                strFun As String) As Long
On Error GoTo ErrMsg
    If lgA = 0 Or lgAz = 0 Then
        OH_NeueFunktion = 0
    Else
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'NeueFunktion', " & _
            " @i = " & lgA & "," & _
            " @a = " & lgAz & "," & _
            " @f = '" & OH_RPL(strFun) & "'," & _
            " @d = " & lgO
    OH_r r
    If r.BOF Then
        OH_NeueFunktion = 0
    Else
        OH_NeueFunktion = r!ID
    End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    OH_ResetRS r
    MsgBox Err & " " & Err.Description, vbCritical, "OH_NeueFunktion"
    Resume ErrEnd
End Function
Private Sub btnOK_Click()
On Error GoTo ErrMsg
    Dim strFun As String, strFun1 As String
    Dim lgact As Long
    Dim lgNeu As Long
    Dim lgNeu1 As Long
    t = Me.Caption & " " & Me!lstActNeu.column(1)
    lgact = Me!lstActNeu
    Select Case lgact
    Case 10, 11, 12 'Firma
        If Me!ArtAdresse <> "Firma" Then
            s = " geht nur mit <Firma>"
            Me!ArtAdresse.SetFocus
            GoTo ErrM
        End If
        If Not OH_CheckName(Me!Nachname, 3) Then
            GoTo ErrEnd
        End If
        If InStr(Me!Nachname, " ") = 0 Then
            s = "Hinweis: ein Firmen-Namen sollte mindestens einen Leerschlag aufweisen...."
            Me!Nachname.SetFocus
            If MsgBox(s, vbExclamation + vbOKCancel, t) = vbCancel Then
                GoTo ErrEnd
            End If
        End If
        If Nz(Me!NrFunktion, 0) = 0 Then
            strFun = "Zentrale"
            lgAdr = OH_NeueAdresse(Me!Nachname, "", Me!ArtAdresse)
            If lgAdr = 0 Then
                GoTo ErrEnd
            End If
            lgNeu = OH_NeueFunktion(lgAdr, lgAdr, strFun)
            Me!NrFunktion = lgNeu
        Else
            strSQL = strQ & "lstActNeu'" & _
                    ",@a = " & lgact & _
                    ",@i = " & Me!NrFunktion
            OH_r r
            lgAdr = r!NrAdresse
        End If
        If lgact = 11 Then
            If Me!ArtAdresse1 <> "Herr" Then
                s = " geht nur mit <Herr>"
                Me!ArtAdresse1.SetFocus
                GoTo ErrM
            End If
        End If
        If lgact = 12 Then
            If Me!ArtAdresse1 <> "Frau" Then
                s = " geht nur mit <Frau>"
                Me!ArtAdresse1.SetFocus
                GoTo ErrM
            End If
        End If
        If lgact > 10 Then
            If Not OH_CheckName(Me!Nachname1) Then
                GoTo ErrEnd
            End If
            If Not OH_CheckName(Me!vorname1, -1) Then
                GoTo ErrEnd
            End If
            If Nz(Me!NrFunktion1, 0) = 0 Then
                lgAdr1 = OH_NeueAdresse(Me!Nachname1, Nz(Me!vorname1, ""), Me!ArtAdresse1)
            Else
                strSQL = strQ & "lstActNeu'" & _
                    ",@a = " & lgact & _
                    ",@i = " & Me!NrFunktion1
                OH_r r
                lgAdr1 = r!NrAdresse
            End If
            strFun1 = "unbekannt"
            lgNeu1 = OH_NeueFunktion(lgAdr1, lgAdr, strFun1)
            Me!NrFunktion1 = lgNeu1
        End If
    Case 20, 21, 30, 31
        If Not OH_CheckName(Me!Nachname, 2) Then
            GoTo ErrEnd
        End If
        If Not OH_CheckName(Me!Vorname, -1) Then
            GoTo ErrEnd
        End If
        If lgact < 30 Then
            If Nz(Me!NrFunktion, 0) = 0 Then
                strFun = "privat"
                lgAdr = OH_NeueAdresse(Me!Nachname, Nz(Me!Vorname, ""), Me!ArtAdresse)
                If lgAdr = 0 Then
                    GoTo ErrEnd
                End If
                lgNeu = OH_NeueFunktion(lgAdr, lgAdr, strFun)
                Me!NrFunktion = lgNeu
            End If
        Else
            Select Case Me!ArtAdresse1
            Case "Herr", "Frau"
            Case Else
                s = " geht nur mit <Herr> oder <Frau>"
                Me!ArtAdresse1.SetFocus
                GoTo ErrM
            End Select
            If Not OH_CheckName(Me!Nachname1, 2) Then
                GoTo ErrEnd
            End If
            If Not OH_CheckName(Me!vorname1, -1) Then
                GoTo ErrEnd
            End If
            If Nz(Me!NrFunktion, 0) = 0 Then
                strFun = Me!lstActNeu.column(1)
                lgAdr = OH_NeueAdresse(Me!Nachname, Nz(Me!Vorname, ""), Me!ArtAdresse)
                If lgAdr = 0 Then
                    GoTo ErrEnd
                End If
                lgNeu = OH_NeueFunktion(lgAdr, lgAdr, "privat")
                Me!NrFunktion = lgNeu
            End If
            If Nz(Me!NrFunktion1, 0) = 0 Then
                lgAdr1 = OH_NeueAdresse(Me!Nachname1, Nz(Me!vorname1, ""), Me!ArtAdresse1)
                If lgAdr1 = 0 Then
                    GoTo ErrEnd
                End If
                lgNeu1 = OH_NeueFunktion(lgAdr1, lgAdr1, "privat")
                Me!NrFunktion1 = lgNeu1
            End If
            If Me!NrFunktion > 0 And Me!NrFunktion1 > 0 And lgact >= 30 Then
                strSQL = strQ & "lstActNeu'" & _
                        ",@a = " & lgact & _
                        ",@f = '" & Me!lstActNeu.column(1) & _
                        "',@i = " & Me!NrFunktion & _
                        ",@b = " & Me!NrFunktion1
                OH_r r
                s = r!Msg
                SysCmd acSysCmdSetStatus, s
            End If
        End If
    End Select
    If lgO > 0 Then
        strFun = Me!ogAdresse & "," & lgO & "," & lgAdr & "," & lgNeu & "," & lgAdr1 & "," & lgNeu1
        strSQL = "spa_Adresse " & _
                " @x ='OutlookUpdate', " & _
                " @f ='" & strFun & "'"
    End If
    frma!txtFind = ""
    lgNeu = Me!NrFunktion
    OH_InsertID lgNeu, , True
    If Nz(Me!NrFunktion1, 0) > 0 Then
        lgNeu1 = Me!NrFunktion1
        OH_InsertID lgNeu1
        lgNeu = lgNeu1
    End If
    OH_OF "F_Adresse", lgNeu, 10
    frma!regd = 1
    If lgO > 0 Then
        'If OH_SyncContactOutlook(frmA!lstOutlook.column(1), lgNeu) > 0 Then ACHGTUN NOCH ZU BEARBEITEN; WICHTIGER CODE AUSKOMMENTIERT DASS OUTLOOK LÄUFT 180419 EO & OH
'            frmA!lstOutlookAct = 10
'            frmA.lstOutlookAct_AfterUpdate
'        End If
    End If
    DoCmd.Close acForm, "PF_NeuAdresse"
ErrEnd:
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "btnOK_Click"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Function OH_CheckName(ctlN As control, Optional lgBuchstaben As Long) As Boolean
On Error GoTo ErrMsg
    If lgBuchstaben = -1 And Nz(ctlN, "") = "" Then
        t = "Vornamen sind auch wichtig!"
        If MsgBox("Sie haben den Vornamen NICHT eingegeben", vbExclamation + vbOKCancel, t) = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    If lgBuchstaben > 0 And Len(ctlN.Value) < lgBuchstaben Then
        s = ctlN & " ==>Bitte mindestens " & lgBuchstaben & " Buchstaben eintragen"
        GoTo ErrM
    End If
    If InStr(Nz(ctlN, " eintragen"), " eintragen") > 0 Then
        s = ctlN & " ??????????"
        ctlN.SetFocus
        SysCmd acSysCmdSetStatus, s & ": Bitte Namen korrekt erfassen"
    Else
        OH_CheckName = True
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_CheckName"
    Resume ErrM
ErrM:
    ctlN.SetFocus
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Function OH_Eintragen(ctlN As control) As Boolean
On Error GoTo ErrMsg
    If InStr(Nz(ctlN, " eintragen"), " eintragen") > 0 Then
        SysCmd acSysCmdSetStatus, ctlN & ": Bitte Namen korrekt erfassen"
        DoEvents
        ctlN.SelStart = 0
        ctlN.SelLength = 255
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_Eintragen"
    Resume ErrM
ErrM:
    ctlN.SetFocus
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub btnSuch_Click()
    OH_Navigator 80
End Sub
Private Sub btnSuch1_Click()
    OH_Navigator 81
End Sub
