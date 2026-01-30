Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =6237
    DatasheetFontHeight =11
    ItemSuffix =17
    Left =-7306
    Top =3030
    Right =20609
    Bottom =15225
    Tag ="Clone"
    RecSrcDt = Begin
        0x3a92cb07b2f8e340
    End
    Caption ="Clone Vorgänge aus 3082-002"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
    DatasheetBackColor12 =-2147483643
    ShowPageMargins =0
    DatasheetAlternateBackColor =16053492
    DatasheetGridlinesColor12 =15062992
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
        Begin TextBox
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ThemeFontIndex =1
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
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
        Begin CustomControl
            OldBorderStyle =1
            Width =4536
            Height =2835
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =5112
            BackColor =15527148
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =87
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =2835
                    Top =567
                    Width =3402
                    Height =1701
                    FontSize =10
                    TabIndex =1
                    ForeColor =0
                    BorderColor =0
                    Name ="lstClone"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="852;567;1418;0"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste der zu clonenden Vorgangsarten"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =567
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =2268
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =567
                            Top =567
                            Width =2268
                            Height =1701
                            Name ="Bezeichnungsfeld6"
                            Caption ="Die zu clonenden Vorgänge sind markiert\015\012\015\012nutze SHIFT / CTRL-Taste"
                            LayoutCachedLeft =567
                            LayoutCachedTop =567
                            LayoutCachedWidth =2835
                            LayoutCachedHeight =2268
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =3569
                    Top =2388
                    Width =1251
                    Height =285
                    FontSize =10
                    BorderColor =0
                    ForeColor =0
                    Name ="DatumTag"
                    Format ="dd/mm/yyyy"
                    DefaultValue ="date()"
                    FontName ="Arial"
                    ControlTipText ="Datum eingeben"
                    GridlineColor =0

                    LayoutCachedLeft =3569
                    LayoutCachedTop =2388
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =2673
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =567
                            Top =2388
                            Width =2268
                            Height =285
                            Name ="lblDatumTag"
                            Caption ="Lieferwunsch"
                            LayoutCachedLeft =567
                            LayoutCachedTop =2388
                            LayoutCachedWidth =2835
                            LayoutCachedHeight =2673
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =2835
                    Top =2835
                    Width =3402
                    Height =851
                    FontSize =10
                    TabIndex =2
                    ForeColor =0
                    BorderColor =0
                    Name ="lstNeueNr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="neue Lauf-Nummer, neues Projekt"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2835
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =3686
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =570
                            Top =2850
                            Width =2268
                            Height =567
                            Name ="Bezeichnungsfeld10"
                            Caption ="Auswahl neue Lauf-Nr.\015\012oder neues Projekt"
                            LayoutCachedLeft =570
                            LayoutCachedTop =2850
                            LayoutCachedWidth =2838
                            LayoutCachedHeight =3417
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =93
                    Left =2835
                    Top =4536
                    Width =2268
                    Height =576
                    TabIndex =3
                    Name ="btnOK"
                    Caption ="btnOK"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00ddddddddddddddddddddd00000ddddddddd00bbbbb00dddd ,
                        0xdd0bbbbbbbbb0dddd0bbbbbbbbbbb0ddd0bbb00000bbb0dd0bbb0bbbbb0bbb0d ,
                        0x0bb0bbbbbbb0bb0d0bbbbbbbbbbbbb0d0bbbbbbbbbbbbb0d0bbb00bbb00bbb0d ,
                        0xd0bb00bbb00bb0ddd0bbbbbbbbbbb0dddd0bbbbbbbbb0dddddd00bbbbb00dddd ,
                        0xddddd00000dddddd000000000000000000000000000000000000000000000000 ,
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
                    ControlTipText ="Starte das Clonen und schliesse das Fenster"

                    LayoutCachedLeft =2835
                    LayoutCachedTop =4536
                    LayoutCachedWidth =5103
                    LayoutCachedHeight =5112
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =5670
                    Top =4536
                    Width =567
                    Height =576
                    TabIndex =4
                    Name ="btnClose"
                    Caption ="btnOK"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xdddddddddddddddddddddddddddddddddddd00dddd00ddddddddd00dd00ddddd ,
                        0xdddddd0000ddddddddddddd00ddddddddddddd0000ddddddddddd00dd00ddddd ,
                        0xdddd00dddd00dddddddddddddddddddddddddddddddddddddddddddddddddddd ,
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
                    ControlTipText ="schliesse das Fenster (ohne zu Clonen)"

                    LayoutCachedLeft =5670
                    LayoutCachedTop =4536
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =5112
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =95
                    Left =2835
                    Top =2381
                    Width =330
                    Height =330
                    TabIndex =5
                    Name ="btnMinus"
                    Caption ="minus"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xddddddddddddddddddddddddddddddddddddddd7dddddddddddddd777ddddddd ,
                        0xddddd77777dddddddddd7777777dddddddd777777777ddddddd777777777dddd ,
                        0xdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd ,
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
                    ControlTipText ="Datum einen Tag zurück"

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2381
                    LayoutCachedWidth =3165
                    LayoutCachedHeight =2711
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =87
                    Left =3165
                    Top =2381
                    Width =330
                    Height =330
                    TabIndex =6
                    Name ="btnPlus"
                    Caption ="minus"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xddddddddddddddddddddddddddddddddddddddddddddddddddd777777777dddd ,
                        0xddd777777777dddddddd7777777dddddddddd77777dddddddddddd777ddddddd ,
                        0xddddddd7dddddddddddddddddddddddddddddddddddddddddddddddddddddddd ,
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
                    ControlTipText ="Datum einen Tag vor"

                    LayoutCachedLeft =3165
                    LayoutCachedTop =2381
                    LayoutCachedWidth =3495
                    LayoutCachedHeight =2711
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =223
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2835
                    Top =3960
                    Height =285
                    FontSize =10
                    TabIndex =7
                    BorderColor =0
                    ForeColor =0
                    Name ="ProjektNr"
                    FontName ="Arial"
                    ControlTipText ="Ordner die Clones dieser Projekt-Nummer zu"
                    GridlineColor =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =3960
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =4245
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =223
                            Left =570
                            Top =3960
                            Width =2280
                            Height =585
                            Name ="Bezeichnungsfeld16"
                            Caption ="Clone  zuordnen zu  Projekt-Nr."
                            LayoutCachedLeft =570
                            LayoutCachedTop =3960
                            LayoutCachedWidth =2850
                            LayoutCachedHeight =4545
                        End
                    End
                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =87
                    TextAlign =1
                    ColumnCount =4
                    ListRows =30
                    ListWidth =8791
                    Left =4536
                    Top =3968
                    Width =284
                    Height =255
                    FontSize =8
                    TabIndex =8
                    BorderColor =0
                    ForeColor =0
                    Name ="comProjektNr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701;3402;3402"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Projekt-Nr. des Vorganges (zum Auswählen und Ändern)"
                    Format ="@"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =3968
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =4223
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmClone.cls"
