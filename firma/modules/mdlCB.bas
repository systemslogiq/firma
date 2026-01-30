Attribute VB_Name = "mdlCB"
Option Compare Database
Option Explicit
    Declare PtrSafe Function GetClipboardData Lib "user32" (ByVal wFormat As LongPtr) As LongPtr
    Declare PtrSafe Function GlobalUnlock Lib "kernel32" (ByVal hMem As LongPtr) As LongPtr
    Declare PtrSafe Function GlobalLock Lib "kernel32" (ByVal hMem As LongPtr) As LongPtr
    Declare PtrSafe Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As LongPtr) As LongPtr
    Declare PtrSafe Function CloseClipboard Lib "user32" () As Long
    Declare PtrSafe Function OpenClipboard Lib "user32" (ByVal hWnd As LongPtr) As LongPtr
    Declare PtrSafe Function EmptyClipboard Lib "user32" () As Long
    Declare PtrSafe Function lstrcpy Lib "kernel32" (ByVal lpString1 As Any, ByVal lpString2 As Any) As LongPtr
    Declare PtrSafe Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As LongPtr) As LongPtr
Public Const GHND = &H42
Public Const CF_TEXT = 1
Public Const MAXSIZE = 4096
Sub OH_C(Optional MyString As String)
   OH_CB MyString
End Sub
Function OH_CBget(ctlX As control) As String
On Error GoTo ErrMsg
   Dim hClipMemory As LongPtr
   Dim lpClipMemory As LongPtr
   Dim MyString As String
   Dim retVal As LongPtr
    OH_CBget = ""
    If OpenClipboard(0&) = 0 Then
        MsgBox "Cannot open Clipboard. Another app. may have it open"
        GoTo ErrEnd
    End If

   ' Obtain the handle to the global memory
   ' block that is referencing the text.
   hClipMemory = GetClipboardData(CF_TEXT)
   If IsNull(hClipMemory) Then
      MsgBox "Could not allocate memory"
      GoTo ErrEnd
   End If

   ' Lock Clipboard memory so we can typ
   ' the actual data string.
   lpClipMemory = GlobalLock(hClipMemory)

    If Not IsNull(lpClipMemory) Then

        MyString = Space$(MAXSIZE)
        retVal = lstrcpy(MyString, lpClipMemory)
        retVal = GlobalUnlock(hClipMemory)

      ' Peel off the null terminating character.
        MyString = VBA.Mid(MyString, 1, InStr(1, MyString, Chr$(0), 0) - 1)
        If MyString = "" Then
            GoTo ErrEnd
        End If
        OH_CBget = MyString
        If IsNull(ctlX) = False Then
            s = "Zwischenablage = " & vbNewLine & _
                Application.PlainText(left(MyString, 200)) & vbNewLine & vbNewLine & _
                    "JA" & vbTab & "Text überschreiben mit Zwischenablage" & vbNewLine & _
                   "NEIN" & vbTab & "Zwischenablage ans Ende anfügen!"
            i = MsgBox(s, vbExclamation + vbYesNoCancel, "Zwischenablage einfügen!")
            Select Case i
            Case vbCancel
                GoTo ErrEnd
            Case vbYes
                ctlX = MyString
            Case vbNo
                ctlX = ctlX & "<br>" & MyString
            End Select
        Else
            ctlX = MyString
        End If
   Else
      MsgBox "Could not lock memory to copy string from."
   End If
ErrEnd:
    retVal = CloseClipboard()
    Exit Function
ErrMsg:
    Select Case Err
    Case 5
    Case Else
        MsgBox Err & " " & Err.Description, vbCritical, "OH_CBget"
    End Select
    Resume ErrEnd
End Function
'MS KB Artikel Q138909
Function OH_CB(Optional strCopy As String)
    Dim hGlobalMemory As LongPtr
    Dim lpGlobalMemory As LongPtr
    Dim hClipMemory As LongPtr
    Dim strT As String
    If strCopy Like vbNullString Then
       strCopy = strSQL
    End If
    strT = "OH_CB Bitte Printscreen an OHNEMUS."
   ' Allocate moveable global memory.
   '-------------------------------------------
   hGlobalMemory = GlobalAlloc(GHND, Len(strCopy) + 1)
   ' Lock the block to get a far pointer to this memory.
   lpGlobalMemory = GlobalLock(hGlobalMemory)

   ' Copy the string to this global memory.
   lpGlobalMemory = lstrcpy(lpGlobalMemory, strCopy)

   ' Unlock the memory.
   If GlobalUnlock(hGlobalMemory) <> 0 Then
      MsgBox "Could not unlock memory location. Copy aborted", vbCritical, strT
      GoTo OutOfHere2
   End If

   ' Open the Clipboard to copy data to.
   If OpenClipboard(0&) = 0 Then
      MsgBox "Could not open the Clipboard. Copy aborted", vbCritical, strT
      Exit Function
   End If

   ' Clear the Clipboard.
   x = EmptyClipboard()

   ' Copy the data to the Clipboard.
   hClipMemory = SetClipboardData(CF_TEXT, hGlobalMemory)

OutOfHere2:

   If CloseClipboard() = 0 Then
      MsgBox "Could not close Clipboard", vbCritical, strT
   End If
   SysCmd acSysCmdSetStatus, "In Zwischenablage " & left(strCopy, 20)
End Function
