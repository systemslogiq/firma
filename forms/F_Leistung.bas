Version =20
VersionRequired =20
Begin Form
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    TabularFamily =18
    GridX =20
    GridY =20
    Width =27383
    DatasheetFontHeight =12
    ItemSuffix =310
    Right =27915
    Bottom =11865
    TimerInterval =500
    OnUnload ="[Event Procedure]"
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Leistung"
    RecSrcDt = Begin
        0x72a33e658ee2e540
    End
    UniqueTable ="T_Leistung"
    Caption ="Leistungen"
    OnCurrent ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnActivate ="[Event Procedure]"
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
            Height =11964
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =9615
                    Width =2268
                    Height =285
                    ColumnOrder =25
                    FontSize =8
                    TabIndex =4
                    ForeColor =9868950
                    Name ="NrLeistung"
                    ControlSource ="NrLeistung"
                    FontName ="Arial"
                    ControlTipText ="ID"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =9615
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =9900
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =22110
                            Top =9615
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld274"
                            Caption ="ID"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =9615
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =9900
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =6265
                    Top =30
                    Width =1239
                    Height =340
                    TabIndex =5
                    ForeColor =0
                    Name ="btnNrBearbeiter"
                    Caption ="Mitarbeiter"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    OnLostFocus ="[Event Procedure]"
                    ControlTipText ="Mitarbeiter anzeigen"

                    LayoutCachedLeft =6265
                    LayoutCachedTop =30
                    LayoutCachedWidth =7504
                    LayoutCachedHeight =370
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =6240
                    Top =742
                    Width =1239
                    Height =340
                    TabIndex =7
                    ForeColor =0
                    Name ="btnFirma"
                    Caption ="Firma"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="gehe zum Kunden"

                    LayoutCachedLeft =6240
                    LayoutCachedTop =742
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =1082
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =6240
                    Top =1652
                    Width =1239
                    Height =340
                    TabIndex =13
                    ForeColor =0
                    Name ="btnDatumTag"
                    Caption ="Datum"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Kalender öffnen"

                    LayoutCachedLeft =6240
                    LayoutCachedTop =1652
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =1992
                    Overlaps =1
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =7560
                    Top =1697
                    Width =1026
                    Height =255
                    ColumnOrder =29
                    FontSize =8
                    BackColor =15461355
                    Name ="DatumTag"
                    ControlSource ="DatumTag"
                    Format ="dd\\.mm/yy"
                    StatusBarText ="Tag"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    Tag ="m1"
                    ControlTipText ="Datum, an dem die Leistung erbracht wurde (mit +/- Taste änderbar)"
                    ConditionalFormat = Begin
                        0x0100000088000000030000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff000000000005000000020000000b0000000100000000000000 ,
                        0xffc20e0000000000040000000c000000130000000100000000000000ed1c2400 ,
                        0x000000004400610074006500280029002d003500000000004400410054004500 ,
                        0x2800290000000000
                    End
                    ShowDatePicker =0

                    LayoutCachedLeft =7560
                    LayoutCachedTop =1697
                    LayoutCachedWidth =8586
                    LayoutCachedHeight =1952
                    ConditionalFormat14 = Begin
                        0x01000300000002000000000000000100000000000000ffffff00000000000000 ,
                        0x0000000000000000000000000000000000000000000000050000000100000000 ,
                        0x000000ffc20e00080000004400610074006500280029002d0035000000000000 ,
                        0x0000000000000000000000000000000000000000040000000100000000000000 ,
                        0xed1c240006000000440041005400450028002900000000000000000000000000 ,
                        0x000000000000000000
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =11512
                    Top =1749
                    Width =786
                    Height =255
                    ColumnOrder =16
                    FontSize =8
                    TabIndex =16
                    BackColor =8421504
                    Name ="LiefereinheitVG"
                    ControlSource ="LiefereinheitVG"
                    StatusBarText ="Liefereinheit"
                    FontName ="Arial"

                    LayoutCachedLeft =11512
                    LayoutCachedTop =1749
                    LayoutCachedWidth =12298
                    LayoutCachedHeight =2004
                End
                Begin CheckBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =12400
                    Top =1774
                    Width =185
                    Height =210
                    ColumnOrder =15
                    TabIndex =17
                    Name ="StatusLeistung"
                    ControlSource ="StatusLeistung"
                    StatusBarText ="Ja : Std sind verrechenbar / Nein: Std. nicht verrechenbar"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"
                    ControlTipText ="Ja : Std sind verrechenbar / Nein: Std. nicht verrechenbar"

                    LayoutCachedLeft =12400
                    LayoutCachedTop =1774
                    LayoutCachedWidth =12585
                    LayoutCachedHeight =1984
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =12630
                            Top =1744
                            Width =1239
                            Height =255
                            Name ="lblStatusLeistung"
                            Caption ="verrechenbar"
                            FontName ="Arial"
                            LayoutCachedLeft =12630
                            LayoutCachedTop =1744
                            LayoutCachedWidth =13869
                            LayoutCachedHeight =1999
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =8448
                    Top =1096
                    Width =5505
                    Height =255
                    ColumnOrder =22
                    FontSize =8
                    TabIndex =11
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="VG"
                    ControlSource ="VG"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Projektname"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8448
                    LayoutCachedTop =1096
                    LayoutCachedWidth =13953
                    LayoutCachedHeight =1351
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =7560
                    Top =781
                    Width =5103
                    Height =255
                    ColumnOrder =24
                    FontSize =8
                    TabIndex =8
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="Firma"
                    ControlSource ="Firma"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m3"
                    ControlTipText ="Kunde (Doppelclick zeigt alle Leistungen)"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =7560
                    LayoutCachedTop =781
                    LayoutCachedWidth =12663
                    LayoutCachedHeight =1036
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =7560
                    Top =1096
                    Width =801
                    Height =255
                    ColumnOrder =23
                    FontSize =8
                    TabIndex =10
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="ANr"
                    ControlSource ="ANr"
                    FontName ="Arial"
                    ControlTipText ="Projekt (Doppelclick zeigt alle Leistungen)"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =7560
                    LayoutCachedTop =1096
                    LayoutCachedWidth =8361
                    LayoutCachedHeight =1351
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    Left =7572
                    Top =3398
                    Width =525
                    Height =255
                    ColumnOrder =14
                    TabIndex =18
                    BackColor =15461355
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="StdAuswärts"
                    ControlSource ="StdAuswärts"
                    RowSourceType ="Table/Query"
                    StatusBarText ="Stunden auswärts"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Stunden auswärts"

                    LayoutCachedLeft =7572
                    LayoutCachedTop =3398
                    LayoutCachedWidth =8097
                    LayoutCachedHeight =3653
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    Left =9580
                    Top =3398
                    Width =525
                    Height =255
                    ColumnOrder =13
                    TabIndex =19
                    BackColor =15461355
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="Übernachtung"
                    ControlSource ="Übernachtung"
                    RowSourceType ="Table/Query"
                    StatusBarText ="Übernachtungen"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Übernachtungen"

                    LayoutCachedLeft =9580
                    LayoutCachedTop =3398
                    LayoutCachedWidth =10105
                    LayoutCachedHeight =3653
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =8224
                            Top =3398
                            Width =1275
                            Height =255
                            Name ="Bezeichnungsfeld215"
                            Caption ="Übernachtungen"
                            FontName ="Arial"
                            LayoutCachedLeft =8224
                            LayoutCachedTop =3398
                            LayoutCachedWidth =9499
                            LayoutCachedHeight =3653
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
                    Left =7560
                    Top =2052
                    Width =6366
                    Height =1247
                    ColumnOrder =27
                    FontSize =8
                    TabIndex =2
                    BackColor =15461355
                    Name ="BemLeistung"
                    ControlSource ="BemLeistung"
                    FontName ="Arial"
                    ControlTipText ="Bemerkung /Einzelheiten der erbrachten Leistung"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    TextFormat =1

                    LayoutCachedLeft =7560
                    LayoutCachedTop =2052
                    LayoutCachedWidth =13926
                    LayoutCachedHeight =3299
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =6240
                    Top =392
                    Width =1239
                    Height =340
                    TabIndex =6
                    ForeColor =0
                    Name ="btnPartner"
                    Caption ="Projektpartner"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="gehe zum Projektpartner (im Adress-Formular)"

                    LayoutCachedLeft =6240
                    LayoutCachedTop =392
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =732
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =95
                    Left =6240
                    Top =1077
                    Width =1239
                    Height =340
                    TabIndex =9
                    ForeColor =0
                    Name ="btnProjekt"
                    Caption ="Projekt"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="gehe zum Projekt"

                    LayoutCachedLeft =6240
                    LayoutCachedTop =1077
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =1417
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =14230
                    Top =449
                    Width =7874
                    Height =1021
                    ColumnOrder =26
                    FontSize =8
                    TabIndex =3
                    BackColor =13952764
                    Name ="InfoLeistung"
                    ControlSource ="InfoLeistung"
                    StatusBarText ="Infos zur erbrachten Leistung (wird nicht ausgedruckt)!"
                    FontName ="Arial"
                    ControlTipText ="interne Informationen"
                    ConditionalFormat = Begin
                        0x0100000088000000010000000100000000000000000000001300000001010000 ,
                        0xffffff00ff000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b005300740061007400750073004c00650069007300740075006e0067005d00 ,
                        0x3d00300000000000
                    End
                    TextFormat =1

                    LayoutCachedLeft =14230
                    LayoutCachedTop =449
                    LayoutCachedWidth =22104
                    LayoutCachedHeight =1470
                    ConditionalFormat14 = Begin
                        0x010001000000010000000000000001010000ffffff00ff000000120000005b00 ,
                        0x5300740061007400750073004c00650069007300740075006e0067005d003d00 ,
                        0x3000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =7560
                    Top =1397
                    Width =6390
                    Height =255
                    ColumnOrder =21
                    FontSize =8
                    TabIndex =12
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="Artikel"
                    ControlSource ="Artikel"
                    FontName ="Arial"
                    ControlTipText ="Artikel\015\012grün = Bereits verrechnet\015\012gelb = noch offen"
                    ConditionalFormat = Begin
                        0x01000000e0000000030000000100000000000000000000001300000001000000 ,
                        0x00000000ed1c24000100000000000000140000002b0000000100000000000000 ,
                        0xa7da4e0001000000000000002c0000003f0000000100000000000000fff20000 ,
                        0x5b005300740061007400750073004c00650069007300740075006e0067005d00 ,
                        0x3d003000000000005b004e0072005600470064006500740052005d0020004900 ,
                        0x730020004e006f00740020004e0075006c006c00000000005b004e0072005600 ,
                        0x670064006500740052005d0020004900730020004e0075006c006c0000000000
                    End

                    LayoutCachedLeft =7560
                    LayoutCachedTop =1397
                    LayoutCachedWidth =13950
                    LayoutCachedHeight =1652
                    ConditionalFormat14 = Begin
                        0x01000300000001000000000000000100000000000000ed1c2400120000005b00 ,
                        0x5300740061007400750073004c00650069007300740075006e0067005d003d00 ,
                        0x3000000000000000000000000000000000000000000000010000000000000001 ,
                        0x00000000000000a7da4e00160000005b004e0072005600470064006500740052 ,
                        0x005d0020004900730020004e006f00740020004e0075006c006c000000000000 ,
                        0x0000000000000000000000000000000001000000000000000100000000000000 ,
                        0xfff20000120000005b004e0072005600670064006500740052005d0020004900 ,
                        0x730020004e0075006c006c000000000000000000000000000000000000000000 ,
                        0x00
                    End
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =3
                            Left =6210
                            Top =1397
                            Width =1239
                            Height =255
                            Name ="Bezeichnungsfeld222"
                            Caption ="Artikel"
                            FontName ="Arial"
                            LayoutCachedLeft =6210
                            LayoutCachedTop =1397
                            LayoutCachedWidth =7449
                            LayoutCachedHeight =1652
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =8589
                    Top =1690
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =14
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
                        0x006d2776000000000000000000000000c0b96068a434d8010700000000010000 ,
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
                        0x006d277600000000000000000000000050db0738adf2d4010500000000010000 ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000b65 ,
                        0xfc0b0b6500021400880800000200000000000000c001000046020000340c0b65 ,
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
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000b65 ,
                        0xfc0b0b6500021400880800000200000000000000c001000046020000340c0b65 ,
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

                    LayoutCachedLeft =8589
                    LayoutCachedTop =1690
                    LayoutCachedWidth =8843
                    LayoutCachedHeight =2020
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =3
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =10227
                    Top =1715
                    Width =1026
                    Height =255
                    ColumnOrder =28
                    FontSize =8
                    TabIndex =1
                    BackColor =15461355
                    Name ="AnzahlLeistung"
                    ControlSource ="AnzahlLeistung"
                    Format ="Fixed"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Anzahl in Std. mit + / - Taste verändern\015\012mit Doppel-Klick um 1 erhöhen"
                    ConditionalFormat = Begin
                        0x0100000072000000030000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000200000002000000040000000100000000000000 ,
                        0xed1c2400000000000400000005000000080000000100000000000000ffc20e00 ,
                        0x000000003000000000003100300000000000
                    End

                    LayoutCachedLeft =10227
                    LayoutCachedTop =1715
                    LayoutCachedWidth =11253
                    LayoutCachedHeight =1970
                    ConditionalFormat14 = Begin
                        0x01000400000002000000000000000100000000000000ffffff00000000000000 ,
                        0x0000000000000000000000000000000000000000000000020000000100000000 ,
                        0x000000ed1c240001000000300000000000000000000000000000000000000000 ,
                        0x000000000000040000000100000000000000ffc20e0002000000310030000000 ,
                        0x0000000000000000000000000000000000000000000000000000000100000000 ,
                        0x000000a7da4e000300000030002e003100020000003100300000000000000000 ,
                        0x00000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9459
                            Top =1715
                            Width =684
                            Height =255
                            Name ="Bezeichnungsfeld219"
                            Caption ="Anzahl"
                            FontName ="Arial"
                            LayoutCachedLeft =9459
                            LayoutCachedTop =1715
                            LayoutCachedWidth =10143
                            LayoutCachedHeight =1970
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =215
                    Left =11253
                    Top =1719
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =15
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
                        0x006d27760000000000000000000000008027cd1e14c9d8010700000000010000 ,
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
                        0x006d27760000000000000000000000001059f1c900c9d8010500000000010000 ,
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
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000002000 ,
                        0x54005f0000021400880800006400000000000000c00100004602000047004400 ,
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
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000002000 ,
                        0x54005f0000021400880800006300000000000000c00100004602000047004400 ,
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

                    LayoutCachedLeft =11253
                    LayoutCachedTop =1719
                    LayoutCachedWidth =11507
                    LayoutCachedHeight =2049
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2553
                    Left =10747
                    Top =3398
                    Width =585
                    Height =255
                    ColumnOrder =12
                    TabIndex =20
                    Name ="LandAuswärts"
                    ControlSource ="LandAuswärts"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;1701"
                    StatusBarText ="Land"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Land für Übernachtung / Stunden auswärts"

                    LayoutCachedLeft =10747
                    LayoutCachedTop =3398
                    LayoutCachedWidth =11332
                    LayoutCachedHeight =3653
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =10237
                            Top =3398
                            Width =435
                            Height =255
                            Name ="Bezeichnungsfeld216"
                            Caption ="Land"
                            FontName ="Arial"
                            LayoutCachedLeft =10237
                            LayoutCachedTop =3398
                            LayoutCachedWidth =10672
                            LayoutCachedHeight =3653
                        End
                    End
                End
                Begin Label
                    OverlapFlags =85
                    Left =6268
                    Top =3398
                    Width =1230
                    Height =255
                    Name ="Bezeichnungsfeld214"
                    Caption ="auswärtige Std."
                    FontName ="Arial"
                    LayoutCachedLeft =6268
                    LayoutCachedTop =3398
                    LayoutCachedWidth =7498
                    LayoutCachedHeight =3653
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =10890
                    Width =2268
                    Height =285
                    ColumnOrder =11
                    FontSize =8
                    TabIndex =21
                    ForeColor =9868950
                    Name ="Printmarkerleistung"
                    ControlSource ="Printmarkerleistung"
                    FontName ="Arial"
                    ControlTipText ="Printmarkerleistung"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =10890
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =11175
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =22110
                            Top =10890
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld285"
                            Caption ="PrintMarker"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =10890
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =11175
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =14230
                    Top =3408
                    Width =2931
                    Height =480
                    ColumnOrder =10
                    FontSize =8
                    TabIndex =22
                    BackColor =15266810
                    ForeColor =9868950
                    Name ="NrVGdetR"
                    ControlSource ="NrVGdetR"
                    FontName ="Arial"
                    ControlTipText ="NrVGDetR ID des Rechungsdetails (NrVGDet aus T_VGDET)"
                    ConditionalFormat = Begin
                        0x0100000066000000010000000000000004000000000000000200000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x300000000000
                    End

                    LayoutCachedLeft =14230
                    LayoutCachedTop =3408
                    LayoutCachedWidth =17161
                    LayoutCachedHeight =3888
                    ConditionalFormat14 = Begin
                        0x01000100000000000000040000000100000000000000a7da4e00010000003000 ,
                        0x000000000000000000000000000000000000000000
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =7
                    Left =45
                    Top =3968
                    Width =5954
                    Height =7996
                    ColumnOrder =9
                    TabIndex =23
                    BackColor =16773098
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;907;285;567;1701;2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (1) Daten für Leistung\015\012Verwenden Sie die Pfeiltaste"
                        "n, um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =45
                    LayoutCachedTop =3968
                    LayoutCachedWidth =5999
                    LayoutCachedHeight =11964
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1024
                    Top =3720
                    Width =4644
                    Height =227
                    ColumnOrder =17
                    FontSize =8
                    FontWeight =600
                    TabIndex =24
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern\015\012*:"
                        "Wildcard-Suche\015\012nach ID suchen: ID:xxxxx"
                    AsianLineBreak =255

                    LayoutCachedLeft =1024
                    LayoutCachedTop =3720
                    LayoutCachedWidth =5668
                    LayoutCachedHeight =3947
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =45
                    Top =30
                    Width =1758
                    Height =2835
                    ColumnOrder =6
                    TabIndex =25
                    BackColor =16773098
                    Name ="lstAktiv"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Auswahl nach Status / Jahr / Monat"

                    LayoutCachedLeft =45
                    LayoutCachedTop =30
                    LayoutCachedWidth =1803
                    LayoutCachedHeight =2865
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =45
                    Top =3720
                    Width =849
                    Height =227
                    ColumnOrder =5
                    FontSize =8
                    FontWeight =600
                    TabIndex =26
                    BackColor =12975858
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =45
                    LayoutCachedTop =3720
                    LayoutCachedWidth =894
                    LayoutCachedHeight =3947
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =5753
                    Top =3720
                    Width =246
                    Height =227
                    ColumnOrder =8
                    TabIndex =27
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="luye;aci;kunz;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste der zuletzt erfassten Sucheinträge"

                    LayoutCachedLeft =5753
                    LayoutCachedTop =3720
                    LayoutCachedWidth =5999
                    LayoutCachedHeight =3947
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =10125
                    Width =2268
                    Height =285
                    ColumnOrder =7
                    FontSize =8
                    TabIndex =28
                    ForeColor =9868950
                    Name ="Leistungerfasst"
                    ControlSource ="Leistungerfasst"
                    FontName ="Arial"
                    ControlTipText ="ID"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =10125
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =10410
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =22110
                            Top =10125
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld232"
                            Caption ="erfasst am"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =10125
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =10410
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =255
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =10635
                    Width =2268
                    Height =285
                    ColumnOrder =1
                    FontSize =8
                    TabIndex =29
                    ForeColor =8421504
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =23301
                    LayoutCachedTop =10635
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =10920
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =10635
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld38"
                            Caption ="letzteÄnd."
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =10635
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =10920
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =10380
                    Width =2268
                    Height =285
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =30
                    ForeColor =8421504
                    Name ="whoUpdate"
                    ControlSource ="whoUpdate"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Artikel Update von .."

                    LayoutCachedLeft =23301
                    LayoutCachedTop =10380
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =10665
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =10380
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld37"
                            Caption ="geändert"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =10380
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =10665
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =247
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =9870
                    Width =2268
                    Height =285
                    ColumnOrder =3
                    FontSize =8
                    TabIndex =31
                    ForeColor =9868950
                    Name ="Markerleistung"
                    ControlSource ="Markerleistung"
                    FontName ="Arial"
                    ControlTipText ="ID"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =9870
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =10155
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =9870
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld234"
                            Caption ="Marker"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =9870
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =10155
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1871
                    Top =30
                    Width =1134
                    Height =1299
                    TabIndex =32
                    BackColor =16773098
                    Name ="lstTopA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Wieviele Datensätze sollen gezeigt werden"

                    LayoutCachedLeft =1871
                    LayoutCachedTop =30
                    LayoutCachedWidth =3005
                    LayoutCachedHeight =1329
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =8979
                    Top =1720
                    Width =441
                    Height =255
                    FontSize =8
                    TabIndex =33
                    BackColor =15461355
                    Name ="DatumTagTTT"
                    ControlSource ="DatumTag"
                    Format ="ddd"
                    StatusBarText ="Tag"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Datum für Stundenerfassung"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8979
                    LayoutCachedTop =1720
                    LayoutCachedWidth =9420
                    LayoutCachedHeight =1975
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1871
                    Top =1404
                    Width =1134
                    Height =2268
                    TabIndex =34
                    BackColor =16773098
                    Name ="lstMitarbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Wieviele Datensätze sollen gezeigt werden (nur meine oder Alle = von allen Mitar"
                        "beitern)"

                    LayoutCachedLeft =1871
                    LayoutCachedTop =1404
                    LayoutCachedWidth =3005
                    LayoutCachedHeight =3672
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =17209
                    Top =1528
                    Width =4919
                    Height =2360
                    TabIndex =35
                    BackColor =10092543
                    Name ="lstBem"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Trage in Bemerkung ein..."

                    LayoutCachedLeft =17209
                    LayoutCachedTop =1528
                    LayoutCachedWidth =22128
                    LayoutCachedHeight =3888
                End
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =10625
                    Top =453
                    Width =2038
                    Height =255
                    FontSize =8
                    TabIndex =36
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="telefon"
                    ControlSource ="telefon"
                    FontName ="Arial"
                    ControlTipText ="Telefon-Nummer des Ansprechpartners \015\012Diese Nummer wird gewählt beim Doppe"
                        "lclicken oder wenn das Telefon-Symbol gedrückt wird"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =10625
                    LayoutCachedTop =453
                    LayoutCachedWidth =12663
                    LayoutCachedHeight =708
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =7560
                    Top =453
                    Width =2970
                    Height =255
                    FontSize =8
                    TabIndex =37
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="NamePerson"
                    ControlSource ="vornachname"
                    FontName ="Arial"
                    Tag ="m3"
                    ControlTipText ="Unser Projektpartner"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =7560
                    LayoutCachedTop =453
                    LayoutCachedWidth =10530
                    LayoutCachedHeight =708
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =6240
                    Top =2052
                    Width =1239
                    Height =567
                    TabIndex =38
                    ForeColor =0
                    Name ="btnBemleistung"
                    Caption ="Bemerkungen editieren"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Editiermodus öffnen"
                    LeftPadding =60
                    TopPadding =60
                    RightPadding =60
                    BottomPadding =60

                    LayoutCachedLeft =6240
                    LayoutCachedTop =2052
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =2619
                    BackColor =65535
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =14230
                    Top =30
                    Width =7874
                    Height =340
                    TabIndex =39
                    ForeColor =0
                    Name ="btnInfoLeistung"
                    Caption ="Infos eintragen / editieren"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte 20 Einträge anbieten oder Editiermodus öffnen"

                    LayoutCachedLeft =14230
                    LayoutCachedTop =30
                    LayoutCachedWidth =22104
                    LayoutCachedHeight =370
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =14230
                    Top =2895
                    Width =2928
                    Height =420
                    TabIndex =40
                    ForeColor =255
                    Name ="btnRech"
                    Caption ="Rechnung  erstellen?"
                    StatusBarText ="Rechnungen anschauen/ erstellen"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddd000000000000000dd00005555555500d ,
                        0xdd0005dddddddd0dddd0005ddddddddddddd0000ddddddddddddd5000ddddddd ,
                        0xdddddd5000ddddddddddddd5000ddddddddddd5000ddddddddddd5000ddddddd ,
                        0xdddd5005ddddddddddd0005ddddddddddd0005dddddddd0dd00005555555500d ,
                        0x000000000000000d000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
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
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Rechnungen anschauen/ erstellen"

                    LayoutCachedLeft =14230
                    LayoutCachedTop =2895
                    LayoutCachedWidth =17158
                    LayoutCachedHeight =3315
                    PictureCaptionArrangement =5
                    Overlaps =1
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =15937
                    Top =2299
                    Width =1194
                    Height =255
                    FontSize =8
                    TabIndex =41
                    BackColor =10092543
                    Name ="Rechnungvon"
                    Format ="Short Date"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    ControlTipText ="Rechnungen erfassen ab Datum ....(kann mit +/- Taste verändert werden)\015\012ma"
                        "x. 365 Tage in die Vergangenheit"

                    LayoutCachedLeft =15937
                    LayoutCachedTop =2299
                    LayoutCachedWidth =17131
                    LayoutCachedHeight =2554
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =14230
                            Top =2299
                            Width =1245
                            Height =255
                            Name ="Bezeichnungsfeld265"
                            Caption ="Leistungen von "
                            FontName ="Arial"
                            LayoutCachedLeft =14230
                            LayoutCachedTop =2299
                            LayoutCachedWidth =15475
                            LayoutCachedHeight =2554
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =15937
                    Top =2583
                    Width =1194
                    Height =255
                    FontSize =8
                    TabIndex =42
                    BackColor =10092543
                    Name ="Rechnungbis"
                    Format ="Short Date"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyPress ="[Event Procedure]"
                    ControlTipText ="Rechnungen erfassen bis zum ....(kann mit +/- Taste verändert werden)\015\012mit"
                        " Doppelclick heutiges Datum eintragen...."

                    LayoutCachedLeft =15937
                    LayoutCachedTop =2583
                    LayoutCachedWidth =17131
                    LayoutCachedHeight =2838
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =14230
                            Top =2583
                            Width =1245
                            Height =255
                            Name ="Bezeichnungsfeld267"
                            Caption ="bis "
                            FontName ="Arial"
                            LayoutCachedLeft =14230
                            LayoutCachedTop =2583
                            LayoutCachedWidth =15475
                            LayoutCachedHeight =2838
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =15654
                    Top =2299
                    Width =283
                    Height =249
                    AutoActivate =1
                    TabIndex =43
                    Name ="SpinButtonRechnungVon"
                    OleData = Begin
                        0x00100000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
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
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000d037cb73d376d1010900000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000014000000 ,
                        0x0000000008000000fdffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffff ,
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
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d27760000000000000000000000003028a85cfe76d1010600000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000014000000 ,
                        0x00000000ffffffffffffffff05000000fdfffffffefffffffefffffffeffffff ,
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
                        0xfffffffffefffffffeffffff03000000fefffffffefffffffeffffffffffffff ,
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
                        0xffffffff03004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000038000000 ,
                        0x0000000002004f006c0065005000720065007300300030003000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000180002010100000004000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000024000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000400000001000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000038000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000000000000 ,
                        0x000000000100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000066656c64 ,
                        0x00100000000210000808000000000000f4010000b701000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                        0x0000000001000002000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =15654
                    LayoutCachedTop =2299
                    LayoutCachedWidth =15937
                    LayoutCachedHeight =2548
                End
                Begin CustomControl
                    Enabled = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =15654
                    Top =2608
                    Width =283
                    Height =249
                    AutoActivate =1
                    TabIndex =44
                    Name ="SpinButtonRechnungBis"
                    OleData = Begin
                        0x00100000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
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
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000e05ecb73d376d1010900000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000018000000 ,
                        0x0000000008000000fdffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffff ,
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
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d27760000000000000000000000003028a85cfe76d1010600000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000018000000 ,
                        0x00000000ffffffffffffffff05000000fdfffffffefffffffefffffffeffffff ,
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
                        0xfffffffffefffffffeffffff03000000fefffffffefffffffeffffffffffffff ,
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
                        0xffffffff03004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000038000000 ,
                        0x0000000002004f006c0065005000720065007300300030003000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000180002010100000004000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000024000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000400000001000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000038000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000000000000 ,
                        0x000000000100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000066656c64 ,
                        0x0010000000021400880800003700000000000000f4010000b70100006d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                        0x0000000001000002000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =15654
                    LayoutCachedTop =2608
                    LayoutCachedWidth =15937
                    LayoutCachedHeight =2857
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =6293
                    Top =3970
                    Width =2268
                    Height =2274
                    FontWeight =700
                    TabIndex =45
                    BackColor =12975858
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =6293
                    LayoutCachedTop =3970
                    LayoutCachedWidth =8561
                    LayoutCachedHeight =6244
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =6293
                    Top =6649
                    Width =2268
                    Height =5315
                    FontWeight =700
                    TabIndex =46
                    BackColor =12975858
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =6293
                    LayoutCachedTop =6649
                    LayoutCachedWidth =8561
                    LayoutCachedHeight =11964
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    ColumnCount =11
                    Left =8844
                    Top =3970
                    Width =13269
                    Height =7994
                    TabIndex =47
                    BackColor =16773098
                    Name ="lstD"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;0;567;851;2268;2835;1134;3686;1134;567"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ShortcutMenuBar ="cbF_Leistung"

                    LayoutCachedLeft =8844
                    LayoutCachedTop =3970
                    LayoutCachedWidth =22113
                    LayoutCachedHeight =11964
                End
                Begin TextBox
                    Visible = NotDefault
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =11906
                    Top =87
                    Width =969
                    Height =255
                    FontSize =8
                    TabIndex =48
                    BackColor =10092543
                    Name ="kurzzeichen"
                    ControlSource ="kurzzeichen"
                    StatusBarText ="Tag"
                    FontName ="Arial"

                    LayoutCachedLeft =11906
                    LayoutCachedTop =87
                    LayoutCachedWidth =12875
                    LayoutCachedHeight =342
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =255
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =11155
                    Width =2268
                    Height =285
                    FontSize =8
                    TabIndex =49
                    ForeColor =9868950
                    Name ="nrVGDet"
                    ControlSource ="nrVGDet"
                    FontName ="Arial"
                    ControlTipText ="nrVGDET = ID aus T_VGDET"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =11155
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =11440
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =11155
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld287"
                            Caption ="ID VGDET"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =11155
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =11440
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =12792
                    Top =781
                    Width =1161
                    Height =255
                    FontSize =8
                    TabIndex =50
                    BackColor =15461355
                    BorderColor =16711680
                    Name ="projektNr"
                    ControlSource ="projektNr"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ProjektNr\015\012Doppelclick zeigt alle Leistungen dieser Projekt-Nr."
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =12792
                    LayoutCachedTop =781
                    LayoutCachedWidth =13953
                    LayoutCachedHeight =1036
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =12949
                    Top =87
                    Width =969
                    Height =255
                    FontSize =8
                    TabIndex =51
                    BackColor =10092543
                    Name ="f0"
                    ControlSource ="nrleistung"
                    StatusBarText ="Tag"
                    FontName ="Arial"

                    LayoutCachedLeft =12949
                    LayoutCachedTop =87
                    LayoutCachedWidth =13918
                    LayoutCachedHeight =342
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =6293
                    Top =6323
                    Width =2268
                    Height =227
                    FontSize =8
                    FontWeight =600
                    TabIndex =52
                    BackColor =12975858
                    Name ="countM"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze in der Liste rechts"
                    AsianLineBreak =255

                    LayoutCachedLeft =6293
                    LayoutCachedTop =6323
                    LayoutCachedWidth =8561
                    LayoutCachedHeight =6550
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =45
                    Top =2919
                    Width =1758
                    Height =753
                    TabIndex =53
                    BackColor =16773098
                    Name ="lstOB"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Sortieurng der Filter-Liste"

                    LayoutCachedLeft =45
                    LayoutCachedTop =2919
                    LayoutCachedWidth =1803
                    LayoutCachedHeight =3672
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =6240
                    Top =2739
                    Width =1239
                    Height =567
                    TabIndex =54
                    ForeColor =0
                    Name ="btnBemleistungtextBaustein"
                    Caption ="Textbaustein..."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Im Lexikon hinterlegten Textbaustein auswählen und zuordnen"

                    LayoutCachedLeft =6240
                    LayoutCachedTop =2739
                    LayoutCachedWidth =7479
                    LayoutCachedHeight =3306
                    Overlaps =1
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    MultiSelect =2
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =22280
                    Top =345
                    Width =5103
                    Height =9047
                    TabIndex =55
                    BackColor =10092543
                    Name ="lstKontakt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Mitarbeiter der aktuell angewählten Firma.\015\012Mit Doppelklick anzeigen lasse"
                        "n.\015\012Mit CRTL/SHIFT auch mehrere anwählen"

                    LayoutCachedLeft =22280
                    LayoutCachedTop =345
                    LayoutCachedWidth =27383
                    LayoutCachedHeight =9392
                End
                Begin TextBox
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =255
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =11410
                    Width =2268
                    Height =285
                    FontSize =8
                    TabIndex =56
                    ForeColor =9868950
                    Name ="IDFunktion"
                    ControlSource ="IDFunktion"
                    FontName ="Arial"
                    ControlTipText ="IDFunktion des Kunden"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =11410
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =11695
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =11410
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld301"
                            Caption ="ID NrFunktion"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =11410
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =11695
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =23301
                    Top =11665
                    Width =2268
                    Height =285
                    FontSize =8
                    TabIndex =57
                    ForeColor =9868950
                    Name ="NrFirma"
                    ControlSource ="NrFirma"
                    FontName ="Arial"
                    ControlTipText ="NrFirma"

                    LayoutCachedLeft =23301
                    LayoutCachedTop =11665
                    LayoutCachedWidth =25569
                    LayoutCachedHeight =11950
                    Begin
                        Begin Label
                            OverlapFlags =223
                            TextAlign =3
                            Left =22110
                            Top =11665
                            Width =1134
                            Height =285
                            BackColor =12632256
                            Name ="Bezeichnungsfeld302"
                            Caption ="ID NrFirma"
                            FontName ="Arial"
                            LayoutCachedLeft =22110
                            LayoutCachedTop =11665
                            LayoutCachedWidth =23244
                            LayoutCachedHeight =11950
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =7560
                    Top =87
                    Width =2970
                    Height =255
                    TabIndex =58
                    BackColor =15461355
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="NrBearbeiter"
                    ControlSource ="NrBearbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Mitarbeiter"

                    LayoutCachedLeft =7560
                    LayoutCachedTop =87
                    LayoutCachedWidth =10530
                    LayoutCachedHeight =342
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =3119
                    Top =30
                    Width =2835
                    Height =3600
                    TabIndex =59
                    BackColor =16773098
                    Name ="lstKunde"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Alle Kunden mit nicht abgeschlossenen Projekten"

                    LayoutCachedLeft =3119
                    LayoutCachedTop =30
                    LayoutCachedWidth =5954
                    LayoutCachedHeight =3630
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =12812
                    Top =396
                    Width =737
                    Height =340
                    TabIndex =60
                    ForeColor =0
                    Name ="btnTelefon"
                    Caption ="Telefon"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddada00dada00dada ,
                        0xada0000000000dadda077770077770daad07770ff07770adda0770f77f0770da ,
                        0xad070f7007f070addad00f7007f00adaa00070f77f07000d0777070ff0707770 ,
                        0x0777077007707770d07770000007770aad007777777700addada00000000dada ,
                        0xadadadadadadadad
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Willi Köhli anrufen mit der Tel.-Nr.: +41 323916278"

                    LayoutCachedLeft =12812
                    LayoutCachedTop =396
                    LayoutCachedWidth =13549
                    LayoutCachedHeight =736
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =34
                    BackStyle =0
                    IMESentenceMode =3
                    Left =12651
                    Top =3398
                    Width =1275
                    Height =255
                    FontSize =8
                    TabIndex =61
                    BackColor =16777215
                    Name ="SumLeistungLand"
                    ControlSource ="SumLeistungLand"
                    FontName ="Arial"
                    ControlTipText ="Betrag in Landeswährung"

                    LayoutCachedLeft =12651
                    LayoutCachedTop =3398
                    LayoutCachedWidth =13926
                    LayoutCachedHeight =3653
                End
                Begin TextBox
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =23619
                    Top =28
                    Width =3744
                    Height =255
                    FontSize =8
                    TabIndex =62
                    BackColor =10092543
                    Name ="txtfindKontakt"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Person suchen Vorname und/oder Nachname oder Kurzzeichen"

                    LayoutCachedLeft =23619
                    LayoutCachedTop =28
                    LayoutCachedWidth =27363
                    LayoutCachedHeight =283
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =22280
                            Top =28
                            Width =1245
                            Height =255
                            Name ="lbltxtfindKontakt"
                            Caption ="Person suchen"
                            FontName ="Arial"
                            LayoutCachedLeft =22280
                            LayoutCachedTop =28
                            LayoutCachedWidth =23525
                            LayoutCachedHeight =283
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Leistung.cls"
