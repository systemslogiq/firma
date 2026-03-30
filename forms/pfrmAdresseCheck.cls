Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim lgC As Long
Dim lgFirma As Long
Dim lgPerson As Long
Dim strQ As String
Dim strSelect As String
Dim blStop As Boolean
Dim strCB As String
Dim lgcolor As Long
Private Sub Form_Load()
On Error GoTo ErrMsg
    lgcolor = vbRed
    strQ = "execute dbo.spA_AdresseCheck @x ="
    Me.Caption = "Adressen erstellen"
    strSQL = strQ & "'lstart'"
    OH_A "lstart", strSQL, Me
    strSQL = strQ & "'Default'"
    OH_r r
    blStop = False
    Me!btnCB.SetFocus
    Me!lstArt = 10
    btnCB_Click
    Me!lstS.ControlTipText = "Hinweise nach Adress-Eingabe"
    OH_Move Me, 0, 70, 260, 150
    Set frm = Forms!F_Adresse
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_Close()
    OH_ResetID
End Sub

Private Sub btnCB_Click()
On Error GoTo ErrMsg
    Dim lgC As Long
    strSQL = strQ & "'Land'"
    OH_A "Land", strSQL, Me
    OH_r r
    Me!Land = r!LandKZ
    OH_A "Anrede", strQ & "'Anrede'", Me
    Me!Anrede = "Herr"
    strSelect = ""
    Me!Firma.Visible = True
    Me!cb = Null
    strCB = Nz(OH_CBget(Me!cb), "")
    Me!cb = strCB
'    strCB = Replace(strCB, "   ", ";")
    strCB = Replace(strCB, vbTab, " ")
    strCB = Replace(strCB, Chr(13), ";")
    strCB = Replace(strCB, Chr(10), "")
    strCB = Replace(strCB, Chr(9), " ")
    strCB = Replace(strCB, "*", ";")
    strCB = Replace(strCB, ",", ";")
    strCB = Replace(strCB, " | ", ";")
    strCB = Replace(strCB, "|", ";")
    strCB = Replace(strCB, ", www", ";www")
    strCB = Replace(strCB, ", Dire", ";Dire")
    'Beispiel Obergrundstrasse 110, CH-6002 Luzern abfangen
    strCB = Replace(strCB, ", CH-", "; CH-")
    strCB = Replace(strCB, ", DE-", "; DE-")
    Me!lstArt = 10
    lstArt_AfterUpdate
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 5
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.btnCB_Click"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
GoTo ErrEnd
End Sub
Private Sub lstArt_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgTop As Long
    DoCmd.Hourglass True
    lgTop = 0
    strQ = "execute [dbo].[spA_AdresseCheck] " & _
            "@a = " & Nz(Me!lstArt, 0) & _
            ",@x ="
    Me!lstS.RowSource = "" 'geht so in accdb, da Source eine Wertliste ist 180504 EO
    Me!lstS.Visible = False
    For Each ctl In Me.Det.Controls
        Select Case ctl.ControlType
        Case acComboBox, acTextBox
            ctl.Visible = InStr(ctl.Tag, Me!lstArt) > 0
            If InStr(ctl.Tag, "leermachen") > 0 Then
                ctl.Value = Null
            End If
        End Select
    Next ctl
    Select Case Me!lstArt
    Case 10 'Firma
        Me!lblVorname.Caption = "Kurzname der Fa."
        Me!lblNAchname.Caption = "Firmen-Name"
        Me!lblBeruf.Caption = "Branche"
        Me!lblGebTag.Caption = "Gründung"
        Me!lblTelefon.Caption = "Telefon Zentrale"
        Me!EMail.BorderColor = vbBlack
        Me!lblEmail.Caption = "Email Fa."
        Me!Vorname.BorderColor = vbBlack
        Me!lblStrasse.Caption = "Strasse"
        Me!lblLand.Caption = "Land"
        Me!lblPLZ.Caption = "PLZ"
        Me!lblOrt.Caption = "Ort"
    Case 20, 30 'Person in Firma'
        Me!lblVorname.Caption = "Vorname"
        Me!lblNAchname.Caption = "Nachname"
        Me!lblBeruf.Caption = "Beruf"
        Me!lblGebTag.Caption = "Geburtstag"
        Me!lblTelefon.Caption = "Telefon"
        Me!lblEmail.Caption = "Email"
        Me!Vorname.BorderColor = vbRed
        Me!lblStrasse.Caption = "Strasse (privat)"
        Me!lblLand.Caption = "Land (privat)"
        Me!lblPLZ.Caption = "PLZ (privat)"
        Me!lblOrt.Caption = "Ort (privat)"
        Me!Strasse.BorderColor = vbBlack
    End Select
    Me!Land.BorderColor = vbRed
    Me!Nachname.BorderColor = vbRed
    If Me!Firma.Visible Then
        strSQL = strQ & "'FirmaOrt'"
        OH_A "Firma", strSQL, Me
    End If
    Me!btnFirma.Visible = Me!Firma.Visible
    i = Len(Me!cb)
    If i < 80 And i > 0 Then
        OH_Info "Zwischenablage beinhaltet KEINE Adresse (nur " & i & " Zeichen)"
    End If
    Me!lstA.RowSource = strCB 'geht so in accdb, da Source eine Wertliste ist 180504 EO
    OH_check "Email"
    OH_check "Internet"
    OH_check "Telefon"
    OH_check "Fax"
    OH_check "Mobile"
    OH_check "Firma"
    Select Case Me!lstArt
    Case 10
        OH_check "Firma", lgFirma
        If Nz(Me!Nachname, "") = "" Then
            s = Nz(Me!lstA.column(0, 0))
            Me!Nachname = Trim(s)
            OH_Repl s
        End If
        OH_check "Strasse"
        OH_check "PLZ"
    Case 20
        OH_check "Email"
        OH_check "Funktion"
        OH_check "Titel"
        OH_check "Beruf"
        OH_check "Vornachname"
        OH_check "Telefon"
        OH_check "Vorname"
        Me!Firma = lgFirma
        OH_check "Anrede"
    Case 30
        OH_check "Titel"
        OH_check "Vornachname"
        OH_check "Vorname"
        OH_check "Strasse"
        OH_check "PLZ"
        OH_check "Anrede"
    End Select
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.lstArt_AfterUpdate"
    Resume ErrEnd
StopIt:
    DoCmd.Close acForm, Me.Name
    GoTo ErrEnd
End Sub
Private Function OH_check(strCheck As String, _
                          Optional lgF As Long = 0)
On Error GoTo ErrMsg
    Dim strI As String
    Dim strIprev As String
    Dim strC As String
    Dim N As Long
    Dim lgI As Long
    Dim Y As Long
    t = "Checke " & strCheck
    Y = Me!lstA.ListCount - 1
    For lgC = 0 To Y
        strI = Nz(Me!lstA.column(0, lgC))
        s = Trim(strI)
        If s = "" Then
            GoTo nextlgc
        End If
        SysCmd acSysCmdSetStatus, "Checke " & strCheck
        Select Case strCheck
        Case "EMAIL"
            s = Replace(s, "[at]", "@")
            i = InStr(s, ",")
            If i > 1 Then
                s = left(s, i - 1)
            End If
            lgI = InStr(s, "@")
            If lgI > 0 Then
                For i = lgI To 1 Step -1
                    Select Case Mid(s, i, 1)
                    Case " ", ":"
                        s = Mid(s, i + 1, Len(s))
                    End Select
                Next i
                For i = lgI To Len(s)
                    Select Case Mid(s, i, 1)
                    Case " "
                        s = left(s, i - 1)
                    End Select
                Next i
                s = Replace(s, " email", "")
                s = Replace(s, "e-mail", "")
                s = Replace(s, " mail", "")
                s = Replace(s, "'", "")
                s = Trim(s)
                If OH_Valid_Mail_URL(Nz(s), , Me!EMail) = False Then
                    GoTo ErrEnd
                End If
                lgI = InStr(s, "@")
                strSQL = strQ & "'Email'" & _
                        ", @f = '" & OH_RPL(s) & "'"
                Me!EMail = s
                OH_r r
                If Not r.BOF Then     ' EmailAdresse gibt es
                    OH_Info "Email-Adresse ist bereits vorhanden!"
                    Select Case Me!lstArt
                    Case 10
                        If r!FP = 0 Then
                            Me!Nachname = r!FirmenName
                            Me!EMail = Null
                        Else
                            Me!Nachname = r!Nachname
                        End If
                    Case Else
                        Me!Firma = r!NrAdrZuord
                    End Select
                Else
                    N = InStr(s, ".")
                    If N > 0 And N < lgI Then
                        Me!Nachname = Trim(Mid(s, N + 1, lgI - N - 1))
                        Me!Nachname = UCase(left(Me!Nachname, 1)) & LCase(Mid(Me!Nachname, 2))
                        If Me!lstArt <> 10 Then
                            Me!Vorname = Trim(left(s, N - 1))
                            Me!Vorname = UCase(left(Me!Vorname, 1)) & LCase(Mid(Me!Vorname, 2))
                            If Len(Nz(Me!Vorname, "")) < 3 Then
                                For i = 0 To 5
                                    s = Me!lstA.column(0, i)
                                    If InStr(s, Me!Nachname) Then
                                        Me!Vorname = Trim(left(s, InStr(s, " ")))
                                        Exit For
                                    End If
                                Next i
                            Else
                                For i = 0 To 5
                                    s = Nz(Me!lstA.column(0, i), "")
                                    N = InStr(s, " " & Me!Nachname)
                                    If N > 1 Then
                                        Me!Vorname = Trim(left(s, N))
                                        Exit For
                                    End If
                                Next i
                            End If
                        End If
                    End If
                End If
                OH_Repl strI
                Exit For
            End If
        Case "Internet"
            i = InStr(s, "www")
            If i > 0 Then
                s = Mid(s, i)
                s = Replace(s, "..", ".")
                If Len(s) > 7 And InStr(5, s, ".") > 6 Then
                    Me!Internet = s
                    strSQL = strQ & "'www'" & _
                             ", @f = '" & OH_RPL(s) & "'"
                    OH_r r
                    If Not r.BOF Then
                        OH_Info "WWW-Adresse ist bereits vorhanden!"
                        lgFirma = r!ID
                    End If
                End If
                OH_Repl strI
                Exit For
           End If
        Case "Telefon", "FAX", "Mobile"
            Select Case strCheck
            Case "Telefon"
                i = 0
                If InStr(s, "telefax") = 0 Then
                    i = InStr(s, "tel") + _
                        InStr(s, "phone") + _
                        InStr(s, "Direkt:") + _
                        InStr(s, "T ") + _
                        InStr(s, "Fon") + _
                        InStr(s, "P. ")
                    If i > 0 Then
                        N = 0
                        For N = 1 To Len(s)
                            Select Case Mid(s, N, 1)
                            Case "+", "0"
                                Exit For
                            Case Else
                                If Val(Mid(s, N, 1)) > 0 Then
                                    Exit For
                                End If
                            End Select
                        Next N
                        If N > 0 Then
                            s = Mid(s, N)
                        End If
                    End If
                End If
                If i = 0 Then
                    i = InStr(s, "+4")
                    If i > 0 Then
                        s = Mid(s, i)
                    End If
                End If
            Case "FAX"
                i = InStr(s, "fax") + InStr(s, "f +")
                If InStr(strIprev, "fax") > 0 And InStr(s, "+4") > 0 And i = 0 Then
                    i = 1
                End If
            Case "Mobile"
                i = InStr(s, "mobil") + InStr(s, "handy") + InStr(s, "M. ")
            End Select
            If i > 0 Then
                For N = 0 To 9
                    If InStr(s, N) > 0 Then
                        For i = 0 To 250
                            strC = Chr(i)
                            Select Case strC
                            Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", "+", "(", ")"
                            Case Else
                                s = Replace(s, strC, "")
                            End Select
                        Next i
                        s = Trim(s)
                        If Len(s) < 6 Then
                            s = ""
                        End If
                        s = Trim(Replace(s, "()", ""))
                        s = Trim(Replace(s, "  ", " "))
                        Me(strCheck) = s
                        OH_Repl strI
                        Exit For
                    End If
                Next N
            End If
        Case "TelefonDirekt"
            If InStr(s, "Direkt:") > 0 Or InStr(s, "Direct:") > 0 Then
                Me!Telefon = "Dr."
            End If
        Case "Titel"
            If InStr(s, "Dr.") > 0 Then
                Me!Titel = "Dr."
            End If
        Case "Anrede"
            Select Case left(s, 5)
            Case "Frau", "Herr", "Frau ", "Herr "
                Me!Anrede = left(s, 4)
            End Select
            If IsNull(Me!Anrede) Then
                Me!Anrede = "Herr"
                If Nz(Me!Vorname, "") <> "" Then
                    strSQL = strQ & "'Anrede'" & _
                             ", @f = '" & OH_RPL(Me!Vorname) & _
                             "',@b = 1"
                    OH_r r
                    If Not r.BOF Then
                        Me!Anrede = r!Anrede
                    Else
                        If right(Me!Vorname, 1) = "a" Then
                            Me!Anrede = "Frau"
                        End If
                    End If
                End If
            End If
        Case "Firma"
            i = InStr(s, "firma")
            If i = 1 And lgFirma = 0 Then
                s = Replace(s, ":", "")
                s = Replace(s, "firma", "")
                s = Trim(s)
            End If
            strSQL = strQ & "'Firma'" & _
                     ", @f = '" & OH_RPL(s) & _
                     "',@i = " & lgF
            OH_r r
            If Not r.BOF Then
                lgFirma = r!ID
                If Me!lstArt = 10 Then
                    Me!Nachname = s
                    Me!Beruf = r!Branche
                    If Not r.BOF Then
                        OH_Info "Firmen-Name ist bereits vorhanden!"
                    End If
                Else
                    Me!Firma = lgFirma
                End If
                OH_Repl strI
            Else
                If Me!lstArt = 10 Then
                    If right(s, 3) = " AG" Or _
                       InStr(s, " gmbh") > 0 Or _
                       InStr(s, "S.A.") > 0 Or _
                       InStr(s, " KG") > 0 Or _
                       InStr(s, " & ") > 0 Or _
                       InStr(s, "kanzlei ") > 0 Or _
                       InStr(s, "Büro") > 0 Or _
                       InStr(s, "Ingenieure") > 0 Or _
                       InStr(s, "e.K.") > 0 Then
                        If Len(s) - Len(Replace(s, " ", "")) < 5 Then
                            Me!Nachname = s
                            OH_Repl strI
                        End If
                    End If
                End If
            End If
        Case "PLZ"
            s = OH_RPL(s)
            strSQL = strQ & "'PLZ'" & _
                     ", @f = '" & OH_RPL(s) & "'"
            OH_r r
            If Not r.BOF Then
                Me!PLZStrasse = r!PLZStrasse
                Me!Land = r!Land
                Me!Ort = r!Ort
                OH_Repl strI
                If Len(Nz(Me!Ort, "")) > 0 Then
                    lgC = Y
                End If
            Else
                strSQL = strQ & "'Ort'" & _
                         ", @f = '" & OH_RPL(s) & "'"
                OH_r r
                If Not r.BOF Then
                    Me!Ort = r!Ort
                    Me!Land = r!Land
                    Me!PLZStrasse = r!plz
                    OH_Repl strI
                    If Len(Nz(Me!Ort, "")) > 0 Then
                        lgC = Y
                    End If
                End If
            End If
            If Nz(Me!PLZStrasse, "") = "" Then
                s = Replace(s, "PLZ", "")
                s = Trim(Replace(s, ":", ""))
                i = 0
                For N = 1 To Len(s)
                    If IsNumeric(Mid(s, N, 1)) Then
                        i = i + 1
                        Select Case i
                        Case 4, 5 '4 =CH 5 '=DE
                            If Mid(s, N + 1, 1) = " " Then
                                Me!PLZStrasse = left(s, i)
                                Me!Ort = Trim(Mid(s, i + 1, 100))
                                Exit For
                            End If
                        End Select
                    Else
                        i = 0
                    End If
                Next N
            End If
        Case "Strasse"
            If Len(s) > 5 Then
                strSQL = strQ & "'Strasse'" & _
                         ", @f = '" & OH_RPL(s) & "'"
                OH_r r
                If Not r.BOF Then
                    Me!Strasse = r!Strasse
                    OH_Repl strI
                Else
                    If InStr(s, "Strasse ") + _
                       InStr(s, "Str. ") + _
                       InStr(s, "Allee ") + _
                       InStr(s, "Straße ") + _
                       InStr(s, "Weg ") > 0 Then
                        Me!Strasse = Trim(Replace(s, "Adresse:", ""))
                        OH_Repl strI
                    End If
                End If
            End If
        Case "Vornachname"
            If Nz(Me!Vorname, "") <> "" And Nz(Me!Nachname, "") <> "" Then
                GoTo ErrEnd
            End If
            If Len(s) > 5 Then
                For i = 1 To Len(s)
                    If Val(Mid(s, i, 1)) > 0 Then
                        GoTo ErrEnd
                    End If
                Next i
                strSQL = strQ & "'Vornachname'" & _
                         ", @f = '" & OH_RPL(s) & "'"
                OH_r r
                If Not r.BOF Then
                    Me!Vorname = r!Vorname
                    Me!Nachname = r!Nachname
                    Me!Anrede = r!Anrede
                    OH_Info "Vor- und Nachname sind bereits enthalten"
                    OH_Repl strI
                End If
            End If
        Case "Vorname"
            If Not IsNull(Me!Vorname) And Not IsNull(Me!Nachname) Then
                strSQL = strQ & "'checkTitel'"
                OH_r r
                While Not r.EOF
                    If left(Me!Vorname, r!l) = r!Titel Then
                        Me!Vorname = Trim(Mid(Me!Vorname, r!l + 1))
                        Me!Titel = r!Titel
                        GoTo ErrEnd
                    End If
                r.MoveNext
                Wend
                GoTo ErrEnd
            End If
            If Len(s) > 5 Then
                For i = 1 To Len(s)
                    If Val(Mid(s, i, 1)) > 0 Then
                        GoTo ErrEnd
                    End If
                Next i
                strSQL = strQ & "'Vorname'" & _
                         ", @f = '" & OH_RPL(s) & "'"
                OH_r r
                If Not r.BOF Then
                    Me!Vorname = r!Vorname
                    Me!Nachname = r!Nachname
                    Me!Anrede = r!Anrede
                    OH_Repl strI
                End If
            End If
        Case "Beruf"
            If Len(s) > 5 Then
                For i = 1 To Len(s)
                    If Val(Mid(s, i, 1)) > 0 Then
                        GoTo ErrEnd
                    End If
                Next i
                strSQL = strQ & "'Beruf'" & _
                         ", @f = '" & OH_RPL(s) & "'"
                OH_r r
                If Not r.BOF Then
                    Me!Beruf = r!Beruf
                    OH_Repl Me!Beruf
                End If
            End If
        Case "Funktion"
            strSQL = strQ & "'Funktion'" & _
                     ", @f = '" & OH_RPL(s) & "'"
            OH_r r
            If Not r.BOF Then
                Me!Funktion = r!Funktion
                OH_Repl strI
            Else
                If InStr(s, "Leiter ") + InStr(s, "head of") > 0 Then
                    Me!Funktion = s
                    OH_Repl strI
                End If
            End If
        End Select
        strIprev = Trim(strI)
nextlgc:
    Next lgC
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.OH_check"
    Resume ErrEnd
End Function
Private Sub Anrede_Click()
    OH_SetSelect Me!Anrede
End Sub
Private Sub Anrede_DblClick(Cancel As Integer)
    Select Case Nz(Me!Anrede, "")
    Case "Herr"
        Me!Anrede = "Frau"
    Case Else
        Me!Anrede = "Herr"
    End Select
End Sub
Private Sub Titel_Click()
    OH_SetSelect Me!Titel
End Sub
Private Sub Titel_DblClick(Cancel As Integer)
    Select Case Nz(Me!Titel, "")
    Case "Dr."
        Me!Titel = "Prof."
    Case "Prof."
        Me!Titel = ""
    Case Else
        Me!Titel = "Dr."
    End Select
End Sub
Private Sub vorname_click()
    OH_SetSelect Me!Vorname
End Sub
Private Sub Nachname_click()
    OH_SetSelect Me!Nachname
End Sub
Private Sub Beruf_Click()
    OH_SetSelect Me!Beruf
End Sub
Private Sub Gebtag_Click()
    OH_SetSelect Me!GebTag
End Sub
Private Sub PLZStrasse_Click()
On Error GoTo ErrMsg
    OH_SetSelect Me!PLZStrasse
    strSQL = strQ & "'OrtausPLZ'" & _
        ", @f = '" & Me!PLZStrasse & "'"
    OH_r r
    If r.BOF = False Then
        Me!Ort = r!Ort
    End If
   ' lgFirma = r!ID
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.PLZStrasse_Click"
    Resume ErrEnd
End Sub
Private Sub Ort_Click()
    OH_SetSelect Me!Ort
End Sub
Private Sub Strasse_Click()
    OH_SetSelect Me!Strasse
End Sub
Private Sub Bemerkung_Click()
    OH_SetSelect Me!Bemerkung
End Sub
Private Sub Funktion_Click()
    OH_SetSelect Me!Funktion
End Sub
Private Sub Abteilung_Click()
    OH_SetSelect Me!Abteilung
End Sub
Private Sub Firma_Click()
    OH_SetSelect Me!Firma
End Sub
Private Sub Firma_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    Me!Firma = frm!NrAdrZuord
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.Firma_DblClick"
    Resume ErrEnd
End Sub

Private Sub Telefon_Click()
    OH_SetSelect Me!Telefon
End Sub
Private Sub Fax_Click()
    OH_SetSelect Me!Fax
End Sub
Private Sub email_Click()
    OH_SetSelect Me!EMail
End Sub
Private Sub Mobile_Click()
    OH_SetSelect Me!Mobile
End Sub
Private Sub Internet_Click()
    OH_SetSelect Me!Internet
End Sub
Private Sub cb_Exit(Cancel As Integer)
On Error GoTo ErrMsg
    Dim lgStart As Long
    Dim lgLen As Long
    lgStart = Me!cb.SelStart + 1
    lgLen = Me!cb.SelLength
    If lgLen = 0 Then
        strSelect = ""
    Else
        strSelect = Trim(Nz(Mid(Me!cb, lgStart, lgLen), ""))
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.PLZStrasse_Click"
    Resume ErrEnd
End Sub
Private Function OH_SetSelect(ctl As control)
On Error GoTo ErrMsg
    If Len(strSelect) > 1 Then
        ctl.Value = strSelect
        strSelect = ""
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.OH_SetSelect"
    Resume ErrEnd
End Function
Private Sub btnSave_Click()
On Error GoTo ErrMsg
    Dim lgX As Long
    Dim strMail As String
    Dim lgA As Long
    Dim lgAFirst As Long
    t = Me!Nachname & "    Adresse erstellen"
    For Each ctl In Me.Det.Controls
        Select Case ctl.ControlType
        Case acComboBox, acTextBox
            If ctl.BorderColor = vbRed And ctl.Visible = True Then
                If Nz(ctl, "") = "" Then
                    s = ctl.Name & vbNewLine & _
                        "Bitte alle rot umrandeten Felder ausfüllen"
                    ctl.SetFocus
                    GoTo ErrM
                End If
            End If
        End Select
    Next ctl
    s = Replace(Me!lstS.RowSource, ";", vbNewLine) 'geht so in accdb, da Source eine Wertliste ist 180504 EO
    If Len(s) > 10 Then
        s = s & vbNewLine & vbNewLine & _
            "Adresse dennoch erfassen?"
        If MsgBox(s, vbOKCancel + vbQuestion + vbDefaultButton2, t) = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    OH_Info ""
    If OH_Valid_Mail_URL(Nz(Me!EMail)) = False Then
        GoTo ErrEnd
    End If
    strMail = Nz(Me!EMail)  'Prüfen, ob diese Mailadresse schon vorhanden ist
    strSQL = strQ & "'Email'" & _
                ", @f = '" & strMail & "'"
    OH_r r
    s = ""
    If r.BOF = False Then
        'nach Rückfrage Erfassung zulassen, obwohl Mailadresse bereits vorhanden ist
        s = "Soll die Adresse trotzdem erfasst werden, obwohl die Email-Adresse bereits vorhanden ist?"
        If MsgBox(s, vbOKCancel + vbExclamation, t) = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    If Nz(Me!Internet) <> "" Then
        If OH_Valid_Mail_URL(Nz(Me!Internet), "Internet") = False Then
            GoTo ErrEnd
        End If
    End If
    Select Case Me!lstArt
    Case 10
        strSQL = strQ & "'Firma'" & _
                ", @f = '" & OH_RPL(Me!Nachname) & _
                "', @s = '" & Me!Land & _
                "', @d = '" & OH_RPL(Me!Ort) & "'"
        OH_r r
        If r.BOF Then
            s = "Firma:" & vbTab & Me!Nachname & vbNewLine & _
                "Ort:" & vbTab & Me!Ort & vbNewLine & vbNewLine & _
                "ist nicht vorhanden" & vbNewLine & vbNewLine & _
                "Neue Firma erfassen?"
            If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
                GoTo ErrEnd
            End If
        Else
            OH_Info left(Me!Nachname, 35) & "... Firma ist bereits erfasst"
            lgFirma = r!ID
            GoTo ErrEnd
        End If
    Case 20
        lgFirma = Nz(Me!Firma, 0)
        If lgFirma = 0 Then
            OH_Info "Bitte eine Firma auswählen"
            GoTo ErrEnd
        End If
        strSQL = strQ & "'PersoninFirma'" & _
                ", @i = " & Me!Firma & _
                ", @f = '" & OH_RPL(Me!Nachname) & _
                "', @d = '" & OH_RPL(Me!Vorname) & "'"
        OH_r r
        If Not r.BOF Then
            OH_Info Me!Vorname & " " & Me!Nachname & " arbeitet bereits in der Fa. " & Me!Firma.column(1)
            lgFirma = r!ID
            GoTo ErrEnd
        End If
        If Nz(Me!Strasse, "") <> "" Then
            strSQL = strQ & "'Personstrasse'" & _
                    ", @i = " & Me!Firma & _
                    ", @f = '" & OH_RPL(Me!Strasse) & "'"
            OH_r r
            If Not r.BOF Then
                s = "Hat " & Me!Vorname & " " & Me!Nachname & vbNewLine & _
                    "wirklich die gleiche Adresse" & vbNewLine & _
                    vbTab & Me!Strasse & vbNewLine & _
                    "wie die Fa.?" & vbNewLine & vbNewLine & _
                        "JA" & vbTab & "Adresse ist identisch" & vbNewLine & _
                        "NEIN" & vbTab & "andere Adresse, nicht bekannt"
                i = MsgBox(s, vbYesNoCancel + vbQuestion + vbDefaultButton2, t)
                Select Case i
                Case vbNo
                    Me!Strasse = Null
                    Me!PLZStrasse = Null
                    Me!Ort = Null
                Case vbCancel
                    GoTo ErrEnd
                End Select
            End If
        End If
    Case 30 'Person privat
        strSQL = strQ & "'Personprivat'" & _
                ", @f = '" & OH_RPL(Me!Nachname) & _
                "', @d = '" & OH_RPL(Me!Vorname) & "'"
        OH_r r
        If Not r.BOF Then
            OH_Info Me!Vorname & " " & Me!Nachname & " ist als Privat bereits erfasst"
            lgFirma = r!ID
            GoTo ErrEnd
        End If
    End Select
    If Len(Me!PLZStrasse) > 10 Then
        Me!PLZStrasse.SetFocus
        s = "Bitte PLZ kontrollieren (max 10 Zeichen zulässig)"
        GoTo ErrM
    End If
    strSQL = strQ & "'AdresseNeu'" & _
            ", @i =" & lgFirma & _
            ", @f = '" & Me!Anrede & _
            "', @d = '" & OH_RPL(Nz(Me!Titel)) & _
            "', @o = '" & OH_RPL(Me!Vorname) & _
            "', @s = '" & OH_RPL(Me!Nachname) & _
            "', @s1 = '" & OH_RPL(Nz(Me!Beruf)) & _
            "', @t = '" & Nz(Format(Me!GebTag, "yyyymmdd")) & _
            "', @s2 = '" & OH_RPL(Nz(Me!Strasse)) & _
            "', @s3 = '" & OH_RPL(Nz(Me!Land)) & _
            "', @s4 = '" & OH_RPL(Nz(Me!PLZStrasse)) & _
            "', @s5 = '" & OH_RPL(Nz(Me!Ort)) & _
            "', @s6 = '" & OH_RPL(Nz(Me!Bemerkung)) & _
            "', @s7 = '" & OH_RPL(Nz(Me!Funktion, "unbekannt")) & _
            "', @s8 = '" & OH_RPL(Nz(Me!Abteilung)) & _
            "', @s9 = '" & OH_RPL(Nz(Me!Telefon)) & _
            "', @s10 = '" & OH_RPL(Nz(Me!Mobile)) & _
            "', @s11 = '" & OH_RPL(Nz(Me!Fax)) & _
            "', @s12 = '" & Me!EMail & _
            "', @s13 = '" & OH_RPL(Nz(Me!Internet)) & "'"
    OH_r r
    lgA = r!ID
    If lgAFirst = 0 Then
        lgAFirst = r!idf
    End If
    s = Me!Vorname & " " & Me!Nachname & vbNewLine & _
            vbTab & "NEUE Adresse öffnen?"
    If lgA > 0 Then
        Select Case Me!lstArt
        Case 10
            s = "JA" & vbTab & "neuer Mitarbeiter zuordnen?" & vbNewLine & vbNewLine & _
                "NEIN" & vbTab & s
            i = MsgBox(s, vbQuestion + vbYesNo, t)
            Select Case i
            Case vbYes
                Me!lstArt = 20
                lstArt_AfterUpdate
                Me!Firma = lgA
                Me!Vorname.SetFocus
                GoTo ErrEnd
            End Select
        Case Else
            s = s & vbNewLine & vbNewLine & _
                "JA" & vbTab & "dieses Formular schliessen" & vbNewLine & _
                "NEIN" & vbTab & "Formular offen lassen"
            lgX = MsgBox(s, vbQuestion + vbYesNo, t)
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            End Select
        End Select
        OH_OF "F_Adresse", lgAFirst, 10
        If lgX = vbYes Then
            DoCmd.Close acForm, Me.Name
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.btnSave_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Public Function OH_Info(strS As String)
On Error GoTo ErrMsg
    Dim strX As String
    If strS = "" Then
        Me!lstS.RowSource = "" 'geht so in accdb, da Source eine Wertliste ist 180504 EO
        Me!lstS.Visible = False
    Else
        strX = Nz(Me!lstS.RowSource, "")
        If strX = "" Then
            Me!lstS.RowSource = strS
        Else
            Me!lstS.RowSource = strX & ";" & strS 'geht so in accdb, da Source eine Wertliste ist 180504 EO
        End If
        Me!lstS.Visible = True
        Me!lstS.BackColor = QBColor(12)
        Me!lstS.ForeColor = QBColor(15)
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.OH_Info"
    Resume ErrEnd
End Function
Public Function OH_Repl(strS As String)
On Error GoTo ErrMsg
    If strS = "" Then
        GoTo ErrEnd
    End If
    strSQL = Me!lstA.RowSource 'geht so in accdb, da Source eine Wertliste ist 180504 EO
    strSQL = Replace(strSQL, strS, "")
    strSQL = Replace(strSQL, ";;", ";")
    Me!lstA.RowSource = strSQL 'geht so in accdb, da Source eine Wertliste ist 180504 EO
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.OH_Repl"
    Resume ErrEnd
End Function
Private Sub btnFirma_Click()
On Error GoTo ErrMsg
    t = Me!Vorname & " " & Me!Nachname & " arbeitet bei Fa.:"
    s = "JA" & vbTab & frm!FirmenName & ", " & frm!Ort & " zuordnen" & vbNewLine & _
        "NEIN" & vbTab & "Firmen-Auswahl starten"
    i = MsgBox(s, vbYesNoCancel, t)
    Select Case i
    Case vbYes
        Me!Firma = frm!NrAdrZuord
    Case vbNo
        OH_Navigator 50
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmAdresseCheck.btnFirma_Click"
    Resume ErrEnd
End Sub
Private Sub btnSoGehts_Click()
    t = Me!btnSoGehts.ControlTipText
    s = "Kopieren Sie z.B. von einer WEB-Seite eine komplette Adresse incl. Strasse, Ort, Tel. etc." & vbNewLine & _
        "Der kopierte Text wird unten eingetragen und die Datenbank versucht, die Adresse zu erkennen und in die einzelnen Felder aufzulösen." & vbNewLine & _
        "Sie können auch Text im unteren Feld einfach markieren und das Markierte mit einem Klick in das richtige Feld rechts eintragen lassen"
    MsgBox s, vbInformation, t

End Sub
