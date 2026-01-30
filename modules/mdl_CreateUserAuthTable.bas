Attribute VB_Name = "mdl_CreateUserAuthTable"
Option Compare Database

'Public Sub CreateUserAuthTable()
'    On Error GoTo errHandler
'
'    Dim db As DAO.Database
'    Dim tdf As DAO.TableDef
'    Dim fld As DAO.Field
'
'    ' Verweise auf die aktuelle Datenbank
'    Set db = CurrentDb
'
'    ' ˜berprüfe, ob die Tabelle bereits existiert, und lösche sie, falls erforderlich
'    On Error Resume Next
'    db.TableDefs.Delete "usysUserAuth"
'    On Error GoTo 0
'
'    ' Neue Tabelle erstellen
'    Set tdf = db.CreateTableDef("usysUserAuth")
'
'    ' Benutzername-Feld hinzufügen
'    Set fld = tdf.CreateField("Benutzername", dbText, 50)
'    tdf.Fields.Append fld
'
'    ' SQLAuth-Feld hinzufügen (Ja/Nein-Feld)
'    Set fld = tdf.CreateField("SQLAuth", dbBoolean)
'    tdf.Fields.Append fld
'
'    ' Tabelle zur Datenbank hinzufügen
'    db.TableDefs.Append tdf
'
'    MsgBox "Die Tabelle 'usysUserAuth' wurde erfolgreich erstellt.", vbInformation, "Fertig"
'
'errExit:
'    On Error Resume Next
'    Set fld = Nothing
'    Set tdf = Nothing
'    Set db = Nothing
'    Exit Sub
'
'errHandler:
'    MsgBox "Fehler " & Err.number & ": " & Err.Description, vbCritical, "Fehler beim Erstellen der Tabelle"
'    Resume errExit
'End Sub
'
Public Sub GenerateCreateTableScript(tableName As String)
    On Error GoTo ErrorHandler

    Dim db As dao.Database
    Dim tdf As dao.TableDef
    Dim fld As dao.Field
    Dim idx As dao.Index
    Dim sqlCreate As String
    Dim sqlFields As String
    Dim sqlIndex As String

    ' Verweis auf die aktuelle Datenbank setzen
    If db Is Nothing Then
        Set db = Application.CurrentDb
    End If
    Set tdf = db.TableDefs(tableName)

    ' Anfang des CREATE TABLE Statements
    sqlCreate = "CREATE TABLE [" & tableName & "] ("

    ' Felder durchlaufen und definieren
    For Each fld In tdf.Fields
        sqlFields = sqlFields & "[" & fld.Name & "] " & GetFieldType(fld) & ", "
    Next fld

    ' Das letzte Komma entfernen
    If Len(sqlFields) > 0 Then
        sqlFields = left(sqlFields, Len(sqlFields) - 2)
    End If

    ' Schließen der Tabellenstruktur
    sqlCreate = sqlCreate & sqlFields & ");"

    ' Ausgabe des SQL-Statements
    Debug.Print sqlCreate

    ' Indizes durchlaufen und definieren (optional)
    For Each idx In tdf.Indexes
        If Not idx.Primary Then
            sqlIndex = "CREATE INDEX [" & idx.Name & "] ON [" & tableName & "] ("
            Dim idxFields As String
            Dim idxField As dao.Field
            For Each idxField In idx.Fields
                idxFields = idxFields & "[" & idxField.Name & "], "
            Next idxField
            If Len(idxFields) > 0 Then
                idxFields = left(idxFields, Len(idxFields) - 2)
            End If
            sqlIndex = sqlIndex & idxFields & ");"
            Debug.Print sqlIndex
        End If
    Next idx

ExitSub:
    On Error Resume Next
    Set tdf = Nothing
    Set db = Nothing
    Exit Sub

ErrorHandler:
    MsgBox "Fehler: " & Err.number & " - " & Err.Description, vbCritical, "Fehler beim Erstellen des Tabellen-Skripts"
    Resume ExitSub
End Sub

' Hilfsfunktion zur Bestimmung des Feldtyps
Private Function GetFieldType(fld As dao.Field) As String
    Select Case fld.Type
        Case dbBoolean
            GetFieldType = "YESNO"
        Case dbByte
            GetFieldType = "BYTE"
        Case dbInteger
            GetFieldType = "SHORT"
        Case dbLong
            GetFieldType = "LONG"
        Case dbSingle
            GetFieldType = "SINGLE"
        Case dbDouble
            GetFieldType = "DOUBLE"
        Case dbCurrency
            GetFieldType = "CURRENCY"
        Case dbDate
            GetFieldType = "DATETIME"
        Case dbText
            GetFieldType = "TEXT(" & fld.Size & ")"
        Case dbMemo
            GetFieldType = "MEMO"
        Case dbGUID
            GetFieldType = "GUID"
        Case Else
            GetFieldType = "TEXT(255)"
    End Select
End Function
Public Sub RunCreateTableScript()
    On Error GoTo ErrorHandler

    Dim strSQL As String

    ' Definiere das SQL CREATE TABLE Skript
    strSQL = "CREATE TABLE [MSysFirma] ([IDFirma] AUTOINCREMENT CONSTRAINT PK_MSYSFIRMA PRIMARY KEY, [SERVER] TEXT(255), [Driver] TEXT(50), [Database] TEXT(20), [Frontend] TEXT(255), [KD] TEXT(20), [Used] YESNO, [Art] TEXT(10),[SQLAuthentication] YESNO);"

    ' Führe das CREATE TABLE Skript aus
    CurrentDb.Execute strSQL, dbFailOnError

    ' SQL-Befehl zum Erstellen des Indexes ausführen
    strSQL = "CREATE INDEX [IDFirma] ON [MSysFirma] ([IDFirma]);"
    CurrentDb.Execute strSQL, dbFailOnError

    strSQL = "CREATE INDEX [Used] ON [MSysFirma] ([IDFirma], [MSysFirma]);"
    CurrentDb.Execute strSQL, dbFailOnError

    MsgBox "Das Skript wurde erfolgreich ausgeführt!", vbInformation, "Fertig"

ExitSub:
    On Error Resume Next
    Exit Sub

ErrorHandler:
    MsgBox "Fehler: " & Err.number & " - " & Err.Description, vbCritical, "Fehler beim Ausführen des Skripts"
    Resume ExitSub
End Sub
