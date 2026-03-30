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
    ItemSuffix =233
    RecSrcDt = Begin
        0x69305bbff34ce640
    End
    RecordSource ="SELECT * FROM vwUB_VGRahmenvertrag; "
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
            ControlSource ="=[rptTitle]"
        End
        Begin BreakLevel
            ControlSource ="=[Artikel]"
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            RepeatSection = NotDefault
            Height =585
            Name ="gh"
            Begin
                Begin TextBox
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Width =9072
                    Height =330
                    FontSize =8
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
                Begin TextBox
                    OldBorderStyle =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    Top =330
                    Width =4536
                    Height =255
                    FontSize =8
                    TabIndex =1
                    Name ="txtArtikel"
                    ControlSource ="txtArtikel"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedTop =330
                    LayoutCachedWidth =4536
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
                    Left =4535
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =2
                    Name ="txt28"
                    ControlSource ="txt28"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedLeft =4535
                    LayoutCachedTop =330
                    LayoutCachedWidth =5669
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
                    Left =5669
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =3
                    Name ="txt30"
                    ControlSource ="txt30"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedLeft =5669
                    LayoutCachedTop =330
                    LayoutCachedWidth =6803
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
                    Left =6803
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =4
                    Name ="txt35"
                    ControlSource ="txt35"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedLeft =6803
                    LayoutCachedTop =330
                    LayoutCachedWidth =7937
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
                    Left =7936
                    Top =330
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =5
                    Name ="TxtRest"
                    ControlSource ="txtRest"
                    FontName ="Arial"
                    Tag ="lg"

                    LayoutCachedLeft =7936
                    LayoutCachedTop =330
                    LayoutCachedWidth =9070
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
            Height =225
            Name ="Det"
            Begin
                Begin TextBox
                    OldBorderStyle =1
                    TextFontFamily =34
                    Width =4536
                    Height =225
                    FontSize =8
                    Name ="Artikel"
                    ControlSource ="Artikel"
                    FontName ="Arial"

                    LayoutCachedWidth =4536
                    LayoutCachedHeight =225
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =4535
                    Width =1134
                    Height =225
                    FontSize =8
                    TabIndex =1
                    Name ="Anzahl28"
                    ControlSource ="Anzahl28"
                    FontName ="Arial"

                    LayoutCachedLeft =4535
                    LayoutCachedWidth =5669
                    LayoutCachedHeight =225
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =5669
                    Width =1134
                    Height =225
                    FontSize =8
                    TabIndex =2
                    Name ="Anzahl30"
                    ControlSource ="Anzahl30"
                    FontName ="Arial"

                    LayoutCachedLeft =5669
                    LayoutCachedWidth =6803
                    LayoutCachedHeight =225
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =6803
                    Width =1134
                    Height =225
                    FontSize =8
                    TabIndex =3
                    Name ="Anzahl35"
                    ControlSource ="Anzahl35"
                    FontName ="Arial"

                    LayoutCachedLeft =6803
                    LayoutCachedWidth =7937
                    LayoutCachedHeight =225
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =7936
                    Width =1134
                    Height =225
                    FontSize =8
                    TabIndex =4
                    Name ="AnzahlRest"
                    ControlSource ="=IIf([Anzahl30]>[Anzahl28],[Anzahl30],IIf([Anzahl28]-[Anzahl35]<0,0,[Anzahl28])-"
                        "[Anzahl35])"
                    FontName ="Arial"

                    LayoutCachedLeft =7936
                    LayoutCachedWidth =9070
                    LayoutCachedHeight =225
                    BorderThemeColorIndex =0
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="gf"
        End
    End
End
CodeBehindForm
' See "UB_VGRahmenvertrag.cls"
