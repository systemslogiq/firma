Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =18
    BorderStyle =1
    PictureAlignment =2
    GridX =20
    GridY =20
    Width =7341
    DatasheetFontHeight =12
    ItemSuffix =171
    Left =630
    Top =2775
    Right =28545
    Bottom =15015
    RecSrcDt = Begin
        0x3e496caa3ac9e140
    End
    Caption ="Lieferzeit/-Termin"
    DatasheetFontName ="Times New Roman"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    Begin
        Begin Label
            BackStyle =0
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
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            Width =4305
            Height =264
            LabelX =-793
            FontSize =10
            BackColor =12632256
            FontName ="Times New Roman"
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
        End
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            SpecialEffect =2
            OldBorderStyle =1
            Width =4536
            Height =2835
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin Section
            CanGrow = NotDefault
            Height =2891
            Name ="det"
            BackThemeColorIndex =1
            BackShade =95.0
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =2
                    ListRows =30
                    Left =845
                    Top =2488
                    Width =851
                    Height =255
                    ColumnOrder =52
                    TabIndex =2
                    Name ="comStd"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="wähle Stunden"
                    Format ="00"

                    LayoutCachedLeft =845
                    LayoutCachedTop =2488
                    LayoutCachedWidth =1696
                    LayoutCachedHeight =2743
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =150
                            Top =2488
                            Width =680
                            Height =255
                            Name ="Bezeichnungsfeld151"
                            Caption ="Stunden"
                            FontName ="Arial"
                            LayoutCachedLeft =150
                            LayoutCachedTop =2488
                            LayoutCachedWidth =830
                            LayoutCachedHeight =2743
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =2
                    OverlapFlags =87
                    TextAlign =2
                    ListRows =30
                    Left =2449
                    Top =2488
                    Width =851
                    Height =255
                    ColumnOrder =51
                    TabIndex =4
                    Name ="comMin"
                    RowSourceType ="Table/Query"
                    ValidationRule =">=0 And <60 Or Is Null"
                    ValidationText =">=0 und <60 oder null"
                    FontName ="Arial"
                    ControlTipText ="wähle Minuten aus"
                    Format ="00"

                    LayoutCachedLeft =2449
                    LayoutCachedTop =2488
                    LayoutCachedWidth =3300
                    LayoutCachedHeight =2743
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =1
                            Left =1769
                            Top =2488
                            Width =680
                            Height =255
                            Name ="Bezeichnungsfeld153"
                            Caption ="Minuten"
                            FontName ="Arial"
                            LayoutCachedLeft =1769
                            LayoutCachedTop =2488
                            LayoutCachedWidth =2449
                            LayoutCachedHeight =2743
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =559
                    Top =475
                    Width =397
                    Height =227
                    Name ="Bezeichnungsfeld118"
                    Caption ="Mo"
                    FontName ="Arial"
                    LayoutCachedLeft =559
                    LayoutCachedTop =475
                    LayoutCachedWidth =956
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =956
                    Top =475
                    Width =397
                    Height =227
                    Name ="Bezeichnungsfeld119"
                    Caption ="Di"
                    FontName ="Arial"
                    LayoutCachedLeft =956
                    LayoutCachedTop =475
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =1353
                    Top =475
                    Width =397
                    Height =227
                    Name ="Bezeichnungsfeld120"
                    Caption ="Mi"
                    FontName ="Arial"
                    LayoutCachedLeft =1353
                    LayoutCachedTop =475
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =1750
                    Top =475
                    Width =397
                    Height =227
                    Name ="Bezeichnungsfeld121"
                    Caption ="Do"
                    FontName ="Arial"
                    LayoutCachedLeft =1750
                    LayoutCachedTop =475
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =2147
                    Top =475
                    Width =397
                    Height =227
                    Name ="Bezeichnungsfeld122"
                    Caption ="Fr"
                    FontName ="Arial"
                    LayoutCachedLeft =2147
                    LayoutCachedTop =475
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =2544
                    Top =475
                    Width =397
                    Height =227
                    ForeColor =1643706
                    Name ="Bezeichnungsfeld123"
                    Caption ="Sa"
                    FontName ="Arial"
                    LayoutCachedLeft =2544
                    LayoutCachedTop =475
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =2941
                    Top =475
                    Width =397
                    Height =227
                    ForeColor =1643706
                    Name ="Bezeichnungsfeld124"
                    Caption ="So"
                    FontName ="Arial"
                    LayoutCachedLeft =2941
                    LayoutCachedTop =475
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =702
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =49
                    FontSize =8
                    TabIndex =5
                    BackColor =15921906
                    Name ="k1"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="25.03.19"
                    ControlTipText ="Montag, 25.März 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =737
                    LayoutCachedWidth =956
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =48
                    FontSize =8
                    TabIndex =6
                    BackColor =15921906
                    Name ="k2"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="26.03.19"
                    ControlTipText ="Dienstag, 26.März 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =737
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =47
                    FontSize =8
                    TabIndex =7
                    BackColor =15921906
                    Name ="k3"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="27.03.19"
                    ControlTipText ="Mittwoch, 27.März 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =737
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =46
                    FontSize =8
                    TabIndex =8
                    BackColor =15921906
                    Name ="k4"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="28.03.19"
                    ControlTipText ="Donnerstag, 28.März 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =737
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =45
                    FontSize =8
                    TabIndex =9
                    BackColor =15921906
                    Name ="k5"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="29.03.19"
                    ControlTipText ="Freitag, 29.März 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =737
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =44
                    FontSize =8
                    TabIndex =10
                    BackColor =15921906
                    Name ="k6"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="30.03.19"
                    ControlTipText ="Samstag, 30.März 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =737
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =43
                    FontSize =8
                    TabIndex =11
                    BackColor =15921906
                    Name ="k7"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="31.03.19"
                    ControlTipText ="Sonntag, 31.März 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =737
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =42
                    FontSize =8
                    TabIndex =12
                    BackColor =15921906
                    Name ="k8"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="01.04.19"
                    ControlTipText ="Montag, 01.April 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =964
                    LayoutCachedWidth =956
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =41
                    FontSize =8
                    TabIndex =13
                    BackColor =15921906
                    Name ="k9"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="02.04.19"
                    ControlTipText ="Dienstag, 02.April 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =964
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =40
                    FontSize =8
                    TabIndex =14
                    BackColor =15921906
                    Name ="k10"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="03.04.19"
                    ControlTipText ="Mittwoch, 03.April 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =964
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =39
                    FontSize =8
                    TabIndex =15
                    BackColor =15921906
                    Name ="k11"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="04.04.19"
                    ControlTipText ="Donnerstag, 04.April 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =964
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =38
                    FontSize =8
                    TabIndex =16
                    BackColor =15921906
                    Name ="k12"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="05.04.19"
                    ControlTipText ="Freitag, 05.April 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =964
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =37
                    FontSize =8
                    TabIndex =17
                    BackColor =15921906
                    Name ="k13"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="06.04.19"
                    ControlTipText ="Samstag, 06.April 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =964
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =36
                    FontSize =8
                    TabIndex =18
                    BackColor =11250603
                    Name ="k14"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="07.04.19"
                    ControlTipText ="Sonntag, 07.April 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =964
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =35
                    FontSize =8
                    TabIndex =19
                    BackColor =15921906
                    Name ="k15"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="08.04.19"
                    ControlTipText ="Montag, 08.April 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =1191
                    LayoutCachedWidth =956
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =34
                    FontSize =8
                    TabIndex =20
                    BackColor =15921906
                    Name ="k16"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="09.04.19"
                    ControlTipText ="Dienstag, 09.April 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =1191
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =33
                    FontSize =8
                    TabIndex =21
                    BackColor =15921906
                    Name ="k17"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="10.04.19"
                    ControlTipText ="Mittwoch, 10.April 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =1191
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =32
                    FontSize =8
                    TabIndex =22
                    BackColor =15921906
                    Name ="k18"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="11.04.19"
                    ControlTipText ="Donnerstag, 11.April 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =1191
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =31
                    FontSize =8
                    TabIndex =23
                    BackColor =15921906
                    Name ="k19"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="12.04.19"
                    ControlTipText ="Freitag, 12.April 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =1191
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =30
                    FontSize =8
                    TabIndex =24
                    BackColor =15921906
                    Name ="k20"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="13.04.19"
                    ControlTipText ="Samstag, 13.April 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =1191
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =29
                    FontSize =8
                    TabIndex =25
                    BackColor =15921906
                    Name ="k21"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="14.04.19"
                    ControlTipText ="Sonntag, 14.April 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =1191
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =28
                    FontSize =8
                    TabIndex =26
                    BackColor =15921906
                    Name ="k22"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="15.04.19"
                    ControlTipText ="Montag, 15.April 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =1418
                    LayoutCachedWidth =956
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =27
                    FontSize =8
                    TabIndex =27
                    BackColor =15921906
                    Name ="k23"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="16.04.19"
                    ControlTipText ="Dienstag, 16.April 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =1418
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =26
                    FontSize =8
                    TabIndex =28
                    BackColor =15921906
                    Name ="k24"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="17.04.19"
                    ControlTipText ="Mittwoch, 17.April 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =1418
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =53
                    FontSize =8
                    TabIndex =29
                    BackColor =15921906
                    Name ="k25"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="18.04.19"
                    ControlTipText ="Donnerstag, 18.April 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =1418
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =24
                    FontSize =8
                    TabIndex =30
                    BackColor =15921906
                    Name ="k26"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="19.04.19"
                    ControlTipText ="Freitag, 19.April 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =1418
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =23
                    FontSize =8
                    TabIndex =31
                    BackColor =15921906
                    Name ="k27"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="20.04.19"
                    ControlTipText ="Samstag, 20.April 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =1418
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =22
                    FontSize =8
                    TabIndex =32
                    BackColor =15921906
                    Name ="k28"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="21.04.19"
                    ControlTipText ="Sonntag, 21.April 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =1418
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =21
                    FontSize =8
                    TabIndex =33
                    BackColor =15921906
                    Name ="k29"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="22.04.19"
                    ControlTipText ="Montag, 22.April 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =1645
                    LayoutCachedWidth =956
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =20
                    FontSize =8
                    TabIndex =34
                    BackColor =15921906
                    Name ="k30"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="23.04.19"
                    ControlTipText ="Dienstag, 23.April 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =1645
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =19
                    FontSize =8
                    TabIndex =35
                    BackColor =15921906
                    Name ="k31"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="24.04.19"
                    ControlTipText ="Mittwoch, 24.April 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =1645
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =18
                    FontSize =8
                    TabIndex =36
                    BackColor =15921906
                    Name ="k32"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="25.04.19"
                    ControlTipText ="Donnerstag, 25.April 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =1645
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =17
                    FontSize =8
                    TabIndex =37
                    BackColor =15921906
                    Name ="k33"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="26.04.19"
                    ControlTipText ="Freitag, 26.April 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =1645
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =16
                    FontSize =8
                    TabIndex =38
                    BackColor =15921906
                    Name ="k34"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="27.04.19"
                    ControlTipText ="Samstag, 27.April 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =1645
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =15
                    FontSize =8
                    TabIndex =39
                    BackColor =15921906
                    Name ="k35"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="28.04.19"
                    ControlTipText ="Sonntag, 28.April 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =1645
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =559
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =14
                    FontSize =8
                    TabIndex =40
                    BackColor =15921906
                    Name ="k36"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="29.04.19"
                    ControlTipText ="Montag, 29.April 2019"

                    LayoutCachedLeft =559
                    LayoutCachedTop =1879
                    LayoutCachedWidth =956
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =956
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =13
                    FontSize =8
                    TabIndex =41
                    BackColor =15921906
                    Name ="k37"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="30.04.19"
                    ControlTipText ="Dienstag, 30.April 2019"

                    LayoutCachedLeft =956
                    LayoutCachedTop =1879
                    LayoutCachedWidth =1353
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1353
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =12
                    FontSize =8
                    TabIndex =42
                    BackColor =15921906
                    Name ="k38"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="01.05.19"
                    ControlTipText ="Mittwoch, 01.Mai 2019"

                    LayoutCachedLeft =1353
                    LayoutCachedTop =1879
                    LayoutCachedWidth =1750
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1750
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =25
                    FontSize =8
                    TabIndex =43
                    BackColor =15921906
                    Name ="k39"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="02.05.19"
                    ControlTipText ="Donnerstag, 02.Mai 2019"

                    LayoutCachedLeft =1750
                    LayoutCachedTop =1879
                    LayoutCachedWidth =2147
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2147
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =10
                    FontSize =8
                    TabIndex =44
                    BackColor =15921906
                    Name ="k40"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="03.05.19"
                    ControlTipText ="Freitag, 03.Mai 2019"

                    LayoutCachedLeft =2147
                    LayoutCachedTop =1879
                    LayoutCachedWidth =2544
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2544
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =9
                    FontSize =8
                    TabIndex =45
                    BackColor =15921906
                    Name ="k41"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="04.05.19"
                    ControlTipText ="Samstag, 04.Mai 2019"

                    LayoutCachedLeft =2544
                    LayoutCachedTop =1879
                    LayoutCachedWidth =2941
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    SpecialEffect =1
                    OldBorderStyle =1
                    BorderWidth =3
                    OverlapFlags =87
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2941
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =8
                    FontSize =8
                    TabIndex =46
                    BackColor =15921906
                    Name ="k42"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    Tag ="05.05.19"
                    ControlTipText ="Sonntag, 05.Mai 2019"

                    LayoutCachedLeft =2941
                    LayoutCachedTop =1879
                    LayoutCachedWidth =3338
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackShade =95.0
                    ForeThemeColorIndex =10
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =150
                    Top =2154
                    Width =3206
                    Height =256
                    FontWeight =700
                    Name ="Heute"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="heutiges Datum, Clicken, um einzutragen"
                    LayoutCachedLeft =150
                    LayoutCachedTop =2154
                    LayoutCachedWidth =3356
                    LayoutCachedHeight =2410
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =737
                    Width =397
                    Height =227
                    ColumnOrder =11
                    FontSize =8
                    FontWeight =700
                    TabIndex =47
                    Name ="w1"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =737
                    LayoutCachedWidth =547
                    LayoutCachedHeight =964
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =964
                    Width =397
                    Height =227
                    ColumnOrder =3
                    FontSize =8
                    FontWeight =700
                    TabIndex =48
                    Name ="w2"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =964
                    LayoutCachedWidth =547
                    LayoutCachedHeight =1191
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =1191
                    Width =397
                    Height =227
                    ColumnOrder =2
                    FontSize =8
                    FontWeight =700
                    TabIndex =49
                    Name ="w3"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =1191
                    LayoutCachedWidth =547
                    LayoutCachedHeight =1418
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =1418
                    Width =397
                    Height =227
                    ColumnOrder =4
                    FontSize =8
                    FontWeight =700
                    TabIndex =50
                    Name ="w4"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =1418
                    LayoutCachedWidth =547
                    LayoutCachedHeight =1645
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =1645
                    Width =397
                    Height =227
                    ColumnOrder =0
                    FontSize =8
                    FontWeight =700
                    TabIndex =51
                    Name ="w5"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =1645
                    LayoutCachedWidth =547
                    LayoutCachedHeight =1872
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Locked = NotDefault
                    FontUnderline = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =150
                    Top =1879
                    Width =397
                    Height =227
                    ColumnOrder =1
                    FontSize =8
                    FontWeight =700
                    TabIndex =52
                    Name ="w6"
                    FontName ="Arial"
                    ControlTipText ="Kalenderwoche"

                    LayoutCachedLeft =150
                    LayoutCachedTop =1879
                    LayoutCachedWidth =547
                    LayoutCachedHeight =2106
                    DisplayAsHyperlink =1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeThemeColorIndex =10
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    IMESentenceMode =3
                    Left =150
                    Top =115
                    Width =3206
                    Height =360
                    ColumnOrder =57
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    BackColor =16777215
                    Name ="MY"
                    Format ="mmmm yyyy"
                    DefaultValue ="date()"
                    FontName ="Arial"

                    LayoutCachedLeft =150
                    LayoutCachedTop =115
                    LayoutCachedWidth =3356
                    LayoutCachedHeight =475
                    BorderThemeColorIndex =0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =87
                    TextAlign =2
                    Left =150
                    Top =480
                    Width =405
                    Height =225
                    Name ="Bezeichnungsfeld163"
                    Caption ="KW"
                    FontName ="Arial"
                    LayoutCachedLeft =150
                    LayoutCachedTop =480
                    LayoutCachedWidth =555
                    LayoutCachedHeight =705
                    BackThemeColorIndex =4
                    BackTint =20.0
                    BorderThemeColorIndex =0
                End
                Begin ListBox
                    OverlapFlags =87
                    Left =3465
                    Top =370
                    Width =1215
                    Height =2373
                    Name ="lstKalenderVorwärts"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Heute\""
                    FontName ="Arial"
                    ControlTipText ="Auswahl verschiedener Zeiten in die Zukunft"

                    LayoutCachedLeft =3465
                    LayoutCachedTop =370
                    LayoutCachedWidth =4680
                    LayoutCachedHeight =2743
                    BackThemeColorIndex =1
                    BackShade =95.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            Left =3450
                            Top =115
                            Width =1245
                            Height =255
                            Name ="Bezeichnungsfeld166"
                            Caption ="vorwärts"
                            FontName ="Arial"
                            LayoutCachedLeft =3450
                            LayoutCachedTop =115
                            LayoutCachedWidth =4695
                            LayoutCachedHeight =370
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =215
                    Left =6037
                    Top =1432
                    Width =1304
                    Height =1311
                    TabIndex =3
                    Name ="comShow"
                    RowSourceType ="Table/Query"
                    DefaultValue ="\"Datum\""
                    FontName ="Arial"
                    ControlTipText ="wähle das Datumsformat für die Anzeige"

                    LayoutCachedLeft =6037
                    LayoutCachedTop =1432
                    LayoutCachedWidth =7341
                    LayoutCachedHeight =2743
                    BackThemeColorIndex =1
                    BackShade =95.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            Left =6037
                            Top =1197
                            Width =1304
                            Height =255
                            Name ="Bezeichnungsfeld168"
                            Caption ="Formatierung"
                            FontName ="Arial"
                            LayoutCachedLeft =6037
                            LayoutCachedTop =1197
                            LayoutCachedWidth =7341
                            LayoutCachedHeight =1452
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =87
                    Left =4751
                    Top =370
                    Width =1215
                    Height =2373
                    TabIndex =53
                    Name ="lstKalenderRückwärts"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Heute\""
                    FontName ="Arial"
                    ControlTipText ="Auswahl verschiedener Zeiten in die Vergangenheit"

                    LayoutCachedLeft =4751
                    LayoutCachedTop =370
                    LayoutCachedWidth =5966
                    LayoutCachedHeight =2743
                    BackThemeColorIndex =1
                    BackShade =95.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            Left =4741
                            Top =115
                            Width =1215
                            Height =255
                            Name ="Bezeichnungsfeld167"
                            Caption ="rückwärts"
                            FontName ="Arial"
                            LayoutCachedLeft =4741
                            LayoutCachedTop =115
                            LayoutCachedWidth =5956
                            LayoutCachedHeight =370
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =2
                    Left =6037
                    Top =115
                    Width =1304
                    Height =1026
                    FontWeight =700
                    TabIndex =54
                    BackColor =10092543
                    Name ="lstactKalender"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Datum\""
                    FontName ="Arial"
                    ControlTipText ="Aktionen mit dem Kalender"

                    LayoutCachedLeft =6037
                    LayoutCachedTop =115
                    LayoutCachedWidth =7341
                    LayoutCachedHeight =1141
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Kalender.cls"
