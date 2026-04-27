Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    TabularFamily =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6349
    DatasheetFontHeight =11
    ItemSuffix =15
    Left =3855
    Top =3030
    Right =22155
    Bottom =16680
    OnUnload ="[Event Procedure]"
    Tag ="Permission"
    RecSrcDt = Begin
        0xc09b964f711de640
    End
    Caption ="Anmeldung SQL-Login"
    DatasheetFontName ="Aptos"
    OnLoad ="[Event Procedure]"
    Moveable =0
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            TextFontFamily =0
            FontSize =11
            FontName ="Aptos"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            TextFontFamily =0
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Aptos"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            TextFontFamily =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Aptos"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =2268
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =3
            Begin
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =85
                    Left =4638
                    Top =1705
                    Width =1134
                    Height =405
                    Name ="btnCancel"
                    Caption ="Abbrechen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =4638
                    LayoutCachedTop =1705
                    LayoutCachedWidth =5772
                    LayoutCachedHeight =2110
                    ThemeFontIndex =-1
                    Overlaps =1
                End
                Begin CommandButton
                    Default = NotDefault
                    OverlapFlags =85
                    Left =2421
                    Top =1705
                    Height =405
                    FontWeight =700
                    TabIndex =3
                    Name ="btnOK"
                    Caption ="OK"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =2421
                    LayoutCachedTop =1705
                    LayoutCachedWidth =4122
                    LayoutCachedHeight =2110
                    ThemeFontIndex =-1
                    Overlaps =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2421
                    Top =345
                    Width =3351
                    Height =300
                    TabIndex =1
                    Name ="txtUser"
                    FontName ="Arial"
                    ControlTipText ="Ihre Personal-Nummer (aber auch Visums-Eintrag möglich)"
                    ConditionalFormat = Begin
                        0x0100000086000000010000000000000002000000000000001200000001000000 ,
                        0xd8d8d800ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x220049006800720020004b00750072007a007a00650069006300680065006e00 ,
                        0x220000000000
                    End

                    LayoutCachedLeft =2421
                    LayoutCachedTop =345
                    LayoutCachedWidth =5772
                    LayoutCachedHeight =645
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x010001000000000000000200000001000000d8d8d800ffffff00110000002200 ,
                        0x49006800720020004b00750072007a007a00650069006300680065006e002200 ,
                        0x000000000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =113
                            Top =345
                            Width =2268
                            Height =315
                            Name ="lbltxtUser"
                            Caption ="SQL-Login"
                            FontName ="Arial"
                            LayoutCachedLeft =113
                            LayoutCachedTop =345
                            LayoutCachedWidth =2381
                            LayoutCachedHeight =660
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2421
                    Top =780
                    Width =3351
                    Height =300
                    TabIndex =2
                    Name ="txtPWd"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    InputMask ="Password"
                    OnGotFocus ="[Event Procedure]"
                    OnLostFocus ="[Event Procedure]"
                    OnChange ="[Event Procedure]"
                    ControlTipText ="Password (mindestens 5 Buchstaben)"
                    ConditionalFormat = Begin
                        0x0100000078000000010000000000000002000000000000000b00000001000000 ,
                        0xd8d8d800ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x2200500061007300730077006f0072007400220000000000
                    End

                    LayoutCachedLeft =2421
                    LayoutCachedTop =780
                    LayoutCachedWidth =5772
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x010001000000000000000200000001000000d8d8d800ffffff000a0000002200 ,
                        0x500061007300730077006f007200740022000000000000000000000000000000 ,
                        0x00000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =113
                            Top =780
                            Width =2268
                            Height =315
                            Name ="lbltxtPwd"
                            Caption ="Passwort"
                            FontName ="Arial"
                            LayoutCachedLeft =113
                            LayoutCachedTop =780
                            LayoutCachedWidth =2381
                            LayoutCachedHeight =1095
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5839
                    Top =780
                    Width =510
                    Height =300
                    TabIndex =4
                    Name ="chkShow"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =5839
                    LayoutCachedTop =780
                    LayoutCachedWidth =6349
                    LayoutCachedHeight =1080
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_SqlLogin.cls"
