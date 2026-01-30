Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim blC As Boolean
Private Sub Form_Load()
On Error GoTo ErrMsg
    OH_Move Me, 100, 20, 205, 200
    strSQL = "EXECUTE spa_Artikel @x = 'lstPF_RabattAct'"
    OH_A "lstPF_RabattAct", strSQL, Me
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Form_PF_Rabatt: Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    lgid = Nz(Me!nrID, 0)
    blC = True
    Me.Requery
    OH_FB Me, "NrID =  " & lgid, "Rabatt"
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Private Sub Form_AfterDelConfirm(status As Integer)
    blC = True
End Sub
Public Sub lstPF_RabattAct_AfterUpdate()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgact As Long
    Dim strQ As String
    Dim N As Long
    lgid = Nz(Me!nrID, 0)
    lgact = Nz(Me!lstPF_RabattAct, 0)
    t = Nz(Me!lstPF_RabattAct.column(1), "")
    DoCmd.Hourglass True
    Select Case lgact
    Case 11, 20, 21, 30, 31
        If lgid = 0 Then
            s = "Es ist kein Datensatz aktiviert!"
            GoTo ErrM
        End If
    End Select
    OH_SaveRS Me
    strQ = "EXECUTE spa_Artikel " & _
                "@x = 'lstPF_RabattAct'" & _
                ",@a = " & lgact & _
                ",@i = " & lgid

    Select Case lgact
    Case 10 '  Schliessen (ohne Speichern)
        If blC Then
            s = "Sie haben Änderungen vorgenommen" & vbNewLine & vbNewLine & _
                "JA" & vbTab & "Speichern ist doch sinnvoll" & vbNewLine & _
                "NEIN" & vbTab & "NICHT speichern"
            i = MsgBox(s, vbExclamation + vbYesNoCancel, t)
            Select Case i
            Case vbYes, vbCancel
                GoTo ErrEnd
            End Select
        End If
        DoCmd.Close acForm, Me.Name
    Case 11 ' Speichern und Schliessen
        If Not blC Then
            s = "Sie haben nix verändert"
            GoTo ErrM
        End If
        OH_r r, strQ
        N = r!CT
        s = r!Msg
        MsgBox s, vbInformation, t
        DoCmd.Close acForm, Me.Name
        If N > 0 And OH_isloaded("F_Artikel") Then '2509024 Input Michi
            OH_RQ Forms!F_Artikel!lstRabatt
        End If
    Case 20, 21 ' weiterer Rabatt, Rabatt kopieren
        OH_r r, strQ
        i = r!nrID
        If i = 0 Then
            s = "gescheitert"
            GoTo ErrM
        End If
        Me.Requery
        OH_FB Me, "nrid = " & r!nrID, "Mindestmenge"
    Case 21 ' Rabatt kopieren
    Case 30 ' Rabatt löschen
        Me!Rabatt = 0
        OH_SaveRS Me
    Case 31 ' ALLE Rabatte löschen und schliessen...
        s = Me!Kunde & vbNewLine & "Alle Rabatte löschen?"
        If MsgBox(s, vbExclamation + vbOKCancel + vbDefaultButton2, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = strQ & ",@n =" & Me!NrFunktion
        OH_EX
        DoCmd.Close acForm, Me.Name
        OH_RQ Forms!F_Artikel!lstRabatt
    End Select
ErrEnd:
    DoCmd.Hourglass False
    OH_ResetRS r
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "PF_Rabatt.lstPF_RabattAct_AfterUpdate"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
