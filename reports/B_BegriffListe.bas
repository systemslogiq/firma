Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =9660
    ItemSuffix =20
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x0c5b78d49c18e540
    End
    Caption ="Begriffe in Spaltenform"
    OnOpen ="[Event Procedure]"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            TextFontFamily =18
            FontSize =10
            FontWeight =700
            FontName ="Times New Roman"
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin BoundObjectFrame
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =336
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin BreakLevel
            ControlSource ="Begriff"
        End
        Begin PageHeader
            Height =1303
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Label
                    TextFontFamily =34
                    Top =793
                    Width =1860
                    Height =285
                    Name ="Text10"
                    Caption ="Bezeichnung"
                    FontName ="Arial"
                End
                Begin Line
                    Top =680
                    Width =9639
                    Name ="Linie16"
                End
                Begin Line
                    Top =736
                    Width =9639
                    Name ="Linie17"
                End
                Begin Line
                    Top =1077
                    Width =9639
                    Name ="Linie18"
                End
                Begin Line
                    Top =1133
                    Width =9639
                    Name ="Linie19"
                End
                Begin Line
                    Width =9639
                    Name ="Linie14"
                End
                Begin Line
                    Top =56
                    Width =9639
                    Name ="Linie15"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7143
                    Width =2494
                    Height =630
                    FontSize =8
                    Name ="DBVersion"
                    ControlSource ="=\"Firma- DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page]"
                        " & \" von \" & [Pages]"
                    FontName ="Arial"

                End
                Begin Label
                    SpecialEffect =4
                    OldBorderStyle =1
                    BorderWidth =3
                    TextAlign =1
                    TextFontFamily =34
                    Top =56
                    Width =7089
                    Height =480
                    FontSize =14
                    Name ="strReportTitel"
                    Caption ="Begriffe"
                    FontName ="Arial"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =270
            Name ="Detail1"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =3
                    Width =3961
                    Height =270
                    ColumnWidth =2385
                    Name ="Begriff"
                    ControlSource ="Begriff"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="Seitenfuß2"
        End
    End
End
CodeBehindForm
' See "B_BegriffListe.cls"
