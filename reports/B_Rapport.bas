Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =10152
    DatasheetFontHeight =12
    ItemSuffix =132
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xaf54efd99c18e540
    End
    Caption ="Rapport"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            FontSize =10
            FontWeight =700
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BorderWidth =1
            BorderLineStyle =0
            Width =2846
            Height =210
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            BorderLineStyle =0
            Width =2163
            Height =264
            LabelX =-1701
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin Subform
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="IDVG"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="NrBearbeiter"
        End
        Begin BreakLevel
            ControlSource ="MA"
        End
        Begin BreakLevel
            ControlSource ="DatumTag"
        End
        Begin PageHeader
            Height =2154
            Name ="ph"
            Begin
                Begin Label
                    BorderWidth =2
                    TextAlign =2
                    TextFontFamily =34
                    Top =113
                    Width =10148
                    Height =525
                    FontSize =16
                    Name ="strReportTitel"
                    Caption ="Arbeitsrapport"
                    FontName ="Arial"
                    LayoutCachedTop =113
                    LayoutCachedWidth =10148
                    LayoutCachedHeight =638
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1021
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Text24"
                    Caption ="Auftraggeber"
                    FontName ="Arial"
                    LayoutCachedTop =1021
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =1306
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1021
                    Width =8382
                    Height =285
                    ColumnOrder =0
                    FontSize =10
                    FontWeight =700
                    LeftMargin =57
                    Name ="FirmaPartner"
                    ControlSource ="FirmaPartner"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedTop =1021
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =1306
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =736
                    Width =8382
                    Height =285
                    ColumnOrder =2
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    LeftMargin =57
                    Name ="Feld42"
                    ControlSource ="=[ANr] & \" \" & [VG]"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedTop =736
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =1021
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =736
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Text104"
                    Caption ="Projekt"
                    FontName ="Arial"
                    LayoutCachedTop =736
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =1021
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1591
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Text101"
                    Caption ="Bestell-Nr."
                    FontName ="Arial"
                    LayoutCachedTop =1591
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =1876
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1591
                    Width =8382
                    Height =285
                    ColumnOrder =3
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    LeftMargin =57
                    Name ="BestellNr"
                    ControlSource ="BestellNr"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedTop =1591
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =1876
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1306
                    Width =8382
                    Height =285
                    ColumnOrder =4
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    LeftMargin =57
                    Name ="Partner"
                    ControlSource ="Partner"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedTop =1306
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =1591
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1306
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Bezeichnungsfeld127"
                    Caption ="Partner"
                    FontName ="Arial"
                    LayoutCachedTop =1306
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =1591
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            RepeatSection = NotDefault
            Height =1373
            BreakLevel =1
            Name ="Gruppenkopf0"
            Begin
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =1418
                    Top =848
                    Width =1531
                    Height =525
                    FontWeight =400
                    Name ="Text26"
                    Caption ="verrechnet = (x)\015\012Anzahl"
                    FontName ="Arial"
                    LayoutCachedLeft =1418
                    LayoutCachedTop =848
                    LayoutCachedWidth =2949
                    LayoutCachedHeight =1373
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =2948
                    Top =848
                    Width =3289
                    Height =525
                    FontWeight =400
                    Name ="Text37"
                    Caption ="Detailbeschreibung"
                    FontName ="Arial"
                    LayoutCachedLeft =2948
                    LayoutCachedTop =848
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =1373
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =3
                    Top =848
                    Width =1418
                    Height =525
                    FontWeight =400
                    Name ="lblDatum"
                    Caption ="Datum"
                    FontName ="Arial"
                    LayoutCachedLeft =3
                    LayoutCachedTop =848
                    LayoutCachedWidth =1421
                    LayoutCachedHeight =1373
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =6237
                    Top =848
                    Width =3864
                    Height =525
                    FontWeight =400
                    Name ="Text87"
                    Caption ="Bemerkungen"
                    FontName ="Arial"
                    LayoutCachedLeft =6237
                    LayoutCachedTop =848
                    LayoutCachedWidth =10101
                    LayoutCachedHeight =1373
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =0
                    TextFontFamily =34
                    Left =1717
                    Width =8382
                    Height =285
                    FontSize =10
                    FontWeight =700
                    LeftMargin =57
                    Name ="MA"
                    ControlSource ="MA"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =285
                End
                Begin Label
                    OldBorderStyle =1
                    BorderWidth =0
                    TextFontFamily =34
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Text106"
                    Caption ="Mitarbeiter"
                    FontName ="Arial"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =0
                    TextFontFamily =34
                    Left =1717
                    Top =285
                    Width =8382
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    LeftMargin =57
                    Name ="vonBis"
                    FontName ="Arial"

                    LayoutCachedLeft =1717
                    LayoutCachedTop =285
                    LayoutCachedWidth =10099
                    LayoutCachedHeight =570
                End
                Begin Label
                    OldBorderStyle =1
                    BorderWidth =0
                    TextFontFamily =34
                    Top =285
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Text108"
                    Caption ="Zeitraum"
                    FontName ="Arial"
                    LayoutCachedTop =285
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =570
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =285
            OnFormat ="[Event Procedure]"
            Name ="det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =2
                    TextFontFamily =34
                    Width =1418
                    Height =285
                    FontSize =10
                    Name ="DatumTag"
                    ControlSource ="DatumTag"
                    Format ="ddd\"., \"dd\\.mm\\.yy"
                    FontName ="Arial"

                    LayoutCachedWidth =1418
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2098
                    Width =851
                    Height =285
                    FontSize =10
                    TabIndex =1
                    Name ="LiefereinheitVG"
                    ControlSource ="LiefereinheitVG"
                    FontName ="Arial"

                    LayoutCachedLeft =2098
                    LayoutCachedWidth =2949
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2948
                    Width =3289
                    Height =285
                    FontSize =8
                    TabIndex =2
                    Name ="Feld116"
                    ControlSource ="ArtikelText"
                    FontName ="Arial Narrow"

                    LayoutCachedLeft =2948
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =6237
                    Width =3864
                    Height =285
                    FontSize =8
                    TabIndex =3
                    Name ="Feld117"
                    ControlSource ="BemLeistung"
                    FontName ="Arial Narrow"
                    TextFormat =1

                    LayoutCachedLeft =6237
                    LayoutCachedWidth =10101
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =1418
                    Width =680
                    Height =285
                    FontSize =10
                    TabIndex =4
                    Name ="Feld118"
                    ControlSource ="AnzahlLeistung"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =1418
                    LayoutCachedWidth =2098
                    LayoutCachedHeight =285
                End
                Begin Line
                    Width =10101
                    Name ="Linie130"
                    LayoutCachedWidth =10101
                End
            End
        End
        Begin BreakFooter
            CanGrow = NotDefault
            Height =566
            BreakLevel =1
            Name ="gf"
            Begin
                Begin Line
                    Top =56
                    Width =10101
                    Name ="Linie124"
                    LayoutCachedTop =56
                    LayoutCachedWidth =10101
                    LayoutCachedHeight =56
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =1700
                    Top =113
                    Width =962
                    Height =285
                    FontSize =10
                    FontWeight =700
                    Name ="Text125"
                    ControlSource ="=Sum([AnzahlLeistung])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =1700
                    LayoutCachedTop =113
                    LayoutCachedWidth =2662
                    LayoutCachedHeight =398
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =113
                    Width =1590
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    Name ="Bezeichnungsfeld131"
                    Caption ="Gesamt "
                    FontName ="Arial"
                    LayoutCachedTop =113
                    LayoutCachedWidth =1590
                    LayoutCachedHeight =398
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            Height =0
            OnFormat ="[Event Procedure]"
            Name ="gf1"
        End
        Begin PageFooter
            Height =320
            Name ="pf"
            Begin
                Begin TextBox
                    BorderWidth =0
                    TextAlign =3
                    TextFontFamily =34
                    Top =56
                    Width =2511
                    FontSize =10
                    FontWeight =700
                    Name ="Feld120"
                    ControlSource ="=Date()"
                    Format ="dd\\.mm\\.yy"
                    FontName ="Arial"

                    LayoutCachedTop =56
                    LayoutCachedWidth =2511
                    LayoutCachedHeight =320
                End
                Begin TextBox
                    BorderWidth =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7541
                    Top =56
                    Width =2511
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="Feld25"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"
                    Format ="Short Date"
                    FontName ="Arial"

                    LayoutCachedLeft =7541
                    LayoutCachedTop =56
                    LayoutCachedWidth =10052
                    LayoutCachedHeight =320
                End
            End
        End
    End
End
CodeBehindForm
' See "B_Rapport.cls"
