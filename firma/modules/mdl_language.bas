Attribute VB_Name = "mdl_language"
Option Compare Database
Option Explicit
Global gllg As String
Sub OH_InitLg(actobj As Object, Optional strLg As String) 'Formulare
On Error GoTo ErrMsg
    'Übersetze im übergebenen Objekt =actobj (Form oder Report) alle Steuerelemente, die
    'den Tag "lg" haben.
    'strlg = in welche Sprache soll übersetzt werden?
    If Len(strLg) = 0 Then 'wenn keine Sprache übergeben wird, mache nix
        Exit Sub
    End If
    If strLg Like "Deutsch" Then 'wenn als Sprache "Deutsch" übergeben wird, mache nix
        Exit Sub
    End If
    For Each ctl In actobj.Controls 'Schleife durch alle Steuerelemente
        Select Case ctl.ControlType    'Untersuche nur bestimmte Steuerelemente
        Case acLabel, acCommandButton, acPage, acToggleButton
            If left(ctl.Tag, 2) = "lg" Then 'nur wenn das Steuerlement den Tag "lg" hat, soll eine Übersetzung erfolgen
                ctl.Caption = lg(ctl.Caption) ' Übergebe die bestehende Beschriftung an die Übersetzungsfunktion
            End If
        End Select
    Next ctl
ErrEnd:
    Exit Sub
ErrMsg:
    Resume ErrEnd
End Sub
Public Function lg(strTr As String) As String 'Übersetze den übergebenen String in die Sprache, die
                                              ' in der globale Variable "gllg" definiert ist
On Error GoTo ErrMsg
    Dim rlg As ADODB.Recordset
    If strTr = "" Or left(strTr, 1) = "_" Then 'wenn nix übergeben wird, gebe auch nix zurück
        GoTo ErrEnd
    End If
    Select Case gllg
    Case "deutsch", "" 'wenn Sprache = Deutsch oder "", gebe den übergebenen String unbehandelt zurück
        lg = strTr
    Case Else
        'gehe in den Server und übersetze dort "strTr"
        strSQL = "select dbo.fx_lg( " & _
                " '" & gllg & _
                "','" & OH_RPL(strTr) & "') as translation"
        OH_r rlg 'Erstelle ein Recordset mit dem strsql
        lg = rlg!translation 'vom Server zurückgebenes übersetztes Wort
    End Select
ErrEnd:
    OH_ResetRS rlg
    Exit Function
ErrMsg:
    Resume ErrEnd
End Function
Public Function lgR(strTr As String) As String
On Error GoTo ErrMsg
    Dim rsLG As ADODB.Recordset
    Dim strLA As String
    Dim lgStart As Long
    Dim lgLen As Long
    Dim ilg As Long
    lgR = strTr
    If strTr = "" Then GoTo ErrEnd
    If gllg = "deutsch" Or gllg = "" Then
        GoTo ErrEnd
    End If
    strSQL = "select * from T_ArtAdresse"
    OH_r rsLG
    While Not rsLG.EOF
        For ilg = 1 To 7
            Select Case ilg
            Case 1
                strLA = "Anrede"
            Case 2
                strLA = "ZuHand"
            Case 3
                strLA = "AnredeAn"
            Case 4
                strLA = "GrussDu"
            Case 5
                strLA = "ArtAdresse"
            Case 6
                strLA = "AnredeDu"
            Case 7
                strLA = "GrussSie"
            End Select
            If Len(strTr) = Len(Nz(rsLG(strLA))) Then
                strTr = strTr & " "
            End If
            lgStart = InStr(strTr, Nz(rsLG(strLA), "=") & " ")
            If lgStart > 0 Then
                lgR = Replace(strTr, rsLG(strLA), lg(rsLG(strLA)))
                GoTo ErrEnd
            End If
        Next ilg
    rsLG.MoveNext
    Wend
ErrEnd:
    OH_ResetRS rsLG
    Exit Function
ErrMsg:
    Resume ErrEnd
End Function
