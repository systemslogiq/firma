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
    Width =11343
    DatasheetFontHeight =11
    ItemSuffix =25
    Left =-28741
    Top =3600
    Right =-17131
    Bottom =10605
    RecSrcDt = Begin
        0xb32d66751a23e440
    End
    Caption ="Wiedervorlage"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
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
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =0
            ForeTint =75.0
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
            Height =6705
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2835
                    Top =2585
                    Height =315
                    TabIndex =4
                    BorderColor =1643706
                    Name ="d"
                    Format ="dd/mm/yy hh:nn"
                    ValidationRule =">=Date()"
                    ValidationText ="NICHT in der Vergangenheit"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Wiedervorlage-Datum (´muss >= heute sein)\015\012Doppelclick erhöht jeweils um e"
                        "inen Tag"

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2585
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =2900
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =574
                            Top =2580
                            Width =2205
                            Height =315
                            Name ="Bezeichnungsfeld1"
                            Caption ="Wiedervorlage-Datum:"
                            FontName ="Arial"
                            LayoutCachedLeft =574
                            LayoutCachedTop =2580
                            LayoutCachedWidth =2779
                            LayoutCachedHeight =2895
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2835
                    Top =3025
                    Height =315
                    TabIndex =7
                    BorderColor =1643706
                    Name ="p"
                    Format ="Fixed"
                    ValidationRule ="Between 1 And 3"
                    ValidationText ="zwischen 1 und 3"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Priorität zwischen 1 und 3\015\012Doppelclick erhöht jeweils um 1"

                    LayoutCachedLeft =2835
                    LayoutCachedTop =3025
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =3340
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =574
                            Top =3020
                            Width =2205
                            Height =315
                            Name ="Bezeichnungsfeld3"
                            Caption ="Priorität (1,2, oder 3)"
                            FontName ="Arial"
                            LayoutCachedLeft =574
                            LayoutCachedTop =3020
                            LayoutCachedWidth =2779
                            LayoutCachedHeight =3335
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =2
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4536
                    Left =2835
                    Top =2193
                    Height =315
                    TabIndex =3
                    BorderColor =1643706
                    Name ="m"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;2835"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Format ="Fixed"

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2193
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =2508
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =2188
                            Width =2205
                            Height =315
                            Name ="Bezeichnungsfeld5"
                            Caption ="Mitarbeiter"
                            FontName ="Arial"
                            LayoutCachedLeft =570
                            LayoutCachedTop =2188
                            LayoutCachedWidth =2775
                            LayoutCachedHeight =2503
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    DecimalPlaces =0
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =570
                    Top =3870
                    Width =7368
                    Height =2835
                    TabIndex =8
                    Name ="txt"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    TextFormat =1

                    LayoutCachedLeft =570
                    LayoutCachedTop =3870
                    LayoutCachedWidth =7938
                    LayoutCachedHeight =6705
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =574
                            Top =3460
                            Width =2205
                            Height =315
                            Name ="Bezeichnungsfeld7"
                            Caption ="Text (Formatierbar)"
                            FontName ="Arial"
                            LayoutCachedLeft =574
                            LayoutCachedTop =3460
                            LayoutCachedWidth =2779
                            LayoutCachedHeight =3775
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =570
                    Top =118
                    Width =7368
                    Height =1599
                    BackColor =15527148
                    Name ="x"
                    Format ="Fixed"
                    FontName ="Arial"
                    TextFormat =1

                    LayoutCachedLeft =570
                    LayoutCachedTop =118
                    LayoutCachedWidth =7938
                    LayoutCachedHeight =1717
                    BackThemeColorIndex =-1
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9642
                    Top =5555
                    Height =315
                    TabIndex =1
                    BorderColor =1643706
                    ForeColor =9211020
                    Name ="id"
                    FontName ="Arial"
                    ControlTipText ="ID der Zuordnung (NrZuord as Tabelle T_Zuord)"

                    LayoutCachedLeft =9642
                    LayoutCachedTop =5555
                    LayoutCachedWidth =11343
                    LayoutCachedHeight =5870
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =8050
                            Top =5555
                            Width =1418
                            Height =315
                            Name ="Bezeichnungsfeld13"
                            Caption ="ID Zuord"
                            FontName ="Arial"
                            LayoutCachedLeft =8050
                            LayoutCachedTop =5555
                            LayoutCachedWidth =9468
                            LayoutCachedHeight =5870
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9642
                    Top =5964
                    Height =315
                    TabIndex =2
                    BorderColor =1643706
                    ForeColor =9211020
                    Name ="idf"
                    FontName ="Arial"
                    ControlTipText ="ID der Funktion (NrFunktion as Tabelle T_Funktion)"

                    LayoutCachedLeft =9642
                    LayoutCachedTop =5964
                    LayoutCachedWidth =11343
                    LayoutCachedHeight =6279
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =8050
                            Top =5961
                            Width =1418
                            Height =315
                            Name ="Bezeichnungsfeld15"
                            Caption ="ID Funktion"
                            FontName ="Arial"
                            LayoutCachedLeft =8050
                            LayoutCachedTop =5961
                            LayoutCachedWidth =9468
                            LayoutCachedHeight =6276
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    ListWidth =1418
                    Left =6237
                    Top =2586
                    Height =315
                    TabIndex =6
                    BackColor =11271167
                    Name ="comD"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="-1"
                    FontName ="Arial"
                    ControlTipText ="Verschieben..."
                    Format ="Fixed"

                    LayoutCachedLeft =6237
                    LayoutCachedTop =2586
                    LayoutCachedWidth =7938
                    LayoutCachedHeight =2901
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9642
                    Top =6373
                    Height =315
                    TabIndex =9
                    BorderColor =0
                    ForeColor =9211020
                    Name ="idV"
                    FontName ="Arial"
                    ControlTipText ="Id des Vorganges (Tabelle T_VG)"

                    LayoutCachedLeft =9642
                    LayoutCachedTop =6373
                    LayoutCachedWidth =11343
                    LayoutCachedHeight =6688
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =8050
                            Top =6373
                            Width =1418
                            Height =315
                            Name ="Bezeichnungsfeld19"
                            Caption ="ID Vorgang"
                            FontName ="Arial"
                            LayoutCachedLeft =8050
                            LayoutCachedTop =6373
                            LayoutCachedWidth =9468
                            LayoutCachedHeight =6688
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =87
                    TextAlign =2
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ListRows =30
                    ListWidth =1134
                    Left =5099
                    Top =2585
                    Width =1134
                    Height =315
                    TabIndex =5
                    BorderColor =1643706
                    Name ="comUhrzeit"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"10:00\""
                    FontName ="Arial"

                    LayoutCachedLeft =5099
                    LayoutCachedTop =2585
                    LayoutCachedWidth =6233
                    LayoutCachedHeight =2900
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =8050
                    Top =113
                    Width =3291
                    Height =2889
                    TabIndex =10
                    BackColor =11271167
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =8050
                    LayoutCachedTop =113
                    LayoutCachedWidth =11341
                    LayoutCachedHeight =3002
                    BackThemeColorIndex =-1
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmZuord.cls"
