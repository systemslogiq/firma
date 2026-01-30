Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =18
    GridX =20
    GridY =20
    Width =8789
    DatasheetFontHeight =12
    ItemSuffix =241
    Left =2894
    Top =9090
    Right =11954
    Bottom =14400
    TimerInterval =500
    Tag ="Leistung"
    RecSrcDt = Begin
        0x8ea55d699c18e540
    End
    UniqueTable ="T_Leistung"
    Caption ="Verrechenbar Leistungen Pos. 1 bestellt: 25 Std. Stundensatz für Engineering-Arb"
        "eiten"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
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
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
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
        Begin Section
            CanGrow = NotDefault
            Height =4954
            BackColor =12632256
            Name ="Det"
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =2
                    ColumnCount =4
                    ListRows =30
                    ListWidth =5387
                    Left =1472
                    Top =2395
                    Width =1629
                    Height =255
                    TabIndex =2
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="NrBearbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;2268;2268"
                    StatusBarText ="Auswahl Mitarbeiter"
                    FontName ="Arial"

                    LayoutCachedLeft =1472
                    LayoutCachedTop =2395
                    LayoutCachedWidth =3101
                    LayoutCachedHeight =2650
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =189
                            Top =2395
                            Width =1239
                            Height =255
                            Name ="Bezeichnungsfeld225"
                            Caption ="Mitarbeiter"
                            FontName ="Arial"
                            LayoutCachedLeft =189
                            LayoutCachedTop =2395
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =2650
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    TextFontFamily =34
                    Left =1472
                    Top =2718
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =5
                    BackColor =15461355
                    Name ="DatumTag"
                    Format ="dd\\.mm/yy"
                    StatusBarText ="Tag"
                    ValidationRule ="<=Date()+365"
                    ValidationText ="Sie sind zu weit in der Zukunft (mehr als 365 Tage)"
                    BeforeUpdate ="[Event Procedure]"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    Tag ="m1"
                    ControlTipText ="Datum für Stundenerfassung (mit +/- Taste änderbar)"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1472
                    LayoutCachedTop =2718
                    LayoutCachedWidth =2606
                    LayoutCachedHeight =2973
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    Left =869
                    Top =3063
                    Width =591
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =9
                    BackColor =8421504
                    Name ="LiefereinheitVG"
                    ControlSource ="LiefereinheitVG"
                    StatusBarText ="Liefereinheit"
                    FontName ="Arial"

                    LayoutCachedLeft =869
                    LayoutCachedTop =3063
                    LayoutCachedWidth =1460
                    LayoutCachedHeight =3318
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1472
                    Top =3411
                    Width =185
                    Height =210
                    TabIndex =11
                    Name ="StatusLeistung"
                    StatusBarText ="Ja : Std sind verrechenbar / Nein: Std. nicht verrechenbar"
                    DefaultValue ="1"
                    ControlTipText ="Ja : Std sind verrechenbar / Nein: Std. nicht verrechenbar"

                    LayoutCachedLeft =1472
                    LayoutCachedTop =3411
                    LayoutCachedWidth =1657
                    LayoutCachedHeight =3621
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =189
                            Top =3381
                            Width =1239
                            Height =255
                            Name ="Bezeichnungsfeld223"
                            Caption ="verrechenbar"
                            FontName ="Arial"
                            LayoutCachedLeft =189
                            LayoutCachedTop =3381
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =3636
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    ScrollBars =2
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =1472
                    Top =3734
                    Width =7311
                    Height =750
                    FontSize =8
                    TabIndex =12
                    BackColor =15461355
                    Name ="BemLeistung"
                    FontName ="Arial"
                    ControlTipText ="Bemerkung /Einzelheiten der erbrachten Leistung"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    TextFormat =1

                    LayoutCachedLeft =1472
                    LayoutCachedTop =3734
                    LayoutCachedWidth =8783
                    LayoutCachedHeight =4484
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =1472
                    Top =4549
                    Width =7311
                    Height =405
                    FontSize =8
                    TabIndex =13
                    BackColor =10092543
                    Name ="InfoLeistung"
                    StatusBarText ="Infos zur erbrachten Leistung (wird nicht ausgedruckt)!"
                    FontName ="Arial"
                    ControlTipText ="interne Informationen"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1472
                    LayoutCachedTop =4549
                    LayoutCachedWidth =8783
                    LayoutCachedHeight =4954
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =144
                            Top =4527
                            Width =1239
                            Height =255
                            Name ="Bezeichnungsfeld218"
                            Caption ="Zusatz-Infos"
                            FontName ="Arial"
                            LayoutCachedLeft =144
                            LayoutCachedTop =4527
                            LayoutCachedWidth =1383
                            LayoutCachedHeight =4782
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =2847
                    Top =2711
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =4
                    Name ="SpinButtonDatumTag"
                    OleData = Begin
                        0x00120000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000000000000000000000100000 ,
                        0x0600000001000000feffffff0000000001000000ffffffffffffffffffffffff ,
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
                        0x006d2776000000000000000000000000e01128e22289c9010700000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000007a000000 ,
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
                        0x006d2776000000000000000000000000f085ec1db91fc8010500000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000014000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000007a000000 ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000b65 ,
                        0xfc0b0b65000210000808000000000000c00100004602000046020000340c0b65 ,
                        0x3c0c0b65440c0b654c0c0b65540c0b655c0c0b65640c0b656c0c0b65740c0b65 ,
                        0x7c0c0b65840c0b658c0c0b65940c0b659c0c0b65a40c0b65ac0c0b65b40c0b65 ,
                        0xbc0c0b65c40c0b65cc0c0b65d40c0b65dc0c0b65e40c0b65ec0c0b65f40c0b65 ,
                        0xfc0c0b65040d0b650c0d0b65140d0b651c0d0b65240d0b652c0d0b65340d0b65 ,
                        0x3c0d0b65440d0b654c0d0b65540d0b655c0d0b65640d0b656c0d0b65740d0b65 ,
                        0x7c0d0b65840d0b658c0d0b65940d0b659c0d0b65a40d0b65ac0d0b65b40d0b65 ,
                        0xbc0d0b65c40d0b65cc0d0b65d40d0b65dc0d0b65e40d0b65ec0d0b65f40d0b65 ,
                        0xfc0d0b65040e0b650c0e0b65140e0b651c0e0b65240e0b652c0e0b65340e0b65 ,
                        0x3c0e0b65440e0b654c0e0b65540e0b655c0e0b65640e0b656c0e0b65740e0b65 ,
                        0x7c0e0b65feffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000b65 ,
                        0xfc0b0b6500021400880800000400000000000000c001000046020000340c0b65 ,
                        0x3c0c0b65440c0b654c0c0b65540c0b655c0c0b65640c0b656c0c0b65740c0b65 ,
                        0x7c0c0b65840c0b658c0c0b65940c0b659c0c0b65a40c0b65ac0c0b65b40c0b65 ,
                        0xbc0c0b65c40c0b65cc0c0b65d40c0b65dc0c0b65e40c0b65ec0c0b65f40c0b65 ,
                        0xfc0c0b65040d0b650c0d0b65140d0b651c0d0b65240d0b652c0d0b65340d0b65 ,
                        0x3c0d0b65440d0b654c0d0b65540d0b655c0d0b65640d0b656c0d0b65740d0b65 ,
                        0x7c0d0b65840d0b658c0d0b65940d0b659c0d0b65a40d0b65ac0d0b65b40d0b65 ,
                        0xbc0d0b65c40d0b65cc0d0b65d40d0b65dc0d0b65e40d0b65ec0d0b65f40d0b65 ,
                        0xfc0d0b65040e0b650c0e0b65140e0b651c0e0b65240e0b652c0e0b65340e0b65 ,
                        0x3c0e0b65440e0b654c0e0b65540e0b655c0e0b65640e0b656c0e0b65740e0b65 ,
                        0x7c0e0b6500000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =2847
                    LayoutCachedTop =2711
                    LayoutCachedWidth =3101
                    LayoutCachedHeight =3041
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    ColumnCount =4
                    Left =3686
                    Top =447
                    Width =5103
                    Height =3221
                    TabIndex =1
                    BackColor =12632256
                    Name ="lstLeistung"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;1134"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste der erbrachten Leistungen, Doppelclick zeigt entsprechendes Formular"

                    LayoutCachedLeft =3686
                    LayoutCachedTop =447
                    LayoutCachedWidth =8789
                    LayoutCachedHeight =3668
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =3686
                            Top =113
                            Width =5103
                            Height =285
                            FontSize =10
                            FontWeight =700
                            ForeColor =8421376
                            Name ="Bezeichnungsfeld226"
                            Caption ="bisher geleistet (Doppelclick zum Anzeigen)"
                            FontName ="Arial"
                            LayoutCachedLeft =3686
                            LayoutCachedTop =113
                            LayoutCachedWidth =8789
                            LayoutCachedHeight =398
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =3
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1472
                    Top =3058
                    Width =1134
                    Height =255
                    FontSize =8
                    TabIndex =8
                    BackColor =15461355
                    Name ="AnzahlLeistung"
                    Format ="Fixed"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Anzahl / Betrag  (mit +/- Taste änderbar) oder Doppelklick"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1472
                    LayoutCachedTop =3058
                    LayoutCachedWidth =2606
                    LayoutCachedHeight =3313
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =189
                            Top =3058
                            Width =594
                            Height =255
                            Name ="Bezeichnungsfeld219"
                            Caption ="Anzahl"
                            FontName ="Arial"
                            LayoutCachedLeft =189
                            LayoutCachedTop =3058
                            LayoutCachedWidth =783
                            LayoutCachedHeight =3313
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =2847
                    Top =3067
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =10
                    Name ="SpinButtonAnzahlLeistung"
                    OleData = Begin
                        0x00120000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000000000000000000000100000 ,
                        0x0600000001000000feffffff0000000001000000ffffffffffffffffffffffff ,
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
                        0x006d2776000000000000000000000000e01128e22289c9010700000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000007a000000 ,
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
                        0x006d27760000000000000000000000005081fcd82289c9010500000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000007a000000 ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000002000 ,
                        0x54005f0000021400880800004900000000000000c00100004602000047004400 ,
                        0x6500740020004f005200440045005200200042005900200054005f004c006500 ,
                        0x69007300740075006e0067002e0044006100740075006d005400610067002000 ,
                        0x44004500530043003b00270020006e0069006300680074002000660069006e00 ,
                        0x640065006e002e0020005300740065006c006c0065006e002000530069006500 ,
                        0x20007300690063006800650072002c0020006400610073007300200064006100 ,
                        0x730020004f0062006a0065006b00740020006500780069007300740069006500 ,
                        0x72007400200075006e0064002000640061007300730020006400690065002000 ,
                        0x4e0061006d0065006e0073002d00200075006e00640020005000660061006400 ,
                        0x61006e0067006100620065006e00200072006900630068007400690067002000 ,
                        0x65006900feffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000002000 ,
                        0x54005f0000021400880800004c00000000000000c00100004602000047004400 ,
                        0x6500740020004f005200440045005200200042005900200054005f004c006500 ,
                        0x69007300740075006e0067002e0044006100740075006d005400610067002000 ,
                        0x44004500530043003b00270020006e0069006300680074002000660069006e00 ,
                        0x640065006e002e0020005300740065006c006c0065006e002000530069006500 ,
                        0x20007300690063006800650072002c0020006400610073007300200064006100 ,
                        0x730020004f0062006a0065006b00740020006500780069007300740069006500 ,
                        0x72007400200075006e0064002000640061007300730020006400690065002000 ,
                        0x4e0061006d0065006e0073002d00200075006e00640020005000660061006400 ,
                        0x61006e0067006100620065006e00200072006900630068007400690067002000 ,
                        0x6500690000000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =2847
                    LayoutCachedTop =3067
                    LayoutCachedWidth =3101
                    LayoutCachedHeight =3397
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =189
                    Top =2644
                    Width =951
                    Height =340
                    TabIndex =3
                    ForeColor =0
                    Name ="btnDatumTag"
                    Caption ="Datum"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ok, Daten übernehmen"

                    LayoutCachedLeft =189
                    LayoutCachedTop =2644
                    LayoutCachedWidth =1140
                    LayoutCachedHeight =2984
                    Overlaps =1
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =34
                    BackStyle =0
                    Left =1764
                    Top =3397
                    Width =651
                    Height =255
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    ForeColor =9868950
                    Name ="nrvgdet"
                    ControlSource ="nrvgdet"
                    StatusBarText ="Liefereinheit"
                    FontName ="Arial"

                    LayoutCachedLeft =1764
                    LayoutCachedTop =3397
                    LayoutCachedWidth =2415
                    LayoutCachedHeight =3652
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextAlign =2
                    TextFontFamily =34
                    Left =1168
                    Top =2718
                    Width =321
                    Height =255
                    FontSize =8
                    TabIndex =14
                    BackColor =15461355
                    Name ="DatumTagTT"
                    ControlSource ="=Format([Datumtag],\"DDD\")"
                    StatusBarText ="Tag"
                    ValidationRule ="<=Date()"
                    ValidationText ="Sie sind in der Zukunft!"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Datum für Stundenerfassung (mit +/- Taste änderbar)"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1168
                    LayoutCachedTop =2718
                    LayoutCachedWidth =1489
                    LayoutCachedHeight =2973
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =141
                    Top =113
                    Width =3402
                    Height =2098
                    TabIndex =15
                    BackColor =10092543
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Füge markierte Zeile in Bemerkungen ein"

                    LayoutCachedLeft =141
                    LayoutCachedTop =113
                    LayoutCachedWidth =3543
                    LayoutCachedHeight =2211
                End
                Begin ComboBox
                    OverlapFlags =247
                    TextAlign =2
                    DecimalPlaces =0
                    IMESentenceMode =3
                    Left =1472
                    Top =3058
                    Width =510
                    Height =255
                    TabIndex =6
                    BackColor =15461355
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="std"
                    RowSourceType ="Table/Query"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    ControlTipText ="Anzahl Stunden  (mit +/- Taste änderbar)"
                    Format ="Fixed"

                    LayoutCachedLeft =1472
                    LayoutCachedTop =3058
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =3313
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    OverlapFlags =247
                    TextAlign =2
                    DecimalPlaces =0
                    IMESentenceMode =3
                    Left =2096
                    Top =3058
                    Width =510
                    Height =255
                    TabIndex =7
                    BackColor =15461355
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="min"
                    RowSourceType ="Table/Query"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    ControlTipText ="Anzahl Minuten  (mit +/- Taste änderbar)"
                    Format ="Fixed"

                    LayoutCachedLeft =2096
                    LayoutCachedTop =3058
                    LayoutCachedWidth =2606
                    LayoutCachedHeight =3313
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =135
                    Top =3741
                    Width =1239
                    Height =567
                    TabIndex =16
                    ForeColor =0
                    Name ="btnBemleistungtextBaustein"
                    Caption ="Bemerkungen Textbaustein..."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Im Lexikon hinterlegten Textbaustein auswählen und zuordnen"

                    LayoutCachedLeft =135
                    LayoutCachedTop =3741
                    LayoutCachedWidth =1374
                    LayoutCachedHeight =4308
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Leistung.cls"
