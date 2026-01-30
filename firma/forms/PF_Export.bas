Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoResize = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =3
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =55
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =16443
    DatasheetFontHeight =10
    ItemSuffix =6
    Top =2775
    Right =28545
    Bottom =15345
    Tag ="Faktura"
    RecSrcDt = Begin
        0x26b2fc96d704e340
    End
    Caption ="Export"
    DatasheetFontName ="Arial"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
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
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin Section
            Height =5261
            BackColor =-2147483633
            Name ="Detailbereich"
            Begin
                Begin CommandButton
                    OverlapFlags =93
                    Left =5103
                    Top =113
                    Width =5103
                    Height =345
                    ForeColor =0
                    Name ="btnExportOhne"
                    Caption ="1. Export Daten zuerst als Tabelle anschauen (OHNE Dokumente)"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="geht schneller"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =113
                    LayoutCachedWidth =10206
                    LayoutCachedHeight =458
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =284
                    Top =736
                    Width =1418
                    Height =345
                    TabIndex =1
                    ForeColor =0
                    Name ="btnvonDat"
                    Caption ="von  "
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Kalender öffnen"

                    LayoutCachedLeft =284
                    LayoutCachedTop =736
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =1081
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =1985
                    Top =786
                    Width =851
                    TabIndex =2
                    Name ="vonDat"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()-7"
                    FontName ="Arial"
                    ControlTipText ="Von....."
                    AsianLineBreak =0

                    LayoutCachedLeft =1985
                    LayoutCachedTop =786
                    LayoutCachedWidth =2836
                    LayoutCachedHeight =1026
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =284
                    Top =1201
                    Width =1418
                    Height =345
                    TabIndex =3
                    ForeColor =0
                    Name ="btnBisDat"
                    Caption ="bis  "
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Kalender öffnen"

                    LayoutCachedLeft =284
                    LayoutCachedTop =1201
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =1546
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =1985
                    Top =1251
                    Width =851
                    TabIndex =4
                    Name ="BisDat"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Bis....."
                    AsianLineBreak =0

                    LayoutCachedLeft =1985
                    LayoutCachedTop =1251
                    LayoutCachedWidth =2836
                    LayoutCachedHeight =1491
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =284
                    Top =226
                    Width =4536
                    TabIndex =5
                    Name ="TextFile"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Pfad Textfile"
                    AsianLineBreak =0

                    LayoutCachedLeft =284
                    LayoutCachedTop =226
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =466
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =284
                    Top =2108
                    Width =4536
                    Height =681
                    TabIndex =6
                    ForeColor =0
                    Name ="btnStartExport"
                    Caption ="2. Export nach Faktura ausführen\015\012(und DMS-Dokumente zuordnen)"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Schliessen"

                    LayoutCachedLeft =284
                    LayoutCachedTop =2108
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =2789
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =3402
                    Top =736
                    Width =1418
                    Height =795
                    TabIndex =7
                    ForeColor =0
                    Name ="btnVG"
                    Caption ="zeige entsprechende Vorgänge"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =3402
                    LayoutCachedTop =736
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =1531
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =288
                    Top =2856
                    Width =1418
                    Height =576
                    TabIndex =8
                    ForeColor =0
                    Name ="btnClose"
                    Caption ="bis"
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadad0dadadadadaadad00adadadadaddad030dadadadada ,
                        0xad0330adadadadad0033300000000adaa03330ff0dadadadd03300ff0adad4da ,
                        0xa03330ff0dad44add03330ff0ad44444a03330ff0d444444d03330ff0ad44444 ,
                        0xa0330fff0dad44add030ffff0adad4daa00fffff0dadadadd00000000adadada ,
                        0xadadadadadadadad
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Formular schliessen"

                    LayoutCachedLeft =288
                    LayoutCachedTop =2856
                    LayoutCachedWidth =1706
                    LayoutCachedHeight =3432
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    ColumnCount =10
                    Left =5103
                    Top =458
                    Width =11340
                    Height =4803
                    TabIndex =9
                    Name ="lstFaktura"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="853;1134;857;2835;857;857;1134;1701;567;0"
                    FontName ="Arial"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =458
                    LayoutCachedWidth =16443
                    LayoutCachedHeight =5261
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =3119
                    Top =735
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =10
                    Name ="SpinButtonvonDat"
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
                        0x006d2776000000000000000000000000b0219b2c0259c8010700000000010000 ,
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
                        0x006d2776000000000000000000000000709c051e0259c80105000000c0000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000001200020102000000ffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000007a000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
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
                        0xffffffff01000000fefffffffeffffffffffffffffffffffffffffffffffffff ,
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
                        0xffffffff0100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000000 ,
                        0x0000000000021400880800004700000000000000c00100004602000000000000 ,
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
                        0x00000000feffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
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
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000000 ,
                        0x0000000000021400880800004700000000000000c00100004602000000000000 ,
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

                    LayoutCachedLeft =3119
                    LayoutCachedTop =735
                    LayoutCachedWidth =3373
                    LayoutCachedHeight =1065
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =85
                    Left =3119
                    Top =1213
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =11
                    Name ="SpinButtonbisDat"
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
                        0x006d2776000000000000000000000000b053ed930259c8010700000000010000 ,
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
                        0x006d277600000000000000000000000070d1b72c0259c80105000000c0000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000001200020102000000ffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000007a000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
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
                        0xffffffff01000000fefffffffeffffffffffffffffffffffffffffffffffffff ,
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
                        0xffffffff0100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1f0000004d6963726f736f667420466f726d7320322e30205370696e42757474 ,
                        0x6f6e0010000000456d626564646564204f626a6563740013000000466f726d73 ,
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000000 ,
                        0x0000000000021400880800004700000000000000c00100004602000000000000 ,
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
                        0x00000000feffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
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
                        0x2e5370696e427574746f6e2e3100f439b2710000000000000000000000000000 ,
                        0x0000000000021400880800004700000000000000c00100004602000000000000 ,
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

                    LayoutCachedLeft =3119
                    LayoutCachedTop =1213
                    LayoutCachedWidth =3373
                    LayoutCachedHeight =1543
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    ListRows =20
                    ListWidth =3402
                    Left =1985
                    Top =1708
                    Width =2835
                    Height =255
                    TabIndex =12
                    ConditionalFormat = Begin
                        0x01000000cc000000030000000000000002000000000000000800000001000000 ,
                        0x00000000a7da4e000000000002000000090000001f0000000100000000000000 ,
                        0xfff200000000000002000000200000003500000001000000ffffff00ed1c2400 ,
                        0x22004400410054004500560022000000000022004e004f004300480020004e00 ,
                        0x4900430048005400200069006e00200044004100540045005600220000000000 ,
                        0x22006e006f006300680020007a00750020006200650061007200620065006900 ,
                        0x740065006e00220000000000
                    End
                    Name ="VGStatus"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"NOCH NICHT in DATEV\""
                    FontName ="Arial"
                    ControlTipText ="Status"

                    LayoutCachedLeft =1985
                    LayoutCachedTop =1708
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =1963
                    ConditionalFormat14 = Begin
                        0x01000300000000000000020000000100000000000000a7da4e00070000002200 ,
                        0x4400410054004500560022000000000000000000000000000000000000000000 ,
                        0x0000000000020000000100000000000000fff200001500000022004e004f0043 ,
                        0x00480020004e004900430048005400200069006e002000440041005400450056 ,
                        0x0022000000000000000000000000000000000000000000000000000002000000 ,
                        0x01000000ffffff00ed1c24001400000022006e006f006300680020007a007500 ,
                        0x20006200650061007200620065006900740065006e0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =284
                    Top =1666
                    Width =1418
                    Height =345
                    TabIndex =13
                    ForeColor =0
                    Name ="btnStatus"
                    Caption ="Status"
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Infos zu Status"

                    LayoutCachedLeft =284
                    LayoutCachedTop =1666
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =2011
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =13041
                    Top =113
                    Width =3402
                    Height =345
                    TabIndex =14
                    ForeColor =0
                    Name ="btnDMS"
                    Caption ="Zeige markiertes Dokument"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =13041
                    LayoutCachedTop =113
                    LayoutCachedWidth =16443
                    LayoutCachedHeight =458
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =95
                    Left =10206
                    Top =120
                    Height =345
                    TabIndex =15
                    ForeColor =0
                    Name ="btnExport"
                    Caption ="...MIT Dokumenten"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="1. Export Daten zuerst als Tabelle anschauen (MIT Dokumenten, dauert etwas länge"
                        "r)"

                    LayoutCachedLeft =10206
                    LayoutCachedTop =120
                    LayoutCachedWidth =11907
                    LayoutCachedHeight =465
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Export.cls"
