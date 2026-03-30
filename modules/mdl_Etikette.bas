Attribute VB_Name = "mdl_Etikette"
Option Compare Database
Option Explicit
    Global lgLeerEtiketten As Integer, lgKopienEtiketten As Integer
    Global lgLeerAnzahl As Integer, lgKopieAnzahl As Integer
Public Function OH_Etikette1(strTxt As String) As Boolean
    'beim Öffnen eines Etikettenreports
    lgLeerEtiketten = 1
    lgKopienEtiketten = 1
    lgLeerAnzahl = 1
    lgKopieAnzahl = 1

    OH_Etikette1 = True
    x = InputBox("An welcher Position auf dem Etikettbogen soll gestartet werden?" & _
                vbNewLine & vbNewLine & vbNewLine & vbNewLine & _
               "(Default-Wert= 1, Etikettbogen ist komplett)", _
               strTxt & ": Anzahl verbraucht", 1)
    If IsNumeric(x) Then
        lgLeerEtiketten = Val(x)
        x = InputBox("Wieviel mal wollen Sie die einzelne Etikette ausdrucken?" & _
                    vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & _
                   "(Default-Wert= 1, nur einmal!)", _
                   strTxt & ": Anzahl Kopien", 1)
        If IsNumeric(x) Then
            OH_Etikette1 = False
            lgKopienEtiketten = Val(x)
        End If
    End If
End Function
Public Function OH_Etikette2(rpt As Report)
    'im Detailbereich eines Etikettenreports
    If rpt.page = 1 Then 'nur auf der ersten Seite sollen leere Felder erscheinen
        If lgLeerAnzahl < lgLeerEtiketten Then
            rpt.NextRecord = False
            rpt.PrintSection = False
            lgLeerAnzahl = lgLeerAnzahl + 1
        Else
            OH_EtiketteKopie rpt
        End If
    Else
        OH_EtiketteKopie rpt
    End If
End Function
Public Function OH_EtiketteKopie(rpt As Report)
'runterrechnen der Kopien
    If lgKopieAnzahl < lgKopienEtiketten Then
        rpt.NextRecord = False
        lgKopieAnzahl = lgKopieAnzahl + 1
    Else
        'zurücksetzen der Werte
        lgKopieAnzahl = 1
    End If
End Function
