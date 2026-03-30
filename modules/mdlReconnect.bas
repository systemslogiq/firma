Attribute VB_Name = "mdlReconnect"

Option Compare Database
Option Explicit

'--- einfache "SQL lebt?"-Probe über DAO (funktioniert, wenn ODBC-Links vorhanden sind)
Public Function OH_SqlPing_DAO(Optional ByVal timeoutSec As Long = 2) As Boolean
    On Error GoTo EH
    Dim db As DAO.Database
    Dim qd As DAO.QueryDef
    Dim rs As DAO.Recordset

    Set db = CurrentDb()
    Set qd = db.CreateQueryDef("")
    qd.ReturnsRecords = True
    qd.ODBCTimeout = timeoutSec
    qd.SQL = "SELECT Top 1 id from tblTmp"

    Set rs = qd.OpenRecordset(dbOpenSnapshot)
    OH_SqlPing_DAO = Not (rs.EOF And rs.BOF)


CLEANUP:
    On Error Resume Next
    If Not rs Is Nothing Then rs.Close
    Set rs = Nothing
    Set qd = Nothing
    Set db = Nothing
    Exit Function

EH:
    OH_SqlPing_DAO = False
    Resume CLEANUP
End Function

'--- wartet kurz (für Retry-Logik)
Private Sub SleepMs(ByVal ms As Long)
    Dim t As Single
    t = Timer
    Do While (Timer - t) * 1000# < ms
        DoEvents
    Loop
End Sub

'--- UI kurz sperren/entsperren (optional)
Public Sub UiBusy(ByVal isBusy As Boolean, Optional ByVal msg As String = "")
    On Error Resume Next
    DoCmd.Hourglass isBusy
    If isBusy Then
        If Len(msg) > 0 Then SysCmd acSysCmdSetStatus, msg
    Else
        SysCmd acSysCmdClearStatus
    End If
End Sub
