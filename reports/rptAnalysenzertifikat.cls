Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intI As Integer
Private Sub Report_Open(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = OH_B(Me)
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.Report_Open"
    Resume ErrEnd
End Sub
Private Sub Report_NoData(Cancel As Integer)
On Error GoTo ErrMsg
    Cancel = True
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.Report_NoData"
    Resume ErrEnd
End Sub
Private Sub Det_Print(Cancel As Integer, PrintCount As Integer)
On Error GoTo ErrMsg
    Dim ctl As control
    Dim Farbe As Long
'Das Access 2003 Entwicklerbuch" von Andrè Minhorst auf Seite 264 eine geniale Lösung
    Farbe = RGB(121, 167, 227) ' Linie farbig darstellen.
    For Each ctl In Me.Section(acDetail).Controls 'durchläuft alle Steuerelemente des Detailbereichs
        With ctl
            Me.Line (.left + .Width, 0)-(.left + .Width, Me.Height), Farbe, B
        End With
    Next
    With Me
        Me.Line (0, 0)-(.Width, .Height), Farbe, B
    End With
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.Det_Print"
    Resume ErrEnd
End Sub
Private Sub gh_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Dim lgTop As Long
    For Each ctl In Me.gh.Controls
        If ctl.Tag = "ID" Then
            ctl.top = lgTop
            Me("lbl" & ctl.Name).top = lgTop
            If Nz(ctl) = "" Then
                ctl.Visible = False
                ctl.Height = 0
                Me("lbl" & ctl.Name).Visible = False
                Me("lbl" & ctl.Name).Height = 0
            End If
            lgTop = lgTop + ctl.Height
        End If
    Next ctl
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.gh_Format"
    Resume ErrEnd
End Sub
Private Sub Report_activate()
On Error GoTo ErrMsg
    OH_InitLg Me, Nz(Me!VGSprache, "Deutsch")
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.Report_activate"
    Resume ErrEnd
End Sub
Private Sub ph_Format(Cancel As Integer, FormatCount As Integer)
On Error GoTo ErrMsg
    Me!Logo.picture = OH_GetPic(EFNrFktn, "+Logo oben")
ErrEnd:
    Exit Sub
ErrMsg:
    Select Case Err.number
    Case 2220
        Resume Next
    Case Else
        MsgBox Err.number & " " & Err.Description, vbCritical, "Report_rptAnalysenzertifikat.ph_Format"
    End Select
    Resume ErrEnd
End Sub
