Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =10206
    ItemSuffix =120
    OnUnload ="[Event Procedure]"
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x0cfd3ada9c18e540
    End
    Caption ="Gelangensbestätigung"
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
            ControlSource ="=[Ob1]"
        End
        Begin BreakLevel
            ControlSource ="=[Ob2]"
        End
        Begin PageHeader
            Height =1135
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Image
                    BackStyle =0
                    PictureAlignment =1
                    Width =10197
                    Height =1135
                    BorderColor =0
                    Name ="Logo"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End

                    LayoutCachedWidth =10197
                    LayoutCachedHeight =1135
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =270
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Width =2835
                    Height =270
                    FontWeight =700
                    LeftMargin =57
                    RightMargin =57
                    Name ="txt1"
                    ControlSource ="txt1"
                    FontName ="Arial"

                    LayoutCachedWidth =2835
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =5
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2835
                    Width =861
                    Height =270
                    TabIndex =1
                    LeftMargin =57
                    RightMargin =57
                    Name ="Txt2"
                    ControlSource ="txt2"
                    FontName ="Arial"

                    LayoutCachedLeft =2835
                    LayoutCachedWidth =3696
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =8163
                    Width =615
                    Height =270
                    FontWeight =700
                    TabIndex =2
                    LeftMargin =57
                    RightMargin =57
                    BackColor =62207
                    Name ="ob1"
                    ControlSource ="ob1"
                    FontName ="Arial"

                    LayoutCachedLeft =8163
                    LayoutCachedWidth =8778
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =3741
                    Width =1581
                    Height =270
                    TabIndex =3
                    LeftMargin =57
                    RightMargin =57
                    Name ="txt3"
                    ControlSource ="txt3"
                    FontName ="Arial"

                    LayoutCachedLeft =3741
                    LayoutCachedWidth =5322
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =5612
                    Width =1581
                    Height =270
                    TabIndex =4
                    LeftMargin =57
                    RightMargin =57
                    Name ="txt4"
                    ControlSource ="txt4"
                    FontName ="Arial"

                    LayoutCachedLeft =5612
                    LayoutCachedWidth =7193
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =8957
                    Width =615
                    Height =270
                    FontWeight =700
                    TabIndex =5
                    LeftMargin =57
                    RightMargin =57
                    BackColor =62207
                    Name ="ob2"
                    ControlSource ="ob2"
                    FontName ="Arial"

                    LayoutCachedLeft =8957
                    LayoutCachedWidth =9572
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =7313
                    Width =621
                    Height =270
                    TabIndex =6
                    LeftMargin =57
                    RightMargin =57
                    BackColor =62207
                    Name ="txt8"
                    ControlSource ="txt8"
                    FontName ="Arial"

                    LayoutCachedLeft =7313
                    LayoutCachedWidth =7934
                    LayoutCachedHeight =270
                End
            End
        End
        Begin PageFooter
            Height =336
            Name ="pf"
            Begin
                Begin TextBox
                    TextAlign =1
                    BackStyle =0
                    Width =10160
                    Height =225
                    FontSize =8
                    Name ="txtinfo"
                    Format ="Short Date"
                    ShowDatePicker =1

                    LayoutCachedWidth =10160
                    LayoutCachedHeight =225
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =3571
                    Width =696
                    Height =285
                    TabIndex =1
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="pgs"
                    ControlSource ="=[Pages]"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                    LayoutCachedLeft =3571
                    LayoutCachedWidth =4267
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =2777
                    Width =696
                    Height =285
                    TabIndex =2
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="pg"
                    ControlSource ="=[Page]"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                    LayoutCachedLeft =2777
                    LayoutCachedWidth =3473
                    LayoutCachedHeight =285
                End
            End
        End
    End
End
CodeBehindForm
' See "rptGelangensbestaetigung.cls"
