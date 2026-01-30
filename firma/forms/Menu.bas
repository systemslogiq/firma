Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ViewsAllowed =1
    GridY =10
    Width =23974
    DatasheetFontWeight =700
    ItemSuffix =296
    Right =28170
    Bottom =11730
    OnUnload ="[Event Procedure]"
    Tag ="Menu"
    RecSrcDt = Begin
        0x85eecdd15240e340
    End
    Caption ="MENU"
    OnOpen ="[Event Procedure]"
    OnActivate ="[Event Procedure]"
    OnDeactivate ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    FitToScreen =255
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
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin CommandButton
            TextFontFamily =18
            Width =1134
            Height =567
            FontSize =16
            FontWeight =400
            FontName ="Times New Roman"
            BorderLineStyle =0
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin TextBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin ListBox
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
        Begin ToggleButton
            Width =283
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="Tahoma"
            BorderLineStyle =0
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
        Begin WebBrowser
            OldBorderStyle =1
            Width =4536
            Height =2835
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            CanGrow = NotDefault
            Height =11680
            BackColor =12632256
            Name ="Det"
            OnClick ="[Event Procedure]"
            Begin
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =11278
                    Top =401
                    Width =3969
                    Height =801
                    FontSize =24
                    FontWeight =700
                    ForeColor =9868950
                    Name ="btnGruss"
                    Caption ="Ohnemus"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Begrüssung"

                    LayoutCachedLeft =11278
                    LayoutCachedTop =401
                    LayoutCachedWidth =15247
                    LayoutCachedHeight =1202
                    Overlaps =1
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    MultiSelect =2
                    BorderWidth =5
                    ColumnCount =6
                    Left =11271
                    Top =4429
                    Width =3969
                    Height =3402
                    TabIndex =1
                    BackColor =12632256
                    BorderColor =8388736
                    Name ="lstGebTag"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1247;858;1134;0"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Geburtstagsliste\015\012markieren (auch mehrere mit CTRL und oder SHIFT-Taste) u"
                        "nd clicken zum Öffnen des Adress-Formulares"

                    LayoutCachedLeft =11271
                    LayoutCachedTop =4429
                    LayoutCachedWidth =15240
                    LayoutCachedHeight =7831
                End
                Begin OptionGroup
                    OverlapFlags =85
                    Left =56
                    Top =56
                    Width =14893
                    Height =313
                    TabIndex =2
                    Name ="ogAdr1"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =56
                    LayoutCachedTop =56
                    LayoutCachedWidth =14949
                    LayoutCachedHeight =369
                    Begin
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =102
                            Top =56
                            Width =510
                            OptionValue =65
                            Name ="tbA"
                            Caption ="A"
                            FontName ="Arial"
                            ControlTipText ="Suche Adresse nach Anfangsbuchstaben"

                            LayoutCachedLeft =102
                            LayoutCachedTop =56
                            LayoutCachedWidth =612
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =628
                            Top =56
                            Width =510
                            OptionValue =66
                            Name ="tbtnB"
                            Caption ="B"
                            FontName ="Arial"

                            LayoutCachedLeft =628
                            LayoutCachedTop =56
                            LayoutCachedWidth =1138
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =1154
                            Top =56
                            Width =510
                            OptionValue =67
                            Name ="tbtnC"
                            Caption ="C"
                            FontName ="Arial"

                            LayoutCachedLeft =1154
                            LayoutCachedTop =56
                            LayoutCachedWidth =1664
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =1680
                            Top =56
                            Width =510
                            OptionValue =68
                            Name ="tbtnD"
                            Caption ="D"
                            FontName ="Arial"

                            LayoutCachedLeft =1680
                            LayoutCachedTop =56
                            LayoutCachedWidth =2190
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =2206
                            Top =56
                            Width =510
                            OptionValue =69
                            Name ="tbtnE"
                            Caption ="E"
                            FontName ="Arial"

                            LayoutCachedLeft =2206
                            LayoutCachedTop =56
                            LayoutCachedWidth =2716
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =2732
                            Top =56
                            Width =510
                            OptionValue =70
                            Name ="tbtnF"
                            Caption ="F"
                            FontName ="Arial"

                            LayoutCachedLeft =2732
                            LayoutCachedTop =56
                            LayoutCachedWidth =3242
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =3258
                            Top =56
                            Width =510
                            OptionValue =71
                            Name ="tbtnG"
                            Caption ="G"
                            FontName ="Arial"

                            LayoutCachedLeft =3258
                            LayoutCachedTop =56
                            LayoutCachedWidth =3768
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =3784
                            Top =56
                            Width =510
                            OptionValue =72
                            Name ="tbtnH"
                            Caption ="H"
                            FontName ="Arial"

                            LayoutCachedLeft =3784
                            LayoutCachedTop =56
                            LayoutCachedWidth =4294
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =4310
                            Top =56
                            Width =510
                            OptionValue =73
                            Name ="tbtnI"
                            Caption ="I"
                            FontName ="Arial"

                            LayoutCachedLeft =4310
                            LayoutCachedTop =56
                            LayoutCachedWidth =4820
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =4836
                            Top =56
                            Width =510
                            OptionValue =74
                            Name ="tbtnJ"
                            Caption ="J"
                            FontName ="Arial"

                            LayoutCachedLeft =4836
                            LayoutCachedTop =56
                            LayoutCachedWidth =5346
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =5362
                            Top =56
                            Width =510
                            OptionValue =75
                            Name ="tbtnK"
                            Caption ="K"
                            FontName ="Arial"

                            LayoutCachedLeft =5362
                            LayoutCachedTop =56
                            LayoutCachedWidth =5872
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =5888
                            Top =56
                            Width =510
                            OptionValue =76
                            Name ="tbtnL"
                            Caption ="L"
                            FontName ="Arial"

                            LayoutCachedLeft =5888
                            LayoutCachedTop =56
                            LayoutCachedWidth =6398
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =6414
                            Top =56
                            Width =510
                            OptionValue =77
                            Name ="tbtnM"
                            Caption ="M"
                            FontName ="Arial"

                            LayoutCachedLeft =6414
                            LayoutCachedTop =56
                            LayoutCachedWidth =6924
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =6940
                            Top =56
                            Width =510
                            OptionValue =78
                            Name ="tbtnN"
                            Caption ="N"
                            FontName ="Arial"

                            LayoutCachedLeft =6940
                            LayoutCachedTop =56
                            LayoutCachedWidth =7450
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =7466
                            Top =56
                            Width =510
                            OptionValue =79
                            Name ="tbtnO"
                            Caption ="O"
                            FontName ="Arial"

                            LayoutCachedLeft =7466
                            LayoutCachedTop =56
                            LayoutCachedWidth =7976
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =7992
                            Top =56
                            Width =510
                            OptionValue =80
                            Name ="tbtnP"
                            Caption ="P"
                            FontName ="Arial"

                            LayoutCachedLeft =7992
                            LayoutCachedTop =56
                            LayoutCachedWidth =8502
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =8518
                            Top =56
                            Width =510
                            OptionValue =81
                            Name ="tbtnQ"
                            Caption ="Q"
                            FontName ="Arial"

                            LayoutCachedLeft =8518
                            LayoutCachedTop =56
                            LayoutCachedWidth =9028
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =9044
                            Top =56
                            Width =510
                            OptionValue =82
                            Name ="tbtnR"
                            Caption ="R"
                            FontName ="Arial"

                            LayoutCachedLeft =9044
                            LayoutCachedTop =56
                            LayoutCachedWidth =9554
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =9570
                            Top =56
                            Width =510
                            OptionValue =83
                            Name ="tbtnS"
                            Caption ="S"
                            FontName ="Arial"

                            LayoutCachedLeft =9570
                            LayoutCachedTop =56
                            LayoutCachedWidth =10080
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =10096
                            Top =56
                            Width =510
                            OptionValue =831
                            Name ="tbtnSc"
                            Caption ="Sc"
                            FontName ="Arial"

                            LayoutCachedLeft =10096
                            LayoutCachedTop =56
                            LayoutCachedWidth =10606
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =10622
                            Top =56
                            Width =510
                            OptionValue =832
                            Name ="tbtnSt"
                            Caption ="St"
                            FontName ="Arial"

                            LayoutCachedLeft =10622
                            LayoutCachedTop =56
                            LayoutCachedWidth =11132
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =11148
                            Top =56
                            Width =510
                            OptionValue =84
                            Name ="tbtnT"
                            Caption ="T"
                            FontName ="Arial"

                            LayoutCachedLeft =11148
                            LayoutCachedTop =56
                            LayoutCachedWidth =11658
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =11674
                            Top =56
                            Width =510
                            OptionValue =85
                            Name ="tbtnU"
                            Caption ="U"
                            FontName ="Arial"

                            LayoutCachedLeft =11674
                            LayoutCachedTop =56
                            LayoutCachedWidth =12184
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =12200
                            Top =56
                            Width =510
                            OptionValue =86
                            Name ="tbtnV"
                            Caption ="V"
                            FontName ="Arial"

                            LayoutCachedLeft =12200
                            LayoutCachedTop =56
                            LayoutCachedWidth =12710
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =12726
                            Top =56
                            Width =510
                            OptionValue =87
                            Name ="tbtnW"
                            Caption ="W"
                            FontName ="Arial"

                            LayoutCachedLeft =12726
                            LayoutCachedTop =56
                            LayoutCachedWidth =13236
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =13252
                            Top =56
                            Width =510
                            OptionValue =88
                            Name ="tbtnX"
                            Caption ="X"
                            FontName ="Arial"

                            LayoutCachedLeft =13252
                            LayoutCachedTop =56
                            LayoutCachedWidth =13762
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =13778
                            Top =56
                            Width =510
                            OptionValue =89
                            Name ="tbtnY"
                            Caption ="Y"
                            FontName ="Arial"

                            LayoutCachedLeft =13778
                            LayoutCachedTop =56
                            LayoutCachedWidth =14288
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                        Begin ToggleButton
                            OverlapFlags =87
                            Left =14304
                            Top =56
                            Width =510
                            OptionValue =90
                            Name ="tbtnZ"
                            Caption ="Z"
                            FontName ="Arial"

                            LayoutCachedLeft =14304
                            LayoutCachedTop =56
                            LayoutCachedWidth =14814
                            LayoutCachedHeight =339
                            Overlaps =1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    ColumnCount =3
                    ListRows =30
                    ListWidth =3402
                    Left =11276
                    Top =4125
                    Width =3969
                    Height =255
                    FontWeight =700
                    TabIndex =3
                    BackColor =10092543
                    Name ="comGebTag"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="\"H\""
                    FontName ="Arial"
                    ControlTipText ="Selektiere den Zeitraum der Geburtstage\015\012Doppelklick schaltet um zwischen "
                        "aktuell und pro Monat"

                    LayoutCachedLeft =11276
                    LayoutCachedTop =4125
                    LayoutCachedWidth =15245
                    LayoutCachedHeight =4380
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    BorderWidth =3
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =11271
                    Top =1256
                    Width =3969
                    Height =907
                    FontWeight =700
                    TabIndex =4
                    BackColor =12632256
                    BorderColor =32896
                    Name ="lstMandant"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;1134"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste unserer Firmen"

                    LayoutCachedLeft =11271
                    LayoutCachedTop =1256
                    LayoutCachedWidth =15240
                    LayoutCachedHeight =2163
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    BorderWidth =3
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =11271
                    Top =2254
                    Width =3969
                    Height =1747
                    FontWeight =700
                    TabIndex =5
                    BackColor =8454143
                    BorderColor =32896
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="mit Click angewählte Aktion starten"

                    LayoutCachedLeft =11271
                    LayoutCachedTop =2254
                    LayoutCachedWidth =15240
                    LayoutCachedHeight =4001
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =3
                    Left =457
                    Top =1083
                    Width =4245
                    Height =10597
                    FontSize =10
                    FontWeight =700
                    TabIndex =6
                    BackColor =12632256
                    BorderColor =16777215
                    Name ="lstS"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;3969"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Doppelclick öffnet markierten Vorgang"

                    LayoutCachedLeft =457
                    LayoutCachedTop =1083
                    LayoutCachedWidth =4702
                    LayoutCachedHeight =11680
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =2
                    Left =5261
                    Top =453
                    Width =5775
                    Height =3945
                    FontSize =10
                    FontWeight =700
                    TabIndex =7
                    BackColor =12632256
                    BorderColor =16777215
                    Name ="lstI"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701;2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Infos zu User und Applikation (Click zeigt aktuelle Uhrzeit)"

                    LayoutCachedLeft =5261
                    LayoutCachedTop =453
                    LayoutCachedWidth =11036
                    LayoutCachedHeight =4398
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =3
                    Left =5261
                    Top =4496
                    Width =5775
                    Height =7184
                    TabIndex =8
                    BackColor =12632256
                    BorderColor =16777215
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268;1701"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Diverse Infos (Doppel-Click zum Anzeigen / Starten)"

                    LayoutCachedLeft =5261
                    LayoutCachedTop =4496
                    LayoutCachedWidth =11036
                    LayoutCachedHeight =11680
                End
                Begin TextBox
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =15420
                    Top =2267
                    Width =8505
                    Height =9413
                    FontSize =14
                    TabIndex =9
                    BackColor =15266810
                    Name ="txtmsg"
                    FontName ="Arial"
                    ControlTipText ="Letzte Meldung, die alle User sehen.\015\012Text kann hier geändert werden; muss"
                        " aber separat abgespeichert werden (Doppelclick im Listenfeld lsta)"
                    TextFormat =1

                    LayoutCachedLeft =15420
                    LayoutCachedTop =2267
                    LayoutCachedWidth =23925
                    LayoutCachedHeight =11680
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    Left =1919
                    Top =626
                    Width =2406
                    Height =383
                    FontSize =12
                    TabIndex =10
                    BackColor =12632256
                    BorderColor =16777215
                    HelpContextId =3
                    Name ="suche"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Such-Begriff eingeben,\015\012nach dem in dem unten markierten Feature gesucht w"
                        "erden soll; \015\012mit <Enter> abschliessen\015\012*:Wildcard-Suche"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffcc9900000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1919
                    LayoutCachedTop =626
                    LayoutCachedWidth =4325
                    LayoutCachedHeight =1009
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffcc9900000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    OverlapFlags =87
                    TextFontFamily =34
                    Left =446
                    Top =626
                    Width =1473
                    Height =390
                    FontSize =8
                    FontWeight =700
                    TabIndex =11
                    Name ="btnSuche"
                    Caption ="* suche *"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="aktualisiere die Liste"

                    LayoutCachedLeft =446
                    LayoutCachedTop =626
                    LayoutCachedWidth =1919
                    LayoutCachedHeight =1016
                    Overlaps =1
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =4445
                    Top =626
                    Width =246
                    Height =383
                    TabIndex =12
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Sucheinträge (auswählen und Suche wiederholen)"

                    LayoutCachedLeft =4445
                    LayoutCachedTop =626
                    LayoutCachedWidth =4691
                    LayoutCachedHeight =1009
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    BorderWidth =5
                    ColumnCount =6
                    Left =11271
                    Top =7951
                    Width =3969
                    Height =3729
                    TabIndex =13
                    BackColor =12632256
                    BorderColor =8388736
                    Name ="lstWV"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;0;1134;1701"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste meiner Wiedervorlagen\015\012Doppel-Clicken zum Öffnen des Adress-/Vorgang"
                        "s-Formulares\015\012Ist die Liste rot, ist mindestens ein Wiedervorlage-Datum üb"
                        "erschritten!!"

                    LayoutCachedLeft =11271
                    LayoutCachedTop =7951
                    LayoutCachedWidth =15240
                    LayoutCachedHeight =11680
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =3
                    Left =15420
                    Top =56
                    Width =8505
                    Height =2085
                    FontSize =10
                    FontWeight =700
                    TabIndex =14
                    BackColor =255
                    BorderColor =16777215
                    Name ="lstB2B"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835;2268;1134"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="B21B Infos\015\012Doppel-Klick zum Starten von Aktionen"

                    LayoutCachedLeft =15420
                    LayoutCachedTop =56
                    LayoutCachedWidth =23925
                    LayoutCachedHeight =2141
                End
            End
        End
    End
End
CodeBehindForm
' See "Menu.cls"
