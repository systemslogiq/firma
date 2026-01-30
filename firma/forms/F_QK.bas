Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ViewsAllowed =1
    TabularFamily =18
    GridY =10
    Width =17162
    DatasheetFontHeight =10
    ItemSuffix =275
    Right =21165
    Bottom =12600
    Tag ="QK"
    RecSrcDt = Begin
        0x0655df90f9aae540
    End
    Caption ="Vorgangsarten"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnDblClick ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
    OrderByOnLoad =0
    ShowPageMargins =0
    Begin
        Begin Label
            TextAlign =3
            TextFontFamily =18
            FontSize =12
            FontName ="Times New Roman"
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
            TextFontFamily =2
            Width =1701
            Height =283
            BorderLineStyle =0
        End
        Begin OptionButton
            AddColon = NotDefault
            SpecialEffect =2
            LabelAlign =3
            BorderLineStyle =0
            Width =187
            Height =187
            LabelX =-230
        End
        Begin CheckBox
            AddColon = NotDefault
            SpecialEffect =2
            LabelAlign =3
            BorderLineStyle =0
            Width =187
            Height =187
            LabelX =-230
        End
        Begin TextBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =300
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin ListBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin ComboBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =300
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin Subform
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin Tab
            Width =5103
            Height =3402
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
        End
        Begin FormHeader
            CanGrow = NotDefault
            Height =0
            BackColor =-2147483633
            Name ="fh"
        End
        Begin Section
            CanGrow = NotDefault
            Height =12105
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    AutoTab = NotDefault
                    SpecialEffect =2
                    BorderWidth =3
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =6417
                    Top =120
                    Width =764
                    Height =360
                    FontWeight =700
                    ForeColor =255
                    Name ="IDQK"
                    ControlSource ="IDQK"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="ID"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =120
                    LayoutCachedWidth =7181
                    LayoutCachedHeight =480
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4755
                            Top =120
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld210"
                            Caption ="ID"
                            FontName ="Arial"
                            LayoutCachedLeft =4755
                            LayoutCachedTop =120
                            LayoutCachedWidth =6345
                            LayoutCachedHeight =375
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =8966
                    Top =233
                    Width =5001
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    Name ="QK"
                    ControlSource ="QK"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Bezeichnung des Begriffs"

                    LayoutCachedLeft =8966
                    LayoutCachedTop =233
                    LayoutCachedWidth =13967
                    LayoutCachedHeight =488
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =7306
                            Top =233
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld204"
                            Caption ="Bezeichnung"
                            FontName ="Arial"
                            LayoutCachedLeft =7306
                            LayoutCachedTop =233
                            LayoutCachedWidth =8896
                            LayoutCachedHeight =488
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    AccessKey =72
                    TextFontFamily =34
                    Left =14322
                    Top =120
                    Width =1734
                    Height =340
                    FontSize =8
                    TabIndex =2
                    ForeColor =16711680
                    Name ="btnHinweis"
                    Caption ="&Hinweise"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =14322
                    LayoutCachedTop =120
                    LayoutCachedWidth =16056
                    LayoutCachedHeight =460
                End
                Begin TextBox
                    AutoTab = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =6417
                    Top =511
                    Width =9639
                    Height =750
                    FontSize =8
                    TabIndex =3
                    Name ="Bem_QK"
                    ControlSource ="Bem_QK"
                    FontName ="Arial"
                    Tag ="Del2"
                    ControlTipText ="Bemerkungen zum Begriff"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =511
                    LayoutCachedWidth =16056
                    LayoutCachedHeight =1261
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4759
                            Top =508
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld209"
                            Caption ="Bemerkung"
                            FontName ="Arial"
                            LayoutCachedLeft =4759
                            LayoutCachedTop =508
                            LayoutCachedWidth =6349
                            LayoutCachedHeight =763
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2835
                    Left =6417
                    Top =2732
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =4
                    Name ="ArtikelLager"
                    ControlSource ="ArtikelLager"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;1701"
                    StatusBarText ="0: keine Buchung, 1: Abbuchung; 2:Einbuchung"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =2732
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =2987
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =2729
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld228"
                            Caption ="ArtikelLager:"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =2729
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =2984
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =1312
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =5
                    Name ="Sng1"
                    ControlSource ="Sng1"
                    RowSourceType ="Table/Query"
                    StatusBarText ="z.B. bezahlter Betrag, Angebotsbetrag in Landeswährung"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =1312
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =1567
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =1319
                            Width =1590
                            Height =240
                            FontSize =8
                            Name ="Bezeichnungsfeld244"
                            Caption ="Feld 1 mit Zahl"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =1319
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =1559
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =1596
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =6
                    Name ="Dat1"
                    ControlSource ="Dat1"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =1596
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =1851
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =1589
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld246"
                            Caption ="Datum 1"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =1589
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =1844
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =1880
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =7
                    Name ="Dat2"
                    ControlSource ="Dat2"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =1880
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =2135
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =1874
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld248"
                            Caption ="Datum 2"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =1874
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =2129
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =2164
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =8
                    Name ="DetTxt1"
                    ControlSource ="DetTxt1"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =2164
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =2419
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =2159
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld250"
                            Caption ="Text 1 in Details"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =2159
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =2414
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =2448
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =9
                    Name ="DefReport"
                    ControlSource ="DefReport"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =2448
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =2703
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =2444
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld252"
                            Caption ="Def. Report"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =2444
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =2699
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =3016
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =10
                    Name ="Freigabe"
                    ControlSource ="Freigabe"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    ControlTipText ="Betrag in DB-Währung, ab dem eine Freigabe erfolgen muss, wenn 0=> keine Freigab"
                        "e erforderlich"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =3016
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =3271
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =3014
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld254"
                            Caption ="Freigabe"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =3014
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =3269
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =6417
                    Top =3300
                    Width =4116
                    Height =255
                    FontSize =8
                    TabIndex =11
                    Name ="FreigabeWer"
                    ControlSource ="FreigabeWer"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    ControlTipText ="Userkennung desjenigen, der freigeben darf (auch mehrere durch Leerzeichen getre"
                        "nnt)"

                    LayoutCachedLeft =6417
                    LayoutCachedTop =3300
                    LayoutCachedWidth =10533
                    LayoutCachedHeight =3555
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =4757
                            Top =3299
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld256"
                            Caption ="Wer gibt frei"
                            FontName ="Arial"
                            LayoutCachedLeft =4757
                            LayoutCachedTop =3299
                            LayoutCachedWidth =6347
                            LayoutCachedHeight =3554
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    Left =13200
                    Top =2737
                    Width =2835
                    Height =255
                    FontSize =8
                    TabIndex =12
                    BackColor =8240895
                    Name ="QKFarbe"
                    ControlSource ="QKFarbe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =2737
                    LayoutCachedWidth =16035
                    LayoutCachedHeight =2992
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =11525
                            Top =2737
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld211"
                            Caption ="Farbe:"
                            FontName ="Arial"
                            LayoutCachedLeft =11525
                            LayoutCachedTop =2737
                            LayoutCachedWidth =13115
                            LayoutCachedHeight =2992
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =13200
                    Top =2453
                    TabIndex =13
                    Name ="QKAbschluss"
                    ControlSource ="QKAbschluss"
                    StatusBarText ="wenn JA wird bei allen Vorgängen des gleichen Projektes der Abschluss auch geset"
                        "zt."
                    ControlTipText ="wenn JA wird bei allen Vorgängen des gleichen Projektes der Abschluss auch geset"
                        "zt."

                    LayoutCachedLeft =13200
                    LayoutCachedTop =2453
                    LayoutCachedWidth =13387
                    LayoutCachedHeight =2640
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =11525
                            Top =2453
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld230"
                            Caption ="QKAbschluss:"
                            FontName ="Arial"
                            LayoutCachedLeft =11525
                            LayoutCachedTop =2453
                            LayoutCachedWidth =13115
                            LayoutCachedHeight =2708
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =13200
                    Top =1342
                    TabIndex =14
                    Name ="EKoVK"
                    ControlSource ="EKoVK"
                    StatusBarText ="Einkauspreis oder Verkaufspreis verwenden?"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =1342
                    LayoutCachedWidth =13387
                    LayoutCachedHeight =1529
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =11522
                            Top =1345
                            Width =1590
                            Height =465
                            FontSize =8
                            Name ="Bezeichnungsfeld223"
                            Caption ="Einkaufspreis oder \015\012Verkaufspreis:"
                            FontName ="Arial"
                            LayoutCachedLeft =11522
                            LayoutCachedTop =1345
                            LayoutCachedWidth =13112
                            LayoutCachedHeight =1810
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =13200
                    Top =2169
                    TabIndex =15
                    Name ="SollHaben"
                    ControlSource ="SollHaben"
                    StatusBarText ="Konto-Nr./Haben oder Soll erforderlich?"
                    ControlTipText ="Konto-Nr./Haben oder Soll erforderlich?"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =2169
                    LayoutCachedWidth =13387
                    LayoutCachedHeight =2356
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =11522
                            Top =2169
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld229"
                            Caption ="Soll oder Haben:"
                            FontName ="Arial"
                            LayoutCachedLeft =11522
                            LayoutCachedTop =2169
                            LayoutCachedWidth =13112
                            LayoutCachedHeight =2424
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =13200
                    Top =1885
                    Width =217
                    Height =232
                    TabIndex =16
                    Name ="QKWas"
                    ControlSource ="QKWas"
                    StatusBarText ="Ankreuzen, WAS angezeigt werden soll"
                    DefaultValue ="1"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =1885
                    LayoutCachedWidth =13417
                    LayoutCachedHeight =2117
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =11522
                            Top =1885
                            Width =1590
                            Height =255
                            FontSize =8
                            FontWeight =700
                            ForeColor =16711680
                            Name ="Bezeichnungsfeld225"
                            Caption ="QK wird benutzt"
                            FontName ="Arial"
                            LayoutCachedLeft =11522
                            LayoutCachedTop =1885
                            LayoutCachedWidth =13112
                            LayoutCachedHeight =2140
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =13563
                    Top =1597
                    Width =2466
                    Height =255
                    FontSize =8
                    TabIndex =17
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =13563
                    LayoutCachedTop =1597
                    LayoutCachedWidth =16029
                    LayoutCachedHeight =1852
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =13563
                    Top =1342
                    Width =2466
                    Height =255
                    FontSize =8
                    TabIndex =18
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="whoUpdate"
                    ControlSource ="whoUpdate"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung durch..."

                    LayoutCachedLeft =13563
                    LayoutCachedTop =1342
                    LayoutCachedWidth =16029
                    LayoutCachedHeight =1597
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =13563
                    Top =1852
                    Width =2466
                    Height =255
                    FontSize =8
                    TabIndex =19
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="QKErfasst"
                    ControlSource ="QKErfasst"
                    Format ="General Date"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Datensatz erfasst am..."

                    LayoutCachedLeft =13563
                    LayoutCachedTop =1852
                    LayoutCachedWidth =16029
                    LayoutCachedHeight =2107
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2835
                    Left =13200
                    Top =3021
                    Width =2835
                    Height =255
                    FontSize =8
                    TabIndex =20
                    Name ="nextQK"
                    ControlSource ="nextQK"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    FontName ="Arial"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =3021
                    LayoutCachedWidth =16035
                    LayoutCachedHeight =3276
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =11525
                            Top =3021
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld264"
                            Caption ="nächster Vorgang"
                            FontName ="Arial"
                            LayoutCachedLeft =11525
                            LayoutCachedTop =3021
                            LayoutCachedWidth =13115
                            LayoutCachedHeight =3276
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =13563
                    Top =2227
                    Width =2466
                    Height =255
                    FontSize =8
                    TabIndex =21
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="MarkerQK"
                    ControlSource ="MarkerQK"
                    Format ="General Date"
                    FontName ="Arial"
                    ControlTipText ="Datensatz erfasst am..."

                    LayoutCachedLeft =13563
                    LayoutCachedTop =2227
                    LayoutCachedWidth =16029
                    LayoutCachedHeight =2482
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =34
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =56
                    Top =1481
                    Width =4536
                    Height =10483
                    FontSize =8
                    TabIndex =22
                    BackColor =14803425
                    ForeColor =-2147483640
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;2268;853;286"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (1) Daten für QK\015\012Verwenden Sie die Pfeiltasten, um "
                        "zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =56
                    LayoutCachedTop =1481
                    LayoutCachedWidth =4592
                    LayoutCachedHeight =11964
                End
                Begin Tab
                    OverlapFlags =85
                    Left =4815
                    Top =3630
                    Width =12345
                    Height =8475
                    TabIndex =23
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =4815
                    LayoutCachedTop =3630
                    LayoutCachedWidth =17160
                    LayoutCachedHeight =12105
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =4950
                            Top =4035
                            Width =12075
                            Height =7929
                            Name ="pg0"
                            Caption ="Texte 1 bis x zu : 12 Neue Vorgangsart"
                            LayoutCachedLeft =4950
                            LayoutCachedTop =4035
                            LayoutCachedWidth =17025
                            LayoutCachedHeight =11964
                            Begin
                                Begin Subform
                                    OverlapFlags =215
                                    SpecialEffect =0
                                    Left =7364
                                    Top =4087
                                    Width =9246
                                    Height =7877
                                    Name ="UF_txtQK"
                                    SourceObject ="Form.UF_txtQK"
                                    StatusBarText ="freie Texte"

                                    LayoutCachedLeft =7364
                                    LayoutCachedTop =4087
                                    LayoutCachedWidth =16610
                                    LayoutCachedHeight =11964
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4983
                                    Top =4089
                                    Width =1985
                                    Height =7875
                                    FontSize =8
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstTxtAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Texte"

                                    LayoutCachedLeft =4983
                                    LayoutCachedTop =4089
                                    LayoutCachedWidth =6968
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4950
                            Top =4035
                            Width =12075
                            Height =7929
                            Name ="pgStichwort"
                            Caption ="Stichworte"
                            LayoutCachedLeft =4950
                            LayoutCachedTop =4035
                            LayoutCachedWidth =17025
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =7364
                                    Top =4109
                                    Width =9072
                                    Height =7855
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;294;1701;2268;1134;1134;292"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =7364
                                    LayoutCachedTop =4109
                                    LayoutCachedWidth =16436
                                    LayoutCachedHeight =11964
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4983
                                    Top =4089
                                    Width =1985
                                    Height =7875
                                    FontSize =8
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =4983
                                    LayoutCachedTop =4089
                                    LayoutCachedWidth =6968
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4950
                            Top =4035
                            Width =12075
                            Height =7929
                            Name ="pg2"
                            Caption ="Vorgänge"
                            LayoutCachedLeft =4950
                            LayoutCachedTop =4035
                            LayoutCachedWidth =17025
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =5021
                                    Top =4044
                                    Width =10671
                                    Height =7920
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;680;907;854;907"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =5021
                                    LayoutCachedTop =4044
                                    LayoutCachedWidth =15692
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4950
                            Top =4035
                            Width =12075
                            Height =7929
                            Name ="pg3"
                            Caption ="Kontakte"
                            LayoutCachedLeft =4950
                            LayoutCachedTop =4035
                            LayoutCachedWidth =17025
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =5021
                                    Top =4044
                                    Width =10791
                                    Height =7920
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstKontakt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =5021
                                    LayoutCachedTop =4044
                                    LayoutCachedWidth =15812
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4950
                            Top =4035
                            Width =12075
                            Height =7929
                            Name ="pageMarker"
                            Caption ="Vorgangsarten managen"
                            LayoutCachedLeft =4950
                            LayoutCachedTop =4035
                            LayoutCachedWidth =17025
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    Left =7364
                                    Top =4121
                                    Width =9660
                                    Height =7843
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1419;2835;1134"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =7364
                                    LayoutCachedTop =4121
                                    LayoutCachedWidth =17024
                                    LayoutCachedHeight =11964
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    OverlapFlags =215
                                    TextAlign =2
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    Left =4982
                                    Top =4088
                                    Width =1985
                                    Height =227
                                    FontSize =8
                                    FontWeight =600
                                    TabIndex =1
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    FontName ="Tahoma"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"
                                    AsianLineBreak =255

                                    LayoutCachedLeft =4982
                                    LayoutCachedTop =4088
                                    LayoutCachedWidth =6967
                                    LayoutCachedHeight =4315
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4983
                                    Top =4368
                                    Width =1985
                                    Height =7596
                                    FontSize =8
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =4983
                                    LayoutCachedTop =4368
                                    LayoutCachedWidth =6968
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    AutoTab = NotDefault
                    SpecialEffect =2
                    BorderWidth =3
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =5152
                    Top =800
                    Width =464
                    Height =270
                    FontSize =8
                    TabIndex =24
                    BackColor =10092543
                    Name ="f0"
                    ControlSource ="IDQK"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="ID"

                    LayoutCachedLeft =5152
                    LayoutCachedTop =800
                    LayoutCachedWidth =5616
                    LayoutCachedHeight =1070
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =34
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =56
                    Top =60
                    Width =4536
                    Height =1010
                    FontSize =8
                    TabIndex =25
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="2"
                    FontName ="Tahoma"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =56
                    LayoutCachedTop =60
                    LayoutCachedWidth =4592
                    LayoutCachedHeight =1070
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1753
                    Top =1185
                    Width =2535
                    Height =240
                    FontSize =8
                    FontWeight =600
                    TabIndex =26
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern\015\012*:"
                        "Wildcard-Suche\015\012Doppelclick= zeige alle"
                    AsianLineBreak =255

                    LayoutCachedLeft =1753
                    LayoutCachedTop =1185
                    LayoutCachedWidth =4288
                    LayoutCachedHeight =1425
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =390
                    Top =1185
                    Width =761
                    Height =227
                    FontSize =8
                    FontWeight =600
                    TabIndex =27
                    BackColor =12975858
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =390
                    LayoutCachedTop =1185
                    LayoutCachedWidth =1151
                    LayoutCachedHeight =1412
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    ListRows =20
                    ListWidth =1701
                    Left =4346
                    Top =1175
                    Width =246
                    Height =255
                    FontSize =8
                    TabIndex =28
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="12;ID:13;13;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Anrede auswählen"

                    LayoutCachedLeft =4346
                    LayoutCachedTop =1175
                    LayoutCachedWidth =4592
                    LayoutCachedHeight =1430
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    ListWidth =2835
                    Left =13200
                    Top =3305
                    Width =2835
                    Height =255
                    FontSize =8
                    TabIndex =29
                    Name ="RechteQK"
                    ControlSource ="RechteQK"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    FontName ="Arial"
                    ControlTipText ="Rollen eintragen, wenn Rechte nur auf diese Rolle gegeben werden sollen (mit Sem"
                        "ikolon getrennt)"

                    LayoutCachedLeft =13200
                    LayoutCachedTop =3305
                    LayoutCachedWidth =16035
                    LayoutCachedHeight =3560
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =11525
                            Top =3305
                            Width =1590
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld272"
                            Caption ="RECHTE"
                            FontName ="Arial"
                            LayoutCachedLeft =11525
                            LayoutCachedTop =3305
                            LayoutCachedWidth =13115
                            LayoutCachedHeight =3560
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =1340
                    Top =1133
                    Width =340
                    Height =340
                    FontSize =8
                    FontWeight =400
                    TabIndex =30
                    Name ="btntxtFind"
                    Caption ="suchen"
                    FontName ="Arial"
                    ControlTipText ="Warengruppen mit den oben eingestellten Bedingungen unten anzeigen.\015\012Die w"
                        "ichtigsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen We"
                        "rt."
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x505050f0404040ff202820ff000800ff00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x606060ff706870ff404040ff000800ff00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x605860ff909090ff606060ff302830ff00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x505850ffb0a8b0ff808080ff404840ff00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000002018200020182020 ,
                        0x605850ffc0c0c0ffa0a0a0ff404040ff20182030201820000000000000000000 ,
                        0x00000000000000000000000000000000000000002018200020182020505850ff ,
                        0xa0a0a0ffd0d0d0ffb0b0b0ff707070ff201820ff201820302018200000000000 ,
                        0x000000000000000000000000000000002018200020182020706870ffc0b8c0ff ,
                        0xe0e8e0ffe0e0e0ffc0c0c0ff909890ff605860ff201820ff2018203020182000 ,
                        0x0000000000000000000000002018200020182020707070ffc0c0c0fff0e8f0ff ,
                        0xfff8fffff0f0f0ffd0d8d0ffc0c0c0ffa098a0ff605860ff101810ff20182030 ,
                        0x20182000000000000000000020182020808080ffd0d0d0fff0f0f0ffffffffff ,
                        0xfffffffffff8ffffe0e8e0ffd0d8d0ffc0b8c0ff909090ff505050ff201820ff ,
                        0x201820300000000000000000808080ffd0d0d0fff0f0f0fffff8fffffff8ffff ,
                        0xf0f8f0fff0f0f0ffe0e8e0ffd0d0d0ffc0c0c0ffa098a0ff606860ff505850ff ,
                        0x101810ff0000000000000000b0b8b0ffc0c8c0ffd0d0d0ffd0d0d0ffc0c0c0ff ,
                        0xc0b8c0ffb0b0b0ffa0a8a0ffa0a0a0ffa098a0ff909090ff707870ff606060ff ,
                        0x504850ff00000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =1340
                    LayoutCachedTop =1133
                    LayoutCachedWidth =1680
                    LayoutCachedHeight =1473
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    TextFontFamily =34
                    Left =56
                    Top =1133
                    Width =340
                    Height =340
                    TabIndex =31
                    Name ="btnPF_Tab"
                    Caption ="btnPF_Tab"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadadadadadadadaadadadadadadadad00000000000000da ,
                        0x080ffffffffff0ad080f00f00f00f0da080ffffffffff0ad080f00f00f00f0da ,
                        0x080ffffffffff0ad080f00f00f00f0da080ffffffffff0ad080f00f00f00f0da ,
                        0x080ffffffffff0ad00000000000000da08088888888880ad00000000000000da ,
                        0xadadadadadadadad
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="öffne gefilterte Daten in Tabellenform"

                    LayoutCachedLeft =56
                    LayoutCachedTop =1133
                    LayoutCachedWidth =396
                    LayoutCachedHeight =1473
                    Overlaps =1
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =12632256
            Name ="ff"
        End
    End
End
CodeBehindForm
' See "F_QK.cls"
