Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =10223
    ItemSuffix =50
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x822265cd9c18e540
    End
    Caption ="Begriffe mit Spezifikationen"
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
            GroupHeader = NotDefault
            KeepTogether =1
            ControlSource ="Begriff"
        End
        Begin BreakLevel
            ControlSource ="ST"
        End
        Begin PageHeader
            Height =1148
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Label
                    TextFontFamily =34
                    Top =793
                    Width =1920
                    Height =285
                    Name ="Text10"
                    Caption ="Bezeichnung"
                    FontName ="Arial"
                End
                Begin Line
                    Top =736
                    Width =10206
                    Name ="Linie17"
                End
                Begin Line
                    Top =1077
                    Width =10206
                    Name ="Linie18"
                End
                Begin Line
                    Top =1133
                    Width =9639
                    Name ="Linie19"
                End
                Begin Line
                    Width =10206
                    Name ="Linie14"
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
                    Name ="Text491"
                    ControlSource ="=\"Firma- DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page]"
                        " & \" von \" & [Pages]"
                    FontName ="Arial"

                End
                Begin Label
                    TextFontFamily =34
                    Left =5663
                    Top =793
                    Width =4560
                    Height =285
                    Name ="Bezeichnungsfeld43"
                    Caption ="Bemerkungen / Spezifikationen"
                    FontName ="Arial"
                End
                Begin Label
                    TextFontFamily =34
                    Left =2834
                    Top =793
                    Width =1155
                    Height =285
                    Name ="Bezeichnungsfeld46"
                    Caption ="Gruppe"
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
                    FontName ="Arial"
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =285
            Name ="GK"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Width =2836
                    Height =285
                    ColumnWidth =2385
                    FontWeight =700
                    Name ="Begriff"
                    ControlSource ="Begriff"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2831
                    Width =2836
                    Height =285
                    TabIndex =1
                    Name ="Begriff1"
                    ControlSource ="Begriff1"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =5669
                    Width =4531
                    Height =285
                    TabIndex =2
                    Name ="BemBegriff"
                    ControlSource ="BemBegriff"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                End
                Begin Line
                    Width =10206
                    Name ="linBegriff"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =225
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =5669
                    Width =4531
                    Height =225
                    FontSize =8
                    Name ="ST"
                    ControlSource ="ST"
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
' See "B_Begriff.cls"
