Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim Y As Long
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Dim strA As String
    Dim N As Long
    Dim b As Long
    Dim h As Long
    Dim l As Long
    Dim A As Long
    Dim o As Long
    Dim lgK As Long
    Dim lgL As Long
    lgL = lgLeerEtiketten - 1
    lgK = lgKopienEtiketten - 1
    Set frm = Forms!F_Adresse
    Y = vbYes
    If InStr(Nz(frm!comAnschrift), "Privat") Then
        Y = MsgBox("Soll der Absender" & vbNewLine & _
                    EFAbsenderKlein & vbNewLine & _
                    "erscheinen?", vbQuestion + vbYesNoCancel, Me.Caption)
        Select Case Y
        Case vbCancel
            Cancel = True
            GoTo ErrEnd
        End Select
    Else
        Y = vbYes
    End If
    If Y = vbYes Then
        OH_EFAbsender Nz(frm!NrMitarbeiter, lguser)
        For i = 1 To 3
            Me("l" & i).Caption = EFAbsenderKlein
        Next i
    End If
    ''Anzahl Spalten3;Breite;6350;Höhe;3810;linker Rand;721;Abstand;254;Oberer Rand;1000'
    If InStr(strMSG(5), "Anzahl spalten") > 0 Then
        strSQL = "Select * from dbo.split('" & strMSG(5) & "',';')"
        OH_r r
        While Not r.EOF
            Select Case r!Nr
            Case 2 'Anzahl Spalte
                N = r!data
            Case 4 'breite
                b = r!data
            Case 6 'höhe
                h = r!data
            Case 8 'links
                l = r!data
            Case 10 'abstand
                A = r!data
            Case 12 'oben
                o = r!data
            End Select
        r.MoveNext
        Wend
    End If
    Me.pf.Height = o * 0.567
    o = Me!l1.top
    If Y = 6 Then
        o = o + Me!l1.Height
    End If
    For i = 1 To 3
        Me("a" & i).Width = (b + A) * 0.567
        Select Case i
        Case 1
            Me("a" & i).left = l * 0.567
        Case 2, 3
            If i = 3 Then
                Me("a" & i).Width = Me.Width - (Me("a" & i - 1).left + Me("a" & i - 1).Width)
            End If
            Me("a" & i).left = Me("a" & i - 1).left + Me("a" & i - 1).Width
        End Select
        With Me("l" & i)
            If Y = 6 Then
                .Width = 0
                .Visible = True
                .left = Me("a" & i).left
                .Width = Me("a" & i).Width
            Else
                .Visible = False
            End If
        End With
        Me("a" & i).Height = 0
        Me("a" & i).top = o
        Me("a" & i).Height = h * 0.567 - o
    Next i
    Me.Det.Height = Me!a1.top + Me!a1.Height
    If IsNull(frm!Anschrift) Then
        frm.comAnschrift_AfterUpdate
    End If
    strSQL = "Exec dbo.spa_B " & _
            " @x = 'B_EtiketteX'" & _
            ",@id = " & frm!NrFunktion & _
            ",@f = '" & frm!comAnschrift & _
            "',@d = '" & OH_RPL(Nz(frm!Anschrift)) & _
            "',@v = " & lgK & _
            ",@i = " & lgL
    Cancel = OH_B(Me, , , strSQL)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteX.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteX.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    If Y = 6 Then
        For i = 1 To 3
            Me("l" & i).Visible = Nz((Me("a" & i)), "") <> ""
        Next i
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_EtiketteX.Det_Format"
    Resume ErrEnd
End Sub
