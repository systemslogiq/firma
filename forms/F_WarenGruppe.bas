Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    TabularFamily =115
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18015
    DatasheetFontHeight =10
    ItemSuffix =39
    Right =25530
    Bottom =12600
    OnUnload ="[Event Procedure]"
    Tag ="WarenGruppe"
    RecSrcDt = Begin
        0x030d99c4d353e540
    End
    Caption ="Warengruppe"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
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
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            BackColor =-2147483633
            ForeColor =-2147483630
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
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
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin BoundObjectFrame
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            FELineBreak = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
            AsianLineBreak =255
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin Subform
            SpecialEffect =2
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
        Begin ToggleButton
            Width =283
            Height =283
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin Tab
            BackStyle =0
            Width =5103
            Height =3402
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
        End
        Begin Section
            Height =12615
            BackColor =-2147483633
            Name ="det"
            Begin
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =225
                    Width =1140
                    Height =255
                    FontWeight =700
                    TabIndex =10
                    Name ="f0"
                    ControlSource ="NrWarenGruppe"
                    FontName ="Arial"
                    Tag ="m1"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =225
                    LayoutCachedWidth =8511
                    LayoutCachedHeight =480
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =225
                            Width =1418
                            Height =255
                            FontWeight =700
                            Name ="NrWarenGruppe_Bezeichnungsfeld"
                            Caption ="Nr WarenGruppe"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =225
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =480
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7371
                    Top =540
                    Width =5670
                    Height =255
                    FontWeight =700
                    TabIndex =11
                    Name ="f1"
                    ControlSource ="Warengruppe"
                    FontName ="Arial"
                    Tag ="m2"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =540
                    LayoutCachedWidth =13041
                    LayoutCachedHeight =795
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =540
                            Width =1418
                            Height =255
                            Name ="Warengruppe_Bezeichnungsfeld"
                            Caption ="Warengruppe"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =540
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =795
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7371
                    Top =2154
                    Width =1134
                    Height =255
                    TabIndex =16
                    Name ="WarengruppeMWST"
                    ControlSource ="WarengruppeMWST"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =2154
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =2409
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =2154
                            Width =1418
                            Height =255
                            Name ="WarengruppeMWST_Bezeichnungsfeld"
                            Caption ="MWST in %"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =2154
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =2409
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14558
                    Top =566
                    Width =1770
                    Height =255
                    TabIndex =1
                    BackColor =12632256
                    Name ="Warengruppeerfasst"
                    ControlSource ="Warengruppeerfasst"
                    FontName ="Arial"

                    LayoutCachedLeft =14558
                    LayoutCachedTop =566
                    LayoutCachedWidth =16328
                    LayoutCachedHeight =821
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =13599
                            Top =566
                            Width =915
                            Height =255
                            Name ="Warengruppeerfasst_Bezeichnungsfeld"
                            Caption ="erfasst"
                            FontName ="Arial"
                            LayoutCachedLeft =13599
                            LayoutCachedTop =566
                            LayoutCachedWidth =14514
                            LayoutCachedHeight =821
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14558
                    Top =908
                    Width =1770
                    Height =255
                    TabIndex =2
                    BackColor =12632256
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    StatusBarText ="Last update of table"
                    FontName ="Arial"

                    LayoutCachedLeft =14558
                    LayoutCachedTop =908
                    LayoutCachedWidth =16328
                    LayoutCachedHeight =1163
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =13599
                            Top =908
                            Width =915
                            Height =255
                            Name ="LastUpdate_Bezeichnungsfeld"
                            Caption ="LastUpdate"
                            FontName ="Arial"
                            LayoutCachedLeft =13599
                            LayoutCachedTop =908
                            LayoutCachedWidth =14514
                            LayoutCachedHeight =1163
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14558
                    Top =1250
                    Width =1770
                    Height =255
                    TabIndex =3
                    BackColor =12632256
                    Name ="WhoUpdate"
                    ControlSource ="WhoUpdate"
                    StatusBarText ="Update responsible"
                    FontName ="Arial"

                    LayoutCachedLeft =14558
                    LayoutCachedTop =1250
                    LayoutCachedWidth =16328
                    LayoutCachedHeight =1505
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =13599
                            Top =1250
                            Width =915
                            Height =255
                            Name ="WhoUpdate_Bezeichnungsfeld"
                            Caption ="WhoUpdate"
                            FontName ="Arial"
                            LayoutCachedLeft =13599
                            LayoutCachedTop =1250
                            LayoutCachedWidth =14514
                            LayoutCachedHeight =1505
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ListRows =30
                    Left =7371
                    Top =1502
                    Width =1155
                    Height =255
                    FontWeight =700
                    TabIndex =13
                    Name ="WarengruppeKZ"
                    ControlSource ="WarengruppeKZ"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Kurzzeichen setzen, wenn Artikelnr generiert werden soll!"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =1502
                    LayoutCachedWidth =8526
                    LayoutCachedHeight =1757
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =1502
                            Width =1418
                            Height =255
                            Name ="Bezeichnungsfeld25"
                            Caption ="Kurzzeichen"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =1502
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =1757
                        End
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Top =1863
                    Width =5094
                    Height =10611
                    TabIndex =9
                    BackColor =14803425
                    ForeColor =0
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3119;851;851"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Liste der gefilterten (9) Daten für WarenGruppe\015\012Verwenden Sie die Pfeilta"
                        "sten, um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierun"
                        "g"

                    LayoutCachedTop =1863
                    LayoutCachedWidth =5094
                    LayoutCachedHeight =12474
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1701
                    Top =1490
                    Width =3108
                    Height =255
                    FontWeight =600
                    TabIndex =7
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"

                    LayoutCachedLeft =1701
                    LayoutCachedTop =1490
                    LayoutCachedWidth =4809
                    LayoutCachedHeight =1745
                End
                Begin TextBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =360
                    Top =1485
                    Width =849
                    Height =255
                    FontWeight =600
                    TabIndex =6
                    BackColor =12975858
                    ForeColor =0
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"

                    LayoutCachedLeft =360
                    LayoutCachedTop =1485
                    LayoutCachedWidth =1209
                    LayoutCachedHeight =1740
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =4848
                    Top =1490
                    Width =246
                    Height =255
                    TabIndex =8
                    BackColor =12975858
                    ForeColor =0
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Suchkriterien auflisten und wieder setzen"

                    LayoutCachedLeft =4848
                    LayoutCachedTop =1490
                    LayoutCachedWidth =5094
                    LayoutCachedHeight =1745
                End
                Begin Tab
                    OverlapFlags =85
                    BackStyle =1
                    Left =5670
                    Top =3750
                    Width =12345
                    Height =8865
                    TabIndex =22
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5670
                    LayoutCachedTop =3750
                    LayoutCachedWidth =18015
                    LayoutCachedHeight =12615
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5805
                            Top =4155
                            Width =12075
                            Height =8319
                            Name ="PageArtikel"
                            Caption =" Artikel"
                            LayoutCachedLeft =5805
                            LayoutCachedTop =4155
                            LayoutCachedWidth =17880
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =215
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =5952
                                    Top =4570
                                    Width =10206
                                    Height =7904
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;2552;1134;1420;1026;855;854;297"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5952
                                    LayoutCachedTop =4570
                                    LayoutCachedWidth =16158
                                    LayoutCachedHeight =12474
                                End
                                Begin CommandButton
                                    OverlapFlags =215
                                    Left =5924
                                    Top =4162
                                    Width =2838
                                    Height =340
                                    TabIndex =1
                                    Name ="btnArtikelNeu"
                                    Caption ="erstelle einen neuen Artikel..."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="erstelle einen neuen Artikel zur Firma"

                                    LayoutCachedLeft =5924
                                    LayoutCachedTop =4162
                                    LayoutCachedWidth =8762
                                    LayoutCachedHeight =4502
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5805
                            Top =4155
                            Width =12075
                            Height =8319
                            Name ="PageVorgang"
                            Caption ="Vorgänge"
                            LayoutCachedLeft =5805
                            LayoutCachedTop =4155
                            LayoutCachedWidth =17880
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =5885
                                    Top =4235
                                    Width =10206
                                    Height =8239
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5885
                                    LayoutCachedTop =4235
                                    LayoutCachedWidth =16091
                                    LayoutCachedHeight =12474
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5805
                            Top =4155
                            Width =12075
                            Height =8319
                            Name ="pgStichwort"
                            Caption ="Stichworte"
                            LayoutCachedLeft =5805
                            LayoutCachedTop =4155
                            LayoutCachedWidth =17880
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =8219
                                    Top =4229
                                    Width =9072
                                    Height =8245
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;295;1701;2268;1134;1134;293"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =8219
                                    LayoutCachedTop =4229
                                    LayoutCachedWidth =17291
                                    LayoutCachedHeight =12474
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5838
                                    Top =4209
                                    Width =1985
                                    Height =8265
                                    BackColor =12975858
                                    ForeColor =0
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =5838
                                    LayoutCachedTop =4209
                                    LayoutCachedWidth =7823
                                    LayoutCachedHeight =12474
                                End
                            End
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    ColumnCount =2
                    Left =1701
                    Top =225
                    Width =3405
                    Height =1134
                    BackColor =12975858
                    ForeColor =0
                    Name ="lstOrderBy"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste ist sortiert nach dieser Auswahl"

                    LayoutCachedLeft =1701
                    LayoutCachedTop =225
                    LayoutCachedWidth =5106
                    LayoutCachedHeight =1359
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =855
                            Top =225
                            Width =735
                            Height =675
                            FontWeight =700
                            Name ="lblcomOrderBy"
                            Caption ="sortiert nach:"
                            FontName ="Arial"
                            LayoutCachedLeft =855
                            LayoutCachedTop =225
                            LayoutCachedWidth =1590
                            LayoutCachedHeight =900
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =1284
                    Top =1440
                    Width =340
                    Height =340
                    TabIndex =5
                    Name ="btntxtFind"
                    Caption ="suchen"
                    OnClick ="[Event Procedure]"
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

                    LayoutCachedLeft =1284
                    LayoutCachedTop =1440
                    LayoutCachedWidth =1624
                    LayoutCachedHeight =1780
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Top =1440
                    Width =340
                    Height =340
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
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

                    LayoutCachedTop =1440
                    LayoutCachedWidth =340
                    LayoutCachedHeight =1780
                End
                Begin TextBox
                    DecimalPlaces =0
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7371
                    Top =840
                    Width =5670
                    Height =585
                    TabIndex =12
                    Name ="BemWarengruppe"
                    ControlSource ="BemWarengruppe"
                    FontName ="Arial"
                    Tag ="m2"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =840
                    LayoutCachedWidth =13041
                    LayoutCachedHeight =1425
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =840
                            Width =1418
                            Height =255
                            Name ="Bezeichnungsfeld30"
                            Caption ="Bemerkungen"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =840
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =1095
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7371
                    Top =1814
                    Width =1140
                    Height =255
                    TabIndex =14
                    Name ="TaxCode"
                    ControlSource ="TaxCode"
                    FontName ="Arial"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =1814
                    LayoutCachedWidth =8511
                    LayoutCachedHeight =2069
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5670
                            Top =1814
                            Width =1418
                            Height =255
                            Name ="Bezeichnungsfeld32"
                            Caption ="Tax Code"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =1814
                            LayoutCachedWidth =7088
                            LayoutCachedHeight =2069
                        End
                    End
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =7371
                    Top =2607
                    Width =1134
                    Height =255
                    FontWeight =700
                    Name ="Bezeichnungsfeld33"
                    Caption ="Einkauf"
                    FontName ="Arial"
                    LayoutCachedLeft =7371
                    LayoutCachedTop =2607
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =2862
                    BorderThemeColorIndex =0
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =8505
                    Top =2607
                    Width =1134
                    Height =255
                    FontWeight =700
                    Name ="Bezeichnungsfeld34"
                    Caption ="Verkauf"
                    FontName ="Arial"
                    LayoutCachedLeft =8505
                    LayoutCachedTop =2607
                    LayoutCachedWidth =9639
                    LayoutCachedHeight =2862
                    BorderThemeColorIndex =0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =2862
                    Width =1134
                    Height =255
                    TabIndex =15
                    Name ="InlandEinkauf"
                    ControlSource ="InlandEinkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =2862
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =3117
                    BorderThemeColorIndex =0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =95
                            Left =5670
                            Top =2862
                            Width =1701
                            Height =255
                            Name ="InlandEinkauf_Bezeichnungsfeld"
                            Caption ="Inland"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =2862
                            LayoutCachedWidth =7371
                            LayoutCachedHeight =3117
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =3117
                    Width =1134
                    Height =255
                    TabIndex =18
                    Name ="AuslandEinkauf"
                    ControlSource ="AuslandEinkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =3117
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =3372
                    BorderThemeColorIndex =0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =95
                            Left =5670
                            Top =3117
                            Width =1701
                            Height =255
                            Name ="AuslandEinkauf_Bezeichnungsfeld"
                            Caption ="Ausland"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =3117
                            LayoutCachedWidth =7371
                            LayoutCachedHeight =3372
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =3372
                    Width =1134
                    Height =255
                    TabIndex =21
                    Name ="EGEinkauf"
                    ControlSource ="EGEinkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =7371
                    LayoutCachedTop =3372
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =3627
                    BorderThemeColorIndex =0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =95
                            Left =5670
                            Top =3372
                            Width =1701
                            Height =255
                            Name ="EGEinkauf_Bezeichnungsfeld"
                            Caption ="EG"
                            FontName ="Arial"
                            LayoutCachedLeft =5670
                            LayoutCachedTop =3372
                            LayoutCachedWidth =7371
                            LayoutCachedHeight =3627
                            BorderThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8505
                    Top =2862
                    Width =1134
                    Height =255
                    TabIndex =17
                    Name ="InlandVerkauf"
                    ControlSource ="InlandVerkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =8505
                    LayoutCachedTop =2862
                    LayoutCachedWidth =9639
                    LayoutCachedHeight =3117
                    BorderThemeColorIndex =0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8505
                    Top =3117
                    Width =1134
                    Height =255
                    TabIndex =19
                    Name ="AuslandVerkauf"
                    ControlSource ="AuslandVerkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =8505
                    LayoutCachedTop =3117
                    LayoutCachedWidth =9639
                    LayoutCachedHeight =3372
                    BorderThemeColorIndex =0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8505
                    Top =3372
                    Width =1134
                    Height =255
                    TabIndex =20
                    Name ="EGVerkauf"
                    ControlSource ="EGVerkauf"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"

                    LayoutCachedLeft =8505
                    LayoutCachedTop =3372
                    LayoutCachedWidth =9639
                    LayoutCachedHeight =3627
                    BorderThemeColorIndex =0
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =247
                    Left =5669
                    Top =2551
                    Width =1705
                    Height =340
                    TabIndex =23
                    Name ="btnKonto"
                    Caption ="Konten"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="im Lexikon anzeigen"

                    LayoutCachedLeft =5669
                    LayoutCachedTop =2551
                    LayoutCachedWidth =7374
                    LayoutCachedHeight =2891
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "F_WarenGruppe.cls"
