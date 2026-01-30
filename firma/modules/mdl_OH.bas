Attribute VB_Name = "mdl_OH"
Option Compare Database
Option Explicit
Global strChangeControl As String 'Eintrag in Audit Trail beim Löschen
Global strDel As String           'Meldung in msgbox beim Löschen
Global strCheckUSTID As String     'Zwischenspeichern der geprüften Firmen während der Sitzung
Global glLstDet As Boolean
Global strMulti(1 To 30, 1 To 6) As String

'Dim db1 As Database
Dim lga1 As Long, lgA As Long
Dim GrpArrayPage(), GrpArrayPages()
Dim GrpNameCurrent As Variant, GrpNamePrevious As Variant
Dim GrpPage As Integer, GrpPages As Integer
Private Const SW_SHOWNORMAL = 1

Private Declare PtrSafe Sub Sleep Lib "kernel32" _
                    (ByVal dwMilliseconds As Long)

Private Declare PtrSafe Function apiSetForegroundWindow Lib "user32" Alias _
    "SetForegroundWindow" (ByVal hWnd As Long) As Long
Private Declare PtrSafe Function apiShowWindow Lib "user32" Alias _
    "ShowWindow" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
Private Declare PtrSafe Function apiFindWindow Lib "user32" Alias _
    "FindWindowA" (ByVal strClass As String, _
    ByVal lpWindow As String) As Long

Private Declare PtrSafe Function apiSendMessage Lib "user32" Alias _
    "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, ByVal _
    wParam As Long, lParam As Long) As Long

Private Declare PtrSafe Function apiIsIconic Lib "user32" Alias _
    "IsIconic" (ByVal hWnd As Long) As Long
Private Declare PtrSafe Function MoveWindow Lib "user32" _
                   (ByVal hWnd As Long, _
                    ByVal x As Long, _
                    ByVal Y As Long, _
                    ByVal nWidth As Long, _
                    ByVal nHeight As Long, _
                    ByVal bRepaint As Boolean) As Boolean
Dim difflstdet As Date
Public Type tFileDates
  Created As Date
  Modified As Date
  Accessed As Date
End Type
Private Declare PtrSafe Function apiGetWindowRect Lib "user32" Alias "GetWindowRect" _
    (ByVal hWnd As Long, lpRect As RECT_Type) As LongPtr

Private Declare PtrSafe Function apiGetDC Lib "user32" Alias "GetDC" (ByVal hWnd As Long) As LongPtr

Private Declare PtrSafe Function apiGetDeviceCaps Lib "gdi32" Alias "GetDeviceCaps" (ByVal hDC As LongPtr, ByVal nIndex As Long) As LongPtr

Private Declare PtrSafe Function apiReleaseDC Lib "user32" Alias "ReleaseDC" (ByVal hWnd As Long, ByVal hDC As LongPtr) As LongPtr
Private Type POINTAPI
    x As Long
    Y As Long
End Type
Private Const TWIPSPERINCH = 1440
Private Const WU_LOGPIXELSX = 88
Private Const WU_LOGPIXELSY = 90

Type RECT_Type
    left As Long
    top As Long
    right As Long
    bottom As Long
 End Type

Declare PtrSafe Function GetSystemMetrics32 Lib "user32" _
    Alias "GetSystemMetrics" (ByVal nIndex As Long) As Long

    'SENDKEYS Ersatz, weil Sendkey den NUMLOCK ausschaltet=====================================================
Declare PtrSafe Function OH_GetKeyState Lib "user32.dll" ( _
ByVal nVirtKey As Long) As Integer

Declare PtrSafe Sub keybd_event Lib "user32" ( _
ByVal bVk As Byte, _
ByVal bScan As Byte, _
ByVal dwFlags As Long, _
ByVal dwExtraInfo As Long)
Public Const VK_F11 = &H7A 'Funktionstaste F11
    'SENDKEYS Ersatz, weil Sendkey den NUMLOCK ausschaltet=====================================================

' Declare the necessary Windows API functions
Private Declare PtrSafe Function apiGetActiveWindow Lib "user32" Alias "GetActiveWindow" () As LongPtr

' Constants for the ShowWindow function
Private Const SW_HIDE As Long = 0
Private Const SW_SHOW As Long = 5

' Function to hide the Access window
Public Sub HideAccessWindow()
    Dim hWnd As LongPtr
    hWnd = apiGetActiveWindow()
    apiShowWindow hWnd, SW_HIDE
End Sub

' Function to show the Access window
Public Sub ShowAccessWindow()
    Dim hWnd As LongPtr
    hWnd = apiGetActiveWindow()
    apiShowWindow hWnd, SW_SHOW
End Sub

Public Function OH_ScreenRes(lgDirection As Long, Optional strC As String = "") As Long
    Dim lgC As Long
    'w = GetSystemMetrics32(0) ' width in points
    'h = GetSystemMetrics32(1) ' height in points
    OH_ScreenRes = GetSystemMetrics32(lgDirection)
    Select Case strC
    Case "Twips"
        OH_ScreenRes = OH_ConvertPIXELSToTWIPS(OH_ScreenRes, lgDirection)
    End Select

End Function
Public Function OH_ConvertPIXELSToTWIPS(lgPixel As Long, _
                                 lgDirection As Long) As Long

    Dim hDC As LongPtr
    Dim hWnd As Long
    Dim retVal As LongPtr
    Dim PIXELSPERINCH

    hDC = apiGetDC(0)

    ' Horizontal
    If (lgDirection = 0) Then
        PIXELSPERINCH = apiGetDeviceCaps(hDC, WU_LOGPIXELSX)
    ' Vertical
    Else
        PIXELSPERINCH = apiGetDeviceCaps(hDC, WU_LOGPIXELSY)
    End If

    retVal = apiReleaseDC(0, hDC)

    OH_ConvertPIXELSToTWIPS = (lgPixel / PIXELSPERINCH) * TWIPSPERINCH

End Function

Public Function OH_GetFileDates(strPathFile) As tFileDates
'Erstellungs-, Änderungs- und Zugriffsdatum von Dateien
  Dim fso As New FileSystemObject
  Dim f As File

'  Sub TestGFD()  ''so aufrufen:
'  Dim FileDates As tFileDates
'
'  FileDates = GetFileDates("Z:\Test\Adressen.accdb")
'  With FileDates
'    MsgBox "Angelegt: " & .Created & vbCrLf & _
'           "Zuletzt geändert: " & .Modified & vbCrLf & _
'           "Letzter Zugriff: " & .Accessed
'  End With
'
'End Sub
'

  On Error Resume Next
  Set f = fso.GetFile(strPathFile)
  If Err <> 0 Then
    Beep
    MsgBox "OH_GetFileDates: " & Err.Description & _
           vbCrLf & vbCrLf & _
           strPathFile, _
           vbOKOnly + vbExclamation, "OH_GetFileDates:"
  Else
    With OH_GetFileDates
      .Created = f.DateCreated
      .Modified = f.DateLastModified
      .Accessed = f.DateLastAccessed
    End With
  End If 'Err?

  Set f = Nothing
  Set fso = Nothing

End Function

Public Function OH_RPL(varMitHochkomma As Variant, Optional lgA As Long = 1) As String
On Error GoTo ErrMsg
    '111124 Input Christoph M.
    'Bei der Übergabe eines Strings mit Hochkomma gibts Probleme,
    'da das Hochkomma als Stringbegrenzer angesehen wird
    'http://devguru.com/features/kb/kb100206.asp
    'SQL Queries and the Single Quotation Symbol Problem.

    OH_RPL = Nz(varMitHochkomma, "")
    If InStr(varMitHochkomma, "'") > 0 Then
        OH_RPL = Replace(varMitHochkomma, "'", "''")
        If lgA = 2 Then
            OH_RPL = Replace(OH_RPL, "'", "''")
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "replace(varMitHochkomma)"
    Resume ErrEnd
End Function
Public Function OH_CountStichwort(strL As String) As Integer
On Error GoTo ErrMsg
'zählt Anzahl Stichworte pro Where-Bedingung
    strSQL = "Exec dbo.spA_Stichwort " & _
            " @x='CountStichworte' " & _
            ",@fi='" & strL & "'"
    OH_r r
    OH_CountStichwort = r!countS
ErrEnd:
    Exit Function
ErrMsg:
    If Err = 3022 Then Resume Next
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CountStichwort"
    Resume ErrEnd
End Function

Public Function getPageNr(lgPages As Long, lgPage As Long, varGroup) As String
'http://www.mvps.org/access/
'Seiten-Nummerierung in einem Bericht pro Gruppe neu starten:
'übergeben werden:
'lgPages: Anzahl Seiten
'lgPage:Aktuelle Seitenzahl
'varGroup:ID der Gruppierung
'Rückgabe:Seite X von Y
'Im Bericht muss dazu die Seitennummerierung "erzwungen" werden (unsichtbares Feld mit =Seite)
On Error GoTo ErrMsg
    i = 0
    If lgPages = 0 Then
        ReDim Preserve GrpArrayPage(lgPage + 1)
        ReDim Preserve GrpArrayPages(lgPage + 1)
        GrpNameCurrent = varGroup
        If GrpNameCurrent = GrpNamePrevious Then
            GrpArrayPage(lgPage) = GrpArrayPage(lgPage - 1) + 1
            GrpPages = GrpArrayPage(lgPage)
                For i = lgPage - ((GrpPages) - 1) To lgPage
                    GrpArrayPages(i) = GrpPages
                Next i
        Else
            GrpPage = 1
            GrpArrayPage(lgPage) = GrpPage
            GrpArrayPages(lgPage) = GrpPage
        End If
    Else
       If GrpArrayPages(lgPage) <> 1 Then
            getPageNr = lg("Seite") & " " & GrpArrayPage(lgPage) & " " & lg("von") & " " & GrpArrayPages(lgPage)
        End If
    End If
    GrpNamePrevious = GrpNameCurrent
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "getPageNr"
    Resume ErrEnd
End Function
'Wenn Sie nun das Access-Fenster auf eine bestimmte Auflösung skalieren möchten,
'rufen Sie diese Prozedur mit dem Parameter
'"1" für 640*480,
'"2" für 800*600 und '
'"3" für 1.024*768 auf.
Public Sub AccessFensterSetzen(intModus As Long)

  Select Case intModus
    Case 1: MoveWindow Application.hWndAccessApp, 10, _
                       10, 640, 480, 1
    Case 2: MoveWindow Application.hWndAccessApp, 10, _
                       10, 800, 600, 1
    Case 3: MoveWindow Application.hWndAccessApp, 10, _
                       10, 1024, 768, 1
  End Select

End Sub
'**********************************************************************************
'Function File_Exist ()
'   Überprüft, ob die Datei vorhanden ist
'   Rückgabe:  True, Datei vorhanden
'              False, Datei nicht vorhanden
'**********************************************************************************
Public Function File_exist(ByVal strFile As String) As Integer
Dim f

f = FreeFile
On Error GoTo File_existError
Open strFile For Input Access Read As #f
Close #f
File_exist = True
Exit Function

File_existError:
File_exist = False
Exit Function

End Function
Sub SETiptextSetzen(frmAktForm As Form)
  Dim ctlInForm As control

  On Error Resume Next
  For Each ctlInForm In frmAktForm.Controls
    With ctlInForm
      If .ControlType = acTextBox Then
        .ControlTipText = IIf(IsNull(.Value), _
         "NULL", .Value)
      ElseIf .ControlType = acComboBox Or _
             .ControlType = acListBox Then
        If .ColumnCount > 1 Then
          .ControlTipText = IIf(IsNull(.Value), "NULL", _
          .column(.BoundColumn))
        Else
          .ControlTipText = IIf(IsNull(.Value), "NULL", _
          .Value)
        End If
      End If
    End With
  Next ctlInForm
End Sub
Public Function OH_Replace(ByVal strX As String, _
                       strfind As String, _
                       strRepl As String) As String
'Komfortable Ersetzen-Funktion für Zeichenketten
'In Formularen, Abfragen und VBA-Routinen stellt sich immer wieder das Problem,
'dass einzelne Zeichen oder Begriffe in Zeichenketten ersetzt werden müssen.
    If Len(strfind) > 0 Then
        If InStr(strRepl, strfind) = 0 Then
            While InStr(strX, strfind) <> 0
                strX = left$(strX, InStr(strX, strfind) - 1) + _
                   strRepl + _
                   Mid$(strX, InStr(strX, strfind) + Len(strfind))
            Wend
        End If
    End If
    OH_Replace = strX
End Function
Public Function numbersOnly(strInput As String) As String
    Dim lgI As Long
    Dim strNumber As String
    For lgI = 1 To Len(strInput)
      If (Asc(Mid(strInput, lgI, 1)) > 47 And Asc(Mid(strInput, lgI, 1)) < 57) Then
        strNumber = strNumber & Mid(strInput, lgI, 1)
      End If
    Next
    numbersOnly = strNumber
End Function
Public Function ReplaceNumeric(strX As String, lgDivisor As Long) As Double
On Error GoTo ErrMsg 'Komfortable Ersetzen-Funktion für Zeichenketten
'In Formularen, Abfragen und VBA-Routinen stellt sich immer wieder das Problem,
'dass einzelne Zeichen oder Begriffe in Zeichenketten ersetzt werden müssen.
'Diese Funktion sucht nur alle zahlen
    Dim lgN As Long
    For lgN = 1 To Len(strX)
        Select Case Mid(strX, lgN, 1)
        Case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-"
            ReplaceNumeric = ReplaceNumeric & Mid(strX, lgN, 1)
        End Select
    Next lgN
    ReplaceNumeric = ReplaceNumeric / lgDivisor
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "ReplaceNumeric-Function"
    Resume ErrEnd
End Function

Public Function OH_Zeichentabelle()
    Call Shell("Charmap.exe", 1)
End Function
Public Sub OH_Pause(lngMilliSekunden As Long)
'Als Parameter wird die zu pausierende Zeit in Millisekunden erwartet -
'eine Sekunde = 1.000 Millisekunden.
'Durch den Aufruf von "Pause 3000" wird also bei VBA-Routinen
'eine Pause von 3 Sekunden eingelegt.

  If lngMilliSekunden > 0 Then Sleep lngMilliSekunden

End Sub
Function OH_msgbox(strPrompt As String, _
                   arrButtons As Variant, _
          Optional intIcon As Integer, _
          Optional strTitle As Variant, _
          Optional strhelp As Variant, _
          Optional strInput As Variant, _
          Optional ctlM As control, _
          Optional strListeSQL As String, _
          Optional lgColumnCount As Long, _
          Optional strColumnWidths As String) As String

'http://www.add-in-world.com/katalog
'Mit dieser msgbox können Sie durch einen einzigen Funktionsaufruf ein
'Mitteilungsfenster anzeigen.
'Diesmal sind die Schaltflächen aber frei konfigurierbar,
'so dass mit wenig Aufwand eine komfortable Auswahl zwischen mehreren Optionen möglich ist.
'Auf Wunsch können Sie eine Hilfe-Schaltfläche anzeigen und einen kurzen Infotext hinterlegen,
'ohne dazu extra eine Online-Hilfe erstellen zu müssen
On Error GoTo ErrMsg
Const MaxButtons = 6
  Dim f As Form
  Dim Anz As Long
  Dim xPos As Long
  Dim xW As Long
  Dim N As Long
  Dim blV As Boolean
  Dim btn As CommandButton
  Dim btnTmp As CommandButton
  DoCmd.openForm "PF_msgbox"
  On Error Resume Next
  Set f = Forms("PF_msgbox")
  If Err <> 0 Then
    Beep
    MsgBox "Formular »PF_msgbox« nicht gefunden...", vbCritical, "Admin-Problem!"
    Exit Function
  End If
  On Error GoTo 0

  'Buttons setzen/anpassen...
    For i = 0 To UBound(arrButtons)
        If arrButtons(i) <> "" Then
            N = N + 1
        End If
        Anz = Anz + 1
    Next i
  If Anz > MaxButtons Then
    Anz = MaxButtons
  End If
  xW = ((f!txtPrompt.Width + f!btnHelp.Width) / N)
  xPos = f!btnHelp.left
  f!btn0.SetFocus
  For i = 1 To Anz
    Set btn = f("btn" + CStr(i))
    If i = 1 Then
        xPos = f!btnHelp.left
    Else
        xPos = f("btn" + CStr(i - 1)).left + f("btn" + CStr(i - 1)).Width
    End If
    btn.left = xPos
    If arrButtons(i - 1) = "" Then
        btn.Width = 0
    Else
        btn.Width = xW
    End If
    btn.Caption = arrButtons(i - 1)
    btn.Visible = (btn.Caption <> "")
  Next i

  'Symbol setzen
  If Not IsMissing(intIcon) Then
    If intIcon = vbQuestion Then
      f!imgIcon.PictureData = f!imgFrage.PictureData
    ElseIf intIcon = vbExclamation Then
      f!imgIcon.PictureData = f!imgWarn.PictureData
    ElseIf intIcon = vbCritical Then
      f!imgIcon.PictureData = f!imgStop.PictureData
    End If
  End If

  'Prompt, Titelleiste und Hilfe setzen...
  With f
    If !btn1.Visible = True Then
        !btn1.SetFocus
    End If
    !txtPrompt = strPrompt
    If Not IsMissing(strTitle) Then
      .Caption = strTitle
    End If
    If Not IsMissing(strhelp) Then
      !lblHelp.Caption = strhelp
    Else
      !lblHelp.Caption = vbNullString
      !btnHelp.Enabled = False
    End If
    If IsMissing(strInput) Then
      !Input.Visible = False
      !txtPrompt.Height = !txtPrompt.Height + !Input.Height
    Else
        If Len(strInput) = 0 Then
          !Input.Visible = False
          !txtPrompt.Height = !txtPrompt.Height + !Input.Height
        Else
            !Input.Visible = True
            !Input.Value = strInput
            !Input.SetFocus
            If InStr(!Input, " wichtige ") = 0 Then  ' nicht bei: Hier wichtige Nachricht / Text eintragen!!
                !Input.SelStart = Len(!Input) + 1
            End If
        End If
    End If
    If Len(!txtPrompt) < 500 Then
        !txtPrompt.FontSize = 12
    End If
    !comInput.Visible = False
    If Not ctlM Is Nothing Then
        If ctlM.ControlType = acComboBox Then
            !comInput.Visible = True
            !comInput.SetFocus
            !comInput.top = !Input.top
            !Input.Visible = False
            'übernehme für das Kombifeld die gleichen Properties wie aus dem übergegeben control (erste 60)
            For i = 1 To 60
                Select Case ctlM.Properties(i).Name
                Case "controlsource", "name", "controltype", "Tabindex", "columnOrder", _
                     "Left", "Top", "section", "text", "Listcount"
                Case Else
                    !comInput.Properties(ctlM.Properties(i).Name) = ctlM.Properties(i)
                End Select
            Next i
            !comInput = ctlM
        End If
    End If
    If Len(strListeSQL) > 0 Then
        !txtPrompt.Visible = False
        !Liste.Visible = True
        !ListeCount.Visible = True
        !Liste.SetFocus
        !Liste.top = !txtPrompt.top
        !Liste.Visible = True
        OH_A "Liste", strSQL, f
        !ListeCount = !Liste.ListCount - 1
        !Liste.ColumnCount = lgColumnCount
        !Liste.ColumnWidths = OH_ColumnWidthsMM(strColumnWidths)
        !Liste.Locked = False
        !Liste.Enabled = True
        !Liste.SetFocus
        .Liste_AfterUpdate
        !Liste.Selected(1) = True
        !Liste.SetFocus
    End If
    !lblSort.Visible = !Liste.Visible
    If !Input Like "Password" Then
        !Input.InputMask = "Password"
        !Input = Null
    End If
    Select Case left(.Caption, 5)
    Case "zoome", "Billi"
        !txtPrompt.Locked = False
        !txtPrompt.BackColor = vbWhite
        !txtPrompt.BackColor = vbWhite
        !txtPrompt.EnterKeyBehavior = True
        !btn1.SetFocus
    End Select
    Select Case left(strTitle, 7)
    Case "LÖSCHEN" '
        !txtPrompt.ForeColor = vbRed
        !btn0.SetFocus
        !btn1.ForeColor = vbRed
    End Select
    Select Case strTitle
    Case "Bitte warten..." 'siehe Form_Timer in PF_Msgbox
        !Input.Width = 50
        !Input.BackColor = vbBlue
        !btn1.Enabled = False
        !btn0.Visible = False
    Case Else
'        'DB muss warten, bis der User einen Button drückt!!
            While SysCmd(acSysCmdGetObjectState, acForm, "PF_msgbox") = acObjStateOpen
              DoEvents
            Wend
'        End If
    End Select
  End With
  OH_msgbox = strMSG(1)
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_msgbox"
    Resume ErrEnd
End Function
Public Function OH_ColumnWidthsMM(strCW) As String
    'strCW sind so abgelegt strColumnWidths = "10;20;75" :die Zahlen sind in mm abzulegen
    'der String wird jetzt umgewandelt in 1cm;2cm;7,5cm (resp. 7.5cm)
    Dim sgW As Single
    For i = 1 To Len(strCW)
        If Mid(strCW, i, 1) Like ";" Or i = Len(strCW) Then
            If i = Len(strCW) Then
                sgW = strCW / 10
            Else
                sgW = left(strCW, i - 1) / 10
            End If
            If Len(OH_ColumnWidthsMM) = 0 Then
                OH_ColumnWidthsMM = sgW & "cm"
            Else
                OH_ColumnWidthsMM = OH_ColumnWidthsMM & ";" & sgW & "cm"
            End If
            If i = Len(strCW) Then
                Exit For
            End If
            strCW = right(strCW, Len(strCW) - i)
            i = 0
        End If
    Next i
    OH_ColumnWidthsMM = Replace(OH_ColumnWidthsMM, ",", ".")
End Function
Public Function OH_ChangeForms()
On Error GoTo ErrMsg
    Dim obj As AccessObject, dbs As Object
    Set dbs = Application.CurrentProject
    ' Search for open AccessObject objects in AllForms collection.
    For Each obj In dbs.AllForms
        DoCmd.openForm obj.Name, acDesign
        'Forms(obj.Name).AllowDesignChanges = True
        For Each ctl In Forms(obj.Name)
            ctl.FontName = "Arial"
        Next ctl
        DoEvents
        DoCmd.Close , , acSaveYes
        DoEvents
    Next obj
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 438
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, 33
        Resume ErrEnd
    End Select
End Function
Public Function OH_Err(ErrCode As Integer, strErr As String) As String 'Errors abfangen
    DoCmd.Hourglass False
    s = vbNewLine & vbTab & "Falls Ihnen die Fehlerursache unklar ist, " & vbNewLine & vbTab & _
            "erstellen Sie jetzt ein Printscreen " & vbNewLine & vbTab & _
            "(z.B. mit Printkey) " & vbNewLine & vbTab & _
            "und informieren Sie PHILIPP!"
    Select Case ErrCode
    Case 0, 3022
          s = "Doppelte Werte sind nicht möglich!"
    Case 2176
        s = "Versuchen Sie eine einfachere Abfrage / Filter zu verwenden!"
    Case 2237
         s = "Sie können nur Werte auswählen, die in dieser Liste enthalten sind!"
    Case 3314
          s = "Eingabe erforderlich!"
    Case 2427, 2498, 2475
         s = "Aktion ist nicht möglich!" & s
    Case 2501
         s = "Für diese Auswahl sind keine Daten vorhanden!"
    Case 3075
         s = "Mögliche Ursache:" & vbNewLine & _
                   "Sie benutzen die Zeichen <Hochkomma> oder <Gänsefüssle>"
    Case 3200
         s = "Löschen ist nicht möglich!" & vbNewLine & _
                   "Löschen Sie bitte zuerst abhängige Daten!"
    Case 7787, 7878
         s = "Dieser Datensatz wurde zwischenzeiltlich von einem Ihrer Mitstreiter/in geändert!" & vbNewLine & _
                   "Ihre Änderungen wurden verworfen!"
    Case Else
         s = "Aktion ist nicht möglich!" & s
    End Select
    s = "Fehler " & ErrCode & vbNewLine & _
            strErr & vbNewLine & vbNewLine & s
    OH_Err = s
    strDel = vbNullString
    If Err = 91 Then
        AutoExec
       ' Set f = Forms!Menu
    End If
End Function
Public Function OH_SaveRS(Optional frma As Form, Optional blMldg As Boolean) 'Datensatz speichern
On Error GoTo ErrMsg
    Dim strTitel As String
    strTitel = "Speichern"
    If frma Is Nothing Then
        Set frma = Screen.ActiveForm
    End If
    If frma.Dirty = True Then
        If blMldg Then
            s = "Ihre Änderungen werden jetzt zuerst gespeichert" & vbNewLine & _
                "Diese Meldung können Sie vermeiden, wenn Sie bewusst speichern (Datensatz-Markierer drücken in Formular " & frma.Caption & ")!"
            MsgBox s, vbInformation, strTitel
        End If
        RunCommand acCmdSaveRecord
        frma.AllowAdditions = False
        SysCmd acSysCmdSetStatus, "Daten in Formular " & frma.Name & " wurden zuletzt gespeichert um " & Format(Now, "hh:nn")
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2475, 2046, 2465, 2501, 2455, 3129, 7874, 2115, 2105
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Datensatz speichern mit OH_SaveRS"
    End Select
        Resume ErrEnd
End Function
Public Function Q_NewRS()
    'verwendet
    'strmld als Meldungstext
    'strDocname als Formular-Name
    't als Titel der msgbOX
    'strLink als Linkkriterium
    Q_NewRS = False
    If glAskNew = True Then ' soll Frage gestellt werden!
        s = "Sie möchten hinzufügen ?" & vbNewLine & vbNewLine _
                    & s & vbNewLine & vbNewLine _
                    & "Clicken Sie OK um weiterzufahren oder" & vbNewLine _
                    & "Abbrechen, um  N I C H T hinzuzufügen!"

        If MsgBox(s, vbQuestion + vbOKCancel, "Hinzufügen " & t & " !") = vbCancel Then
            Q_NewRS = True
            Exit Function
        End If
    End If
    frm.AllowAdditions = True
    DoCmd.GoToRecord , , acNewRec
    VarAntw = 1
End Function
Public Function Q_DeleteRS(frmC As Form, rec As String)
    Q_DeleteRS = False
    If frmC.CurrentRecord = 0 Then Exit Function
    s = "Sie möchten löschen ?" & vbNewLine & vbNewLine _
                & rec & vbNewLine & vbNewLine _
                & "Clicken Sie OK um zu löschen !"
    If MsgBox(s, 33 + 256, "Info: Löschen " & frmC.Caption & " !") = 2 Then
        Q_DeleteRS = True
        Exit Function
    End If
    If MsgBox(s, vbQuestion + vbOKCancel + vbDefaultButton2, frmC.Caption & " : Löschen rückgängig nicht möglich!") = 2 Then
        Q_DeleteRS = True
        Exit Function
    End If
End Function
Public Function DirtyRecord(frm As Form) As Boolean
On Error GoTo ErrMsg
Dim strhelp As String
    strDel = vbNullString
    blNixTun = False
'=====================
'Marker
    If Screen.ActiveControl.Name = "Marker" Then
        DirtyRecord = True
        Exit Function
    End If
'=====================
'    If OH_checkRight(frm) = True Then
'        DirtyRecord = False
'        Exit Function
'    End If

'=====================
'letzte Änderung
    If glAskSave = True Then
        If DateDiff("d", frm!LastUpdate, Now) > 1 Then
            If MsgBox("Dieser Datensatz wurde vor mehr als einem Tag gespeichert!" & vbNewLine & _
                      "Wollen Sie wirklich die Änderung durchführen?" & vbNewLine & vbNewLine & _
                      "Mit ESC-Taste können Sie abbrechen!", _
                      vbQuestion + vbOKCancel, _
                      frm.Caption & " vom " & frm!LastUpdate) = _
                      vbCancel Then
                frm.Undo
                DirtyRecord = True
                Exit Function
            End If
        End If
    End If
'=====================
'2. Frage
    If glAskSave = True Then
        s = "Sie haben eine Änderung vorgenommen!" & vbNewLine & vbNewLine & _
                  "Clicken Sie OK, um die Eingabe zu bestätigen !"
        If MsgBox(s, vbOKCancel + vbQuestion, _
                "Info: Änderung " & frm.Caption & " !") = vbCancel Then
            DirtyRecord = True
            Exit Function
       End If
    End If
NoUpdate:
'=====================
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2465, 2474, 3020
        Resume NoUpdate 'Feld LastUpdate/ WhoUpdate existiert noch nicht
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Prüfung vor Update, DirtyRecord(" & frm.Name & " )"
        Resume ErrEnd
    End Select
End Function
Public Function OH_Validate(ctl As control, strName As String, Optional blFocus As Boolean = True) As Boolean
'bringt msgbox, wenn ein Muss-Feld nicht ausgefüllt ist!
On Error GoTo ErrMsg
    Dim strCtl As String
    OH_Validate = False
    strCtl = Nz(ctl, "")
    Select Case strCtl
    Case "", ".", ",", " ", "?"
        If blFocus = True Then
            ctl.SetFocus
        End If
        OH_Validate = True
        s = "Das Feld " & strName & " ist ein <Muss>-Feld und darf nicht leer sein." & vbNewLine & _
                  "Weiterhin sind <.> Punkt, <,> Komma, <?> Fragezeichen und <Blank/Leerschlag> nicht erlaubt." & vbNewLine & vbNewLine & _
                  "Der Cursor wird jetzt in dieses Feld gesetzt, bitte richtig ausfüllen!" & vbNewLine & vbNewLine & _
                  vbTab & vbTab & "< " & strName & " >  fehlt/falsch!"

        t = strName & ": "
        If IsNull(ctl) Then
            t = t & "Fehlende Eingabe"
        Else
            t = t & "Falsche Eingabe"
        End If
        MsgBox s, vbExclamation, t
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_Validate : prüfe auf Null-Werte"
    Resume ErrEnd
End Function
Public Function OH_FB(frmFB As Form, _
                    strLinkBookmark As String, _
                    Optional strFocus As String, _
                    Optional blMldg = False) As Boolean
On Error GoTo ErrMsg
    Dim rsD As dao.Recordset
    Dim rsa As ADODB.Recordset
    Dim strF0 As String
    Dim strErr As String
'suche eine Datensatz im Formular über Bookmarks
    If right(Trim(strLinkBookmark), 1) Like "=" Then
        MsgBox "Die Datensatzsuche sollte kontrolliert werden!", vbCritical, "OH_FB " & strLinkBookmark
        GoTo ErrEnd
    End If
    If frmFB.RecordSource = "" Then
        GoTo ErrEnd
    End If
    If strLinkBookmark = "ID = 0 " Then
        GoTo ErrEnd
    End If
    strLinkBookmark = Replace(strLinkBookmark, " in ", " = ")
    Select Case left(frmFB.RecordSource, 4)
    Case ""
        GoTo ErrEnd
    Case "EXEC"
        OH_r rsa, frmFB.RecordSource, , , True
        strF0 = rsa.Fields(0).Name
        If rsa.BOF Then
            GoTo ErrEnd
        End If
        rsa.Find strLinkBookmark
        If rsa.EOF Then
            GoTo ErrM
        Else
            OH_FB = True
            frmFB.Bookmark = rsa.Bookmark
        End If
    Case Else
        Set rsD = frmFB.RecordsetClone
        strF0 = rsD.Fields(0).Name
        If rsD.BOF Then
            GoTo ErrEnd
        End If
        rsD.FindFirst strLinkBookmark
        If rsD.EOF Then
            GoTo ErrM
        Else
            OH_FB = True
            frmFB.Bookmark = rsD.Bookmark
        End If
    End Select
    If Len(strFocus) > 0 Then
        frmFB(strFocus).SetFocus
    End If
ErrEnd:
    Exit Function
ErrMsg:
    strErr = vbNewLine & Err & " " & Err.Description
    t = "OH_FB Bookmarks :Philipp informieren"
    blMldg = True
    Resume ErrM
ErrM:
    s = "Der Datensatz konnte nicht gefunden werden!" & vbNewLine & _
        "Überprüfen Sie bitte ihre Filtereinstellungen!" & vbNewLine & _
        strLinkBookmark & strErr

    SysCmd acSysCmdSetStatus, s
    If blMldg Then
        MsgBox s, vbCritical, t
    End If
    OH_FB = False
    GoTo ErrEnd
End Function
Public Function OH_PrintReport(frmP As Form, _
                                lgFilter As Long, _
                                strRpt As String, _
                                Optional strReportTitel As String, _
                                Optional lgReportNr As Long = 0) As Long
On Error GoTo ErrMsg
    Dim strID As String
    Dim actualRecord
    Dim lgid As Long
    Dim rpt As Report
    OH_SaveRS frmP
    OH_ResetID 'zurücksetzen
    Select Case lgFilter
    Case 1
        'strlink : siehe "Herkunftsformular Screen.ActiveForm
        OH_PrintReport = 1
        OH_InsertID frmP!f0, strReportTitel
    Case 2
        OH_PrintReport = Nz(frmP!countRec, 0)
        If OH_PrintReport > 0 Then
            OH_InsertID_LST frmP!lstDet
        End If
    Case 3
        strSQL = "Exec dbo.spI_Marker '" & frmP.Tag & "','0','C'"
        OH_r r
        OH_PrintReport = r!UsersMarker
        If OH_PrintReport > 0 Then
            strSQL = "Exec dbo.spI_Marker '" & frmP.Tag & "','0','F'"
            OH_EX
        End If
    Case 4
        OH_PrintReport = OH_InsertID_ALL(frmP)
    Case 5 'rechnung auf Leistung
        lgid = frmP!NrVGdetR
        strSQL = "Exec dbo.spI_ID 'InsertID_VGdetR'," & lgid
        OH_r r
        OH_PrintReport = r(0)
    End Select
    'Nur wenn NICHT  "NichtDrucken" übergeben wird, wird der Druck gestartet
    t = strReportTitel
    Select Case strRpt
    Case "NichtDrucken"
    Case Else
        If OH_PrintReport > 0 Then
            If lgReportNr = 132 And strRpt = glstrB_VG Then
                DoCmd.OpenReport strRpt, acPreview, , , , frmP.Name
                DoCmd.PrintOut acPages, 1, 1
                DoCmd.Close acReport, glstrB_VG
                GoTo ErrEnd
            End If
            Select Case strRpt
            Case "B_Brief"
                OH_setBriefInfo frmP
                strRpt = glstrB_VG
            End Select
            If strRpt = glstrB_VG And frmP.Name = "F_VG" Then
                OH_PrintReport = OH_CheckB_VG
                If OH_PrintReport = 0 Then
                    GoTo ErrEnd
                End If
                If frmP!NrQK = 37 Then
                    strSQL = "Exec spa_B " & _
                        "@x = 'rptAnalysenzertifikat' " & _
                        ",@id = " & frmP!NrVG
                    OH_r r
                    If r!CT > 0 Then
                        DoCmd.OpenReport "rptAnalysenzertifikat", acViewPreview
                    End If
                End If
            End If
            DoCmd.OpenReport strRpt, acPreview, , , , frmP.Name
            DoCmd.RunCommand gllgSizePreview
            SysCmd acSysCmdSetStatus, "Seiten-Ansicht " & strRpt & " mit Anzahl Datensätze: " & OH_PrintReport
            If lgReportNr > 0 Then
                OH_setPrinter Reports(strRpt), lgReportNr, , frmP.Name
            End If
        End If
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    OH_PrintReport = 0
    Select Case Err
    Case 2501
        Resume ErrEnd
    Case 2501000
        MsgBox "Keine Daten vorhanden!", vbCritical, strRpt & " " & frmP.Caption
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_PrintReport " & strRpt
    End Select
    Resume ErrEnd
End Function
Public Sub OH_Sort(Optional strFieldName As String)
On Error GoTo ErrMsg
    'Sortierfunktion erwartet, dass der Name des aktuellen Feldes so heisst:
    'Beispiel: btn2==> sortiert im aktuellen Formular nach dem Feld "f2"
    'Die letzten 2 Sortierungen werden "zwischengespeichert" und an die neue Sortierung angehängt.
    Dim frmSort As Form
    Dim ctlSort As control
    Dim strSort As String
    Dim strSortOld As String
    Dim strO As String
    Dim strS As String
    DoEvents
    Set frmSort = OH_tlbStartForm
    Set ctlSort = Screen.ActiveControl
    strSortOld = frmSort.OrderBy
    Dim N As Long
    If Len(strFieldName) = 0 Then
        If left(ctlSort.Name, 3) = "btn" Then
            strSort = frmSort("f" & Mid(ctlSort.Name, 4)).ControlSource 'sort wegnehmen!
        End If
    Else
        strSort = strFieldName
    End If
    strS = "a"
    If Len(strSort) > 0 Then
        Select Case left(strSortOld, Len(strSort) + 1)
        Case strSort & " ", ""
            strO = strSort
            If Len(strSortOld) > Len(strSort) + 5 Then
                strO = strO + right(strSortOld, Len(strSortOld) - Len(strSort) - 5)
            End If
        Case strSort & ",", strSort
            strO = strSort & " DESC"
            If Len(strSortOld) > Len(strSort) Then
                strO = strO + right(strSortOld, Len(strSortOld) - Len(strSort))
            End If
            strS = "d"
        Case Else
            For i = 3 To Len(strSortOld)
                If Mid(strSortOld, i, 1) Like "," Then
                    N = N + 1
                    If N = 2 Then
                        strSortOld = left(strSortOld, i - 1)
                        Exit For
                    End If
                End If
            Next i
            strO = strSort & ", " & strSortOld
        End Select
        frmSort.OrderByOn = True
        frmSort.OrderBy = strO
    End If
    Select Case right(ctlSort.Caption, 2)
    Case " A", " D"
        ctlSort.Caption = left(ctlSort.Caption, Len(ctlSort.Caption) - 2) & " " & strS
    Case Else
        ctlSort.Caption = ctlSort.Caption & " " & strS
    End Select
    Set frmSort = Nothing
    Set ctlSort = Nothing
ErrEnd:
    Exit Sub
ErrMsg:
    'OH071226
    Select Case Err
    Case 30020
        frmSort.OrderBy = strSort
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "sortieren in der Tabellenansicht"
    End Select
    Resume ErrEnd
End Sub
Public Function StopAction(frmC As Form)
    StopAction = False
    If frmC.CurrentRecord = 0 Then
        If MsgBox("<" & frmC.Caption & "> beinhaltet keine Datensätze!" & vbNewLine & _
               "Bitte zuerst den oder die gewünschten Datensätze auswählen!" & vbNewLine & _
               "Soll der Filter aufgehoben werden?", _
               vbCritical + vbYesNo, frmC.Caption) = vbYes Then

            frmC.FilterOn = False
        End If
        StopAction = True
    End If
End Function
Public Function OH_DatePlusMinus(ctl As control, KeyAscii As Integer)
'über Datum mit + oder minus-Taste ändern
On Error GoTo ErrMsg
    If KeyAscii = 43 Then          '43 ANSI-Code für + Taste
        ctl = Nz(ctl, 0 - 1) + 1  'Datum um einen Tag erhöhen
        KeyAscii = 0   'verhindern daß + Zeichen angezeigt wird
    End If
    If KeyAscii = 45 Then          '45 ANSI-Code für - Taste
        ctl = Nz(ctl, 0 + 1) - 1   'Datum um einen Tag verringern
        KeyAscii = 0    'verhindern daß - Zeichen angezeigt wird
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_DatePlusMinus"
    Resume ErrEnd
End Function
Public Sub OH_onlyNumeric(KeyAscii As Integer)
On Error GoTo ErrMsg
    ' Umwandeln einer Eingabe in Leerzeichen, wenn nicht numerisch
    Dim varLetter
    Select Case KeyAscii
    Case 8, 9, 13, 27, 32, 35, 40, 41, 43
        '8:Rücktaste, 32:Leerzeichen, 9:Tab,27:escape,43:+Zeichen,
        '45:-Zeichen, 40 und 41 ()Klammern
    Case Else
        varLetter = Chr(KeyAscii)
        If Not IsNumeric(varLetter) Then
            s = "Bitte verwenden Sie nur Zahlen oder Leerzeichen!" _
                        & vbNewLine & "< " & varLetter & " > ist nicht erlaubt!"
            t = varLetter & " wird ersetzt durch Leerzeichen!"
            MsgBox s, 64, t
            KeyAscii = 32
        End If
    End Select
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Sub OH_FirstUcase(ctl As control)
' Umwandeln des ASCII-Wertes in eine Zeichenfolge.
    ' Umwandeln des Zeichens in einen Großbuchstaben und dann in
    ' einen ASCII-Wert.
    ctl = Trim(ctl)
    If Not IsNull(ctl) Then ctl = Chr(Asc(UCase(ctl))) & right(ctl, Len(ctl) - 1)
End Sub
Public Function OH_GetPathPart(strPath As String) As String
  ' Comments  : Returns the path part of a string
  ' Parameters: strPath - string to parse
  ' Returns   : path part
  For i = Len(strPath) To 1 Step -1
    If Mid(strPath, i, 1) = "\" Then
      Exit For
    End If
  Next i
  OH_GetPathPart = left(strPath, i)
End Function
Public Function OH_GetPathPartFE() As String
  ' Comments  : Returns the path part of a the current Project
  ' Parameters: strPath - string to parse
  ' Returns   : path part
  'OH071226
  OH_GetPathPartFE = OH_GetPathPart(CurrentProject.FullName)
End Function
Public Function OH_GetNamePart(strIn As String) As String
  ' Comments  : Returns the name and extension of a fully qualified file name
  ' Parameters: strIn - path and name to parse
  ' Returns   : file name + extension
  Dim strTmp As String
  For i = Len(strIn) To 1 Step -1
    If Mid(strIn, i, 1) <> "\" Then
      strTmp = Mid(strIn, i, 1) & strTmp
    Else
      Exit For
    End If
  Next i
  OH_GetNamePart = strTmp
End Function
Public Function OH_Checkgroup(lgResp, strKZ As String)
    Dim strRespGroup As String
    'OH071229
    'wenn der akt. User nicht gleich dem Daten-Verantwortlichen (RespUpdate) feststellen,
    'ob akt. User in der gleichen Gruppe wie der RespUpdate
    OH_Checkgroup = True
    If glAdmin Then
        OH_Checkgroup = False
        Exit Function
    End If
    If lgResp = lguser Then
        OH_Checkgroup = False
    Else
        strSQL = "Exec dbo.spI_User '" & strKZ & "'"
        OH_r r
        If r.BOF Then
            OH_Checkgroup = True
        Else
            strRespGroup = r!Roles
        End If
        If InStr(1, strRole, strRespGroup) = 0 Then
            MsgBox strUser & " < " & strRole & " > ist für den Bereich " & strRespGroup & " nicht zuständig! " & vbNewLine & _
                       "Ihre Änderungen werden nicht akzeptiert!" & vbNewLine & vbNewLine & _
                       "Wenden Sie sich bitte an Ihren Administrator!" & vbNewLine & _
                       "oder an " & strKZ, _
                       vbCritical, "Keine Änderungen!"
        Else
            OH_Checkgroup = False
        End If
    End If
End Function
Public Function OH_GetActuser() As Long
'Übergabe des aktueller Users
    OH_GetActuser = lguser
End Function
Public Function OH_CheckAdmin(varWhat As Variant, Optional blNoMldg As Boolean = False) As Boolean
'feststellen, ob aktueller User in Gruppe "Admins" ist
    Select Case left(varWhat, 1)
    Case "+"
        If glAdmin Then
            OH_CheckAdmin = False
        Else
            OH_CheckAdmin = True
            If blNoMldg = False Then
                MsgBox "Nur ADMIN kann " & varWhat & " löschen/ändern!", vbCritical, "Prüfe Rechte"
            End If
        End If
        OH_ResetRS r
    End Select
End Function
Public Function OH_checkCompany(strCU As String) As Long
' OHNEMUS, Sonntag, 28. Oktober 2007
On Error GoTo ErrMsg
    OH_checkCompany = 0
    strSQL = "Exec dbo.spI_checkCompany"
    OH_r r
    'Bestimmen der Daten der eigenen Firma
    '=======================================================
    s = "Diese Applikation läuft nur richtig, wenn alle Bedingungen erfüllt sind!" & vbNewLine & _
              "Das ist hier nicht der Fall." & vbNewLine & _
              "User muss als Mitarbeiter erfasst sein und als Stichwort >+Userid< besitzen." & vbNewLine & _
              "im SQL-Server muss er als User mit Berechtigung ebenfalls angelegt sein."
    t = strCU & "==>  Ihr Administrator!"
    If r.BOF Then
        MsgBox s, vbCritical, t
        GoTo ErrEnd
    Else
        If IsNumeric(r(0)) Then
            EFFirma = r!EFFirma
            EFNr = r!EFNr
            lguser = r!lguser
            lgUserNrAdr = r!lgUserNrAdr
            strUserKZ = Nz(r!strUserKZ, "FEHLT")
            strUser = r!strUser
            OH_checkCompany = r!EFNrFktn
            glMWStPflichtig = r!MWStPflichtig
        Else
            s = s & vbNewLine & _
                   "Das ist hier nicht der Fall:" & vbNewLine & vbNewLine & _
                   r(0)
            MsgBox s, vbCritical, t
            GoTo ErrEnd
        End If
    End If
        'checke ob User nur bestimmte Adressen sehen darf OHxxxx
'    strSQL = "Select Bemstichwort as sec from A_StichwortFunktion " & _
'           " where Stichwort like '+AdrSecurity' and " & _
'           " NrFunktion = " & lgUser
'    OH_R rs
'    strSQL = "SELECT T_Adresse.*, IIf(InStr([Du],OH_getUserKZ())>0,0,-1) AS DuSie FROM T_Adresse "
'    If Not rs.BOF Then
'        strSQL = strSQL & "where AdrSecurity in (0," & rs!sec & ")"
'    End If
'    strSQL = strSQL & ";"
'    If db.QueryDefs("A_Adresse").SQL <> strSQL Then
'        db.QueryDefs("A_Adresse").SQL = strSQL
'    End If

    'Logo suchen


    OH_ResetRS r

ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_checkCompany"
    End Select
    Resume ErrEnd
' Ende des Fehlerhandlerblocks.
End Function
Public Function OH_GetInfoGeneral()
' OHNEMUS, Montag, 11. September 2006
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spa_Menu " & _
            " @x = 'lstI'," & _
            " @d = '" & OH_AppProjectName & "'," & _
            " @i = 1"
    OH_r r
    strVersion = r!Version
    strSQL = "Exec dbo.spa_Menu " & _
                "@x = 'Database'" & _
                ",@i = " & EFNrFktn
    OH_r r
    glChangecontrol = r!glChangecontrol
    glArtikelpreis = r!glArtikelpreis
        'festlegen, ob beim Fax eine 0 vorangestellt werden muss
    glFaxFührende0 = r!glFaxFührende0
    glstrFieldAdresse = r!glstrFieldAdresse
    glstrFieldVG = r!glstrFieldVG
    glstrFontA = Nz(r!glstrFontA, "Arial")
    glstrFont = glstrFontA
    glstrFontEmail = r!glstrFontEmail
    glstrFontSizeEmail = r!glstrFontSizeEmail
    glstrPS = r!glstrPS
        'festlegen, ob im B_VG die Gruppe gfID ausgedruckt werden soll 100625
    glGFIDnotvisible = Val(r!glGFIDnotvisible)
        'festlegen, wie der Artikel ausgedruckt werden soll
    glintArtikeltext = Val(r!glintArtikeltext)
        'festlegen, wie sich der Cursor in VG-Artikeln bewegen soll
    glintCursor_in_UF_VGDet = Val(r!glintCursor_in_UF_VGDet)
        'festlegen, wo der Cursor beim Aktivieren stehen soll (Lexikon)
        'ist als Globale abgelegt, damit nur einmal im Lexikon geschaut werden muss!
    glstrStartCursor_in_PF_Artikel = r!glstrStartCursor_in_PF_Artikel
    glsgRunden = Val(r!glsgRunden)    'Rundungsfaktor im Lexikon abgelegt "Runden auf Ausdruck"
    glsgPreisFaktor = Val(r!glsgPreisFaktor)    'festlegen eines Preisfaktors, mit dem  Verkaufspreise beeinflusst werden.
    If glsgPreisFaktor > 2 Then
        MsgBox "Bitte überprüfen Sie Ihren Preisfaktor" & vbNewLine & vbNewLine & _
                "aktueller Preisfaktor: " & glsgPreisFaktor & vbNewLine & vbNewLine & _
               "siehe Lexikon Gruppe <Database>, Begriff <genereller Preisfaktor>", _
               vbExclamation, "Komma und Punkt verwechselt??"
    End If
    glstrLagerKontrolle = r!glstrLagerKontrolle    'festlegen ob eine Lagerkontrolle durchgeführt werden soll
    glBackColor = r!glBackColor    'festlegen der Hintergrundfarbe
    glStrExplorerProjekt = r!glStrExplorerProjekt    'Ablage der Projekte
    glStrExplorerProjektFormat = r!glStrExplorerProjektFormat
    glintPF_ArtikelmitTechDat = r!glintPF_ArtikelmitTechDat
    glstrFormatAnzahl = r!glstrFormatAnzahl
    glstrBarcode = Nz(r!Barcode, "")
    OH_AddAppProperty "AppTitle", DB_TEXT, strVersion
    Application.RefreshTitleBar
        'Application Icon definieren
    s = r!AppIcon
    If Len(Dir(s)) = 0 Then
        s = OH_GetPathPart(CurrentProject.FullName) & "Firma.ico"
    End If
    If Len(Dir(s)) > 0 Then
        OH_AddAppProperty "AppIcon", DB_TEXT, s
    End If
    OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_GetInfoGeneral"
    End Select
    Resume ErrEnd
End Function
Public Function OH_TranslateByLEO(strL As String, strW As String)
On Error GoTo ErrMsg
    If strW <> vbNullString Then
        'strL = "http://dict.leo.org/" & strL & "de?lp=" & strL & "de&search=" & strW
               'http://dict.leo.org/ende?lp=ende&lang=de&searchLoc=0&cmpType=relaxed&sectHdr=on&spellToler=&search=testing
'strL = "https://dict.leo.org/ende?lp=ende&lang=" & strL & "&searchLoc=0&cmpType=relaxed&sectHdr=on&spellToler=&search=" & strW
        strL = "https://dict.leo.org/" & strL & "-deutsch/" & strW & "?side=right"
        DoCmd.Hourglass True
        OH_LaunchURL 1, strL
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description & vbNewLine & " Check: " & s, vbCritical
    Resume ErrEnd
End Function
Public Function OH_tlbZoom()  ' aktuelles feld zoomen
' OHNEMUS, Donnerstag, 12. August 2004
' Hinweise : Erforderlich ist PF_MsgBox
On Error GoTo ErrMsg
    Dim strT As String '240930 Überschrift definieren
    Dim ctlact As control
    Dim strA(1 To 6) As String
    Dim varF As Variant
    Dim lgid As Long
    Set ctlact = Screen.ActiveControl
    varF = "OH_NIX"
    t = "Zoomen des aktuellen Feldes " & ctlact.Name & " " & ctlact.ControlTipText
    strA(1) = "OK"
    strA(2) = "Eintrag in Zwischenablage kopieren"
    strA(3) = "Eintrag löschen"
    Select Case ctlact.ControlType
    Case acTextBox, acComboBox
        OH_msgbox Nz(ctlact.Value), Array(strA(1), strA(2), strA(3)), vbInformation, t, _
                 "Feldname: " & ctlact.Name & vbNewLine & _
                 "Feldtyp: " & ctlact.ControlType & vbNewLine & _
                 "Tiptext: " & ctlact.ControlTipText & vbNewLine & vbNewLine & _
                 "Sie können den Eintrag ändern oder komplett löschen."
        Select Case strMSG(2)
        Case strA(1)
            If strMSG(5) Like "" Then
                If IsNull(ctlact) = False Then
                    varF = Null
                End If
            Else
                If Nz(ctlact) <> strMSG(5) Then
                    varF = strMSG(5)
                End If
            End If
        Case strA(2)
            If IsNull(ctlact) = False Then
                OH_CB ctlact.Value
            End If
        Case strA(3)
            If IsNull(ctlact) = False Then
                varF = Null
            End If
        End Select
        If Nz(varF) <> "OH_NIX" Then
            If ctlact.Locked = True Then
                MsgBox "Dieses Feld ist gesperrt für Änderungen!", vbExclamation, t
            Else
                ctlact = varF
            End If
        End If
    Case acListBox
        Select Case ctlact.Name
        Case "lststichwort"
            lgid = ctlact.Value
            strT = "Zoome Bemerkung aus Liste der Stichworte zu <" & ctlact.column(2) & ">"
            strA(4) = "Exec dbo.spa_Stichwort" & _
                    "  @st = 41 " & _
                    ", @id = " & lgid
            strSQL = strA(4) & _
                ",@o ='show'"
            OH_r r
            If r.BOF Then
                s = "Keine Bemerkung gefunden!"
                t = strT
                GoTo ErrM
            End If
            strA(5) = Nz(r!b)
            strA(6) = ""
            If InStr(ctlact.RowSource, "NrVGDET") > 0 Then
                strA(6) = "OK, auch im Stammartikel ändern!"
            End If
            OH_msgbox strA(5), Array(strA(1), strA(6), strA(2), strA(3)), vbInformation, strT, _
                     "Ändern Sie hier die Bemerkung des aktuellen Stichwortes!" & vbNewLine & vbNewLine & _
                     "Sie können den Eintrag ändern oder komplett löschen." & vbNewLine & _
                     "Zeilenumsprung mit Enter möglich"
            Select Case strMSG(2)
            Case "Abbrechen", ""
                GoTo ErrEnd
            Case strA(2)
                OH_CB strA(5)
                GoTo ErrEnd
            Case strA(3)
                strMSG(5) = ""
            End Select
            If strA(5) <> strMSG(5) Then
                strSQL = strA(4) & _
                    ", @fi ='" & strMSG(5) & _
                    "',@o ='save'"
                If strMSG(2) = strA(6) Then
                    strSQL = Replace(strSQL, "'save'", "'saveArtikel'")
                End If
                OH_EX
                OH_RQ ctlact
            End If
        Case Else
            s = "Zoomen geht nicht mit dieser Liste NICHT!"
            GoTo ErrM
        End Select
    Case Else
        s = "Zoomen geht nicht mit diesem Feld-Typ!"
        GoTo ErrM
    End Select
ErrEnd:
    Set ctlact = Nothing
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
End Function
Public Function OH_HelpMsgBox(frm As Form) ' Hilfe als MsgBox starten
On Error GoTo ErrMsg
    Dim ctlName As String, ctlTip As String
    Dim varButton As Variant
    Dim strHilfetext As String
    Dim strHilfe As String
    Dim strH As String
    Dim lgid As Long
    Dim lgBoss As Long
    Set ctl = Screen.ActiveControl
    strlink = "Formname= '" & frm.Name & "' and fieldname=  '"
    If Len(frm.Tag) > 0 Then
        strH = frm.Tag
    Else
        strH = frm.Caption
    End If
    ctlName = ctl.Name
    If ctl.ControlType = acTabCtl Then
        ctlTip = ctl.pages(ctl).ControlTipText
        strlink = strlink & ctl.pages(ctl).Name & " '"
    Else
        ctlTip = ctl.ControlTipText
        strlink = strlink & ctlName & " '"
    End If
    strSQL = "Exec dbo.spa_Lexikon " & _
        " @x = 'GetInfoHelp'" & _
        ",@d = '" & frm.Name & _
        "',@f = '" & ctl.Name & "'"
    OH_r r
    If r.BOF Then
        s = ""
    Else
        s = Nz(r!Beschreibung, "")
        lgid = r!nrlexikon
        lgBoss = r!NrBoss
    End If
    If s Like "" Then
        strHilfe = vbNewLine & "Es ist kein Hilfetext vorhanden!" & vbNewLine & _
                   "Sie können den vorgeschlagenen Kurz-Hilfetext unten editieren und " & _
                   " anschliessend im Lexikon eine ausführliche Beschreibung eintragen!"
        varButton = Array("Hilfe nicht erforderlich!", "Hilfetext erstellen")
        If ctlTip Like "" Then
            strHilfetext = "Hier Hilfetext eintragen"
        Else
            strHilfetext = ctlTip
        End If
    Else
        s = "Hilfetext:" & vbNewLine & _
                  "===========" & vbNewLine & s
        varButton = Array("ok. und schliessen", "Hilfetext editieren")
    End If
    If Not ctlTip Like "" Then
        s = "Tiptext: " & ctlTip & vbNewLine & s
    End If
    s = "Formular: " & strH & vbNewLine & _
              "Feldname: " & ctlName & vbNewLine & s & strHilfe
HelpAgain:
    OH_msgbox s, varButton, _
                        vbInformation, _
                        "Hilfe-Informationen zum aktuellen Feld", _
                        "Alle Hilfe-Infos können Sie im Lexikon pro Feld selbst erstellen und ablegen!", _
                        strHilfetext
    Select Case Val(strMSG(1))
    Case 2
        If Len(strMSG(3)) > 3 Then
            If InStr(strMSG(3), "Hier Hilfetext eintragen") > 0 Then
                s = s & vbNewLine & "Den Hilfetext sollten Sie schon abändern!!!!"
                GoTo HelpAgain
            End If
            Select Case strH
            Case "Funktion"
                strH = "Adressen"
            Case "Begriff"
                strH = "Begriffe"
            Case "Leistung"
                strH = "Lesitungen"
            End Select
            strSQL = "Exec dbo.spa_Lexikon" & _
                    "  @x = 'InsertLex'" & _
                    ", @d = '" & strH & _
                    "',@f = '" & strMSG(3) & _
                    "',@e = '" & strMSG(3) & _
                    "',@s = '" & ctl.Name & _
                    "',@w =  '" & frm.Name & "'"
            OH_r r
            lgid = r!ID
            lgBoss = r!NrBoss
        End If
        OH_OF "F_Lexikon"
        Set frm = Forms!F_Lexikon
        frm.OH_FindLex lgBoss, lgid
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_Openlexikon(Optional strGrp As String, _
                               Optional strbegriff As String, _
                               Optional strHinweis As String, _
                               Optional strField As String, _
                               Optional frmL As Form, _
                               Optional blBegriff = True)
On Error GoTo ErrMsg
    'Diese Funktion setzt voraus:
    'Öffnen mit einem Button mit diesem Namen: btn"Gruppe" (Gruppe im Lexikon, unter Feldnamen eingetragen)
    'das Formular enthält ein Steuerelement mit dem Namen "Gruppe"
    '(Beispiel btnBau mit Steuerelement "Bau")
    Dim strLinkL As String
    Dim strArr As Variant
    Dim strhelp
    Dim lgCount As Long
    Dim vararray As Variant
    Dim strL As String
    Dim lgid As Long
    Dim lgBoss As Long
    Dim lgAntw As Long
    Dim strA(1 To 6) As String
    If OH_Perm("i", frmL, "Lexikon") Then
        GoTo ErrMsg
    End If
    OH_closeObj "PF_msgbox"
    DoEvents
    lgCount = 0
    If frmL Is Nothing Then
        OH_CheckFrm
    Else
        Set frm = frmL
    End If
    If Len(strField) = 0 Then
        x = Screen.ActiveControl.Name
        If left(x, 3) = "btn" Then
            x = right(x, Len(x) - 3)
        End If
    End If
    If Len(strField) = 0 Then
        strField = x
    End If
    If Len(strGrp) = 0 Then
        strGrp = x
    End If
    t = "Lexikon-Eintrag: " & strGrp
    strLinkL = "Gruppe like '" & strGrp & "'"
    If strbegriff <> "" Then
        strLinkL = strLinkL & " and Begriff = '" & strbegriff & "'"
    End If
    strhelp = "Im Lexikon können Sie Einträge als Vorgabe-Werte eintragen, " & _
              "die Sie dann aus der Liste auswählen können!" & vbNewLine & _
              "Wenn Sie einen neuen Eintrag vornehmen, schliessen Sie" & vbNewLine & _
              "das aktuelle Formular " & frm.Caption & " und öffnen es dann wieder, " & _
              "um die Anzeige zu aktualisieren!"
    strSQL = "Select NrLexikon, " & _
           " LexikonNr as Nr, " & _
           " Begriff, " & _
           " Beschreibung " & _
           " from A_Lexikon " & _
           " Where " & strLinkL & _
           " order by LexikonNr;"
    OH_r r
    strA(1) = "Neuer Eintrag in Lexikon"
    strA(2) = "Abbrechen"
    If r.BOF = True Then
        lgCount = 0
        vararray = Array(strA(1), strA(2))
        strSQL = ""
        s = vbNewLine & "Noch keine Lexikon-Einträge erfasst für die Gruppe" & vbNewLine & _
            "<" & strGrp & ">!"
        If strbegriff <> "" Then
            s = s & vbNewLine & " und Begriff = " & strbegriff
        End If
    Else
        r.MoveLast
        lgCount = r.RecordCount & ""
        strA(2) = "(" & lgCount & ") Lexikon öffnen, markierten suchen!"
        strA(3) = "Mark. Begriff eintragen"
        strA(4) = "Mark. Beschreibung eintragen"
        strA(5) = "Liste öffnen"
        strA(6) = "Eintrag löschen"
        vararray = Array(strA(2), strA(1), strA(3), strA(4), strA(5), strA(6))
        strhelp = strhelp & vbNewLine & _
                 "Sie können auch mit einem Doppel-Klick auf den gewünschten Eintrag in der Liste direkt zu diesem Lexikon-Eintrag gelangen!"
    End If
    OH_ResetRS r
    OH_msgbox s, vararray, vbQuestion, t, strhelp, , , strSQL, 4, "0;10;50"
    Select Case strMSG(2)
    Case strA(1)
        strSQL = "Exec dbo.spa_Lexikon " & _
                " @x = 'InsertLex' " & _
               ", @d = '" & strGrp & "'"
        OH_r r
        lgid = r!ID
        lgBoss = r!NrBoss
        strMSG(3) = lgid
        lgid = Val(strMSG(3))
        OH_OF "F_Lexikon", lgid
        Set frm = Forms!F_Lexikon
        frm.OH_FindLex lgBoss, lgid
    Case strA(2)
        If strA(2) <> "Abbrechen" Then
            OH_OF "F_Lexikon", Val(strMSG(3))
        End If
    Case strA(3), strA(4)
        strL = "Begriff"
        If strMSG(2) = strA(4) Then
            strL = "Bemlexikon"
        End If
        strSQL = "Exec dbo.spa_Lexikon " & _
                    " @x = 'LookupField' " & _
                   ", @i = " & Val(strMSG(3))
        OH_r r
        frm(strField) = r(strL)
    Case strA(5)
        If strField = "Schluss" Then
            strField = "ComSchluss"
        End If
        frm(strField).SetFocus
        frm(strField).Dropdown
    Case strA(6)
        frm(strField) = Null
        If frm(strField).Tag = "VGDET" Then
            frm.OH_ChangeVGdet
        End If
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_OpenLexikon"
    Resume ErrEnd
End Function
Public Function OH_Menu() ' schliesst alle Formulare  mit Ausnahme der unten aufgelisteten und öffnet Menu
On Error GoTo ErrMsg
    Dim rpt As Report
    Dim tbl As Table
    DoCmd.openForm "Menu"
    For Each frm In Forms
        Select Case frm.Name
        Case "menu"
        Case Else
            DoCmd.Close acForm, frm.Name
        End Select
    Next frm
    For Each rpt In Reports
        DoCmd.Close acReport, rpt.Name
    Next rpt
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function Fehlertesten(lgErr As Long)
' Bei Auftreten eines Fehlers Fehlermeldung erstellen
On Error Resume Next    ' Fehlerbehandlung zurückstellen.
Err.Clear
Err.Raise lgErr ' Überlauffehler" auslösen.
' Auf Fehler überprüfen, dann Meldung anzeigen.
If Err.number <> 0 Then
    s = "Fehler-Nr. " & str(Err.number) & " wurde ausgelöst von " _
            & Err.Source & vbNewLine & vbNewLine & Err.Beschreibung
    MsgBox s, , "Fehler", Err.HelpFile, Err.HelpContext
End If
End Function
Public Function OH_TopLST(frm As Form, _
                         Optional lgTop As Long = 100, _
                         Optional lgA As Long = 2) As Long
On Error GoTo ErrMsg
    Dim strf As String
    strf = Mid(frm.Name, 3)
    strSQL = "Exec dbo.spA_" & strf & " comtop"
    OH_A "comTop", strSQL, frm
    strSQL = "Exec dbo.spA_" & strf & _
                "  @x = 'top'" & _
                ", @i = " & Nz(frm!comTop, 1) & _
                ", @a = " & lgTop & _
                ", @f = " & lgA
    OH_A "lstTop", strSQL, frm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_TopLST"
    Resume Next
End Function
Public Function OH_MarkerLST(frm As Form) As Long
On Error GoTo ErrMsg
    Dim strf As String
    Dim ctlM As control
    Dim ctlMdo As control
    strf = Mid(frm.Name, 3)
    strSQL = "Exec dbo.spA_" & strf & " markiert"
    Select Case strf
    Case "Leistung"
        Set ctlM = frm!lstD
        Set ctlMdo = frm!lstact
    Case Else
        Set ctlM = frm!lstM
        Set ctlMdo = frm!lstMdo
    End Select
    OH_A ctlM.Name, strSQL, frm
    OH_MarkerLST = ctlM.ListCount - 1
    If OH_MarkerLST < 0 Then
        OH_MarkerLST = 0
    End If
    frm!countM = OH_MarkerLST
    strSQL = "Exec dbo.spi_Marker " & _
            " @art = 'L'" & _
            ",@tag = '" & strf & "'"
    OH_A ctlMdo.Name, strSQL, frm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerLST"
    Resume Next
End Function
Public Function OH_MarkerYesOne(frm As Form)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strID As String
    strf = Mid(frm.Name, 3)
    strID = "Nr" & strf
    Select Case strf
    Case "Adresse"
        strf = "Funktion"
        strID = "NrFunktion"
    Case "QK"
        strID = "ID" & strf
    End Select
    strSQL = "spI_Marker '" & strf & "'," & frm(strID) & ",'A'"
    OH_EX
    OH_MarkerLST frm
    Select Case strf
    Case "Leistung"
        frm!lstD = frm(strID)
    Case Else
        frm!lstM = frm(strID)
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerYesOne"
    Resume Next
End Function
Public Function OH_MarkerNoOne(frm As Form)
On Error GoTo ErrMsg
    Dim strf As String
    Dim lgid As Long
    Dim ctlM As control
    strf = Mid(frm.Name, 3)
    Select Case strf
    Case "Leistung"
        Set ctlM = frm!lstD
    Case Else
        Set ctlM = frm!lstM
    End Select
    lgid = Nz(ctlM.column(0, ctlM.ListIndex + 2), 0)
    strSQL = "spI_Marker '" & strf & "'," & Nz(ctlM, 0) & ",'M'"
    OH_EX
    OH_MarkerLST frm
    ctlM = lgid
    ctlM.SetFocus
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerYesOne"
    Resume Next
End Function
Public Function OH_MarkerNo(frm As Form)
On Error GoTo ErrMsg
    Dim strf As String
    strf = Mid(frm.Name, 3)
    strSQL = "spI_Marker " & strf & ",0,'X'"
    OH_EX
    OH_MarkerLST frm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerNo"
    Resume Next
End Function
Public Function OH_MarkerYesSelected(frm As Form)
On Error GoTo ErrMsg
    Dim strf As String
    strf = Mid(frm.Name, 3)
    For Each x In frm!lstDet.ItemsSelected
        strSQL = "spI_Marker  " & strf & "," & frm!lstDet.column(0, x) & ",'A'"
        OH_EX
    Next x
    OH_MarkerLST frm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerNo"
    Resume Next
End Function
Public Function OH_MarkerYes(frm As Form)
On Error GoTo ErrMsg
    Dim strf As String
    strf = Mid(frm.Name, 3)
    For i = 0 To frm!lstDet.ListCount - 1
        strSQL = "spI_Marker  " & strf & "," & frm!lstDet.column(0, i) & ",'A'"
        OH_EX
    Next i
    OH_MarkerLST frm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_MarkerNo"
    Resume Next
End Function
Public Function OH_lstStichwortAct(frm As Form, _
                                   Optional lgact As Long = 0, _
                                   Optional strStGr As String = "")
On Error GoTo ErrMsg
    Dim strST As String
    Dim lgid As Long
    Dim lgW As Long
    Dim strA(1 To 5) As String
    DoCmd.Hourglass True
    t = "Stichworte " & frm!lstStichwortAct.column(1)
    Select Case lgact
    Case 11, 14, 20, 23, 30, 31, 32, 41, 201
        strST = Nz(frm!lstStichwort.column(2))
        If strST = "" Then
            s = "Bitte markieren Sie das betreffende Stichwort"
            GoTo ErrM
        End If
        lgid = frm!lstStichwort
    End Select
    Select Case lgact
    Case 0
        strSQL = "Exec dbo.spA_Stichwort " & _
                " @st = 50, " & _
                " @cID = '" & frm.Name & _
                "', @d = '" & strStGr & "'"
        If frm.Name = "F_Adresse" Then
            strSQL = strSQL & ", @i =" & frm!FP
        End If
        OH_A "lstStichwortAct", strSQL, frm
        t = "Liste der (frei wählbaren) Stichworte zu " & frm.Caption & vbNewLine & _
            "Doppel-Klick Stichwort: Stichworte bearbeiten" & vbNewLine & _
            "Doppel-Klick Bemerkung: Bemerkung bearbeiten" & vbNewLine & _
            "Doppel-Klick Hyperlink: Link öffnen, falls vorhanden"
        If frm.Name = "F_Adresse" Then
            t = t & vbNewLine & _
            "Beginnt das Stichwort mit 'Tel, Han, oder Mob'==>Telefonie starten" & vbNewLine & _
            "Beginnt es mit 'eMa'==> Outlook starten"
        End If
        frm!lstStichwort.ControlTipText = left(t, 255)
    Case 10
        OH_OpenStichwort frm, "Neu"
    Case 11
        OH_OpenStichwort frm
    Case 12     'Managen
        OH_OpenStichwort frm, "Manage", Nz(frm!lstStichwort.column(2), "")
    Case 13
        strSQL = frm!lstStichwort.Recordset.Source '180822

        'Bei VGdet Stichworte aus Artikel übertragen
        'Bei NrArtikel Stichworte aus Begriff übertragen
        If InStr(strSQL, "NrVGDET") + InStr(strSQL, "NrArtikel") > 0 Then
            t = "Hole Vorgaben von "
            If InStr(strSQL, "NrVGDET") > 0 Then
                s = frm!NrArtikel
                t = t & " Artikel " & left(frm!ArtikelText, 20) & "..."
            Else
                s = frm!Artikel
                t = t & " Begriff " & frm!Artikel
            End If
            strSQL = strSQL & _
                    ",@x = 'lstCopy'" & _
                    ",@fi = " & s & _
                    ",@st = 51"
            OH_r r
            If r.BOF Then
                s = "Keine zu übertragenden Stichworte gefunden!"
                GoTo ErrM
            End If
        strST = strSQL
        OH_OpenStichwort frm, "lstCopy", Nz(frm!lstStichwort.column(2), "")
        OH_A "lstcopy", strST, Forms!PF_Stichwort
        Else
            OH_lstStichwortAct frm, 12
            With Forms!PF_Stichwort
                !lstact.SetFocus
                !lstact = 2
                .lstAct_AfterUpdate
            End With
        End If
    Case 14 'kopieren',
        strSQL = "Exec dbo.spA_Stichwort " & _
                        " @st = 14" & _
                        ", @ID=" & lgid
        OH_EX
        OH_RQ frm!lstStichwort
    Case 15, 16, 17 'durchnummerieren... 16 nach oben, 17 nach unten
        DoEvents
        i = frm!lstStichwort.ListCount - 1
        Select Case i
        Case Is < 1
            s = "Kein Stichwort in der Liste"
            GoTo ErrM
        Case 1
            s = "Nur ein Stichwort in der Liste"
            GoTo ErrM
        End Select
        If lgact = 15 Then
            s = "Wie sollen die " & i & " Stichworte  neu durchnummeriert werden?" & vbNewLine & vbNewLine & _
                "1" & vbTab & "nach der Nummer" & vbNewLine & _
                "2" & vbTab & "alphabetisch nach dem Stichwort" & vbNewLine & _
                "3" & vbTab & "nach dem Erfassungsdatum" & vbNewLine & _
                "11" & vbTab & "Stichwort-Gruppe und Nummer" & vbNewLine & _
                "12" & vbTab & "Stichwort-Gruppe und Stichwort" & vbNewLine & _
                "13" & vbTab & "Stichwort-Gruppe und Erfassungsdatum"
            i = Val(InputBox(s, t, 1))
            Select Case i
            Case 1, 2, 3, 11, 12, 13
            Case Else
                GoTo ErrEnd
            End Select
        Else
            i = lgact
        End If
        strSQL = frm!lstStichwort.Recordset.Source
        If InStr(strSQL, "mitFilter") > 0 Then
            strSQL = Replace(strSQL, "mitFilter", "Durchnummerieren") & ",@f = 'NrFunktion',@st = " & i '250910
        Else
            strSQL = Replace(strSQL, "Stichwort ", "Stichwort @x = 'Durchnummerieren',@st = " & i & ",")
        End If
        strSQL = strSQL & ",@i = " & frm!lstStichwort
        OH_r r
        If r!CT > 0 Then
            OH_RQ frm!lstStichwort
        End If
    Case 20 'Nur markiertes löschen!'
        strlink = "NrStichwort = " & Nz(frm!lstStichwort, 0)
        strSQL = "Exec dbo.spA_Stichwort " & _
                        "@x = 'DeleteStichwort' " & _
                        ",@fi='" & strlink & "'"
        OH_EX
        OH_RQ frm!lstStichwort
        frm!lstStichwort = frm!lstStichwort.column(0, 1)
    Case 21 'löschen...'
        t = frm.pgStichwort.Caption & "  " & frm.Caption
        lgid = Nz(frm!lstStichwort.column(1), 0)
        s = ""
nochmal23:
        strA(1) = "lösche von Nr. " & lgid & " bis x"
        s = s & "Lösche Stichworte:" & vbNewLine & vbNewLine & _
                "<ALLE>" & vbNewLine & vbNewLine & _
                "<OHNE Bemerkung>" & vbNewLine & vbNewLine & _
                "<1, 2, 4 etc> (Nrn. mit Kommma oder Leerschlag getrennt)" & vbNewLine & vbNewLine & _
                "<" & strA(1) & ">  (ersetze x durch eine Nummer)"
        s = InputBox(s, "lösche Stichworte", strA(1))
        s = Replace(s, "<", "")
        s = Trim(Replace(s, ">", ""))
        If InStr(frm!lstStichwort.Recordset.Source, "NrVGDET") > 0 Then
            strlink = "NrVGDET = " & Nz(frm!nrVGDet, 0)
        Else
            Select Case frm.Tag
            Case "QK"
                strlink = "NrQK = " & Nz(frm!IDQK, 0)
            Case Else
                strlink = "Nr" & frm.Tag & " = " & Nz(frm("Nr" & frm.Tag), 0)
            End Select
        End If
        Select Case s
        Case ""
            GoTo ErrEnd
        Case "Alle"
        Case "OHNE Bemerkung"
            strlink = strlink & " and isnull(bemStichwort,'''') = ''''"
        Case Else
            If InStr(s, " bis ") Then
                s = Replace(s, "lösche von Nr.", "")
                s = Trim(Replace(s, "bis", "and"))
                If IsNumeric(left(s, 1)) = False Or IsNumeric(right(s, 1)) = False Then
                    s = "Bitte diese Anleitung befolgen:" & vbNewLine & vbNewLine
                    GoTo nochmal23
                End If
                s = " between " & Trim(s)
            Else
                s = Replace(s, " ", ",")
                s = Replace(s, ",,", ",")
                s = " in (" & s & ")"
            End If
            strlink = strlink & " and StichwortNr " & s
        End Select
        strSQL = "Exec dbo.spA_Stichwort " & _
                        " @x = 'DeleteStichwort' " & _
                        ",@fi='" & strlink & "'"
        OH_EX
        OH_RQ frm!lstStichwort
    Case 22
        OH_StichwortRemoveWert frm
    Case 30, 31
        frm!txtFind = "S:" & frm!lstStichwort.column(2)
        If lgact = 31 Then
            frm!txtFind = frm!txtFind & " " & frm!lstStichwort.column(3)
        End If
        frm.txtFind_AfterUpdate
    Case 32 'Bemerkung kopieren
        strSQL = "Exec dbo.spa_Stichwort" & _
                " @x = 'KopieBemerkung'" & _
                ",@ID = " & lgid
        OH_r r
        s = r!Bem
        OH_CB s
        s = "Bemerkung von Stichwort <" & r!ST & "> ist jetzt in der Zwischenablage: " & s
        SysCmd acSysCmdSetStatus, left(s, 100)
        GoTo ErrEnd
    Case 40
        strST = Trim(Nz(frm!lstStichwort.column(2) + " " + frm!lstStichwort.column(3), "Alle"))
        strST = InputBox("Welche Stichworte sollen gezeigt werden?" & vbNewLine & _
                        "Geben Sie <Alle> ein, wenn Sie alle sehen wollen!" & vbNewLine & _
                        "Nutzen Sie auch den * zur Wildcard-Suche...", _
                        t, strST)
        If strST = "" Then
            GoTo ErrEnd
        End If
        strST = Replace(strST, "*", "%")
        strSQL = "Exec dbo.spa_Stichwort" & _
                " @st = 70 " & _
                ",@cID = '" & frm.Name & _
                "', @fi = '" & strST & "'"
        OH_PF_Tab frm.Name, "", strSQL
        Forms!PF_TAB.Caption = "Stichworte aus " & frm.Tag & ": " & strST
    Case 41
        frm!lstStichwort.SetFocus
        OH_tlbZoom
    Case 43
        OH_Zeichentabelle
    Case 44
        strSQL = "Exec dbo.spA_Stichwort" & _
                " @St = 44" & _
                ", @id = " & Nz(frm!lstStichwort, 0)
        OH_r r
        If Not r.BOF Then
            frm!StandardText = r!Stichwort
            frm!txtMemo = r!Bem
            frm!comBeilage = r!StichwortHyperlink
        End If
        frm.btnStartEmail.SetFocus
    Case 60
        OH_Openlexikon "Spezifikation-Report"
    Case 99
        strSQL = "Exec dbo.spA_Stichwort" & _
                " @St = 99"
        OH_A "lstStichwortAct", strSQL, frm
    Case 202  'Wenn StichwortGruppe = Analysen, hole Analysen-Parameter aus Lexikon
        'Parameter übertragen aus vwParameter
        Select Case frm.Name
        Case "F_Artikel"
            strSQL = "spa_artikel" & _
                    " @x = 'übertrageAnalysen'" & _
                    ", @i = " & frm!NrArtikel
        Case "F_VG"
            strSQL = "spa_artikel" & _
                    " @x = 'übertrageVorgabeAnalysen'" & _
                    ", @a = " & Nz(frm!NrArtikel, 0) & _
                    ", @i = " & Nz(frm!nrVGDet, 0) & _
                    ", @n = " & Nz(frm!NrFirma, 0)
        End Select
        OH_r r
        i = r!CT
        Select Case i
        Case 0
            s = "Entweder sind keine vorhanden oder diese sind bereits zugeordnet" & vbNewLine & vbNewLine & _
                "Es wurden KEINE Analysen-Stichworte"

        Case 1
            s = "Es wurde EIN Analysen-Stichwort"
        Case Else
            s = "Es wurde " & i & " Analysen-Stichworte"
        End Select
        MsgBox s & " übertragen", vbInformation, t
        OH_RQ frm!lstStichwort
    Case 203  'Wenn StichwortGruppe = Analysen, hole Analysen-Parameter aus Lexikon und ergänze Firma
        s = "Öffnen Sie das Adress-Formular und suchen dort die Firma, der Sie die Analysen zuordnen wollen..." & vbNewLine & _
           "Kehren Sie hierher zurück und wiederholen Sie diese Aktion."
       If Not OH_isloaded("F_Adresse") Then
            GoTo ErrM
        End If
        Set f = Forms!F_Adresse
        If f!ArtAdresse <> "Firma" Then
            s = s & vbNewLine & vbNewLine & _
                "Bitte im Adress-Formular eine Firma anwählen." & vbNewLine & _
                "(Nicht " & f!Vorname & " " & f!Nachname & ")"
            GoTo ErrM
        End If
        s = "jetzt werden die Anaylse-Parameter für die Fa. " & f!Nachname & " übertragen"
        If MsgBox(s, vbOKCancel + vbQuestion, t) = vbCancel Then
            GoTo ErrEnd
        End If
        strSQL = "spa_artikel" & _
                 " @x = 'übertrageAnalysen'" & _
                 ", @i = " & frm!NrArtikel & _
                 ", @a = " & f!NrFunktion
         OH_EX
         OH_RQ frm!lstStichwort
    Case 204 'kopieren von ID....'
        s = "Bitte unten die Artikel-ID (siehe Feld im Artikel-Formular ganz oben) eingeben, von der die Analysen kopiert werden sollen"
        lgid = Val(InputBox(s, t, "hier die ID eintragen"))
        If lgid = 0 Or lgid = frm!NrArtikel Then
            GoTo ErrEnd
        End If
        strSQL = "spa_artikel" & _
                 " @x = 'KopiereAnalysen'" & _
                 ", @i = " & frm!NrArtikel & _
                 ", @a = " & lgid
         OH_EX
         OH_RQ frm!lstStichwort
    Case 210 'Zertifikat drucken'
        OH_ResetID
        strSQL = "Exec spa_B " & _
            "@x = 'rptAnalysenzertifikat' " & _
            ",@id = " & frm!NrVG
        OH_r r
        If r!CT > 0 Then
            DoCmd.OpenReport "rptAnalysenzertifikat", acViewPreview
        Else
            s = "keine oder unvollständige Daten für ein Zertifikat"
            GoTo ErrM
        End If
    Case 500 'alphabetisch sortieren, wird nur bei Adressen ausgeführt
       strSQL = "Exec spa_Stichwort " & _
               "@x = 'StichwortABC'" & _
               ",@ID = " & frm!NrFunktion
       OH_EX
       OH_RQ frm!lstStichwort
    Case 501 'Filtern...'
        frm!comStichwortFilter.SetFocus
        If Nz(frm!comStichwortFilter, "") <> "" Then
            frm!comStichwortFilter = ""
            frm.comStichwortFilter_AfterUpdate
        End If
    Case 1000
        frm.regD_Change
    Case Is >= 100
        s = ""
        strST = Trim(frm!lstStichwortAct.column(1))
        If InStr(strST, "Anschrift") Or InStr(strST, "versand") Then
            If frm!ArtAdresse <> "firma" Then
                s = "geht nur bei einer Firma, nicht bei < " & frm!ArtAdresse & " " & frm!Nachname & " > "
                GoTo ErrM
            End If
            strA(3) = frm!Nachname & vbNewLine & _
                      frm!PostAdr
            strA(4) = "Zoomen des aktuellen Feldes Neue " & strST & " für " & frm!Nachname
            strA(5) = "Ersetzen Sie " & strA(2) & " durch Ihre gewünschte Abteilungsbezeichnung!" & vbNewLine & _
                    "Bitte das Schlagwort <Abteilung> NICHT entfernen!" & vbNewLine & vbNewLine & _
                    "Passen Sie unten die Telefon-, Fax- und Email-Nr. an." & vbNewLine & _
                    "Bitte die Schlagwörter Telefon:, Fax: und Email: ebenfalls NICHT entfernen." & vbNewLine & _
                    "Ihre DB greift bei entsprechender Korrespondenz darauf zu!"
            strA(1) = strST & " neu als Stichwort abspeichern"
            OH_msgbox strA(3), Array(strA(1)), _
                        vbQuestion, _
                        strA(4), _
                        strA(5)
            s = strMSG(5)
            Select Case strMSG(2)
            Case "abbrechen"
                GoTo ErrEnd
            End Select
            If s = "" Then
                GoTo ErrEnd
            End If
        End If
        Select Case lgact
        Case 150, 151 'Bild vor oder nach Unterschrift'
            strSQL = "spa_VG " & _
                    " @x =  'AddStichwortBild' " & _
                    ", @i = " & frm!NrVG & _
                    ", @a = " & lgact
            OH_r r
            OH_RQ frm!lstStichwort
            s = r!Msg
            frm!lstStichwort = r!ID
            If left(s, 5) = "Bitte" Then
                If MsgBox(s, vbOKCancel + vbQuestion, t) = vbOK Then
                    frm.lstStichwort_DblClick (0)
                    GoTo ErrEnd
                End If
            Else
                GoTo ErrM
            End If
        Case 100, 110, Is > 1020
            If lgact > 1020 Then
                strST = "eMail-Adresse " & strST
            End If
nochmalEmail:
            If lgact > 100 Then
                strA(1) = Nz(frm!EMail, "")
            End If
            i = InStr(strA(1), "@")
            s = frm.pgStichwort.Caption & vbNewLine & vbNewLine & _
                            strST & vbNewLine & "Bitte unten die <" & strST & "> eingeben"
            If i > 0 Then
                strA(1) = "XXX" & Mid(strA(1), i)
                s = "Bitte XXX ersetzen " & vbNewLine & vbNewLine & s
            End If
            s = InputBox(s, t, strA(1))
            If s = "" Then
                GoTo ErrEnd
            End If
            If left(s, 3) = "XXX" Then
                GoTo nochmalEmail
            End If
        End Select
        If InStr(strST, "eMAil") > 0 Then
            If strST = "EMAIL..." Then
                strSQL = "Exec dbo.spA_Stichwort" & _
                        " @St = 99"
                OH_A "lstStichwortAct", strSQL, frm
                GoTo ErrEnd
            Else
                If OH_Valid_Mail_URL(s) = False Then
                    GoTo nochmalEmail
                End If
            End If
        End If
        strSQL = "spa_Adresse " & _
                " @x =  'AddStichwort'" & _
                ", @i = " & frm!NrFunktion & _
                ", @f = '" & strST & _
                "', @d = '" & OH_RPL(s) & _
                "', @a = " & frm!lstStichwortAct
        OH_r r
        Select Case r!Msg
        Case "", "X"
            OH_RQ frm!lstStichwort, r!ID
            Select Case strST
            Case "Weihnachtskarte", "keine Weihnachtsk."
            Case Else
                frm!lstStichwortAct = 11    'das neu erstellte Stichwort gleich öffnen
                OH_lstStichwortAct frm, frm!lstStichwortAct
            End Select
        Case Else
            s = r!Msg
            GoTo ErrM
        End Select
    End Select
    SysCmd acSysCmdSetStatus, strST & ": neuer Eintrag in Stichworten"
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 2501
        s = "Keine Daten vorhanden"
    Case Else
        s = Err & " " & Err.Description
        t = "OH_lstStichwortAct"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_CheckRS(frm As Form) As Boolean
'Prüft, ob ein Formular eine gültige Datensatzherkunft hat
On Error GoTo ErrMsg
    Dim rfrm As ADODB.Recordset
    OH_CheckRS = frm.Visible
    Select Case frm.Name
    Case "menu"
        OH_CheckRS = True
        frm.Visible = True
    Case Else
        If OH_CheckRS Then
            If frm.RecordSource = "" Then
                OH_OF frm.Name, 0, 1
            End If
            OH_r rfrm, frm.RecordSource
        Else
            If frm.RecordSource <> "" Then
                OH_CheckRS = True
            End If
        End If
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CheckRS"
    Resume Next
End Function
Public Function OH_CheckFrm() As String
On Error GoTo ErrMsg
    'checkt, ob das übergebene Formular ein Unterformular ist!
    Set frm = Screen.ActiveForm
    Select Case left(frm.Name, 3)
    Case "PF_"
        Select Case frm.Name
        Case "PF_Artikel", "PF_MsgBox", "PF_NeuVG"
            DoCmd.Close acForm, frm.Name
            Set frm = Screen.ActiveForm
        End Select
    End Select
    x = Screen.ActiveControl.Parent.Name
    If Not left(x, 2) Like "F_" Then
        If Screen.ActiveForm(x).ControlType = acSubform Then
            Set frm = Screen.ActiveControl.Parent
        End If
    End If
ErrEnd:
    OH_CheckFrm = frm.Name
    Exit Function
ErrMsg:
    Select Case Err
    Case 2474, 2465
        Set frm = Screen.ActiveForm
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_CheckFrm"
    End Select
    Resume ErrEnd
End Function
Public Function OH_CheckMainFrm() As Form
On Error GoTo ErrMsg
    'checkt, ob das übergebene Formular ein Unterformular ist!
    Set frm = Screen.ActiveForm
    If left(frm.Name, 3) Like "PF_" Then
        DoCmd.Close acForm, frm.Name
    End If
    If left(frm.Name, 3) Like "UF_" Then
        Set frm = frm.Parent
    End If
    If left(frm.Name, 3) Like "UF_" Then
        Set frm = frm.Parent
    End If
    Set OH_CheckMainFrm = frm
ErrEnd:
    Exit Function
ErrMsg:
    'msgbox OH_Err (Err, Err.Description)
    Set frm = Screen.ActiveForm
    Resume ErrEnd
End Function
Public Function OH_OpenKalender(Optional ctlKal As control, _
                                Optional MoveL As Long = 0, _
                                Optional MoveT As Long = 0, _
                                Optional strShow As String = "Datum") As Boolean
On Error GoTo ErrMsg
    'Diese Funktion setzt voraus:
    'Öffnen mit einem Button mit diesem Namen: btn"Datumfeld"
    'das Formular enthält ein Steuerelement mit dem Namen "Datumfeld"
    '(Beispiel btnDatumIst mit Steuerelement "DatumIst")
    'Screen.ActiveControl.Parent ist das objekt (Unterformular),
    'in dem sich das Datum befindet!
    Dim lgPlace As Long
    Dim frmK As Form
    If Not ctlKal Is Nothing Then
        Set ctl = ctlKal
    Else
ctlKalNothing:
        OH_CheckFrm
        x = Screen.ActiveControl.Name
        If left(x, 3) = "btn" Then
            Set ctl = frm(right(x, Len(x) - 3))
        Else
            'siehe rechte Maustaste
            Set ctl = frm(x)
        End If
    End If
'cldat: übergebenes Datum-Feld im Formular
    If MoveL = 0 Then
        MoveL = (ctl.left + ctl.Width) / 56.7 + 10
    End If
    lgPlace = 250
    If MoveL > lgPlace Then
        MoveL = ctl.left / 56.7 - 160
    End If
    If MoveL < 0 Then
        MoveL = 0
    End If
    If MoveT = 0 Then
        MoveT = ctl.top / 56.7
    End If
    If MoveT > 200 Then
        MoveT = 200
    End If
    DoCmd.openForm "PF_Kalender"
    OH_OpenKalender = True
    Set frmK = Forms!PF_Kalender
    frmK!comShow = strShow

    If IsNull(ctl) Or _
       IsDate(ctl) Or _
       IsDate(CDate(Nz(ctl, Date))) Then
        t = ctl.ControlTipText
        If ctl.Name = "txtv" Then
            t = Forms!F_VG!UF_txt.Form!txt
        End If
        If IsDate(CDate(Nz(ctl, Date))) Then
            frmK!MY = CLng(CDate(Nz(ctl, Date)))
            frmK.OH_K
            frmK!comStd = Format(ctl, "HH")
            frmK!comMin = Format(ctl, "NN")
        End If
    Else
        t = "Kalender (heute)"
        frmK!Kalender = CLng(Date)
    End If
    frmK.Caption = t
    'Kalender neben und unter Datum stellen
    OH_Move frmK, MoveL, MoveT, 135, 60
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2465, 13
        Resume ErrEnd
    Case 91
       Resume ctlKalNothing
    End Select
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_OpenKalenderKW()
'setze Kalenderwoche mit rechter Maustaste
    OH_OpenKalender , , , "KW"
End Function
Public Function OH_OpenKalenderYear()
'setze Kalenderwoche mit rechter Maustaste
    OH_OpenKalender , , , "Jahr"
End Function
Public Function OH_OpenKalenderMonth()
'setze Kalenderwoche mit rechter Maustaste
    OH_OpenKalender , , , "Monat"
End Function
Public Function OH_OpenKalenderDatelong()
'setze Kalenderwoche mit rechter Maustaste
    OH_OpenKalender , , , "Datum lang"
End Function
Public Function OH_SetActualDate()
'"setze aktuelles Datum mit rechter Maustaste"
    OH_SetTimes Date
End Function
Public Function OH_SetActualDateTime()
'setze aktuelles Datum und Uhrzeit mit rechter Maustaste"
    OH_SetTimes Format(Now, "dd.mm.yy hh:mm")
End Function
Public Function OH_SetActualTime()
'setze aktuelles Datum und Uhrzeit mit rechter Maustaste"
    OH_SetTimes Format(Now, "hh:mm")
End Function
Public Function OH_SetTimes(varTime As Variant)
'setze aktuelles Datum und Uhrzeit mit rechter Maustaste"
    Dim lgSel As Long
On Error GoTo ErrMsg

    Set ctl = Screen.ActiveControl
    If IsNull(ctl) = True Then
        ctl = varTime
    Else
        If IsDate(Nz(ctl)) Then
            ctl = varTime
        Else
            lgSel = Len(ctl) - ctl.SelStart - ctl.SelLength
            If lgSel < 0 Then
                lgSel = 0
            End If
            ctl = Trim(left(ctl, ctl.SelStart) & " " & varTime & " " & right(ctl, lgSel))
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 438
        MsgBox "Hier können Sie die aktuelle Uhrzeit" & vbNewLine & vbNewLine & _
                varTime & vbNewLine & vbNewLine & _
               "nicht eintragen!", vbCritical, "setze aktuelle Uhrzeit mit rechter Maustaste"
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "setze aktuelles Datum mit rechter Maustaste"
    End Select
    Resume ErrEnd
End Function
Public Function OH_CheckPersData(lgFunktion As Long) As String
On Error GoTo ErrMsg
    strSQL = "SELECT T_Funktion.*, Adr1.*, Adr2.Nachname as Firma " & _
             " FROM T_Adresse AS Adr1 INNER JOIN " & _
             "(T_Adresse AS Adr2 INNER JOIN T_Funktion ON Adr2.NrAdresse = T_Funktion.NrAdrZuord)" & _
             " ON Adr1.NrAdresse = T_Funktion.NrAdresse" & _
             " WHERE T_Funktion.NrFunktion=" & lgFunktion
    OH_r r
    If Not r.BOF Then
        strlink = "NrAdresse=" & lgFunktion & " and Funktion='Privat'"
        r.MoveFirst
        OH_CheckPersData = r!ArtAdresse & "<br>" & _
                "Titel(Anrede):  " & r!Titel & "<br>" & _
                "Vorname:  " & r!Vorname & "<br>" & _
                "Nachname:  " & r!Nachname & "<br>" & vbNewLine & _
                "Firma:  " & r!Firma & "<br>" & _
                "========================" & "<br>" & _
                "Funktion:  " & r!Funktion & "<br>" & _
                "Abteilung:  " & r!Abteil & "<br>" & _
                "Tel:  " & r!Telefon & "<br>" & _
                "Fax:  " & r!Fax & "<br>" & _
                "eMail:  " & r!EMail & "<br>" & _
                "Homepage:  " & HyperlinkPart(r!Internet, acAddress) & "<br>" & _
                "Mobile:  " & r!Mobil & "<br>" & "<br>" & _
                "Private Angaben: " & "<br>" & _
                "========================" & "<br>" & _
                "Beruf:  " & r!Beruf & "<br>" & _
                "Geb.-Tag:  " & r!GebTag & "<br>" & _
                "Strasse:  " & r!Strasse & "<br>" & _
                "Wohnort:  " & r!Land & " " & r!PLZStrasse & " " & r!Ort & "<br>" & _
                "Tel:  " & DLookup("Telefon", "T_Funktion", strlink) & "<br>" & _
                "Fax:  " & DLookup("Fax", "T_Funktion", strlink) & "<br>" & _
                "eMail:  " & DLookup("eMail", "T_Funktion", strlink) & "<br>" & _
                "Homepage:  " & DLookup("Internet", "T_Funktion", strlink) & "<br>" & _
                "Mobile:  " & Space(3) & DLookup("Mobil", "T_Funktion", strlink)
        End If
        OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_GetInfo(strField As String, varFun As Variant) As String
On Error GoTo ErrMsg
'Hole den Feldinhalt strField der übergebenen NrFunktion(varFun)
    strSQL = "SELECT  T_Adresse.*, T_Funktion.* " & _
                             " FROM T_Adresse INNER JOIN T_Funktion ON  " & _
                             " T_Adresse.NrAdresse = T_Funktion.NrAdresse " & _
                             " WHERE T_Funktion.NrFunktion=" & varFun
    OH_r r
    Select Case strField
    Case "Name"
        OH_GetInfo = r!Titel + " " & r!Vorname & " " & r!Nachname
    Case Else
        OH_GetInfo = r(strField)
    End Select
    OH_ResetRS r
ErrEnd:
    Exit Function
ErrMsg:
    OH_GetInfo = ""
    Resume ErrEnd
End Function
Public Function OH_InsertID_ALL(frmP As Form) As Long
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spI_ID 'InsertID_ALL',0,0,'" & frmP.Name & "'"
    OH_r r
    If r.BOF Then
        OH_InsertID_ALL = 0
    Else
        OH_InsertID_ALL = r(0)
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " erstellen der Hilfstabelle vwID" & vbNewLine & _
           Err.Description, vbCritical, "OH_InsertID_ALL"
    Resume Next
End Function
Public Function OH_InsertID_LST(ctl As control, _
                                Optional blMarker As Boolean = False, _
                                Optional blClear As Boolean = True) As Long
On Error GoTo ErrMsg
    Dim Y As Long
    Dim z As Long
    If blClear Then
        OH_ResetID
    End If
    i = 0
    If blMarker Then
        For Each x In ctl.ItemsSelected
            z = z + 1
            OH_InsertID Val(ctl.column(0, x))
        Next x
    Else
        If ctl.ColumnHeads = True Then
            Y = 1
        Else
            Y = 0
        End If
        For i = Y To ctl.ListCount - 1
            z = z + 1
            OH_InsertID Val(ctl.column(0, i))
        Next i
    End If
    OH_InsertID_LST = z
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " Insert in Hilfstabelle vwID" & vbNewLine & _
           Err.Description, vbCritical, "OH_InsertID_LST"
    Resume Next
End Function
Public Function OH_InsertID(lgid As Long, Optional strT As String, Optional blClear As Boolean = False)
On Error GoTo ErrMsg
    If blClear Then
        OH_ResetID
    End If
    If lgid > 0 Then
        strSQL = "Exec dbo.spI_ID " & _
                "@x = 'InsertID' " & _
                ",@i=  " & lgid & _
                ",@f = '" & OH_RPL(strT) & "'"
        OH_EX
    Else
        MsgBox lgid
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " Insert in Hilfstabelle vwID" & vbNewLine & _
           Err.Description, vbCritical, "OH_InsertID"
    Resume Next
End Function
Public Function OH_InsertIDDiv( _
                    ID As Long, _
                    Optional id1 As Long, _
                    Optional idt1 As String, _
                    Optional IDT2 As String, _
                    Optional IDT3 As String, _
                    Optional idTime As Date)
On Error GoTo ErrMsg
    If ID > 0 Then
        strSQL = "Exec dbo.spI_ID " & _
                " @x = 'InsertIDDiv' " & _
                ",@i=  " & ID & _
                ",@a=  " & id1 & _
                ",@f = '" & left(OH_RPL(idt1), 150) & _
                "',@d = '" & left(OH_RPL(IDT2), 150) & _
                "',@w = '" & left(OH_RPL(IDT3), 4000) & _
                "',@t = '" & idTime & "'"
        OH_EX
    Else
        MsgBox ID, , "OH_InsertIDDiv"
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " Insert in Hilfstabelle vwID" & vbNewLine & _
           Err.Description, vbCritical, "OH_InsertIDDiv"
    Resume Next
End Function
Public Function OH_ResetID()
On Error GoTo ErrMsg
    strSQL = "Exec dbo.spI_ID 'CreateID'" '140115 HVL
    OH_EX
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " Update der Filter-Hilfstabelle T_ID" & vbNewLine & _
           Err.Description, vbCritical, "Resetfunktion"
    Resume Next
End Function
Function OH_closeObj(strObjName As String, Optional lgObj As Integer = acForm, Optional blCheck As Boolean = True) As Boolean
'prüft ob ein Objekt offen ist und schliesst es
On Error GoTo ErrMsg
    If OH_isloaded(strObjName, lgObj) Then
        DoCmd.Close lgObj, strObjName, acSaveNo
    End If
    OH_closeObj = False
ErrEnd:
    Exit Function
ErrMsg:
    OH_closeObj = True
    s = Err & " Ist das Formular / Report geöffnet==>Schliessen" & vbNewLine & _
           Err.Description
    t = "OH_closeObj"
    Resume ErrEnd
ErrM:
    MsgBox s, vbCritical, t
    Resume ErrEnd
End Function
Function OH_isloaded(ByVal objName As String, Optional intObj As Integer = acForm) As Boolean
'prüft ob ein Objekt offen ist
    On Error Resume Next
    If SysCmd(acSysCmdGetObjectState, intObj, objName) = 0 Then
        OH_isloaded = False
    Else
        OH_isloaded = True
    End If
End Function
Function isWeekday(ByVal InputDate As Variant) As Variant       'Samstag- und Sonntag-Termine
    If Weekday(InputDate) = 1 Then   'Sonntag
        isWeekday = InputDate + 1
    ElseIf Weekday(InputDate) = 7 Then   'Samstag
        isWeekday = InputDate + 2
    Else
        isWeekday = InputDate
    End If
End Function
Function Alter(dteBirthdate As Date) As Long
    Dim lngAge As Long
    ' Sicherstellen, dass der eingegebene Wert ein Datum ist.
    If Not IsDate(dteBirthdate) Then
        dteBirthdate = Date
    End If
    ' Sicherstellen, dass das Geburtsdatum nicht in der Zukunft liegt.
    ' Wenn dies der Fall ist, wird das Datum von heute verwendet.
    If dteBirthdate > Date Then
        dteBirthdate = Date
    End If
    ' Berechnen der Differenz in Jahren zwischen heute und dem Geburtsdatum.
    lngAge = DateDiff("yyyy", dteBirthdate, Date)
    ' Wenn das Geburtsdatum nicht in diesem Jahr stattgefunden hat, wird 1 vom Alter abgezogen.
    If DateSerial(Year(Date), Month(dteBirthdate), Day(dteBirthdate)) > Date Then
        lngAge = lngAge - 1
    End If
    Alter = lngAge
End Function
Function Primo(Optional dteDate As Date) As Date
' OHNEMUS, Donnerstag, 22. Juni 2006
On Error GoTo ErrMsg
    If CLng(dteDate) = 0 Then
        dteDate = Date
    End If
    ' Suchen nach dem ersten Tag in diesem Monat.
    Primo = DateSerial(Year(dteDate), Month(dteDate), 1)
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.Primo"
    End Select
    Resume ErrEnd
End Function
Function Ultimo(Optional dteDate As Date) As Date
' OHNEMUS, Donnerstag, 22. Juni 2006
On Error GoTo ErrMsg
    ' Diese Funktion berechnet den letzten Tag eines Monats anhand eines Datums.
    ' Wenn kein Datum übergeben wird, verwendet die Funktion das aktuelle Datum.
    If CLng(dteDate) = 0 Then
        dteDate = Date
    End If
    ' Suchen nach dem ersten Tag des nächsten Monats und anschließend Abziehen eines Tages.
    Ultimo = DateSerial(Year(dteDate), Month(dteDate) + 1, 1) - 1
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.Ultimo"
    End Select
    Resume ErrEnd

End Function
Public Sub AdresseSuchen(lgFunktion As Variant)
On Error GoTo ErrMsg
    If Not IsNull(lgFunktion) Then
        OH_OF "F_Adresse", Val(lgFunktion)
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Sub
Public Function OH_Delete(strDeleteMldg As String, strCaption As String) As Boolean ' 1. Löschbestätigung für Löschen markierter Datensätze des aktiven Formulares
On Error GoTo ErrMsg
    OH_Delete = False
inputbox1:
'        x = InputBox(strDeleteMldg & vbNewLine & _
'                    "Bestätigen Sie bitte das Löschen" & vbNewLine & _
'                    "durch die Eingabe eines grossgeschriebenen <JA>!", strCaption & " Lösch-Bestätigung")
'        If StrComp(x, "JA", vbBinaryCompare) <> 0 Then
'            OH_Delete = True
'            If Len(x) > 0 Then
'                strDeleteMldg = "Sie müssen ein GROSSGESCHRIEBENES JA eingeben!" & vbNewLine & strDeleteMldg
'                GoTo inputbox1
'            End If
'        End If
    If MsgBox(strDeleteMldg & vbNewLine & _
            "bitte mit JA bestätigen", vbYesNo + vbDefaultButton2 + vbQuestion, "Löschen") = vbNo Then
        OH_Delete = True
    End If
    If glAskDelete = True Then
        If MsgBox(strDeleteMldg & vbNewLine & _
                "Wollen Sie wirklich endgültig löschen ?", vbExclamation + vbOKCancel + vbDefaultButton2, _
            "2. Lösch-Bestätigung " & strCaption & " !") = vbCancel Then
            OH_Delete = True
            strDel = vbNullString
        End If
    End If
ErrEnd:
    strDel = vbNullString
    Exit Function
ErrMsg:
    strChangeControl = vbNullString
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_checkdelete(strWhat As String, _
                               strT As String, _
                               strTable As String, _
                               strF1 As String, _
                               lgid As Long, _
                               Optional strOptLink As String) As String
    ' Anzahl abhängige Datensätze überprüfen,
    ' wenn ein übergeordneter Datensatz gelöscht wird
    Dim strX As String
    Dim rsdel As ADODB.Recordset
    Dim lgC As Long
    OH_checkdelete = 0
    strX = "T_" & strTable & "." & strF1
    strlink = strX & "=" & lgid
    If Not strOptLink = "" Then
        strlink = strOptLink
    End If
    strSQL = "Select * from T_" & strTable & " where " & strlink
    OH_r rsdel, strSQL, , , True
    If Not rsdel.BOF Then
        rsdel.MoveLast
        lgC = rsdel.RecordCount & ""
        rsdel.Close
        If lgC > 0 Then
            If strTable = "Funktion" And lgC > 0 Then
                OH_checkdelete = lgC
                Exit Function
            End If
            x = MsgBox(strT & " : " & strWhat & " vorhanden! (" & lgC & ")" & _
                       vbNewLine & vbNewLine & _
                       "Möchten Sie diese zugehörigen Daten auch löschen?", _
                        vbExclamation + vbYesNo + vbDefaultButton2, "1. Frage :Löschen nicht möglich!")
            If x = vbYes Then
                x = MsgBox(strT & " : " & strWhat & " vorhanden! (" & lgC & ")" & _
                           vbNewLine & vbNewLine & _
                           "Sie sind sich sicher, dass Sie diese Daten auch wirklich löschen wollen?", _
                            vbQuestion + vbYesNo + vbDefaultButton2, "2. Frage :Löschen nicht möglich!")
                If x = vbYes Then
                    OH_EX ("DELETE " & strX & ", T_" & strTable & ".* " & _
                              " FROM T_" & strTable & "  where " & strlink & ";")
                End If
            End If
            OH_checkdelete = x
        End If
    Else
        If strTable = "Funktion" Then
            OH_checkdelete = 0
        Else
            OH_checkdelete = vbYes
        End If
    End If
    OH_ResetRS rsdel
End Function
Public Function OH_CopyRS(strTable As String, _
                       strL As String, _
                       otherField As String, _
                       otherFieldvalue, _
                       Optional blMldg As Boolean, _
                       Optional blMaxWert As Boolean, _
                       Optional otherField2 As String, _
                       Optional otherFieldvalue2 As String) As Long 'Datensatz kopieren
'Kopiert einen Datensatz über Recordset komplett!
'strTable           übergebene Tabelle
'otherField         Feldname, dessen Wert geändert werden soll
'otherFieldvalue    Wert der übernommen werden soll
'blmldg             Soll Meldung angezeigt werden
'otherField2        Feldname eines weiteren Feldes, dessen Wert geändert werden soll
'otherFieldvalue2   Wert 2 der übernommen werden soll

On Error GoTo ErrMsg
    Dim rsCopy As ADODB.Recordset
    OH_CopyRS = 0
    If blMldg = False Then
        If MsgBox(s & " kopieren ?", vbQuestion + vbOKCancel, _
                 "Kopie erstellen") = vbCancel Then
            GoTo ErrEnd
        End If
    End If
    If IsNull(otherFieldvalue) Then
        otherFieldvalue = ""
    Else
        If IsDate(otherFieldvalue) And Len(otherFieldvalue) >= 8 Then
            otherFieldvalue = CDate(otherFieldvalue)
        End If
    End If
    If IsDate(otherFieldvalue2) And Len(otherFieldvalue2) >= 8 Then
        otherFieldvalue2 = CDate(otherFieldvalue2)
    End If
    'Werte mit Hochkomma müssen ersetzt werden durch ''''
    strSQL = "spI_CopyTable '" & _
                strTable & "','" & _
                strL & "','" & _
                otherField & "','" & _
                Replace(otherFieldvalue, "'", "''''") & "','" & _
                otherField2 & "','" & _
                Replace(otherFieldvalue2, "'", "''''") & "'"
    OH_r rsCopy
    If rsCopy.BOF Then
        OH_CopyRS = 0
    Else
        OH_CopyRS = rsCopy(0)
    End If
    OH_ResetRS rsCopy
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox OH_Err(Err, "Kopie " & Err.Description), vbCritical, "Public Function OH_CopyRS"
    Resume ErrEnd
End Function
Public Function OH_newCompany(strName As String)
    'übernehme einen String und zerlege diesen in Nachname und Ort
    'trage diese Werte in Adressen ein
On Error GoTo ErrMsg
    Dim strNachname As String
    Dim strOrt As String
    Dim lgid As Long
    Set ctl = Screen.ActiveControl
    ctl.Undo
    OH_newCompany = True
    strNachname = strName
    strOrt = "noch eintragen"
    'strname zerlegen"
    x = InStr(strName, ",")
    If x = 0 Then
        x = InStr(strName, ";")
    End If
    If x > 0 Then
        strNachname = Trim(left(strName, x - 1))
        strOrt = Trim(right(strName, Len(strName) - x))
    End If
    s = "Firma:  " & vbTab & strNachname & vbNewLine & _
              "Ort:   " & vbTab & strOrt & vbNewLine & vbNewLine & _
              "Möchten Sie weitere Firmen-Daten (Tel, Email etc.) " & vbNewLine & _
              "erfassen resp. Daten korrigieren?"

    i = MsgBox(s, 32 + 3, "Neue Firma : " & strNachname & ", " & strOrt)
    If i = 2 Then Exit Function
    x = InputBox("Bitte Land (Kurzzeichen) eingeben", strNachname, _
                 DLookup("LandKZ", "T_Land", "DBLand=1"))
    If x = "" Then GoTo ErrEnd
    strSQL = "Execute spa_Adresse " & _
                " @x = 'newCompany'" & _
                ", @f = '" & OH_RPL(strNachname) & _
                "', @o = '" & OH_RPL(strOrt) & _
                "', @d = '" & x & "'"
    OH_r r
    lgid = r!ID
    ctl = lgid
    OH_RQ ctl
    SendKeys "{TAB}"
'=================
    If i = vbYes Then
        OH_OF "F_Adresse", lgid, 1
        With Forms!F_Adresse
            !Beruf.SetFocus     'Branche eingeben
        End With
    End If
    OH_ResetRS rs
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox OH_Err(Err, "Kopie " & Err.Description), vbCritical, "OH_newCompany"
    Resume ErrEnd
End Function

Public Function NewLexikonEntry(varBegriff As Variant, strGR As String, nextfield As String) As Boolean
'neue Werte ins Lexikon eintragen
On Error GoTo ErrMsg
    Dim varBegriffText
    Set frm = Screen.ActiveForm
    Set ctl = Screen.ActiveControl
    ctl.Undo
    s = varBegriff & " jetzt als " & strGR & " (Kurztext) erfassen ?" & vbNewLine & vbNewLine & _
            "Bitte gut überlegen, ob nicht schon mit ähnlichem Namen vorhanden!" & vbNewLine & vbNewLine & _
            "Ggf. unten den richtigen Kurztext eintragen." & vbNewLine
    t = strGR & " " & varBegriff & " ist noch nicht erfasst."
    varBegriff = InputBox(s, t, varBegriff)
    If Not varBegriff = "" Then
        s = "Bitte Beschreibung (Klartext) eintragen."
        varBegriffText = InputBox(s, t, "hier Klartext eintragen")
        If Not varBegriffText = "" Then
            strSQL = "Exec dbo.spa_Lexikon" & _
                "  @x = 'InsertLex'" & _
                ", @d = '" & strGR & _
                "',@f = '" & varBegriff & _
                "',@e = '" & varBegriffText & _
                "',@s = 'nicht löschen'" & _
                ",@w =  '" & frm.Name & "'"
            OH_r r
            ctl = varBegriff
            OH_RQ ctl
            Set ctl = frm(nextfield) '250528
            ctl.SetFocus
            Select Case ctl.ControlType
            Case acComboBox, acListBox
                OH_RQ frm(nextfield)
            End Select
            NewLexikonEntry = True
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical
    Resume ErrEnd
End Function
Public Function OH_RundeX(wert As Variant, Optional Stellen = 0) As Double
'RundeSumme: OH_Runden([Einzelpreis]*[Anzahl];2)
'Das Produkt aus Einzelpreis und Anzahl wird damit auf zwei
'Nachkommastellen gerundet, und zwar so, dass Access auch
'intern anschliessend nur noch mit dieser Genauigkeit rechnet.
    wert = Nz(wert, 0)
    OH_RundeX = Sgn(wert) * Int(Abs(wert) * (10 ^ Stellen) + 0.5) / (10 ^ Stellen)
End Function
Public Function OH_Runde(wert As Variant) As Double
    wert = Nz(wert, 0)
    If glsgRunden = 0 Then
        glsgRunden = 100
    End If
    OH_Runde = Sgn(wert) * Int(Abs(wert) * glsgRunden + 0.5) / glsgRunden
End Function
Public Function OH_RundeAuf(wert As Variant, Stellen As Long) As Double
    Dim i1 As Long
    Dim i10 As Long
'Aufrunden z.B. 1.12 ==> 1.20    2.65 ==> 2.7
    wert = Nz(wert, 0)
    i1 = right(Int(wert * 100), 1)
     i10 = Int(wert * 10)
     If i1 > 0 Then
        i10 = i10 + 1
    End If
    OH_RundeAuf = i10 / 10
End Function
Public Function OH_CheckChange(Optional cctl As control, Optional cfrm As Form) As Integer
'sorgt dafür, dass bei Änderung des übergebenen Feldes eines bereits bestehenden
'Datensatzes gefragt wird, ob wirklich geändert werden soll!
On Error GoTo ErrMsg
    Dim IntSec As Integer
    IntSec = 60 'wenn letzte Änderung älter als intSec Sekunden
    Dim strLastUpdate As String
    Dim sgTimeDiff As Single
    If cfrm Is Nothing Then
        Set cfrm = Screen.ActiveForm
    End If
    If cctl Is Nothing Then
        Set cctl = Screen.ActiveControl
    End If
    If cfrm.NewRecord = False Then
        strLastUpdate = Nz(Format(cfrm!LastUpdate, "dd.mm.yy hh:nn"), "??") & "!"
        If Not cctl.OldValue = cctl.Value Then
            If DateDiff("s", cfrm!LastUpdate, Now) > IntSec Then
                t = "Änderung " & cfrm.Caption & " " & cctl.OldValue & " ===> " & cctl.Value
                x = MsgBox("Achtung: Sie ändern einen bestehenden Datensatz!" & vbNewLine & _
                          "Letzte Änderung/Erstellung war am " & strLastUpdate & vbNewLine & vbNewLine & _
                           "JA" & vbTab & vbTab & "Diese bestehenden Daten ändern!" & vbNewLine & _
                           "NEIN" & vbTab & vbTab & cfrm.Caption & ": neuen Datensatz erfassen!" & vbNewLine & _
                           "Abbrechen" & vbTab & "Änderung rückgängig machen!", _
                           vbExclamation + vbYesNoCancel, t)
                Select Case x
                Case vbYes
                    OH_CheckChange = False
                    cfrm!LastUpdate = Now()
                Case vbNo
                    OH_CheckChange = True
                    cctl.Undo
                    cfrm.Undo
                    Select Case cfrm.Name
                    Case "F_Adresse", "F_VG"
                        OH_New
                    End Select
                Case vbCancel
                    OH_CheckChange = True
                    cctl.Undo
                    cfrm.Undo
                End Select
            Else
                OH_CheckChange = False
            End If
        End If
    Else
        OH_CheckChange = False
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 2465, 3251
        strLastUpdate = "???"
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical
        Resume ErrEnd
    End Select
End Function
Public Function OH_CreateFolder(ByVal strPath As String, Optional strSubFldr As String) As Boolean
On Error Resume Next
'Ordner in Explorer anlegen
    Dim strTmp As String
    Dim strP As String
    Dim strSF() As String
    Dim N As Long
    DoCmd.Hourglass True
    strP = strPath
    OH_CreateFolder = False
    strTmp = left(strP, 3)
    strP = right(strP, Len(strP) - 3)
    If right(strP, 1) = "\" Then
        strP = strP & "\2"
    End If
    i = InStr(strP, "\")
    strTmp = strTmp & Mid(strP, 1, i - 1)
    strP = right(strP, Len(strP) - i)
    While True
        MkDir strTmp
        i = InStr(strP, "\")
        If i = 0 Then
            MkDir strTmp & "\" + strP
            OH_CreateFolder = strP
            GoTo endwhile
        Else
            strTmp = strTmp & "\" + Mid(strP, 1, i - 1)
        End If
        strP = right(strP, Len(strP) - InStr(strP, "\"))
    Wend
endwhile:
    If Len(Dir(strPath, vbDirectory)) = 0 Then
        MsgBox "Folder konnte nicht erstellt werden!", vbExclamation, strPath
        OH_CreateFolder = False
    Else
On Error GoTo ErrMsg
        OH_CreateFolder = True
        If strSubFldr <> "" Then
            strSF = Split(strSubFldr, ";")
            For N = 0 To UBound(strSF)
                strTmp = strPath & "\" & Trim(strSF(N))
                MkDir strTmp
            Next N
        End If
    End If

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & "  - " & Err.Description, vbCritical, strP & " Ordner erstellen"
    Resume ErrEnd
End Function
Public Sub OH_ResetRSALL()
On Error GoTo ErrMsg
    'schliesst Standard Recordsets und setzt sie zurück
    If Not r Is Nothing Then
        r.Close
        Set r = Nothing
    End If
    If Not rs Is Nothing Then
        rs.Close
        Set rs = Nothing
    End If
    If Not rx Is Nothing Then
        rx.Close
        Set rx = Nothing
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 3420, 3704
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_ResetRS r-Function"
    End Select
    Resume ErrEnd
End Sub
Public Sub OH_ResetRS(Optional RSReset As ADODB.Recordset)
On Error GoTo ErrMsg
    'schliesst übergebenes Recordset und setzt es zurück
    If Not RSReset Is Nothing Then
        RSReset.Close
        Set RSReset = Nothing
    End If
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err
    Case 3420, 3704
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_ResetRS r-Function"
    End Select
    Resume ErrEnd
End Sub
Public Function OH_GetPic(lgFunktion As Long, strStichWort As String) As String
On Error GoTo ErrMsg
'Hole Hyperlink aus den Stichworten der übergebenen Funktion
    strSQL = "select dbo.fx_getHyperlink(" & lgFunktion & ",'" & strStichWort & "')"
    OH_r rx
    OH_GetPic = rx(0)
    If Len(Dir(OH_GetPic)) = 0 Then
        SysCmd acSysCmdSetStatus, OH_GetPic & " nicht gefunden!"
        OH_GetPic = ""
    End If
    OH_ResetRS rx
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetPic"
    Resume ErrEnd
End Function
'100924
Public Function OH_checkFile(strP As String, Optional blMldg = False) As String
On Error GoTo ErrMsg
'prüfe, ob das File existiert
    If Len(Dir(strP)) = 0 Then
        s = strP & " ==> NICHT gefunden!"
        If blMldg Then
            MsgBox s, vbExclamation, "check File"
        End If
        SysCmd acSysCmdSetStatus, s
        OH_checkFile = ""
    Else
        OH_checkFile = strP
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_checkFile"
    Resume ErrEnd
End Function
Public Function OH_SetFont(rpt As Report, ByVal strf As String)
On Error GoTo ErrMsg
    'Reports sollen in der definierten Schriftart erstellt werden
    Dim ctlR As control
    Dim lgFontSize As Long
    lgFontSize = Val(right(strf, 2)) '210314 erweitert um Size!!
    If lgFontSize <> 0 Then
        strf = Trim(left(strf, Len(strf) - 2))
    End If
    If lgFontSize < 8 Or lgFontSize > 20 Then
        lgFontSize = 10
    End If
    If strf = "" Then
        glstrFont = "ARIAL"
        strf = glstrFont
    End If
    For Each ctlR In rpt.Controls 'Schlaufe durch ALLE Felder eines Reports
        Select Case ctlR.ControlType
        Case acTextBox, acLabel
            ctlR.FontName = strf
            If ctlR.FontSize = 10 And lgFontSize <> 10 Then
                ctlR.FontSize = lgFontSize
            End If
        End Select
    Next ctlR
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "setze Schriftart"
    Resume ErrEnd
End Function
Public Function OH_SetFontRT(ctl As control)
On Error GoTo ErrMsg
    '251007 alle Formtierbaren RICH TEXT-Felder auf die in den Stichworten des Mandanten definierte Schriftart stellen
    If ctl.FontName <> glstrFontEmail Then
        ctl.FontName = glstrFontEmail
    End If
    Select Case ctl.Name
    Case "BemStichwort"
    Case Else
        If ctl.FontSize <> glstrFontSizeEmail Then
            ctl.FontSize = glstrFontSizeEmail
        End If
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "setze Schriftart in Richtext"
    Resume ErrEnd
End Function
Public Function OH_GetYearKW(ByVal lgDate As Long) As Long
On Error GoTo ErrMsg
    Dim iday As Long
    'Übergabe eines Datums als Long
    'Berechnung der KW mit zugehörigem Jahr YYYYKW
    'Wenn das Datum noch im Dezember liegt aber bereits zur KW 1 gehört, muss etwas gemacht werden:
    'Beispiel 30.12.03  als 37985 übergeben ==> 200401
    Dim btKW As Byte
    Dim intY As Integer
    intY = Year(lgDate)
    btKW = Int((lgDate - DateSerial(Year(lgDate), 1, 1) + _
            ((Weekday(DateSerial(Year(lgDate), 1, 1)) + 1) _
            Mod 7) - 3) / 7) + 1
    If btKW = 0 Then
        lgDate = DateSerial(Year(lgDate) - 1, 12, 31)
        btKW = Int((lgDate - DateSerial(Year(lgDate), 1, 1) + _
                ((Weekday(DateSerial(Year(lgDate), 1, 1)) + 1) _
                Mod 7) - 3) / 7) + 1
        intY = intY - 1
    ElseIf btKW = 53 And (Weekday(DateSerial(Year(lgDate), 12, 31)) - 1) Mod 7 <= 3 Then
        btKW = 1
    End If
    If btKW = 1 And Month(CDate(lgDate)) = 12 Then
        intY = intY + 1
    End If
    OH_GetYearKW = intY & Format(btKW, "00")
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetYearKW"
    Resume ErrEnd
End Function
Public Function OH_tlbCorrection()
On Error GoTo ErrMsg
    Dim frmHF As Form
    Dim iC As Long
    Dim N As Long
    Dim nn As Long
    Dim strf As String
    Dim strFtxt As String
    Dim lgcboColumn As Long
    Dim strFUpdate As String
    Dim strN As String
    Dim strFNew As String
    Dim strFNewtxt As String
    Dim tblT As ADOX.Table
    Dim column As ADOX.column
    Dim strHilfe As String
    Dim strft(2) As String
    Dim lgF As Long
    Dim strLinkC As String
    Dim strLinkCNew As String
    Dim ctlF As control
    Set ctlF = Screen.ActiveControl
    Dim objC As Object
    Dim strA(1 To 3) As String
    t = "Generelle Korrektur im aktuellen Feld <" & ctlF.Name & "> " & left(ctlF.ControlTipText, 30) & "..."
    Select Case ctlF.ControlType
    Case acComboBox, acTextBox
        strf = ctlF.ControlSource
        If Len(strf) = 0 Then
            MsgBox "Dieses Feld hat keinen Datenbezug zu einem Tabelleneintrag!", vbCritical, t
            Exit Function
        End If
        If ctlF.Enabled = False Then
            MsgBox "Dieses Feld ist gesperrt für Änderungen!", vbCritical, t
            Exit Function
        End If
        If ctlF.Locked = True Then
            MsgBox "Dieses Feld ist gesperrt für Änderungen!", vbCritical, t
            Exit Function
        End If
        strFtxt = strf
        If ctlF.ControlType = acComboBox Then
            If left(ctlF.ColumnWidths, 2) Like "0;" Then
                lgcboColumn = 1
            Else
                lgcboColumn = 0
            End If
            strFtxt = Nz(ctlF.column(lgcboColumn))
        End If
    Case Else
        MsgBox "Nur möglich mit Text- oder Kombinationsfeldern!", vbCritical, t
        Exit Function
    End Select
    strf = ctlF.ControlSource
    Set objC = ctlF
    For i = 1 To 4
        Set objC = objC.Parent
        Select Case left(objC.Name, 2)
        Case "F_"
            Set frmHF = Forms(objC.Name)
            If Len(strN) = 0 Then
                strN = frmHF.Name
            End If
            Exit For
        Case "UF"
            strN = objC.Name
        End Select
    Next i
    s = "Mit diesem Feature können Sie auf einen Schlag alle gleichen Eintragungen ändern oder sogar löschen!" & _
              vbNewLine & vbNewLine
    Select Case strN
    Case "F_Adresse"
        nn = 2
        strft(1) = "T_Adresse"
        strft(2) = "T_Funktion"
    Case Else
        nn = 1
        strft(1) = "T" & Mid(strN, InStr(strN, "_"), Len(strN))
    End Select
    For N = 1 To nn
        Set tblT = gcat.Tables(strft(N))
        For Each column In tblT.Columns
            If column.Name Like strf Then
                Select Case column.Type
                Case 135
                   'strLinkC = strF & "=" & CLng(CDate(ctlF.Value))
                    strLinkC = "datediff(d," & strf & ",convert(datetime,''" & ctlF & "''))=0"
               Case 202
                    strLinkC = strf & " like '" & ctlF.Value & "'"
                Case Else
                    strLinkC = strf & " =" & ctlF.Value
                End Select
                If Len(Nz(ctlF.Value, "")) = 0 Then
                    strLinkC = strf & " is null"
                End If
                strSQL = "Select * from " & tblT.Name & " where " & strLinkC
                OH_r rs, , , , True
                If rs.BOF Then
                    lgF = 0
                Else
                    rs.MoveLast
                    lgF = rs.RecordCount & ""
                End If
                If lgF = 0 Then
                    s = s & "< " & ctlF & " > " & vbNewLine & vbNewLine & _
                            "Tragen Sie unten zuerst einen Suchbegriff ein!"
                Else
                    s = s & "< " & ctlF & " >  kommt " & lgF & "* vor!" & vbNewLine & vbNewLine & _
                            "Überschreiben Sie unten den Eintrag mit dem gewünschten Korrekturen!"
                End If
                strHilfe = "Sie können auf einen Schlag alle diese Vorkommen ändern!" & vbNewLine & _
                           "Hinweis:" & vbNewLine & _
                           "Sie können auch unten im weissen Feld einen anderen Suchbegriff eintragen und mit " & _
                           "<Zuerst mal anzeigen> nach diesem Eintrag suchen, um sicher zu gehen, dass Sie wirklich das Richtige tun!!"
                strA(1) = "Korrigieren"
                strA(2) = "löschen"
                strA(3) = "Zuerst mal anzeigen"
                OH_msgbox s, Array(strA(1), strA(2), strA(3)), vbQuestion, _
                            t, _
                            strHilfe, _
                            Nz(ctlF.Value, " "), _
                            ctlF
                strFNew = strMSG(3)
                If ctlF.ControlType = acComboBox Then
                    strFNewtxt = strMSG(5) 'siehe PF_msgbox
                Else
                    strFNewtxt = strFNew
                End If
                Select Case column.Type
                Case 135 '(Datetime)
                    strLinkCNew = "datediff(d," & strf & ",convert(datetime,''" & strFNew & "''))=0"
                    strFUpdate = strf & " = convert(datetime,''" & strFNew & "'')"
                Case 202 'Text'
                    strLinkCNew = strf & " like ''" & strFNew & "''"
                    strFUpdate = strf & " = '" & strFNew & "'"
                Case Else
                    strLinkCNew = strf & " =" & Val(strFNew)
                    strFUpdate = strf & " = " & strFNew
                End Select
                If Len(Trim(strFNew)) = 0 Then
                    strLinkCNew = strf & " is null"
                    strFUpdate = strf & " = null "
                End If
                Select Case Val(strMSG(1))
                Case 1
                    If Nz(ctlF.Value, "") Like Trim(Nz(strFNew, "")) Then
                        x = MsgBox("Sie haben den zu korrigierenden Eintrag <" & strFtxt & "> nicht verändert!" & vbNewLine & _
                                "Nochmal probieren?", vbOKCancel + vbQuestion, t)
                        If x = vbOK Then
                            OH_tlbCorrection
                        End If
                    Else
                        If lgF > 1 Then
                            x = MsgBox("Bestätigen Sie bitte die Korrektur von " & lgF & " Einträgen!" & vbNewLine & _
                                        "<" & strFtxt & ">  ===>" & vbNewLine & _
                                        "<" & strFNewtxt & ">", vbOKCancel + vbQuestion, t)
                            If x = vbCancel Then
                                Exit Function
                            End If
                        End If
                        strSQL = "UPDATE " & tblT.Name & " SET " & tblT.Name & "." & strFUpdate & _
                                " WHERE " & tblT.Name & "." & strLinkC & ";"
                        OH_EX
                        OH_RQ frmHF
                    End If
                Case 2
                    If Not ctlF.Value Like strFNew Then
                        x = MsgBox("Sie haben den zu löschenden Eintrag in <" & strFNew & "> verändert!" & vbNewLine & _
                                "Bestätigen Sie, das Sie alle Vorkommen mit diesem Eintrag löschen wollen!", vbOKCancel + vbQuestion, t)
                        If x = vbCancel Then
                            Exit Function
                        End If
                    End If
                    x = MsgBox("Sie möchten <" & strFNewtxt & "> komplett wegnehmen!" & vbNewLine & _
                            "Bestätigen Sie, das Sie alle Vorkommen mit diesem Eintrag löschen wollen!", vbOKCancel + vbQuestion, t)
                    If x = vbCancel Then
                        Exit Function
                    End If
                    strLinkCNew = tblT.Name & "." & strLinkCNew
                    strSQL = "UPDATE " & tblT.Name & " SET " & tblT.Name & "." & strf & " = null " & _
                            " WHERE " & strLinkCNew
                    OH_EX
                    OH_RQ frmHF
                Case 3
                    If left(strN, 2) Like "UF" Then
                        Select Case frmHF.Name
                        Case "F_Adresse"
                            strf = "NrFunktion"
                        Case Else
                            strf = "Nr" & right(frmHF.Name, Len(frmHF.Name) - 2)
                        End Select
                        strLinkCNew = strf & " in(select " & strf & "  from " & tblT.Name & _
                                      " where " & strLinkCNew & ") "
                    End If
                    OH_RQ frmHF
                End Select
                Exit For
            End If
        Next
    Next N
ErrEnd:
    OH_ResetRS rs
    Exit Function
ErrMsg:
    Select Case Err
    Case 2105, 2501, 2452       '2452 Kein Parent mehr
    Case 3265
        MsgBox "Philipp bedauert: In diesem Feld nicht möglich!", vbCritical, t
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical
    End Select
    Resume ErrEnd
End Function
'siehe hierzu Makro "Autokeys" zur Belegung der Tastaturfunktionen
Public Function OH_shiftF10()
On Error GoTo ErrMsg
    OH_Menu
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_shiftF10"
    Resume ErrEnd
End Function
Public Function OH_ctrlM()
On Error GoTo ErrMsg
    OH_Menu
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_ctrlM"
    Resume ErrEnd
End Function
Public Function OH_ctrlI()
    'eigene Adresse anzeigen
On Error GoTo ErrMsg
    OH_OF "F_Adresse", lguser
    With Forms!F_Adresse
        If .RegMain.Visible Then
            !Nachname.SetFocus
            !lstStichwort.SetFocus
        End If
    End With
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_ctrlI"
    Resume ErrEnd
End Function
Public Function OH_ShiftF1()
On Error GoTo ErrMsg
    OH_HelpMsgBox Screen.ActiveForm
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_ShiftF1"
    Resume ErrEnd
End Function
Public Function OH_ctrlF1()
On Error GoTo ErrMsg
    DoCmd.openForm "PF_Navigator"
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_ctrlF1"
    Resume ErrEnd
End Function
Public Function OH_F1()
On Error GoTo ErrMsg
    OH_New
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F1"
    Resume ErrEnd
End Function
Public Function OH_F3()
On Error GoTo ErrMsg
    OH_tlbPrint
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F3"
    Resume ErrEnd
End Function
Public Function OH_F5()
On Error GoTo ErrMsg
   OH_OF "F_Adresse"
   Forms!F_Adresse!Telefon.SetFocus
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F5"
    Resume ErrEnd
End Function
Public Function OH_F7()
On Error GoTo ErrMsg
    Dim fVG As Form
    If OH_isloaded("PF_NeuVG") Then
        Forms!PF_NeuVG.btnOK_Click
    Else
        OH_VG
        Set fVG = Forms!F_VG
        If fVG!btnVGDetSave.Enabled = True Then
            fVG.RegMain = 2
            fVG.btnVGDetSave_Click
        End If
        fVG.RegMain = 0
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F7"
    Resume ErrEnd
End Function
Public Function OH_F8()
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim fVG As Form
    If OH_isloaded("F_VG") Then
        Set fVG = Forms!F_VG
        lgid = Nz(fVG!nrVGDet, 0)
        fVG.regd = 5
        fVG.RegMain = 2
        If fVG!AnzahlVG.Visible = True Then
            fVG!AnzahlVG.SetFocus
        End If
    Else
        OH_OF "F_Artikel", lgid
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F8"
    Resume ErrEnd
End Function
Public Function OH_F9()
On Error GoTo ErrMsg
    OH_OF "F_Leistung"
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F9"
    Resume ErrEnd
End Function
Public Function OH_F10()
On Error GoTo ErrMsg
    OH_OpenPF_Filter
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F10"
    Resume ErrEnd
End Function
Public Function OH_F11()
On Error GoTo ErrMsg
    OH_tlbFilterField
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F11"
    Resume ErrEnd
End Function
Public Function OH_F12()
On Error GoTo ErrMsg
    AutoExec
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_F12"
    Resume ErrEnd
End Function
Public Function OH_ctrlT()
On Error GoTo ErrMsg
    Set frm = Screen.ActiveForm
    Select Case frm.Name
    Case "F_Adresse"
        OH_DialTelefon frm!NrFunktion, frm!Telefon, frm!namen
    Case "F_VG", "F_Leistung"
        OH_DialTelefon frm!NrFunktion, frm!Telefon, frm!NamePerson
    Case "F_Artikel"
    Case Else
        s = "von hier aus können Sie nicht telefonieren!" & vbNewLine & _
                "Tun Sie das bitte von den Adressen aus (oder Vorgängen!)"
        GoTo ErrMsg1
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_ctrlT"
    Resume ErrEnd
ErrMsg1:
    MsgBox s, _
            vbExclamation, frm.Name & " " & frm.Tag
    GoTo ErrEnd
End Function
Public Sub OH_SortListe(ctlL As control, xL As Single, yL As Single)
' OHNEMUS, Montag, 6. September 2004
'Sortierung der übergebenen Liste nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    Dim strlOld As String
    Dim strL As String
    Dim strS As String
    Dim strSRest As String
    Dim strTxt As String
    Dim strCW() As String
    Dim strlS() As String
    Dim strf(1 To 10, 1 To 2)
    Dim lgCW As Long
    Dim lgInstr As Long
    Dim lgCWsum As Long
    Dim strSplit As String
    Dim N As Long
    DoCmd.Hourglass True
    If yL < 200 Then
        strlOld = ctlL.RowSource
        strL = strlOld
        strCW = Split(ctlL.ColumnWidths, ";")
        For lgCW = 0 To UBound(strCW)
            lgCWsum = lgCWsum + Val(strCW(lgCW))
            If xL < lgCWsum And lgCWsum > 0 Then
                Exit For
            End If
        Next lgCW
        N = InStr(strL, " from ")
        If N = 0 Then
            GoTo ErrMsg1
        End If
        strlS = Split(Trim(Mid(strL, 7, N - 7)), ",")
        N = UBound(strlS)
        If N > 10 Then
            N = 10
        End If
        For i = 1 To N
            strf(i, 1) = Trim(strlS(i))
            strf(i, 2) = Trim(strlS(i))
            lgInstr = InStr(strf(i, 2), " as ")
            If lgInstr > 0 Then
                strf(i, 1) = Trim(left(strlS(i), lgInstr))
                strf(i, 2) = Trim(Mid(strlS(i), lgInstr + 4))
            End If
            If i = lgCW Then
                strS = strf(i, 1)
            End If
        Next i
        lgInstr = InStr(strL, " order by ")
        If lgInstr = 0 Then
            strL = left(strL, Len(strL) - 1) & " order by " & strS & ";"
        Else
            strlS = Split(right(strL, Len(strL) - lgInstr - 8), ",")
            For lgCW = 0 To UBound(strlS)
                strSplit = Trim(strlS(lgCW))
                If lgCW = 0 Then
                    Select Case right(strSplit, 5)
                    Case " desc"
                        If left(strSplit, Len(strSplit) - 5) = strS Then
                            strSRest = strS
                        Else
                            strSRest = strS & "," & strSplit
                        End If
                    Case " asc"
                        If left(strSplit, Len(strSplit) - 5) = strS Then
                            strSRest = strS & " Desc"
                         Else
                            strSRest = strS & "," & strSplit
                       End If
                    Case Else
                        If strSplit = strS Then
                            strSRest = strS & " Desc"
                        Else
                            strSRest = strS & "," & strSplit
                        End If
                    End Select
                Else
                    If strSplit <> strS And _
                        InStr(strSplit & " ", strS & " ") = 0 Then
                            strSRest = strSRest & "," & strSplit
                    End If
                End If
            Next lgCW
            strL = Trim(left(strL, lgInstr)) & " order by " & strSRest
            strlS = Split(strSRest, ",")
            strTxt = "Liste sortiert nach "
            For lgCW = 0 To UBound(strlS)
                For i = 1 To N
                    If strf(i, 1) = strlS(lgCW) Or strf(i, 1) & " asc" = strlS(lgCW) Then
                        strTxt = strTxt & " ==> " & strf(i, 2) & " aufsteigend"
                        Exit For
                    End If
                    If strf(i, 1) & " desc" = strlS(lgCW) Then
                        strTxt = strTxt & " ==> " & strf(i, 2) & " absteigend"
                        Exit For
                    End If
                Next i
            Next lgCW
            SysCmd acSysCmdSetStatus, strTxt
        End If
       ' MsgBox strlOld & vbNewLine & vbNewLine & strl
        ctlL.RowSource = strL
        If ctlL.ListCount < 2 Then
            GoTo ErrMsg1
        End If
    End If
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg1:
    MsgBox "Sorry, diese spezielle Liste kann nach diesem Feld nicht sortiert werden!", _
            vbExclamation, ctlL.ControlTipText
    ctlL.RowSource = strlOld
    GoTo ErrEnd
ErrMsg:
    Select Case Err.number
    Case 9
        Resume ErrMsg1
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_SortListe"
    End Select
    Resume ErrEnd
End Sub
Public Sub OH_SortListeSQL(ctlL As control, xL As Single, yL As Single)
' OHNEMUS, Montag, 6. September 2004
'Sortierung der übergebenen Liste nach Position der Maus mit Berechnung des betroffenen Feldes
On Error GoTo ErrMsg
    Dim strsqlOld As String
    Dim strCW() As String
    Dim lgCW As Long
    Dim lgCWsum As Long
    Dim N As Long
    Dim Y As Long
    If yL < 200 Then
        strsqlOld = ctlL.Recordset.Source
        strCW = Split(ctlL.ColumnWidths, ";")
        For lgCW = 0 To UBound(strCW)
            lgCWsum = lgCWsum + Val(strCW(lgCW))
            If xL < lgCWsum Then
                Exit For
            End If
        Next lgCW
        lgCW = lgCW + 1
        Y = Val(right(strsqlOld, 1))
        If Y = 0 Then
            Y = 1
        End If
        N = InStr(strsqlOld, "@o")
        If N > 0 Then
            strCW(1) = left(strsqlOld, N - 1)
            strCW(2) = Mid(strsqlOld, N + 5)
            strCW(3) = lgCW & " asc"
            If strCW(2) = "'" & strCW(3) & "'" Then
                strCW(3) = lgCW & " desc"
            End If
            strSQL = strCW(1) & "@o = '" & strCW(3) & "'"
            OH_A ctlL.Name, strSQL, Screen.ActiveForm
            If ctlL.ListCount < 2 Then
                GoTo ErrMsg1
            End If
        End If
    End If
ErrEnd:
    Exit Sub
ErrMsg1:
    MsgBox "Sorry, diese spezielle Liste kann nach diesem Feld nicht sortiert werden!", _
            vbExclamation, ctlL.ControlTipText
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 9, 13
        Resume ErrMsg1
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_SortListeSQL"
    End Select
    Resume ErrEnd
End Sub
Public Function OH_FrmNotVisible()
' OHNEMUS, Montag, 27. Dezember 2004
On Error GoTo ErrMsg
    'Trick Formular NICHT schliessen, sondern ausblenden, geht schneller
    Select Case Screen.ActiveForm.Name
    Case "F_Adresse", "F_VG", "F_Artikel", "F_Leistung"
        Screen.ActiveForm.Visible = False
   Case "Menu"
        Forms!Menu.OH_CloseMenu
   Case Else
        DoCmd.Close acForm, Screen.ActiveForm.Name
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_FrmNotVisible"
    Resume ErrEnd
End Function
Public Function OH_GetValue(strS As Variant) As Variant
On Error GoTo ErrMsg
'Umwandlung eines Textfeldes in einen Value
'zB. wird "100 V" übergeben, Rückgabe ==> 100
'Siehe Abfrage A_Stichwort
Dim ascS As Integer
Dim N As String
Dim lgL As Long
    i = 0
    OH_GetValue = Null
    lgL = Len(Nz(strS))
    If lgL > 0 Then
        strS = Trim(Nz(strS))
        While i < Len(strS)
            i = i + 1
            N = Mid(strS, i, 1)
            ascS = Asc(N)       'Buchstabe in ASCII-Zeichen umwandeln
            Select Case ascS
            Case 32, 43, 44, 45, 46, 48 To 57, 177
                OH_GetValue = left(strS, i)
            Case Else
                Exit Function
            End Select
        Wend
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetValue " & strS
    Resume ErrEnd
End Function
Public Function OH_GetUserKZ() As String
On Error GoTo ErrMsg
    OH_GetUserKZ = strUserKZ
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetUserKZ"
    Resume ErrEnd
End Function
Public Function OH_GetEinheit(strS As Variant) As Variant
On Error GoTo ErrMsg
'Umwandlung eines Textfeldes in einen string, die Einheit
'zB. wird "100 V" übergeben, Rückgabe ==> "V"
'Siehe Abfrage A_Stichwort
Dim ascS As Integer
Dim N As Long
Dim r As String
Dim lgL As Long
    lgL = Len(Nz(strS))
    OH_GetEinheit = Null
    If lgL > 0 And IsNumeric(strS) = False Then
        strS = Trim(strS)
        For i = 1 To Len(strS)
            N = Mid(strS, i, 1)
            ascS = Asc(N)       'Buchstabe in ASCII-Zeichen umwandeln
            Select Case ascS
            Case 32, 43, 44, 45, 46, 48 To 57, 177
            Case Else
                OH_GetEinheit = Trim(Mid(strS, i))
                Exit Function
            End Select
        Next i
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetEinheit " & strS
    Resume ErrEnd
End Function
Public Function OH_GetOutputFormatPDF() As Variant
    'Bug in Access wegen unterscheidl. Formaten???
    If SysCmd(acSysCmdAccessVer) Like "11.0" Then
        OH_GetOutputFormatPDF = "PDF Format(*.pdf)"
    Else
        OH_GetOutputFormatPDF = acFormatPDF
    End If
End Function
Public Function OH_HyperlinkPartAddress(strFile As String, _
                    Optional strWO As String, _
                    Optional blMldg As Boolean = True) As String
On Error GoTo ErrMsg
    'der übergebene String wird auf seine Hyperlink-Fähigkeit hin untersucht
    'wenn kein File zu finden ist, wird unterstellt, dass der relative Pfad angegeben ist
    If strWO = "" Then
        strWO = strFile
    End If
    t = "Prüfe auf Hyperlink-Fähigkeit " & strFile
    strFile = HyperlinkPart(strFile, acAddress)
    OH_HyperlinkPartAddress = strFile
    If Len(Dir(strFile)) = 0 Then
        If left(strFile, 2) Like "\\" Or _
           Mid(strFile, 2, 1) Like ":" Then
            OH_HyperlinkPartAddress = ""
        Else
            'prüfe ob der Pfad relativ erfasst wurde
            strFile = OH_GetPathPartFE & strFile
            If Len(Dir(strFile)) = 0 Then
                If InStr(strFile, "%20") > 0 Then
                    strFile = Replace(strFile, "%20", " ")
                    If Len(Dir(strFile)) = 0 Then
                        OH_HyperlinkPartAddress = ""
                    Else
                        OH_HyperlinkPartAddress = strFile
                    End If
                Else
                    OH_HyperlinkPartAddress = ""
                End If
            Else
                OH_HyperlinkPartAddress = strFile
            End If
        End If
    End If
    If OH_HyperlinkPartAddress = vbNullString And blMldg Then
        MsgBox strWO & vbNewLine & strFile & vbNewLine & _
                "Hinweis: der Hyperlink (Bild, File...) ist nicht zu finden!", _
                vbExclamation, "Hyperlink-Kontrolle"
    End If
ErrEnd:
    Exit Function
ErrMsg:
    OH_HyperlinkPartAddress = ""
    Select Case Err
    Case 2501
    Case Else
        MsgBox Err & "  - " & Err.Description, vbCritical, t
    End Select
    Resume ErrEnd
End Function
Public Function OH_LayoutMarker(rpt As Report)
On Error GoTo ErrMsg
    'Das Layout der Stichworte kann beeinflusst werden
    'Fett, gelb, rot, Leer-Feld vor und nach
    With rpt!f1
        .FontWeight = 400
        Select Case rpt!txtMarker
        Case 1
           .BackColor = vbWhite
            .FontWeight = 800
            .FontBold = True
        Case 2
            .BackColor = vbGreen
        Case 3
            .BackColor = vbYellow
        Case 4
            .BackColor = vbRed
        Case Else
            .BackColor = vbWhite
        End Select
        Select Case rpt!txtMarker
        Case 7
            rpt.PrintSection = False
        Case Else
            rpt.PrintSection = True
            lgA = 1
        End Select
        rpt.Det.Visible = rpt.PrintSection
    End With
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & "  - " & Err.Description, vbCritical, t
    End Select
    Resume ErrEnd
End Function
Public Function OH_setlist(ctlL As control, _
                           strQ As String, _
                           lgWidths As Long, _
                           strwidths As String, _
                           strTagCtl As String) As Long
' OHNEMUS, Montag, 18. Dezember 2006
On Error GoTo ErrMsg
    Dim strCW() As String
    Dim lgW As Long
    With ctlL
        .ColumnCount = lgWidths
        'Übergabe OHNE cm-Eintrag
        .ColumnWidths = Replace(strwidths, ";", "cm;") & "cm"
        .Tag = strTagCtl
        .ColumnHeads = True
        OH_A ctlL.Name, strSQL
        ctlL.Selected(1) = True
        ctlL.SetFocus
    End With
    OH_setlist = ctlL.ListCount - 1
    If OH_setlist < 0 Then
        OH_setlist = 0
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2427
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_setlist"
    End Select
    Resume ErrEnd
End Function
Public Function OH_getTitel(frmDS As Form) As String
On Error GoTo ErrMsg
    For Each ctl In frmDS.Det.Controls
        If left(ctl.Tag, 1) Like "m" Then
            OH_getTitel = Trim(OH_getTitel & " - " & ctl)
        End If
    Next ctl
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2427
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_getTitel"
    End Select
    Resume ErrEnd
End Function
Public Function OH_SyncS(frmSync As Form)
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim strB As String
    VarAntw = "NoForm_Current"
    lgid = Nz(frmSync!f0)
    OH_RQf frmSync, lgid
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2427
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_SyncS"
    End Select
    Resume ErrEnd
End Function
Public Function OH_replaceFilter(strFilter As String, strFName As String) As String
On Error GoTo ErrMsg
    strFilter = Replace(strFilter, "'", "''")
    strFilter = Replace(strFilter, "Alike", "Like")
    strFilter = Replace(strFilter, """", "''")
    strFilter = Replace(strFilter, strFName & ".", "")
    OH_replaceFilter = strFilter
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        OH_CB
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_replaceFilter"
    End Select
    Resume ErrEnd
End Function
Public Function OH_RS_Enter(Optional lgid As Long = 0, Optional strR As String = "")
On Error GoTo ErrMsg
    'setze beim Hingehen die Rowsource, zb. "Exec dbo.spa_Z Beruf_enter"
    'erfordert im T_SQL enstpr. Pendant
    If left(Screen.ActiveForm.Name, 2) <> "PF" Then
        Set ctl = Screen.ActiveControl
        strSQL = "Exec dbo.spa_Z " & ctl.Name & "_Enter," & lgid & " ,'" & strR & "'"
        OH_A ctl.Name, strSQL
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        OH_CB
        MsgBox Err.number & " " & Err.Description, vbCritical, "mdl_OH.OH_RS_Enter, setze Rowsource"
    End Select
    Resume ErrEnd
End Function
Public Function OH_txtFind(ByVal f As Form, strS As String, Optional lgid As Long)
'Textsuche im jeweiligen Formular im gelben Suchfeld
On Error GoTo ErrMsg
    Dim strf As String
    Dim strFrm As String
    Dim lgLc As Long
    strf = Nz(f!txtFind, "")
    Select Case left(strf, 2)
    Case "N:"
        Select Case f.Name
        Case "F_VG", "F_Leistung"
        Case Else
            OH_VG
            Set f = Forms!F_VG
        End Select
        GoTo FindData
    End Select
    Select Case Mid(strf, 2, 1)
    Case ":"
        Select Case left(strf, 1)
        Case "A", "P"
            strFrm = "Adresse"
            mdlTlb.OH_Adresse
        Case "B"
            strFrm = "Begriff"
            OH_OF "F_Begriff"
        Case "F"
            strFrm = "Filter"
            OH_OF "F_Filter"
        Case "C"
            strFrm = "Audit"
            OH_OF "F_Audit"
        Case "V"
            strFrm = "VG"
            mdlTlb.OH_VG
        Case "Q"""
            strFrm = "QK"
            OH_OF "F_QK"
        Case "L"
            strFrm = "Leistung"
            mdlTlb.OH_Leistung
        Case "R"
            strFrm = "Artikel"
            mdlTlb.OH_Artikel
        Case "X"
            strFrm = "Lexikon"
            OH_OF "F_Lexikon"
        Case "W"
            strFrm = "Warengruppe"
            OH_OF "F_Warengruppe"
        Case "S" 'Stichworte suchen
            GoTo FindData
        Case Else
            strFrm = Mid(f.Name, 3)
        End Select
        f!txtFind = Null
        Set f = Forms("F_" & strFrm)
        strf = Trim(Mid(strf, 3))
        f!txtFind = strf
        f.txtFind_AfterUpdate
        GoTo ErrEnd
    End Select
    Select Case strf
    Case "Reset Filter"
        f!txtFind = ""
        Select Case f.Name
        Case "F_Adresse"
            f.OH_ResetFilterFrm
            GoTo ErrEnd
        End Select
    End Select
FindData:
    With f!lstDet
        If .ColumnHeads Then
            lgLc = 1
        Else
            lgLc = 0
        End If
        OH_A "lstDet", strS, f
        f!countRec = .ListCount - lgLc
        If f!countRec > 0 Then
            f!countRec.ForeColor = vbBlack
            f!countRec.BackColor = f!txtFind.BackColor
            .SetFocus
            f!lstDet = OH_setLst(f!lstDet, lgid)
            f.lstDet_AfterUpdate
        Else
            f!countRec.BackColor = RGB(255, 132, 125) 'hellrot
            f!countRec = 0    ' so wird eine -1 vermieden, wenn keine records gefunden wurden
        End If
        s = "Liste der gefilterten (" & f!countRec & ") Daten für " & f.Tag & vbNewLine & _
        "Verwenden Sie die Pfeiltasten, um zu blättern." & vbNewLine & _
        "Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"
        .ControlTipText = s
    End With
    If Nz(f!txtFind, "") <> "" Then
        OH_SaveLastFind f!txtFind, f!comtxtFind
    End If
    If OH_ControlExists("countRec", f) And OH_ControlExists("lstTopA", f) Then
        If f!countRec > 0 Then
            If f!countRec = Val(Nz(f!lstTopA, 0)) Then
                f!countRec.BackColor = RGB(189, 255, 196) 'hellgrün
            End If
        End If
    End If
    For Each ctl In f.Det.Controls
        If ctl.Tag = "FilterForm" Then
            OH_SetBackcolor ctl
        End If
    Next ctl
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case 2110 'focus kann nicht verschoben werden
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_txtFind"
    End Select
    Resume ErrEnd
End Function
Public Function OH_SaveLastFind(ctlF As control, ctlComF As control)
On Error GoTo ErrMsg
    Dim strf As String
    Dim strFF As String
    'ergänze im Feld comtxtFind die Rowsource mit denm Suchstring
    If Not IsNull(ctlF.Value) Then
        ctlF.SetFocus
        strf = ctlF.Text
        strFF = ctlComF.RowSource
        If InStr(";" & strFF & ";", ";" & strf & ";") = 0 Then
            strFF = left(strf & ";" & strFF, 255)
            ctlComF.RowSource = strFF
        End If
        strf = "Reset Filter" 'Soll immer an erster Stelle stehen
        If InStr(";" & strFF & ";", ";" & strf & ";") = 0 Then
            strFF = left(strf & ";" & strFF, 255)
        Else
            strFF = Replace(Replace(strFF, strf, ""), ";;", ";")
            strFF = left(strf & ";" & strFF, 255)
        End If
        ctlComF.RowSource = strFF
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        'MsgBox err.Number & " " & err.Description, vbCritical, "mdl_OH.OH_SaveLastFind"
    End Select
    Resume ErrEnd
End Function
Public Function OH_PF_Tab(strFrm As String, _
                        Optional strX As String = "", _
                        Optional strY As String, _
                        Optional lgedit As Long = 0)
On Error GoTo ErrMsg
    Dim lgF As Long
    Dim N As Long
    Dim Y As Long
    Dim z As Long
    Dim strCS As String
    Dim strEditFields As String
    Dim strf() As String
    Dim strFi(0 To 50, 0 To 2) As String
    Dim frmPF As Form
    Dim lgDatamode As Long
    Dim lgPopup As Long
    Dim strT As String
    DoCmd.Hourglass True
    t = "Liste"
    glID = lgedit
    OH_closeObj "PF_TAB"
    Set frm = Forms(strFrm)
    Select Case frm.Name
    Case "Menu"
        t = frm!lstA.column(1)
    Case "F_Lexikon"
        t = frm!Begriff
    Case "F_Warengruppe"
        t = frm!WarenGruppe
    Case "F_QK"
        t = frm!QK
    Case Else
'        strY = frm!lstDet.RowSource
'        z = Nz(frm!countRec, 0)
'        If z = 0 Then
'            s = "Keine Daten vorhanden!"
'            GoTo ErrMsg1
'        End If
        Select Case strX
        Case "lstd"
            strY = frm!lstD.RowSource
            strX = frm!lstL.column(1) & " " & frm!lstact.column(1)
            t = t & " " & strX
            z = frm!countRecD
        Case ""
            t = t & " " & _
                        frm!lstA.column(1) & " " & _
                        frm!lstTopA.column(1)
        Case Else
            t = strX
        End Select
    End Select
    s = "Wie wollen Sie die Tabelle anschauen?" & vbNewLine & vbNewLine & _
        "1" & vbTab & "In Excel" & vbNewLine & _
        "2" & vbTab & "Als weiteres Register" & vbNewLine & _
        "3" & vbTab & "Als separates Formular"
    t = "Tabellen-Übersicht!"
    lgPopup = Val(InputBox(s, t, 1))
    Select Case lgPopup
    Case 1
        OH_InsertID_LST frm!lstDet
        strSQL = "Exec dbo.spa_" & Mid(frm.Name, 3) & _
                 " @x = 'PF_TAB'" & _
                 ",@f = '" & frm!txtFind & "'"
        OH_EXCEL strSQL, t, , True
        GoTo ErrEnd
    Case 2
        strT = t & " Doppel-Klicken zum Zeigen der Daten"
    Case 3
        strT = t & "  Klicken zum Zeigen der Daten"
    Case Else
        GoTo ErrEnd
    End Select
    DoCmd.openForm "PF_Tab", acDesign, , , , acHidden
    Set frmPF = Forms!PF_TAB

    frmPF.Caption = Replace(t, "'", ".")
    frmPF.Tag = strFrm
    If lgPopup = 3 Then
        frmPF.PopUp = True
    Else
        frmPF.PopUp = False
    End If
    i = -1
    For Each ctl In frmPF.Det.Controls
        i = i + 1
        With ctl
            .TabIndex = i
            .ControlSource = ""
            .Name = "f" & i
            .ColumnHidden = True
        End With
    Next ctl
    If strY = "" Then
        strSQL = "Exec dbo.spi_Verlauf " & _
            " @x = 'PF_TAB'" & _
            ", @u = " & lguser & _
            ", @f = '" & Replace(frmPF.Caption, "'", ".") & _
            "', @b = 6"
        OH_r r
        If Not r.BOF Then
            Y = -1
            strf = Split(r!Felder, ";")
            z = UBound(strf)
            For i = 0 To z
                N = i Mod (3)
                Select Case N
                Case 0
                    Y = Y + 1
                    strFi(Y, 0) = strf(i)
                Case 1
                    strFi(Y, 1) = strf(i)
                Case 2
                    strFi(Y, 2) = strf(i)
                End Select
            Next i
        End If
        If frm.Name = "Menu" Then
            strSQL = "Exec dbo.spa_Div 'Recordsource', " & frm!lstA
            OH_r r
            strSQL = r(0)
        Else
            OH_InsertID_LST frm!lstDet
            If lgedit = 0 Then
                lgDatamode = acFormReadOnly
                frmPF.Caption = frm.Caption & " in Tabellenform"
                strSQL = "Exec dbo.spa_" & Mid(frm.Name, 3) & _
                         " @x = 'PF_TAB'"
            Else
                lgDatamode = acFormEdit
                For i = 3 To 4
                    strSQL = "Exec dbo.spA_Filter " & _
                            " @x ='lstedit', " & _
                            " @a = " & i & ", " & _
                            " @i = " & lgedit
                    If i = 3 Then
                        OH_r r
                        If Not r.BOF Then
                            strEditFields = r!editFields
                        End If
                    End If
                Next i
            End If
        End If
    Else
        strSQL = strY
    End If
    VarAntw = "Start"
    If OH_setQdf("qdfTab", strSQL) = 0 Then
        DoCmd.Close acForm, "PF_TAB"
        GoTo ErrEnd
    End If
    frmPF.RecordSource = "qdfTab"
    frmPF.Filter = ""
    frmPF.OrderBy = ""
    OH_r r
    lgF = r.Fields.count - 1
    If lgF > 30 Then
        lgF = 30
    End If
    i = -1
    For Each ctl In frmPF.Det.Controls
        i = i + 1
        With ctl
            strCS = r.Fields(i).Name
            .ControlSource = strCS
            .ColumnOrder = i + 1
            .TabIndex = i
            .Name = strCS
            .Format = ""
            .TextAlign = 1
            Select Case strCS
            Case "Betrag", _
                 "Offen", _
                 "Anzahl", _
                 "EUR", _
                 "Summe", _
                 "Kurs", _
                 "Gesamt"
                 .Format = "standard"
                 .DecimalPlaces = 2
                 .TextAlign = 3
            End Select
            If InStr(strCS, "Datum") > 0 Or _
               InStr(strCS, "Termin") > 0 Then
                 .Format = "dd.mm.yy"
                 .TextAlign = 2
            End If
            If InStr(strCS, "Hyperlink") > 0 Then
                 .IsHyperlink = True
            End If
            If left(strCS, 2) = "Nr" Or strCS = "ID" Then
                .ColumnWidth = 1
                .ColumnHidden = False
            Else
                .ColumnHidden = False
                For z = 1 To Y
                    If strCS = strFi(z, 0) Then
                        .ColumnOrder = strFi(z, 1)
                        .ColumnWidth = strFi(z, 2)
                    End If
                Next z
                 .ColumnWidth = -2
                 .Enabled = True
               If InStr(strEditFields, strCS) = 0 Then
                    .Locked = True
                    .TabStop = False
                Else
                    .Locked = False
                    .TabStop = True
                End If
            End If
        End With
        If i >= lgF Then
            Exit For
        End If
    Next ctl
'    If lgDatamode = acFormEdit Then
'        frmPF.RecordSource = "Select * from vwProvision Order by 1 "
'    End If
    DoCmd.Close acForm, "PF_Tab", acSaveYes
    DoCmd.openForm "PF_Tab", acFormDS, , , lgDatamode, acWindowNormal
    Set frmPF = Forms!PF_TAB
    frmPF.Caption = strT
    frmPF.Visible = True
    OH_ResetRS r
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 29068
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "Form_Open PF_TAB"
        Resume ErrEnd
    End Select
ErrMsg1:
    MsgBox s, vbCritical, t
    GoTo ErrEnd

End Function
Function fIsAppRunning(ByVal strAppName As String, _
        Optional fActivate As Boolean) As Boolean
    Dim lngH As Long, strClassName As String
    Dim lngX As Long, lngTmp As Long
    Const WM_USER = 1024
    On Local Error GoTo fIsAppRunning_Err
    fIsAppRunning = False
    Select Case LCase$(strAppName)
        Case "excel":       strClassName = "XLMain"
        Case "word":        strClassName = "OpusApp"
        Case "access":      strClassName = "OMain"
        Case "powerpoint95": strClassName = "PP7FrameClass"
        Case "powerpoint97": strClassName = "PP97FrameClass"
        Case "notepad":     strClassName = "NOTEPAD"
        Case "paintbrush":  strClassName = "pbParent"
        Case "wordpad":     strClassName = "WordPadClass"
        Case Else:          strClassName = vbNullString
    End Select

    If strClassName = "" Then
        lngH = apiFindWindow(vbNullString, strAppName)
    Else
        lngH = apiFindWindow(strClassName, vbNullString)
    End If
    If lngH <> 0 Then
        apiSendMessage lngH, WM_USER + 18, 0, 0
        lngX = apiIsIconic(lngH)
        If lngX <> 0 Then
            lngTmp = apiShowWindow(lngH, SW_SHOWNORMAL)
        End If
        If fActivate Then
            lngTmp = apiSetForegroundWindow(lngH)
        End If
        fIsAppRunning = True
    End If
fIsAppRunning_Exit:
    Exit Function
fIsAppRunning_Err:
    fIsAppRunning = False
    Resume fIsAppRunning_Exit
End Function
Public Function OH_Perm(strP As String, _
                        Optional frmP As Form, _
                        Optional strT As String, _
                        Optional blmsg As Boolean = True, _
                        Optional lgid As Long) As Boolean
On Error GoTo ErrMsg
'prüfen, ob Berechtigung vorliegt!
    OH_Perm = True
    If frmP Is Nothing Then
        Set frmP = Screen.ActiveForm
    End If
    If strT = "" Then
        strT = frmP.Tag
    End If
    strSQL = "Exec dbo.spi_Permission" & _
            " @x = 'CheckPermission', " & _
            " @f = '" & strT & "'," & _
            " @d = '" & strP & "', " & _
            " @i = " & lgid
    OH_r r
    OH_Perm = r!Permission = 0
    Select Case strP
    Case "D"
        strP = "LÖSCHEN"
    Case "I"
        strP = "DATEN HINZUFÜGEN"
    Case "U"
        strP = "ÄNDERN"
    End Select
    s = ""
    If OH_Perm And blmsg Then
        GoTo ErrMsg1
    Else
        If strT = "VG" Then
            If Len(r!RechteQK) > 1 Then
                If InStr(strRole, r!RechteQK) = 0 And glAdmin = 0 Then
                    s = "Nur für Mitglieder:" & vbNewLine & _
                            r!RechteQK
                    OH_Perm = True
                    GoTo ErrMsg1
                End If
            End If
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbExclamation, "OH_Perm"
    End Select
    Resume ErrEnd
ErrMsg1:
    MsgBox "Sie haben nicht die erforderlichen Berechtigungen!" & vbNewLine & _
            strP & " ist nicht erlaubt!" & vbNewLine & vbNewLine & _
            s, vbCritical, strT & " " & strP
    GoTo ErrEnd
End Function
Public Function OH_Valid_Mail_URL(strC As String, _
                                Optional strMU As String = "Email", _
                                Optional ctlV As control) As Boolean
On Error GoTo ErrMsg
    Dim strMid1 As String
    Dim strZeichen As String
    Dim lgI As Long
    t = "Prüfe übergebene Adressen!"
'ersetzt in einem übergebenen Control Umlaute (z.B. "Kühl" ==> "Kuehl")
    OH_Valid_Mail_URL = True
    If strC = "" Then
        GoTo ErrEnd
    End If
    strC = Trim(strC) '200302 Input Jörn
    If InStr(strC, ".") = 0 Then '120121 gb
        s = "Ein Punkt (.) ist erforderlich!"
        GoTo ErrM
    End If
    Select Case strMU
    Case "Internet"
        strC = HyperlinkPart(strC, acAddress)
    Case Else
        i = InStr(strC, "@")
        If i = 0 Then
            s = "EIN einziges @ ist erforderlich!"
            GoTo ErrM
        End If
        If Len(strC) - Len(Replace(strC, "@", "")) > 1 Then
            s = "Ein @ wäre erforderlich, nicht mehrere!"
            SysCmd acSysCmdSetStatus, s & " " & strC  '200603 Input Dirk; Mehrere Mail-Adressen zulassen
        End If
        If InStr(i + 2, strC, ".") = 0 Then '200302
            s = "Nach dem @ ist ein Punkt erforderlich"
            GoTo ErrM
        End If
    End Select

    For lgI = 1 To Len(strC)
        strMid1 = Mid(strC, lgI, 1)
        strZeichen = strMid1
        Select Case strMid1
        Case "'" '160321
            strMid1 = ""
        Case "ä"
            strMid1 = "ae"
        Case "ö"
            strMid1 = "oe"
        Case "ü"
             strMid1 = "ue"
        Case "ß"
            strMid1 = "ss"
        Case "é"
            strMid1 = "e"
        Case "æ"
            strMid1 = "c"
        Case "Š"
            strMid1 = "s"
        Case "á"
            strMid1 = "a"
        End Select
        Select Case strMid1
        Case ";"
            s = "Semikolon ist nur erlaubt zur Trennung mehrerer Email-Adressen."
            If MsgBox(s, vbExclamation + vbOKCancel, t) = vbCancel Then
                OH_Valid_Mail_URL = False
                GoTo ErrEnd
            End If
        Case "(", ")", "{", "}", "[", "]", "/", "&", _
             "%", "$", "§", """", "!", "#", "*", "+", _
             "'", " ", "|", "°", "~", ">", "<"
            If strMU Like "internet" Then
                Select Case strMid1
                Case "#", "/", " "
                    strMid1 = vbNullString
                End Select
            End If
            If Len(strMid1) > 0 Then
                If strZeichen Like " " Then
                    strZeichen = "  Leerschlag  "
                End If
                s = strC & vbNewLine & vbNewLine & _
                       "Das Zeichen" & vbNewLine & vbNewLine & _
                       strZeichen & vbNewLine & vbNewLine & _
                       "ist nicht erlaubt!"
                GoTo ErrM
            End If
        Case Else
            If strZeichen Like strMid1 Then
                strMid1 = vbNullString
            End If
        End Select
        If Len(strMid1) > 0 Then
            strC = Replace(strC, strZeichen, strMid1)
        End If
    Next lgI
    If Not ctlV Is Nothing Then
        ctlV = strC
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Prüfe übergebene Adresse"
    Resume ErrEnd
ErrM:
    MsgBox strMU & " " & strC & vbNewLine & vbNewLine & s, vbCritical, "Namens-Kontrolle " & strMU
    OH_Valid_Mail_URL = False
    GoTo ErrEnd
End Function
Public Function OH_Move(frmM As Form, lgLeft, lgTop, lgWidth, lgHeight)
On Error GoTo ErrMsg
    'Formularlage definieren
    frmM.Move lgLeft * 56.7, _
               lgTop * 56.7, _
               lgWidth * 56.7, _
               lgHeight * 56.7
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_Move  Formular-Lage definieren"
    Resume ErrEnd
End Function
Public Function OH_RT(ctlrt As control)
On Error GoTo ErrMsg
    Set ctl = ctlrt
    DoCmd.openForm "pfrmRT"
    t = Nz(ctl.ControlTipText, "Editiere Text " & ctl.Name)
    If InStr(t, "editier") = 0 Then
        t = "Editiere Text " & t
    End If
    With Forms!pfrmRT
        .Caption = t
    End With
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_RT"
    Resume ErrEnd
End Function

Public Function OH_setRTFont(frm As Form, ctl As control, Optional strE As String)
On Error GoTo ErrMsg
    Dim lgFontSize As Long
    Dim strO As String
    Dim strN As String
    Dim strf As String
    Dim strFF As String
    Dim N As Long
    Dim Y As Long
    If IsNull(ctl) Then
        GoTo ErrEnd
    End If
    If strE = "Email" Then
        strf = glstrFontEmail
    Else
        strf = glstrFont
        lgFontSize = 10
        If Mid(StrReverse(strf), 3, 1) = " " Then
            lgFontSize = Val(right(strf, 2))
            strf = left(strf, Len(strf) - 3)
        End If
    End If
    If strf = "" Then
        strf = "Arial"
    End If
'<div><font face=Arial size=2>qqqqqqq</font></div>
    strFF = "<font face="
    i = InStr(Nz(ctl), strFF)
    If i > 0 Then
        Y = InStr(i + 10, ctl, ">")
        strO = Mid(ctl, i, Y - i)
        i = InStr(strO, "size")
        If i > 0 Then
            strO = Trim(left(strO, i - 1))
        End If
        strN = strFF & strf
        If strO <> strN Then
            ctl = Replace(ctl, strO, strN)
        End If
    Else
        ctl = "<div><font face=" & glstrFont & " > " & ctl & "</font></div>"
    End If
    OH_SaveRS frm
    SysCmd acSysCmdSetStatus, strE & " Standardfont = " & strf
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_setRTFont"
    End Select
    Resume ErrEnd
End Function
Public Property Get OH_AppProjectName() As String
'http://www.aboutvb.de/khw/artikel/khwappprojectname.htm
'110112
On Error Resume Next
  Err.Raise 999
  OH_AppProjectName = Err.Source
  On Error GoTo 0
End Property
Public Function OH_IsFileOpen(ByVal strFile_Path As String) As Long
    Dim fileNum As Long, errNumber As Long
    On Error Resume Next
    If Len(Dir(strFile_Path)) = 0 Then
        strFile_Path = 0
    Else
        fileNum = FreeFile()
        Open strFile_Path For Input Lock Read As #fileNum
        Close fileNum
        errNumber = Err
        On Error GoTo 0

        Select Case errNumber
            Case 0
                OH_IsFileOpen = 1
            Case 70
                OH_IsFileOpen = 2
            Case Else
                Error errNumber
        End Select
    End If
End Function
Public Function OH_PathRights( _
                ByVal strPath As String) _
                As Boolean
  Dim blWrite As Boolean
  Dim blDelete As Boolean
  Dim strFName As String, FNum As Integer
  Const cstrTmpFile = "\~tmp.txt"

  On Error Resume Next
  OH_PathRights = False 'Default: Problem
  blWrite = False
  blDelete = False
  'Ordnerpfad ggf. anpassen
  If right(strPath, 1) = "\" Then
    strPath = left(strPath, Len(strPath) - 1)
  End If
  'Und prüfen...
  If Dir$(strPath, vbDirectory) <> "" Then 'Ordner
    FNum = FreeFile
    strFName = strPath & cstrTmpFile
    Err.Clear
    Open strFName For Output As FNum
    Print #FNum, " "
    Close #FNum
    blWrite = (Err.number = 0)
    If blWrite Then 'Kann auch gelöscht werden?
      Err.Clear
      OH_KILL strFName
      blDelete = (Err.number = 0)
    End If
    OH_PathRights = (blWrite = True And blDelete = True)
  Else
    MsgBox "Ordner '" & strPath & "' nicht gefunden...", _
           vbOKOnly + vbExclamation, _
           "OH_PathRights:"
  End If

End Function

Function OH_ValueIn(aValue As Variant, _
                 ParamArray Paras() As Variant) As Boolean
  Dim i&

  On Error Resume Next
  For i = 0 To UBound(Paras)
    If aValue = Paras(i) Then
      OH_ValueIn = True
      Exit For
    End If
  Next i

End Function

Function OH_ValueBetween(aValue As Variant, _
                      aVal_1 As Variant, _
                      aVal_2 As Variant) As Boolean

  On Error Resume Next
  OH_ValueBetween = (aValue >= aVal_1 And aValue <= aVal_2)

End Function

'Private Sub ConvertToText()
'
' Dim rstRecordset As New adodb.Recordset
' Dim RTFControl As New RichTextLib.RichTextBox
'
' rstRecordset.Open” "SELECT TABLE.Comments FROM TABLE;", Application.CurrentProject.Connection, adOpenStatic, adLockPessimistic
'
' rstRecordset.MoveFirst
'
' Do Until rstRecordset.EOF = True
' If Len(rstRecordset!Comments) > 0 Then
' RTFControl.TextRTF = rstRecordset!Comments
' rstRecordset!Comments = RTFControl.Text
' End If
' rstRecordset.MoveNext
' Loop
'
'rstRecordset.Close
'
'MsgBox "Finished converting to text", vbInformation
'
'End Sub
'



Public Function OH_ENVIRON()
  Dim iIndex As Integer
  Dim sResult As String
  Dim sKey As String
  Dim sValue As String
  Dim iPos As Integer
  Dim itemX As ListItem
 OH_ResetID
    ' Environ() durchlaufen
    ' Beginnen mit 1
    iIndex = 1
    s = ""
    Do
      ' Umgebungsvariable auslesen
      sResult = Environ(iIndex)

      ' Wird ein Leerstring zurückgegeben, so ist das
      ' Ende der Liste erreicht
      If sResult <> "" Then

        ' = suchen
        iPos = InStr(sResult, "=")
        sKey = left$(sResult, iPos - 1)
        sValue = Mid$(sResult, iPos + 1)
        s = s & vbNewLine & _
                iPos & vbTab & sKey & vbTab & sValue
        ' dem ListView hinzufügen
      End If
        strSQL = "Insert into T_ID (ID,IDt1,IDT3) Values (" & iPos & ",'" & sKey & "','" & sValue & "')"
        OH_EX
      ' Index um 1 erhöhen
      iIndex = iIndex + 1
    Loop Until sResult = ""
    MsgBox s
End Function
Public Function HTMLtoText(sString As String) As String
    Dim lPos1 As Long
    Dim lPos2 As Long
    Dim sWork As String

    sWork = sString
    sWork = Replace(sWork, vbCrLf & vbCrLf, vbCrLf)
    sWork = Replace(sWork, "", vbCrLf)
    sWork = Replace(sWork, "", vbCrLf)
    sWork = Replace(sWork, " ", " ")
    sWork = Trim(sWork)

    lPos1 = InStr(1, sWork, "<")
    Do While lPos1 > 0
        lPos2 = InStr(lPos1 + 1, sWork, ">")
        If lPos2 > 0 Then
            sWork = left(sWork, lPos1 - 1) & " " & Mid(sWork, lPos2 + 1)
        End If
        lPos1 = InStr(lPos1 + 1, sWork, "<")
    Loop

    sWork = Replace(sWork, "   ", " ")
    sWork = Replace(sWork, "  ", " ")
    sWork = Trim(sWork)

    HTMLtoText = sWork

End Function

Public Function OH_CheckNotNull(frmN As Form) As Boolean
On Error GoTo ErrMsg
    For i = 0 To frmN.Det.Controls.count - 1
        Set ctl = frmN.Det.Controls(i)
        Select Case ctl.ControlType
        Case acComboBox, acTextBox
            If ctl.BorderColor = 2366701 Then
                Select Case Nz(ctl, "")
                Case "", " ", ".", ","
                    ctl.SetFocus
                    s = "Bitte das rot umrandete Feld ausfüllen" & vbNewLine & _
                                "Feldname:" & vbTab & ctl.Name & vbNewLine & _
                                "Tiptext:" & vbTab & vbTab & ctl.ControlTipText
                    MsgBox s, vbExclamation, "vollständige Eingabe (kein Punkt, Komma oder Leerschlag )überprüfen"
                    OH_CheckNotNull = True
                    GoTo ErrEnd
                End Select
            End If
        End Select
    Next i
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CheckNotNull"
    Resume ErrEnd
End Function
Public Function OH_CheckFromTo(lgS As Long, lgF As Long, lgT As Long) As Long
On Error GoTo ErrMsg
    Dim strM As String
    Dim strA As String
checkAgain:
    If lgS < lgF Then
        strM = "klein"
    End If
    If lgS > lgT Then
        strM = "gross"
    End If
    If strM = "" Then
        OH_CheckFromTo = lgS
    Else
        OH_CheckFromTo = False
        strM = "Die eingegebene Zahl " & lgS & " ist zu " & strM & "!" & vbNewLine & vbNewLine & _
                "Bitte eine ganze Zahl eingeben," & vbNewLine & _
                "die zwischen " & lgF & " und " & lgT & " liegt..."
        strA = InputBox(strM, "Prüfe, ob Eingabe stimmt!")
        If strA = "" Then
            lgS = lgF - 1
        Else
            lgS = Val(strA)
            strM = ""
            GoTo checkAgain
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_CheckFromTo"
    Resume ErrEnd
End Function
Public Function OH_GUID() As String
On Error GoTo ErrMsg
'Globally Unique IDentifier
    strSQL = "Select NEWID() as GUID"
    OH_r r
    OH_GUID = r!GUID
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox "OH_GUID:" & Err.Description
    Resume ErrEnd
End Function
Function OH_GetSelectedFilesInWinExplorers(lgFunktion As Long, lgVG As Long) As Long
On Error GoTo ErrMsg
    Dim N As Long
    Dim strCurrSelFile As String
    Dim ExpWin As Object
    Set ExpWin = New SHDocVw.ShellWindows
    Dim CurrWin As SHDocVw.InternetExplorer
    On Error Resume Next
    OH_ResetID
    For Each CurrWin In ExpWin
        If Not CurrWin.Document Is Nothing Then
            If Not CurrWin.Document.FocusedItem Is Nothing Then
                strCurrSelFile = CurrWin.Document.FocusedItem.path
                If Len(Dir(strCurrSelFile)) > 0 And strCurrSelFile <> "" Then
                    N = N + 1
                    'File als Zwischenablage in T_ID speichern:
                    strSQL = "EXEC dbo.dms " & _
                            "  @x = 'AddtoAblage' " & _
                            ", @f ='" & OH_RPL(strCurrSelFile) & _
                            "',@d ='" & OH_RPL(OH_GetNamePart(strCurrSelFile)) & _
                            "',@n = " & N & _
                            ", @i =  " & lgFunktion & _
                            ", @a = " & lgVG
                    OH_EX
                End If
            End If
        End If
    Next CurrWin
    OH_GetSelectedFilesInWinExplorers = N
    If N = 0 Then
        s = "Sie haben im Windows Explorer keine Files (Dateien) markiert!" & vbNewLine & _
            "Markieren Sie dort zuerst die gewünschten Files." & vbNewLine & _
            "(mit SHIFT / CTRL -Taste können Sie auch mehrere Files zuordnen...)"
        GoTo ErrM
    End If
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_GetSelectedFilesInWinExplorers"
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
    GoTo ErrEnd
End Function
Function OH_GetScanFiles(lgid As Long) As Long
On Error GoTo ErrMsg
    Dim objFSO As Object
    Dim objFolder As Object
    Dim objFile As Object
    Dim strFO As String
    Dim strFN As String
    Dim strPN As String
    Dim N As Long
    Dim z As Long
    OH_ResetID

    'Create an instance of the FileSystemObject
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    'Get the folder object
    Set objFolder = objFSO.GetFolder(glScanFolder)
    i = 1
    'loops through each file in the directory and prints their names and path
    '180729 im Scan-Filename hat sich ein "KOMISCHES" ä eingeschlichen, das beim Einlesen als a mit ascii-Zeichen 168 ¨ erkannt wird.
        'dieses Zeichen wird deshalb eliminiert und das File umbenannt. (siehe Mail Dirk vom Mo 23.07.18 17:35)
    For Each objFile In objFolder.Files
        N = N + 1
        strFN = ""
        strFO = objFile.Name
        strPN = glScanFolder & "\" & strFO
        For z = 1 To Len(strFO)
            If Asc(Mid(strFO, z, 1)) <> 168 Then
                strFN = strFN & Mid(strFO, z, 1)
            End If
        Next z
        If strFO <> strFN Then
            strPN = glScanFolder & "\" & strFN
            objFSO.MoveFile objFile, strPN
        End If
        strSQL = "EXEC dbo.dms " & _
                " @x = 'AddtoAblage' " & _
                ",@f ='" & OH_RPL(strPN) & _
                "',@d ='" & OH_RPL(strFN) & _
                "', @n = " & N & _
                ", @a =  " & lgid
        OH_EX
    Next objFile
    OH_GetScanFiles = N
    Set objFSO = Nothing
    Set objFolder = Nothing
    Set objFile = Nothing
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_GetScanFiles"
    Resume ErrEnd
End Function
Public Function OH_Mail_to_DMS(lgFunktion As Long, _
                            lgVG As Long, _
                            lgOption As Long, _
                            Optional blClear As Boolean = True, _
                            Optional ByRef oMail As Outlook.MailItem) As Long
'251121 Funktion umbenannt von OH_Mail in OH_Mail_to_DMS
On Error GoTo ErrMsg
    Dim A As Outlook.Attachment
    Dim olExp As Outlook.Explorer
    Dim olSel As Outlook.Selection
    Dim sentFolder As Outlook.Folder
    Dim sentItems As Outlook.Items
    Dim MailZuord As Outlook.MailItem
    Dim strf As String
    Dim strFN(1 To 10) As Outlook.Attachment
    Dim strA As String
    Dim strQ As String
    Dim N As Long
    Dim m As Long
    Dim lgM As Long
    Dim lgMCt As Long
    Dim strM As String
    lgMCt = 1
    If blClear Then
        OH_ResetID
    Else
        strSQL = "Execute dbo.spi_ID @x = 'MaxID1'"
        OH_r r
        N = r!MaxID1
    End If
    If OH_InitializeOutlook = False Then
        Set myOlApp = New Outlook.Application
    End If
    If oMail Is Nothing Then
        Select Case lgOption
        Case 12
            t = "zuletzt versendetes eMail"
        Case Else
            t = "aktuell markiertes Mail"
            Set olExp = myOlApp.ActiveExplorer
            Set olSel = olExp.Selection
            lgMCt = olSel.count
        End Select
    Else
        lgOption = -1
        m = -1
    End If
    For lgM = 1 To lgMCt
        Select Case lgOption
        Case -1
            Set MailZuord = oMail
        Case 10, 11
            Set MailZuord = olSel.Item(lgM)
        Case Else
            Set sentFolder = myOlApp.Session.GetDefaultFolder(olFolderSentMail)
            Set sentItems = sentFolder.Items
            sentItems.Sort "[SentOn]", True ' 251007 Elemente nach Versanddatum absteigend sortieren (neueste zuerst)
            Set MailZuord = sentItems.GetFirst   ' Erstes Element der sortierten Liste holen
        End Select
        Set selItem = MailZuord  '251009 siehe OH_FileCopyMove  selItem wird dort verwendet; Achtung verbesserungswürdig OH
        If MailZuord Is Nothing Then
            s = "Outlook-Ordner: " & sentFolder.Name & vbNewLine & _
                "Keine Mails gefunden."
            GoTo ErrM
        End If
        N = N + 1
        If N > 20 Then
            s = "Mehr als 20 Mails nicht möglich!"
            GoTo ErrM
        End If
        Set selItemArray(N) = MailZuord
        strf = OH_CheckExplorerName(OH_RPL(left(MailZuord.Subject, 100))) & ".msg"
        strQ = "EXEC dbo.dms " & _
            "  @x = 'AddtoAblage' " & _
            ", @f ='" & OH_RPL(MailZuord.EntryID) & _
            "',@i =  " & lgFunktion & _
            ", @a = " & lgVG & _
            ",@m = " & m
        If lgOption <> 11 Then
            strSQL = strQ & _
                ",@d ='" & OH_RPL(strf) & _
                "',@s1 ='Mail' " & _
                ", @n = " & N
                OH_EX
        End If
        If lgOption <> -1 Then
            For Each A In MailZuord.Attachments
                strSQL = strQ & _
                    ",@d ='" & OH_RPL(A.Filename) & _
                    "',@s1 ='MailAttachment' " & _
                    ", @n = " & N
                If lgOption = 11 Then
                    If right(A.Filename, 4) = ".pdf" Then
                        OH_EX
                    End If
                Else
                    OH_EX
                End If
            Next A
        End If
    Next
    If lgM = 0 Then
        s = "Bitte das gewünschte Mail markieren!"
        GoTo ErrM
    End If
    OH_Mail_to_DMS = N
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 91
        s = "Outlook ist nicht gestartet"
        OH_Mail_to_DMS = -1
    Case Else
        s = Err & " " & Err.Description
        t = "OH_Mail_to_DMS"
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
GoTo ErrEnd
End Function
Public Function OH_VerifyOfficeReferences() As Boolean
On Error GoTo ErrMsg

' Verify Access' external references and re-establish these if possible.

  Dim refA  As Access.Reference
  Dim strO  As String
  Dim strN  As String
  Dim N As Long
  On Error Resume Next
  t = "Check OFFICE-References"
  '"C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE"
    For Each refA In Access.Application.References
        SysCmd acSysCmdSetStatus, t & " " & refA.Name
        If refA.IsBroken Then
            strO = refA.FullPath
            If InStr(strO, "Office") > 0 Then
                i = InStrRev(strO, "\")
                If i > 0 Then
                    N = Val(Application.Version)
                    strN = left(strO, i - 3) & N & Mid(strO, i)
                    If Len(Dir(strN)) > 0 Then
                        With Access.Application.References
                            .Remove refA
                            .AddFromFile strN
                        End With
                    Else
                        s = "FILE not Found:" & vbNewLine & _
                            strN
                        GoTo ErrM
                    End If
                End If
            Else
                s = "INFO Admin: Broken Reference" & vbNewLine & _
                    strO
                GoTo ErrM
            End If
        End If
    Next
    OH_VerifyOfficeReferences = True
ErrEnd:
    Exit Function
ErrMsg:
    OH_VerifyOfficeReferences = False
    s = "OH_GetSelectedIDs:" & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    OH_VerifyOfficeReferences = False
    GoTo ErrEnd
End Function
Public Function OH_AccessVersionID() As Boolean
On Error GoTo ErrMsg
    Dim strV As Long
    Dim strf As String
    OH_AccessVersionID = False
    t = "ADMINISTRATOR: CHECKE OFFICE-VERSION"
    strV = SysCmd(acSysCmdAccessVer)
    '70  = "95"
    '80  = "97"
    '90  = "2000"
    '100  = "2002"
    '110  = "2003"
    '120  = "2007"
    '130  = "Pirated!"
    '140  = "2010"
    '150  = "2016"
    '160 = "2020
    'Else0  = "Unknown"
    If left(strV, 2) = "16" Then
        strf = left(CurrentProject.FullName, 8)
        If Val(strf) <> 16 Then
            t = "ADMINISTRATOR"
            s = "Bitte verwenden Sie die Version für Office-Paket 16"
        End If
    End If
    OH_AccessVersionID = True
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        s = Err & " " & Err.Description
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
GoTo ErrEnd
End Function
Sub Test()

    Debug.Print OH_TranslateByGoogle("Buch", "de", "fr") ' french
    Debug.Print OH_TranslateByGoogle("Buch", "de", "en") ' german
    Debug.Print OH_TranslateByGoogle("Buch", "de", "pt") ' portuguese
    Debug.Print OH_TranslateByGoogle("Buch", "de", "ru") ' russian - use romanised alphabet
    Debug.Print OH_TranslateByGoogle("Buch", "de", "ru") ' russian - use cyrillic
    ' ThisWorkbook.Sheets(1).Range("A1").Value = OH_TranslateByGoogle("Hello", "en", "ru")
    Debug.Print OH_TranslateByGoogle("Buch", "de", "zh-CN") ' chinese simplified - use romanised alphabet
    Debug.Print OH_TranslateByGoogle("Buch", "de", "zh-CN") ' chinese simplified - use chinese script
    ' ThisWorkbook.Sheets(1).Range("B1").Value = OH_TranslateByGoogle("Hello", "en", "zh-CN")

End Sub
Public Function OH_TranslateByGoogle( _
    strInput As String, _
    strFrom As String, _
    strTO As String) As String
  On Error GoTo ErrMsg 'Fehlerbehandlung

    Dim strURL As String
    Dim objHTTP As Object
    Dim objHTML As Object
    Dim objDivs As Object
    Dim objDiv As Variant

    ' send query to web page
    strURL = "https://translate.google.com/m?hl=" & strFrom & _
        "&sl=" & strFrom & _
        "&tl=" & strTO & _
        "&ie=UTF-8&prev=_m&q=" & strInput

    Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP")
    objHTTP.Open "GET", strURL, False
    objHTTP.setRequestHeader "User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)"
    objHTTP.send ""

    ' create a html document
    Set objHTML = CreateObject("htmlfile")
    With objHTML
        .Open
        .Write objHTTP.responseText
        .Close
    End With

    ' o1 has Anglicised translation, t0 as tranlsation in target language
    Set objDivs = objHTML.getElementsByTagName("div")
    For Each objDiv In objDivs
        If objDiv.className = "result-container" Then
            OH_TranslateByGoogle = objDiv.innerText
            Exit For
        End If
    Next objDiv

CleanUp:
    Set objHTML = Nothing
    Set objHTTP = Nothing

ErrEnd:
  On Error Resume Next
Exit Function
ErrMsg:
    MsgBox Err.Description, vbCritical, Err.number
  Resume ErrEnd
End Function
Public Function OH_setLst(ctl As control, lgid As Long) As Long
On Error GoTo ErrMsg
    'übergebene ID soll markiert werden im Multiselect-Feld
    'wenn 0 übergeben wird soll der erste Datensatz markiert werden
    Dim lgEnd As Long
    Dim lgStart As Long
    If glLstDet = True Then
        GoTo ErrEnd
    End If
    If ctl.ColumnHeads Then
        lgStart = 1
    Else
        lgStart = 0
    End If
    lgEnd = ctl.ListCount - 1
    If lgid = 0 Then
        lgid = ctl.column(0, lgStart)
    End If
    For i = lgStart To lgEnd
        If Val(ctl.column(0, i)) = lgid Then
            ctl.Selected(i) = True
            OH_setLst = ctl.column(0, i)
            SysCmd acSysCmdSetStatus, "Record " & lgEnd & " selected"
            i = lgEnd   '<R121>
        Else
            ctl.Selected(i) = False
        End If
    Next i
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_setLst " & ctl.Parent
    Resume ErrEnd
End Function
Public Function OH_lstdet(frma As Form) As Long
On Error GoTo ErrMsg
    Dim lgid As Long
    Dim lgY(1 To 1000)
    Dim Y As Long
    Dim N As Long
    DoEvents
    glLstDet = True
    frma!lstDet.SetFocus
    t = "Auswahl " & frma.Caption
    For Each x In frma!lstDet.ItemsSelected
        N = N + 1
        If N = 1 Then
            lgid = Val(Nz(frma!lstDet.column(0, x), 0))
            If lgid = 0 Then
                MsgBox "Daten sind nicht zu finden", vbCritical, "Anzeige der Daten aus Listenfeld " & t
                GoTo ErrEnd
            End If
            OH_lstdet = lgid
        End If
        If N > 1000 Then
            MsgBox "Mehr als 1000 Datensätze können nicht ausgewertet werden!", vbInformation, t
            Exit For
        Else
            lgY(N) = x
        End If
    Next x
    DoEvents
   ' frmA!lstDet.ListIndex = 1
    OH_SetRS frma, lgid
    frma.SetFocus
    frma!lstDet.SetFocus
    glLstDet = False

'    Dim lgIndex As Long
'    Dim lgI As Long
'    lgIndex = Me!lstDet.ListIndex
'    OH_lstdet Me
'    lgLstdet = Me!NrVG
'    With Me!lstDet
'        .Tag = lgLstdet
'        .SetFocus
'        .ListIndex = 0
'      '  .ListIndex = lgIndex + 10
'     '   .ListIndex = lgIndex
'        For lgI = 1 To .ListCount - 1
'            If .column(0, lgI) = lgLstdet Then
'                .Selected(lgI) = True
'                Exit For
'            End If
'        Next lgI
'    End With

ErrEnd:
    difflstdet = Now
    Exit Function
ErrMsg:
    Select Case Err
    Case 2110 'Focus kann nicht gesetzt werden??
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_lstdet " & frma.Name
        Resume ErrEnd
    End Select
End Function
Public Function OH_SetRS(fRS As Form, _
                        Optional lgid As Long, _
                        Optional ByVal strQ As String, _
                        Optional lgFB As Long, _
                        Optional blRegD As Boolean = True, _
                        Optional blVerlauf As Boolean = True) As Long
'Setze Datensatzherkunft für Forumlar
On Error GoTo ErrMsg
    Dim strf As String
    Dim rRS As ADODB.Recordset
    Dim N As Long
    Dim strTag As String
    '101210 <R93>, 'UniqueTable komplett verschoben auf OH_SetRS'
    Dim strUniqueTable As String
    DoCmd.Hourglass True
    OH_SaveRS fRS
    DoEvents
    strUniqueTable = "T_" & Replace(fRS.Tag, "PFFilter", "Filter")
    If strQ = "" Then
        strTag = fRS.Tag '101107
        If strTag = "funktion" Then
            strTag = "Adresse"
        End If
        strQ = "Exec spa_" & strTag & _
                " @x = 'ID'" & _
                ", @i = " & lgid
    End If
    'MsgBox strQ
    OH_r rRS, strQ, rrOpenkeyset, rrLockOptimistic, True
    N = rRS.RecordCount & ""
    Set fRS.Recordset = rRS
    DoEvents
    fRS.NavigationCaption = "Datensatz:"
    If N > 0 Then
        If strUniqueTable <> "" Then
            fRS.UniqueTable = strUniqueTable
        End If
        If lgFB > 0 Then
            strf = rRS.Fields(0).Name
            OH_FB fRS, strf & " = " & lgFB
        End If
    End If
    OH_SetRS = N
    Select Case fRS.Name
    Case "frmSchlagwort", "f_q"
        GoTo ErrEnd
    End Select
    If left(fRS.Name, 1) = "F" Then
        fRS!lstDet.SetFocus
    End If
'MsgBox "OH_SetRS" & vbNewLine & fRS.Name & vbNewLine & strQ
    If N > 0 And lgid > 0 Then 'Verlauf speichern
        strTag = fRS.Name
        Select Case strTag
            Case "F_Adresse"
                fRS.OH_AdresseCurrent
                t = fRS!namen & " " & fRS!Funktion
                blRegD = False
            Case "F_Artikel"
                t = fRS!ArtikelNr & " " & fRS!Artikel & " " & fRS!ArtikelName
            Case "F_Begriff"
                t = fRS!Begriff
            Case "F_Filter"
                t = fRS!ReportNr & " " & fRS!FormN & " " & fRS!FieldName & " " & fRS!FieldN
            Case "F_Leistung"
                blRegD = False
                Select Case fRS!lstA
                    Case 10
                        fRS.lstA_AfterUpdate
                        fRS!lstD = fRS!nrVGDet
                    Case 20
                        fRS!lstD = fRS!nrVGDet
                    Case 30
                        fRS!lstD = fRS!KW
                    Case Is > 30
                        fRS.lstAct_AfterUpdate
                        fRS!lstD = fRS!NrLeistung
                End Select
                t = fRS!DatumTag & " " & fRS!Firma
                Set ctl = fRS!lstDet
                OH_RQ ctl, lgid '251120
                N = 0
                For i = 0 To ctl.ListCount
                    If ctl.column(0, i) = lgid Then
                        N = lgid
                        ctl.Selected(i) = True
                    Else
                        ctl.Selected(i) = False
                    End If
                Next i
                If N = 0 Then
                    fRS!txtFind = ""
                    fRS!lstAktiv = 11
                    fRS.txtFind_AfterUpdate
                    fRS!lstDet = fRS!lstDet.column(0, 0)
                    If fRS!lstDet <> lgid Then
                        fRS!txtFind = "ID:" & lgid
                        fRS.txtFind_AfterUpdate
                    End If
                End If
            Case "F_lexikon"
                t = fRS!Gruppe & " " & fRS!Begriff
            Case "F_VG"
                fRS.OH_VGCurrent
                t = fRS!VGdatum & "  " & fRS!NrQK.column(1) & " " & Replace(fRS!Firma, "'", "''")
                blRegD = False
            Case "F_Language"
                t = fRS!Language & " " & left(fRS!l1, 20)
                blRegD = False
            Case "F_Audit", "F"
                GoTo ErrEnd
        End Select
        If blRegD Then
            fRS.regD_Change
        End If
        If left(strTag, 2) = "F_" Then
            OH_RefreshPopup fRS
        End If
        If blVerlauf And left(strTag, 2) <> "UF" Then '180825 Input Elena
            strSQL = "Exec dbo.spi_Verlauf " & _
                "@x = 'neu'" & _
                ",@u = " & lguser & _
                ",@i = " & lgid & _
                ",@f = '" & strTag & _
                "',@txt= '" & OH_RPL(t) & "'"
            OH_EX
        End If
    End If
    OH_ResetRS rRS
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case 2110, 2115, 2108, 30013
        SysCmd acSysCmdSetStatus, "ERROR " & Err & " " & Err.Description
    Case Else
        s = strQ & vbNewLine & Err & " " & Err.Description
        If MsgBox(s, vbYesNo + vbCritical + vbDefaultButton2, "OH_SetRS in Zwischenablage") = vbYes Then
            OH_CB strQ
        End If
    End Select
    Resume ErrEnd
End Function
Public Function OH_A(strA As String, _
                    Optional strC As String, _
                    Optional frmAct As Form, _
                    Optional lgid As Long, _
                    Optional blSetfocus As Boolean = False, _
                    Optional blQ As Boolean) As String
                    'Diese Funktion holt Daten vom SQL-Server.
                    'strA = Name des Listenfeldes
                    'strC = Parameterübergabe je nach Bedarf z.B. beim Füllen der Liste Hostess auf Formular Hostess ist
                        'Parameter1 (@a) = Anzahl der zurückzugebenden Datensätze = lstTop
                        'Parameter2 (@f) = der im Suchfeld angegebende Wert
                    'Wenn blQ = true==> setze strsql1

On Error GoTo ErrMsg
    Dim strQ As String
    Dim strSP As String
    Dim Y As Long
    Dim ctlC As control
    Dim N As Long
    If frmAct Is Nothing Then
        Set frmAct = Screen.ActiveForm
    End If
    If strC = "xxx" Then
        GoTo noRowsource
    End If
    Select Case frmAct.Tag
    Case "Funktion"
        strSP = "spA_Adresse"
    Case "PFFilter", "PFFilterST"
        strSP = "spI_Filter"
    Case Else
        strSP = "spA_" & frmAct.Tag
    End Select
    Select Case VBA.left(strC, 5)
    Case "EXEC ", "SELEC", "EXECU"
        strQ = strC
    Case Else
        If InStr(strA, "@") > 0 Then 'InStr = Gibt einen Integer-Wert zurück, der die Anfangsposition des ersten Auftretens einer Zeichenfolge innerhalb einer anderen Zeichenfolge angibt.
            strQ = strA
        Else
            strQ = "@x ='" & strA & "'"
            If InStr(strC, "@") Then
                strQ = strQ & _
                ", " & strC
            Else
                If strC <> "" Then
                    strQ = "EXEC " & strC & " " & strQ
                End If
            End If
        End If
        If VBA.left(strQ, 4) <> "EXEC" Then
            Select Case frmAct.Tag
            Case Else
                strQ = "EXEC " & strSP & " " & strQ
            End Select
        End If
    End Select
    OH_A = strQ
    strSQL = OH_A
    ' Remote Data Service Usage
    'When used on a client-side Recordset or Connection object, the CursorLocation property can only be set to adUseClient.
    If strA = "ID" Then
        OH_r r, strQ, rrOpenkeyset, rrLockOptimistic, True
        Set frmAct.Recordset = r
    Else
        If InStr(strA, "@") = 0 Then
            OH_r r, strQ, , , True  'Aufbau der Tabelle mit den angefragten Daten
            Set ctlC = frmAct(strA)
'MsgBox strA & vbNewLine & strSQL
            If NoRecords = False Then
                For Y = 1 To r.Fields.count - 1 'Diese Funktion erwartet, dass für Listenfelder die Anzahl Spalten und die Spaltenbreite im SQL-Code definiert wird.
                    Select Case r.Fields(Y).Name
                    Case "CC" 'CC = Column count = Spaltenanzahl
                        ctlC.ColumnCount = r.Fields(Y).Value
                    Case "CW" 'CW = Column widths = Spaltenbreiten
                        ctlC.ColumnWidths = r.Fields(Y).Value
                    Case "cwMM" 'CW = Column widths = Spaltenbreiten
                        ctlC.ColumnWidths = OH_ColumnWidthsMM(r.Fields(Y).Value)
                        ctlC.ColumnCount = Len(r.Fields(Y).Value) - Len(Replace(r.Fields(Y).Value, ";", "")) + 1
                    Case "lwMM" '= ListWidth = Listenbreite
                        ctlC.ListWidth = r.Fields(Y).Value * 567 / 10
                    Case "ctt" '= ControlTipText
                        ctlC.ControlTipText = Nz(r.Fields(Y).Value, strA)
                    End Select
                Next Y
            End If
            Set ctlC.Recordset = r
            If blSetfocus Then 'wenn beim Hingehen das Recordset gesetzt wird, geht der Focus verloren
                ctlC.SetFocus
            End If
        End If
    End If
    If strA = "lstact" Then
        On Error GoTo ErrEnd
        OH_CreateCmb frmAct!lstD
    End If
    strSQL1 = strSQL
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_A Recordset für " & strQ
    OH_CB strQ
    Resume ErrEnd
noRowsource:
    Set ctlC = frmAct(strA)
    ctlC.RowSource = ""
    GoTo ErrEnd
End Function
Public Function OH_Replicate(strRepeat As String, lgTimes As Long) As String
    OH_Replicate = strRepeat
    For i = 1 To lgTimes - 1
        OH_Replicate = OH_Replicate & strRepeat
    Next
End Function
Public Function OH_Lex(ctl As control, _
                        Optional strGR As String = "", _
                        Optional frmL As Form)
On Error GoTo ErrMsg
    If strGR = "" Then
        strGR = ctl.Name
    End If
    strSQL = "Exec dbo.spA_Lexikon " & _
            "@x = 'OH_Lex'," & _
            "@f = '" & strGR & "'"
    OH_A ctl.Name, strSQL, frmL
ErrEnd:
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    t = "OH_Lex Rowsource für " & ctl.Name
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_Number(frmN As Form, _
                        ctlN As control, _
                        Optional lgO As Long = 30, _
                        Optional lgA As Long = 0, _
                        Optional lgu As Long = 0)
On Error GoTo ErrMsg
    strSQL = "exec spA_Div " & _
            "@x = 'numbers', " & _
            "@n =" & lgu & "," & _
            "@i =" & lgO & "," & _
            "@a =" & lgA
    OH_A ctlN.Name, strSQL, frmN
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_Number me,Recordset für " & ctl.Name
        Resume ErrEnd
    End Select
End Function
Public Function OH_lstMdo(frmM As Form) '180404 EO übergeordnete Funktion für markierte Datensätze managen
On Error GoTo ErrMsg
    Dim lgMdo As Long
    lgMdo = Nz(frmM!lstMdo, 0)
    Select Case lgMdo
    Case 1
        OH_MarkerYesOne frmM
    Case 2
        OH_MarkerYes frmM
    Case 3
        OH_MarkerYesSelected frmM
    Case 5
        OH_MarkerNoOne frmM
    Case 6
        OH_MarkerNo frmM
    Case 9, 10
        OH_DeleteRS frmM, lgMdo
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_lstMdo"
    Resume ErrEnd
End Function
Public Function OH_CheckForms()
On Error GoTo ErrMsg
  Dim c As control
    Dim obj As AccessObject, dbs As Object
    Set dbs = Application.CurrentProject
    OH_ResetID

    ' Search for open AccessObject objects in AllForms collection.
    i = 1
    For Each obj In dbs.AllForms
        DoCmd.openForm obj.Name, acDesign
        Set frm = Forms(obj.Name)
        OH_InsertIDDiv i, 0, obj.Name, , frm.RecordSource
        For Each c In frm.Controls
            Select Case c.ControlType
                Case acComboBox, acListBox
                    i = i + 1
                    OH_InsertIDDiv i, 1, obj.Name, c.Name, c.RowSource
            End Select
        Next c
        DoEvents
        If left(frm.RecordSource, 4) = "exec" Or frm.Toolbar <> "" Then
            frm.AllowDesignChanges = True
            frm.RecordSource = ""
            frm.Toolbar = ""
            DoCmd.Close , , acSaveYes
        Else
            DoCmd.Close
        End If
        DoEvents
    Next obj
    For Each obj In dbs.AllReports
        DoCmd.OpenReport obj.Name, acDesign
            i = i + 1
            OH_InsertIDDiv i, 0, obj.Name, , Reports(obj.Name).RecordSource
        DoEvents
        If left(Reports(obj.Name).RecordSource, 4) = "exec" Or Reports(obj.Name).Toolbar <> "" Then
            Reports(obj.Name).RecordSource = ""
            Reports(obj.Name).Toolbar = ""
            DoCmd.Close , , acSaveYes
        Else
            DoCmd.Close
        End If
        DoEvents
    Next obj
    DoCmd.openForm "Menu"
    strSQL = "Select id 'lfdNr',id1 'Was',Idt1 'Objekt',IDT2 'Control', Idt3 'Source'" & _
            " from T_ID order by 1"
    OH_EXCEL strSQL, right(db.Name, 20)
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case 438
        Resume Next
    Case Else
        MsgBox Err & " " & Err.Description, 33
        Resume ErrEnd
    End Select
End Function
Public Function OH_RecordcountForm(frmC As Form) As Long
On Error GoTo ErrMsg
' zählt die Datensätze eines Formulares mit einem ADODB-Recordset als Recordsource
    Dim strQ As String
    Dim rCT As ADODB.Recordset
    OH_RecordcountForm = 0
    strQ = frmC.RecordSource
    If strQ <> "" Then
        OH_r rCT, strQ, rrOpenForwardOnly, rrLockReadOnly, True
        OH_RecordcountForm = rCT.RecordCount & ""
    End If
ErrEnd:
    OH_ResetRS rCT
    Exit Function
ErrMsg:
    s = "OH_RecordcountForm:" & Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_lstdetKeydown(f As Form, lgKeyCode As Integer)
On Error GoTo ErrMsg
    'Trick 17, in der Liste mit Mehrfach-Auswahl zum nächsten Record
    Dim lgIndex As Long
    lgIndex = f!lstDet.ListIndex
    SysCmd acSysCmdSetStatus, "Letzte Aktion: Auswahl-Liste mit Pfeiltaste bewegen: " & f.Caption
    DoEvents
    Select Case lgKeyCode
    Case 37, 38, 39, 40
        Select Case lgKeyCode
        Case 37, 38 'PFEIL nach rechts, oben
            lgIndex = lgIndex - 1
        Case 40, 39  'PFEIL nach unten, links
            lgIndex = lgIndex + 1
        End Select
        If lgIndex < 0 Then
            lgIndex = f!countRec - 1
        End If
        If lgIndex >= f!countRec Then
            lgIndex = 0
        End If
        If lgIndex < 0 Then
            lgIndex = 0
        End If
        f!lstDet.ListIndex = lgIndex
        f.lstDet_AfterUpdate
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    t = "OH_lstdetKeydown für " & f.Name
    Select Case Err
    Case 2115
        SysCmd acSysCmdSetStatus, "Error 2115 in " & t
        Resume ErrEnd
    Case Else
        s = Err & " " & Err.Description
        Resume ErrM
    End Select
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_NoDblClick(Optional blmsg As Boolean)
    s = Screen.ActiveForm.Caption & " " & Screen.ActiveControl.Name & " Bitte hier KEIN Doppel-Klick einsetzen!" & vbNewLine & _
        "EIN Klick reicht!"
    If blmsg Then
        MsgBox s, vbInformation, "HINWEIS zur Bedienung"
    Else
        SysCmd acSysCmdSetStatus, s
    End If
End Function
Function OH_FrmExist(strFrmName As String) As Boolean
'---------------------------------------------------------------------------------------
' Procedure : FrmExist
' Author    : Daniel Pineault, CARDA Consultants Inc.
' Website   : http://www.cardaconsultants.com
' Purpose   : Determine whether or not a form exists in the current database
'             Returns True if it exists, False if it does not
' Copyright : The following may be altered and reused as you wish so long as the
'             copyright notice is left unchanged (including Author, Website and
'             Copyright).  It may not be sold/resold or reposted on other sites (links
'             back to this site are allowed).
'
' Input Variables:
' ~~~~~~~~~~~~~~~~
' sFrmName    Name of the form to search for
'
' Usage:
' ~~~~~~
' ? FrmExist("frm_Login")
'
' Revision History:
' Rev       Date(yyyy/mm/dd)        Description
' **************************************************************************************
' 1         2009-03-17              Initial Release
' 2         2018-09-01              FAZ WF
'---------------------------------------------------------------------------------------
On Error GoTo ErrMsg
    Dim frm As Access.AccessObject

    For Each frm In Application.CurrentProject.AllForms
        If strFrmName = frm.Name Then
            OH_FrmExist = True
            Exit For    'We know it exist so let leave, no point continuing
        End If
    Next frm

ErrEnd:
    On Error Resume Next
    Set frm = Nothing
    Exit Function
ErrMsg:
    s = "MS Access has generated the following error" & vbNewLine & vbNewLine & _
        "Error Number: " & Err.number & vbCrLf & _
        "Error Source: FrmExist" & vbCrLf & _
        "Error Description: " & Err.Description
    t = "OH_FrmExist für " & frm.Name
    Resume ErrM
ErrM:
    MsgBox s, vbCritical, t
    GoTo ErrEnd
End Function
Public Function OH_CheckExplorerName(strX As String) As String
On Error GoTo ErrMsg
'die folgenden Sonderzeichen nicht verwenden für einen Ordner-Namen:
    strX = Replace(strX, vbNewLine, "_")
    strX = Replace(strX, "&", "_")
    strX = Replace(strX, "+", "_")
    strX = Replace(strX, "#", "_")
    strX = Replace(strX, "~", "_")
    strX = Replace(strX, ".", "_")
    strX = Replace(strX, "\", "_")
    strX = Replace(strX, "[", "_")
    strX = Replace(strX, "]", "_")
    strX = Replace(strX, "'", "_")
    strX = Replace(strX, "/", "_")
    strX = Replace(strX, ":", "_")
    strX = Replace(strX, ";", "_")
    strX = Replace(strX, "*", "_")
    strX = Replace(strX, "?", "_")
    strX = Replace(strX, ">", "_")
    strX = Replace(strX, "<", "_")
    strX = Replace(strX, "|", "_")
    strX = Replace(strX, """", "_")
    strX = Replace(strX, "_ _", "_")
    OH_CheckExplorerName = strX
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox Err & "  - " & Err.Description, vbCritical, "OH_CheckExplorerName"
    End Select
    Resume ErrEnd
End Function
Public Function OH_ControlTiptext(frmCC As Form)
On Error GoTo ErrMsg
    'ControlTiptexte im übergebenen Formular aus dem Lexikon holen.
    strSQL = "EXECUTE spa_DIV @x = 'Controltiptext' " & _
                            ",@f = '" & frmCC.Name & "'"
    OH_r r
    While Not r.EOF
        frmCC(r!FieldName).ControlTipText = r!CC
    r.MoveNext
    Wend
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "Errors during OH_ControlTiptext"
    Resume ErrEnd
End Function
Public Function OH_CheckDatumTxt(ByVal strD As String, Optional blmsg As Boolean = False, Optional lgY As Long = 10) As String
On Error GoTo ErrMsg
   Dim d As Date
   t = "Prüfe Datum"
    'checke, ob ein übergebener string ein gültiges Datum ist
    If strD = "" Then
        s = "Kein Wert übergeben"
        GoTo ErrM
    End If
    If InStr(strD, ".") = 0 Then
        strD = left(strD, 2) & "." & Mid(strD, 3, 2) & "." & Mid(strD, 5, 4)
    End If
    s = Replace(strD, ".", "")
    If IsNumeric(s) = False Then
        s = "Kein Datumsformat"
        GoTo ErrM
    End If
    If Len(strD) = 0 Then
        s = "Kein Wert übergeben"
        GoTo ErrM
    End If
    If InStr(strD, ".") = 3 And InStr(strD, ".") = 6 Then
        If Len(strD) > 10 Then
            s = "Bitte Datum prüfen, Eingabe zu lang"
            GoTo ErrM
        End If
        If Len(strD) < 8 Then
            s = "Bitte Datum prüfen, Eingabe zu kurz"
            GoTo ErrM
        End If
    Else
        s = "Bitte Datum prüfen, Eingabeformat falsch"
    End If
    If IsDate(CDate(strD)) Then
        d = CDate(strD)
    End If
    If Year(d) > lgY + Year(Date) Then
        s = "Bitte Jahreszahl prüfen" & vbNewLine & vbNewLine & _
            "darf nicht mehr als " & lgY & " Jahre in der Zukunft liegen"
        GoTo ErrM
    End If
    If Year(d) < Year(Date) - lgY Then
        s = "Bitte Jahreszahl prüfen" & vbNewLine & vbNewLine & _
            "darf nicht mehr als " & lgY & " Jahre in der Vergangenheit liegen"
        GoTo ErrM
    End If

    OH_CheckDatumTxt = Format(d, "yyyymmdd")
ErrEnd:
    Exit Function
ErrMsg:
    s = "Bitte Datum prüfen!"
    Resume ErrM
ErrM:
    OH_CheckDatumTxt = ""
    If blmsg Then
        s = s & vbNewLine & vbNewLine & _
            "Format muss so sein: tt.mm.jjjj"
        MsgBox s, vbCritical, t
    End If
    GoTo ErrEnd
End Function
Public Function OH_Form_error(DataErr As Integer, Optional frma As Form) As Integer
On Error GoTo ErrMsg
    Dim strT As String
    Dim strS As String
    If frma Is Nothing Then
        Set frma = Screen.ActiveForm
    End If
    strT = "Fehler-Nr. " & DataErr & " in " & frma.Caption
    SysCmd acSysCmdSetStatus, strT & " Wahrscheinlich durch einen Doppel-Klick in einem Listenfeld " & Screen.ActiveControl.Name
    Select Case DataErr
    Case 2115
    Case 2113
        If InStr(Screen.ActiveControl.Format, "yy") > 0 Then
            strS = "Bitte geben Sie ein gültiges Datum ein"
        Else
            strS = "Bitte geben Sie einen gültigen Wert ein"
        End If
        strT = Screen.ActiveControl.Name & " " & strT
        GoTo ErrM
    Case 2237
        strS = "Bitte geben Sie einen gültigen Wert ein (muss in der Liste enthalten sein!)"
        strT = Screen.ActiveControl.Name & " " & strT
        GoTo ErrM
    Case 3162
        MsgBox "Bitte alle Felder ausfüllen", vbExclamation, strT
    Case 31665
        Select Case Screen.ActiveControl.Name
        Case "Internet"
            MsgBox Screen.ActiveControl & vbNewLine & vbNewLine & _
                    "Dieser Link ist anscheindend nicht korrekt" & vbNewLine & _
                    "und sollte korrigiert werden!", vbExclamation, strT
        Case Else
            MsgBox "ERROR 31665: Bitte Printscreen an Admin!", vbInformation, strT
        End Select
    Case 7753
    Case 3146, 3151
        OH_Form_error = acDataErrContinue
        If OH_EnsureSqlConnection(True) Then
            ' Bring the form back to a consistent state
            OH_RQf frma
        End If
    Case Else
        MsgBox "Bitte Printscreen an Admin!", vbInformation, strT
    End Select
    OH_Form_error = acDataErrContinue
    frma.Undo
    If OH_ControlExists("txtFind", frma) Then
        frma!txtFind.SetFocus
    End If
ErrEnd:
    Exit Function
ErrMsg:
    'MsgBox err.Number & " " & err.Description, vbCritical, "OH_Form_error"
    Resume ErrEnd
ErrM:
    MsgBox strS, vbCritical, strT
    GoTo ErrEnd
End Function
Public Function OH_ControlExists(ControlName As String, FormCheck As Form) As Boolean '170716 Checkt, ob Feld in Formular existiert
Dim strTest As String
On Error Resume Next
    strTest = FormCheck(ControlName).Name
    OH_ControlExists = (Err.number = 0)
End Function

Public Function OH_GetParentFolderName(ByVal strPath As String) As String
    Dim oFSO, oFolder
    'use Scripting.FileSystemobject to get Parent Folder of Folder passed (strPath)
    Set oFSO = CreateObject("Scripting.FileSystemobject")
    OH_GetParentFolderName = oFSO.GetParentFolderName(strPath)
End Function
Function OH_FolderEmpty(strFolder As String) As Long
    Dim oFSO, oFolder
    'use Scripting.FileSystemobject to check, if passed Folder exists and is empty
    Set oFSO = CreateObject("Scripting.FileSystemobject")
    If oFSO.FolderExists(strFolder) Then
        Set oFolder = oFSO.GetFolder(strFolder)
        If oFolder.Files.count = 0 And oFolder.SubFolders.count = 0 Then
            OH_FolderEmpty = 1 'Folder is empty
        Else
            OH_FolderEmpty = 0 'Folder is NOT empty
        End If
    Else
        OH_FolderEmpty = 2 'Folder does not exist
    End If
Set oFSO = Nothing
End Function
Public Function OH_CheckTime(strTime As String) As Boolean
On Error GoTo ErrMsg
    'prüfe, ob ein übergebener String als Date aufgelöst werden kann
    Dim blC As Boolean
    blC = IsDate(strTime)
    SysCmd acSysCmdSetStatus, "OH_CheckTime " & strTime & " = " & blC
    OH_CheckTime = blC
ErrEnd:
    Exit Function
ErrMsg:
    SysCmd acSysCmdSetStatus, "OH_CheckTime " & strTime & " " & Err.number & " " & Err.Description
    Resume ErrEnd
End Function
Public Function OH_FileInUse(strFilename) As Boolean
    On Error Resume Next
    Open strFilename For Binary Access Read Lock Read As #1
    Close #1
    OH_FileInUse = IIf(Err.number > 0, True, False)
    On Error GoTo 0
End Function

Public Function OH_GetAccessPassword() As String
Dim intFileNum As Integer
Dim bytes(&H100) As Byte
Dim strFilename As String
Dim XorBytes() As Variant
Dim strPassword As String
Dim intIndex As Integer
Dim CurrChar As String * 1

XorBytes = Array(&H86, &HFB, &HEC, &H37, &H5D, &H44, &H9C, &HFA, &HC6, &H5E, &H28, _
&HE6, &H13, &HB6, &H8A, &H60, &H54, &H94)
strPassword = vbNullString
intIndex = 0
strFilename = "D:\Temp\Abfallbewirtschaftung_V003_Daten.mdb"

intFileNum = FreeFile
'‚Open the Access filename
Open strFilename For Binary As #intFileNum

'‚Read first 256 bytes
Get #intFileNum, , bytes

'‚Get the password from the XorPassword function
Do

'‚Get a character from the password by doing a XOR with the
'‚appropriate value in XorBytes array.
CurrChar = Chr$(bytes(intIndex + &H42) Xor XorBytes(intIndex))
'‚If we get a Null character, get out of the loop.
If Asc(CurrChar) = 0 Then Exit Do
'‚Add the password character to the accumulated password string.
strPassword = strPassword & CurrChar
intIndex = intIndex + 1
Loop Until intIndex = 17

MsgBox strFilename & vbNewLine & vbNewLine & strPassword, , "DATENBANKKENNWORD ist in der Zwischenablage"
OH_CB strPassword
Close #intFileNum
End Function
Public Function OH_setBarCode(ctlBC As control, strBC As String, Optional lgFontSize As Long = 4) As Boolean
On Error GoTo ErrMsg
    Dim objWebRequest   As Object
    Dim strPicPath      As String
    Dim bytePicArray()  As Byte
    If glstrBarcode = "" Then
        ctlBC.Visible = False
        GoTo ErrEnd
    End If
    If VarAntw = strBC Then
        GoTo ErrEnd
    End If
    VarAntw = strBC
    Set objWebRequest = CreateObject("Microsoft.XMLHTTP")
    'https://vba-automatisierung.de/qr-codes-mit-vba-und-google-chart/
    'https://developers.google.com/chart/infographics/docs/qr_codes
    'strurl = "http://chart.apis.google.com/chart?chs=500x500&cht=qr&chld=L&chl="
    'https://api.qrserver.com/v1/create-qr-code/?size=100x100&data=
    objWebRequest.Open "GET", glstrBarcode & strBC, False '241106 GET statt POST
    objWebRequest.send
    bytePicArray = objWebRequest.responseBody
    strPicPath = glstrTempPath & "Barcode.png"
    OH_KILL strPicPath
    Open strPicPath For Binary As #1
        Put #1, , bytePicArray()
    Close #1
    ctlBC.picture = strPicPath
ErrEnd:
    Exit Function
ErrMsg:

    t = "OH_setBarCode"
    s = Err.number & " " & Err.Description & _
        "Erzeuge QR_Code " & glstrBarcode & strBC
    Select Case Err
    Case 3021
        SysCmd acSysCmdSetStatus, t & "" & s
        Resume ErrEnd
    End Select
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, t
End Function
Public Function OH_FolderTemp() As String
On Error GoTo ErrMsg
    'Files, die temporär abgelegt werden sollen, werden im USER PROFILE PATH DOCUMENTS gespeichert.
    'Wenn dieser Ordner nicht verfügbar ist, wird der Ordner C:\Temp verwendet
    'Ist C:\Temp nicht vorhanden, wird er erstellt
    'Falls das auch nicht klappt==>Fehlermeldung
    Dim strT As String
    strT = "Checke User-Order <Dokumente>"
    'The user profile path is available as an Environment variable through the Environ function:
    OH_FolderTemp = Environ("USERPROFILE") & "\Documents\"
    If Len(Dir(OH_FolderTemp, vbDirectory)) = 0 Then
        OH_FolderTemp = "C:\Temp\" '210717 \ergänzt
        strT = OH_FolderTemp & " in Explorer anlegen, wenn es ihn noch nicht gibt"
        If Len(Dir(OH_FolderTemp, vbDirectory)) = 0 Then
            MkDir OH_FolderTemp
            If Len(Dir(OH_FolderTemp, vbDirectory)) = 0 Then
                OH_FolderTemp = CurrentProject.path
            End If
        End If
    End If
ErrEnd:
    Exit Function
ErrMsg:
    MsgBox OH_FolderTemp & vbNewLine & Err & "  - " & Err.Description, vbCritical, "Temporären Ordner checken"
    OH_FolderTemp = ""
    Resume ErrEnd
End Function

Public Function OH_ListControlProps(ByRef frm As Form)
 Dim prp As Property
 On Error GoTo props_err
 Dim N As Long
 OH_ResetID
 i = 0
 For Each ctl In frm.Controls
    s = ctl.Properties("Name")
    i = i + 1
    OH_InsertIDDiv i, i, s
    N = 0
    For Each prp In ctl.Properties
        N = N + 1
        OH_InsertIDDiv i, N, "", prp.Name, prp.Value
    Next prp
    SysCmd acSysCmdSetStatus, i & " " & s
 Next ctl
     strSQL = "Select id 'lfdNr',id1 'Was',Idt1 'Objekt',IDT2 'prpName', Idt3 'prpValue'" & _
            " from T_ID order by 1"
    OH_EXCEL strSQL, right(db.Name, 20)

props_exit:
 Set ctl = Nothing
 Set prp = Nothing
Exit Function

props_err:
 If Err = 2187 Then
 Debug.Print vbTab & prp.Name & " = Only available at design time."
 Resume Next
 Else
 Debug.Print vbTab & prp.Name & " = Error Occurred: " & Err.Description
 Resume Next
 End If
End Function
Public Function OH_CheckUSTID(lgA As Long _
                            , Optional ByVal strUstID As String _
                            , Optional blMldg As Boolean = True _
                            , Optional blAudit As Boolean = False) As Boolean
On Error GoTo ErrMsg
    Dim strCheck As String
    Dim strFirma As String
    Dim strR As String
    Dim strT As String
    Dim strM As String
    Dim lgZeichen As Long
    Dim rUST As ADODB.Recordset
    Dim strCountryCode As String
    Dim strVatNumber As String
    Dim http As Object
    Dim soapBody As String
    Dim responseText As String
    DoCmd.Hourglass True
    strT = "Bestätigung von ausländischen Umsatzsteuer-IDs"
    strCheck = lgA & strUstID
    If strCheckUSTID = "" Then
        strCheckUSTID = strCheck
    Else
        If InStr(";" & strCheckUSTID & ";", ";" & strCheck & ";") = 0 Then
            strCheckUSTID = strCheckUSTID & ";" & strCheck
        Else
            s = "Firma " & strCheck & " wurde heute schon geprüft!"
            OH_CheckUSTID = True
            GoTo ErrStatus
        End If
    End If
    strSQL = "EXECUTE spa_Adresse " & _
                    "@x ='CheckUST'" & _
                    ",@i = " & EFNr & _
                    ",@a = " & lgA & _
                    ",@e = '" & strUstID & "'"
    OH_r rUST
    If rUST.BOF Then
        s = strUstID & "  Keine zu prüfende USt-Id für die Adressen-ID " & lgA & " gefunden"
        GoTo ErrM
    End If
    If rUST(0).Name = "msg" Then
        s = rUST!Msg
        If s = "KeinePrüfung" Then 'weil z.B. Schweiz
            s = "Keine Prüfung, da nicht DE"
            GoTo ErrStatus
        End If
        GoTo ErrM
    End If
    While Not rUST.EOF
        If rUST!Nichtprüfen = 0 Then
            strUstID = rUST!USTID
            strVatNumber = Trim(Mid(strUstID, 3, 100))
            strCountryCode = left(strUstID, 2)
            If strCountryCode = "DE" Then
                s = "DE wird nicht geprüft"
                GoTo ErrStatus
            End If
            strFirma = rUST!Firma
            Set http = CreateObject("MSXML2.XMLHTTP")
            DoCmd.Hourglass True
            ' SOAP-Request zusammenbauen
            soapBody = _
                "<?xml version=""1.0"" encoding=""UTF-8""?>" & _
                "<soap:Envelope xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:tns=""urn:ec.europa.eu:taxud:vies:services:checkVat:types"">" & _
                "<soap:Body>" & _
                "<tns:checkVat>" & _
                "<tns:countryCode>" & strCountryCode & "</tns:countryCode>" & _
                "<tns:vatNumber>" & strVatNumber & "</tns:vatNumber>" & _
                "</tns:checkVat>" & _
                "</soap:Body>" & _
                "</soap:Envelope>"

            With http
                .Open "POST", "https://ec.europa.eu/taxation_customs/vies/services/checkVatService", False
                .setRequestHeader "Content-Type", "text/xml; charset=utf-8"
                .setRequestHeader "SOAPAction", ""
                .send soapBody
                responseText = .responseText
            End With

            ' Ergebnis parsen
            If InStr(responseText, "MS_MAX_CONCURRENT_REQ") > 0 Then
                OH_CheckUSTID = False
                s = "Bitte in einigen Sekunden nochmal wiederholen, da zu viele Anfragen auf einmal gestellt wurden"
                GoTo ErrM
            End If

            If InStr(responseText, "valid>true<") > 0 Then
                OH_CheckUSTID = True
                s = "OK"
                lgZeichen = vbOKOnly + vbInformation
            Else
                OH_CheckUSTID = False
                s = "NICHT OK"
                lgZeichen = vbCritical
            End If
            strR = responseText
            strR = Replace(strR, "ns2:", vbNewLine)
            s = s & " für " & strFirma
            strM = strUstID & vbNewLine & s
            s = s & vbNewLine & strR
            If lgZeichen <> vbCritical And blMldg = False Then
                SysCmd acSysCmdSetStatus, "USt-Id -Anfrage OK für " & strUstID
            Else
                MsgBox strM, lgZeichen, strT
            End If
            If blAudit = True Then
                strSQL = "EXEC spa_Audit " & _
                        " @x = 'InsertAudit'" & _
                        ",@t='T_Adresse'" & _
                        ",@i = " & lgA & _
                        ",@f = 'USTID-Prüfung'" & _
                        ",@d ='" & strUstID & _
                        "',@u ='" & OH_RPL(s) & "'"
                OH_EX
            End If
        Else
            OH_CheckUSTID = True
        End If
    rUST.MoveNext
    Wend
    Set http = Nothing
    OH_ResetRS rUST

ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err.number & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, strT
    GoTo ErrEnd
ErrStatus:
    SysCmd acSysCmdSetStatus, strT & " " & s
    GoTo ErrEnd

End Function
Public Function OH_JA(Optional strM As String, _
                      Optional strT As String, _
                      Optional ByVal lgCount As Long = 1, _
                      Optional strAction As String = "LÖSCHEN") As Long
' OHNEMUS, 16.Mai 2009
'ein Grossgeschriebenens JA einfordern
'lgCount: Anzahl der zu löschenden Datensätze
On Error GoTo ErrMsg
    Dim strS As String
    Dim strG As String
    Dim lgYes As Long
    Dim lgVersuch As Long
    Dim varX As Variant
    Dim strhelp As String
    Dim vararray As Variant
    Dim strA(1 To 2) As String
    If strM = "" Then
        strM = s
    End If
    If strT = "" Then
        strT = t
    End If
    strG = "JA"
    If lgCount > 1 Then
        strG = strG & " ALLE " & lgCount
    End If
    If lgCount > 1 Or InStr(strM, "JA") = 0 Then
        strM = strM & vbNewLine & vbNewLine & _
                "bitte eingeben:" & vbTab & strG
    End If
    strG = "Hier Erforderlich GROSSGESCHRIEBENES     " & strG
    lgVersuch = 0
OH_JA_Again:
    lgYes = 0

'==================================
    strA(1) = "ABBRECHEN, NICHT " & strAction
    strA(2) = "Daten " & strAction & " (unwiderruflich)"
    strhelp = strAction & " bedeuted==> Daten sind weg, für immer!"""
    vararray = Array(strA(1), strA(2))
    OH_msgbox s, vararray, vbQuestion, strT, strhelp, strG
    Select Case left(strMSG(2), 9)
    Case "", "Abbrechen"
        GoTo ErrEnd
    End Select

'====================================
    strS = Replace(Replace(strMSG(3), "<", ""), ">", "")
    If strS = "" Then
        OH_JA = 0
    Else
        If StrComp(left(strS, 2), "JA", vbBinaryCompare) = 0 Then
            lgYes = 1
        End If
        If lgYes = 1 And Len(strS) = 2 Then
            lgCount = 1
        Else
            If lgCount > 1 Then
                If Val(Mid(strS, 9)) <> lgCount Then
                    lgYes = 0
                End If
            End If
        End If
        If lgYes = 0 Then
            lgVersuch = lgVersuch + 1
            s = "Nur ein grossgeschriebenes <JA> !!! " & lgVersuch & ". Versuch" & vbNewLine & s
            If lgCount > 1 Then
                s = "!!!!!<JA> und Anzahl der Datensätze (" & lgCount & ")!!! " & lgVersuch & ". Versuch" & vbNewLine & s
            End If
            GoTo OH_JA_Again
        Else
            OH_JA = lgCount
        End If
        If strS = "JA Alle" Then
            OH_JA = -1
        End If
    End If
ErrEnd:
    Exit Function
ErrM:
    MsgBox s, vbExclamation, "GROSSGESCHRIEBENES JA"
    GoTo ErrEnd
ErrMsg:
    Select Case Err.number
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "OH_JA"
    End Select
    Resume ErrEnd
End Function

Public Function OH_KILL(strFileKill As String) As Boolean
'201106 Löschen des übergebenen Files
On Error GoTo ErrMsg
    If Len(Dir(strFileKill)) > 0 Then 'gibt es das File überhaupt
        Kill strFileKill
        OH_KILL = True
    End If
ErrEnd:
    Exit Function
ErrMsg:
    Resume ErrEnd
End Function
Function OH_AddAppProperty(strName As String, _
                           varType As Variant, _
                           varValue As Variant) As Boolean
 Dim prp As Variant
 'AppIcon -und AppTitle -Eigenschaften in einer Microsoft Access Datenbank ändern.
 'Wurden diese Eigenschaften noch nicht definiert oder erstellt,
 'so müssen Sie sie neu erstellen und mithilfe der CreateProperty-Methode
 'der Properties-Auflistung anfügen.
 Const conPropNotFoundError = 3270

 On Error GoTo AddProp_Err
 db.Properties(strName) = varValue
 OH_AddAppProperty = True

AddProp_Bye:
 Exit Function

AddProp_Err:
 If Err = conPropNotFoundError Then
 Set prp = db.CreateProperty(strName, varType, varValue)
 db.Properties.Append prp
 Resume
 Else
 OH_AddAppProperty = False
 Resume AddProp_Bye
 End If
End Function

Public Function OH_DeleteFiles(strFolder As String) As Boolean
'211103 Löschen der Files im übergebenen Folder
On Error GoTo ErrMsg
    Dim objFile As Object
    Dim objFSO As Object
    'Create FSO Object
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    'Check Specified Folder exists or not
    If objFSO.FolderExists(strFolder) Then
        'Loop through each file in a specified folder
        For Each objFile In objFSO.GetFolder(strFolder).Files
            'Delete Each File
            objFile.Delete
        Next
     End If
ErrEnd:
    Exit Function
ErrMsg:
    Resume ErrEnd
End Function
Public Function OH_SetForecolor(ctlCol As control, Optional blGotfocus = False)
    'ändere die Schriftfarbe in Abhängigkeit vom Focus
    If blGotfocus Then
        ctlCol.ForeColor = vbMagenta    'wenn das Control den Focus erhält
    Else
        ctlCol.ForeColor = vbBlack      'wenn das Control den Focus verliert
    End If
End Function
Public Function OH_ListFilesInFolder(strFolder As String, _
                                  Optional IncludeSubfolders As Boolean) As Long
On Error GoTo ErrMsg
' Liste File ggf. auch in Unterordnern
    Dim fso As Scripting.FileSystemObject
    Dim SourceFolder As Scripting.Folder
    Dim subfolder As Scripting.Folder
    Dim strf As String
    Dim objFile As Scripting.File
    DoCmd.Hourglass True
    If strFolder = "" Then
        GoTo ErrEnd
    End If
    Set fso = New Scripting.FileSystemObject
    Set SourceFolder = fso.GetFolder(strFolder)
    SysCmd acSysCmdSetStatus, strFolder
    DoCmd.Hourglass True
  'Loop through each file in the folder
    With SourceFolder
        s = .path & _
            "|" & .Name & _
            "|" & Format(.Size / 1048576, "#0.00 MB") & _
            "|" & .Type & _
            "|" & .DateCreated & _
            "|" & .DateLastAccessed & _
            "|" & .DateLastModified
    End With
    strSQL = "EXECUTE spi_ID @x = 'ShowFileInfos'" & _
            ",@f = '" & s & "'"
    OH_EX
     For Each objFile In SourceFolder.Files
     ' display file properties
        With objFile
            s = .path & _
                "|" & .Name & _
                "|" & Format(.Size / 1048576, "#0.00 MB") & _
                "|" & .Type & _
                "|" & .DateCreated & _
                "|" & .DateLastAccessed & _
                "|" & .DateLastModified
        End With
        strSQL = "EXECUTE spi_ID @x = 'ShowFileInfos'" & _
                ",@f = '" & s & "'"
        OH_EX
     Next objFile
    If IncludeSubfolders Then
        For Each subfolder In SourceFolder.SubFolders
            If IncludeSubfolders Then
                OH_ListFilesInFolder subfolder.path, IncludeSubfolders
            End If
        Next subfolder
    End If
    Set SourceFolder = Nothing
    Set fso = Nothing
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    Select Case Err
    Case Else
        MsgBox strf & " " & Err & " " & Err.Description, vbCritical, "Errors during OH_ListFilesInFolder"
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, "OH_ListFilesInFolder"
    GoTo ErrEnd
End Function
Public Function OH_LogErrorToSQLServer(errorMessage As String, errorLocation As String, Optional table_name As String, Optional ID As Long)
'<R207> This function logs errors to a SQL Server database. It takes an error message, error location, and optionally a table name and an ID for logging purposes.
On Error GoTo ErrMsg
    DoCmd.Hourglass True
    strSQL = "EXEC spa_Audit " & _
            " @x = 'OH_LogErrorToSQLServer'" & _
            ",@f = '" & errorMessage & "'" & _
            ",@d = '" & errorLocation & "'" & _
            ",@t = '" & Nz(table_name, "") & "'" & _
            ",@i = " & Nz(ID, 0)
    OH_EX
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    MsgBox Err & " " & Err.Description, vbCritical, "OH_LogErrorToSQLServer"
    Resume ErrEnd
End Function
Public Function OH_Lagerbuchung() As Boolean
On Error GoTo ErrMsg
    strSQL = "EXEC spA_B_VG " & _
            " @x = 'OH_Lagerbuchung'"
    OH_r r
    OH_Lagerbuchung = r!CT > 0
ErrEnd:
    DoCmd.Hourglass False
    Exit Function
ErrMsg:
    s = Err & " " & Err.Description
    Resume ErrM
ErrM:
    MsgBox s, vbExclamation, "OH_Lagerbuchung"
    GoTo ErrEnd

End Function
Function OH_GetPrüfzifferMod10Rekursiv(number As String) As Integer
'https://www.excel-hilfe.ch/blog/pruefziffer-in-excel-berechnen-mit-vba/#:~:text=F%C3%BCr%20den%20Schweizer%20Einzahlungsschein%20ist%20die%20Pr%C3%BCfziffer%20nach%20dem%20rekursiven
    Dim arrTable As Variant
    Dim carry As Integer: carry = 0
    Dim i As Integer: i = 1
    '80500220230615035202067395'
    arrTable = Array(0, 9, 4, 6, 8, 2, 7, 1, 3, 5)
    For i = 1 To Len(number)
    carry = arrTable(((carry + Mid(number, i, 1)) Mod 10))
    Next i
    OH_GetPrüfzifferMod10Rekursiv = (10 - carry) Mod 10
End Function
'Sie haben im Menü EXTRAS - START oder in einem Autoexec-Makro Einstellungen vorgenommen,
'die beim Start der Datenbank ausgeführt werden.
'Die Ausführung der Startoptionen bzw. des Autoexec-Makros kann jedoch durch das
'Drücken der Taste <Shift> beim Starten der Datenbank verhindert werden.
'Sie möchten diese Möglichkeit unterbinden, um sicher zu gehen,
'dass Ihre Starteinstellungen ausgeführt werden.
Function OH_Shift_Start(blHow As Boolean) As Long
On Error GoTo ErrMsg
    Dim strP As String
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    For i = 1 To 3
        Select Case i
        Case 1
            strP = "AllowBypassKey"  'NICHT AKTIVIERT
        Case 2
            strP = "AllowSpecialKeys" 'TESTENTESTENTESTENTESTEN
        Case 3
            strP = "StartupShowDBWindow"
        End Select
        db.Properties(strP) = blHow
    Next i
ErrEnd:
      Exit Function
ErrMsg:
      If Err = 3270 Then  ' Eigenschaft nicht vorhanden
           db.Properties.Append db.CreateProperty(strP, dbBoolean, False)
           Resume Next
      Else
         MsgBox "Fehler Nr. " & str(Err.number) & " " & Err.Description
         Resume ErrEnd
      End If
End Function
Public Function OH_SetBackcolor(ctlF As control, Optional strDefault As String = "")
On Error GoTo ErrMsg
    Dim strDef As String
    t = "Setze Hintergrundfarbe"
    strDef = strDefault
    If strDef = "" Then
        strDef = ctlF.DefaultValue
    End If
    If InStr(strDef, "A l l E") > 0 Then
        strDef = "A L L E"
    End If
    Select Case Nz(ctlF.Value, "")
    Case strDef, "0"
        ctlF.BackColor = -2147483633
    Case Else
        ctlF.BackColor = RGB(255, 255, 200) 'hellgelb
    End Select
ErrEnd:
    Exit Function
ErrMsg:
    Select Case Err.number
    Case Else
        s = Err.number & " " & Err.Description
        t = "OH_SetBackcolor " & ctlF.Name
        GoTo ErrM
    End Select
    Resume ErrEnd
ErrM:
    MsgBox s, vbExclamation, t
End Function
