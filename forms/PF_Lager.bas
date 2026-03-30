Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =4593
    DatasheetFontHeight =10
    ItemSuffix =20
    Left =630
    Top =2775
    Right =28545
    Bottom =15015
    Tag ="Lager"
    RecSrcDt = Begin
        0xf870c9a13a64e540
    End
    Caption ="Lagerbuchung zu Artikel - externe Festplatte *AL419951*"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnDblClick ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
    OrderByOnLoad =0
    ShowPageMargins =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            FontName ="Tahoma"
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="Tahoma"
            BorderLineStyle =0
        End
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin TextBox
            FELineBreak = NotDefault
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
            AsianLineBreak =255
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin CustomControl
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
            Height =4365
            Name ="det"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    AutoTab = NotDefault
                    EnterKeyBehavior = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =57
                    Top =3007
                    Width =4536
                    Height =1134
                    TabIndex =9
                    Name ="BemLager"
                    StatusBarText ="Bemerkung"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"
                    AsianLineBreak =0

                    LayoutCachedLeft =57
                    LayoutCachedTop =3007
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =4141
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =60
                    Top =2670
                    Width =1134
                    Height =255
                    BackColor =12632256
                    Name ="Bezeichnungsfeld97"
                    Caption ="Bemerkung"
                    FontName ="Arial"
                    LayoutCachedLeft =60
                    LayoutCachedTop =2670
                    LayoutCachedWidth =1194
                    LayoutCachedHeight =2925
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    ColumnCount =2
                    Left =1418
                    Top =450
                    Width =1134
                    Height =255
                    TabIndex =1
                    ConditionalFormat = Begin
                        0x0100000074000000030000000000000002000000000000000200000001000000 ,
                        0x00000000a7da4e00000000000200000003000000050000000100000000000000 ,
                        0xfff20000000000000200000006000000090000000100000000000000ed1c2400 ,
                        0x3100000000003000000000002d00310000000000
                    End
                    Name ="EinAus"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Eingang/Abgang\015\012Doppelklick zum Ändern"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =450
                    LayoutCachedWidth =2552
                    LayoutCachedHeight =705
                    ConditionalFormat14 = Begin
                        0x01000300000000000000020000000100000000000000a7da4e00010000003100 ,
                        0x0000000000000000000000000000000000000000000000000002000000010000 ,
                        0x0000000000fff200000100000030000000000000000000000000000000000000 ,
                        0x0000000000000000020000000100000000000000ed1c2400020000002d003100 ,
                        0x000000000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =57
                    Top =2272
                    Width =1134
                    Height =330
                    TabIndex =7
                    ForeColor =0
                    Name ="btnDatumBuchung"
                    Caption ="Datum"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Kalender öffnen"

                    LayoutCachedLeft =57
                    LayoutCachedTop =2272
                    LayoutCachedWidth =1191
                    LayoutCachedHeight =2602
                    Overlaps =1
                End
                Begin TextBox
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =1418
                    Top =2347
                    Width =1134
                    Height =255
                    TabIndex =8
                    Name ="DatumBuchung"
                    Format ="dd/mm/yyyy"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    Tag ="Del1"
                    ControlTipText ="Datum der Buchung"
                    AsianLineBreak =0

                    LayoutCachedLeft =1418
                    LayoutCachedTop =2347
                    LayoutCachedWidth =2552
                    LayoutCachedHeight =2602
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =1985
                    Left =1418
                    Top =1190
                    Width =3168
                    Height =255
                    TabIndex =3
                    Name ="Lagerort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Lagerort zeigt alle jemals eingetragenen Lagerorte"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =1190
                    LayoutCachedWidth =4586
                    LayoutCachedHeight =1445
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =57
                            Top =1190
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld146"
                            Caption ="Lagerort"
                            FontName ="Arial"
                            LayoutCachedLeft =57
                            LayoutCachedTop =1190
                            LayoutCachedWidth =1191
                            LayoutCachedHeight =1445
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =57
                    Top =1927
                    Width =1134
                    Height =345
                    TabIndex =5
                    ForeColor =0
                    Name ="btnLagerMitarbeiter"
                    Caption ="Mitarbeiter"
                    StatusBarText ="Mitarbeiter"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="verantw. Mitarbeiter anzeigen"

                    LayoutCachedLeft =57
                    LayoutCachedTop =1927
                    LayoutCachedWidth =1191
                    LayoutCachedHeight =2272
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =3
                    ListRows =20
                    ListWidth =3402
                    Left =1418
                    Top =2017
                    Width =1134
                    Height =255
                    TabIndex =6
                    Name ="LagerMitarbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;2268"
                    StatusBarText ="Besteller"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =2017
                    LayoutCachedWidth =2552
                    LayoutCachedHeight =2272
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =1985
                    Left =1418
                    Top =1535
                    Width =3168
                    Height =255
                    TabIndex =4
                    Name ="Lagerfach"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"
                    ControlTipText ="Lagerfach"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =1535
                    LayoutCachedWidth =4586
                    LayoutCachedHeight =1790
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =57
                            Top =1535
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld154"
                            Caption ="Fach"
                            FontName ="Arial"
                            LayoutCachedLeft =57
                            LayoutCachedTop =1535
                            LayoutCachedWidth =1191
                            LayoutCachedHeight =1790
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    DecimalPlaces =0
                    ListRows =20
                    Left =1418
                    Top =795
                    Width =1134
                    Height =255
                    TabIndex =2
                    Name ="LagerMenge"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="Del2"
                    ControlTipText ="Menge\015\012Doppelklick um die Menge jeweils um 1 zu erhöhen"
                    Format ="Fixed"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =795
                    LayoutCachedWidth =2552
                    LayoutCachedHeight =1050
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1417
                    Top =113
                    Width =1134
                    Height =285
                    FontSize =10
                    BackColor =9868950
                    ForeColor =9868950
                    Name ="nrLager"
                    FontName ="Arial"
                    ControlTipText ="ID Tabelle T_Lager"
                    AsianLineBreak =0

                    LayoutCachedLeft =1417
                    LayoutCachedTop =113
                    LayoutCachedWidth =2551
                    LayoutCachedHeight =398
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =57
                            Top =143
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="lblnrLager"
                            Caption ="ID Lager"
                            FontName ="Arial"
                            LayoutCachedLeft =57
                            LayoutCachedTop =143
                            LayoutCachedWidth =1191
                            LayoutCachedHeight =398
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =4026
                    Width =567
                    Height =567
                    TabIndex =10
                    ForeColor =0
                    Name ="btnClose"
                    Caption ="schliessen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="schliessen (ohne Speichern)"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000b17d4a0fb17d4aedb17d4ac0b17d4a7bb17d4a0c00000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000b17d4a0fb17d4affb17d4affb17d4affb17d4ae7b17d4a48 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4a0fb17d4a3fb17d4aa8b17d4affb17d4af9 ,
                        0xb17d4a3000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4a96b17d4aff ,
                        0xb17d4ab100000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4a12b17d4aff ,
                        0xb17d4af000000000000000000000000000000000b17d4a5ab17d4afcb17d4aff ,
                        0xb17d4af9b17d4a4500000000000000000000000000000000b17d4a12b17d4aff ,
                        0xb17d4af6000000000000000000000000b17d4a42b17d4af9b17d4affb17d4afc ,
                        0xb17d4a510000000000000000000000000000000000000000b17d4a96b17d4aff ,
                        0xb17d4ac30000000000000000b17d4a36b17d4af6b17d4affb17d4affb17d4a5d ,
                        0x000000000000000000000000b17d4a12b17d4a42b17d4aa8b17d4affb17d4aff ,
                        0xb17d4a4b00000000b17d4a27b17d4aeab17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affb17d4af9b17d4a78 ,
                        0x0000000000000000b17d4a24b17d4aeab17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4aedb17d4accb17d4a90b17d4a2400000000 ,
                        0x000000000000000000000000b17d4a2db17d4aedb17d4affb17d4affb17d4a5a ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4a36b17d4af3b17d4affb17d4af9 ,
                        0xb17d4a3c00000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000b17d4a42b17d4af6b17d4aff ,
                        0xb17d4aeab17d4a24000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =4026
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =567
                    Overlaps =1
                End
                Begin CustomControl
                    Enabled = NotDefault
                    SizeMode =1
                    OldBorderStyle =0
                    OverlapFlags =85
                    Left =2607
                    Top =793
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =11
                    Name ="SpinButtonMenge"
                    OleData = Begin
                        0x000e0000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000020000000000000000100000 ,
                        0x0400000001000000feffffff0000000003000000ffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff01000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000d0d22b8da434d8010700000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000078000000 ,
                        0x0000000003004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x00000000fefffffffdfffffffffffffffffffffffffffffffffffffffeffffff ,
                        0xfeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff01000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000604281f3b134d8010500000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000078000000 ,
                        0x0000000003004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x00000000fffffffffffffffffefffffffdfffffffefffffffeffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffeffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff38000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000066656c64 ,
                        0x001000000100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                        0x0000000000021400880800000400000000000000c00100004602000000000000 ,
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
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =2607
                    LayoutCachedTop =793
                    LayoutCachedWidth =2861
                    LayoutCachedHeight =1123
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2720
                    Top =113
                    Width =1134
                    Height =285
                    FontSize =10
                    TabIndex =12
                    BackColor =9868950
                    ForeColor =9868950
                    Name ="nrArtikel"
                    FontName ="Arial"
                    ControlTipText ="ID Artikel"
                    AsianLineBreak =0

                    LayoutCachedLeft =2720
                    LayoutCachedTop =113
                    LayoutCachedWidth =3854
                    LayoutCachedHeight =398
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    BackStyle =0
                    IMESentenceMode =3
                    Left =3061
                    Top =566
                    Width =909
                    Height =285
                    FontSize =10
                    TabIndex =13
                    BackColor =9868950
                    ForeColor =9868950
                    Name ="NrVGDET"
                    FontName ="Arial"
                    ControlTipText ="ID des Vorgangdetails"
                    AsianLineBreak =0

                    LayoutCachedLeft =3061
                    LayoutCachedTop =566
                    LayoutCachedWidth =3970
                    LayoutCachedHeight =851
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =57
                    Top =795
                    Width =1134
                    Height =255
                    BackColor =12632256
                    Name ="lblLagermenge"
                    Caption ="Menge"
                    FontName ="Arial"
                    LayoutCachedLeft =57
                    LayoutCachedTop =795
                    LayoutCachedWidth =1191
                    LayoutCachedHeight =1050
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    BackStyle =0
                    Left =2835
                    Top =2340
                    Width =1705
                    Height =255
                    TabIndex =14
                    BackColor =12632256
                    BorderColor =16711680
                    ForeColor =8421504
                    Name ="Lagererfasst"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Buchung erfasst am ..."
                    AsianLineBreak =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2340
                    LayoutCachedWidth =4540
                    LayoutCachedHeight =2595
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =1
                    BackStyle =0
                    Left =2835
                    Top =2085
                    Width =1705
                    Height =255
                    TabIndex =15
                    BackColor =12632256
                    BorderColor =16711680
                    ForeColor =8421504
                    Name ="LastUpdate"
                    Format ="dd/mm/yy hh:nn"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."
                    AsianLineBreak =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2085
                    LayoutCachedWidth =4540
                    LayoutCachedHeight =2340
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    BackStyle =0
                    Left =2835
                    Top =1830
                    Width =1705
                    Height =255
                    TabIndex =16
                    BackColor =12632256
                    BorderColor =16711680
                    ForeColor =8421504
                    Name ="whoUpdate"
                    Format ="dd\\.mm\\.yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Update von .."
                    AsianLineBreak =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =1830
                    LayoutCachedWidth =4540
                    LayoutCachedHeight =2085
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    BackStyle =0
                    IMESentenceMode =3
                    Left =3060
                    Top =885
                    Width =909
                    Height =285
                    FontSize =10
                    TabIndex =17
                    BackColor =9868950
                    ForeColor =9868950
                    Name ="PrintMarkerLager"
                    FontName ="Arial"
                    ControlTipText ="ID Artikel"
                    AsianLineBreak =0

                    LayoutCachedLeft =3060
                    LayoutCachedTop =885
                    LayoutCachedWidth =3969
                    LayoutCachedHeight =1170
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =4020
                    Top =585
                    Width =567
                    Height =567
                    TabIndex =18
                    ForeColor =0
                    Name ="btnsave"
                    Caption ="Speichern"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Speichern und schliessen"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000ab598980ab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989800000000000000000ab5989ffab5989ffab5989ffffffffffffffffff ,
                        0xab5989ffab5989ffffffffffffffffffffffffffffffffffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffffffffffffffffff ,
                        0xab5989ffab5989ffffffffffffffffffffffffffffffffffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffd9b4caffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffd9b4caffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffab5989ff ,
                        0xab5989ff0000000000000000ab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ffab5989ff ,
                        0xab5989ff00000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =4020
                    LayoutCachedTop =585
                    LayoutCachedWidth =4587
                    LayoutCachedHeight =1152
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    Left =2835
                    Top =2610
                    Width =1705
                    Height =255
                    TabIndex =19
                    BackColor =12632256
                    BorderColor =16711680
                    ForeColor =8421504
                    Name ="created_by"
                    FontName ="Arial"
                    ControlTipText ="Lagerbuchung wurde erstellt von..."
                    AsianLineBreak =0
                    ShowDatePicker =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =2610
                    LayoutCachedWidth =4540
                    LayoutCachedHeight =2865
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Lager.cls"
