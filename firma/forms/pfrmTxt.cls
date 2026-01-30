Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim f As Form
Dim SF As Form
Dim lgid As Long
Public Sub Form_Load()
On Error GoTo ErrMsg
    Dim blGo As Boolean
    If Me.OpenArgs = "VG" Then
        Set f = Forms!F_VG
        Set SF = f.UF_txt.Form
        lgid = f!NrVG
        blGo = f!VGStatus <> glStrStatus
        Me.AllowEdits = blGo
        strSQL = "EXEC spa_VG " & _
            " @x = 'UF_TXT', " & _
            " @i = " & lgid
        Me.Caption = f!pageVorgang.Caption
    Else
        Set f = Forms!F_QK
        Set SF = f.UF_txtQK.Form
        lgid = f!IDQK
        blGo = True
        Me.AllowEdits = blGo
        strSQL = "EXEC spa_QK " & _
            " @x = 'UF_TXT', " & _
            " @i = " & lgid
        Me.Caption = "Texte zu " & f!IDQK & " " & f!QK
    End If
    OH_SetRS Me, , strSQL
    OH_Move Me, 180, 0, 195, 200
ErrEnd:
    DoCmd.Hourglass False
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmTxt.Form_Load"
    Resume ErrEnd
End Sub
Private Sub Form_AfterUpdate()
On Error GoTo ErrMsg
    OH_RQf SF
ErrEnd:
    Exit Sub
ErrMsg:
    MsgBox Err.number & " " & Err.Description, vbCritical, "pfrmTxt.Form_AfterUpdate"
    Resume ErrEnd
End Sub
