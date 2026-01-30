Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =0
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7435
    DatasheetFontHeight =11
    ItemSuffix =16
    Left =-7936
    Top =3030
    Right =20609
    Bottom =15225
    Tag ="pfrmCheckVG"
    RecSrcDt = Begin
        0xf17a08730f79e440
    End
    Caption ="Checke Konten für Vorgang 50  Kreditor - Herzzentrum Bad Krozingen - Test Lexwar"
        "e             "
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    DatasheetBackColor12 =-2147483643
    ShowPageMargins =0
    DatasheetAlternateBackColor =16053492
    DatasheetGridlinesColor12 =15062992
    FitToScreen =1
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            ForeThemeColorIndex =2
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BackColor =-2147483633
            BorderLineStyle =0
            BorderThemeColorIndex =3
            BorderShade =90.0
            ThemeFontIndex =1
        End
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =11565
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =4245
                    Top =2508
                    Width =2552
                    Height =1921
                    BackColor =15527148
                    Name ="lstMWST"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;0"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Mit Doppelclick zuordnen"

                    LayoutCachedLeft =4245
                    LayoutCachedTop =2508
                    LayoutCachedWidth =6797
                    LayoutCachedHeight =4429
                    BackThemeColorIndex =-1
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            Left =4245
                            Top =2115
                            Width =2552
                            Height =300
                            ForeColor =0
                            Name ="lblMWST"
                            Caption ="% MWST"
                            LayoutCachedLeft =4245
                            LayoutCachedTop =2115
                            LayoutCachedWidth =6797
                            LayoutCachedHeight =2415
                            BackThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =4245
                    Top =4931
                    Width =2552
                    Height =1141
                    TabIndex =1
                    BackColor =15527148
                    Name ="lstIhreUSTID"
                    RowSourceType ="Table/Query"
                    OnDblClick ="[Event Procedure]"

                    LayoutCachedLeft =4245
                    LayoutCachedTop =4931
                    LayoutCachedWidth =6797
                    LayoutCachedHeight =6072
                    BackThemeColorIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =4245
                            Top =4533
                            Width =2552
                            Height =300
                            Name ="Bezeichnungsfeld3"
                            Caption ="Ihre UST-Id:"
                            LayoutCachedLeft =4245
                            LayoutCachedTop =4533
                            LayoutCachedWidth =6797
                            LayoutCachedHeight =4833
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =4245
                    Top =6526
                    Width =2552
                    Height =1134
                    TabIndex =2
                    BackColor =15527148
                    Name ="lstUnsereUSTID"
                    RowSourceType ="Table/Query"
                    OnDblClick ="[Event Procedure]"

                    LayoutCachedLeft =4245
                    LayoutCachedTop =6526
                    LayoutCachedWidth =6797
                    LayoutCachedHeight =7660
                    BackThemeColorIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =4245
                            Top =6125
                            Width =2552
                            Height =300
                            Name ="Bezeichnungsfeld5"
                            Caption ="Unsere UST-Id:"
                            LayoutCachedLeft =4245
                            LayoutCachedTop =6125
                            LayoutCachedWidth =6797
                            LayoutCachedHeight =6425
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =105
                    Top =1747
                    Width =3969
                    Height =5913
                    TabIndex =3
                    BackColor =15527148
                    Name ="lstWarengruppe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="4536"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="mit Doppelclick der Liste oben zuordnen"

                    LayoutCachedLeft =105
                    LayoutCachedTop =1747
                    LayoutCachedWidth =4074
                    LayoutCachedHeight =7660
                    BackThemeColorIndex =-1
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =105
                    Top =8053
                    Width =6705
                    Height =3402
                    TabIndex =4
                    BackColor =15527148
                    Name ="lstHinweis"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;4536"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Liste der möglichen Hinweise\015\012Sind im Lexikon in der Gruppe Hinweis hinter"
                        "legt"

                    LayoutCachedLeft =105
                    LayoutCachedTop =8053
                    LayoutCachedWidth =6810
                    LayoutCachedHeight =11455
                    BackThemeColorIndex =-1
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =5
                    Left =105
                    Top =462
                    Width =6696
                    Height =1134
                    TabIndex =5
                    BackColor =15527148
                    Name ="lstVGDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="851;2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Liste der in den Artikeln enthaltenen Warengruppen, Haben- und Soll-Konten\015\012"
                        "Doppelclick zeigt die zugeordneten Artikel"

                    LayoutCachedLeft =105
                    LayoutCachedTop =462
                    LayoutCachedWidth =6801
                    LayoutCachedHeight =1596
                    BackThemeColorIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =112
                            Top =60
                            Width =6690
                            Height =300
                            Name ="Bezeichnungsfeld13"
                            Caption ="dem Vorgang zugeordnete Artikel"
                            LayoutCachedLeft =112
                            LayoutCachedTop =60
                            LayoutCachedWidth =6802
                            LayoutCachedHeight =360
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6859
                    Top =113
                    Width =576
                    Height =576
                    TabIndex =6
                    Name ="btnClose"
                    Caption ="btnClose"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00ddddd0dddddddddddddd00ddddddddddddd030dddddddddd ,
                        0xdd0330dddddddddd0033300000000dddd03330ff0dddddddd03300ff0dddd4dd ,
                        0xd03330ff0ddd44ddd03330ff0dd44444d03330ff0d444444d03330ff0dd44444 ,
                        0xd0330fff0ddd44ddd030ffff0dddd4ddd00fffff0dddddddd00000000ddddddd ,
                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Formular schließen"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =113
                    LayoutCachedWidth =7435
                    LayoutCachedHeight =689
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =105
                    Top =7710
                    Width =6705
                    Height =328
                    TabIndex =7
                    ForeColor =15709952
                    Name ="btnHinweis"
                    Caption ="Hinweis"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="füge ggf. einen erforderlichen Hinweis hinzu"

                    LayoutCachedLeft =105
                    LayoutCachedTop =7710
                    LayoutCachedWidth =6810
                    LayoutCachedHeight =8038
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    HoverForeColor =15709952
                    PressedForeColor =15709952
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmCheckVG.cls"
