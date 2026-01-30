Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =24381
    DatasheetFontHeight =11
    ItemSuffix =1
    Right =28170
    Bottom =12240
    Tag ="Statistik"
    RecSrcDt = Begin
        0x413865c1ae53e440
    End
    Caption ="etwas Statistik"
    DatasheetFontName ="Calibri"
    OnActivate ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
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
        Begin Line
            BorderLineStyle =0
            Width =1701
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
        Begin Section
            Height =11781
            Name ="det"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =215
                    TextFontFamily =18
                    ColumnCount =4
                    Left =7655
                    Top =448
                    Width =3969
                    Height =11006
                    FontSize =8
                    BackColor =13434828
                    Name ="lstQKMonat"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;289;1701;567"
                    FontName ="Times New Roman"
                    ControlTipText ="Buchungen pro Monat"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =7655
                    LayoutCachedTop =448
                    LayoutCachedWidth =11624
                    LayoutCachedHeight =11454
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
                            OverlapFlags =85
                            TextAlign =2
                            Left =7655
                            Top =120
                            Width =3969
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld203"
                            Caption ="Summe pro Monat"
                            FontName ="Arial"
                            LayoutCachedLeft =7655
                            LayoutCachedTop =120
                            LayoutCachedWidth =11624
                            LayoutCachedHeight =375
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                            GridlineShade =100.0
                        End
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =18
                    ColumnCount =3
                    Left =11907
                    Top =441
                    Width =3969
                    Height =10481
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BackColor =13434828
                    Name ="lstQKJahr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;1134"
                    FontName ="Times New Roman"
                    ControlTipText ="Rechnungen pro Jahr"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =11907
                    LayoutCachedTop =441
                    LayoutCachedWidth =15876
                    LayoutCachedHeight =10922
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
                            OverlapFlags =85
                            TextAlign =2
                            Left =11907
                            Top =120
                            Width =3969
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld256"
                            Caption ="Summe pro Jahr"
                            FontName ="Arial"
                            LayoutCachedLeft =11907
                            LayoutCachedTop =120
                            LayoutCachedWidth =15876
                            LayoutCachedHeight =375
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                            GridlineShade =100.0
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =215
                    TextFontFamily =18
                    ColumnCount =5
                    Left =3402
                    Top =453
                    Width =3969
                    Height =11006
                    FontSize =8
                    TabIndex =2
                    BackColor =13434828
                    Name ="lstQk"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;851;1134;1134;284"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Times New Roman"
                    ControlTipText ="Einzelne Buchung in Landeswährung (doppelclick zeigt Daten)"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =3402
                    LayoutCachedTop =453
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =11459
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
                            OverlapFlags =85
                            TextAlign =2
                            Left =3402
                            Top =120
                            Width =3969
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld257"
                            Caption ="einzelner Vorgang"
                            FontName ="Arial"
                            LayoutCachedLeft =3402
                            LayoutCachedTop =120
                            LayoutCachedWidth =7371
                            LayoutCachedHeight =375
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                            GridlineShade =100.0
                        End
                    End
                End
                Begin Line
                    BorderWidth =2
                    OverlapFlags =85
                    Left =11907
                    Top =10988
                    Width =3969
                    BorderColor =8421376
                    Name ="Linie164"
                    LayoutCachedLeft =11907
                    LayoutCachedTop =10988
                    LayoutCachedWidth =15876
                    LayoutCachedHeight =10988
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =18
                    Left =11907
                    Top =11048
                    Width =3969
                    Height =377
                    FontSize =14
                    FontWeight =700
                    TabIndex =3
                    BackColor =13434828
                    Name ="lstQKTotal"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    FontName ="Times New Roman"
                    ControlTipText ="Totale Rechnungssumme"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =11907
                    LayoutCachedTop =11048
                    LayoutCachedWidth =15876
                    LayoutCachedHeight =11425
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =87
                    TextFontFamily =18
                    ColumnCount =4
                    Left =16160
                    Top =439
                    Width =3969
                    Height =11006
                    FontSize =8
                    TabIndex =4
                    BackColor =13434828
                    Name ="lstQKFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701;458;567"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Times New Roman"
                    ControlTipText ="Umsatz pro Firma"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =16160
                    LayoutCachedTop =439
                    LayoutCachedWidth =20129
                    LayoutCachedHeight =11445
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
                            OverlapFlags =85
                            TextAlign =2
                            Left =16160
                            Top =120
                            Width =3969
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld206"
                            Caption ="Summe pro Firma"
                            FontName ="Arial"
                            LayoutCachedLeft =16160
                            LayoutCachedTop =120
                            LayoutCachedWidth =20129
                            LayoutCachedHeight =375
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                            GridlineShade =100.0
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =87
                    TextFontFamily =18
                    ColumnCount =3
                    Left =20412
                    Top =439
                    Width =3969
                    Height =11006
                    FontSize =8
                    TabIndex =5
                    BackColor =13434828
                    Name ="lstQKProjekt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2556;567"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Times New Roman"
                    ControlTipText ="Umsatz pro Projekt"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =20412
                    LayoutCachedTop =439
                    LayoutCachedWidth =24381
                    LayoutCachedHeight =11445
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
                            OverlapFlags =85
                            TextAlign =2
                            Left =20412
                            Top =120
                            Width =3969
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld207"
                            Caption ="Summe pro Projekt"
                            FontName ="Arial"
                            LayoutCachedLeft =20412
                            LayoutCachedTop =120
                            LayoutCachedWidth =24381
                            LayoutCachedHeight =375
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                            GridlineShade =100.0
                        End
                    End
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7655
                    Top =11481
                    Width =3969
                    Height =300
                    FontSize =8
                    FontWeight =700
                    TabIndex =6
                    BackColor =10092543
                    Name ="AverageMonth"
                    FontName ="Arial"
                    ControlTipText ="Durchschnitt pro Monat"
                    AsianLineBreak =0

                    LayoutCachedLeft =7655
                    LayoutCachedTop =11481
                    LayoutCachedWidth =11624
                    LayoutCachedHeight =11781
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =3402
                    Top =11481
                    Width =3969
                    Height =300
                    FontSize =8
                    FontWeight =700
                    TabIndex =7
                    BackColor =10092543
                    Name ="AverageQK"
                    FontName ="Arial"
                    ControlTipText ="Durchschnitt pro Vorgang"
                    AsianLineBreak =0

                    LayoutCachedLeft =3402
                    LayoutCachedTop =11481
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =11781
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =11907
                    Top =11481
                    Width =3969
                    Height =300
                    FontSize =8
                    FontWeight =700
                    TabIndex =8
                    BackColor =10092543
                    Name ="AverageYear"
                    FontName ="Arial"
                    ControlTipText ="Durchschnitt pro Jahr"
                    AsianLineBreak =0

                    LayoutCachedLeft =11907
                    LayoutCachedTop =11481
                    LayoutCachedWidth =15876
                    LayoutCachedHeight =11781
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =16160
                    Top =11481
                    Width =3969
                    Height =300
                    FontSize =8
                    FontWeight =700
                    TabIndex =9
                    BackColor =10092543
                    Name ="CountFirma"
                    FontName ="Arial"
                    ControlTipText ="Firmen"
                    AsianLineBreak =0

                    LayoutCachedLeft =16160
                    LayoutCachedTop =11481
                    LayoutCachedWidth =20129
                    LayoutCachedHeight =11781
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =20412
                    Top =11481
                    Width =3969
                    Height =300
                    FontSize =8
                    FontWeight =700
                    TabIndex =10
                    BackColor =10092543
                    Name ="CountVG"
                    FontName ="Arial"
                    ControlTipText ="Anzahl Projekte"
                    AsianLineBreak =0

                    LayoutCachedLeft =20412
                    LayoutCachedTop =11481
                    LayoutCachedWidth =24381
                    LayoutCachedHeight =11781
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =851
                    Left =1986
                    Top =2644
                    Width =1134
                    Height =285
                    FontSize =8
                    FontWeight =700
                    TabIndex =11
                    BackColor =10092543
                    Name ="JB"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =1986
                    LayoutCachedTop =2644
                    LayoutCachedWidth =3120
                    LayoutCachedHeight =2929
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ListBox
                    SpecialEffect =4
                    OverlapFlags =85
                    BorderWidth =3
                    Left =285
                    Top =2010
                    Width =2835
                    Height =562
                    FontSize =8
                    FontWeight =700
                    TabIndex =12
                    BackColor =10092543
                    Name ="comArt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Jahr\""
                    FontName ="Arial"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =285
                    LayoutCachedTop =2010
                    LayoutCachedWidth =3120
                    LayoutCachedHeight =2572
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ListBox
                    SpecialEffect =4
                    OverlapFlags =85
                    BorderWidth =3
                    ColumnCount =3
                    Left =285
                    Top =2984
                    Width =2835
                    Height =8512
                    FontSize =8
                    FontWeight =700
                    TabIndex =13
                    BackColor =10092543
                    Name ="lstQKChart"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;858;0"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="51"
                    FontName ="Arial"
                    Tag ="51 Rechnung"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =285
                    LayoutCachedTop =2984
                    LayoutCachedWidth =3120
                    LayoutCachedHeight =11496
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =851
                    Left =285
                    Top =2644
                    Width =1134
                    Height =285
                    FontSize =8
                    FontWeight =700
                    TabIndex =14
                    BackColor =10092543
                    Name ="JV"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="=Year(Date())-1"
                    FontName ="Arial"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =285
                    LayoutCachedTop =2644
                    LayoutCachedWidth =1419
                    LayoutCachedHeight =2929
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
                    SpecialEffect =4
                    BackStyle =1
                    BorderWidth =3
                    OverlapFlags =85
                    TextAlign =2
                    Left =285
                    Top =120
                    Width =2835
                    Height =285
                    FontSize =8
                    FontWeight =700
                    BackColor =10092543
                    Name ="DBWährung"
                    Caption ="Alles in EUR"
                    FontName ="Arial"
                    LayoutCachedLeft =285
                    LayoutCachedTop =120
                    LayoutCachedWidth =3120
                    LayoutCachedHeight =405
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ListBox
                    SpecialEffect =4
                    OverlapFlags =85
                    BorderWidth =3
                    ColumnCount =2
                    Left =285
                    Top =510
                    Width =2835
                    Height =1357
                    FontSize =8
                    FontWeight =700
                    TabIndex =15
                    BackColor =10092543
                    Name ="lstMandant"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =285
                    LayoutCachedTop =510
                    LayoutCachedWidth =3120
                    LayoutCachedHeight =1867
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
' See "frmStatistik.cls"
