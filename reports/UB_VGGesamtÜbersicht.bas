Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =9072
    DatasheetFontHeight =12
    ItemSuffix =231
    RecSrcDt = Begin
        0x5ea199338eace540
    End
    RecordSource ="SELECT * FROM vwUB_VGÜbersicht; "
    Caption ="Vorgang Report"
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
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
        End
        Begin PageBreak
            Width =283
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="=[GR]"
        End
        Begin BreakLevel
            ControlSource ="=[VGDatum]"
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            RepeatSection = NotDefault
            Height =585
            Name ="gh"
            Begin
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    FontWeight =400
                    Name ="lblID"
                    Caption ="ID"
                    FontName ="Arial"
                    Tag ="lg"
                    LayoutCachedTop =330
                    LayoutCachedWidth =1134
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =1134
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    FontWeight =400
                    Name ="lblDatum"
                    Caption ="Datum"
                    FontName ="Arial"
                    Tag ="lg"
                    LayoutCachedLeft =1134
                    LayoutCachedTop =330
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =4536
                    Top =330
                    Width =2835
                    Height =255
                    FontSize =8
                    FontWeight =400
                    Name ="lblVorgangsart"
                    Caption ="Vorgangsart"
                    FontName ="Arial"
                    Tag ="lg"
                    LayoutCachedLeft =4536
                    LayoutCachedTop =330
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7371
                    Top =330
                    Width =1701
                    Height =255
                    ColumnOrder =0
                    FontSize =8
                    Name ="VGWährung"
                    ControlSource ="VGWährung"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =330
                    LayoutCachedWidth =9072
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Width =9072
                    Height =330
                    TabIndex =1
                    Name ="rptTitle"
                    ControlSource ="rptTitle"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedWidth =9072
                    LayoutCachedHeight =330
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =2268
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    FontWeight =400
                    Name ="Bezeichnungsfeld227"
                    Caption ="lfd. Nr."
                    FontName ="Arial"
                    Tag ="lg"
                    LayoutCachedLeft =2268
                    LayoutCachedTop =330
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =3402
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    FontWeight =400
                    Name ="Bezeichnungsfeld229"
                    Caption ="Projekt-Nr."
                    FontName ="Arial"
                    Tag ="lg"
                    LayoutCachedLeft =3402
                    LayoutCachedTop =330
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =585
                    BackThemeColorIndex =1
                    BackShade =95.0
                    BorderThemeColorIndex =0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =284
            Name ="Det"
            Begin
                Begin TextBox
                    OldBorderStyle =1
                    TextFontFamily =34
                    Width =1134
                    Height =284
                    FontSize =10
                    Name ="ID"
                    ControlSource ="NrVG"
                    FontName ="Arial"

                    LayoutCachedWidth =1134
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =12
                    TextAlign =2
                    TextFontFamily =34
                    Left =1134
                    Width =1134
                    Height =284
                    FontSize =10
                    TabIndex =1
                    Name ="Datum"
                    ControlSource ="VGDatum"
                    Format ="dd/mm/yy"
                    FontName ="Arial"

                    LayoutCachedLeft =1134
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =4536
                    Width =2835
                    Height =284
                    FontSize =10
                    TabIndex =2
                    Name ="Vorgangsart"
                    ControlSource ="QK"
                    FontName ="Arial"

                    LayoutCachedLeft =4536
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7371
                    Width =1701
                    Height =284
                    FontSize =10
                    TabIndex =3
                    Name ="EPreis"
                    ControlSource ="SumVGtot"
                    Format ="#,###.00"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedWidth =9072
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =2268
                    Width =1134
                    Height =284
                    FontSize =10
                    TabIndex =4
                    Name ="VGNR"
                    ControlSource ="VGNR"
                    FontName ="Arial"

                    LayoutCachedLeft =2268
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =3402
                    Width =1134
                    Height =284
                    FontSize =10
                    TabIndex =5
                    Name ="ProjektNr"
                    ControlSource ="ProjektNr"
                    FontName ="Arial"

                    LayoutCachedLeft =3402
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =284
                    BorderThemeColorIndex =0
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =330
            Name ="gf"
            Begin
                Begin TextBox
                    FontUnderline = NotDefault
                    DecimalPlaces =2
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7371
                    Width =1701
                    Height =330
                    FontWeight =700
                    Name ="sumSumVGtot"
                    ControlSource ="=Sum([SumVGtot])"
                    Format ="#,###.00"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedWidth =9072
                    LayoutCachedHeight =330
                    BorderThemeColorIndex =0
                End
            End
        End
    End
End
CodeBehindForm
' See "UB_VGGesamtÜbersicht.cls"
