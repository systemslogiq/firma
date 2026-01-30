Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim lgI As Long
Dim strQ As String
Dim strT As String
Dim lgct As Long
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    strT = "Gelangensbestätigung"
    t = "Drucke " & strT
    strQ = "Exec dbo.iso " & _
            "@x = '" & strT & _
          "',@i = " & Forms!F_VG!NrVG & _
           ",@u = " & lguser
    strSQL = strQ
    OH_r r
    lgI = r!Msg
    Select Case lgI
    Case 0
        s = "Eine " & strT & " ist NICHT erforderlich, da kein entsprechender Text eingetragen ist."
        GoTo ErrM
    Case 1
        i = vbNo
    Case Else
        s = "In diesem Monat sind " & lgI & " " & strT & "en erfasst!" & vbNewLine & _
        "Sollen diese alle auf einem Blatt ausgedruckt werden?" & vbNewLine & vbNewLine & _
            "JA" & vbTab & " Alle" & vbNewLine & _
            "NEIN" & vbTab & "Nur Aktuelle"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, t)
        If i = vbCancel Then
            Cancel = True
            GoTo ErrEnd
        End If
    End Select
    strSQL = strQ & ", @a = " & i
    If i = vbNo Then
        Me.Caption = strT & " Einzeln"
        OH_EX
    Else
        Me.Caption = strT & " pro Monat zusammengefasst"
        OH_r r
        lgct = r!CT
    End If
    strSQL = strQ & ", @a = " & 1
    Cancel = OH_B(Me, , , strSQL)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptGelangensbestaetigung.Report_Open"
    Resume ErrEnd
ErrM:
    Cancel = True
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptGelangensbestaetigung.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!Logo.picture = OH_GetPic(EFNrFktn, "+Logo oben")
    Me!txtinfo = lg("ausgedruckt von") & "  " & strUser & " " & lg("am") & " " & Format(Date, "dd.mm.yyyy") & _
             "    " & lg("Seite") & " " & Me!pg & " " & lg("von") & " " & Me!pgs

ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2220
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptGelangensbestaetigung.ph_Format"
    End Select
    Resume ErrEnd
End Sub
Private Sub Det_Format(Cancel As Integer, FormatCount As Integer)
    Select Case Me!ob1
    Case 50
        Me!Txt2.FontSize = 12
        Me!Txt2.FontBold = True
    Case Else
        Me!Txt2.FontSize = 10
        Me!Txt2.FontBold = False
    End Select
    Me!Txt2.Width = 0
    Me!txt3.Width = 0
    Me!txt4.Width = 0
    Me!txt3.Visible = False
    Me!txt4.Visible = False
    If Me!txt8 = "Einzel" Then
        Me!txt1.FontBold = True
        Me!txt1.Width = 4.5 * 567
        Me!Txt2.left = 4.5 * 567
        Me!Txt2.Width = 13.5 * 567
        For i = 1 To 4
            Me("txt" & i).BorderStyle = 0
        Next i
    Else
        Me!txt1.FontBold = False
        Me!txt1.Width = 2 * 567
        Me!Txt2.left = 2 * 567
        Me!Txt2.Width = 6 * 567
        Me!txt3.left = 8 * 567
        Me!txt3.Width = 3 * 567
        Me!txt4.left = 11 * 567
        Me!txt4.Width = 6 * 567
        For i = 1 To 4
            Me("txt" & i).Height = Me!txt1.Height
            Me("txt" & i).Visible = True
            Me("txt" & i).BorderColor = vbBlack
            Me("txt" & i).BorderStyle = 1
            Me("txt" & i).FontSize = 10
        Next i
    End If
End Sub
Private Sub Report_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    If lgI > 1 And lgct > 0 Then
        s = "Jetzt wird für alle " & strT & "en das Stichwort" & vbNewLine & vbNewLine & _
            "< " & strT & " gesendet >" & vbNewLine & vbNewLine & _
            "überprüft (" & lgI & ") resp. eingetragen (" & lgct & ")"
        i = MsgBox(s, vbQuestion + vbYesNoCancel, strT & " eintragen")
        Select Case i
        Case vbYes
            strSQL = strQ & ", @a =  2"
            OH_EX
        Case vbCancel
            Cancel = True
        End Select
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptGelangensbestaetigung.Report_Close"
    Resume ErrEnd
ErrM:
    Cancel = True
    MsgBox s, vbInformation, t
    GoTo ErrEnd
End Sub
