VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "StopWatch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Compare Database
Option Explicit

Private mlngStart As Long
Private Declare PtrSafe Function GetTickCount Lib "kernel32" () As Long

Public Sub StartTimer()
    mlngStart = GetTickCount
End Sub

Public Function EndTimer() As Long
    EndTimer = (GetTickCount - mlngStart)
End Function


'Dim sw As StopWatch
'Set sw = New StopWatch
'sw.StartTimer
'
'' Do whatever you want to time here
'' Run the process that is to be timed....

'MsgBox "This took: " & sw.EndTimer & " milliseconds"
