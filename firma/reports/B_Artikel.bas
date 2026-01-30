Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =10155
    DatasheetFontHeight =12
    ItemSuffix =572
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x5959c8d19c18e540
    End
    Caption ="einzelner Artikel"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            TextAlign =3
            FontSize =12
            FontName ="Arial"
        End
        Begin Rectangle
            BorderWidth =1
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin TextBox
            AddColon = NotDefault
            LabelAlign =3
            BorderLineStyle =0
            Width =6120
            Height =330
            LabelX =-567
            LabelY =-27
            FontSize =12
            FontWeight =700
            FontName ="Arial"
        End
        Begin Subform
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            Width =4536
            Height =2835
        End
        Begin PageBreak
            Width =283
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="Artikelsort"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="IDArtikel"
        End
        Begin BreakLevel
            ControlSource ="ZuordNr"
        End
        Begin PageHeader
            Height =695
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    OldBorderStyle =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =18
                    Left =7596
                    Width =2494
                    Height =630
                    ColumnOrder =0
                    FontSize =8
                    FontWeight =400
                    Name ="Text491"
                    ControlSource ="=\"Firma- DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page]"
                        " & \" von \" & [Pages]"
                    FontName ="Times New Roman"

                End
                Begin Line
                    LineSlant = NotDefault
                    BorderWidth =1
                    Top =680
                    Width =10093
                    Name ="Linie515"
                End
                Begin Label
                    SpecialEffect =4
                    OldBorderStyle =1
                    BorderWidth =3
                    TextAlign =1
                    Top =56
                    Width =7530
                    Height =480
                    FontSize =16
                    FontWeight =700
                    Name ="strReportTitel"
                    Caption ="Artikel"
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =6396
            BreakLevel =1
            Name ="ghID"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    FontItalic = NotDefault
                    DecimalPlaces =0
                    TextAlign =1
                    Left =3401
                    Top =330
                    Width =6690
                    LeftMargin =57
                    Name ="App"
                    ControlSource ="Artikel"
                    Format ="000"
                    StatusBarText ="Bezeichnung der Apparate-Gruppe"

                    Begin
                        Begin Label
                            Top =330
                            Width =2850
                            Height =330
                            Name ="Text17"
                            Caption ="Bezeichnung"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =2310
                    Width =6690
                    TabIndex =1
                    LeftMargin =57
                    Name ="BemArtikel"
                    ControlSource ="BemArtikel"
                    StatusBarText ="Bemerkungen zur Position"
                    TextFormat =1

                    Begin
                        Begin Label
                            Left =6
                            Top =2310
                            Width =2835
                            Height =330
                            Name ="Text33"
                            Caption ="Bemerkungen"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =1320
                    Width =6690
                    TabIndex =2
                    LeftMargin =57
                    Name ="Hersteller"
                    ControlSource ="Hersteller"
                    StatusBarText ="Hersteller-Nummer"

                    Begin
                        Begin Label
                            Left =6
                            Top =1320
                            Width =2835
                            Height =330
                            Name ="Text107"
                            Caption ="Hersteller"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =660
                    Width =6690
                    TabIndex =3
                    LeftMargin =57
                    Name ="Artikel"
                    ControlSource ="ArtikelName"

                    Begin
                        Begin Label
                            Top =660
                            Width =2850
                            Height =330
                            Name ="Text109"
                            Caption ="Typ"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =1650
                    Width =6690
                    TabIndex =4
                    LeftMargin =57
                    Name ="ArtikelNr"
                    ControlSource ="ArtikelNr"

                    Begin
                        Begin Label
                            Left =6
                            Top =1650
                            Width =2835
                            Height =330
                            Name ="Text111"
                            Caption ="Lieferant-Artikel-Nr"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =990
                    Width =6690
                    TabIndex =5
                    LeftMargin =57
                    Name ="Text243"
                    ControlSource ="Firma"
                    StatusBarText ="Hersteller-Nummer"

                    Begin
                        Begin Label
                            Left =6
                            Top =990
                            Width =2835
                            Height =330
                            Name ="Bezeichnungsfeld244"
                            Caption ="Lieferant"
                        End
                    End
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2
                    Top =4535
                    Width =10095
                    Height =330
                    FontWeight =700
                    Name ="Bezeichnungsfeld245"
                    Caption ="Technische Daten "
                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    Left =6735
                    Top =2640
                    Width =1515
                    TabIndex =6
                    Name ="Einkaufspreis"
                    ControlSource ="Einkaufspreis"
                    Format ="Standard"

                    Begin
                        Begin Label
                            Left =5853
                            Top =2640
                            Width =840
                            Height =330
                            Name ="Bezeichnungsfeld571"
                            Caption ="EK"
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    Left =3401
                    Top =3630
                    Width =6690
                    TabIndex =7
                    LeftMargin =57
                    Name ="AnlageErfasst"
                    ControlSource ="ArtikelErfasst"

                    Begin
                        Begin Label
                            Left =6
                            Top =3630
                            Width =2835
                            Height =330
                            Name ="Bezeichnungsfeld543"
                            Caption ="erfasst am"
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    Left =3401
                    Top =2970
                    Width =6690
                    TabIndex =8
                    LeftMargin =57
                    Name ="lu"
                    ControlSource ="LU"
                    Format ="General Date"
                    StatusBarText ="Last update of table"

                    Begin
                        Begin Label
                            Left =6
                            Top =2970
                            Width =2835
                            Height =330
                            Name ="Bezeichnungsfeld544"
                            Caption ="letzte Änderung am"
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    Left =3401
                    Top =3300
                    Width =6690
                    TabIndex =9
                    LeftMargin =57
                    Name ="wu"
                    ControlSource ="WU"
                    StatusBarText ="Update responsible"

                    Begin
                        Begin Label
                            Left =6
                            Top =3300
                            Width =2835
                            Height =330
                            Name ="Bezeichnungsfeld545"
                            Caption ="geändert durch"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =3401
                    Top =1980
                    Width =6690
                    TabIndex =10
                    LeftMargin =57
                    Name ="Text548"
                    ControlSource ="Liefereinheit"

                    Begin
                        Begin Label
                            Left =6
                            Top =1980
                            Width =2835
                            Height =330
                            Name ="Bezeichnungsfeld549"
                            Caption ="Liefereinheit"
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =2
                    Left =9011
                    Top =2640
                    Width =1080
                    TabIndex =11
                    Name ="ArtikelRabatt100"
                    ControlSource ="=[ArtikelRabatt]/100"
                    Format ="Percent"
                    StatusBarText ="Bemerkungen zur Position"

                End
                Begin Label
                    Top =6066
                    Width =930
                    Height =330
                    Name ="Bezeichnungsfeld554"
                    Caption ="Position"
                End
                Begin Label
                    Left =930
                    Top =6066
                    Width =810
                    Height =330
                    Name ="Bezeichnungsfeld555"
                    Caption ="Anzahl"
                End
                Begin Label
                    TextAlign =1
                    Left =7372
                    Top =6066
                    Width =2310
                    Height =330
                    Name ="Bezeichnungsfeld556"
                    Caption ="Bemerkungen"
                End
                Begin Label
                    TextAlign =1
                    Left =1740
                    Top =6066
                    Width =3480
                    Height =330
                    FontWeight =700
                    Name ="Bezeichnungsfeld557"
                    Caption ="Zusammensetzung"
                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    Left =3401
                    Top =2640
                    Width =1515
                    TabIndex =12
                    LeftMargin =57
                    Name ="KalkVP"
                    ControlSource ="KalkVP"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =1
                    Left =8250
                    Top =2640
                    Width =750
                    TabIndex =13
                    Name ="EKWährung"
                    ControlSource ="EKWährung"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =1
                    Left =4916
                    Top =2640
                    Width =645
                    TabIndex =14
                    Name ="VKWährung"
                    ControlSource ="VKWährung"
                    Format ="Standard"

                End
                Begin Subform
                    Top =4865
                    Width =10041
                    Height =906
                    TabIndex =15
                    Name ="UB_Stichwort"
                    SourceObject ="Report.UB_Stichwort"
                    LinkChildFields ="NrArtikel"
                    LinkMasterFields ="IDArtikel"

                End
                Begin Label
                    Top =2640
                    Width =2835
                    Height =330
                    Name ="Bezeichnungsfeld542"
                    Caption ="VK-Preis"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =285
            Name ="Det"
            Begin
                Begin Line
                    BorderWidth =1
                    Left =-735
                    Width =10826
                    Name ="Linie522"
                End
                Begin TextBox
                    BorderWidth =1
                    Width =915
                    Height =285
                    FontSize =10
                    Name ="ZuordNr"
                    ControlSource ="ZuordNr"
                    StatusBarText ="lfd.Nr."

                End
                Begin TextBox
                    BorderWidth =1
                    Left =915
                    Width =855
                    Height =285
                    FontSize =10
                    TabIndex =1
                    Name ="AnzahlZuord"
                    ControlSource ="AnzahlZuord"

                End
                Begin TextBox
                    BorderWidth =1
                    Left =7440
                    Width =2715
                    Height =285
                    ColumnWidth =4635
                    FontSize =10
                    TabIndex =2
                    Name ="BemZuord"
                    ControlSource ="BemZuord"
                    StatusBarText ="Erläuterungen"

                End
                Begin TextBox
                    BorderWidth =1
                    Left =3420
                    Width =4020
                    Height =285
                    FontSize =10
                    TabIndex =3
                    Name ="AZ"
                    ControlSource ="AZ"

                End
                Begin TextBox
                    BorderWidth =1
                    Left =1770
                    Width =1650
                    Height =285
                    FontSize =10
                    TabIndex =4
                    Name ="ArtZuord"
                    ControlSource ="ArtZuord"

                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            ForceNewPage =2
            Height =0
            BreakLevel =1
            Name ="gfID"
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            ForceNewPage =2
            Height =0
            Name ="gfSort"
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_Artikel.cls"
