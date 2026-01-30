Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoResize = NotDefault
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
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =9933
    DatasheetFontHeight =11
    ItemSuffix =6
    Left =14685
    Top =2415
    Right =24615
    Bottom =13695
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0x3a92cb07b2f8e340
    End
    Caption ="Kurz-Übersicht mit Bemerkungen Projekt 3169"
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
        Begin Section
            Height =11057
            BackColor =15527148
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    Locked = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =170
                    Top =1985
                    Width =9639
                    Height =9072
                    FontSize =10
                    BackColor =15527148
                    BorderColor =12835293
                    ForeColor =4138256
                    Name ="rt"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnLostFocus ="[Event Procedure]"
                    GridlineColor =10921638
                    TextFormat =1

                    LayoutCachedLeft =170
                    LayoutCachedTop =1985
                    LayoutCachedWidth =9809
                    LayoutCachedHeight =11057
                    BackThemeColorIndex =-1
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =170
                            Top =113
                            Width =645
                            Height =315
                            BorderColor =16777215
                            ForeColor =13995605
                            Name ="Bezeichnungsfeld3"
                            Caption ="Text2:"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =113
                            LayoutCachedWidth =815
                            LayoutCachedHeight =428
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =170
                    Top =53
                    Width =3810
                    Height =1866
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    BackColor =10092543
                    Name ="lstact"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="39"
                    FontName ="Arial"
                    ControlTipText ="Aktionen mit der Adresse"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =170
                    LayoutCachedTop =53
                    LayoutCachedWidth =3980
                    LayoutCachedHeight =1919
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =4245
                    Top =225
                    Width =3945
                    Height =555
                    BorderColor =16777215
                    ForeColor =13995605
                    Name ="lblMarkierung"
                    Caption ="Wenn Sie unten Text markieren,\015\012erscheint die Editier-Symbolleiste...."
                    FontName ="Arial"
                    GridlineColor =10921638
                    LayoutCachedLeft =4245
                    LayoutCachedTop =225
                    LayoutCachedWidth =8190
                    LayoutCachedHeight =780
                    ThemeFontIndex =-1
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =4251
                    Top =793
                    Width =3945
                    Height =555
                    BorderColor =16777215
                    ForeColor =2366701
                    Name ="lblHinweis"
                    Caption ="Hinweis"
                    FontName ="Arial"
                    GridlineColor =10921638
                    LayoutCachedLeft =4251
                    LayoutCachedTop =793
                    LayoutCachedWidth =8196
                    LayoutCachedHeight =1348
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmRT.cls"
