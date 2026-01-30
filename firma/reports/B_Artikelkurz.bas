Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =14801
    ItemSuffix =88
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x2e578eda9c18e540
    End
    Caption ="Artikelliste"
    OnOpen ="[Event Procedure]"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            OldBorderStyle =1
            FontWeight =700
            FontName ="Arial"
        End
        Begin Rectangle
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =228
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin BoundObjectFrame
            AutoLabel = NotDefault
            BorderLineStyle =0
            Width =728
            Height =228
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            BorderLineStyle =0
            Width =1701
            Height =228
            LabelX =-1701
            FontName ="Arial"
        End
        Begin BreakLevel
            ControlSource ="Artikel"
        End
        Begin BreakLevel
            ControlSource ="Hersteller"
        End
        Begin BreakLevel
            ControlSource ="ArtikelName"
        End
        Begin PageHeader
            Height =638
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Label
                    OldBorderStyle =0
                    Left =2663
                    Top =396
                    Width =852
                    Height =228
                    Name ="Text6"
                    Caption ="Hersteller"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =3911
                    Top =396
                    Width =1044
                    Height =228
                    Name ="Text8"
                    Caption ="Artikel"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =8106
                    Top =396
                    Width =828
                    Height =228
                    Name ="Text12"
                    Caption ="ArtikelNr"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =8956
                    Top =396
                    Width =600
                    Height =228
                    Name ="Text14"
                    Caption ="Einheit"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =9580
                    Top =396
                    Width =672
                    Height =228
                    Name ="Text16"
                    Caption ="EKpreis"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =10260
                    Top =390
                    Width =1125
                    Height =240
                    Name ="Text19"
                    Caption ="Bemerkungen"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =13664
                    Top =396
                    Width =960
                    Height =225
                    Name ="Text21"
                    Caption ="Erfasst"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =56
                    Top =396
                    Width =1020
                    Height =227
                    Name ="Text45"
                    Caption ="Lieferant"
                End
                Begin Label
                    OldBorderStyle =0
                    Left =5900
                    Top =396
                    Width =2013
                    Height =228
                    Name ="Bezeichnungsfeld73"
                    Caption ="Artikeltyp"
                End
                Begin Line
                    LineSlant = NotDefault
                    BorderWidth =2
                    Left =56
                    Top =623
                    Width =14685
                    Name ="Linie42"
                End
                Begin TextBox
                    FontItalic = NotDefault
                    OldBorderStyle =0
                    TextAlign =3
                    Left =11905
                    Width =2880
                    Height =225
                    Name ="Feld38"
                    ControlSource ="=Now()"
                    Format ="dd/mmm/yyyy"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    Left =56
                    Width =11400
                    Height =375
                    FontSize =14
                    FontWeight =700
                    TabIndex =1
                    Name ="ReportTitel"

                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =292
            Name ="Det"
            Begin
                Begin TextBox
                    Left =2554
                    Width =1311
                    Height =292
                    ColumnWidth =2055
                    FontSize =6
                    Name ="Hersteller"
                    ControlSource ="Hersteller"
                    StatusBarText ="Hersteller-Nr./ Best. Nr. beim Lieferant"

                End
                Begin TextBox
                    Left =3865
                    Width =1978
                    Height =292
                    ColumnWidth =2745
                    FontSize =6
                    TabIndex =1
                    Name ="ArtikelName"
                    ControlSource ="Artikel"

                End
                Begin TextBox
                    TextAlign =2
                    Left =8059
                    Width =840
                    Height =292
                    ColumnWidth =1800
                    FontSize =6
                    TabIndex =2
                    Name ="ArtikelNr"
                    ControlSource ="ArtikelNr"
                    StatusBarText ="Lieferant"

                End
                Begin TextBox
                    TextAlign =2
                    Left =8899
                    Width =624
                    Height =292
                    ColumnWidth =1155
                    FontSize =6
                    TabIndex =3
                    Name ="Liefereinheit"
                    ControlSource ="Liefereinheit"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =2
                    Left =9523
                    Width =672
                    Height =292
                    FontSize =6
                    TabIndex =4
                    Name ="Einkaufspreis"
                    ControlSource ="Einkaufspreis"
                    Format ="Standard"
                    StatusBarText ="durchschnittlicher Einkaufspreis"

                End
                Begin TextBox
                    Left =10195
                    Width =3469
                    Height =292
                    FontSize =6
                    TabIndex =5
                    Name ="BemArtikel"
                    ControlSource ="BemArtikel"
                    TextFormat =1

                End
                Begin TextBox
                    Left =13664
                    Width =975
                    Height =292
                    FontSize =6
                    TabIndex =6
                    Name ="ArtikelErfasst"
                    ControlSource ="ArtikelErfasst"

                End
                Begin TextBox
                    Width =2554
                    Height =292
                    FontSize =6
                    TabIndex =7
                    Name ="Lieferant"
                    ControlSource ="Firma"

                End
                Begin TextBox
                    Left =5843
                    Width =2216
                    Height =292
                    FontSize =6
                    TabIndex =8
                    Name ="Text68"
                    ControlSource ="Artikelname"

                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_Artikelkurz.cls"
