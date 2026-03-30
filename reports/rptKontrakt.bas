Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =10219
    ItemSuffix =103
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x2c0f21d89c18e540
    End
    Caption ="Kontrakt-Übersicht"
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
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
            ShowDatePicker =0
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="=[Gruppe]"
        End
        Begin BreakLevel
            ControlSource ="=[lfdNr]"
        End
        Begin BreakLevel
            ControlSource ="=[NrQK]"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =0
            Name ="rh"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =1800
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    TextFontFamily =34
                    Top =1197
                    Width =10201
                    Height =480
                    ColumnOrder =3
                    FontSize =18
                    FontWeight =700
                    LeftMargin =113
                    ForeColor =3997901
                    Name ="ReportTitel"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedTop =1197
                    LayoutCachedWidth =10201
                    LayoutCachedHeight =1677
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Width =2494
                    Height =225
                    ColumnOrder =1
                    FontSize =8
                    TabIndex =1
                    Name ="txtDate"
                    ControlSource ="=date()"
                    Format ="dd\\.mm\\.yyyy"
                    FontName ="Arial"

                    LayoutCachedWidth =2494
                    LayoutCachedHeight =225
                End
                Begin Image
                    BackStyle =0
                    PictureAlignment =1
                    Left =570
                    Width =9627
                    Height =1135
                    BorderColor =0
                    Name ="Logo"

                    LayoutCachedLeft =570
                    LayoutCachedWidth =10197
                    LayoutCachedHeight =1135
                    TabIndex =3
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    Visible = NotDefault
                    TextFontFamily =34
                    Left =4932
                    Top =737
                    Width =2266
                    Height =240
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =2
                    BackColor =62207
                    Name ="logoFile"
                    ControlSource ="logoFile"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedLeft =4932
                    LayoutCachedTop =737
                    LayoutCachedWidth =7198
                    LayoutCachedHeight =977
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            RepeatSection = NotDefault
            Height =2055
            Name ="gh"
            AlternateBackColor =16777215
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1185
                    Top =170
                    Width =9021
                    Height =285
                    FontWeight =700
                    ForeColor =12349952
                    Name ="Firma"
                    ControlSource ="Firma"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedLeft =1185
                    LayoutCachedTop =170
                    LayoutCachedWidth =10206
                    LayoutCachedHeight =455
                End
                Begin Line
                    BorderWidth =6
                    Top =45
                    Width =10204
                    BorderColor =5167783
                    Name ="Linie55"
                    LayoutCachedTop =45
                    LayoutCachedWidth =10204
                    LayoutCachedHeight =45
                End
                Begin Line
                    BorderWidth =2
                    Top =1635
                    Width =10204
                    BorderColor =5167783
                    Name ="Linie57"
                    LayoutCachedTop =1635
                    LayoutCachedWidth =10204
                    LayoutCachedHeight =1635
                End
                Begin Label
                    FontItalic = NotDefault
                    TextFontFamily =34
                    Left =113
                    Top =165
                    Width =1022
                    Height =285
                    FontWeight =400
                    Name ="Bezeichnungsfeld75"
                    Caption ="Firma"
                    FontName ="Arial"
                    LayoutCachedLeft =113
                    LayoutCachedTop =165
                    LayoutCachedWidth =1135
                    LayoutCachedHeight =450
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1192
                    Top =860
                    Width =9021
                    Height =285
                    FontWeight =700
                    TabIndex =1
                    ForeColor =12349952
                    Name ="Artikel"
                    ControlSource ="Artikel"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedLeft =1192
                    LayoutCachedTop =860
                    LayoutCachedWidth =10213
                    LayoutCachedHeight =1145
                End
                Begin Label
                    FontItalic = NotDefault
                    TextFontFamily =34
                    Left =120
                    Top =855
                    Width =1022
                    Height =285
                    FontWeight =400
                    Name ="Bezeichnungsfeld77"
                    Caption ="Artikel"
                    FontName ="Arial"
                    LayoutCachedLeft =120
                    LayoutCachedTop =855
                    LayoutCachedWidth =1142
                    LayoutCachedHeight =1140
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1192
                    Top =515
                    Width =9021
                    Height =285
                    FontWeight =700
                    TabIndex =2
                    ForeColor =12349952
                    Name ="ProjektTitel"
                    ControlSource ="ProjektTitel"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedLeft =1192
                    LayoutCachedTop =515
                    LayoutCachedWidth =10213
                    LayoutCachedHeight =800
                End
                Begin Label
                    FontItalic = NotDefault
                    TextFontFamily =34
                    Left =120
                    Top =510
                    Width =1022
                    Height =285
                    FontWeight =400
                    Name ="Bezeichnungsfeld79"
                    Caption ="Projekt"
                    FontName ="Arial"
                    LayoutCachedLeft =120
                    LayoutCachedTop =510
                    LayoutCachedWidth =1142
                    LayoutCachedHeight =795
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1192
                    Top =1270
                    Width =9021
                    Height =285
                    FontWeight =700
                    TabIndex =3
                    ForeColor =12349952
                    Name ="Dauer"
                    ControlSource ="Dauer"
                    StatusBarText ="Bezeichnung des Typs oder Art einer  Komponente/ Maschine / Position / Objekt"
                    FontName ="Arial"

                    LayoutCachedLeft =1192
                    LayoutCachedTop =1270
                    LayoutCachedWidth =10213
                    LayoutCachedHeight =1555
                End
                Begin Label
                    FontItalic = NotDefault
                    TextFontFamily =34
                    Left =120
                    Top =1265
                    Width =1022
                    Height =285
                    FontWeight =400
                    Name ="Bezeichnungsfeld81"
                    Caption ="Dauer"
                    FontName ="Arial"
                    LayoutCachedLeft =120
                    LayoutCachedTop =1265
                    LayoutCachedWidth =1142
                    LayoutCachedHeight =1550
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Top =1770
                    Width =1134
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld91"
                    Caption ="lfd. Nr."
                    FontName ="Arial"
                    LayoutCachedTop =1770
                    LayoutCachedWidth =1134
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1134
                    Top =1770
                    Width =2835
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld92"
                    Caption ="Was"
                    FontName ="Arial"
                    LayoutCachedLeft =1134
                    LayoutCachedTop =1770
                    LayoutCachedWidth =3969
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =3969
                    Top =1770
                    Width =1134
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld93"
                    Caption ="erfasst am"
                    FontName ="Arial"
                    LayoutCachedLeft =3969
                    LayoutCachedTop =1770
                    LayoutCachedWidth =5103
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =5103
                    Top =1770
                    Width =1134
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld94"
                    Caption ="Datum"
                    FontName ="Arial"
                    LayoutCachedLeft =5103
                    LayoutCachedTop =1770
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =6237
                    Top =1770
                    Width =1134
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld95"
                    Caption ="Preis"
                    FontName ="Arial"
                    LayoutCachedLeft =6237
                    LayoutCachedTop =1770
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7371
                    Top =1770
                    Width =1134
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld96"
                    Caption ="Menge"
                    FontName ="Arial"
                    LayoutCachedLeft =7371
                    LayoutCachedTop =1770
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =2055
                End
                Begin Label
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =8505
                    Top =1770
                    Width =1652
                    Height =285
                    FontWeight =400
                    LeftMargin =57
                    RightMargin =57
                    Name ="Bezeichnungsfeld97"
                    Caption ="Menge (Wert)"
                    FontName ="Arial"
                    LayoutCachedLeft =8505
                    LayoutCachedTop =1770
                    LayoutCachedWidth =10157
                    LayoutCachedHeight =2055
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =270
            Name ="Det"
            AlternateBackColor =15590879
            Begin
                Begin TextBox
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Width =1134
                    Height =270
                    ColumnOrder =0
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="lfdNr"
                    ControlSource ="lfdNr"
                    FontName ="Arial"

                    LayoutCachedWidth =1134
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1134
                    Width =2835
                    Height =270
                    TabIndex =1
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="QK"
                    ControlSource ="QK"
                    FontName ="Arial"

                    LayoutCachedLeft =1134
                    LayoutCachedWidth =3969
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =3969
                    Width =1134
                    Height =270
                    TabIndex =2
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="VGDatum"
                    ControlSource ="VGDatum"
                    Format ="dd\\.mm\\.yy"
                    FontName ="Arial"

                    LayoutCachedLeft =3969
                    LayoutCachedWidth =5103
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =6237
                    Width =1134
                    Height =270
                    TabIndex =3
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="Preis"
                    ControlSource ="Preis"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =6237
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =5103
                    Width =1134
                    Height =270
                    TabIndex =4
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="VGDat1"
                    ControlSource ="VGDat1"
                    Format ="dd\\.mm\\.yy"
                    FontName ="Arial"

                    LayoutCachedLeft =5103
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    DecimalPlaces =3
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7371
                    Width =1134
                    Height =270
                    TabIndex =5
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="wieviel"
                    ControlSource ="wieviel"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    DecimalPlaces =3
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =8505
                    Width =1652
                    Height =270
                    FontWeight =700
                    TabIndex =6
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="wertWieviel"
                    ControlSource ="wertWieviel"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =8505
                    LayoutCachedWidth =10157
                    LayoutCachedHeight =270
                End
            End
        End
        Begin BreakFooter
            CanGrow = NotDefault
            CanShrink = NotDefault
            ForceNewPage =2
            Height =405
            Name ="gf"
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontUnderline = NotDefault
                    DecimalPlaces =3
                    TextFontFamily =34
                    Left =8505
                    Top =120
                    Width =1652
                    Height =285
                    FontWeight =700
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="sumwertWieviel"
                    ControlSource ="=Sum([wertWieviel])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =8505
                    LayoutCachedTop =120
                    LayoutCachedWidth =10157
                    LayoutCachedHeight =405
                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontUnderline = NotDefault
                    DecimalPlaces =3
                    TextFontFamily =34
                    Left =6859
                    Top =113
                    Width =1652
                    Height =285
                    FontWeight =700
                    TabIndex =1
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="sumWieviel"
                    ControlSource ="=Sum([Wieviel])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =113
                    LayoutCachedWidth =8511
                    LayoutCachedHeight =398
                End
            End
        End
        Begin PageFooter
            Height =225
            Name ="pf"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextFontFamily =34
                    Width =3754
                    Height =225
                    FontSize =8
                    Name ="txtSeite"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"
                    FontName ="Arial"

                    LayoutCachedWidth =3754
                    LayoutCachedHeight =225
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =3840
                    Width =6379
                    Height =225
                    FontSize =8
                    TabIndex =1
                    Name ="txtAnhang"
                    FontName ="Arial"

                    LayoutCachedLeft =3840
                    LayoutCachedWidth =10219
                    LayoutCachedHeight =225
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =506
            Name ="rf"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontUnderline = NotDefault
                    DecimalPlaces =3
                    TextFontFamily =34
                    Left =8450
                    Top =177
                    Width =1652
                    Height =324
                    FontSize =12
                    FontWeight =700
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="Text100"
                    ControlSource ="=Sum([wertWieviel])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =8450
                    LayoutCachedTop =177
                    LayoutCachedWidth =10102
                    LayoutCachedHeight =501
                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontUnderline = NotDefault
                    DecimalPlaces =3
                    TextFontFamily =34
                    Left =6804
                    Top =170
                    Width =1652
                    Height =324
                    FontSize =12
                    FontWeight =700
                    TabIndex =1
                    LeftMargin =57
                    RightMargin =57
                    ForeColor =12349952
                    Name ="Text101"
                    ControlSource ="=Sum([Wieviel])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =6804
                    LayoutCachedTop =170
                    LayoutCachedWidth =8456
                    LayoutCachedHeight =494
                End
                Begin Label
                    FontItalic = NotDefault
                    TextFontFamily =34
                    Left =5499
                    Top =170
                    Width =1320
                    Height =336
                    FontSize =12
                    Name ="Bezeichnungsfeld102"
                    Caption ="OFFEN"
                    FontName ="Arial"
                    LayoutCachedLeft =5499
                    LayoutCachedTop =170
                    LayoutCachedWidth =6819
                    LayoutCachedHeight =506
                End
            End
        End
    End
End
CodeBehindForm
' See "rptKontrakt.cls"
