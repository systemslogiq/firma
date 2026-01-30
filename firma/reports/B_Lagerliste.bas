Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =49
    DateGrouping =1
    GridY =10
    Width =14752
    DatasheetFontHeight =10
    ItemSuffix =41
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x0ecebaf19c18e540
    End
    Caption ="Lagerliste"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Courier"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            FontUnderline = NotDefault
            FontSize =10
            FontWeight =700
            FontName ="Arial"
        End
        Begin Rectangle
            BorderLineStyle =0
            Width =850
            Height =850
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
            BorderLineStyle =0
            Width =1701
            Height =280
            LabelX =-1701
            FontSize =10
            FontName ="Arial"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="=[ArtikelNr]"
        End
        Begin BreakLevel
            ControlSource ="Artikel"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="rh"
        End
        Begin PageHeader
            Height =1360
            Name ="ph"
            Begin
                Begin Label
                    Top =881
                    Width =1860
                    Height =285
                    Name ="Text5"
                    Caption ="Artikel"
                End
                Begin Label
                    TextAlign =3
                    Left =8503
                    Top =924
                    Width =1680
                    Height =285
                    Name ="Text9"
                    Caption ="Einkaufspreis"
                End
                Begin Label
                    Left =6240
                    Top =929
                    Width =1995
                    Height =285
                    Name ="Text15"
                    Caption ="Lieferant"
                End
                Begin Label
                    TextAlign =3
                    Left =10695
                    Top =924
                    Width =870
                    Height =285
                    Name ="Text19"
                    Caption ="Bestand"
                End
                Begin Line
                    BorderWidth =3
                    Top =825
                    Width =14752
                    Name ="Linie24"
                End
                Begin Line
                    BorderWidth =3
                    Top =1316
                    Width =14752
                    Name ="Linie25"
                End
                Begin Label
                    FontUnderline = NotDefault
                    TextAlign =1
                    TextFontFamily =18
                    Top =75
                    Width =10605
                    Height =600
                    FontSize =24
                    Name ="ReportTitel"
                    Caption ="Lagerliste"
                    FontName ="Times New Roman"
                End
                Begin Line
                    LineSlant = NotDefault
                    BorderWidth =3
                    Top =15
                    Width =14752
                    Name ="Linie23"
                End
                Begin TextBox
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    Left =10997
                    Top =56
                    Width =3670
                    Height =700
                    FontSize =9
                    Name ="Feld320"
                    ControlSource ="=Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page] & \" von \" & [Pa"
                        "ges]"

                End
                Begin Label
                    TextAlign =1
                    Left =13264
                    Top =919
                    Width =1485
                    Height =285
                    Name ="Bezeichnungsfeld39"
                    Caption ="Lagerort"
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    TextAlign =3
                    IMESentenceMode =3
                    Left =11775
                    Top =924
                    Width =1380
                    Height =285
                    FontWeight =700
                    TabIndex =1
                    Name ="txtTotal"
                    ControlSource ="=[DBWährung] & \" Total\""

                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =0
            Name ="gh"
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =280
            Name ="det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    Width =2271
                    Name ="Artikel"
                    ControlSource ="Artikel"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =2264
                    Width =2271
                    TabIndex =1
                    Name ="ArtikelName"
                    ControlSource ="ArtikelName"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =4535
                    TabIndex =2
                    Name ="ArtikelNr"
                    ControlSource ="ArtikelNr"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    TextAlign =3
                    Left =10260
                    Width =801
                    TabIndex =3
                    Name ="Bestand"
                    ControlSource ="Lagermenge"
                    Format ="Fixed"

                    LayoutCachedLeft =10260
                    LayoutCachedWidth =11061
                    LayoutCachedHeight =280
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =11067
                    Width =681
                    TabIndex =4
                    Name ="Liefereinheit"
                    ControlSource ="Liefereinheit"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =6240
                    Width =2841
                    TabIndex =5
                    Name ="Firma"
                    ControlSource ="Firma"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    Left =9081
                    Width =1131
                    TabIndex =6
                    Name ="Einkaufspreis"
                    ControlSource ="Einkaufspreis"
                    Format ="Standard"

                End
                Begin Line
                    BorderWidth =1
                    Width =14752
                    Name ="Linie32"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    Left =11745
                    Width =1461
                    TabIndex =7
                    Name ="Total"
                    ControlSource ="Total"
                    Format ="Standard"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    Left =13264
                    Width =1476
                    FontWeight =700
                    TabIndex =8
                    Name ="Text38"
                    ControlSource ="Lagerort"

                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            Height =0
            Name ="gf"
        End
        Begin PageFooter
            Height =71
            Name ="pf"
            Begin
                Begin Line
                    BorderWidth =3
                    Top =56
                    Width =14752
                    Name ="Linie26"
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =1134
            Name ="rf"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    FontUnderline = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    Left =11274
                    Top =226
                    Width =1881
                    FontWeight =700
                    Name ="Text37"
                    ControlSource ="=Sum([Total])"
                    Format ="Standard"

                End
                Begin TextBox
                    FontUnderline = NotDefault
                    TextAlign =3
                    IMESentenceMode =3
                    Left =8325
                    Top =225
                    Width =2940
                    Height =285
                    FontWeight =700
                    TabIndex =1
                    Name ="txtTotalG"
                    ControlSource ="=[DBWährung] & \" Total\""

                End
            End
        End
    End
End
CodeBehindForm
' See "B_Lagerliste.cls"
