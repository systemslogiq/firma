Attribute VB_Name = "mdl_Outlook"
'Outlook Funktionen
'Update 100829 Telefonie via dial Contact
Option Compare Database
Option Explicit
Global myOlApp      As Outlook.Application
Dim oCalendar       As Outlook.Folder
Dim outlookFolder   As Outlook.Folder
Dim myolRecip       As Outlook.Recipient
Dim rcps            As Outlook.recipients
Dim myItem          As Outlook.MailItem
Dim gnspNameSpace   As Outlook.Namespace
Private myobjFolder As MAPIFolder
Private myParentFolder As MAPIFolder
Public Type ImportResults
   NewCompanies As Long
    NewPersons As Long
    ExistingCompanies As Long
    ExistingPersons As Long
    UpdatedRecords As Long
    DetailedUpdates As String
End Type
Public Function OH_OutlookMail(strTO As String, _
                                 strSubject As String, _
                                 strBody As String, _
                                 Optional lgFunktion As Long, _
                                 Optional strBeilage As String, _
                                 Optional strCC As String, _
                                 Optional lgSendMail As Long = 0, _
                                 Optional strBCC As String, _
                                 Optional strVorlage As String, _
                                 Optional f As Form, _
                                 Optional strAbsender As String, _
                                 Optional strAnrede As String, _
                                 Optional strB2bFolder As String = "" _
                                 ) As Boolean
Dim iUB As Integer
Dim objAccount As Outlook.Account
'strSubject Text Betreff
'strBody    Text des Mails
'strBeilage Beilagen (Trennzeichen ist ";")
    On Error GoTo ErrMsg
    Dim N As Integer
    Dim lgType As Integer
    Dim strSignatur As String
    Dim strFilter As String
    Dim strFile As String
    Dim strM As String
    Dim strB As String
    Dim strS() As String
    Dim lgS As Long
    Dim lgVG As Long
    Dim strline As String
    Dim strHTML As String
    Dim strForm As String
    Dim strQ_DMS As String
    Dim strSQL_DMS As String
    Dim oExisting As Outlook.MailItem
    Dim oB2B_Folder As Outlook.Folder
    t = "Erstelle Mail"
    DoCmd.Hourglass True
    If strB2bFolder <> "" Then
        Set oB2B_Folder = OH_OutlookFolder(strB2bFolder)
        If Not oB2B_Folder Is Nothing Then
            strFilter = "[To] = '" & Replace(strTO, "'", "''") & "' AND [Subject] = '" & Replace(strSubject, "'", "''") & "'"
             ' Prüfen, ob es schon eine solche Mail gibt
            Set oExisting = oB2B_Folder.Items.Find(strFilter)
            If Not oExisting Is Nothing Then
                ' Gefunden ? alte Mail löschen (überschreiben)
                oExisting.Delete
            End If
        End If
    End If

    If lguser = 0 Then
        strSubject = "da stimmt was nicht!"
        s = "lguser = 0==>Autoexec starten"
        GoTo ErrM
    End If
    strSQL = "Exec dbo.spa_Adresse " & _
            " @x = 'checkAnrede' " & _
            ",@i = " & lguser & _
            ",@a = " & lgFunktion & _
            ",@f = '" & strTO & _
            "',@o = '" & gllg & "'"
    OH_r r
    If strTO = "" Then
        strTO = r!EMail
    End If
    'erstelle Anrede abhängig von Person / Firma
    EFAbsender = Nz(r!EFAbsender, "Unbekannt")
    If EFAbsender = "Unbekannt" Then
        s = "Absender unbekannt!"
        GoTo ErrM
    End If
    strForm = f.Name
    If strForm = "F_Adresse" Then
        strM = Nz(f!OutlookVorlage, "") 'wenn eine Outlookvorlage eingetragen ist, soll keine Du-Frage kommen...
    End If
    Select Case strAnrede
    Case "Anrede neutral" '210419 A.Lips
        strAnrede = lg("Sehr geehrte Damen und Herren")
    Case "keine Anrede"
        strAnrede = ""
    Case Else
        If strAnrede = "" Then
            strAnrede = Nz(r!Anrede, "")
            i = vbNo
            If InStr(strEmail, ";") > 0 Then 'mindestens 2 mailadressen 160625
                strAnrede = lg("Sehr geehrte Damen und Herren")
            Else
                strSignatur = Nz(r!signatur, "")
                If Nz(r!AnredeDu, "") <> "" And strM = "" Then
                    i = MsgBox(strTO & vbNewLine & vbNewLine & _
                            "Welche Anrede verwenden?" & vbNewLine & vbNewLine & _
                            "JA" & vbTab & r!AnredeDu & vbNewLine & _
                            "Nein" & vbTab & r!Anrede, _
                            vbYesNoCancel + vbQuestion, t)
                    Select Case i
                    Case vbCancel
                        GoTo ErrEnd
                    End Select
                End If
            End If
            Select Case i
            Case vbYes
                strAnrede = Nz(r!AnredeDu, "")
                strSignatur = Nz(r!signaturdu, "")
            End Select
        End If
    End Select
    Select Case strSignatur
    Case "", "Standard"
        strSignatur = "Standard"
    Case Else
        strSignatur = "<br><p style='font-family:" & glstrFontEmail & ";font-size:" & glstrFontSizeEmail & "pt'>" & strSignatur & "</p>"
    End Select
    'wenn Geburtstag per Du, soll neben Philipp auch Angelika stehen!
    If strSubject = "Happy Birthday" And EFNr = 1 Then
        strSignatur = "<br><p style='font-family:" & glstrFontEmail & ";font-size:" & glstrFontSizeEmail & "pt'>" & r!signaturdu & "</p>"
        strSignatur = Replace(strSignatur, "Philipp", "Elena & Jim, Angelika & Philipp")
    End If

'Mail in Outlook erstellen
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    If strVorlage = "" Then
        Set myItem = myOlApp.CreateItem(olMailItem)
    Else
        Set myItem = myOlApp.CreateItemFromTemplate(strVorlage)
    End If
    myItem.To = strTO
    myItem.CC = strCC
    myItem.bcc = strBCC
    If strSubject <> "" Then
        myItem.Subject = strSubject
    End If
    myItem.display
    Select Case strSignatur
    Case "Standard"
        strSignatur = Trim(myItem.HTMLBody)
    Case Else
        If strForm = "F_VG" Then
            If InStr(f!comPrint.column(1), "Standard-Signatur") > 0 Then
                strSignatur = myItem.HTMLBody
                GoTo nextStep
            End If
        End If
    End Select
nextStep:
    If Len(strBeilage) = 0 Then
        N = 0
    Else
        strB = Trim(Replace(strBeilage, ";;", ";"))
        If left(strB, 1) = ";" Then
            strB = Mid(strB, 2, Len(strB))
        End If
        If right(strB, 1) = ";" Then
            strB = left(strB, Len(strB) - 1)
        End If
        While InStr(strB, ";") > 0 = True
            i = InStr(strB, ";")
            myItem.Attachments.Add (left(strB, i - 1))
            strB = Trim(right(strB, Len(strB) - i))
        Wend
        myItem.Attachments.Add (strB)
    End If
    If strVorlage = "" Then
        If Len(glstrPS) > 0 Then
            strBody = strBody & "<br><br>" & glstrPS
        End If
        myItem.BodyFormat = olFormatHTML ' Access XP
        'suche im Lexikon, ob EMAIL-Anhang vorhanden ist
        strSQL = "Exec dbo.spa_Lexikon " & _
                " @x = 'Email-Anhang'," & _
                " @f = '" & strB & "'"
        OH_r r
        If Len(r!bemLexikon) > 10 Then
            strBody = strBody & "<br><br>" & r!bemLexikon
        End If
        If strAnrede <> "" Then
            strBody = strAnrede & "<br><br>" & strBody
        End If
        strBody = "<HTML><BODY><p style='font-family: " & glstrFontEmail & _
                    ";font-size: " & glstrFontSizeEmail & "pt'>" & strBody & "</p><\BODY><\HTML>"
        myItem.HTMLBody = strBody
        myItem.HTMLBody = myItem.HTMLBody + strSignatur
    End If
    strBody = myItem.HTMLBody
        'richtext in Access kann keine 11pt wie HVL will
    If InStr(strBody, "Calibri") > 0 Then
        strBody = Replace(strBody, "size=3", "font-size: 11pt")
    End If
'Ersetzungstexte
'ersetze z.B. <Anrede> oder <EmailAdresse>
    i = InStr(strBody, "<")
    N = InStr(strBody, ">")
    If N > i And i > 0 Then
        Select Case strForm
        Case "F_VG"
            i = f!NrVG
        Case "F_Adresse"
            i = lgFunktion
        End Select
        strSQL = "Exec dbo.spa_VG " & _
                " @x = 'OutlookVorlageReplace'" & _
                ", @i = " & i & _
                ", @f = '" & strForm & "'"
        OH_r r
        While r.EOF = False
            strBody = Replace(strBody, "&lt;" & Nz(r!txt, "") & "&gt;", Nz(r!txtV, ""))
            strBody = Replace(strBody, "%3c" & Nz(r!txt, "") & "%3e", Nz(r!txtV, ""))
        r.MoveNext
        Wend
    End If
    If strBody <> myItem.HTMLBody Then
        myItem.HTMLBody = strBody
    End If
    '180921 ALMATECHNIK
    If strAbsender = "" Then
        If glstrAbsender <> "" Then '[spI_User] Stichwort = '+Standard Email-Absender'
            strAbsender = glstrAbsender
        End If
    End If
    If strAbsender <> "" Then
        myItem.SentOnBehalfOfName = strAbsender
    End If
    Select Case lgSendMail    '2 nur display und in DMS speichern, 3 direkt versenden und in DMS speichern
    Case 2, 3
        OH_Mail_to_DMS 0, f!NrVG, 0, True, myItem
        strSQL = "Exec dbo.dms " & _
                " @x = 'SaveFiles'"
        OH_r r
        If r.BOF Then
            s = "Keine Files vorhanden!"
            GoTo ErrM
        Else
            OH_FileCopyMove r!nrID, "DMS", False
        End If
    End Select
    Select Case lgSendMail    '0 = nur Display, 1 = Direkt versenden, 2 nur display und in DMS speichern, 3 direkt versenden und in DMS speichern
    Case 1, 3
        myItem.send
    Case Else
        myItem.display
        myOlApp.ActiveWindow.WindowState = olMaximized '110206
        myItem.display
    End Select
    OH_OutlookMail = True
 '   MsgBox myItem.HTMLBody
    Set myolRecip = Nothing
    Set oB2B_Folder = Nothing
    Set myItem = Nothing
    Set rcps = Nothing
ErrEnd:
    DoCmd.Hourglass False
    strEmail = ""
    strSignatur = ""
    strCC = ""
    strBCC = ""
    OH_ResetRS r
    Exit Function
ErrMsg:
    Select Case Err
    Case 287
        s = "Email wurde abgebrochen! (Outlook muss vorher gestartet werden)"
    Case Else
       s = Err & " " & Err.Description
    End Select
        MsgBox s, vbCritical, "Outlook-Mail"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, strSubject
    OH_OutlookMail = False
    GoTo ErrEnd
End Function
Public Function OH_OutlookAppointment(strRecipient As String, _
                                       strSubject As String, _
                                       strStart As String, strEnd As String, _
                                       strBody As String, _
                                       strLocation As String, _
                                       Optional intDauer As Integer, _
                                       Optional bolErinnerung As Boolean, _
                                       Optional intErinnerungMinuten As Integer, _
                                       Optional strID As String) As Boolean

'im Outlook-Kalender eintragen
    On Error GoTo ErrMsg
    Dim myItem As Outlook.AppointmentItem
    Set myOlApp = New Outlook.Application
    Set myItem = myOlApp.CreateItem(olAppointmentItem)
    With myItem
        If InStr(strRecipient, "@") > 0 Then
            .MeetingStatus = olMeeting
            .recipients.Add (strRecipient)
            .recipients.ResolveAll
        End If
        .Subject = strSubject
        If IsDate(strStart) = True Then
            .Start = strStart    'strStart = Format(Me![Start-Datum], "dd.mm.yyyy") &" " & Format(Me![Start-Zeit], "hh:mm")
        Else
            .Start = Now
        End If
        If IsDate(strEnd) = True Then
            .End = strEnd
        Else
            .End = Now() + 2 / 24
        End If
        .body = strBody
        If strLocation = "" Then
            If InStr(strSubject, "teamviewer") > 0 Then
                strLocation = "TEAMVIEWER"
            End If
        End If
        .location = strLocation
        .display
        .duration = intDauer
        .ReminderSet = bolErinnerung
        .ReminderMinutesBeforeStart = intErinnerungMinuten
        .Mileage = strID
        .Save
    End With
    OH_OutlookAppointment = True
ErrEnd:
    Exit Function
ErrMsg:
    OH_OutlookAppointment = False
    MsgBox Err & " " & Err.Description, vbCritical, "Outlook-Kalender"
    Resume ErrEnd
End Function

Function OH_InitializeOutlook() As Boolean
    ' Diese Funktion wird verwendet, um die globalen Application- und
    ' NameSpace-Variablen zu initialisieren.
On Error GoTo ErrMsg
    Dim oInbox As Object
    Const ERR_APP_NOTRUNNING As Long = 429
    On Error Resume Next
' Handle Microsoft outlook
    Set myOlApp = GetObject(, "Outlook.Application")
    If Err = ERR_APP_NOTRUNNING Then
        Set myOlApp = CreateObject("Outlook.Application")
    End If
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI") ' Namespace-Objekt.
    OH_InitializeOutlook = True
    Set oInbox = gnspNameSpace.Folders(1) 'ohne das gibts einen Fehler!!120206
    Set oCalendar = gnspNameSpace.GetDefaultFolder(olFolderCalendar)

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 462
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Outlook-Start"
    End Select
        Resume ErrEnd
End Function
Function OH_SyncAddContactOutlook(ByVal lgOpen As Long, _
                                    Optional lgHow As Long = 0, _
                                    Optional strStart As String) As Long
    ' Diese Prozedur stellt sicher, dass die Informationen im
    ' aktuellen Datensatz des Formulars "Customers" noch nicht
    ' in der Outlook-Kontaktedatenbank gespeichert wurden.
    Dim fldContacts     As Outlook.MAPIFolder
    Dim fldCalendar     As Outlook.MAPIFolder
    Dim objContacts     As Object
    Dim objContact      As Object
    Dim intCntr         As Integer
    Dim objNewContact   As ContactItem
    Dim lgid            As Long
    Dim strN            As String
    Dim lgNew           As Long
    Dim lgOld           As Long
    Dim lgDel           As Long
    Dim objItems        As Outlook.ItemProperties
    Dim objItem         As Outlook.ItemProperty
    Dim N               As Long
    Dim strG            As String
    Dim lgct            As Long
    Dim lgG             As Long
    Dim lgNot           As Long
    Dim lgA             As Long
    Dim myLinks As Object
    Dim strLastKey As String, strNewKey As String
    Dim olNewFolder As Outlook.MAPIFolder
    Dim olTempItem As Object     'could be various item types
    Dim myItems As Outlook.Items 'a local copy of the collection
    Dim myCalendarItem As Outlook.Items 'a local copy of the collection
    ' Verweis auf den Outlook-Kontakteordner abrufen.
    If OH_InitializeOutlook = False Then
        GoTo ErrEnd
    End If
'Set myOlApp = New Outlook.Application
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI")
    Set fldContacts = gnspNameSpace.GetDefaultFolder(olFolderContacts)
    Set fldCalendar = gnspNameSpace.GetDefaultFolder(olFolderCalendar)

    Const ITEM_NOT_FOUND As Long = -2147352567
    Const OBJECT_NOT_FOUND As Long = -2147221233
    'On Error Resume Next
    DoCmd.Hourglass True
    OH_SyncAddContactOutlook = 0
    ' OH_InitializeOutlook-Prozedur zum Initialisieren globaler Application-
    ' und NameSpace-Objektvariablen verwenden, falls erforderlich.
    ' Zeiger auf Kontakteordner abrufen.
    Select Case lgHow
    Case 4 'ALLE
        s = "Adressen, deren letztes Update-Datum älter ist als x = 5 Jahre werden NICHT übernommen"
        i = Val(InputBox(s, t, 5))
        If i = 0 Then
            GoTo ErrEnd
        End If
        strStart = Format(DateAdd("yyyy", i * -1, Date), "YYYYMMDD")
    End Select
    strSQL = "Exec dbo.spa_Adresse " & _
        " @x = 'OutlookKontakt'" & _
        ", @u = " & lguser & _
        ", @z = " & lgHow & _
        ", @dt = '" & strStart & "'"
    OH_r r, , , , True
    i = 0
    Select Case lgHow
    Case 4 'ALLE
        For Each objContact In fldContacts.Items
            'Nur Adressen löschen, die von der DB angelegt wurden:
            If Nz(objContact.CustomerID, "") <> "" Then
                i = i + 1
                SysCmd acSysCmdSetStatus, i & "  lösche " & objContact.FullName
                objContact.Delete
            End If
        Next objContact
        lgDel = i
    End Select
    i = 0
    t = "Outlook-Abgleich"
    If r.BOF = False Then
        r.MoveLast
        lgct = r.RecordCount & ""
        SysCmd acSysCmdSetStatus, lgct & " Adresse(n) mit Outlook abgleichen"
        r.MoveFirst
        While r.EOF = False
            ' Ermitteln, ob die Informationen im aktuellen Datensatz bereits
            ' als Datensatz in dmyCalendarItemser Outlook-Kontaktedatenbank existieren.
            ' Informationen im aktuellen Datensatz zum Outlook-Ordner
            ' "Contacts" hinzufügen.
            If lgHow = 4 Then
                Set objNewContact = fldContacts.Items.Add
            Else
                Set objNewContact = fldContacts.Items.Find("[CustomerID] = " & r!NrFunktion)
                If TypeName(objNewContact) = "Nothing" Then
                    If Nz(r!EndeFunktion, 0) = 0 Then
                        If InStr(r!EMail, "@") > 0 Then
                            Set objNewContact = fldContacts.Items.Find("[Email1Address] = '" & Nz(r!EMail, "") & "'")
                            If TypeName(objNewContact) <> "Nothing" Then
                                s = r!EMail & vbNewLine & _
                                    objNewContact.FileAs & vbNewLine & vbNewLine & _
                                    "ist in Outlook bereits vorhanden" & vbNewLine & _
                                    "Soll diese Adresse abgeglichen werden?" & vbNewLine & vbNewLine & _
                                    "JA" & vbTab & objNewContact.FileAs & " abgleichen" & vbNewLine & _
                                    "NEIN" & vbTab & "neu erstellen"
                                lgA = MsgBox(s, vbQuestion + vbYesNoCancel, t) '230825 Dirk
                                Select Case lgA
                                Case vbCancel
                                    GoTo ErrEnd
                                Case vbNo
                                    GoTo oldmail
                                End Select
                            End If
                        End If
                        Set objNewContact = fldContacts.Items.Add
                        lgNew = lgNew + 1
                    Else
                        lgNot = lgNot + 1
                        GoTo nextrs
                    End If
                Else
oldmail:
                    lgOld = lgOld + 1
                End If
            End If
            With objNewContact
                s = r!a1Artadresse & " " & Nz(r!A1Vorname, "") & " " & Nz(r!a1nachname, "")
                DoEvents '160417
                SysCmd acSysCmdSetStatus, i & " von " & lgct & ": " & s
                lgG = 0
                If Nz(r!EndeFunktion, 0) > 0 Then
                    .Birthday = "1/1/4501"
                    objNewContact.Save
                    objNewContact.Delete
                    SysCmd acSysCmdSetStatus, i & " von " & lgct & " GELÖSCHT: " & s
                    lgDel = lgDel + 1
                Else
                    Select Case r!a1Artadresse
                    Case "Herr"
                        lgG = 2
                    Case "Frau"
                        lgG = 1
                    End Select
                    .FullName = s
                    .FirstName = Nz(r!A1Vorname, "")
                    .LastName = Nz(r!a1nachname, "")
                   ' Geburtstag entfernen
                    If r!InsertGebtag = "Nein" Or IsNull(r!A1Gebtag) = True Then
                        .Birthday = "1/1/4501"
                    Else
                        .Birthday = Format(r!A1Gebtag, "dd/mm/YYYY")
                    End If
                    If r!A2Nachname <> r!a1nachname Or r!a1Artadresse = "Firma" Then
                        .CompanyName = Nz(r!A2Nachname, "")
                        .JobTitle = Nz(r!Funktion, "")
                        .BusinessAddress = Nz(r!A2Postadr, "")
                        .BusinessAddressStreet = Nz(r!A2Strasse, "")
                        .BusinessAddressCity = Nz(r!A2Ort, "")
                        .BusinessAddressPostalCode = Nz(r!A2PLZStrasse, "")
                        .BusinessAddressCountry = Nz(r!A2Land, "")
                        .Department = Nz(r!Abteil, "")
                        If left(Nz(r!Telefon), 2) = "00" Then
                            .BusinessTelephoneNumber = "+" & Mid(r!Telefon, 3, 100)
                        Else
                            .BusinessTelephoneNumber = Nz(r!Telefon, "")
                        End If
                    Else
                        .CompanyName = ""
                    End If
                    .BusinessAddressPostOfficeBox = Nz(r!A2Postadr, "")
                    If Nz(r!Fax, "") <> "" Then
                        .BusinessFaxNumber = "Fax: " & Nz(r!Fax, "")
                    End If
                    .BusinessHomePage = HyperlinkPart(Nz(r!Internet, ""), acAddress)
                    .Email1Address = Nz(r!EMail, "")
                    .Email2Address = Nz(r!Email2Address, "")
                    .CustomerID = Nz(r!NrFunktion, "")
                    .Gender = lgG
                    .Initials = Nz(r!A1Kurzzeichen, "")
                    .HomeTelephoneNumber = Nz(r!telefonPrivat, "")
                    .MobileTelephoneNumber = Nz(r!Mobil, "")
                    .NickName = Nz(r!A1Rufname, "")
                    .Profession = Nz(r!A1Beruf, "")
                    .Suffix = Nz(r!A1Titel, "")
                    strN = Trim(Nz(r!a1nachname, "") & ", " & Nz(r!A1Vorname, ""))
                    If IsNull(r!A1Vorname) Then
                        strN = Nz(r!a1nachname, "")
                    Else
                        strN = Nz(r!a1nachname, "") & ", " & Nz(r!A1Vorname, "")
                    End If
                    If r!a1Artadresse <> "Firma" Then
                        If Nz(r!telefonPrivat, "") = "" Then
                            .HomeTelephoneNumber = Nz(r!Telefon, "")
                        Else
                            .HomeTelephoneNumber = r!telefonPrivat
                        End If
                        .HomeAddress = Nz(r!A1Postadr, "")
                        .HomeAddressStreet = Nz(r!A1Strasse, "")
                        .HomeAddressCity = Nz(r!A1Ort, "")
                        .HomeAddressPostalCode = Nz(r!A1PLZStrasse, "")
                        .HomeAddressCountry = Nz(r!A1Land, "")
                        .FileAs = strN
                    Else
                        .FileAs = strN & " (" & Nz(r!A2Nachname, "") & ")"
                    End If
                    Select Case left(.HomeTelephoneNumber, 1)
                    Case "0"
                        If left(.HomeTelephoneNumber, 2) <> "00" Then
                            .HomeTelephoneNumber = "+49" & Mid(.HomeTelephoneNumber, 2)
                        End If
                    End Select
                    .Save
                    i = i + 1
                End If
            End With
            OH_SyncAddContactOutlook = i
nextrs:
        r.MoveNext
        Wend
    End If
    If lgDel = 1 And lgct = 1 Then
        s = s & " wurde in Outlook gelöscht," & vbNewLine & _
            "da die Adresse inaktiv gesetzt ist."
        MsgBox s, vbInformation, "Abgleich Outlook"
    Else
        If lgOpen = vbYes Then
            objNewContact.display
        Else
            s = "Adressen aus DB und Kontakte in Outlook sind" & vbNewLine & vbNewLine & _
                   "abgeglichen (" & lgOld & ")" & vbNewLine & _
                   "gelöscht (" & lgDel & ")" & vbNewLine & _
                   "nicht erfasst, da inaktiv (" & lgNot & ")" & vbNewLine & _
                   "neu erstellt (" & lgNew & ")"
            If strStart <> "" Then
                s = s & vbNewLine & _
                    "(Seit Ihrem letzten Abgleich am " & Format(strStart, "0000-00-00") & ")"
            End If
            OH_msgbox s, _
                   Array("o.k."), _
                   vbInformation, _
                   "Adressen von DB nach Outlook (" & i & ")", _
                   "Es werden nur solche Adressen übertragen, deren Funktion noch nicht beendet ist!" & vbNewLine & _
                   "Adressen mit Ende-Datum werden gelöscht!!"
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    SysCmd acSysCmdRemoveMeter
    Set gnspNameSpace = Nothing
    Set myOlApp = Nothing
    OH_ResetRS r
    Exit Function
ErrMsg:
    If Err = 91 Then
        MsgBox "Diese Prozedur ist nicht verfügbar, wenn offline gearbeitet wird."
    Else
        MsgBox Err.Description
    End If
    OH_SyncAddContactOutlook = False
    DoCmd.Hourglass False
    Resume ErrEnd
End Function
Function OH_SyncContactOutlook(lgid As Long, _
                                Optional strEmail As String, _
                                Optional lgArt As Long = 30) As Long
On Error GoTo ErrMsg
    ' Diese Prozedur stellt sicher, dass in CustomerID die "NrFunktion"
    ' in der Outlook-Kontaktedatenbank eingetragen wird für die EntryID = strf.
    Dim fldContacts     As Outlook.MAPIFolder
    Dim objContact      As Object
    ' Verweis auf den Outlook-Kontakteordner abrufen.
    Set myOlApp = New Outlook.Application
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI")
    Set fldContacts = gnspNameSpace.GetDefaultFolder(olFolderContacts)
    DoCmd.Hourglass True
    OH_SyncContactOutlook = 0
    Set objContact = fldContacts.Items.Find("[CustomerID] = " & lgid)
    If TypeName(objContact) = "Nothing" And strEmail <> "" Then
        Set objContact = fldContacts.Items.Find("[Email1Address] = '" & strEmail & "'") '<R77>
    End If
    If TypeName(objContact) <> "Nothing" Then
        Select Case lgArt
        Case 30
            If Len(objContact.CustomerID) = 0 Then
                objContact.CustomerID = lgid
                objContact.Save
                OH_SyncContactOutlook = 1
            End If
        Case 35
            objContact.Delete
            OH_SyncContactOutlook = 1
        End Select
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Customer ID eintragen, OH_SyncContactOutlook"
        Resume ErrEnd
    End Select
End Function
Public Function OH_OpenOutlookFolder(strE As String, _
                                     Optional strArt As String, _
                                     Optional blAnzeige As Boolean) As String
'Beispiel für strE: Philipp\Postordner\Kunde\XYZ
On Error GoTo ErrMsg
    Dim strFO() As String
    Dim N As Long
    Dim i1 As Long
    'Outlook Ordner werden in Ihrer Hierarchie übergeben.
    'Der "tiefste" Ordner wird angezeigt
    If OH_InitializeOutlook = True Then
        If strArt <> "Firma" Then
            strE = gnspNameSpace.GetDefaultFolder(olFolderInbox).Parent & "\" & strE
        End If
    Else
        GoTo ErrMsg
    End If
    N = 0
    i1 = 1
    For i = 1 To Len(strE)
        If Mid(strE, i, 1) Like "\" Then
            N = N + 1
            ReDim Preserve strFO(N) As String
            strFO(N) = Mid(strE, i1, i - i1)
            i1 = i + 1
        End If
    Next i
    If i > i1 Then
        N = N + 1
        ReDim Preserve strFO(N) As String
        strFO(N) = Mid(strE, i1, i - i1)
    End If
    Set myobjFolder = gnspNameSpace.Folders.Item(strFO(1))
    Set myParentFolder = myobjFolder
    For i = 2 To N
        Set myobjFolder = myobjFolder.Folders.Item(strFO(i))
        Set myParentFolder = myobjFolder
    Next i
    myobjFolder.display
    OH_OpenOutlookFolder = myobjFolder.Name
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Is <> 0
        If blAnzeige Then
            OH_OpenOutlookFolder = "Outlook-Ordner fehlt"
        Else
            OH_AddFolder strFO(N), myParentFolder, strE
        End If
    Case Else
        MsgBox strFO(N) & vbNewLine & _
               Err & " " & Err.Description, vbCritical, "Öffne Outlook Folder"
        Resume ErrEnd
    End Select
End Function
Public Function OH_AddFolder(strNewFolderName As String, _
                             objParentFolder As Outlook.MAPIFolder, _
                             Optional strParent As String) As Outlook.MAPIFolder
  ' Comments  : Adds a new folder
  ' Parameters: strNewFolderName - name of the folder to add.
  '           : objParenFolder - is specified the folder is added under the
  '           : folder object which is passed.
  ' Returns   : A Reference to the New Folder
On Error GoTo ErrMsg
    x = OH_msgbox(strNewFolderName & vbNewLine & vbNewLine & _
            "als neuen Ordner in Outlook" & vbNewLine & _
             strParent & " anlegen?", _
             Array("Ordner <" & strNewFolderName & "> anlegen", "Ordner <" & objParentFolder.Name & "> öffnen"), _
              vbQuestion, "Erstelle Outlook Folder")
    Select Case Val(x)
    Case 1
        Set OH_AddFolder = objParentFolder.Folders.Add(strNewFolderName)
        OH_AddFolder.display
    Case 2
        strNewFolderName = vbNullString
        objParentFolder.display
    Case 3
        strNewFolderName = vbNullString
        objParentFolder.display
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Erstelle Outlook Folder"
    Resume ErrEnd
End Function
Function OH_DialOutlookContact(lgid As Long, _
                               Optional strNr As String, _
                               Optional strName As String) As Long
On Error GoTo ErrMsg
    Dim fldContacts     As Outlook.MAPIFolder
    Dim objContact   As ContactItem
    DoCmd.Hourglass True
    ' Verweis auf den Outlook-Kontakteordner abrufen.
    Set myOlApp = New Outlook.Application
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI")
    Set fldContacts = gnspNameSpace.GetDefaultFolder(olFolderContacts)
' Zeiger auf Kontakteordner abrufen.
    Set objContact = fldContacts.Items.Find("[CustomerID] = " & lgid)
'Falls Kontakt noch nicht angelegt ==> zuerst in Outlook anlegen
    If TypeName(objContact) = "Nothing" Then
        OH_ResetID
        OH_InsertID lgid
        OH_SyncAddContactOutlook vbNo
        OH_DialOutlookContact lgid, strNr
    Else
'Telefonie über Outlook-Fenster
        'objContact.Display
        gnspNameSpace.Dial objContact
        If strNr <> "" Then
            OH_CB strNr
        End If
        objContact.Close olDiscard
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_DialOutlookContact"
    Resume ErrEnd
End Function

Function OH_ContactOutlook(lgC As Long) As Long
On Error GoTo ErrMsg

    ' Diese Prozedur stellt sicher, dass die Informationen im
    ' aktuellen Datensatz des Formulars "Customers" noch nicht
    ' in der Outlook-Kontaktedatenbank gespeichert wurden.
    Dim fldContacts     As Outlook.MAPIFolder
    Dim objContacts     As Object
    Dim objContact      As ContactItem
    Dim myItems         As Outlook.Items
    Dim lgid            As Long
    Dim strN            As String
    ' Verweis auf den Outlook-Kontakteordner abrufen.
    Set myOlApp = New Outlook.Application
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI")
    Set fldContacts = gnspNameSpace.GetDefaultFolder(olFolderContacts)
    DoCmd.Hourglass True
    OH_ContactOutlook = 0
    ' OH_InitializeOutlook-Prozedur zum Initialisieren globaler Application-
    ' und NameSpace-Objektvariablen verwenden, falls erforderlich.
    If myOlApp Is Nothing Then
        If OH_InitializeOutlook = False Then
            MsgBox "Application- oder NameSpace-Objektvariablen" _
                & "von Outlook können nicht initialisiert werden."
            Exit Function
        End If
    End If
    ' Zeiger auf Kontakteordner abrufen.
    SysCmd acSysCmdSetStatus, "Adressen mit Outlook abgleichen"
    OH_ResetID
    Set myItems = fldContacts.Items
   ' myItems.Sort "[LastModificationTime]", True
    myItems.Sort "[CreationTime]", True
    If myItems.count < lgC Then
        lgC = myItems.count
    End If
    For i = 1 To lgC
        If myItems(i).Class = 40 Then
            Set objContact = myItems(i)
            With objContact
                s = .FullName & " " & .LastModificationTime
                SysCmd acSysCmdSetStatus, i & ": " & s
                strN = _
                 Replace(.FullName, "'", "´") & "|" & _
                 .EntryID & "|" & _
                 .CustomerID & "|" & _
                 Replace(.FirstName, "'", "´") & "|" & _
                 Replace(.LastName, "'", "´") & "|" & _
                .Gender & "|" & _
                 Replace(.CompanyName, "'", "´") & "|" & _
                .JobTitle & "|" & _
                .BusinessAddress & "|" & _
                .BusinessAddressStreet & "|" & _
                .BusinessAddressCity & "|" & _
                .BusinessAddressPostalCode & "|" & _
                .BusinessAddressCountry & "|" & _
                .BusinessTelephoneNumber & "|" & _
                .BusinessAddressPostOfficeBox & "|" & _
                .BusinessFaxNumber & "|" & _
                .BusinessHomePage & "|" & _
                .Department & "|" & _
                .Email1Address & "|" & _
                .Email2Address & "|" & _
                .Initials & "|" & _
                .HomeTelephoneNumber & "|" & _
                .MobileTelephoneNumber & "|" & _
                .NickName & "|"
                strN = strN & _
                .Profession & "|" & _
                .CreationTime
                strSQL = "spA_Adresse " & _
                        " @x = 'InsertContactOutlook'," & _
                        " @i = " & i & "," & _
                        " @d = '" & OH_RPL(strN) & "'"
                OH_EX
                s = i - 1 & ": Anzahl eingelesener Adressen"
            End With
        End If
    Next i
    objContact.Close olDiscard
    Set objContact = Nothing
    Set gnspNameSpace = Nothing
    Set myOlApp = Nothing
    OH_ContactOutlook = i
    SysCmd acSysCmdSetStatus, s

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_ContactOutlook"
    Resume ErrEnd
End Function

Public Function OH_GMAIL(strGmailNr As String, _
                                 strSubject As String, _
                                 strBody As String, _
                                 strSignatur As String, _
                                 Optional strBeilage As String, _
                                 Optional strCC As String, _
                                 Optional strBCC As String) As Boolean
On Error GoTo ErrMsg
'Verweis auf "Microsoft CDO for Windows 2000 Library"
'Voraussetzung:
'User hat ein GMAIL-Konto, Mailadresse und Passwort stehen untereinander in EINEM Stichwort!
Dim mail As New message
Dim cfg As Configuration
Dim strSender As String
Dim strPW As String
    DoCmd.Hourglass True
    strSQL = "Exec dbo.spa_Adresse " & _
        " @x = 'getGMAILInfo'" & _
        ",@i = " & lguser
    OH_r r
    If r.BOF Then
        s = "Keine GMAIL-Infos als Stichworte zu aktuellem User!"
        GoTo ErrM
    End If
    i = 0
    While Not r.EOF
        If InStr(r!data, "@") > 1 Then
            If i = 0 Then
                strSender = r!data
                i = i + 1
            End If
        Else
            strPW = r!data
        End If
    r.MoveNext
    Wend
    Set cfg = mail.Configuration
    cfg(cdoSendUsingMethod) = cdoSendUsingPort
    cfg(cdoSMTPServer) = "smtp.gmail.com"
    cfg(cdoSMTPServerPort) = 25
    cfg(cdoSMTPAuthenticate) = cdoBasic
    cfg(cdoSMTPUseSSL) = True
    cfg(cdoSendUserName) = strSender
    cfg(cdoSendPassword) = strPW
    cfg.Fields.Update
    mail.To = strGmailNr
    mail.From = cfg(cdoSendUserName)
    mail.Subject = "strSubject"
    mail.HTMLBody = strBody
    mail.AddAttachment strBeilage
    mail.send
    MsgBox "Mail ist gesendet an " & strGmailNr, vbInformation, "GMAIL"
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
       s = Err & " " & Err.Description
    End Select
        MsgBox s, vbCritical, "GMAIL-Mail"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, strSubject
    OH_GMAIL = False
    GoTo ErrEnd
End Function

Public Sub OH_FindFolder()
On Error GoTo ErrMsg

Dim Folders As Outlook.Folders
    DoCmd.Hourglass True
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    Set myParentFolder = Nothing
    t = "Search Outlook Folder"
    s = "Funktioniert nur, wenn Outlook bereits geöffnet ist!" & vbNewLine & _
        "Bitte gesuchten Ordnername eingeben:"
    s = InputBox(s, t)
    If Len(Trim$(s)) = 0 Then
        GoTo ErrEnd
    End If
    s = LCase$(s)
    s = Replace(s, "%", "*")
    Set Folders = myOlApp.Session.Folders
    OH_LoopFolders Folders
    If Not myParentFolder Is Nothing Then
        s = "Funktioniert nur, wenn Outlook bereits geöffnet ist!" & vbNewLine & _
            "Ordner anzeigen: " & vbCrLf & myParentFolder.folderPath
        If MsgBox(s, vbQuestion + vbYesNo, t) = vbYes Then
            Set myOlApp.ActiveExplorer.CurrentFolder = myParentFolder
            myParentFolder.display
            myOlApp.ActiveWindow.WindowState = olMaximized '110206
        End If
    Else
        s = s & vbNewLine & _
        "Ordner nicht gefunden"
        GoTo ErrM
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 91
        s = "Outlook vorher öffnen!"
    Case Else
        s = Err & " " & Err.Description
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub

Private Sub OH_LoopFolders(Folders As Outlook.Folders)

Dim f As Outlook.MAPIFolder
Dim found As Boolean

    For Each f In Folders
        SysCmd acSysCmdSetStatus, f.folderPath
        If InStr(s, "*") > 0 Then
            found = (LCase$(f.Name) Like s)
        Else
            found = (LCase$(f.Name) = s)
        End If

        If found Then
            Set myParentFolder = f
            Exit For
        Else
            OH_LoopFolders f.Folders
            If Not myParentFolder Is Nothing Then
                Exit For
            End If
        End If
    Next
End Sub

Sub ImportContactsFromOutlook()
On Error GoTo ErrMsg

   ' This code is based in Microsoft Access.

   ' Set up DAO objects (uses existing "tblContacts" table)
    DoCmd.Hourglass True
    strSQL = "Select * from T_ID"
    OH_r r


   ' Set up Outlook objects.
   Dim ol As New Outlook.Application
   Dim olNs As Outlook.Namespace
   Dim cf As Outlook.MAPIFolder
   Dim c As Outlook.MailItem
   Dim objItems As Outlook.Items
   Dim Prop As Outlook.UserProperty

   Set olNs = ol.GetNamespace("MAPI")
   '--- (5) --- VBA code to allow me to pick a folder. Option would allow for future     flexability.
   Set cf = olNs.GetDefaultFolder(olPublicFoldersAllPublicFolders)
   '--- (1) --- Need recursive VBA code to import emails located in all subfolders.
   Set objItems = cf.Items
   i = objItems.count
   If i <> 0 Then
      For i = 1 To i
         If TypeName(objItems(i)) = "MailItem" Then
            Set c = objItems(i)
            r.AddNew
            r!idt1 = c.EntryID
       '     r!ConversationID = c.ConversationID
            r!IDT2 = c.sender
            r!IDT3 = c.SenderName
'            r!SentOn = c.SentOn
'            r!To = c.To
'            r!CC = c.CC
'            r!BCC = c.BCC
            r!IDT4 = c.Subject
'            r!Attachments = c.Attachments.Count
            '--- (3) --- Need VBA code to insert the file name of any user attached     documents. ".Count" is used to avoid error and can be replaced.
            r!Idt5 = left(c.body, 150)
            r!Idt5 = left(c.HTMLBody, 150)
'            r!Importance = c.Importance
'            r!Size = c.Size
'            r!CreationTime = c.CreationTime
'            r!ReceivedTime = c.ReceivedTime
'            r!ExpiryTime = c.ExpiryTime
            '--- (2) --- Need VBA code to insert the Folder name where the email is     located into Access Database. Folder Path is not necessary.
            r.Update
         End If
      Next i
      MsgBox "Finished."
   Else
      MsgBox "No e-mails to export."
   End If
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    Select Case Err
    Case 91
        s = "Outlook vorher öffnen!"
    Case Else
        s = Err & " " & Err.Description
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Sub
Sub ImportMailPropFromOutlook()

    ' Code for specifing top level folder and initializing routine.

    ' Set up Outlook objects.
    Dim ol As New Outlook.Application
    Dim olNs As Outlook.Namespace
    Dim ofo As Outlook.MAPIFolder
    Dim ofSubO As Outlook.MAPIFolder
    Dim objItems As Outlook.Items

    Set olNs = ol.GetNamespace("MAPI")
    Set ofo = olNs.GetDefaultFolder(olFolderInbox) '--- Specifies top level folder for     importing Oultook mail.
    Set ofo = olNs.PickFolder '--- Allows user to select top level folder for importing     Outlook mail.
    OH_ResetID
    'Set info and call GetMailProp code.
    Set objItems = ofo.Items
    GetMailProp objItems, ofo

    'Set info and call ProcessSubFolders.
    For Each ofSubO In ofo.Folders
        Set objItems = ofSubO.Items
        ProcessSubFolders objItems, ofSubO
    Next

End Sub
Sub GetMailProp(objProp As Outlook.Items, ofProp As Outlook.MAPIFolder)
On Error Resume Next
    ' Code for writeing Outlook mail properties to Access.

    ' Set up DAO objects (uses existing Access "Email" table).
    DoCmd.Hourglass True
    strSQL = "Select * from T_ID"
    OH_r r, , 3

    'Set Up Outlook objects.
    Dim cMail As Outlook.MailItem
    Dim cAtch As Outlook.Attachments

    'Write Outlook mail properties to Access "Email" table.
    Y = objProp.count
    If Y <> 0 Then
        For i = 1 To Y
            If TypeName(objProp(i)) = "MailItem" Then
                Set cMail = objProp(i)
                SysCmd acSysCmdSetStatus, ofProp.Name & " " & i
 '               If ([rst]![EmailLocation] <> ofProp.Name) And ([rst]![EntryID] <> cMail.EntryID) Then
                    r.AddNew
                    r!idt1 = cMail.EntryID
               '     r!ConversationID = cmail.ConversationID
                    r!IDT2 = cMail.sender
                    r!IDT3 = cMail.SenderEmailAddress
        '            r!SentOn = cmail.SentOn
        '            r!To = cmail.To
        '            r!CC = cmail.CC
        '            r!BCC = cmail.BCC
                    r!IDT4 = left(cMail.Subject, 100)
        '            r!Attachments = cmail.Attachments.Count
                    '--- (3) --- Need VBA code to insert the file name of any user attached     documents. ".Count" is used to avoid error and can be replaced.
                    r!Idt5 = left(cMail.body, 150)
                    r!idt6 = left(cMail.HTMLBody, 150)
        '            r!Importance = cmail.Importance
        '            r!Size = cmail.Size
        '            r!CreationTime = cmail.CreationTime
        '            r!ReceivedTime = cmail.ReceivedTime
        '            r!ExpiryTime = cmail.ExpiryTime
                    '--- (2) --- Need VBA code to insert the Folder name where the email is     located into Access Database. Folder Path is not necessary.
                    r.Update
'                End If
            End If
        Next i
    End If

End Sub

Sub ProcessSubFolders(objItemsR As Outlook.Items, OfR As Outlook.MAPIFolder)

    'Code for processing subfolders

    ' Set up Outlook objects.
    Dim ofSubR As Outlook.MAPIFolder

    'Set info and call GetMailProp code.
    GetMailProp objItemsR, OfR

    'Set info and call ProcessSubFolders. Recursive.
    For Each ofSubR In OfR.Folders
        Set objItemsR = ofSubR.Items
        ProcessSubFolders objItemsR, ofSubR
    Next

End Sub



' VBA Script to get list of All Emails
' Use Tools->Macro->Security to allow Macros to run, then restart Outlook
' Run Outlook, Press Alt+F11 to open VBA
' Programming by Greg Thatcher, http://www.GregThatcher.com
' Uses new "Table" Object (available in Outlook 2007 and later -- won't work in Outlook 2003)
Public Sub GetListOfEmails()
    On Error GoTo On_Error

    Dim Session As Outlook.Namespace
    Dim Report As String
    Dim Folders As Outlook.Folders
    Dim Folder As Outlook.Folder
    Dim reply As Integer
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If

    Set Session = myOlApp.Session

    reply = MsgBox(prompt:="This could take a VERY long time, and you won't be able to use Outlook while it runs -- are you sure you want to list all emails from all folders?", _
            Buttons:=vbYesNoCancel, Title:="Run Long Macro")
    If reply = vbYes Then
        Set Folders = Session.Folders
        ' Call RecurseFolders(Folders(1), vbTab, Report)
        For Each Folder In Folders
            Call RecurseFolders(Folder, vbTab, Report)
            Report = Report & "---------------------------------------------------------------------------" & vbCrLf
        Next
    Else
        reply = MsgBox(prompt:="Would you like to just list all emails from your Inbox?", _
            Buttons:=vbYesNoCancel, Title:="Run Long Macro")
        If reply = vbYes Then
            Call RecurseFolders(Session.GetDefaultFolder(olFolderInbox), vbTab, Report)
        Else
            Exit Sub
        End If

    End If

    Dim retValue As Boolean
    retValue = CreateReportAsEmail("List of Emails", Report)

Exiting:
        Set Session = Nothing
        Exit Sub
On_Error:
    MsgBox "error=" & Err.number & " " & Err.Description
    Resume Exiting

End Sub


Private Sub RecurseFolders(CurrentFolder As Outlook.Folder, Tabs, Report As String)
    Dim Table As Outlook.Table
    Dim Row As Outlook.Row
    Dim rowValues() As Variant
    Dim SubFolders As Outlook.Folders
    Dim subfolder As Outlook.Folder

    Report = Report & "Folder Name: " & CurrentFolder.Name & " (Store: " & CurrentFolder.Store.DisplayName & ")" & vbCrLf

    Set Table = CurrentFolder.GetTable
    Do While Table.EndOfTable = False
        Set Row = Table.GetNextRow
        rowValues = Row.GetValues
        Report = Report & Tabs
        Report = Report & "Subject: " & rowValues(1)
        Report = Report & vbTab & "MessageClass: " & rowValues(4)
        ' Report = Report & vbTab & "Creation Time: " & rowValues(2)
        Report = Report & vbTab & "Last Modification Time: " & rowValues(3)
        'Report = Report & vbTab & "EntryID: " & rowValues(0)
        Report = Report & vbCrLf
    Loop

    Set SubFolders = CurrentFolder.Folders
    For Each subfolder In SubFolders
        Call RecurseFolders(subfolder, Tabs & vbTab, Report)
    Next subfolder

End Sub

' VBA Function which displays a report inside an email
Public Function CreateReportAsEmail(Title As String, Report As String)
    On Error GoTo On_Error

    Dim Session As Outlook.Namespace
    Dim mail As MailItem
    Dim MyAddress As AddressEntry
    Dim Inbox As Outlook.Folder

    CreateReportAsEmail = True

    Set Session = myOlApp.Session
    Set Inbox = Session.GetDefaultFolder(olFolderInbox)
    Set mail = Inbox.Items.Add("IPM.Mail")

    Set MyAddress = Session.currentUser.AddressEntry
    mail.recipients.Add (MyAddress.Address)
    mail.recipients.ResolveAll

    mail.Subject = Title
    mail.body = Report

    mail.Save
    mail.display


Exiting:
        Set Session = Nothing
        Exit Function
On_Error:
    CreateReportAsEmail = False
    MsgBox "error=" & Err.number & " " & Err.Description
    Resume Exiting

End Function
Function OH_DeleteAppointment(strID As String) As Boolean
On Error GoTo ErrMsg
    Dim oItems As Outlook.Items
    Dim oResItems As Outlook.Items
    Dim oAppt As Outlook.AppointmentItem
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    Set oItems = oCalendar.Items
    oItems.IncludeRecurrences = True
    strlink = "[Mileage] = '" & strID & "'"
    'Restrict the Items collection
    Set oResItems = oItems.Restrict(strlink)
    For Each oAppt In oResItems
        oAppt.Delete
        OH_DeleteAppointment = True
    Next
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "mdl_DB.OH_DeleteAppointment"
Resume ErrEnd
End Function
Function OH_FindAppointment(strID As String) As Boolean
On Error GoTo ErrMsg
    Dim oItems As Outlook.Items
    Dim oResItems As Outlook.Items
    Dim oAppt As Outlook.AppointmentItem
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    Set oItems = oCalendar.Items
    oItems.IncludeRecurrences = True
    strlink = "[Mileage] = '" & strID & "'"
    'Restrict the Items collection
    Set oResItems = oItems.Restrict(strlink)
    For Each oAppt In oResItems
        oAppt.display
        OH_FindAppointment = True
    Next
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "mdl_DB.OH_FindAppointment"
Resume ErrEnd
End Function
Public Function OH_Outlook(Optional blAnzeige As Boolean) As String ' öffnet Explorer mit der entsprechenden Firma
                              ' Pfad muss in Stichworten mit "Explorer" abgelegt sein
On Error GoTo ErrMsg
    Dim strclientO As String
    Dim strE As String
    Dim strArt As String
    Dim rsO As ADODB.Recordset
    OH_Outlook = ""
    strSQL = "EXEC spA_Lexikon @x = 'Outlook Ablage'"
    OH_r rsO
    If rsO.BOF = True Then
        MsgBox "Grundlegende Einstellung: Im Lexikon fehlt der Eintrag des übergeordneten Firmenordners!", _
                vbCritical, "Outlook-Ordner"
    Else
        strArt = rsO!Art
        strE = OH_StichwortExplorer("Outlook", , , blAnzeige)
        Select Case strE
        Case ""
            GoTo ErrEnd
        Case "XX"
            strE = rsO!Folder
        Case Else
            strE = rsO!Folder & strE
        End Select
    End If
    OH_Outlook = OH_OpenOutlookFolder(strE, strArt, blAnzeige)
    OH_ResetRS rsO
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "mdl_DB.OH_Outlook"
Resume ErrEnd
End Function
Public Function OH_Gelangensbestätigung(strTO As String, _
                                        strAb As String, _
                                        strURL As String, _
                                        strLanguage As String, _
                                        Optional strOutlookFolder As String, _
                                        Optional lgSendMail As Long = 0) As Boolean '<R206>
On Error GoTo ErrMsg
    Dim frmP As Form
    Dim strE As String
    Dim strf As String
    Dim strSubject As String
    Dim strSignatur As String
    Dim strAnrede As String
    Dim strBody As String
    Dim strRpt As String
    Set frmP = Forms!F_VG
    strE = "Gelangensbestätigung WEB"
    t = strE
    strSQL = "EXEC spA_Adresse " & _
            " @x = 'Standardtext' " & _
             ",@f = '" & strE & "'" & _
             ",@s = '" & strLanguage & "'"
    OH_r r
    strBody = lg(frmP!QK) & " " & frmP!VGNr & " " & lg("vom") & " " & Format(frmP!VGdatum, "dd.mm.yyyy")
    If Not r.BOF Then
        strBody = strBody & "<br><br>" & _
            lg(r!Beschreibung)
    End If
    strAnrede = Nz(r!FormName, "")
    strBody = Replace(Replace(strBody, Chr(13) + Chr(10), "<br>"), "URL", strURL) '<R21> Zeilenumbruch switchen!
    strSQL = "EXEC spa_VG" & _
            " @x = 'Check_ec_po' " & _
            ",@i = " & frmP!NrVG
    OH_r rx
    ' Zusammensetzen der Betreffzeile mit Bestellnummer (PO), falls rx!txtV nicht leer ist, d.h. die Bestellnummer im Text mit Ihre Bestellung ausgefuellt ist
    strSubject = lg(strE) & " " & frmP!projektNr & " " & frmP!VG & IIf(Nz(rx!txtV, "") <> "", " - PO " & rx!txtV, "")
    OH_Gelangensbestätigung = OH_OutlookMail( _
        strTO, _
         strSubject, _
         strBody, _
         0, _
        , , _
        lgSendMail, _
        , , _
        frmP, _
        strAb, _
        strAnrede, _
        "") '190227, 251117
    OH_ResetID
ErrEnd:
    OH_ResetRS r
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 91
        s = "Outlook vorher öffnen!"
    Case Else
        s = Err & " " & Err.Description
    End Select
    MsgBox s, vbCritical, t
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function

Public Function OH_PickOutlookFolder() As String
Dim f As Outlook.Folder
    Dim strP As String
     Dim folderObj As Outlook.Folder
    Dim rootfolderObj As Outlook.Folder
    Dim newfolderObj As Outlook.Folder
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    Set f = myOlApp.Session.PickFolder

    OH_PickOutlookFolder = f.folderPath
    OH_OpenOutlookFolder f.folderPath
    MsgBox f.folderPath
Set f = Nothing
End Function

Function OH_MailItemByEntryID(strEntryID As String) As Long
On Error GoTo ErrMsg

    ' Diese Prozedur stellt sicher, dass die Informationen im
    ' aktuellen Datensatz des Formulars "Customers" noch nicht
    ' in der Outlook-Kontaktedatenbank gespeichert wurden.
    Dim myItems         As Outlook.Items
    ' Verweis auf den Outlook-Kontakteordner abrufen.
    Set myOlApp = New Outlook.Application
    Set gnspNameSpace = myOlApp.GetNamespace("MAPI")
    If myOlApp Is Nothing Then
        If OH_InitializeOutlook = False Then
            MsgBox "Application- oder NameSpace-Objektvariablen" _
                & "von Outlook können nicht initialisiert werden."
            Exit Function
        End If
    End If
    myItems = gnspNameSpace.GetItemFromID(strEntryID, "")
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MailItemByEntryID"
    Resume ErrEnd
End Function

Public Sub ImportFirmenAusOutlook()
    Dim olApp As Object        ' Outlook.Application
    Dim olNamespace As Object  ' Outlook.Namespace
    Dim olFolder As Object     ' Outlook.MAPIFolder
    Dim olContact As Object    ' Outlook.ContactItem
    Dim olItems As Object
    Dim objField As Object
    Dim olAccounts As Object   ' Outlook.Accounts
    Dim olAccount As Object    ' Outlook.Account
    Dim strFieldName As String
    Dim varFieldValue As String
    Dim importCount As Long
    Dim i As Integer
    Dim accountName As String
    Dim desiredFields As Object
    Dim results As ImportResults

    ' Initialize results
    results.NewCompanies = 0
    results.NewPersons = 0
    results.ExistingCompanies = 0
    results.ExistingPersons = 0

     ' Dictionary mit gewünschten Feldern erstellen
    Set desiredFields = CreateObject("Scripting.Dictionary")

    ' Hier die gewünschten Felder definieren
    With desiredFields
        .Add "Birthday", "Geburtstag"
        .Add "BusinessAddressCity", "Geschäftsort"
        .Add "BusinessAddressCountry", "Geschäftsland"
        .Add "BusinessAddressPostalCode", "Geschäfts-PLZ"
        .Add "BusinessAddressStreet", "Geschäftsstraße"
        .Add "BusinessFaxNumber", "Faxnummer"
        .Add "BusinessHomepage", "Homepage"
        .Add "BusinessTelephoneNumber", "Geschäftstelefon"
        .Add "CompanyName", "Firma"
        .Add "Department", "Abteilung"
        .Add "Email1Address", "E-Mail 1"
        .Add "Email2Address", "E-Mail 2"
        .Add "FirstName", "Vorname"
        .Add "Gender", "Geschlecht"
        .Add "HomeAddressCity", "Privatort"
        .Add "HomeAddressCountry", "Privatland"
        .Add "HomeAddressPostalCode", "Privat-PLZ"
        .Add "HomeAddressStreet", "Privatstraße"
        .Add "HomeTelephoneNumber", "Privat Telefon"
        .Add "JobTitle", "Position"
        .Add "LastName", "Nachname"
        .Add "MobileTelephoneNumber", "Mobiltelefon"
        .Add "NickName", "Rufname"
        .Add "Notes", "Bemerkungen"
        .Add "OfficeLocation", "Büro"
        .Add "Profession", "Beruf"
        .Add "Suffix", "Titel"
    End With

    ' Outlook-Instanz erstellen
    On Error Resume Next
    Set olApp = GetObject(, "Outlook.Application")
    If olApp Is Nothing Then
        Set olApp = CreateObject("Outlook.Application")
    End If
    On Error GoTo 0

    If olApp Is Nothing Then
        MsgBox "Outlook konnte nicht geöffnet werden.", vbCritical
        Exit Sub
    End If

    ' Get all accounts
    Set olAccounts = olApp.Session.Accounts

    ' Create account selection form
    If olAccounts.count = 0 Then
        MsgBox "Keine Outlook-Konten gefunden.", vbExclamation
        GoTo CleanUp
    ElseIf olAccounts.count = 1 Then
        accountName = olAccounts.Item(1).DisplayName
    Else
        ' Build account list for selection
        Dim accountList As String
        For Each olAccount In olAccounts
            accountList = accountList & olAccount.DisplayName & "|"
        Next
        accountList = left(accountList, Len(accountList) - 1) ' Remove last pipe

        ' Show input box with account list
        accountName = InputBox("Bitte wählen Sie ein Konto:" & vbCrLf & _
                             "Verfügbare Konten:" & vbCrLf & Replace(accountList, "|", vbCrLf), _
                             "Kontoauswahl")

        If accountName = "" Then
            MsgBox "Keine Kontoauswahl getroffen.", vbExclamation
            GoTo CleanUp
        End If
    End If

    ' Find selected account
    Dim selectedAccount As Object
    Set selectedAccount = Nothing
    For Each olAccount In olAccounts
        If olAccount.DisplayName = accountName Then
            Set selectedAccount = olAccount
            Exit For
        End If
    Next

    If selectedAccount Is Nothing Then
        MsgBox "Das ausgewählte Konto wurde nicht gefunden.", vbExclamation
        GoTo CleanUp
    End If

    ' Get namespace for selected account
    Set olNamespace = olApp.GetNamespace("MAPI")

    ' Get contacts folder for selected account
    Set olFolder = olNamespace.GetDefaultFolder(10)  ' 10 = olFolderContacts
    Set olItems = olFolder.Items

    importCount = 0
    i = 0

    ' Process contacts
    For Each olContact In olItems
        If i >= 1 Then Exit For  ' Nur der 1. Kontakt zum Testen

        OH_ResetID

        ' Standardfelder durchlaufen
        For Each objField In olContact.ItemProperties
            strFieldName = objField.Name

              ' Prüfen ob das Feld in unserer Liste ist
            If desiredFields.Exists(strFieldName) Then

                ' Sicheres Auslesen des Wertes
                On Error Resume Next
                varFieldValue = objField.Value
                If Err.number = 0 Then
                    strSQL = "EXEC [dbo].[spA_Outlook_Contact_Import] " & _
                            "@x = 'OutlookContactImport'" & _
                            ",@a = 0" & _
                            ",@field = '" & OH_RPL(strFieldName) & _
                            "',@value = '" & OH_RPL(CStr(varFieldValue)) & "'"
                    OH_r r
                    If Not r Is Nothing Then
                        If Not r.EOF Then
                            If r!InsertCount > 0 Then importCount = importCount + 1
                        End If
                        r.Close
                        Set r = Nothing
                    End If
                End If
                On Error GoTo 0
            End If
        Next objField

        strSQL = "EXEC [dbo].[spA_Outlook_Contact_Import] " & _
                        "@x = 'OutlookContactImport'" & _
                        ",@a = 1"
        OH_r r
        If Not r Is Nothing Then
            If Not r.EOF Then
                ' Update counters based on the message
                Select Case r!message
                    Case "Firma und Person erfolgreich angelegt"
                        results.NewCompanies = results.NewCompanies + 1
                        results.NewPersons = results.NewPersons + 1
                    Case "Person zur existierenden Firma hinzugefügt"
                        results.ExistingCompanies = results.ExistingCompanies + 1
                        results.NewPersons = results.NewPersons + 1
                    Case "Person erfolgreich angelegt"
                        results.NewPersons = results.NewPersons + 1
                    Case "Kontaktperson existiert bereits bei dieser Firma"
                        results.ExistingPersons = results.ExistingPersons + 1
                    Case "Kontaktperson existiert bereits (ohne Firmenzuordnung)"
                        results.ExistingPersons = results.ExistingPersons + 1
                End Select
            End If
            r.Close
            Set r = Nothing
        End If
        i = i + 1
    Next olContact
    OH_ResetID
    MsgBox "Import abgeschlossen!" & vbCrLf & vbCrLf & _
           "Neue Firmen: " & results.NewCompanies & vbCrLf & _
           "Neue Personen: " & results.NewPersons & vbCrLf & _
           "Bereits existierende Firmen: " & results.ExistingCompanies & vbCrLf & _
           "Bereits existierende Personen: " & results.ExistingPersons, _
           vbInformation
CleanUp:
    ' Aufräumen
    Set olItems = Nothing
    Set olFolder = Nothing
    Set olNamespace = Nothing
    Set olAccounts = Nothing
    Set olApp = Nothing
End Sub
Public Sub ImportUpdateFirmenAusOutlook()
    Dim olApp As Object        ' Outlook.Application
    Dim olNamespace As Object  ' Outlook.Namespace
    Dim olFolder As Object     ' Outlook.MAPIFolder
    Dim olContact As Object    ' Outlook.ContactItem
    Dim olItems As Object
    Dim objField As Object
    Dim olAccounts As Object   ' Outlook.Accounts
    Dim olAccount As Object    ' Outlook.Account
    Dim strFieldName As String
    Dim varFieldValue As String
    Dim importCount As Long
    Dim i As Integer
    Dim accountName As String
    Dim desiredFields As Object
    Dim results As ImportResults
    Dim selectedAccount As Object

    ' Initialize results
    results.NewCompanies = 0
    results.NewPersons = 0
    results.ExistingCompanies = 0
    results.ExistingPersons = 0

     ' Dictionary mit gewünschten Feldern erstellen
    Set desiredFields = CreateObject("Scripting.Dictionary")

    ' Hier die gewünschten Felder definieren
    With desiredFields
        .Add "Birthday", "Geburtstag"
        .Add "BusinessAddressCity", "Geschäftsort"
        .Add "BusinessAddressCountry", "Geschäftsland"
        .Add "BusinessAddressPostalCode", "Geschäfts-PLZ"
        .Add "BusinessAddressStreet", "Geschäftsstraße"
        .Add "BusinessFaxNumber", "Faxnummer"
        .Add "BusinessHomepage", "Homepage"
        .Add "BusinessTelephoneNumber", "Geschäftstelefon"
        .Add "CompanyName", "Firma"
        .Add "Department", "Abteilung"
        .Add "Email1Address", "E-Mail 1"
        .Add "Email2Address", "E-Mail 2"
        .Add "FirstName", "Vorname"
        .Add "Gender", "Geschlecht"
        .Add "HomeAddressCity", "Privatort"
        .Add "HomeAddressCountry", "Privatland"
        .Add "HomeAddressPostalCode", "Privat-PLZ"
        .Add "HomeAddressStreet", "Privatstraße"
        .Add "HomeTelephoneNumber", "Privat Telefon"
        .Add "JobTitle", "Position"
        .Add "LastName", "Nachname"
        .Add "MobileTelephoneNumber", "Mobiltelefon"
        .Add "NickName", "Rufname"
        .Add "Notes", "Bemerkungen"
        .Add "OfficeLocation", "Büro"
        .Add "Profession", "Beruf"
        .Add "Suffix", "Titel"
    End With

    ' Outlook-Instanz erstellen
    On Error Resume Next
    Set olApp = GetObject(, "Outlook.Application")
    If olApp Is Nothing Then
        Set olApp = CreateObject("Outlook.Application")
    End If
    On Error GoTo 0

    If olApp Is Nothing Then
        MsgBox "Outlook konnte nicht geöffnet werden.", vbCritical
        Exit Sub
    End If

    ' Get all accounts
    Set olAccounts = olApp.Session.Accounts

    ' Create account selection form
    If olAccounts.count = 0 Then
        MsgBox "Keine Outlook-Konten gefunden.", vbExclamation
        GoTo CleanUp
    ElseIf olAccounts.count = 1 Then
        accountName = olAccounts.Item(1).DisplayName
    Else
        ' Build account list for selection
        Dim accountList As String
        For Each olAccount In olAccounts
            accountList = accountList & olAccount.DisplayName & "|"
        Next
        accountList = left(accountList, Len(accountList) - 1) ' Remove last pipe

        ' Show input box with account list
        accountName = InputBox("Bitte wählen Sie ein Konto:" & vbCrLf & _
                             "Verfügbare Konten:" & vbCrLf & Replace(accountList, "|", vbCrLf), _
                             "Kontoauswahl")

        If accountName = "" Then
            MsgBox "Keine Kontoauswahl getroffen.", vbExclamation
            GoTo CleanUp
        End If
    End If

    ' Find selected account
    Set selectedAccount = Nothing
    For Each olAccount In olAccounts
        If olAccount.DisplayName = accountName Then
            Set selectedAccount = olAccount
            Exit For
        End If
    Next

    If selectedAccount Is Nothing Then
        MsgBox "Das ausgewählte Konto wurde nicht gefunden.", vbExclamation
        GoTo CleanUp
    End If

    ' Get namespace for selected account
    Set olNamespace = olApp.GetNamespace("MAPI")

    ' Get contacts folder for selected account
    Set olFolder = olNamespace.GetDefaultFolder(10)  ' 10 = olFolderContacts
    Set olItems = olFolder.Items

    importCount = 0
    i = 0

    ' Process contacts
    For Each olContact In olItems
        If i >= 2 Then Exit For  ' Nur der 1. Kontakt zum Testen

        OH_ResetID

        ' Standardfelder durchlaufen
        For Each objField In olContact.ItemProperties
            strFieldName = objField.Name

              ' Prüfen ob das Feld in unserer Liste ist
            If desiredFields.Exists(strFieldName) Then

                ' Sicheres Auslesen des Wertes
                On Error Resume Next
                varFieldValue = objField.Value
                If Err.number = 0 Then
                    strSQL = "EXEC [dbo].[spA_Outlook_Contact_Import_Update] " & _
                            "@x = 'OutlookContactImport'" & _
                            ",@a = 0" & _
                            ",@field = '" & OH_RPL(strFieldName) & _
                            "',@value = '" & OH_RPL(CStr(varFieldValue)) & "'"
                    OH_r r
                    If Not r Is Nothing Then
                        If Not r.EOF Then
                            If r!InsertCount > 0 Then importCount = importCount + 1
                        End If
                        r.Close
                        Set r = Nothing
                    End If
                End If
                On Error GoTo 0
            End If
        Next objField

        strSQL = "EXEC [dbo].[spA_Outlook_Contact_Import_Update] " & _
                        "@x = 'OutlookContactImport'" & _
                        ",@a = 1"
        OH_r r
        If Not r Is Nothing Then
            If Not r.EOF Then
                ' Update counters based on the message
                Select Case r!message
                    Case "Firma und Person erfolgreich angelegt"
                        results.NewCompanies = results.NewCompanies + 1
                        results.NewPersons = results.NewPersons + 1
                    Case "Person zur existierenden Firma hinzugefügt"
                        results.ExistingCompanies = results.ExistingCompanies + 1
                        results.NewPersons = results.NewPersons + 1
                    Case "Person erfolgreich angelegt"
                        results.NewPersons = results.NewPersons + 1
                End Select

                ' Wenn Updates durchgeführt wurden
                If Not IsNull(r!UpdatedFields) Then
                    results.UpdatedRecords = results.UpdatedRecords + 1
                    results.DetailedUpdates = results.DetailedUpdates & vbCrLf & _
                        "Kontakt " & i + 1 & ": " & r!UpdatedFields
                End If
            End If
            r.Close
            Set r = Nothing
        End If
        i = i + 1
    Next olContact
    OH_ResetID

MsgBox "Import abgeschlossen!" & vbCrLf & vbCrLf & _
       "Neue Firmen: " & results.NewCompanies & vbCrLf & _
       "Neue Personen: " & results.NewPersons & vbCrLf & _
       "Bereits existierende Firmen: " & results.ExistingCompanies & vbCrLf & _
       "Bereits existierende Personen: " & results.ExistingPersons & vbCrLf & _
       "Aktualisierte Datensätze: " & results.UpdatedRecords & vbCrLf & _
       vbInformation
        'IIf(results.DetailedUpdates <> "", vbCrLf & "Details zu den Aktualisierungen:" & results.DetailedUpdates, ""),
CleanUp:
    ' Aufräumen
    Set olItems = Nothing
    Set olFolder = Nothing
    Set olNamespace = Nothing
    Set olAccounts = Nothing
    Set olApp = Nothing
End Sub

Function OH_eRechnung_DisplayXML()
    '241212 EO
On Error GoTo ErrMsg
Dim A As Outlook.Attachment
Dim olExp As Outlook.Explorer
Dim olSel As Outlook.Selection
Dim N As Long
Dim lgMCt As Long
Dim lgCtAttachments As Long
Dim strXML As String
Dim xmlArray() As String
Dim olMail As Outlook.MailItem
Dim xmlCount As Long  ' Zähler für XML-Anhänge

    lgMCt = 0
    t = "Anzeige aktuell markierte E-Mail XML-Anhänge"
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    Set olExp = myOlApp.ActiveExplorer
    Set olSel = olExp.Selection
    lgMCt = olSel.count
    Select Case lgMCt
    Case 0
        s = "Bitte das gewünschte Mail markieren!"
        GoTo ErrM
    Case Is > 1
        s = "Bitte nur eine E-Mail markieren"
        GoTo ErrM
    End Select
    Set olMail = olSel.Item(1)
    ' Prüfe ob Attachments vorhanden sind
    lgCtAttachments = olMail.Attachments.count
    s = "Email-Sender = " & olMail.SenderName & vbNewLine & vbNewLine & "Diese E-Mail enthält "
    Select Case lgCtAttachments
    Case 0
        s = s & " keine Anhänge"
        GoTo ErrM
    Case 1
        s = s & " einen Anhang"
    Case Else
        s = s & lgCtAttachments & " Anhänge"
    End Select
    ' Zähle zuerst die XML-Anhänge
    For Each A In olMail.Attachments
        If LCase(right(A.Filename, 4)) = ".xml" Then
            xmlCount = xmlCount + 1
        End If
    Next A

    ' Wenn keine XML-Anhänge gefunden wurden
    If xmlCount = 0 Then
        s = s & ", aber NICHT im XML-Format."
        GoTo ErrM
    End If

    ReDim xmlArray(0) ' Array initialisieren

    ' Jetzt erst die XML-Dateien verarbeiten
    For Each A In olMail.Attachments
        If LCase(right(A.Filename, 4)) = ".xml" Then
            ' Dateiinhalt zum Array hinzufügen
            xmlArray(UBound(xmlArray)) = A.Filename
            ReDim Preserve xmlArray(UBound(xmlArray) + 1)
            ' Speichere die Datei im TEMP-Ordner
            A.SaveAsFile Environ("TEMP") & "\" & A.Filename
        End If
    Next A
    ' Entferne das letzte, leere Element im Array
    If UBound(xmlArray) >= 0 Then
        ReDim Preserve xmlArray(UBound(xmlArray) - 1)
    End If

    ' ˜bergabe der Inhalte an das Formular
    If UBound(xmlArray) >= 0 Then
        strXML = Join(xmlArray, ";")
        '       DoCmd.openForm "pfrmeRechnung", , , , , , strXML
        ' Prüfe, ob das Formular bereits geöffnet ist
        If SysCmd(acSysCmdGetObjectState, acForm, "pfrmeRechnung") = acObjStateOpen Then
            ' Formular ist bereits geöffnet - aktualisiere einfach die Liste
            Forms!pfrmeRechnung.lstXMLFiles.RowSourceType = "Value List"
            Forms!pfrmeRechnung.lstXMLFiles.RowSource = ""

            For i = LBound(xmlArray) To UBound(xmlArray)
                Forms!pfrmeRechnung.lstXMLFiles.AddItem xmlArray(i)
            Next i

            ' Wähle das erste Element in der Liste aus, wenn es Elemente gibt
            If Forms!pfrmeRechnung.lstXMLFiles.ListCount > 0 Then
                Forms!pfrmeRechnung.lstXMLFiles = Forms!pfrmeRechnung.lstXMLFiles.ItemData(0)
                Call Forms.pfrmeRechnung.lstXMLFiles_AfterUpdate
                DoEvents
            End If
        Else
            ' Formular ist nicht geöffnet - öffne das Formular
            DoCmd.openForm "pfrmeRechnung", , , , , , strXML
        End If
    Else
        s = "Keine XML-Anhänge gefunden"
        GoTo ErrM
    End If
ErrEnd:
   DoCmd.Hourglass False
   Exit Function
ErrMsg:
   MsgBox Err & " " & Err.Description, vbCritical, "OH_eRechnung_DisplayXML"
   Resume ErrEnd
ErrM:
   MsgBox s, vbCritical, t
   GoTo ErrEnd
End Function
Public Function OH_PDFOutlook(lgNrVG As Long, _
                                Optional strAttach As String, _
                                Optional strB2bFolder As String, _
                                Optional lgSendMail As Long = 0) As Boolean
On Error GoTo ErrMsg
    Dim strFilename As String
    Dim strRechnungsformat As String
    Dim strOutlookFolder As String
    DoCmd.Hourglass True
    t = "aktuellen Vorgang als PDF in Outlook-Postausgang ablegen"
    If lgNrVG = 0 Then
        s = "Bitte den entsprechenden Vorgang öffnen!"
        GoTo ErrM
    End If
    OH_InitializeOutlook
    OH_InsertID lgNrVG, , True
    If OH_closeObj(glstrB_VG, acReport) Then
        s = glstrB_VG & "  ==>Report checken"
        GoTo ErrM
    End If
    VarAntw = "Email"
    DoCmd.OpenReport glstrB_VG, acViewPreview, , , , "F_VG"
    strFilename = glstrTempPath & Reports(glstrB_VG).FileN
    strRechnungsformat = Reports(glstrB_VG).Rechnungsformat
    OH_KILL strFilename
    s = OH_Create_PDF(lgNrVG, strFilename, strRechnungsformat)
    If left(s, 7) <> "Success" Then
        GoTo ErrM
    End If
    strSQL = "EXEC dbo.dms " & _
        "  @x = 'AddtoAblage' " & _
        ", @f ='" & strFilename & _
        "',@d ='" & OH_GetNamePart(strFilename) & _
        "',@n = 1" & _
        ", @m = 99" & _
        ", @a = " & lgNrVG
    OH_r r
    OH_FileCopyMove r!nrID, "DMS", False
    OH_closeObj glstrB_VG, acReport
    If strAttach = "" Then
        strAttach = strFilename
    Else
        strAttach = strFilename & ";" & strAttach
    End If
    OH_PDFOutlook = OH_MailDocument(Forms!F_VG, strAttach, , strB2bFolder, lgSendMail)
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    t = "OH_PDFOutlook"
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Sub ShowCurrentFolderName()
    Dim olApp As Outlook.Application
    Dim olExp As Outlook.Explorer
    Dim olFolder As Outlook.MAPIFolder

    Set olApp = Outlook.Application
    Set olExp = olApp.ActiveExplorer

    If olExp Is Nothing Then
        MsgBox "Kein Explorer aktiv.", vbExclamation
        Exit Sub
    End If

    Set olFolder = olExp.CurrentFolder

    MsgBox "Aktueller Ordner: " & olFolder.Name & vbCrLf & _
           "Pfad: " & olFolder.folderPath, vbInformation
End Sub
Function OH_OutlookFolder(folderPath As String) As Outlook.Folder
'übergebenen String als Outlook-Folder definieren
On Error GoTo ErrMsg
    Dim olStore As Outlook.Store
    Dim olFolder As Outlook.Folder
    Dim parts() As String
    Dim part As Variant
    Dim found As Boolean
    DoCmd.Hourglass True

    ' Beispiel: "\\Philipp@ohnemus.biz\Posteingang\Testordner"
    folderPath = Replace(folderPath, "\\", "")
    parts = Split(folderPath, "\")

    ' Erstes Element ist das Postfach
    For Each olStore In gnspNameSpace.Stores
        If LCase(olStore.DisplayName) = LCase(parts(0)) Then
            Set olFolder = olStore.GetRootFolder
            found = True
            Exit For
        End If
    Next olStore

    If Not found Then
        Set OH_OutlookFolder = Nothing
        GoTo ErrEnd
    End If

    ' Durch Unterordner navigieren
    For i = 1 To UBound(parts)
        On Error Resume Next
        Set olFolder = olFolder.Folders(parts(i))
        If olFolder Is Nothing Then
            Set OH_OutlookFolder = Nothing
            GoTo ErrEnd
        End If
        On Error GoTo 0
    Next i
    Set OH_OutlookFolder = olFolder
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    t = "OH_OutlookFolder"
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
