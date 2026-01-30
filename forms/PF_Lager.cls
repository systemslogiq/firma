Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim blDelete As Boolean
Private Sub Form_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = Not OH_Lager(Me.OpenArgs)
    Me!btnSave.Visible = False
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Lager"
    Resume ErrEnd
End Sub
Private Sub btnSave_Click()
On Error GoTo ErrMsg
    Dim strf As String
    Dim lgid As Long
    Dim rsL As ADODB.Recordset
    lgid = Nz(Me!nrLager, 0)
    Dim sgMenge As Single
    Dim sgMengeLO As Single
    Dim sgMengeTot As Single
    DoCmd.Hourglass True
    t = "Speichern " & Me.Caption
    If OH_Validate(Me!LagerMenge, "Lagermenge") Then GoTo ErrEnd
    If OH_Validate(Me!Lagerort, "Lagerort") Then GoTo ErrEnd
    If OH_Validate(Me!Lagerfach, "Lagerfach") Then GoTo ErrEnd
    Me!LagerMitarbeiter = Nz(Me!LagerMitarbeiter, lguser) 'immer User als Lagermitarbeiter eintragen, wenn nicht eingetragen
    Me!DatumBuchung = Nz(Me!DatumBuchung, Date)
    i = Abs(DateDiff("d", Me!DatumBuchung, Date))
    If i > 14 Then
        If glAdmin Then
            s = "Als Admin können Sie auch Buchungen ändern, die mehr als 14 (im aktuellen Fall " & i & ") Tage vom aktuellen Datum abweichen." & vbNewLine & vbNewLine & _
                "Bitte unten Begründung eingeben"
            strf = "Begründung:"
            s = Replace(Trim(InputBox(s, t, strf)), strf, "")
            If s = "" Then
                GoTo ErrEnd
            End If
            If Nz(Me!BemLager, "") = "" Then
                Me!BemLager = s
            Else
                Me!BemLager = s & vbNewLine & Me!BemLager
            End If
        Else
            s = "Bitte Datum überdenken!"
            GoTo ErrM
        End If
    End If
    t = Me.Caption
    Select Case Me!LagerMenge
    Case 0
        If Me!EinAus <> 0 Then
            s = "Das Lager wird zugeordnet, es erfolgt aber keine Buchung (Menge = 0)."
            If MsgBox(s, vbDefaultButton2 + vbYesNo + vbExclamation, t) = vbNo Then
                OH_A " @x='DeleteLager'" & _
                     ", @i = " & Me!nrLager, , Me
                OH_EX
                Me!btnClose.SetFocus
                Me!btnSave.Visible = False
                GoTo ErrEnd
            End If
        End If
    Case Is < 0
        Me!EinAus = -1
        Me!LagerMenge = Abs(Me!LagerMenge)
        s = "Sie wollen einen Lager-Abgang vornehmen (Menge = " & Me!LagerMenge & ")?"
        If MsgBox(s, vbDefaultButton2 + vbYesNo + vbExclamation, t) = vbNo Then
            GoTo ErrEnd
        End If
    End Select
    If Me!EinAus = -1 Then
        OH_A " @x='Lagermenge'" & _
             ", @i = " & Me!nrLager & _
             ", @a = " & Me!NrArtikel, , Me
        OH_r r
        sgMenge = r!LagerMenge
        sgMengeLO = sgMenge - Me!LagerMenge
        t = t & " (" & sgMenge & " an Lager)"
        Select Case sgMengeLO
        Case Is < 0
            Me!LagerMenge.BackColor = vbRed
            MsgBox "An Lager: " & sgMenge & vbNewLine & vbNewLine & _
                "Sie können nicht mehr aus dem Lager holen als Sie zur Verfügung haben!" & vbNewLine & vbNewLine & _
                       "Bitte Buchung korrigieren!" _
                       , vbCritical, t
            Me!LagerMenge = sgMenge
            Me!LagerMenge.SetFocus
            GoTo ErrEnd
        Case Else 'Korrektur 220929
            If r!LagerMindestMenge > 0 Then
                s = "Hinweis:" & vbNewLine & _
                    "Die Lagermindestmenge von " & r!LagerMindestMenge & " ist "
                Select Case r!LagerMM - Me!LagerMenge
                Case Is < 0
                    Me!LagerMenge.BackColor = vbRed
                    s = s & "unterschritten!"
                    MsgBox s, vbInformation, t
                Case 0
                    Me!LagerMenge.BackColor = vbYellow
                    s = s & "erreicht!"
                    MsgBox s, vbInformation, t
                End Select
            End If
        End Select
    End If
    OH_A "@x = 'SaveLager' " & _
        ",@i = " & lgid & _
        ",@a = " & Me!NrArtikel & _
        ",@b = " & Me!LagerMitarbeiter & _
        ",@n = " & Me!EinAus & _
        ",@r = '" & Me!LagerMenge & _
        "',@f = '" & Nz(Me!Lagerort, "") & _
        "',@d = '" & Format(Nz(Me!DatumBuchung, ""), "yyyymmdd") & _
        "',@w = '" & Nz(Me!Lagerfach, "") & _
        "',@s = '" & Nz(Me!BemLager, "") & "'", , Me
    OH_r r
    s = r!Msg
    If s <> "" Then
        GoTo ErrM
    End If
    If OH_isloaded("F_Artikel") Then
        OH_RQf Forms!F_Artikel, Me!NrArtikel
    End If
    DoCmd.Close acForm, Me.Name
ErrEnd:
    OH_ResetRS
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    s = Err & " " & Err.Description
    t = "btnSave_Click"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Private Sub Form_Close()
' OHNEMUS, Mittwoch, 9. November 2005
On Error GoTo ErrMsg
    'temporär erstellt==> wenn keine Änderung erfolgt, wird der Datensatz wieder gelöscht
    OH_A "@x ='deleteLagerAll'"
    OH_EX
    If f.Name = "F_Artikel" Then
        f.regD_Change
        f!lstLager = Me!nrLager
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Form_PF_lager.Form_Close"
    End Select
    Resume ErrEnd
End Sub
Private Sub Form_DblClick(Cancel As Integer)
On Error GoTo ErrMsg
    DoCmd.Close
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Lager"
    Resume ErrEnd
End Sub
Private Function OH_ChangeBuchung()
On Error GoTo ErrMsg
    Dim lgcolor As Long
    OH_A "@x ='CheckInaktiv'" & _
            ",@f = '" & Me!Lagerort & _
            "',@d = '" & Me!Lagerfach & "'", , Me
    OH_r r
    lgcolor = vbWhite
    s = "Liste zeigt alle jemals erstellten Lagerorte"
    If r!CheckInaktiv > 0 Then
        lgcolor = vbRed
        s = "INAKTIV GESETZT" & vbNewLine & s
    End If
    Me!Lagerort.ControlTipText = s
    Me!Lagerort.BackColor = lgcolor
    Me!Lagerfach.BackColor = lgcolor
    If Not IsNull(Me!Lagerort) _
        And Not IsNull(Me!Lagerfach) _
        And Not IsNull(Me!LagerMenge) _
        And lgcolor = vbWhite Then
        Me!btnSave.Visible = True
    End If
    Me!LastUpdate = Now
    Me!whoUpdate = strUser
    If Me!EinAus = 0 Then
        Me!BemLager = "Inventur-Bereinigung"
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_ChangeBuchung"
    Resume ErrEnd
End Function
Public Function OH_Lager(strOpenArgs As String) As Boolean '<R10>
On Error GoTo ErrMsg
    Dim lgLager As Long
    Dim lgArtikel As Long
    Dim strOA As String
    strOA = Nz(Me.OpenArgs, "")
    lgArtikel = Val(strOA)
    lgLager = InStr(strOA, "|")
    If lgLager > 0 Then
        lgLager = Val(Mid(strOA, lgLager + 1))
    Else
        lgLager = lgArtikel
    End If
    t = "Lagerbuchung zu Artikel "
    If InStr(Me.OpenArgs, "Lagerbuchung") > 0 _
        Or InStr(Me.OpenArgs, "Inventur") > 0 Then '190110 FKU
        OH_A "@x='Buchung', " & _
             "  @i = " & lgArtikel & _
             ", @a = " & lgLager & _
             ", @b = " & lguser, , Me
        OH_r r
        lgLager = r(0)
    End If
    If InStr(Me.OpenArgs, "Inventur") > 0 Then '190110 FKU
        Me!EinAus = 0
    End If
    If InStr(Me.OpenArgs, "F_VG") > 0 Then
        Set f = Forms!F_VG
    Else
        Set f = Forms!F_Artikel
    End If
    Me.Caption = t
    OH_A "LagerMitarbeiter", "@i=" & Nz(Me!LagerMitarbeiter, 0), Me
    OH_Number Me, Me!LagerMenge, 30, 0, 1
    Me.Move 15 * 567, 12 * 567, 9 * 567, 9 * 567
    s = "Lagerort zeigt alle jemals eingetragenen Lagerorte"
    Me!Lagerort.ControlTipText = s
    OH_A "@x='ID', " & _
        " @i = " & lgLager, , Me
    OH_r r
    If r.BOF Then
        GoTo ErrEnd
    Else
        For i = 0 To r.Fields.count - 1
            Me(r.Fields(i).Name) = r.Fields(i).Value
        Next
    End If
    Me!EinAus = Nz(Me!EinAus, 1)
    OH_A "einaus", "@a = " & Me!EinAus, Me
    If Me!LagerMenge < 0 Then
        Me!EinAus = -1
    End If
    Me!LagerMenge = Abs(Me!LagerMenge)
    If Me!EinAus = 0 Then
        EinAus_AfterUpdate
    End If
    OH_Lager = True
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "Lager"
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Private Sub btnDatumBuchung_Click()
    OH_OpenKalender Me!DatumBuchung
End Sub
Private Sub EinAus_BeforeUpdate(Cancel As Integer)
On Error GoTo ErrMsg
    Me!LastUpdate = Now()
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EinAus_BeforeUpdate"
    Resume ErrEnd
End Sub
Public Sub EinAus_AfterUpdate()
On Error GoTo ErrMsg
    If Me!EinAus = 0 Then 'inventur
        'hole aktuellen Lagerbestand
        OH_A "@x = 'GetLagerbestand'" & _
            ",@i = " & Me!NrArtikel & _
            ",@f = '" & Nz(Me!Lagerort, "") & _
            "',@w = '" & Nz(Me!Lagerfach, "") & "'", , Me
        OH_r r
        Me!LagerMenge = r!Menge
    End If
    OH_ChangeBuchung
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "EinAus_AfterUpdate"
    Resume ErrEnd
End Sub

Private Sub Lagerfach_AfterUpdate()
    OH_ChangeBuchung
End Sub
Private Sub Lagerfach_Change()
    OH_ChangeBuchung
End Sub

Private Sub LagerMitarbeiter_AfterUpdate()
    OH_ChangeBuchung
End Sub

Private Sub DatumBuchung_AfterUpdate()
    OH_ChangeBuchung
End Sub
Private Sub SpinButtonMenge_SpinDown()
    If Me!LagerMenge > 0 Then
        Me!LagerMenge = Nz(Me!LagerMenge, 0) - 1
    End If
    OH_ChangeBuchung
End Sub
Private Sub SpinButtonMenge_Spinup()
    Me!LagerMenge = Nz(Me!LagerMenge, 0) + 1
    OH_ChangeBuchung
End Sub

Private Sub BemLager_AfterUpdate()
    OH_ChangeBuchung
End Sub

Private Sub BemLager_Change()
    OH_ChangeBuchung
End Sub
Private Sub EinAus_DblClick(Cancel As Integer)
    Select Case Me!EinAus
    Case 1
        Me!EinAus = -1
    Case -1
        Me!EinAus = 1
    End Select
    EinAus_AfterUpdate
End Sub
Private Sub btnLagerMitarbeiter_Click()
On Error GoTo ErrMsg
    If IsNull(Me!LagerMitarbeiter) = True Then
        Me!LagerMitarbeiter.SetFocus
        Me!LagerMitarbeiter.Dropdown
    Else
        OH_OF "F_Adresse", Nz(Me!LagerMitarbeiter, 0)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "btnLagerMitarbeiter_Click"
    Resume ErrEnd
End Sub
Private Sub Lagerfach_Enter()
On Error GoTo ErrMsg
    OH_A "LagerFach", _
            "@f = '" & Me!Lagerort & _
            "',@d = '" & Nz(Me!Lagerfach) & "'", Me
    If Me!Lagerfach.ListCount = 1 And IsNull(Me!Lagerfach) Then
        OH_r r
        Me!Lagerfach = r!Lagerfach
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Lager Lagerfach_Enter"
    Resume ErrEnd
End Sub

Private Sub Lagerort_AfterUpdate()
    Me!Lagerfach.SetFocus
    OH_ChangeBuchung
End Sub

Private Sub Lagerort_Enter()
    OH_A "Lagerort", "@f = '" & Me!Lagerort & "'", Me
End Sub

Private Sub Lagermenge_AfterUpdate()
    OH_ChangeBuchung
End Sub
Private Sub Lagermenge_DblClick(Cancel As Integer)
'Doppelklick um die Menge jeweils um 1 zu erhöhen
    Me!LagerMenge = Nz(Me!LagerMenge, 0) + 1
    OH_ChangeBuchung
End Sub

Private Sub btnclose_Click()
    DoCmd.Close acForm, Me.Name
End Sub
