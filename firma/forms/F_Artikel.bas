Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =24552
    ItemSuffix =269
    Right =21330
    Bottom =11865
    OnUnload ="[Event Procedure]"
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Artikel"
    OnApplyFilter ="[Event Procedure]"
    RecSrcDt = Begin
        0xd933c0d4f26ae640
    End
    Caption ="Artikel"
    OnCurrent ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
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
    RibbonName ="tlbOH"
    FitToScreen =255
    Begin
        Begin Label
            BackStyle =0
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
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BorderThemeColorIndex =3
            BorderShade =90.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
        Begin TextBox
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
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
        Begin Section
            CanGrow = NotDefault
            Height =11475
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =60
                    Top =4694
                    Width =5103
                    Height =6646
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (3) Daten für Artikel\015\012Verwenden Sie die Pfeiltasten"
                        ", um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =60
                    LayoutCachedTop =4694
                    LayoutCachedWidth =5163
                    LayoutCachedHeight =11340
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =60
                    Top =64
                    Width =3572
                    Height =2480
                    TabIndex =8
                    BackColor =-2147483633
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;2268;567"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Warengruppen-Liste mit Anzahl zugeordneter Artikel\015\012Einfach-Klick zum Filt"
                        "ern"

                    LayoutCachedLeft =60
                    LayoutCachedTop =64
                    LayoutCachedWidth =3632
                    LayoutCachedHeight =2544
                    BackShade =95.0
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1701
                    Top =4339
                    Width =3119
                    Height =270
                    FontWeight =600
                    TabIndex =9
                    BackColor =13172735
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    Tag ="FilterForm"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern\015\012A:"
                        " Sucht in Adressen\015\012N: nach Projekt-Nummern\015\012V: nach Vorgängen\015\012"
                        "S: Suche nach Stichworten\015\0121 Buchstabe==> Anfangsbuchstabe Lieferant\015\012"
                        "ID:xxx suche nach der ID Artikel xxx"
                    AsianLineBreak =255

                    LayoutCachedLeft =1701
                    LayoutCachedTop =4339
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =4609
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =567
                    Top =4339
                    Width =567
                    Height =270
                    FontWeight =600
                    TabIndex =10
                    BackColor =13172735
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =567
                    LayoutCachedTop =4339
                    LayoutCachedWidth =1134
                    LayoutCachedHeight =4609
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    Top =2668
                    Width =0
                    Height =255
                    ColumnWidth =0
                    TabIndex =11
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="f0"
                    ControlSource ="NrArtikel"
                    StatusBarText ="NrArtikel"
                    FontName ="Arial"

                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =4947
                    Top =4339
                    Width =216
                    Height =270
                    TabIndex =12
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="Reset Filter;;auto;daten;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Suchkriterien auflisten und wieder setzen"

                    LayoutCachedLeft =4947
                    LayoutCachedTop =4339
                    LayoutCachedWidth =5163
                    LayoutCachedHeight =4609
                End
                Begin Tab
                    OverlapFlags =85
                    Left =5385
                    Top =4245
                    Width =13875
                    Height =7230
                    TabIndex =13
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5385
                    LayoutCachedTop =4245
                    LayoutCachedWidth =19260
                    LayoutCachedHeight =11475
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgStichwort"
                            Caption ="Stichworte / Techn. Daten"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =7966
                                    Top =4664
                                    Width =11117
                                    Height =6676
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2268;2835;1134;1134;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der (frei wählbaren) Stichworte zu Artikel\015\012Doppel-Klick Stichwort: "
                                        "Stichworte bearbeiten\015\012Doppel-Klick Bemerkung: Bemerkung bearbeiten\015\012"
                                        "Doppel-Klick Hyperlink: Link öffnen, falls vorhanden"

                                    LayoutCachedLeft =7966
                                    LayoutCachedTop =4664
                                    LayoutCachedWidth =19083
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5527
                                    Top =6239
                                    Width =2268
                                    Height =5101
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Stichworte mit dem aktuellen Artikel"

                                    LayoutCachedLeft =5527
                                    LayoutCachedTop =6239
                                    LayoutCachedWidth =7795
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =5527
                                    Top =4660
                                    Width =2268
                                    Height =1523
                                    TabIndex =2
                                    BackColor =10092543
                                    Name ="lstStichwortGr1"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="\"Technische Daten\""
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Stichworte mit dem aktuellen Artikel"

                                    LayoutCachedLeft =5527
                                    LayoutCachedTop =4660
                                    LayoutCachedWidth =7795
                                    LayoutCachedHeight =6183
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgFirmaArtikel"
                            Caption ="Artikel von Kestenholz GmbH, Fre"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =5807
                                    Top =4693
                                    Width =13311
                                    Height =6647
                                    BackColor =15066597
                                    Name ="lstFirmaArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835;2835;1701;2268;851;851;567;567"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Artikel-Liste des aktuell angzeigten Lieferanten\015\012Einfach-Klick zeigt den "
                                        "markierten Artikel"

                                    LayoutCachedLeft =5807
                                    LayoutCachedTop =4693
                                    LayoutCachedWidth =19118
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pageVorgang"
                            Caption ="   Vorgänge"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =5700
                                    Top =5046
                                    Width =13386
                                    Height =6294
                                    BackColor =15066597
                                    Name ="lstVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;2835;1701;2268;794;794;794;794;794;794;794"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Bestell-Vorschlags-Liste"

                                    LayoutCachedLeft =5700
                                    LayoutCachedTop =5046
                                    LayoutCachedWidth =19086
                                    LayoutCachedHeight =11340
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =4536
                                    Left =8591
                                    Top =4717
                                    Width =4536
                                    Height =255
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comArtikelVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="1"
                                    FontName ="Arial"
                                    ControlTipText ="Aktionen mit dem aktuellen Artikel (doppelclick zum Starten der Aktion)"

                                    LayoutCachedLeft =8591
                                    LayoutCachedTop =4717
                                    LayoutCachedWidth =13127
                                    LayoutCachedHeight =4972
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =2268
                                    Left =13156
                                    Top =4716
                                    Width =2268
                                    Height =255
                                    TabIndex =2
                                    BackColor =10092543
                                    Name ="comArtikelVG1"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Bestell-Vorgang auslösen"

                                    LayoutCachedLeft =13156
                                    LayoutCachedTop =4716
                                    LayoutCachedWidth =15424
                                    LayoutCachedHeight =4971
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =5697
                                    Top =4653
                                    Width =2775
                                    Height =342
                                    TabIndex =3
                                    ForeColor =0
                                    Name ="btnArtikelVG"
                                    Caption ="Aktion Artikel starten....."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="die rechts ausgewählte Aktion starten"

                                    LayoutCachedLeft =5697
                                    LayoutCachedTop =4653
                                    LayoutCachedWidth =8472
                                    LayoutCachedHeight =4995
                                    Overlaps =1
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="PageArtikel"
                            Caption ="     zugehörige Artikel / Ersatzteile"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =8537
                                    Top =4658
                                    Width =10416
                                    Height =6682
                                    BackColor =15066597
                                    Name ="lstArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;284;567;1134;1701;1701;1701;1701;851;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste zugeordneter Artikel (z.B. Ersatzteile)\015\012Doppelklick zeigt den marki"
                                        "erten Artikel"

                                    LayoutCachedLeft =8537
                                    LayoutCachedTop =4658
                                    LayoutCachedWidth =18953
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5609
                                    Top =4664
                                    Width =2835
                                    Height =6676
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstArtikelAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Stichworte mit dem aktuellen Artikel"

                                    LayoutCachedLeft =5609
                                    LayoutCachedTop =4664
                                    LayoutCachedWidth =8444
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgRabatt"
                            Caption ="Rabatt"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =8
                                    Left =7508
                                    Top =4736
                                    Width =11511
                                    Height =6604
                                    BackColor =15066597
                                    Name ="lstRabatt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;3402;567;1134;1134;3402;1134"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Kunden-Liste mit Rabatten des aktuellen Artikels\015\012Einfach-Klick zeigt den "
                                        "markierten Kunden"

                                    LayoutCachedLeft =7508
                                    LayoutCachedTop =4736
                                    LayoutCachedWidth =19019
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5669
                                    Top =5792
                                    Height =5548
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstRabattAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Stichworte mit dem aktuellen Artikel"

                                    LayoutCachedLeft =5669
                                    LayoutCachedTop =5792
                                    LayoutCachedWidth =7370
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =5669
                                    Top =4762
                                    Height =968
                                    TabIndex =2
                                    BackColor =10092543
                                    Name ="lstRabattEbene"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="\"Warengruppe\""
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Rabatte können auf Ebene Artikel oder Warengruppe vergeben werden (Vorrang hat A"
                                        "rtikel-Ebene)"

                                    LayoutCachedLeft =5669
                                    LayoutCachedTop =4762
                                    LayoutCachedWidth =7370
                                    LayoutCachedHeight =5730
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4649
                            Width =13605
                            Height =6691
                            Name ="pgBuchung"
                            Caption ="Lager-Buchung"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4649
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =8085
                                    Top =4649
                                    Width =10773
                                    Height =2835
                                    BackColor =15066597
                                    Name ="lstLager"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1701;1701;1701;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Buchungen des aktuell ausgewählten Artikels"

                                    LayoutCachedLeft =8085
                                    LayoutCachedTop =4649
                                    LayoutCachedWidth =18858
                                    LayoutCachedHeight =7484
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5684
                                    Top =4649
                                    Width =2268
                                    Height =2835
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstLagerAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Lagerbuchungen"

                                    LayoutCachedLeft =5684
                                    LayoutCachedTop =4649
                                    LayoutCachedWidth =7952
                                    LayoutCachedHeight =7484
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5685
                                    Top =8014
                                    Width =2268
                                    Height =3326
                                    BackColor =10092543
                                    Name ="lstLagerAllAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit Buchungen"

                                    LayoutCachedLeft =5685
                                    LayoutCachedTop =8014
                                    LayoutCachedWidth =7953
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =8107
                                    Top =8005
                                    Width =10773
                                    Height =3335
                                    BackColor =15066597
                                    Name ="lstLAgerAll"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268;567;1701;1701;4536"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste über alle Lager-Orte (unabhängig vom aktuell angezeigten Artikel)"

                                    LayoutCachedLeft =8107
                                    LayoutCachedTop =8005
                                    LayoutCachedWidth =18880
                                    LayoutCachedHeight =11340
                                    Begin
                                        Begin Label
                                            OldBorderStyle =1
                                            OverlapFlags =247
                                            TextAlign =2
                                            Left =5737
                                            Top =7665
                                            Width =13200
                                            Height =255
                                            FontWeight =700
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld261"
                                            Caption ="Übersicht über alle Lagerorte (unabhängig vom aktuell angezeigten Artikel"
                                            FontName ="Arial"
                                            LayoutCachedLeft =5737
                                            LayoutCachedTop =7665
                                            LayoutCachedWidth =18937
                                            LayoutCachedHeight =7920
                                            BorderThemeColorIndex =0
                                        End
                                    End
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pageMarker"
                            Caption ="Artikel managen"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =8025
                                    Top =4746
                                    Width =11001
                                    Height =6594
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1701;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =8025
                                    LayoutCachedTop =4746
                                    LayoutCachedWidth =19026
                                    LayoutCachedHeight =11340
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =5681
                                    Top =4748
                                    Width =2268
                                    Height =227
                                    FontWeight =600
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    FontName ="Tahoma"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"
                                    AsianLineBreak =255

                                    LayoutCachedLeft =5681
                                    LayoutCachedTop =4748
                                    LayoutCachedWidth =7949
                                    LayoutCachedHeight =4975
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5681
                                    Top =5005
                                    Width =2268
                                    Height =6335
                                    BackColor =12975858
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =5681
                                    LayoutCachedTop =5005
                                    LayoutCachedWidth =7949
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgTop0"
                            Caption ="Top 100"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =8070
                                    Top =4717
                                    Width =10956
                                    Height =6623
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268;2268;3402;2835;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =8070
                                    LayoutCachedTop =4717
                                    LayoutCachedWidth =19026
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5681
                                    Top =4714
                                    Width =2268
                                    Height =6626
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"

                                    LayoutCachedLeft =5681
                                    LayoutCachedTop =4714
                                    LayoutCachedWidth =7949
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgKatalog"
                            Caption ="Bilder"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5685
                                    Top =4741
                                    Height =6599
                                    BackColor =10092543
                                    Name ="lstKatalogAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit dem Artikel-Katalog"

                                    LayoutCachedLeft =5685
                                    LayoutCachedTop =4741
                                    LayoutCachedWidth =7386
                                    LayoutCachedHeight =11340
                                End
                                Begin Image
                                    OldBorderStyle =1
                                    Left =7510
                                    Top =5099
                                    Width =5361
                                    Height =6241
                                    Name ="BildKatalog"
                                    ControlTipText ="Bild im Katalog"

                                    LayoutCachedLeft =7510
                                    LayoutCachedTop =5099
                                    LayoutCachedWidth =12871
                                    LayoutCachedHeight =11340
                                    TabIndex =1
                                End
                                Begin Label
                                    Visible = NotDefault
                                    OverlapFlags =247
                                    Left =7680
                                    Top =5576
                                    Width =5190
                                    Height =5764
                                    FontSize =12
                                    FontWeight =700
                                    ForeColor =255
                                    Name ="lblBildKatalog"
                                    Caption ="Bild nicht zu finden"
                                    FontName ="Arial"
                                    LayoutCachedLeft =7680
                                    LayoutCachedTop =5576
                                    LayoutCachedWidth =12870
                                    LayoutCachedHeight =11340
                                End
                                Begin Image
                                    OldBorderStyle =1
                                    Left =12990
                                    Top =5099
                                    Width =5361
                                    Height =6241
                                    Name ="BildSortiment"
                                    ControlTipText ="Bild im Sortiment"

                                    LayoutCachedLeft =12990
                                    LayoutCachedTop =5099
                                    LayoutCachedWidth =18351
                                    LayoutCachedHeight =11340
                                End
                                Begin Label
                                    Visible = NotDefault
                                    OverlapFlags =247
                                    Left =13160
                                    Top =5576
                                    Width =5190
                                    Height =5764
                                    FontSize =12
                                    FontWeight =700
                                    ForeColor =255
                                    Name ="lblBildSortiment"
                                    Caption ="Bild nicht zu finden"
                                    FontName ="Arial"
                                    LayoutCachedLeft =13160
                                    LayoutCachedTop =5576
                                    LayoutCachedWidth =18350
                                    LayoutCachedHeight =11340
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =7485
                                    Top =4746
                                    Width =5385
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld247"
                                    Caption ="Kalatog-Bild"
                                    FontName ="Arial"
                                    LayoutCachedLeft =7485
                                    LayoutCachedTop =4746
                                    LayoutCachedWidth =12870
                                    LayoutCachedHeight =5001
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =12990
                                    Top =4746
                                    Width =5415
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld248"
                                    Caption ="Sortiment-Bild"
                                    FontName ="Arial"
                                    LayoutCachedLeft =12990
                                    LayoutCachedTop =4746
                                    LayoutCachedWidth =18405
                                    LayoutCachedHeight =5001
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5520
                            Top =4650
                            Width =13605
                            Height =6690
                            Name ="pgAudit"
                            Caption ="Audit"
                            LayoutCachedLeft =5520
                            LayoutCachedTop =4650
                            LayoutCachedWidth =19125
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =8310
                                    Top =4731
                                    Width =10773
                                    Height =6609
                                    BackColor =14803425
                                    Name ="lstAudit"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1134;1701;3402;3402"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Doppelclick öffnet Formular Audit und zeigt Details!"

                                    LayoutCachedLeft =8310
                                    LayoutCachedTop =4731
                                    LayoutCachedWidth =19083
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5698
                                    Top =4736
                                    Width =2268
                                    Height =6604
                                    BackColor =10092543
                                    Name ="lstAuditAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Dienste"

                                    LayoutCachedLeft =5698
                                    LayoutCachedTop =4736
                                    LayoutCachedWidth =7966
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =60
                    Top =3350
                    Width =3572
                    Height =907
                    TabIndex =14
                    BackColor =-2147483633
                    Name ="lstC"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Gestaltung der Liste unten, wird individuell pro User abgespeichert"

                    LayoutCachedLeft =60
                    LayoutCachedTop =3350
                    LayoutCachedWidth =3632
                    LayoutCachedHeight =4257
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3745
                    Top =1440
                    Width =1418
                    Height =1790
                    TabIndex =15
                    BackColor =-2147483633
                    Name ="lstArtikelKategorie"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"A L L E\""
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Kategorien auswählen"

                    LayoutCachedLeft =3745
                    LayoutCachedTop =1440
                    LayoutCachedWidth =5163
                    LayoutCachedHeight =3230
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =3745
                    Top =60
                    Width =1418
                    Height =1299
                    TabIndex =16
                    BackColor =-2147483633
                    Name ="lstTopA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="30"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Wieviele Datensätze sollen gezeigt werden"

                    LayoutCachedLeft =3745
                    LayoutCachedTop =60
                    LayoutCachedWidth =5163
                    LayoutCachedHeight =1359
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =3745
                    Top =3344
                    Width =1418
                    Height =907
                    TabIndex =17
                    BackColor =13172735
                    Name ="lstAktiv"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="verfügbar / Nicht verfügbar"

                    LayoutCachedLeft =3745
                    LayoutCachedTop =3344
                    LayoutCachedWidth =5163
                    LayoutCachedHeight =4251
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =5272
                    Top =738
                    Width =2268
                    Height =342
                    TabIndex =18
                    ForeColor =0
                    Name ="btnBegriff"
                    Caption ="Artikel / Begriff"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt alle Artikel mit dem gleichen Begriff"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =738
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =1080
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =7089
                    Left =7711
                    Top =795
                    Width =5010
                    Height =255
                    TabIndex =2
                    BorderColor =2366701
                    Name ="Artikel"
                    ControlSource ="Artikel"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;3402"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnMouseMove ="[Event Procedure]"
                    Tag ="m1"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Artikel, hinterlegt in den Begriffen"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =795
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =1050
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    Left =7711
                    Top =1145
                    Width =5010
                    Height =255
                    TabIndex =3
                    BorderColor =2366701
                    ConditionalFormat = Begin
                        0x010000009c000000010000000100000000000000000000001d00000001000000 ,
                        0x00000000ed1c2400000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004e0069006300680074007600650072006600fc0067006200610072005d00 ,
                        0x20004900730020004e006f00740020004e0075006c006c0000000000
                    End
                    Name ="ArtikelName"
                    ControlSource ="ArtikelName"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Typ des Artikels\015\012wenn rot hinterlegt==> Artikel ist nicht mehr verfügbar!"
                        "!"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =1145
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =1400
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000ed1c24001c0000005b00 ,
                        0x4e0069006300680074007600650072006600fc0067006200610072005d002000 ,
                        0x4900730020004e006f00740020004e0075006c006c0000000000000000000000 ,
                        0x0000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =1090
                    Width =2268
                    Height =342
                    TabIndex =19
                    ForeColor =0
                    Name ="btnArtikelName"
                    Caption ="Artikelname Typ/Bez."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt alle Artikel vom gleichen Typ"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =1090
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =1432
                    Overlaps =1
                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =9358
                    Left =7711
                    Top =445
                    Width =5010
                    Height =255
                    TabIndex =1
                    BorderColor =2366701
                    Name ="NrWarengruppe"
                    ControlSource ="NrWarengruppe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;6804;1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Warengruppe"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =445
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =700
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =5272
                    Top =386
                    Width =2268
                    Height =342
                    TabIndex =20
                    ForeColor =0
                    Name ="btnWarengruppe"
                    Caption ="Warengruppe"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Tabelle Warengruppe (Artikel gruppieren)"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =386
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =728
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =1442
                    Width =2268
                    Height =342
                    TabIndex =21
                    ForeColor =0
                    Name ="btnArtikelNr"
                    Caption ="Artikel-Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt alle Artikel mit der gleichen Nummer; wenn Artikel kopiert ist, rechnet \""
                        "Firma\" die neue Artikelnummer"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =1442
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =1784
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    Left =7711
                    Top =1495
                    Width =5010
                    Height =255
                    TabIndex =4
                    BorderColor =2366701
                    Name ="ArtikelNr"
                    ControlSource ="ArtikelNr"
                    RowSourceType ="Table/Query"
                    BeforeUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m3"
                    ControlTipText ="Artikel-Nr.\015\012mit Doppelklick gesamten Inhalt zeigen"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =1495
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =1750
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =1794
                    Width =2268
                    Height =342
                    TabIndex =22
                    ForeColor =0
                    Name ="btnLieferant"
                    Caption ="Firma / Lieferant"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt / ändert Lieferanten"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =1794
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =2136
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =3686
                    Left =7711
                    Top =1845
                    Width =5010
                    Height =255
                    TabIndex =23
                    BorderColor =2366701
                    Name ="NrFirma"
                    ControlSource ="NrFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Lieferant mit Name, Ort (aus Firmenliste auswählen)\015\012Wenn Sie für mehrere "
                        "Artikel den Lieferanten wechseln wollen, filtern Sie diese Artikel und ändern da"
                        "nn hier den Lieferanten\015\012Doppelklick trägt eigene Fa. ein, wenn leer"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =1845
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =2100
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =2146
                    Width =2268
                    Height =342
                    TabIndex =24
                    ForeColor =0
                    Name ="btnHersteller"
                    Caption ="Hersteller"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt alle Artikel des gleichen Herstellers"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =2146
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =2488
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    ListWidth =2835
                    Left =7711
                    Top =2195
                    Width =5010
                    Height =255
                    TabIndex =5
                    Name ="Hersteller"
                    ControlSource ="Hersteller"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Hersteller (freie Eingabe möglich)\015\012Wenn Sie für mehrere Artikel den Herst"
                        "eller wechseln wollen, filtern Sie diese Artikel und ändern dann hier den Herste"
                        "ller\015\012Doppelklick trägt eigene Fa. ein, wenn leer"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =2195
                    LayoutCachedWidth =12721
                    LayoutCachedHeight =2450
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =2498
                    Width =2268
                    Height =342
                    TabIndex =25
                    ForeColor =0
                    Name ="btnLiefereinheit"
                    Caption ="Einheit"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="öffnet Lexikon"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =2498
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =2840
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    ColumnCount =2
                    ListRows =20
                    ListWidth =3686
                    Left =7711
                    Top =2539
                    Width =1344
                    Height =255
                    TabIndex =6
                    BorderColor =2366701
                    Name ="Liefereinheit"
                    ControlSource ="Liefereinheit"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134;2268"
                    DefaultValue ="\"Stk.\""
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Liefereinheit"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =2539
                    LayoutCachedWidth =9055
                    LayoutCachedHeight =2794
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5272
                    Top =2850
                    Width =2268
                    Height =732
                    TabIndex =26
                    ForeColor =0
                    Name ="btnBemArtikel"
                    Caption ="Bemerkungen\015\012 (Standard-Texte...)"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="hole Standardtext aus Lexikon"

                    LayoutCachedLeft =5272
                    LayoutCachedTop =2850
                    LayoutCachedWidth =7540
                    LayoutCachedHeight =3582
                    Overlaps =1
                End
                Begin TextBox
                    AutoTab = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =7711
                    Top =2895
                    Width =4710
                    Height =1071
                    FontSize =11
                    TabIndex =7
                    Name ="BemArtikel"
                    ControlSource ="BemArtikel"
                    StatusBarText ="Bemerkungen zum Artikel"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Bemerkungen zum Artikel, mit der Maus Text markieren und dann formatieren\015\012"
                        "Doppelclick öffnet Editier-Formular"
                    TextFormat =1

                    LayoutCachedLeft =7711
                    LayoutCachedTop =2895
                    LayoutCachedWidth =12421
                    LayoutCachedHeight =3966
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    ColumnCount =3
                    ListRows =30
                    ListWidth =5103
                    Left =12537
                    Top =2914
                    Width =285
                    Height =255
                    TabIndex =27
                    BoundColumn =2
                    Name ="comBemArtikel"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="4536;0;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Bemerkungen zum Artikel aus Liste auswählen"

                    LayoutCachedLeft =12537
                    LayoutCachedTop =2914
                    LayoutCachedWidth =12822
                    LayoutCachedHeight =3169
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14404
                    Top =3411
                    Width =4434
                    Height =567
                    TabIndex =28
                    BackColor =10092543
                    Name ="InfoArtikel"
                    ControlSource ="InfoArtikel"
                    FontName ="Arial"
                    ControlTipText ="Infos, die auf keinem Report erscheinen"

                    LayoutCachedLeft =14404
                    LayoutCachedTop =3411
                    LayoutCachedWidth =18838
                    LayoutCachedHeight =3978
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12872
                            Top =3405
                            Width =1428
                            Height =570
                            Name ="Bezeichnungsfeld185"
                            Caption ="Infos zum Artikel (nicht ausdrucken)"
                            FontName ="Arial"
                            LayoutCachedLeft =12872
                            LayoutCachedTop =3405
                            LayoutCachedWidth =14300
                            LayoutCachedHeight =3975
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    Left =17682
                    Top =2697
                    Height =255
                    TabIndex =29
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="ArtikelErfasst"
                    ControlSource ="ArtikelErfasst"
                    Format ="dd\\.mm\\.yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Artikel erfasst am ..."

                    LayoutCachedLeft =17682
                    LayoutCachedTop =2697
                    LayoutCachedWidth =19383
                    LayoutCachedHeight =2952
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =16729
                            Top =2697
                            Width =870
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld39"
                            Caption ="erfasst am"
                            FontName ="Arial"
                            LayoutCachedLeft =16729
                            LayoutCachedTop =2697
                            LayoutCachedWidth =17599
                            LayoutCachedHeight =2952
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    Left =17682
                    Top =2981
                    Height =255
                    TabIndex =30
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="MarkerArtikel"
                    ControlSource ="MarkerArtikel"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="wer hat den Datensatz markiert"

                    LayoutCachedLeft =17682
                    LayoutCachedTop =2981
                    LayoutCachedWidth =19383
                    LayoutCachedHeight =3236
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =16729
                            Top =2981
                            Width =870
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld167"
                            Caption ="Marker"
                            FontName ="Arial"
                            LayoutCachedLeft =16729
                            LayoutCachedTop =2981
                            LayoutCachedWidth =17599
                            LayoutCachedHeight =3236
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    DecimalPlaces =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =14392
                    Top =129
                    Width =1329
                    Height =255
                    TabIndex =31
                    Name ="Einkaufspreis"
                    ControlSource ="Einkaufspreis"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Einkaufspreis / Listenpreis"

                    LayoutCachedLeft =14392
                    LayoutCachedTop =129
                    LayoutCachedWidth =15721
                    LayoutCachedHeight =384
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12996
                            Top =129
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="lblEinkaufspreis"
                            Caption ="Listenpreis"
                            FontName ="Arial"
                            LayoutCachedLeft =12996
                            LayoutCachedTop =129
                            LayoutCachedWidth =14301
                            LayoutCachedHeight =384
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =567
                    Left =15802
                    Top =129
                    Width =729
                    Height =255
                    TabIndex =32
                    Name ="EKWährung"
                    ControlSource ="EKWährung"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Währung EinKauf, Doppelclick um Währungen zu sehen/ändern"

                    LayoutCachedLeft =15802
                    LayoutCachedTop =129
                    LayoutCachedWidth =16531
                    LayoutCachedHeight =384
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =3
                    DecimalPlaces =1
                    ListRows =40
                    ListWidth =567
                    Left =14392
                    Top =472
                    Width =1329
                    Height =255
                    TabIndex =33
                    Name ="ArtikelRabatt"
                    ControlSource ="ArtikelRabatt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Rabatt auf Artikel"
                    Format ="Fixed"

                    LayoutCachedLeft =14392
                    LayoutCachedTop =472
                    LayoutCachedWidth =15721
                    LayoutCachedHeight =727
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12996
                            Top =472
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld82"
                            Caption ="% Rabatt auf EK"
                            FontName ="Arial"
                            LayoutCachedLeft =12996
                            LayoutCachedTop =472
                            LayoutCachedWidth =14301
                            LayoutCachedHeight =727
                        End
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =3
                    DecimalPlaces =5
                    ListRows =30
                    ListWidth =567
                    Left =15802
                    Top =472
                    Width =1134
                    Height =255
                    TabIndex =34
                    Name ="PreisFaktor"
                    ControlSource ="PreisFaktor"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Preis-Faktor"
                    Format ="Fixed"

                    LayoutCachedLeft =15802
                    LayoutCachedTop =472
                    LayoutCachedWidth =16936
                    LayoutCachedHeight =727
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =14392
                    Top =815
                    Width =1329
                    Height =255
                    FontWeight =700
                    TabIndex =35
                    Name ="KalkVP"
                    ControlSource ="KalkVP"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="kalkulierter Verkaufspreis; zum Ändern den Button links benutzen!"

                    LayoutCachedLeft =14392
                    LayoutCachedTop =815
                    LayoutCachedWidth =15721
                    LayoutCachedHeight =1070
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    DecimalPlaces =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =14392
                    Top =1158
                    Width =1329
                    Height =255
                    TabIndex =36
                    Name ="Einzelpreis"
                    ControlSource ="Einzelpreis"
                    Format ="Standard"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Dieser Preis wird verwendet, sobald er eingetragen ist"

                    LayoutCachedLeft =14392
                    LayoutCachedTop =1158
                    LayoutCachedWidth =15721
                    LayoutCachedHeight =1413
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12996
                            Top =1158
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld66"
                            Caption ="Festpreis"
                            FontName ="Arial"
                            LayoutCachedLeft =12996
                            LayoutCachedTop =1158
                            LayoutCachedWidth =14301
                            LayoutCachedHeight =1413
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =20
                    ListWidth =567
                    Left =15802
                    Top =1158
                    Width =729
                    Height =255
                    TabIndex =37
                    Name ="VKWährung"
                    ControlSource ="VKWährung"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;0"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Währung Verkauf, Doppelclick um Währungen zu sehen/ändern"

                    LayoutCachedLeft =15802
                    LayoutCachedTop =1158
                    LayoutCachedWidth =16531
                    LayoutCachedHeight =1413
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    DecimalPlaces =2
                    ListRows =30
                    ListWidth =851
                    Left =14394
                    Top =1862
                    Width =2139
                    Height =255
                    TabIndex =38
                    ConditionalFormat = Begin
                        0x01000000d8000000010000000100000000000000000000003b00000001000000 ,
                        0xffffff00ba141900000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004c0061006700650072006d0069006e0064006500730074006d0065006e00 ,
                        0x670065005d003e003000200041006e00640020005b004c006100670065007200 ,
                        0x6d0065006e00670065005d003c005b004c0061006700650072006d0069006e00 ,
                        0x64006500730074006d0065006e00670065005d0000000000
                    End
                    Name ="LagerMenge"
                    ControlSource ="LagerMenge"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    ValidationRule =">=0"
                    ValidationText ="Lagermenge immer grösser /gleich 0"
                    OnEnter ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    ControlTipText ="Lagermenge"

                    LayoutCachedLeft =14394
                    LayoutCachedTop =1862
                    LayoutCachedWidth =16533
                    LayoutCachedHeight =2117
                    ConditionalFormat14 = Begin
                        0x010001000000010000000000000001000000ffffff00ba1419003a0000005b00 ,
                        0x4c0061006700650072006d0069006e0064006500730074006d0065006e006700 ,
                        0x65005d003e003000200041006e00640020005b004c0061006700650072006d00 ,
                        0x65006e00670065005d003c005b004c0061006700650072006d0069006e006400 ,
                        0x6500730074006d0065006e00670065005d000000000000000000000000000000 ,
                        0x00000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =12998
                            Top =1862
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld109"
                            Caption ="Lagermenge"
                            FontName ="Arial"
                            LayoutCachedLeft =12998
                            LayoutCachedTop =1862
                            LayoutCachedWidth =14303
                            LayoutCachedHeight =2117
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    ListRows =20
                    ListWidth =851
                    Left =14394
                    Top =2372
                    Width =2139
                    Height =255
                    TabIndex =39
                    Name ="Lagerort"
                    ControlSource ="Lagerort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    OnEnter ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    ControlTipText ="Lagerort und (mit Bindestrich getrennt) Lagerfach"

                    LayoutCachedLeft =14394
                    LayoutCachedTop =2372
                    LayoutCachedWidth =16533
                    LayoutCachedHeight =2627
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =12998
                            Top =2372
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld112"
                            Caption ="Lagerort"
                            FontName ="Arial"
                            LayoutCachedLeft =12998
                            LayoutCachedTop =2372
                            LayoutCachedWidth =14303
                            LayoutCachedHeight =2627
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    BackStyle =0
                    Left =17682
                    Top =1896
                    Height =255
                    TabIndex =40
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="whoUpdate"
                    ControlSource ="whoUpdate"
                    Format ="dd\\.mm\\.yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Artikel Update von .."

                    LayoutCachedLeft =17682
                    LayoutCachedTop =1896
                    LayoutCachedWidth =19383
                    LayoutCachedHeight =2151
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =16725
                            Top =1875
                            Width =870
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld37"
                            Caption ="geändert"
                            FontName ="Arial"
                            LayoutCachedLeft =16725
                            LayoutCachedTop =1875
                            LayoutCachedWidth =17595
                            LayoutCachedHeight =2130
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =1
                    BackStyle =0
                    Left =17682
                    Top =2151
                    Height =255
                    TabIndex =41
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =17682
                    LayoutCachedTop =2151
                    LayoutCachedWidth =19383
                    LayoutCachedHeight =2406
                    Begin
                        Begin Label
                            OverlapFlags =95
                            TextAlign =3
                            Left =16725
                            Top =2130
                            Width =870
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld38"
                            Caption ="letzte Änd."
                            FontName ="Arial"
                            LayoutCachedLeft =16725
                            LayoutCachedTop =2130
                            LayoutCachedWidth =17595
                            LayoutCachedHeight =2385
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    BackStyle =0
                    Left =17682
                    Top =2406
                    Height =255
                    TabIndex =42
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="Printmarkerartikel"
                    ControlSource ="Printmarkerartikel"
                    Format ="Yes/No"
                    StatusBarText ="geändert am .."
                    FontName ="Arial"

                    LayoutCachedLeft =17682
                    LayoutCachedTop =2406
                    LayoutCachedWidth =19383
                    LayoutCachedHeight =2661
                    Begin
                        Begin Label
                            OverlapFlags =87
                            TextAlign =3
                            Left =16729
                            Top =2385
                            Width =870
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld192"
                            Caption ="PrintMarker"
                            FontName ="Arial"
                            LayoutCachedLeft =16729
                            LayoutCachedTop =2385
                            LayoutCachedWidth =17599
                            LayoutCachedHeight =2640
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    Left =7711
                    Top =56
                    Width =1989
                    Height =345
                    FontSize =12
                    FontWeight =700
                    TabIndex =43
                    BackColor =12632256
                    Name ="NrArtikel"
                    ControlSource ="NrArtikel"
                    FontName ="Arial"
                    ControlTipText ="ID des Artikels"

                    LayoutCachedLeft =7711
                    LayoutCachedTop =56
                    LayoutCachedWidth =9700
                    LayoutCachedHeight =401
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =5272
                            Top =56
                            Width =2268
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld130"
                            Caption ="ID Artikel"
                            FontName ="Arial"
                            LayoutCachedLeft =5272
                            LayoutCachedTop =56
                            LayoutCachedWidth =7540
                            LayoutCachedHeight =311
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =851
                    Left =14394
                    Top =2747
                    Width =2139
                    Height =255
                    TabIndex =44
                    Name ="ArtikelKategorie"
                    ControlSource ="ArtikelKategorie"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Artikel-Kategorie (Doppelclick öffnet Lexikon)"

                    LayoutCachedLeft =14394
                    LayoutCachedTop =2747
                    LayoutCachedWidth =16533
                    LayoutCachedHeight =3002
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12998
                            Top =2747
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld237"
                            Caption ="Kategorie"
                            FontName ="Arial"
                            LayoutCachedLeft =12998
                            LayoutCachedTop =2747
                            LayoutCachedWidth =14303
                            LayoutCachedHeight =3002
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =14386
                    Top =3065
                    Width =2139
                    Height =255
                    TabIndex =45
                    Name ="EANCode"
                    ControlSource ="EANCode"
                    Format ="Fixed"
                    FontName ="Arial"
                    ControlTipText ="eineindeutige EAN Barcodenummer"

                    LayoutCachedLeft =14386
                    LayoutCachedTop =3065
                    LayoutCachedWidth =16525
                    LayoutCachedHeight =3320
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12990
                            Top =3065
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld239"
                            Caption ="EAN-Code"
                            FontName ="Arial"
                            LayoutCachedLeft =12990
                            LayoutCachedTop =3065
                            LayoutCachedWidth =14295
                            LayoutCachedHeight =3320
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =11402
                    Top =2539
                    Width =1089
                    Height =255
                    TabIndex =46
                    Name ="nichtverfügbar"
                    ControlSource ="nichtverfügbar"
                    Format ="General Date"
                    FontName ="Arial"
                    ControlTipText ="der Artikel ist nicht mehr verfügbar seit (Datum eintragen)"
                    ConditionalFormat = Begin
                        0x0100000066000000010000000000000004000000000000000200000001000000 ,
                        0x00000000ed1c2400000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x300000000000
                    End

                    LayoutCachedLeft =11402
                    LayoutCachedTop =2539
                    LayoutCachedWidth =12491
                    LayoutCachedHeight =2794
                    ConditionalFormat14 = Begin
                        0x01000100000000000000040000000100000000000000ed1c2400010000003000 ,
                        0x000000000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9263
                            Top =2539
                            Width =2055
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld250"
                            Caption ="nicht mehr verfügbar seit "
                            FontName ="Arial"
                            LayoutCachedLeft =9263
                            LayoutCachedTop =2539
                            LayoutCachedWidth =11318
                            LayoutCachedHeight =2794
                        End
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    DecimalPlaces =2
                    ListRows =30
                    Left =14394
                    Top =2117
                    Width =2139
                    Height =255
                    TabIndex =47
                    Name ="LagerMindestMenge"
                    ControlSource ="LagerMindestMenge"
                    RowSourceType ="Table/Query"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Format ="Standard"

                    LayoutCachedLeft =14394
                    LayoutCachedTop =2117
                    LayoutCachedWidth =16533
                    LayoutCachedHeight =2372
                    Begin
                        Begin Label
                            OverlapFlags =87
                            TextAlign =3
                            Left =12998
                            Top =2117
                            Width =1305
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld111"
                            Caption ="Mindestmenge"
                            FontName ="Arial"
                            LayoutCachedLeft =12998
                            LayoutCachedTop =2117
                            LayoutCachedWidth =14303
                            LayoutCachedHeight =2372
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =1304
                    Top =4290
                    Width =340
                    Height =340
                    TabIndex =48
                    ForeColor =0
                    Name ="btntxtFind"
                    Caption ="suchen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Suche ausführen"
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

                    LayoutCachedLeft =1304
                    LayoutCachedTop =4290
                    LayoutCachedWidth =1644
                    LayoutCachedHeight =4630
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =60
                    Top =4290
                    Width =340
                    Height =340
                    FontSize =10
                    FontWeight =700
                    TabIndex =49
                    ForeColor =0
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

                    LayoutCachedLeft =60
                    LayoutCachedTop =4290
                    LayoutCachedWidth =400
                    LayoutCachedHeight =4630
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3686
                    Left =56
                    Top =2664
                    Width =3572
                    Height =255
                    TabIndex =50
                    BackColor =-2147483633
                    Name ="comFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl nach Lieferant\015\012Doppelklick zeigt alle Lieferanten"

                    LayoutCachedLeft =56
                    LayoutCachedTop =2664
                    LayoutCachedWidth =3628
                    LayoutCachedHeight =2919
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3686
                    Left =56
                    Top =3039
                    Width =3572
                    Height =255
                    TabIndex =51
                    BackColor =-2147483633
                    Name ="comLager"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl nach Lager-Infos\015\012Doppelklick hebt den Filter wieder auf"

                    LayoutCachedLeft =56
                    LayoutCachedTop =3039
                    LayoutCachedWidth =3628
                    LayoutCachedHeight =3294
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =16759
                    Top =129
                    Width =1329
                    Height =255
                    TabIndex =52
                    BackColor =15527148
                    Name ="EinkaufspreismitRabatt"
                    ControlSource ="EinkaufspreismitRabatt"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Einkaufspreis incl. Rabatt"

                    LayoutCachedLeft =16759
                    LayoutCachedTop =129
                    LayoutCachedWidth =18088
                    LayoutCachedHeight =384
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =12996
                    Top =793
                    Width =1305
                    Height =342
                    TabIndex =53
                    ForeColor =0
                    Name ="btnKalkVp"
                    Caption ="berechn. VP"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="berechneten Verkaufspreis manipulieren"

                    LayoutCachedLeft =12996
                    LayoutCachedTop =793
                    LayoutCachedWidth =14301
                    LayoutCachedHeight =1135
                    Overlaps =1
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    Left =19842
                    Top =566
                    Width =4710
                    Height =2841
                    FontSize =10
                    TabIndex =54
                    Name ="ArtikelLang"
                    ControlSource ="ArtikelLang"
                    FontName ="Arial"
                    ControlTipText ="wenn der Artikel oder die Bezeichnung mehrzeilig ist, erscheint hier der komplet"
                        "te Text!"

                    LayoutCachedLeft =19842
                    LayoutCachedTop =566
                    LayoutCachedWidth =24552
                    LayoutCachedHeight =3407
                    BackThemeColorIndex =1
                    BackShade =95.0
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Artikel.cls"
