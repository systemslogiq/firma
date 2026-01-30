Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Form_Load()
On Error GoTo ErrMsg
    Dim strXML As String
    Dim xmlArray() As String

    ' Empfang des XML-Anhangs als Zeichenkette
    If Not IsNull(Me.OpenArgs) Then
        strXML = Me.OpenArgs
    Else
        strXML = ""
    End If
    If strXML <> "" Then
        xmlArray = Split(strXML, ";")

        ' Setze RowSourceType auf Value List, bevor das Listenfeld gefüllt wird
        Me.lstXMLFiles.RowSourceType = "Value List"
        Me.lstXMLFiles.RowSource = ""
        Dim i As Long
        For i = LBound(xmlArray) To UBound(xmlArray)
            Me.lstXMLFiles.AddItem xmlArray(i)
        Next i
         ' Wähle das erste Element in der Liste aus, wenn es Elemente gibt
        If Me!lstXMLFiles.ListCount > 0 Then
            Me!lstXMLFiles = Me!lstXMLFiles.ItemData(0) ' Setzt die Auswahl auf das erste Element
             DoEvents  ' Process other events
            Call lstXMLFiles_AfterUpdate
        End If
    End If
Exit Sub

ErrMsg:
    MsgBox "Fehler im Form_Load-Ereignis: " & Err.Description, vbCritical, "Fehler"
    Resume Next
End Sub
' Die AfterUpdate-Prozedur in eine separate Subroutine auslagern
Public Sub lstXMLFiles_AfterUpdate()
    Call HandleAfterUpdate
End Sub

' Hier die eigentliche Logik, die aufgerufen werden soll
Private Sub HandleAfterUpdate()
    ' Ausgewählte XML-Datei im WebBrowserControl laden
    Dim selectedFile As String
    selectedFile = Me.lstXMLFiles.Value

    If selectedFile <> "" Then
        ' XML-Datei mit XSLT-Referenz versehen
        Dim filePath As String
        filePath = Environ("TEMP") & "\" & selectedFile

        ' XSLT-Dateipfad definieren
        Dim xsltPath As String
        'xsltPath = "C:\temp\Firma_eInvoice.xslt"


        strSQL = "Exec dbo.spa_Lexikon " & _
            " @x = 'get_file_path_eInvoice_xslt'"
        OH_r r
        If r.BOF = True Then
            MsgBox "Ihnen fehlt im Lexikon der Eintrag:" & vbNewLine & _
                    "unter Gruppe <Database> Begriff <Ablage xslt-File xml-Rechnung> in Formname <file path eInvoice xslt>", vbCritical, "Philipp fragen!"
            OH_ResetRS r
            DoCmd.Close acForm, Me.Name
            Exit Sub
        End If
        xsltPath = r!filePath

        ' Überprüfen, ob die XSLT-Datei existiert
        If Dir(xsltPath) = "" Then
            MsgBox "Die XSLT-Datei '" & xsltPath & "' wurde nicht gefunden. Bitte überprüfen Sie den Pfad.", vbCritical, "Fehler: XSLT-Datei nicht gefunden"
            DoCmd.Close acForm, Me.Name
            Exit Sub
        End If
        ' Inhalt der XML-Datei laden
        Dim xmlContent As String
        xmlContent = ReadFileContent(filePath)

        ' Prüfen, ob die XSLT-Referenz bereits vorhanden ist, andernfalls hinzufügen
        If InStr(xmlContent, "<?xml-stylesheet") = 0 Then
            Dim xsltReference As String
            xsltReference = "<?xml-stylesheet type=""text/xsl"" href=""" & xsltPath & """?>"

            ' XML-Version finden und XSLT-Referenz danach einfügen
            If InStr(xmlContent, "<?xml version=") > 0 Then
                Dim insertPosition As Long
                insertPosition = InStr(xmlContent, "?>") + 2
                xmlContent = left(xmlContent, insertPosition) & vbCrLf & xsltReference & vbCrLf & Mid(xmlContent, insertPosition + 1)
            Else
                ' Falls keine XML-Version vorhanden ist, XSLT-Referenz an den Anfang setzen
                xmlContent = xsltReference & vbCrLf & xmlContent
            End If

            ' Geänderte XML-Datei im TEMP-Verzeichnis speichern
            WriteFileContent filePath, xmlContent
        End If


        ' Pfad in URL-Format konvertieren und XML laden
        Dim url As String
        url = "file:///" & Replace(filePath, "\", "/")
        Me!WebBrowser3.Navigate url
    End If
End Sub

Private Function ReadFileContent(filePath As String) As String
On Error GoTo ErrMsg
    Dim fileContent As String
    Dim fileNum As Integer
    ' Überprüfe, ob die Datei existiert
    If Dir(filePath) = "" Then
        MsgBox "Die Datei '" & filePath & "' wurde nicht gefunden. Bitte überprüfen Sie den Pfad.", vbCritical, "Fehler: Datei nicht gefunden"
        ReadFileContent = ""
        Exit Function
    End If
    fileNum = FreeFile
    Open filePath For Input As #fileNum
    fileContent = Input$(LOF(fileNum), fileNum)
    Close #fileNum
    ReadFileContent = fileContent
    Exit Function
ErrMsg:
    MsgBox "Fehler beim Lesen der Datei: " & Err.Description, vbCritical, "Dateifehler"
    ReadFileContent = ""  ' Rückgabewert auf leeren String setzen im Fehlerfall
    If fileNum > 0 Then
        Close #fileNum  ' Stelle sicher, dass die Datei geschlossen wird, auch im Fehlerfall
    End If
End Function

' Funktion zum Schreiben von Inhalt in eine Datei
Private Sub WriteFileContent(filePath As String, content As String)
On Error GoTo ErrMsg
    Dim fileNum As Integer
    fileNum = FreeFile
    Open filePath For Output As #fileNum
    Print #fileNum, content
    Close #fileNum
    Exit Sub
ErrMsg:
    MsgBox "Fehler beim Schreiben in die Datei: " & Err.Description, vbCritical, "Dateifehler"
    If fileNum > 0 Then
        Close #fileNum  ' Stelle sicher, dass die Datei geschlossen wird, auch im Fehlerfall
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error GoTo ErrMsg
    ' Temporäre XML-Dateien löschen
    Dim selectedFile As String
    Dim filePath As String

    ' Lösche alle Dateien aus der lstXMLFiles-Liste
    Dim i As Long
    For i = 0 To Me.lstXMLFiles.ListCount - 1
        selectedFile = Me.lstXMLFiles.ItemData(i)
        filePath = Environ("TEMP") & "\" & selectedFile
        If Dir(filePath) <> "" Then
            Kill filePath
        End If
    Next i
 Exit Sub

ErrMsg:
    MsgBox "Fehler beim Löschen der Datei: " & Err.Description & vbCrLf & "Dateipfad: " & filePath, vbCritical, "Fehler"
    Resume Next
End Sub
Private Sub btnUpdateMail_Click()
    OH_eRechnung_DisplayXML
    lstXMLFiles_AfterUpdate
End Sub
