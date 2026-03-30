Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database   'Verwenden der Datenbank-Sortierreihenfolge beim Vergleich von Zeichenfolgen.
Option Explicit
Dim strReport As String
Dim irt As Integer
Dim intWidth As Integer
Dim intLeft As Integer
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    strReport = Nz(VarAntw, "Brief")
    Set frm = Forms!F_Adresse
    OH_SetFont Me, glstrFont
    strSQL = "Exec dbo.spa_B " & _
            " @x = 'B_Brief' " & _
            ", @id = " & Val(strMSG(1)) & _
            ", @v = " & frm!comAnredeWie & _
            ", @f = '" & lgR(OH_RPL(Nz(frm!Anschrift))) & _
            "', @d = '" & lgR(Nz(frm!comAnrede)) & "'"
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg:
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub GFCC_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!TxtAttachment = Null
    Me!Attachment = Null
    Me!TxtCC = Null
    Me!CC = Null
    Me!txtPS = Null
    GFCC.Visible = False
    If Len(Nz(VarAntw, "")) > 5 Then  'kleine varantw abfangen!!
        GFCC.Visible = True
        Me!TxtCC = lg("zur Kenntnis") & ":"
        Me!CC = VarAntw  'siehe Übergabe bei btnPrint_Click in F_Adresse
    End If
    If Len(glstrPS) > 0 Then
        GFCC.Visible = True
        Me!txtPS = glstrPS
    End If
    If Not IsNull(frm!comBeilage) Then
        GFCC.Visible = True
        Me!TxtAttachment = lg("Anlagen") & ": "
        Me!Attachment = frm!comBeilage
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.GFCC_Format"
    Resume ErrEnd
End Sub
Private Sub GHFun_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg:
    Dim strBS As String
    Dim strHL As String
    Dim strAnrede As String
    Dim strReportAdresse As String
    Dim rsa As ADODB.Recordset
    Dim lgTop, lgLeft, lgHeight, lgWidth As Long, lgtopAdresse As Long
    strSQL = "Exec dbo.spa_B_VG " & _
            " @x = 'rsA'," & _
            " @i = " & frm!NrMitarbeiter
    OH_r rsa, , , , True
    OH_EFAbsender frm!NrMitarbeiter, strReport
    Me!Mitarbeiter = rsa!Mitarbeiter
    Select Case strReport
    Case "Brief"
        Me!FaxEmailSeite.Visible = False
        Me!UnterschriftPic.Visible = False
    Case "Fax", "Email"
        Me!FaxEmailSeite.Visible = True
        Me!FaxEmailSeite = strReport & "-Nummer:" & vbNewLine & Me(strReport)
        Me!UnterschriftPic.Visible = True
        Me!UnterschriftPic.picture = OH_GetPic(frm!NrMitarbeiter, "+Unterschrift")
    End Select
    Me!rt = Nz(frm!txtMemo, "")
    Me!txtDatum = Format(Nz(frm!txtDate, Date), "dd. mmmm yyyy")
    Me!BetreffKontakt = frm!StandardText
    Me!TX_EFName = rsa!AF_Nachname
    Me.Caption = Replace(left(Nz(Me!BetreffKontakt, strReport), 30), " ", "_")
    rsa.MoveFirst
    rsa.Find "Stichwort='+Fontsize Adresse'"
    If Not rsa.EOF Then
        strBS = Nz(rsa!BemStichwort, "")
        strHL = Nz(rsa!HL, "")
        lgtopAdresse = (Val(Mid(strBS, InStr(strBS, "topAdresse") + 11, 4)) * 567) * 2 'Notnagel 141128
        lgTop = Val(Mid(strBS, InStr(strBS, "oben") + 5, 4)) * 567
        lgLeft = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
        lgWidth = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
        lgHeight = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
        rsa.MoveFirst
        rsa.Find "Stichwort='+Fontsize Kurz-Adresse'"
        Me!TX_EFKlein = vbNullString
        If Not rsa.EOF Then
            If InStr(rsa!BemStichwort, strReport) > 0 Then
                Me!TX_EFKlein = EFAbsenderKlein
            End If
            x = Val(rsa!BemStichwort)
            If x > 0 Then
                Me!TX_EFKlein.FontSize = x
            Else
                Me!TX_EFKlein = vbNullString
            End If
        End If
        If Me!FaxEmailSeite.Visible = True Then
            lgtopAdresse = lgtopAdresse + Me!FaxEmailSeite.Height
        End If
        If Me!IDWie.Visible = True Then
            lgtopAdresse = lgtopAdresse + Me!IDWie.Height
        End If
        If Me!TX_EFKlein.Visible = True Then
            Me!TX_EFKlein.top = lgtopAdresse
            lgtopAdresse = lgtopAdresse + Me!TX_EFKlein.Height + 50
        End If
        Me!Adresse.top = lgtopAdresse + 0.1 * 567
        If InStr(strBS, strReport) > 0 Then
            If Len(strHL) = 0 Then
                Me!TX_EFAbsender = EFAbsender
                Me!TX_EFAbsender.Visible = True
                x = Val(strBS)
                If x > 0 Then
                    Me!TX_EFAbsender.FontSize = x
                Else
                    Me!TX_EFAbsender = vbNullString
                End If
                Me!TX_EFAbsender.top = lgTop
                Me!TX_EFAbsender.Width = 0
                Me!TX_EFAbsender.left = lgLeft
                Me!TX_EFAbsender.Width = lgWidth
                Me!TX_EFAbsender.Height = lgHeight
                Me!LogoAdresse.Visible = False
            Else
                Me!TX_EFAbsender.Visible = False
                Me!LogoAdresse.Visible = True
                Me!LogoAdresse.top = lgTop
                Me!LogoAdresse.left = lgLeft
                Me!LogoAdresse.Width = lgWidth
                Me!LogoAdresse.Height = lgHeight
                Me!LogoAdresse.picture = OH_checkFile(strHL)
            End If
        End If
        x = Me!Adresse.top + Me!Adresse.Height
        If x > lgHeight + lgTop Then
            lgHeight = x + 0.7 * 567
        Else
            lgHeight = lgHeight + lgTop
        End If
        Me.GHFun.Height = lgHeight + 2 * 567
        Me!BetreffKontakt.top = lgHeight + 0.1 * 567
        Me!Anrede.top = Me!BetreffKontakt.top + Me!BetreffKontakt.Height + 0.7 * 567
        Me!txtDatum.top = Me!BetreffKontakt.top
        If lgLeft = 0 Then
            intLeft = 9 * 567
            intWidth = 18 * 567 - intLeft
            Me!GrussLg.Width = intWidth
            Me!GrussLg.left = intLeft
            Me!TX_EFName.Width = intWidth
            Me!TX_EFName.left = intLeft
            Me!UnterschriftPic.Width = intWidth
            Me!UnterschriftPic.left = intLeft
            Me!Mitarbeiter.Width = intWidth
            Me!Mitarbeiter.left = intLeft
            Me!TX_EFKlein.Width = intWidth
            Me!TX_EFKlein.left = intLeft
            Me!Adresse.Width = intWidth
            Me!Adresse.left = intLeft
        End If
        Me!LogoSeiteU.Visible = Me!LogoSeiteO.Visible
        If Me!LogoSeiteO.Visible = True Then
            rsa.MoveFirst
            strlink = "HLL ='+Logo oben" & Me!Land & "'"
            '1 suche, ob ein Hyperlink so aufhört  (Beispiel "D" für Deutschland)
            rsa.Find strlink
            If rsa.EOF Then
                strlink = "Stichwort ='+Logo oben'"
                rsa.MoveFirst
                rsa.Find strlink
            End If
            If Not rsa.EOF Then
                strBS = rsa!BemStichwort
                If InStr(strBS, strReport) > 0 Then
                    Me!LogoSeiteO.picture = OH_checkFile(rsa!HL)
                    Me!LogoSeiteO.Visible = True
                    Me!LogoSeiteO.Width = 0
                    Me!LogoSeiteO.left = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
                    Me!LogoSeiteO.Width = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
                    Me!LogoSeiteO.Height = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
                End If
            End If
            rsa.MoveFirst
            strlink = "HLL ='+Logo unten" & Me!Land & "'"
            '1 suche, ob ein Hyperlink so aufhört  (Beispiel "D" für Deutschland)
            rsa.Find strlink
            If rsa.EOF Then
                strlink = "Stichwort ='+Logo unten'"
                rsa.MoveFirst
                rsa.Find strlink
            End If
            If Not rsa.EOF Then
                strBS = rsa!BemStichwort
                If InStr(strBS, strReport) > 0 Then
                    Me!LogoSeiteU.picture = OH_checkFile(rsa!HL)
                    Me!LogoSeiteU.Visible = True
                    Me!LogoSeiteU.Width = 0
                    Me!LogoSeiteU.left = Val(Mid(strBS, InStr(strBS, "Links") + 6, 4)) * 567
                    Me!LogoSeiteU.Width = Val(Mid(strBS, InStr(strBS, "Breite") + 7, 4)) * 567
                    Me!LogoSeiteU.Height = Val(Mid(strBS, InStr(strBS, "Höhe") + 5, 4)) * 567
                End If
            End If
        End If
    End If
ErrEnd:
    OH_ResetRS rsa
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.GHFun_Format"
    Resume ErrEnd
End Sub
Private Sub SK_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg:
   Me!ctlGrpPages = getPageNr(Me.pages, Me.page, Me!Fun)
    If Not gllg Like "Deutsch" Then
        Me!ctlGrpPages = Replace(Me!ctlGrpPages, "Seite ", " " & lg("Seite") & " ")
        Me!ctlGrpPages = Replace(Me!ctlGrpPages, " von ", " " & lg("von") & " ")
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.SK_Format"
    Resume ErrEnd
End Sub
Private Sub Report_Close()
On Error GoTo ErrMsg:
    VarAntw = Null
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_B_Brief.Report_Close"
    Resume ErrEnd
End Sub
