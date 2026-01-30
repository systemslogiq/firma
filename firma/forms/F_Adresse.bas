Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    NavigationButtons = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =27497
    ItemSuffix =385
    Right =28170
    Bottom =11865
    OnUnload ="[Event Procedure]"
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Funktion"
    ShortcutMenuBar ="tlbOHrightMouse"
    RecSrcDt = Begin
        0x7abc68201c6fe640
    End
    UniqueTable ="T_Funktion"
    OnCurrent ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    DatasheetFontName ="ARIAL"
    OnActivate ="[Event Procedure]"
    OnDeactivate ="[Event Procedure]"
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
            FontName ="Tahoma"
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
            ForeColor =-2147483630
            FontName ="Tahoma"
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
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
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
            FontName ="Tahoma"
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
            Height =11475
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =65
                    Top =5443
                    Width =3804
                    Height =5897
                    TabIndex =1
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    OnKeyDown ="[Event Procedure]"
                    OnGotFocus ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (20) Daten für Funktion\015\012Verwenden Sie die Pfeiltast"
                        "en, um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =65
                    LayoutCachedTop =5443
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =11340
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =75
                    Top =2322
                    Width =1871
                    Height =2376
                    TabIndex =2
                    BackColor =-2147483633
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;284"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Unterschiedliche Filter\015\012Doppelklick hebt den Filter auf"

                    LayoutCachedLeft =75
                    LayoutCachedTop =2322
                    LayoutCachedWidth =1946
                    LayoutCachedHeight =4698
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1365
                    Top =5100
                    Width =2229
                    Height =255
                    FontWeight =600
                    TabIndex =3
                    BackColor =13172735
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    Tag ="FilterForm"
                    ControlTipText ="Suchbegriff:\015\012nur 1 oder 2 Buchst. ==>Anfang des Namens\015\012V: Vorgänge"
                        "; \015\012N:  Projekte;\015\012S:  Stichworte\015\012*:Wildcard-Suche Firma, Ort"
                        ", Person, Funktion, Beruf, Branche, IDs, Bemerkungen\015\012ID: NrFunktion\015\012"
                        "a - f :Anfangsbuchstaben a bis f\015\012Doppelclick: Entferne"
                    AsianLineBreak =255

                    LayoutCachedLeft =1365
                    LayoutCachedTop =5100
                    LayoutCachedWidth =3594
                    LayoutCachedHeight =5355
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =75
                    Top =1305
                    Width =1871
                    Height =946
                    BackColor =-2147483633
                    Name ="lstAktiv"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Auswahl der Adressen"

                    LayoutCachedLeft =75
                    LayoutCachedTop =1305
                    LayoutCachedWidth =1946
                    LayoutCachedHeight =2251
                End
                Begin TextBox
                    Locked = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =390
                    Top =5100
                    Width =534
                    Height =255
                    FontWeight =600
                    TabIndex =4
                    BackColor =-2147483633
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Anzahl der gefundenen Datensätze (Doppelclick öffnet Liste)"
                    AsianLineBreak =255

                    LayoutCachedLeft =390
                    LayoutCachedTop =5100
                    LayoutCachedWidth =924
                    LayoutCachedHeight =5355
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =2835
                    Left =3623
                    Top =5100
                    Width =246
                    Height =255
                    TabIndex =5
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="Reset Filter;test;;rn;alex;gb;alma;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Suchkriterien auflisten und wieder setzen\015\012mit \"Reset Filter\" auf"
                        " den Standard-Filter zurücksetzen"

                    LayoutCachedLeft =3623
                    LayoutCachedTop =5100
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =5355
                End
                Begin Tab
                    OverlapFlags =85
                    Left =3945
                    Top =5430
                    Width =14370
                    Height =6045
                    TabIndex =6
                    Name ="regd"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =3945
                    LayoutCachedTop =5430
                    LayoutCachedWidth =18315
                    LayoutCachedHeight =11475
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5506
                            Name ="pgStichwort"
                            Caption ="Stichworte"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11341
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    BorderWidth =1
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =6804
                                    Top =5876
                                    Width =11340
                                    Height =5464
                                    BackColor =-2147483633
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2835;3969;1419;851"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyDown ="[Event Procedure]"
                                    OnMouseDown ="[Event Procedure]"
                                    ShortcutMenuBar ="cbF_Adresse"
                                    ControlTipText ="Liste der (frei wählbaren) Stichworte zu Adresse Lips Ulrich\015\012Doppel-Klick"
                                        " Stichwort: Stichworte bearbeiten\015\012Doppel-Klick Bemerkung: Bemerkung bearb"
                                        "eiten\015\012Doppel-Klick Hyperlink: Link öffnen, falls vorhanden\015\012Beginnt"
                                        " das Stichwort mit 'Tel, Han, oder Mob'"

                                    LayoutCachedLeft =6804
                                    LayoutCachedTop =5876
                                    LayoutCachedWidth =18144
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4155
                                    Top =7088
                                    Width =2552
                                    Height =4253
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2552"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Stichworte\015\012Oft benutzte Stichworte im Lexikon a"
                                        "blegen in Gruppe <Stichworte Adresse>\015\012ALLE mit einem <X> in <Bedingung1> "
                                        "werden automitsch hinzugefügt."

                                    LayoutCachedLeft =4155
                                    LayoutCachedTop =7088
                                    LayoutCachedWidth =6707
                                    LayoutCachedHeight =11341
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    IMESentenceMode =3
                                    ListRows =30
                                    Left =4155
                                    Top =6790
                                    Width =2552
                                    Height =255
                                    TabIndex =2
                                    BackColor =65280
                                    Name ="comStichwortFilter"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2555"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Handling zum Filtern der Stichworte\015\012Doppelklick entfernt / setzt Filter.\015"
                                        "\012Wenn ein Filter gesetzt ist , erscheint ein Grüner Rand!"

                                    LayoutCachedLeft =4155
                                    LayoutCachedTop =6790
                                    LayoutCachedWidth =6707
                                    LayoutCachedHeight =7045
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =4155
                                    Top =5896
                                    Width =2552
                                    Height =851
                                    FontWeight =700
                                    TabIndex =3
                                    BackColor =12975858
                                    Name ="lstStichwortGr"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"Alle Stichwort-Gruppen\""
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Stichwort-Gruppen zum Filtern\015\012Doppelklick zeigt alle Gruppen an"

                                    LayoutCachedLeft =4155
                                    LayoutCachedTop =5896
                                    LayoutCachedWidth =6707
                                    LayoutCachedHeight =6747
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="PageKontakt"
                            Caption ="     Kontakte"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =13
                                    Left =6804
                                    Top =5904
                                    Width =11340
                                    Height =5436
                                    BackColor =15066597
                                    Name ="lstKontakt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;567;2835;1701;567;2268;1701;1701;567;0;0;0"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste zugeordneter Adressen (aktive Oben)\015\012Doppelklick zeigt die markierte"
                                        " Adresse"

                                    LayoutCachedLeft =6804
                                    LayoutCachedTop =5904
                                    LayoutCachedWidth =18144
                                    LayoutCachedHeight =11340
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    AutoExpand = NotDefault
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =5
                                    ListRows =30
                                    ListWidth =7088
                                    Left =4138
                                    Top =5904
                                    Width =2552
                                    Height =255
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comKArt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701;5103;0;0;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Auswahl der Zuordnungs-Möglichkeiten\015\012Doppelclick öffnet Lexikon, um Eintr"
                                        "äge zu editieren / erweitern"

                                    LayoutCachedLeft =4138
                                    LayoutCachedTop =5904
                                    LayoutCachedWidth =6690
                                    LayoutCachedHeight =6159
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4081
                                    Top =7200
                                    Width =2552
                                    Height =4140
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstKontaktAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="20"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Kontakte"

                                    LayoutCachedLeft =4081
                                    LayoutCachedTop =7200
                                    LayoutCachedWidth =6633
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4140
                                    Top =6253
                                    Width =2552
                                    Height =737
                                    TabIndex =3
                                    BackColor =12975858
                                    Name ="lstKontaktActA"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Kontakte"

                                    LayoutCachedLeft =4140
                                    LayoutCachedTop =6253
                                    LayoutCachedWidth =6692
                                    LayoutCachedHeight =6990
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pageVorgang"
                            Caption ="   Vorgänge"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =6804
                                    Top =5842
                                    Width =11340
                                    Height =5498
                                    BackColor =15066597
                                    Name ="lstVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;851;2268;851;851;3969;851;567;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Vorgänge mit CARBOGEN AMCIS AG, Bubendorf\015\012direkte Vorgänge mit Griner Mat"
                                        "thias = (X)\015\012Sortierung:  Datum abst., ProjektNr abst. , lastUpdate abs."

                                    LayoutCachedLeft =6804
                                    LayoutCachedTop =5842
                                    LayoutCachedWidth =18144
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4168
                                    Top =5842
                                    Width =2552
                                    Height =3402
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstVGAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Vorgänge"

                                    LayoutCachedLeft =4168
                                    LayoutCachedTop =5842
                                    LayoutCachedWidth =6720
                                    LayoutCachedHeight =9244
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    Left =4170
                                    Top =9298
                                    Width =2552
                                    Height =2042
                                    TabIndex =2
                                    BackColor =15066597
                                    Name ="lstVGSum"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;851;851"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Vorgänge mit Anzahl und Summe pro Vorgangsart\015\012Klick zeigt recht"
                                        "s die entsprechende Liste"

                                    LayoutCachedLeft =4170
                                    LayoutCachedTop =9298
                                    LayoutCachedWidth =6722
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="PageLeistung"
                            Caption ="    Leistungen"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =10
                                    Left =4274
                                    Top =6215
                                    Width =13686
                                    Height =5125
                                    BackColor =15066597
                                    Name ="LstLeistung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;861;567;567;3402;3402;1134;2268;287"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =4274
                                    LayoutCachedTop =6215
                                    LayoutCachedWidth =17960
                                    LayoutCachedHeight =11340
                                End
                                Begin CommandButton
                                    Visible = NotDefault
                                    OverlapFlags =247
                                    Left =4274
                                    Top =5855
                                    Width =6352
                                    Height =340
                                    TabIndex =1
                                    ForeColor =0
                                    Name ="btnLeistungNeu"
                                    Caption ="erstelle neue Leistung zu Projekt 2976"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="neues Stichwort zu aktueller Adresse"

                                    LayoutCachedLeft =4274
                                    LayoutCachedTop =5855
                                    LayoutCachedWidth =10626
                                    LayoutCachedHeight =6195
                                    Overlaps =1
                                End
                            End
                        End
                        Begin Page
                            Visible = NotDefault
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="PageArtikel"
                            Caption ="      Artikel"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =5630
                                    Top =5902
                                    Width =12366
                                    Height =5438
                                    BackColor =15066597
                                    Name ="LstArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268;2835;3402;2268;852;567;567;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =5630
                                    LayoutCachedTop =5902
                                    LayoutCachedWidth =17996
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4110
                                    Top =5902
                                    Width =1418
                                    Height =5438
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="LstArtikelAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =4110
                                    LayoutCachedTop =5902
                                    LayoutCachedWidth =5528
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pageMarker"
                            ControlTipText ="markieren / löschen"
                            Caption ="Top 25 managen"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =5998
                                    Top =5919
                                    Width =11907
                                    Height =5421
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;3969;3969;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Datensätze, die von mir markiert wurden"

                                    LayoutCachedLeft =5998
                                    LayoutCachedTop =5919
                                    LayoutCachedWidth =17905
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
                                    Left =4121
                                    Top =5902
                                    Height =227
                                    FontWeight =600
                                    TabIndex =1
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"
                                    AsianLineBreak =255

                                    LayoutCachedLeft =4121
                                    LayoutCachedTop =5902
                                    LayoutCachedWidth =5822
                                    LayoutCachedHeight =6129
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4122
                                    Top =6143
                                    Height =5197
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

                                    LayoutCachedLeft =4122
                                    LayoutCachedTop =6143
                                    LayoutCachedWidth =5823
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgOutlook"
                            Caption ="Outlook"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    IMESentenceMode =3
                                    ColumnCount =8
                                    Left =6578
                                    Top =5922
                                    Width =11340
                                    Height =5418
                                    BackColor =15066597
                                    Name ="lstOutlook"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;0;2268;2268;2268"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der in Outlook neu erstellten Kontakte.\015\012Ducrh Doppelclick kann man "
                                        "den Abgleich mit Outlook starten"

                                    LayoutCachedLeft =6578
                                    LayoutCachedTop =5922
                                    LayoutCachedWidth =17918
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4190
                                    Top =5922
                                    Width =2268
                                    Height =5418
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstOutlookAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der neuen Outlook-Daten"

                                    LayoutCachedLeft =4190
                                    LayoutCachedTop =5922
                                    LayoutCachedWidth =6458
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgPicture"
                            Caption ="Bilder"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin Label
                                    Visible = NotDefault
                                    OverlapFlags =255
                                    Left =4488
                                    Top =6247
                                    Width =6450
                                    Height =5093
                                    FontSize =20
                                    Name ="lblBilder"
                                    Caption ="Wenn Bilder hinterlegt sind (Nachname Vorname als Filename)\015\012werden diese "
                                        "hier angezeigt"
                                    LayoutCachedLeft =4488
                                    LayoutCachedTop =6247
                                    LayoutCachedWidth =10938
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =11395
                                    Top =7312
                                    Width =6521
                                    Height =4028
                                    BackColor =15066597
                                    Name ="lstPicture"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;3402;1134;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Bilder\015\012Durch Anclicken wird links das Bild angezeigt; durch Dop"
                                        "pelclick geöffnet\015\012\015\012-Als Stichwort hinterlegte Bilder oder\015\012-"
                                        "Bilder im Ordner (im Lexikon hinterlegt), in denen der Vor- /Nachname vorkommt"

                                    LayoutCachedLeft =11395
                                    LayoutCachedTop =7312
                                    LayoutCachedWidth =17916
                                    LayoutCachedHeight =11340
                                End
                                Begin Image
                                    SizeMode =3
                                    Left =4183
                                    Top =5935
                                    Width =7131
                                    Height =5405
                                    Name ="picture"
                                    ControlTipText ="rechts markiertes Bild"

                                    LayoutCachedLeft =4183
                                    LayoutCachedTop =5935
                                    LayoutCachedWidth =11314
                                    LayoutCachedHeight =11340
                                    TabIndex =1
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =11395
                                    Top =5935
                                    Width =6521
                                    Height =1332
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstPictureAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der Bilder"

                                    LayoutCachedLeft =11395
                                    LayoutCachedTop =5935
                                    LayoutCachedWidth =17916
                                    LayoutCachedHeight =7267
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgDateiAblage"
                            Caption ="DMS / Datei-Ablage"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =6521
                                    Top =5935
                                    Width =11624
                                    Height =5405
                                    BackColor =15066597
                                    Name ="lstExplorer"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;3969;852;1701"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Files\015\012Doppel-Klick zum Öffnen der Files im Windows Explorer"

                                    LayoutCachedLeft =6521
                                    LayoutCachedTop =5935
                                    LayoutCachedWidth =18145
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4120
                                    Top =6805
                                    Width =2268
                                    Height =4535
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstExplorerAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Files"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =6805
                                    LayoutCachedWidth =6388
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =4120
                                    Top =5937
                                    Width =2268
                                    Height =810
                                    FontWeight =700
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstExplorerSource"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"DMS\""
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =5937
                                    LayoutCachedWidth =6388
                                    LayoutCachedHeight =6747
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgWV"
                            Caption ="Wiedervorlagen"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    IMESentenceMode =3
                                    ColumnCount =13
                                    Left =6563
                                    Top =7171
                                    Width =11340
                                    Height =4169
                                    BackColor =12975858
                                    Name ="lstWv"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;0;0;907;680;2835;1701;1701;1134;1134"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    OnClick ="[Event Procedure]"
                                    Tag ="2355"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Wiedervorlagen (WV)\015\012Doppelclick:\015\012-im linken Bereich öffn"
                                        "et Editier-Modus\015\012-auf Partner zeigt Person\015\012-auf Firma zeigt Firma\015"
                                        "\012-auf Projekt zeigt Vorgang\015\012mehrere WV markieren mit SHIFT/CTRL-Taste"

                                    LayoutCachedLeft =6563
                                    LayoutCachedTop =7171
                                    LayoutCachedWidth =17903
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4189
                                    Top =5941
                                    Width =2268
                                    Height =5399
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstWvAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen zu Wiedervorlagen"

                                    LayoutCachedLeft =4189
                                    LayoutCachedTop =5941
                                    LayoutCachedWidth =6457
                                    LayoutCachedHeight =11340
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =0
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    Left =6563
                                    Top =5941
                                    Width =11340
                                    Height =1134
                                    FontSize =11
                                    BackColor =15527148
                                    Name ="txtWV"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Beschreibung der Wiedervorlage zum aktuell markierten Datensatz\015\012Doppelcli"
                                        "ck, um diese Daten zu editieren!"
                                    AsianLineBreak =1
                                    TextFormat =1

                                    LayoutCachedLeft =6563
                                    LayoutCachedTop =5941
                                    LayoutCachedWidth =17903
                                    LayoutCachedHeight =7075
                                    BorderThemeColorIndex =3
                                    BorderShade =90.0
                                    ForeThemeColorIndex =2
                                    ForeShade =50.0
                                    GridlineThemeColorIndex =1
                                    GridlineShade =65.0
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgAudit"
                            Caption ="Audit"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =6002
                                    Top =5928
                                    Width =12111
                                    Height =5412
                                    BackColor =14803425
                                    Name ="lstAudit"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1134;1701;3402;3402"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Doppelclick öffnet Formular Audit und zeigt Details!"

                                    LayoutCachedLeft =6002
                                    LayoutCachedTop =5928
                                    LayoutCachedWidth =18113
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4199
                                    Top =5928
                                    Height =5412
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstAuditAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Dienste"

                                    LayoutCachedLeft =4199
                                    LayoutCachedTop =5928
                                    LayoutCachedWidth =5900
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgDSGVO"
                            ControlTipText ="Datenschutzrichtlinie"
                            Caption ="DSGVO"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =7649
                                    Top =5928
                                    Width =10530
                                    Height =5412
                                    BackColor =15066597
                                    Name ="lstDSGVO"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2835;3969"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Infos zur Datenschutzrichtline; abgelegt unter Stichworten"

                                    LayoutCachedLeft =7649
                                    LayoutCachedTop =5928
                                    LayoutCachedWidth =18179
                                    LayoutCachedHeight =11340
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4190
                                    Top =5928
                                    Width =3402
                                    Height =5412
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstDSGVOact"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2553"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling Datenschutzrichtlinie"

                                    LayoutCachedLeft =4190
                                    LayoutCachedTop =5928
                                    LayoutCachedWidth =7592
                                    LayoutCachedHeight =11340
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =5835
                            Width =14100
                            Height =5505
                            Name ="pgWichtigeInfo"
                            ControlTipText ="Datenschutzrichtlinie"
                            Caption ="WICHTIGE Infos"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =5835
                            LayoutCachedWidth =18180
                            LayoutCachedHeight =11340
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =4253
                                    Top =8278
                                    Width =13892
                                    Height =3062
                                    BackColor =15066597
                                    Name ="lstWichtigeInfo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2835;7371;1134;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbF_Adresse"
                                    ControlTipText ="Liste der wichtigen Infos\015\012Klick zum Anzeigen des gesamten Textes oben, de"
                                        "r formatierbar ist"

                                    LayoutCachedLeft =4253
                                    LayoutCachedTop =8278
                                    LayoutCachedWidth =18145
                                    LayoutCachedHeight =11340
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =8505
                                    Top =5954
                                    Width =9639
                                    FontWeight =700
                                    TabIndex =1
                                    Name ="wichtigeInfoTitel"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    ControlTipText ="Nummer (Abteilung, Kunde-Nr....)"

                                    LayoutCachedLeft =8505
                                    LayoutCachedTop =5954
                                    LayoutCachedWidth =18144
                                    LayoutCachedHeight =6194
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =7365
                                            Top =5954
                                            Width =912
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld383"
                                            Caption ="Titel"
                                            FontName ="Arial"
                                            ControlTipText ="Alle Adressen anzeigen mit Abteilung= Vertriebsleiter Inland"
                                            LayoutCachedLeft =7365
                                            LayoutCachedTop =5954
                                            LayoutCachedWidth =8277
                                            LayoutCachedHeight =6209
                                        End
                                    End
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    Left =7371
                                    Top =6299
                                    Width =10773
                                    Height =1923
                                    FontSize =11
                                    TabIndex =2
                                    Name ="wichtigeInfo"
                                    FontName ="Aptos"
                                    OnChange ="[Event Procedure]"
                                    ControlTipText ="wichtige Info"
                                    ConditionalFormat = Begin
                                        0x01000000ce000000010000000100000000000000000000003600000001000000 ,
                                        0x00000000fff20000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x49006e0053007400720028005b00420065006d00660075006e006b0074006900 ,
                                        0x6f006e005d002c0027004600fc007200200075006e00730020006e0069006300 ,
                                        0x6800740020006d0065006800720020007a00750073007400e4006e0064006900 ,
                                        0x6700270029003e00300000000000
                                    End
                                    TextFormat =1

                                    LayoutCachedLeft =7371
                                    LayoutCachedTop =6299
                                    LayoutCachedWidth =18144
                                    LayoutCachedHeight =8222
                                    ConditionalFormat14 = Begin
                                        0x01000100000001000000000000000100000000000000fff20000350000004900 ,
                                        0x6e0053007400720028005b00420065006d00660075006e006b00740069006f00 ,
                                        0x6e005d002c0027004600fc007200200075006e00730020006e00690063006800 ,
                                        0x740020006d0065006800720020007a00750073007400e4006e00640069006700 ,
                                        0x270029003e003000000000000000000000000000000000000000000000
                                    End
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4253
                                    Top =5954
                                    Width =2268
                                    Height =2268
                                    TabIndex =3
                                    BackColor =12975858
                                    Name ="lstWichtigeInfoAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2554"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling Datenschutzrichtlinie"

                                    LayoutCachedLeft =4253
                                    LayoutCachedTop =5954
                                    LayoutCachedWidth =6521
                                    LayoutCachedHeight =8222
                                End
                                Begin CommandButton
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =6633
                                    Top =5952
                                    Width =576
                                    Height =576
                                    TabIndex =4
                                    Name ="btnwichtigeInfoSave"
                                    Caption ="btnwichtigeInfoSave"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00ddddddddddddddddddd0d0d0d0ddddddddddddddd00ddddd ,
                                        0xddddddddd000ddddddddddddd0b70dddddddddddd0b80ddddddddddddd0b70dd ,
                                        0xd00000000d0b80dd033000330dd0b70d033000330dd0b00d033333330ddd0110 ,
                                        0x033333330ddd000d033000030ddddddd030888030ddddddd030888030ddddddd ,
                                        0x000000000ddddddd000000000000000000000000000000000000000000000000 ,
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
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Datensatz speichern"

                                    LayoutCachedLeft =6633
                                    LayoutCachedTop =5952
                                    LayoutCachedWidth =7209
                                    LayoutCachedHeight =6528
                                End
                            End
                        End
                    End
                End
                Begin Tab
                    OverlapFlags =85
                    Left =3960
                    Width =14370
                    Height =5355
                    FontWeight =600
                    TabIndex =7
                    Name ="RegMain"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =3960
                    LayoutCachedWidth =18330
                    LayoutCachedHeight =5355
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =4095
                            Top =417
                            Width =14106
                            Height =4808
                            Name ="pageFunktion"
                            ControlTipText ="weitere Daten zur Adresse (Funktion)"
                            Caption ="TestNachname Otto  3 wichtige Infos               "
                            LayoutCachedLeft =4095
                            LayoutCachedTop =417
                            LayoutCachedWidth =18201
                            LayoutCachedHeight =5225
                            Begin
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    TextAlign =1
                                    ListRows =20
                                    ListWidth =1134
                                    Left =5931
                                    Top =604
                                    Width =1134
                                    Height =255
                                    Name ="ArtAdresse"
                                    ControlSource ="ArtAdresse"
                                    RowSourceType ="Table/Query"
                                    StatusBarText ="Anrede"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"Herr\""
                                    FontName ="Arial"
                                    ControlTipText ="Anrede (Herr oder Frau)"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =604
                                    LayoutCachedWidth =7065
                                    LayoutCachedHeight =859
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =20
                                    ListWidth =2268
                                    Left =7065
                                    Top =604
                                    Width =1134
                                    TabIndex =1
                                    Name ="Titel"
                                    ControlSource ="Titel"
                                    RowSourceType ="Table/Query"
                                    StatusBarText ="Titel"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Titel, z.B. <Dr.>"

                                    LayoutCachedLeft =7065
                                    LayoutCachedTop =604
                                    LayoutCachedWidth =8199
                                    LayoutCachedHeight =844
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =8289
                                    Top =600
                                    Width =567
                                    TabIndex =2
                                    Name ="Kurzzeichen"
                                    ControlSource ="Kurzzeichen"
                                    StatusBarText ="Kurzzeichen"
                                    FontName ="Arial"
                                    ControlTipText ="Kurzzeichen"

                                    LayoutCachedLeft =8289
                                    LayoutCachedTop =600
                                    LayoutCachedWidth =8856
                                    LayoutCachedHeight =840
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4120
                                    Top =890
                                    Width =1327
                                    Height =340
                                    TabIndex =3
                                    ForeColor =0
                                    Name ="btnName"
                                    Caption ="Name"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="TestNachname Otto : zeige alle Funktionen"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =890
                                    LayoutCachedWidth =5447
                                    LayoutCachedHeight =1230
                                    Overlaps =1
                                End
                                Begin OptionGroup
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    BorderWidth =3
                                    OverlapFlags =215
                                    Left =9044
                                    Top =579
                                    Width =1066
                                    Height =309
                                    TabIndex =4
                                    Name ="DuSie"
                                    ControlSource ="DuSie"

                                    LayoutCachedLeft =9044
                                    LayoutCachedTop =579
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =888
                                    Begin
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =9044
                                            Top =658
                                            Width =187
                                            Height =187
                                            OptionValue =1
                                            Name ="ogDu"
                                            OnMouseDown ="[Event Procedure]"

                                            LayoutCachedLeft =9044
                                            LayoutCachedTop =658
                                            LayoutCachedWidth =9231
                                            LayoutCachedHeight =845
                                            Begin
                                                Begin Label
                                                    OverlapFlags =215
                                                    TextAlign =1
                                                    Left =9218
                                                    Top =604
                                                    Width =270
                                                    Height =255
                                                    BackColor =12632256
                                                    Name ="Bezeichnungsfeld178"
                                                    Caption ="Du"
                                                    FontName ="Arial"
                                                    LayoutCachedLeft =9218
                                                    LayoutCachedTop =604
                                                    LayoutCachedWidth =9488
                                                    LayoutCachedHeight =859
                                                End
                                            End
                                        End
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =9583
                                            Top =658
                                            Width =187
                                            Height =187
                                            OptionValue =0
                                            Name ="ogSie"
                                            OnMouseDown ="[Event Procedure]"

                                            LayoutCachedLeft =9583
                                            LayoutCachedTop =658
                                            LayoutCachedWidth =9770
                                            LayoutCachedHeight =845
                                            Begin
                                                Begin Label
                                                    OverlapFlags =215
                                                    TextAlign =1
                                                    Left =9810
                                                    Top =604
                                                    Width =300
                                                    Height =255
                                                    BackColor =12632256
                                                    Name ="Bezeichnungsfeld180"
                                                    Caption ="Sie"
                                                    FontName ="Arial"
                                                    LayoutCachedLeft =9810
                                                    LayoutCachedTop =604
                                                    LayoutCachedWidth =10110
                                                    LayoutCachedHeight =859
                                                End
                                            End
                                        End
                                    End
                                End
                                Begin TextBox
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =5931
                                    Top =913
                                    Width =2268
                                    Height =285
                                    FontSize =10
                                    FontWeight =700
                                    TabIndex =5
                                    BorderColor =6723891
                                    Name ="Nachname"
                                    ControlSource ="Nachname"
                                    StatusBarText ="Nachname"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="m1"
                                    ControlTipText ="Nachname der Person:\015\012\015\012TestNachname\015\012Doppelcick nimmgt die Ad"
                                        "resse in den Zwischenspeicher!"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =913
                                    LayoutCachedWidth =8199
                                    LayoutCachedHeight =1198
                                End
                                Begin TextBox
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =8289
                                    Top =913
                                    Width =1821
                                    Height =255
                                    FontWeight =700
                                    TabIndex =6
                                    Name ="Vorname"
                                    ControlSource ="Vorname"
                                    StatusBarText ="Vorname"
                                    FontName ="Arial"
                                    Tag ="m2"
                                    ControlTipText ="Vorname"

                                    LayoutCachedLeft =8289
                                    LayoutCachedTop =913
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =1168
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =2835
                                    Left =5931
                                    Top =1316
                                    Width =2268
                                    Height =255
                                    TabIndex =7
                                    Name ="Beruf"
                                    ControlSource ="Beruf"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Beruf"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =1316
                                    LayoutCachedWidth =8199
                                    LayoutCachedHeight =1571
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =5931
                                    Top =1650
                                    Width =1266
                                    Height =255
                                    TabIndex =8
                                    Name ="GebTag"
                                    ControlSource ="GebTag"
                                    Format ="dd\\.mm\\.yyyy"
                                    ValidationRule ="(<=date() And >=date()-36555) Or Is Null"
                                    ValidationText ="nicht älter als 100 Jahre und NICHT in der Zukunft"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    OnChange ="[Event Procedure]"
                                    ControlTipText ="Geburtstag (mit +/- Taste um einen Tag ändern)"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =1650
                                    LayoutCachedWidth =7197
                                    LayoutCachedHeight =1905
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =1986
                                    Left =5931
                                    Top =1946
                                    Width =4175
                                    Height =255
                                    TabIndex =9
                                    Name ="Strasse"
                                    ControlSource ="Strasse"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Strasse mit Nr."

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =1946
                                    LayoutCachedWidth =10106
                                    LayoutCachedHeight =2201
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =2
                                            Left =4120
                                            Top =1953
                                            Width =1701
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld198"
                                            Caption ="Strasse u. Nr."
                                            FontName ="Arial"
                                            LayoutCachedLeft =4120
                                            LayoutCachedTop =1953
                                            LayoutCachedWidth =5821
                                            LayoutCachedHeight =2208
                                        End
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =40
                                    ListWidth =2553
                                    Left =5931
                                    Top =2292
                                    Width =885
                                    Height =255
                                    TabIndex =10
                                    Name ="Land"
                                    ControlSource ="Land"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;1701"
                                    StatusBarText ="Land"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"D\""
                                    FontName ="Arial"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Land"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =2292
                                    LayoutCachedWidth =6816
                                    LayoutCachedHeight =2547
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =3402
                                    Left =6898
                                    Top =2292
                                    Width =1089
                                    Height =255
                                    TabIndex =11
                                    Name ="PLZStrasse"
                                    ControlSource ="PLZStrasse"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="858;1992;567"
                                    StatusBarText ="PLZ"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="PLZ"

                                    LayoutCachedLeft =6898
                                    LayoutCachedTop =2292
                                    LayoutCachedWidth =7987
                                    LayoutCachedHeight =2547
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ListRows =30
                                    ListWidth =3687
                                    Left =8023
                                    Top =2292
                                    Width =1806
                                    Height =255
                                    TabIndex =12
                                    Name ="Ort"
                                    ControlSource ="Ort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1994"
                                    StatusBarText ="Ort"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Ort (ohne Update der PLZ)"

                                    LayoutCachedLeft =8023
                                    LayoutCachedTop =2292
                                    LayoutCachedWidth =9829
                                    LayoutCachedHeight =2547
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =2
                                    ListRows =30
                                    Left =11381
                                    Top =837
                                    Width =2961
                                    Height =255
                                    TabIndex =13
                                    Name ="Funktion"
                                    ControlSource ="Funktion"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2268;567"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Funktion"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =837
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =1092
                                    Begin
                                        Begin Label
                                            OverlapFlags =223
                                            TextAlign =2
                                            Left =10215
                                            Top =837
                                            Width =1077
                                            Height =255
                                            BackColor =12632256
                                            Name ="lblFunktion"
                                            Caption ="Funktion"
                                            FontName ="Arial"
                                            LayoutCachedLeft =10215
                                            LayoutCachedTop =837
                                            LayoutCachedWidth =11292
                                            LayoutCachedHeight =1092
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =4253
                                    Left =11374
                                    Top =1471
                                    Width =2961
                                    Height =255
                                    TabIndex =14
                                    Name ="Abteil"
                                    ControlSource ="Abteil"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3402;567"
                                    StatusBarText ="Abteilung"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Abteilung"

                                    LayoutCachedLeft =11374
                                    LayoutCachedTop =1471
                                    LayoutCachedWidth =14335
                                    LayoutCachedHeight =1726
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =2
                                            Left =10215
                                            Top =1475
                                            Width =1077
                                            Height =255
                                            BackColor =12632256
                                            Name ="lblAbteil"
                                            Caption ="Abteilung"
                                            FontName ="Arial"
                                            ControlTipText ="Alle Adressen anzeigen mit Abteilung= Geschäftsführer"
                                            LayoutCachedLeft =10215
                                            LayoutCachedTop =1475
                                            LayoutCachedWidth =11292
                                            LayoutCachedHeight =1730
                                        End
                                    End
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =11374
                                    Top =1776
                                    Width =2961
                                    TabIndex =15
                                    Name ="FunktionNr"
                                    ControlSource ="FunktionNr"
                                    FontName ="Arial"
                                    ControlTipText ="Nummer (Abteilung, Kunde-Nr....)"

                                    LayoutCachedLeft =11374
                                    LayoutCachedTop =1776
                                    LayoutCachedWidth =14335
                                    LayoutCachedHeight =2016
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =3
                                            Left =10215
                                            Top =1776
                                            Width =1077
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld212"
                                            Caption ="Nummer"
                                            FontName ="Arial"
                                            ControlTipText ="Alle Adressen anzeigen mit Abteilung= Vertriebsleiter Inland"
                                            LayoutCachedLeft =10215
                                            LayoutCachedTop =1776
                                            LayoutCachedWidth =11292
                                            LayoutCachedHeight =2031
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =3856
                                    Left =11381
                                    Top =2100
                                    Width =2961
                                    Height =255
                                    TabIndex =16
                                    Name ="BauBuero"
                                    ControlSource ="BauBuero"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3402;287"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Bau / Büro / Wohnung"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =2100
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =2355
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =11381
                                    Top =2491
                                    Width =2268
                                    Height =255
                                    TabIndex =17
                                    Name ="Telefon"
                                    ControlSource ="Telefon"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    OnLostFocus ="[Event Procedure]"
                                    ControlTipText ="Telefon"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =2491
                                    LayoutCachedWidth =13649
                                    LayoutCachedHeight =2746
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =223
                                    Left =11381
                                    Top =2841
                                    Width =2961
                                    Height =255
                                    TabIndex =18
                                    Name ="Fax"
                                    ControlSource ="Fax"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    ControlTipText ="Fax"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =2841
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =3096
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =11381
                                    Top =3190
                                    Width =2961
                                    Height =255
                                    TabIndex =19
                                    Name ="EMail"
                                    ControlSource ="EMail"
                                    BeforeUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnExit ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="eMail-Adresse\015\012Hinweis: Wenn nur die Domäne geändert wird, kontrolliert <F"
                                        "irma> auch andere davon betroffene Mail-Adressen der gleichen Domäne"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =3190
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =3445
                                End
                                Begin TextBox
                                    FontUnderline = NotDefault
                                    IsHyperlink = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =11381
                                    Top =3539
                                    Width =2961
                                    Height =255
                                    TabIndex =20
                                    ForeColor =16711680
                                    Name ="Internet"
                                    ControlSource ="Internet"
                                    OnExit ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="Internet"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =3539
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =3794
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =11381
                                    Top =3888
                                    Width =1985
                                    Height =255
                                    TabIndex =21
                                    Name ="Mobil"
                                    ControlSource ="Mobil"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    OnLostFocus ="[Event Procedure]"
                                    ControlTipText ="Mobil-Phone"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =3888
                                    LayoutCachedWidth =13366
                                    LayoutCachedHeight =4143
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =11383
                                    Top =4253
                                    Width =4134
                                    Height =969
                                    FontSize =11
                                    TabIndex =22
                                    Name ="BemFunktion"
                                    ControlSource ="BemFunktion"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Aptos"
                                    ControlTipText ="Bemerkungen zur Funktion  (Doppelclick zum Zoomen und Editieren)"
                                    ConditionalFormat = Begin
                                        0x01000000ce000000010000000100000000000000000000003600000001000000 ,
                                        0x00000000fff20000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x49006e0053007400720028005b00420065006d00660075006e006b0074006900 ,
                                        0x6f006e005d002c0027004600fc007200200075006e00730020006e0069006300 ,
                                        0x6800740020006d0065006800720020007a00750073007400e4006e0064006900 ,
                                        0x6700270029003e00300000000000
                                    End
                                    TextFormat =1

                                    LayoutCachedLeft =11383
                                    LayoutCachedTop =4253
                                    LayoutCachedWidth =15517
                                    LayoutCachedHeight =5222
                                    ConditionalFormat14 = Begin
                                        0x01000100000001000000000000000100000000000000fff20000350000004900 ,
                                        0x6e0053007400720028005b00420065006d00660075006e006b00740069006f00 ,
                                        0x6e005d002c0027004600fc007200200075006e00730020006e00690063006800 ,
                                        0x740020006d0065006800720020007a00750073007400e4006e00640069006700 ,
                                        0x270029003e003000000000000000000000000000000000000000000000
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =4
                                    ListRows =30
                                    ListWidth =9924
                                    Left =5590
                                    Top =886
                                    Width =231
                                    Height =313
                                    TabIndex =23
                                    Name ="comNrAdresse"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;3402;2835;3402"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zuordnung der Adressen ändern"

                                    LayoutCachedLeft =5590
                                    LayoutCachedTop =886
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =1199
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =8289
                                    Top =1316
                                    Width =1821
                                    Height =255
                                    TabIndex =24
                                    Name ="Rufname"
                                    ControlSource ="Rufname"
                                    FontName ="Arial"
                                    ControlTipText ="Rufname, Spitzname, Nickname"

                                    LayoutCachedLeft =8289
                                    LayoutCachedTop =1316
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =1571
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4120
                                    Top =1593
                                    Height =340
                                    TabIndex =25
                                    ForeColor =0
                                    Name ="btnGebTag"
                                    Caption ="Geb.-Tag"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =1593
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =1933
                                    Overlaps =1
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    DecimalPlaces =0
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =7521
                                    Top =1650
                                    Width =678
                                    Height =255
                                    TabIndex =26
                                    BackColor =12632256
                                    Name ="GebAlter"
                                    ControlSource ="GebAlter"
                                    Format ="0\" J. alt\""
                                    StatusBarText ="Alter"
                                    FontName ="Arial"
                                    ControlTipText ="Alter"

                                    LayoutCachedLeft =7521
                                    LayoutCachedTop =1650
                                    LayoutCachedWidth =8199
                                    LayoutCachedHeight =1905
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =8289
                                    Top =1654
                                    Width =1821
                                    Height =255
                                    TabIndex =27
                                    BackColor =12632256
                                    Name ="Sternzeichen"
                                    ControlSource ="Sternzeichen"
                                    FontName ="Arial"
                                    ControlTipText ="Sternzeichen (berechnet aus Geburtsdatum)"

                                    LayoutCachedLeft =8289
                                    LayoutCachedTop =1654
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =1909
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4120
                                    Top =2255
                                    Height =340
                                    TabIndex =28
                                    ForeColor =0
                                    Name ="btnPLZ"
                                    Caption ="L-PLZ-Ort"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Öffne Länder-Tabelle\015\012Ergänzen, Anpassen u. Löschen von Länder-Infos wie z"
                                        ".b. Kurse"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =2255
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =2595
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =3687
                                    Left =9849
                                    Top =2292
                                    Width =261
                                    Height =255
                                    TabIndex =29
                                    Name ="OrtP"
                                    ControlSource ="Ort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1992;858;567"
                                    StatusBarText ="Ort"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Ort (mit Update der PLZ)"

                                    LayoutCachedLeft =9849
                                    LayoutCachedTop =2292
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =2547
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =5931
                                    Top =2597
                                    Width =4175
                                    Height =960
                                    TabIndex =30
                                    BackColor =14935011
                                    Name ="Postadr"
                                    ControlSource ="Postadr"
                                    FontName ="Arial"
                                    ControlTipText ="Postadresse:\015\012Wird automatisch erstellt, sofern Strasse, PLZ, Ort und Land"
                                        " eingetragen sind;\015\012Die Adresse kann aber beliebig angepasst werden: z.B. "
                                        "Eintrag des Postfachs\015\012\015\012Das ist die Regel:\015\012Strasse\015\012PL"
                                        "Z Ort\015\012LAND (grossgeschrieben,  nur wenn Ausland)"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =2597
                                    LayoutCachedWidth =10106
                                    LayoutCachedHeight =3557
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4120
                                    Top =2606
                                    Height =970
                                    TabIndex =31
                                    ForeColor =0
                                    Name ="btnCreatePostAdresse"
                                    Caption ="Post-Adresse"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Post-Adresse erzeugen aus Strasse / Land / PLZ / Ort"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =2606
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =3576
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =10215
                                    Top =507
                                    Width =1077
                                    Height =340
                                    TabIndex =32
                                    ForeColor =0
                                    Name ="btnZuord"
                                    Caption ="Zuordnung"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="TestNachname Otto Testfirma DB, Bad Krozingen : zeige alle zugeordneten Adressen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =507
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =847
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =223
                                    TextAlign =1
                                    Left =11381
                                    Top =552
                                    Width =3606
                                    TabIndex =33
                                    BackColor =13816530
                                    Name ="Wo"
                                    ControlSource ="Wo"
                                    FontName ="Arial"
                                    ControlTipText ="Die aktuelle Adresse \015\012TestNachname\015\012ist zugeordnet zu\015\012Testfi"
                                        "rma DB, Bad Krozingen"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =552
                                    LayoutCachedWidth =14987
                                    LayoutCachedHeight =792
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =3
                                    ListRows =40
                                    ListWidth =5955
                                    Left =14991
                                    Top =557
                                    Width =486
                                    Height =255
                                    TabIndex =34
                                    Name ="comNrAdrZuord"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;4824;854"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Jede Adresse benötigt eine Zuordnung"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="zugeordnete Adresse (kann hier geändert werden)"

                                    LayoutCachedLeft =14991
                                    LayoutCachedTop =557
                                    LayoutCachedWidth =15477
                                    LayoutCachedHeight =812
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =20
                                    ListWidth =1134
                                    Left =14370
                                    Top =837
                                    Width =1107
                                    TabIndex =35
                                    Name ="Unterschrift"
                                    ControlSource ="Unterschrift"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Unterschrift (i.V....)"

                                    LayoutCachedLeft =14370
                                    LayoutCachedTop =837
                                    LayoutCachedWidth =15477
                                    LayoutCachedHeight =1077
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =10215
                                    Top =1107
                                    Width =1077
                                    Height =340
                                    TabIndex =36
                                    ForeColor =0
                                    Name ="btnStartFunktion"
                                    Caption ="Beginn"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kalender öffnen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =1107
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =1447
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =12540
                                    Top =1107
                                    Width =741
                                    Height =340
                                    TabIndex =37
                                    ForeColor =0
                                    Name ="btnEndeFunktion"
                                    Caption ="Ende"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kalender öffnen"

                                    LayoutCachedLeft =12540
                                    LayoutCachedTop =1107
                                    LayoutCachedWidth =13281
                                    LayoutCachedHeight =1447
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =11381
                                    Top =1152
                                    Width =1011
                                    TabIndex =38
                                    Name ="StartFunktion"
                                    ControlSource ="StartFunktion"
                                    Format ="dd\\.mm\\.yy"
                                    StatusBarText ="Starttermin"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    ControlTipText ="Funktion beginnt am"

                                    LayoutCachedLeft =11381
                                    LayoutCachedTop =1152
                                    LayoutCachedWidth =12392
                                    LayoutCachedHeight =1392
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =13331
                                    Top =1152
                                    Width =1011
                                    TabIndex =39
                                    Name ="EndeFunktion"
                                    ControlSource ="EndeFunktion"
                                    Format ="dd\\.mm\\.yy"
                                    StatusBarText ="Endtermin"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    OnLostFocus ="[Event Procedure]"
                                    ControlTipText ="Die Funktion endet am...bitte Datum eingeben\015\012Falls eine Person verstorben"
                                        " ist, unter Stichworten <Todesursache> eingeben==>\015\012Person erscheint dann "
                                        "z.B. nicht mehr in der Geburtstagsliste.\015\012Doppelkick trägt das aktuelle Da"
                                        "tum ein."

                                    LayoutCachedLeft =13331
                                    LayoutCachedTop =1152
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =1392
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =10215
                                    Top =2086
                                    Width =1077
                                    Height =340
                                    TabIndex =40
                                    ForeColor =0
                                    Name ="btnBauBuero"
                                    Caption ="Bau / Büro"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="alle, die im gleichen Büro sitzen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =2086
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =2426
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =11001
                                    Top =2495
                                    Width =291
                                    Height =340
                                    TabIndex =41
                                    ForeColor =0
                                    Name ="btnCopyTelefon"
                                    Caption ="Telefon"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadadd000dad0000adadaada00da00dadadaddada0ad00adadada ,
                                        0xadad00a00dadadaddadad000dadadadaadada00000adadaddadada0ad00adada ,
                                        0xadadad00ad00adaddada00000ad000daadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Telefon-Nummer kopieren"

                                    LayoutCachedLeft =11001
                                    LayoutCachedTop =2495
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =2835
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    FontItalic = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =14412
                                    Top =1799
                                    Width =1101
                                    Height =640
                                    TabIndex =42
                                    ForeColor =0
                                    Name ="btnTelefon1"
                                    Caption ="Weitere infos"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="zeige alle Kommunikations-Möglichkeiten"

                                    LayoutCachedLeft =14412
                                    LayoutCachedTop =1799
                                    LayoutCachedWidth =15513
                                    LayoutCachedHeight =2439
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    FontItalic = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =14412
                                    Top =2496
                                    Width =1101
                                    Height =340
                                    TabIndex =43
                                    ForeColor =0
                                    Name ="btnTelefonF"
                                    Caption ="suche Tel"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Filtern nach Telefon-Nummer"

                                    LayoutCachedLeft =14412
                                    LayoutCachedTop =2496
                                    LayoutCachedWidth =15513
                                    LayoutCachedHeight =2836
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =10215
                                    Top =2497
                                    Width =737
                                    Height =340
                                    TabIndex =44
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
                                    ControlTipText ="AutoWähler"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =2497
                                    LayoutCachedWidth =10952
                                    LayoutCachedHeight =2837
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =10215
                                    Top =2835
                                    Width =737
                                    Height =340
                                    TabIndex =45
                                    ForeColor =0
                                    Name ="btnFax"
                                    Caption ="Fax"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0x000000000000000d0fffffffffffff0a0ffff44444ffff0d0fffffffffffff0a ,
                                        0x0ffff444444fff0d0fffffffffffff0a0ffffffffff11f0d0f0000fffff11f0a ,
                                        0x0fffffffffffff0d000000000000000aadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Fax"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =2835
                                    LayoutCachedWidth =10952
                                    LayoutCachedHeight =3175
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =11001
                                    Top =2835
                                    Width =291
                                    Height =340
                                    TabIndex =46
                                    ForeColor =0
                                    Name ="btnCopyFax"
                                    Caption ="Fax"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadadd000dad0000adadaada00da00dadadaddada0ad00adadada ,
                                        0xadad00a00dadadaddadad000dadadadaadada00000adadaddadada0ad00adada ,
                                        0xadadad00ad00adaddada00000ad000daadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Fax-Nummer kopieren"

                                    LayoutCachedLeft =11001
                                    LayoutCachedTop =2835
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =3175
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    FontItalic = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =14412
                                    Top =2836
                                    Width =1101
                                    Height =340
                                    TabIndex =47
                                    ForeColor =0
                                    Name ="btnFaxF"
                                    Caption ="suche Fax"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Filtern nach Fax-Nummer"

                                    LayoutCachedLeft =14412
                                    LayoutCachedTop =2836
                                    LayoutCachedWidth =15513
                                    LayoutCachedHeight =3176
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =14412
                                    Top =3192
                                    Width =1101
                                    Height =340
                                    TabIndex =48
                                    ForeColor =0
                                    Name ="btnContactinOutlook"
                                    Caption ="Outlook"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="nach Outlook übertragen als Kontakt"

                                    LayoutCachedLeft =14412
                                    LayoutCachedTop =3192
                                    LayoutCachedWidth =15513
                                    LayoutCachedHeight =3532
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    AccessKey =77
                                    Left =10215
                                    Top =3175
                                    Width =737
                                    Height =340
                                    TabIndex =49
                                    ForeColor =0
                                    Name ="btnEmail"
                                    Caption ="e&Mail"
                                    StatusBarText ="Fax"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadada080adaddadadada080f0ada ,
                                        0xadadada080fff0addadada080fcfff0aadada080fcfc91f0dada080fcfcf110a ,
                                        0x000080fffcfff00008070808888800300b30000000000330080fbfbfbfbfb030 ,
                                        0x00fbfbfbfbfbfb000000000000000000adadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="eMail öffnen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =3175
                                    LayoutCachedWidth =10952
                                    LayoutCachedHeight =3515
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =11001
                                    Top =3175
                                    Width =291
                                    Height =340
                                    TabIndex =50
                                    ForeColor =0
                                    Name ="btnCopyEmail"
                                    Caption ="Email"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadadd000dad0000adadaada00da00dadadaddada0ad00adadada ,
                                        0xadad00a00dadadaddadad000dadadadaadada00000adadaddadada0ad00adada ,
                                        0xadadad00ad00adaddada00000ad000daadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Email-Nummer kopieren"

                                    LayoutCachedLeft =11001
                                    LayoutCachedTop =3175
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =3515
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =10215
                                    Top =3515
                                    Width =737
                                    Height =340
                                    TabIndex =51
                                    ForeColor =0
                                    Name ="btnInternet"
                                    Caption ="Internet"
                                    StatusBarText ="Fax"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadada00000adadaddad00ee27e00dada ,
                                        0xad0eee2727ee0dadd0eeee7272eee0daa0eeee27272ee0ad0eeeee72727eee0a ,
                                        0x0ee727272727ee0d0ee272727272e20a0ee727272727270d0ee2727e72e2720a ,
                                        0xa0ee27eeeee720add0e27272727270daad0ee72727270daddad00e727200dada ,
                                        0xadada00000adadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Internet öffnen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =3515
                                    LayoutCachedWidth =10952
                                    LayoutCachedHeight =3855
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =11001
                                    Top =3515
                                    Width =291
                                    Height =340
                                    TabIndex =52
                                    ForeColor =0
                                    Name ="btnCopyInternet"
                                    Caption ="Internet kopieren"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadadd000dad0000adadaada00da00dadadaddada0ad00adadada ,
                                        0xadad00a00dadadaddadad000dadadadaadada00000adadaddadada0ad00adada ,
                                        0xadadad00ad00adaddada00000ad000daadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Web-Adresse kopieren"

                                    LayoutCachedLeft =11001
                                    LayoutCachedTop =3515
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =3855
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =10215
                                    Top =3855
                                    Width =737
                                    Height =340
                                    TabIndex =53
                                    ForeColor =0
                                    Name ="btnMobil"
                                    Caption ="Mobile"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Mobile-Nummer wählen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =3855
                                    LayoutCachedWidth =10952
                                    LayoutCachedHeight =4195
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =11001
                                    Top =3855
                                    Width =291
                                    Height =340
                                    TabIndex =54
                                    ForeColor =0
                                    Name ="btnCopyHandy"
                                    Caption ="Handynummer kopieren"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadadd000dad0000adadaada00da00dadadaddada0ad00adadada ,
                                        0xadad00a00dadadaddadad000dadadadaadada00000adadaddadada0ad00adada ,
                                        0xadadad00ad00adaddada00000ad000daadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Handynummer kopieren"

                                    LayoutCachedLeft =11001
                                    LayoutCachedTop =3855
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =4195
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    FontItalic = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =14412
                                    Top =3856
                                    Width =1101
                                    Height =340
                                    TabIndex =55
                                    ForeColor =0
                                    Name ="btnMobilF"
                                    Caption ="suche Mobil"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Filtern nach Handy-Nummer"

                                    LayoutCachedLeft =14412
                                    LayoutCachedTop =3856
                                    LayoutCachedWidth =15513
                                    LayoutCachedHeight =4196
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =5931
                                    Top =3581
                                    Width =454
                                    Height =285
                                    FontSize =10
                                    FontWeight =700
                                    TabIndex =56
                                    BorderColor =6723891
                                    Name ="marker"
                                    ControlSource ="M"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    Tag ="a"
                                    ControlTipText ="persönlichen Marker setzen / entfernen"

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =3581
                                    LayoutCachedWidth =6385
                                    LayoutCachedHeight =3866
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =4120
                                    Top =3611
                                    Height =340
                                    TabIndex =57
                                    ForeColor =0
                                    Name ="btnAdrSecurity"
                                    Caption ="security"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =3611
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =3951
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =2
                                    ListRows =20
                                    ListWidth =1134
                                    Left =4120
                                    Top =3931
                                    Height =255
                                    TabIndex =58
                                    Name ="AdrSecurity"
                                    ControlSource ="AdrSecurity"
                                    RowSourceType ="Table/Query"
                                    StatusBarText ="Anrede"
                                    ValidationRule ="Between 0 And 5"
                                    ValidationText ="\"nur Zahlen zwischen 0 und 5!\""
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =3931
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =4186
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =5931
                                    Top =3968
                                    Width =4175
                                    Height =1257
                                    FontSize =11
                                    TabIndex =59
                                    Name ="BemAdresse"
                                    ControlSource ="BemAdresse"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Aptos"
                                    ControlTipText ="Bemerkungen zur Adresse (Doppelclick zum Zoomen und Editieren)"
                                    TextFormat =1

                                    LayoutCachedLeft =5931
                                    LayoutCachedTop =3968
                                    LayoutCachedWidth =10106
                                    LayoutCachedHeight =5225
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =1
                                            Left =4120
                                            Top =4297
                                            Width =1701
                                            Height =519
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld70"
                                            Caption ="Bemerkung zur Adresse"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4120
                                            LayoutCachedTop =4297
                                            LayoutCachedWidth =5821
                                            LayoutCachedHeight =4816
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =8798
                                    Top =3571
                                    Width =1312
                                    Height =340
                                    TabIndex =60
                                    ForeColor =0
                                    Name ="btnGoogleMap"
                                    Caption ="google Maps"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="sucht in Google maps nach der Adresse"

                                    LayoutCachedLeft =8798
                                    LayoutCachedTop =3571
                                    LayoutCachedWidth =10110
                                    LayoutCachedHeight =3911
                                    Overlaps =1
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =15603
                                    Top =417
                                    Width =2598
                                    Height =4799
                                    TabIndex =61
                                    BackColor =12975858
                                    Name ="lstact"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="39"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit der Adresse"

                                    LayoutCachedLeft =15603
                                    LayoutCachedTop =417
                                    LayoutCachedWidth =18201
                                    LayoutCachedHeight =5216
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =4120
                                    Top =1304
                                    Height =255
                                    TabIndex =62
                                    Name ="txtBeruf"
                                    ControlSource ="txtBeruf"
                                    FontName ="Arial"
                                    ControlTipText ="Adress-Info"

                                    LayoutCachedLeft =4120
                                    LayoutCachedTop =1304
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =1559
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =7213
                                    Top =3571
                                    Width =1582
                                    Height =340
                                    TabIndex =63
                                    ForeColor =0
                                    Name ="btnGoogleMapRoute"
                                    Caption ="google Maps ROUTE"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="sucht in Google maps nach der Route von der Firmenadresse aus"

                                    LayoutCachedLeft =7213
                                    LayoutCachedTop =3571
                                    LayoutCachedWidth =8795
                                    LayoutCachedHeight =3911
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =10215
                                    Top =4253
                                    Width =1077
                                    Height =669
                                    TabIndex =64
                                    ForeColor =0
                                    Name ="btnBemFunktion"
                                    Caption ="Bemerkung zur Funktion"
                                    StatusBarText ="Fax"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Bemerkugen zur Funktion zoomen"

                                    LayoutCachedLeft =10215
                                    LayoutCachedTop =4253
                                    LayoutCachedWidth =11292
                                    LayoutCachedHeight =4922
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =13785
                                    Top =2497
                                    Width =557
                                    Height =340
                                    TabIndex =65
                                    ForeColor =0
                                    Name ="btnRückruf1"
                                    Caption ="Bitte um Rückruf"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="bitte um Rückruf"
                                    ImageData = Begin
                                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000000000000000000000000000ffffff30ffffff80ffffffc0a09080ff ,
                                        0xe0d0d0e0906850ff000000000000000000000000c09080ffc09090ffc09080ff ,
                                        0xc08080ffb08080ffb07870ffb07870ffc09090ffd0b8b0fff0e0e0ffd0c0c0ff ,
                                        0x906850ff906850ff000000000000000000000000c09090fff0d8c0fffff8d0ff ,
                                        0xfff0c0ffffe8b0ffffd8a0ffffd0a0ffffd0a0ffffd8c0ffffe8e0ff907860ff ,
                                        0x906850ff906850ff000000000000000000000000c09890ffd09080fffff0e0ff ,
                                        0xfff8f0fffff8e0fffff8d0fffff0c0ffffe8c0fffff0d0fffff0e0fffff0e0ff ,
                                        0xf0e0e0fff0d8e0ff000000000000000000000000d0a0a0ffffe8c0ffd0a090ff ,
                                        0xf0f0e0fffffff0fffff8e0fffff8e0fffff0d0fffff0c0ffffe8d0ffe0c0b0ff ,
                                        0xf0e0c0ffd0b8b0ff000000000000000000000000e0c8c0fffffff0ffffe8e0ff ,
                                        0xe0c8c0fffff0f0fffff8f0fffff8e0fffff0e0fff0d8c0ffc09080fff0d8c0ff ,
                                        0xf0d8b0ffb09090ff000000000000000000000000f0f0f0ff5090a0ff406070ff ,
                                        0xf0fffffff0e0e0ffe0d8d0ffe0c8c0ffd0a8a0ffb09890ff70d8ffffb09890ff ,
                                        0xf0d0b0ffb08080ff6090a0ff6090a0f0408090f04088a0ff307890ff306880ff ,
                                        0x306070ff305870ff305060ff305060ffc0f0ffff90e0ffff70d8ffff70d8ffff ,
                                        0xb09080ffa07870ff70b0c0f0d0f8ffffc0f0ffff90e8f0ff70d8f0ff60c8e0ff ,
                                        0x50b0d0ff4098b0ff407890ff506880ffc0e8ffff80d8f0ff70c8f0ff60c8f0ff ,
                                        0x60c8f0ffb07880f070b0c04070b8c0f0e0ffffffc0f8ffffa0e8f0ff90d0e0ff ,
                                        0x60a8c0ff4088a0ff507890fff0ffffffd0f8ffffb0f0ffff80e8ffff80e0ffff ,
                                        0xb08880f0c098903070b0c00080c0d07070b0c0ff90d0e0ff60b8d0ff4090b0ff ,
                                        0x307890ff305870fffffffffff0ffffffe0ffffffb0f8ffff90e8ffffb07880f0 ,
                                        0xb09090200000000000000000a0e0f01070b0d0ffc0f8ffffb0f0ffff70d8f0ff ,
                                        0x40b8e0ff306880fffffffffff0ffffffe0ffffffb0f8ffffb07880f0c0989030 ,
                                        0x0000000000000000000000000000000070b8d0ffe0ffffffd0f8ffffb0f0ffff ,
                                        0x70d0f0ff306880fff0e0e0ffd0b0b0ffc0a090ffc09890ffc098904000000000 ,
                                        0x0000000000000000000000000000000080c0d0ffe0ffffffe0ffffffd0ffffff ,
                                        0xa0e0f0ff407080ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000070b8d07080c0d0ff70b0c0ff60a0c0ff ,
                                        0x5090a0ff70b8d060000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000
                                    End

                                    LayoutCachedLeft =13785
                                    LayoutCachedTop =2497
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =2837
                                    Overlaps =1
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =4810
                                    Top =604
                                    Width =1011
                                    Height =255
                                    FontWeight =700
                                    TabIndex =66
                                    BackColor =15527148
                                    Name ="NrFunktion"
                                    ControlSource ="NrFunktion"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="ID der Funktion = NrFunktion (Datenbankschlüssel)\015\012Mit Doppelklick wird di"
                                        "ese Adresse markiert"

                                    LayoutCachedLeft =4810
                                    LayoutCachedTop =604
                                    LayoutCachedWidth =5821
                                    LayoutCachedHeight =859
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =13435
                                    Top =3855
                                    Width =907
                                    Height =340
                                    TabIndex =67
                                    ForeColor =0
                                    Name ="btnWhatsApp"
                                    Caption ="WhatsApp"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="sendet eine Nachricht über WhatsApp, falls eine korrekte MobilNr. eingetragen is"
                                        "t"

                                    LayoutCachedLeft =13435
                                    LayoutCachedTop =3855
                                    LayoutCachedWidth =14342
                                    LayoutCachedHeight =4195
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4138
                                    Top =453
                                    Width =557
                                    Height =340
                                    TabIndex =68
                                    ForeColor =0
                                    Name ="btnWichtigeInfo"
                                    Caption ="wichtige Infos"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00ddddddddddddddddddddddd99ddddddddddddd9999dddddd ,
                                        0xddddddd99dddddddddddddddddddddddddddddddddddddddddddddd99ddddddd ,
                                        0xddddddd99dddddddddddddd99ddddddddddddd9999dddddddddddd9999dddddd ,
                                        0xdddddd9999dddddddddddd9999dddddddddddd9999ddddddddddddd99ddddddd ,
                                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
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
                                    ControlTipText ="wichtige Infos\015\012      - anzeigen, wenn vorhanden\015\012      - ausblenden"
                                        ", wenn angezeigt\015\012"

                                    LayoutCachedLeft =4138
                                    LayoutCachedTop =453
                                    LayoutCachedWidth =4695
                                    LayoutCachedHeight =793
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4095
                            Top =420
                            Width =14100
                            Height =4800
                            Name ="SeiteDruck"
                            ControlTipText ="Drucken / Emails / Massensendungen"
                            Caption ="       eMail   /   Brief schreiben"
                            LayoutCachedLeft =4095
                            LayoutCachedTop =420
                            LayoutCachedWidth =18195
                            LayoutCachedHeight =5220
                            Begin
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =13329
                                    Top =792
                                    Width =4550
                                    Height =4151
                                    BackColor =12975858
                                    Name ="lstTxtMemo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="39"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit der Bemerkung"

                                    LayoutCachedLeft =13329
                                    LayoutCachedTop =792
                                    LayoutCachedWidth =17879
                                    LayoutCachedHeight =4943
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =10
                                    ListRows =30
                                    ListWidth =6237
                                    Left =5954
                                    Top =492
                                    Width =1134
                                    Height =255
                                    TabIndex =1
                                    Name ="NrMitarbeiter"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;2268;2268;0;0;0;0;0;0"
                                    BeforeUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Verantwortlicher Mitarbeiter"

                                    LayoutCachedLeft =5954
                                    LayoutCachedTop =492
                                    LayoutCachedWidth =7088
                                    LayoutCachedHeight =747
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =2
                                            Left =4095
                                            Top =492
                                            Width =1701
                                            Height =240
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld209"
                                            Caption ="Mandant"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4095
                                            LayoutCachedTop =492
                                            LayoutCachedWidth =5796
                                            LayoutCachedHeight =732
                                        End
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =8
                                    ListRows =30
                                    ListWidth =6237
                                    Left =9121
                                    Top =492
                                    Width =1134
                                    Height =255
                                    TabIndex =2
                                    Name ="NrMitarbeiter1"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;2268;2268;0;0;0;0"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Verantwortlicher Mitarbeiter"

                                    LayoutCachedLeft =9121
                                    LayoutCachedTop =492
                                    LayoutCachedWidth =10255
                                    LayoutCachedHeight =747
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =2
                                            Left =7935
                                            Top =492
                                            Width =1140
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld318"
                                            Caption ="Unterschrift 2"
                                            FontName ="Arial"
                                            LayoutCachedLeft =7935
                                            LayoutCachedTop =492
                                            LayoutCachedWidth =9075
                                            LayoutCachedHeight =747
                                        End
                                    End
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =10490
                                    Top =517
                                    Width =1134
                                    Height =255
                                    TabIndex =3
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="tempHelp"
                                    ControlSource ="tempHelp"
                                    FontName ="Arial"
                                    ControlTipText ="Zähler Adresse"

                                    LayoutCachedLeft =10490
                                    LayoutCachedTop =517
                                    LayoutCachedWidth =11624
                                    LayoutCachedHeight =772
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =4095
                                    Top =732
                                    Height =340
                                    TabIndex =4
                                    ForeColor =10040115
                                    Name ="btnComAnschrift"
                                    Caption ="Anschrift"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =732
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =1072
                                    Overlaps =1
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =5960
                                    Top =795
                                    Width =3969
                                    Height =840
                                    TabIndex =5
                                    Name ="Anschrift"
                                    FontName ="Arial"
                                    ControlTipText ="Anschrift (frei änderbar)  falls rot hinterlegt: Funktion ist beendet!"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =795
                                    LayoutCachedWidth =9929
                                    LayoutCachedHeight =1635
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =4
                                    ListRows =30
                                    ListWidth =7657
                                    Left =9989
                                    Top =796
                                    Width =266
                                    Height =255
                                    TabIndex =6
                                    Name ="comAnschrift"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835;4536;0;0"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="\"Person/Abteilung\""
                                    FontName ="Arial"
                                    ControlTipText ="Anschrift auswählen"

                                    LayoutCachedLeft =9989
                                    LayoutCachedTop =796
                                    LayoutCachedWidth =10255
                                    LayoutCachedHeight =1051
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =10490
                                    Top =801
                                    Width =1134
                                    Height =340
                                    TabIndex =7
                                    ForeColor =8388608
                                    Name ="btnSprache"
                                    Caption ="Sprache"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Standard-Texte anzeigen"

                                    LayoutCachedLeft =10490
                                    LayoutCachedTop =801
                                    LayoutCachedWidth =11624
                                    LayoutCachedHeight =1141
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =20
                                    ListWidth =1134
                                    Left =11746
                                    Top =844
                                    Width =1134
                                    Height =255
                                    FontWeight =700
                                    TabIndex =8
                                    BackColor =14935011
                                    Name ="comSprache"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"deutsch\""
                                    FontName ="Arial"
                                    ControlTipText ="Auswahlmöglichkeiten für die Sprache"

                                    LayoutCachedLeft =11746
                                    LayoutCachedTop =844
                                    LayoutCachedWidth =12880
                                    LayoutCachedHeight =1099
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =255
                                    Left =4095
                                    Top =1134
                                    Height =565
                                    TabIndex =9
                                    ForeColor =0
                                    Name ="btnUpdateAnschrift"
                                    Caption ="Anschrift aktualisieren"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Update der Anschrift (und anschliessend Kopie in Zwischenspeicher mit Tel.-Nr.)"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =1134
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =1699
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =11746
                                    Top =1153
                                    Width =1134
                                    Height =255
                                    TabIndex =10
                                    BackColor =14935011
                                    Name ="txtDate"
                                    Format ="dd\\.mm\\.yy"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="Date()"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    ControlTipText ="Datum, das ausgedruckt oder als Termin verwendet  werden soll.\015\012Doppelklic"
                                        "k öffnet Kalender"

                                    LayoutCachedLeft =11746
                                    LayoutCachedTop =1153
                                    LayoutCachedWidth =12880
                                    LayoutCachedHeight =1408
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =10490
                                    Top =1171
                                    Width =1134
                                    Height =345
                                    TabIndex =11
                                    ForeColor =0
                                    Name ="btnTxtDate"
                                    Caption ="Datum"
                                    StatusBarText ="Fax"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kalender öffnen"

                                    LayoutCachedLeft =10490
                                    LayoutCachedTop =1171
                                    LayoutCachedWidth =11624
                                    LayoutCachedHeight =1516
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =2
                                    BackStyle =0
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    ListRows =3
                                    Left =4095
                                    Top =1680
                                    Height =255
                                    TabIndex =12
                                    BackColor =12632256
                                    Name ="comAnredeWie"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="1"
                                    FontName ="Arial"
                                    ControlTipText ="Bestimmen Sie wie die Anrede erfolgen soll:\015\012-Per DU = individuell, wenn i"
                                        "ch mit der Person per DU bin (Standard-Wert)\015\012   resp. \"Spezielle Anrede\""
                                        ", wenn erfasst.\015\012-Immer per Sie, egal ob ich per Du mit der Person bin\015"
                                        "\012 \015\012Zum Umschalten ==> Doppelclick"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =1680
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =1935
                                End
                                Begin TextBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =5960
                                    Top =1680
                                    Width =3969
                                    TabIndex =13
                                    Name ="comAnrede"
                                    FontName ="Arial"
                                    ControlTipText ="Anrede (frei änderbar)"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =1680
                                    LayoutCachedWidth =9929
                                    LayoutCachedHeight =1920
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =7371
                                    Left =5960
                                    Top =1950
                                    Width =6926
                                    TabIndex =14
                                    Name ="comEmail"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="4536;2835;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="email-Adresse\015\012Weiss: \"Normale\" Mail-Adresse\015\012Rot:     Adresse ist"
                                        " inaktiv\015\012Grün:   Private Mail-Adresse\015\012Gelb:   Sonstige Mail-Adress"
                                        "e"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =1950
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =2190
                                End
                                Begin TextBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    Left =5960
                                    Top =2250
                                    Width =6596
                                    Height =255
                                    TabIndex =15
                                    Name ="cc"
                                    FontName ="Arial"
                                    ControlTipText ="cc"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =2250
                                    LayoutCachedWidth =12556
                                    LayoutCachedHeight =2505
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =40
                                    ListWidth =9639
                                    Left =12635
                                    Top =2250
                                    Width =251
                                    Height =255
                                    TabIndex =16
                                    BoundColumn =2
                                    BackColor =10092543
                                    Name ="comCC"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835;3693;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="CC-Adresse eintragen"

                                    LayoutCachedLeft =12635
                                    LayoutCachedTop =2250
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =2505
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =40
                                    ListWidth =9639
                                    Left =5960
                                    Top =2921
                                    Width =6596
                                    Height =255
                                    FontWeight =700
                                    TabIndex =17
                                    Name ="StandardText"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3969;5103;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Dieser Text wird als <Betreff> aufgenommen!\015\012Doppel-Klick trägt <Bitte um "
                                        "Rückruf ein>"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =12556
                                    LayoutCachedHeight =3176
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =2
                                            Left =4095
                                            Top =2921
                                            Width =1326
                                            Height =240
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld299"
                                            Caption ="Titel / Betreff"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4095
                                            LayoutCachedTop =2921
                                            LayoutCachedWidth =5421
                                            LayoutCachedHeight =3161
                                        End
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =4
                                    ListRows =40
                                    ListWidth =7655
                                    Left =12635
                                    Top =2921
                                    Width =251
                                    Height =255
                                    TabIndex =18
                                    BackColor =10092543
                                    Name ="NrVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835;3689;852"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Angebotsübersicht (Angebot eintragen)"

                                    LayoutCachedLeft =12635
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =3176
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =7371
                                    Left =5960
                                    Top =3214
                                    Width =6926
                                    TabIndex =19
                                    Name ="OutlookVorlage"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;4536"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="Liste der Outlook-Vorlagen\015\012Der Pfad ist in T_Filter festeglegt"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =3214
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =3454
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =2
                                            Left =4095
                                            Top =3214
                                            Width =1725
                                            Height =240
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld300"
                                            Caption ="Outlook-Vorlage"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4095
                                            LayoutCachedTop =3214
                                            LayoutCachedWidth =5820
                                            LayoutCachedHeight =3454
                                        End
                                    End
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =5960
                                    Top =3514
                                    Width =6926
                                    Height =851
                                    FontSize =11
                                    TabIndex =20
                                    Name ="txtMemo"
                                    FontName ="Aptos"
                                    ControlTipText ="Memo-Feld (editierbar, wenn Text markiert wird!)"
                                    TextFormat =1

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =3514
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =4365
                                End
                                Begin CommandButton
                                    OverlapFlags =247
                                    Left =4095
                                    Top =3849
                                    Height =521
                                    TabIndex =21
                                    ForeColor =0
                                    Name ="btnStartEmail"
                                    Caption ="eMail starten"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadada080adaddadadada080f0ada ,
                                        0xadadada080fff0addadada080fcfff0aadada080fcfc91f0dada080fcfcf110a ,
                                        0x000080fffcfff00008070808888800300b30000000000330080fbfbfbfbfb030 ,
                                        0x00fbfbfbfbfbfb000000000000000000adadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="eMail starten direkt an aktuelle Adresse"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =3849
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =4370
                                    PictureCaptionArrangement =1
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =1134
                                    Left =4095
                                    Top =3510
                                    Width =1676
                                    Height =255
                                    TabIndex =22
                                    Name ="comMailServer"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    DefaultValue ="\"Outlook\""
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="über welches Mail-System"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =3510
                                    LayoutCachedWidth =5771
                                    LayoutCachedHeight =3765
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =6804
                                    Left =5960
                                    Top =4410
                                    Width =6926
                                    Height =255
                                    TabIndex =23
                                    Name ="comGruss"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="6804"
                                    FontName ="Arial"
                                    ControlTipText ="Gruss-Formel auswählen"

                                    LayoutCachedLeft =5960
                                    LayoutCachedTop =4410
                                    LayoutCachedWidth =12886
                                    LayoutCachedHeight =4665
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =2
                                            Left =4095
                                            Top =4410
                                            Width =1755
                                            Height =240
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld321"
                                            Caption ="Gruss-Formel"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4095
                                            LayoutCachedTop =4410
                                            LayoutCachedWidth =5850
                                            LayoutCachedHeight =4650
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =4095
                                    Top =4638
                                    Height =340
                                    TabIndex =24
                                    ForeColor =10040115
                                    Name ="btncomBeilage"
                                    Caption ="Beilage"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Beilagen zoomen"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =4638
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =4978
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =5959
                                    Top =4683
                                    Width =6926
                                    TabIndex =25
                                    Name ="comBeilage"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Beilage"

                                    LayoutCachedLeft =5959
                                    LayoutCachedTop =4683
                                    LayoutCachedWidth =12885
                                    LayoutCachedHeight =4923
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =5449
                                    Top =2865
                                    Width =392
                                    Height =340
                                    TabIndex =26
                                    ForeColor =0
                                    Name ="btnRückruf"
                                    Caption ="Bitte um Rückruf"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="bitte um Rückruf"
                                    ImageData = Begin
                                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000000000000000000000000000ffffff30ffffff80ffffffc0a09080ff ,
                                        0xe0d0d0e0906850ff000000000000000000000000c09080ffc09090ffc09080ff ,
                                        0xc08080ffb08080ffb07870ffb07870ffc09090ffd0b8b0fff0e0e0ffd0c0c0ff ,
                                        0x906850ff906850ff000000000000000000000000c09090fff0d8c0fffff8d0ff ,
                                        0xfff0c0ffffe8b0ffffd8a0ffffd0a0ffffd0a0ffffd8c0ffffe8e0ff907860ff ,
                                        0x906850ff906850ff000000000000000000000000c09890ffd09080fffff0e0ff ,
                                        0xfff8f0fffff8e0fffff8d0fffff0c0ffffe8c0fffff0d0fffff0e0fffff0e0ff ,
                                        0xf0e0e0fff0d8e0ff000000000000000000000000d0a0a0ffffe8c0ffd0a090ff ,
                                        0xf0f0e0fffffff0fffff8e0fffff8e0fffff0d0fffff0c0ffffe8d0ffe0c0b0ff ,
                                        0xf0e0c0ffd0b8b0ff000000000000000000000000e0c8c0fffffff0ffffe8e0ff ,
                                        0xe0c8c0fffff0f0fffff8f0fffff8e0fffff0e0fff0d8c0ffc09080fff0d8c0ff ,
                                        0xf0d8b0ffb09090ff000000000000000000000000f0f0f0ff5090a0ff406070ff ,
                                        0xf0fffffff0e0e0ffe0d8d0ffe0c8c0ffd0a8a0ffb09890ff70d8ffffb09890ff ,
                                        0xf0d0b0ffb08080ff6090a0ff6090a0f0408090f04088a0ff307890ff306880ff ,
                                        0x306070ff305870ff305060ff305060ffc0f0ffff90e0ffff70d8ffff70d8ffff ,
                                        0xb09080ffa07870ff70b0c0f0d0f8ffffc0f0ffff90e8f0ff70d8f0ff60c8e0ff ,
                                        0x50b0d0ff4098b0ff407890ff506880ffc0e8ffff80d8f0ff70c8f0ff60c8f0ff ,
                                        0x60c8f0ffb07880f070b0c04070b8c0f0e0ffffffc0f8ffffa0e8f0ff90d0e0ff ,
                                        0x60a8c0ff4088a0ff507890fff0ffffffd0f8ffffb0f0ffff80e8ffff80e0ffff ,
                                        0xb08880f0c098903070b0c00080c0d07070b0c0ff90d0e0ff60b8d0ff4090b0ff ,
                                        0x307890ff305870fffffffffff0ffffffe0ffffffb0f8ffff90e8ffffb07880f0 ,
                                        0xb09090200000000000000000a0e0f01070b0d0ffc0f8ffffb0f0ffff70d8f0ff ,
                                        0x40b8e0ff306880fffffffffff0ffffffe0ffffffb0f8ffffb07880f0c0989030 ,
                                        0x0000000000000000000000000000000070b8d0ffe0ffffffd0f8ffffb0f0ffff ,
                                        0x70d0f0ff306880fff0e0e0ffd0b0b0ffc0a090ffc09890ffc098904000000000 ,
                                        0x0000000000000000000000000000000080c0d0ffe0ffffffe0ffffffd0ffffff ,
                                        0xa0e0f0ff407080ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000070b8d07080c0d0ff70b0c0ff60a0c0ff ,
                                        0x5090a0ff70b8d060000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000
                                    End

                                    LayoutCachedLeft =5449
                                    LayoutCachedTop =2865
                                    LayoutCachedWidth =5841
                                    LayoutCachedHeight =3205
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =10488
                                    Top =1530
                                    Width =2421
                                    Height =345
                                    TabIndex =27
                                    ForeColor =0
                                    Name ="btnAppoitment"
                                    Caption ="Termin setzen"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadada080adaddadadada080f0ada ,
                                        0xadadada080fff0addadada080fcfff0aadada080fcfc91f0dada080fcfcf110a ,
                                        0x000080fffcfff00008070808888800300b30000000000330080fbfbfbfbfb030 ,
                                        0x00fbfbfbfbfbfb000000000000000000adadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="Appoitment mit aktueller Adresse"

                                    LayoutCachedLeft =10488
                                    LayoutCachedTop =1530
                                    LayoutCachedWidth =12909
                                    LayoutCachedHeight =1875
                                    PictureCaptionArrangement =1
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    Left =5959
                                    Top =2586
                                    Width =6926
                                    Height =255
                                    TabIndex =28
                                    Name ="bcc"
                                    FontName ="Arial"
                                    ControlTipText ="Blind copy"

                                    LayoutCachedLeft =5959
                                    LayoutCachedTop =2586
                                    LayoutCachedWidth =12885
                                    LayoutCachedHeight =2841
                                    BackThemeColorIndex =1
                                    BackShade =95.0
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =4095
                                    Top =1950
                                    Height =240
                                    TabIndex =29
                                    ForeColor =10040115
                                    Name ="btnAn"
                                    Caption ="An (Zoom)"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zoome das Mail-Adress-Feld rechts"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =1950
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =2190
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =4095
                                    Top =2265
                                    Height =240
                                    TabIndex =30
                                    ForeColor =10040115
                                    Name ="btnCC"
                                    Caption ="cc (Zoom)"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zoome das Mail-Adress-Feld rechts"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =2265
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =2505
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =4095
                                    Top =2586
                                    Height =240
                                    TabIndex =31
                                    ForeColor =10040115
                                    Name ="btnBcc"
                                    Caption ="Bcc (Zoom)"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zoome das Mail-Adress-Feld rechts"

                                    LayoutCachedLeft =4095
                                    LayoutCachedTop =2586
                                    LayoutCachedWidth =5796
                                    LayoutCachedHeight =2826
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =6237
                                    Left =13329
                                    Top =453
                                    Width =4550
                                    Height =255
                                    TabIndex =32
                                    BackColor =12975858
                                    Name ="comMailArt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="6237"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"Standard-Email verwenden\""
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="Auswahl der zu verwendenden Email-Adressen\015\012Doppelclick = Standardwert"

                                    LayoutCachedLeft =13329
                                    LayoutCachedTop =453
                                    LayoutCachedWidth =17879
                                    LayoutCachedHeight =708
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4095
                            Top =420
                            Width =14100
                            Height =4800
                            Name ="pgDaten"
                            Caption ="       ID's, lastupdate..."
                            LayoutCachedLeft =4095
                            LayoutCachedTop =420
                            LayoutCachedWidth =18195
                            LayoutCachedHeight =5220
                            Begin
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =1265
                                    Width =2835
                                    Height =255
                                    BackColor =12632256
                                    Name ="whoUpdate"
                                    ControlSource ="whoUpdate"
                                    Format ="dd\\.mm\\.yy"
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="Adresse Update von .."

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =1265
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =1520
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =1520
                                    Width =2835
                                    Height =255
                                    TabIndex =1
                                    BackColor =12632256
                                    Name ="LastUpdate"
                                    ControlSource ="LastUpdate"
                                    Format ="General Date"
                                    StatusBarText ="geändert am .."
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="letzte Änderung am.."

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =1520
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =1775
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =1775
                                    Width =2835
                                    Height =255
                                    TabIndex =2
                                    BackColor =12632256
                                    Name ="FunktionErfasst"
                                    ControlSource ="FunktionErfasst"
                                    Format ="dd\\.mm\\.yy"
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="Adresse erfasst am ..."

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =1775
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =2030
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =2030
                                    Width =2835
                                    Height =255
                                    TabIndex =3
                                    BackColor =12632256
                                    Name ="MarkerFunktion"
                                    ControlSource ="MarkerFunktion"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="wer hat den Datensatz markiert"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =2030
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =2285
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =2285
                                    Width =2835
                                    Height =255
                                    FontWeight =700
                                    TabIndex =4
                                    BackColor =39423
                                    ForeColor =16711680
                                    Name ="CounterFunktion"
                                    ControlSource ="CounterFunktion"
                                    BeforeUpdate ="[Event Procedure]"
                                    FontName ="Arial Narrow"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="Wie oft angewählt?"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =2285
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =2540
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =2540
                                    Width =2835
                                    Height =255
                                    TabIndex =5
                                    BackColor =12632256
                                    Name ="Du"
                                    ControlSource ="Du"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="per Du mit diesen Mitarbeitern (Kurzzeichen)"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =2540
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =2795
                                    ForeThemeColorIndex =0
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =1
                                            Left =4175
                                            Top =2540
                                            Width =1985
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld333"
                                            Caption ="wer ist per Du"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4175
                                            LayoutCachedTop =2540
                                            LayoutCachedWidth =6160
                                            LayoutCachedHeight =2795
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =500
                                    Width =2835
                                    Height =255
                                    TabIndex =6
                                    BackColor =8421504
                                    Name ="IDAdresse"
                                    ControlSource ="IDAdresse"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="ID Adresse (NrAdresse)"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =500
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =755
                                    ForeThemeColorIndex =0
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =1
                                            Left =4175
                                            Top =500
                                            Width =1985
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld324"
                                            Caption ="ID der Adresse"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4175
                                            LayoutCachedTop =500
                                            LayoutCachedWidth =6160
                                            LayoutCachedHeight =755
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =755
                                    Width =2835
                                    Height =255
                                    TabIndex =7
                                    BackColor =8421504
                                    Name ="f0"
                                    ControlSource ="NrFunktion"
                                    StatusBarText ="Zähler der Datenbank"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="ID Funktion (NrFunktion"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =755
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =1010
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =1010
                                    Width =2835
                                    Height =255
                                    TabIndex =8
                                    BackColor =8421504
                                    Name ="NrAdrZuord"
                                    ControlSource ="NrAdrZuord"
                                    StatusBarText ="Zähler der Datenbank"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="ID der Adresszuordnung (NrAdrZuord)"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =1010
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =1265
                                    ForeThemeColorIndex =0
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =6443
                                    Top =2795
                                    Width =2835
                                    Height =255
                                    TabIndex =9
                                    BackColor =8421504
                                    Name ="tempFeld"
                                    FontName ="Arial Narrow"
                                    ControlTipText ="temp. Hilfefeld"

                                    LayoutCachedLeft =6443
                                    LayoutCachedTop =2795
                                    LayoutCachedWidth =9278
                                    LayoutCachedHeight =3050
                                    ForeThemeColorIndex =0
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =755
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld326"
                                    Caption ="ID der Funktion"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =755
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =1010
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =1010
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld327"
                                    Caption ="ID der Adress-zuordnung"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =1010
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =1265
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =1265
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld328"
                                    Caption ="wer hat zuletzt geändert"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =1265
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =1520
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =1520
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld329"
                                    Caption ="wann wurde geändert"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =1520
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =1775
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =1775
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld330"
                                    Caption ="Erstellung am"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =1775
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =2030
                                End
                                Begin Label
                                    OverlapFlags =255
                                    TextAlign =1
                                    Left =4175
                                    Top =2030
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld331"
                                    Caption ="Adresse ist markiert von"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =2030
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =2285
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =4175
                                    Top =2285
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld332"
                                    Caption ="Anwahl-Zähler"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =2285
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =2540
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =4175
                                    Top =2795
                                    Width =1985
                                    Height =255
                                    BackColor =12632256
                                    Name ="Bezeichnungsfeld334"
                                    Caption ="temp. Feld"
                                    FontName ="Arial"
                                    LayoutCachedLeft =4175
                                    LayoutCachedTop =2795
                                    LayoutCachedWidth =6160
                                    LayoutCachedHeight =3050
                                End
                            End
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =72
                    Top =55
                    Width =1871
                    Height =1206
                    TabIndex =8
                    BackColor =-2147483633
                    Name ="lstTopA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="25"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Wieviele Datensätze sollen gezeigt werden"

                    LayoutCachedLeft =72
                    LayoutCachedTop =55
                    LayoutCachedWidth =1943
                    LayoutCachedHeight =1261
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =1998
                    Top =1134
                    Width =1871
                    Height =1997
                    TabIndex =9
                    BackColor =-2147483633
                    Name ="lstV"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der Vorgänge (Absteigend sortiert nach Anzahl)"

                    LayoutCachedLeft =1998
                    LayoutCachedTop =1134
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =3131
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1998
                    Top =55
                    Width =1871
                    Height =1026
                    TabIndex =10
                    BackColor =-2147483633
                    Name ="lstOrder"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="In welcher Reihenfolge sollen die Datensätze gezeigt werden?"

                    LayoutCachedLeft =1998
                    LayoutCachedTop =55
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =1081
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =963
                    Top =5045
                    Width =340
                    Height =340
                    TabIndex =11
                    ForeColor =0
                    Name ="btntxtFind"
                    Caption ="suchen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Adressen mit den oben eingestellten Bedingungen unten anzeigen.\015\012Die wicht"
                        "igsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen Wert."
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

                    LayoutCachedLeft =963
                    LayoutCachedTop =5045
                    LayoutCachedWidth =1303
                    LayoutCachedHeight =5385
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =30
                    Top =5040
                    Width =340
                    Height =340
                    FontSize =10
                    FontWeight =700
                    TabIndex =12
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

                    LayoutCachedLeft =30
                    LayoutCachedTop =5040
                    LayoutCachedWidth =370
                    LayoutCachedHeight =5380
                    Overlaps =1
                End
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =40
                    ListWidth =4536
                    Left =83
                    Top =4762
                    Width =3786
                    Height =255
                    TabIndex =13
                    BackColor =-2147483633
                    Name ="comArtZuord"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3969"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Filtern nach Zuordnungen (siehe <Kontakte>)!\015\012Doppel-Klick entfernt das Su"
                        "chkriteium"

                    LayoutCachedLeft =83
                    LayoutCachedTop =4762
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =5017
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1998
                    Top =3180
                    Width =1871
                    Height =1518
                    TabIndex =14
                    BackColor =-2147483633
                    Name ="lstfeld"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Filtern nach Feldern!"

                    LayoutCachedLeft =1998
                    LayoutCachedTop =3180
                    LayoutCachedWidth =3869
                    LayoutCachedHeight =4698
                End
                Begin Image
                    Visible = NotDefault
                    SizeMode =3
                    Left =18538
                    Top =963
                    Width =5181
                    Height =4077
                    Name ="pic"
                    OnClick ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Bilder, mit Klick zum Nächsten"

                    LayoutCachedLeft =18538
                    LayoutCachedTop =963
                    LayoutCachedWidth =23719
                    LayoutCachedHeight =5040
                    TabIndex =17
                End
                Begin ListBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =247
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =18481
                    Top =5443
                    Width =5165
                    Height =5897
                    TabIndex =15
                    BackColor =15527148
                    Name ="lstPic"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;5103"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Aktionen mit der Bemerkung"

                    LayoutCachedLeft =18481
                    LayoutCachedTop =5443
                    LayoutCachedWidth =23646
                    LayoutCachedHeight =11340
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =18425
                    Top =56
                    Width =9072
                    Height =11340
                    TabIndex =16
                    Name ="txtWichtigeInfos"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Liste der wichtigen Infos\015\012Zum Bearbeiten bitte das Register \"Wichtige In"
                        "fo\" benutzen!"
                    TextFormat =1

                    LayoutCachedLeft =18425
                    LayoutCachedTop =56
                    LayoutCachedWidth =27497
                    LayoutCachedHeight =11396
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Adresse.cls"
