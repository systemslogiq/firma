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
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18345
    DatasheetFontHeight =10
    ItemSuffix =36
    Right =28170
    Bottom =12450
    OnUnload ="[Event Procedure]"
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Lexikon"
    RecSrcDt = Begin
        0xadb35bd0cec6e540
    End
    UniqueTable ="T_Lexikon"
    Caption ="DB-Einstellungen"
    BeforeUpdate ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnDblClick ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
    OrderByOnLoad =0
    ShowPageMargins =0
    DatasheetGridlinesColor12 =12632256
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
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
        End
        Begin Section
            CanGrow = NotDefault
            Height =12105
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5103
                    Top =1215
                    Height =312
                    TabIndex =9
                    ForeColor =0
                    Name ="btnBemLexikon"
                    Caption ="Beschreibung"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zoomt die Beschreibung"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =1215
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =1527
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    BackStyle =0
                    Left =15870
                    Top =794
                    Width =2271
                    Height =255
                    TabIndex =15
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="Lexikonerfasst"
                    ControlSource ="Lexikonerfasst"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="erfasst am ..."

                    LayoutCachedLeft =15870
                    LayoutCachedTop =794
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =1049
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    BackStyle =0
                    Left =15870
                    Top =1049
                    Width =2271
                    Height =255
                    TabIndex =16
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="WhoUpdate"
                    ControlSource ="WhoUpdate"
                    Format ="dd/mm/yy"
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="Adresse Update von .."

                    LayoutCachedLeft =15870
                    LayoutCachedTop =1049
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =1304
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    BackStyle =0
                    Left =15870
                    Top =1304
                    Width =2271
                    Height =255
                    FontSize =7
                    TabIndex =17
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =15870
                    LayoutCachedTop =1304
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =1559
                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    Left =6862
                    Top =881
                    Width =8706
                    Height =255
                    TabIndex =7
                    Name ="Begriff"
                    ControlSource ="Begriff"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    Tag ="m2"
                    ControlTipText ="Begriff"

                    LayoutCachedLeft =6862
                    LayoutCachedTop =881
                    LayoutCachedWidth =15568
                    LayoutCachedHeight =1136
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =5103
                    Top =870
                    Height =312
                    FontWeight =700
                    TabIndex =8
                    ForeColor =0
                    Name ="btnOpen"
                    Caption ="Begriff"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="öffnen Formular / WEB / Files / Explorer\015\012und Begriff mitsamt Beschreibung"
                        " in Zwischenspeicher"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =870
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =1182
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =5103
                    Top =555
                    Height =312
                    TabIndex =6
                    ForeColor =0
                    Name ="btnGruppe"
                    Caption ="Gruppe"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="alle Daten anzeigen, nach Gruppen-Nr. und Lexikon-Nr. sortieren"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =555
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =867
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5103
                    Top =150
                    Height =312
                    ForeColor =0
                    Name ="btnGruppeNr"
                    Caption ="Gruppe-Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="filtert alle Einträge mit dieser Gruppe"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =150
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =462
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =8075
                    Top =157
                    Width =1305
                    Height =312
                    TabIndex =5
                    ForeColor =0
                    Name ="btnLexikonNr"
                    Caption ="lfd. Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Laufende Nummer ändern..."

                    LayoutCachedLeft =8075
                    LayoutCachedTop =157
                    LayoutCachedWidth =9380
                    LayoutCachedHeight =469
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =567
                    Left =9420
                    Top =178
                    Width =903
                    Height =255
                    FontWeight =700
                    TabIndex =3
                    Name ="LexikonNr"
                    ControlSource ="LexikonNr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m3"
                    ControlTipText ="Lexikon-Nr: Laufende Nummer pro Gruppe"

                    LayoutCachedLeft =9420
                    LayoutCachedTop =178
                    LayoutCachedWidth =10323
                    LayoutCachedHeight =433
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    BackStyle =0
                    Left =15870
                    Top =2097
                    Width =2271
                    Height =255
                    TabIndex =14
                    BackColor =12632256
                    Name ="CounterLexikon"
                    ControlSource ="CounterLexikon"
                    FontName ="Arial"
                    ControlTipText ="Counter Lexikon (Anzahl Anwahl)"

                    LayoutCachedLeft =15870
                    LayoutCachedTop =2097
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =2352
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =93
                    TextAlign =1
                    ListRows =30
                    Left =6859
                    Top =4305
                    Width =8706
                    Height =255
                    TabIndex =11
                    BackColor =12170955
                    Name ="Fieldname"
                    ControlSource ="Fieldname"
                    RowSourceType ="Table/Query"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Feldname / Bedingung\015\012Doppel-Klick, um Filedialog zu öffnen"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =4305
                    LayoutCachedWidth =15565
                    LayoutCachedHeight =4560
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =3
                    Left =5100
                    Top =4307
                    Width =1701
                    Height =255
                    Name ="lblFieldname"
                    Caption ="Parameter 1"
                    FontName ="Arial"
                    LayoutCachedLeft =5100
                    LayoutCachedTop =4307
                    LayoutCachedWidth =6801
                    LayoutCachedHeight =4562
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =3
                    Left =5100
                    Top =4562
                    Width =1701
                    Height =255
                    Name ="lblFormname"
                    Caption ="Parameter 2"
                    FontName ="Arial"
                    LayoutCachedLeft =5100
                    LayoutCachedTop =4562
                    LayoutCachedWidth =6801
                    LayoutCachedHeight =4817
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =3
                    Left =5100
                    Top =4817
                    Width =1701
                    Height =255
                    Name ="Bezeichnungsfeld88"
                    Caption ="Wertigkeit für DB"
                    FontName ="Arial"
                    LayoutCachedLeft =5100
                    LayoutCachedTop =4817
                    LayoutCachedWidth =6801
                    LayoutCachedHeight =5072
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =1
                    ListRows =30
                    Left =6859
                    Top =4560
                    Width =8706
                    Height =255
                    TabIndex =12
                    BackColor =12170955
                    Name ="Formname"
                    ControlSource ="Formname"
                    RowSourceType ="Table/Query"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Formularname/weitere Bedingung/Steuerung der DB\015\012Doppel-Klick, um Filedial"
                        "og zu öffnen"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =4560
                    LayoutCachedWidth =15565
                    LayoutCachedHeight =4815
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =87
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =1701
                    Left =6859
                    Top =4815
                    Width =8706
                    Height =255
                    TabIndex =13
                    BackColor =12170955
                    Name ="WertOH"
                    ControlSource ="WertOH"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    FontName ="Arial"
                    ControlTipText ="Wertigkeit des Eintrages:\015\0120:Einstellung der DB\015\0121;erforderlich in D"
                        "B;\015\0122;Sollte in DB sein;\015\0123;kann in DB sein;\015\0124;nur OH"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =4815
                    LayoutCachedWidth =15565
                    LayoutCachedHeight =5070
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5103
                    Top =2449
                    Height =312
                    TabIndex =10
                    ForeColor =0
                    Name ="btnNewSort"
                    Caption ="nummerieren.."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="nimmt die aktuelle Gruppe, sortiert nach Begriff und nummeriert neu durch!"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =2449
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =2761
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    BackStyle =0
                    Left =15870
                    Top =1559
                    Width =2271
                    Height =255
                    TabIndex =2
                    BackColor =12632256
                    Name ="MarkerLexikon"
                    ControlSource ="MarkerLexikon"
                    FontName ="Arial"
                    ControlTipText ="wer hat markiert"

                    LayoutCachedLeft =15870
                    LayoutCachedTop =1559
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =1814
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    Left =12668
                    Top =120
                    Width =1086
                    Height =255
                    TabIndex =18
                    BackColor =10092543
                    Name ="Beschreibung"
                    ControlSource ="Beschreibung"
                    FontName ="Arial"
                    ControlTipText ="wer hat markiert"

                    LayoutCachedLeft =12668
                    LayoutCachedTop =120
                    LayoutCachedWidth =13754
                    LayoutCachedHeight =375
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    BackStyle =0
                    Left =15870
                    Top =1814
                    Width =2271
                    Height =255
                    TabIndex =19
                    BackColor =12632256
                    Name ="PrintMarkerLexikon"
                    ControlSource ="PrintMarkerLexikon"
                    FontName ="Arial"
                    ControlTipText ="wer hat markiert"

                    LayoutCachedLeft =15870
                    LayoutCachedTop =1814
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =2069
                End
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =113
                    Top =5226
                    Width =4536
                    Height =6738
                    TabIndex =20
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;567"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (8) Daten für Lexikon\015\012Verwenden Sie die Pfeiltasten"
                        ", um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =113
                    LayoutCachedTop =5226
                    LayoutCachedWidth =4649
                    LayoutCachedHeight =11964
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =113
                    Top =1133
                    Width =4536
                    Height =3680
                    TabIndex =21
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;2835;567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="-1"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der Lexikon-Gruppen sortiert wie oben eingestellt"

                    LayoutCachedLeft =113
                    LayoutCachedTop =1133
                    LayoutCachedWidth =4649
                    LayoutCachedHeight =4813
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1073
                    Top =4869
                    Width =3234
                    FontWeight =600
                    TabIndex =22
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    Tag ="FilterForm"
                    ControlTipText ="Suche mit Wildcard in den wichtigsten Feldern\015\012mit <Gr:> können Sie nach k"
                        "ompletten Gruppen suchen.\015\012mit <S:> können Sie nach Stichworten suchen"
                    AsianLineBreak =255

                    LayoutCachedLeft =1073
                    LayoutCachedTop =4869
                    LayoutCachedWidth =4307
                    LayoutCachedHeight =5109
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =113
                    Top =4869
                    Width =849
                    Height =227
                    FontWeight =600
                    TabIndex =23
                    BackColor =12975858
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =113
                    LayoutCachedTop =4869
                    LayoutCachedWidth =962
                    LayoutCachedHeight =5096
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =4403
                    Top =4839
                    Width =246
                    Height =270
                    TabIndex =24
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="Reset Filter;dms;;elo;slo;stichwortgr;stichwortgruppe;mail-t;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zuletzt benutzte Suchbegriffe auswählen"

                    LayoutCachedLeft =4403
                    LayoutCachedTop =4839
                    LayoutCachedWidth =4649
                    LayoutCachedHeight =5109
                End
                Begin Tab
                    OverlapFlags =85
                    Left =5100
                    Top =5265
                    Width =13245
                    Height =6840
                    TabIndex =25
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5100
                    LayoutCachedTop =5265
                    LayoutCachedWidth =18345
                    LayoutCachedHeight =12105
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5235
                            Top =5670
                            Width =12975
                            Height =6294
                            Name ="pg0"
                            Caption ="Gruppe 93 DMS"
                            LayoutCachedLeft =5235
                            LayoutCachedTop =5670
                            LayoutCachedWidth =18210
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =7148
                                    Top =5835
                                    Width =11057
                                    Height =6129
                                    BackColor =15066597
                                    Name ="lstGruppe"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;854;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =7148
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =18205
                                    LayoutCachedHeight =11964
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5390
                                    Top =5835
                                    Height =6129
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstLexikon"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Lexikon-Einträge"

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5235
                            Top =5670
                            Width =12975
                            Height =6294
                            Name ="pg1"
                            Caption ="Stichworte"
                            LayoutCachedLeft =5235
                            LayoutCachedTop =5670
                            LayoutCachedWidth =18210
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =7148
                                    Top =5835
                                    Width =11058
                                    Height =6129
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;297;2268;2268;1134;855"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der (frei wählbaren) Stichworte zu DB-Einstellungen\015\012Doppelclick Sti"
                                        "chwort: Stichworte bearbeiten\015\012Doppelclick Bemerkung: Bemerkung bearbeiten"
                                        "\015\012Doppelclick Hyperlink: Link öffnen, falls vorhanden"

                                    LayoutCachedLeft =7148
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =18206
                                    LayoutCachedHeight =11964
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5390
                                    Top =5835
                                    Height =6129
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5235
                            Top =5670
                            Width =12975
                            Height =6294
                            Name ="pageMarker"
                            Caption ="Lexikon-Einträge  managen"
                            LayoutCachedLeft =5235
                            LayoutCachedTop =5670
                            LayoutCachedWidth =18210
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =7149
                                    Top =5835
                                    Width =11058
                                    Height =6129
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;852;1701;851"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =7149
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =18207
                                    LayoutCachedHeight =11964
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =5390
                                    Top =5835
                                    Height =227
                                    FontWeight =600
                                    TabIndex =1
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    FontName ="Tahoma"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"
                                    AsianLineBreak =255

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =6062
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5390
                                    Top =6122
                                    Height =5842
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

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =6122
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5235
                            Top =5670
                            Width =12975
                            Height =6294
                            Name ="pg3"
                            Caption ="top 100"
                            LayoutCachedLeft =5235
                            LayoutCachedTop =5670
                            LayoutCachedWidth =18210
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =6
                                    Left =7149
                                    Top =5835
                                    Width =11058
                                    Height =6129
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;853;1701;852"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =7149
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =18207
                                    LayoutCachedHeight =11964
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    BorderWidth =1
                                    ColumnCount =2
                                    Left =5390
                                    Top =5835
                                    Height =6129
                                    BackColor =12975858
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =11964
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5235
                            Top =5670
                            Width =12975
                            Height =6294
                            Name ="pg4"
                            Caption ="Abfragen"
                            LayoutCachedLeft =5235
                            LayoutCachedTop =5670
                            LayoutCachedWidth =18210
                            LayoutCachedHeight =11964
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =7149
                                    Top =5835
                                    Width =11058
                                    Height =6129
                                    BackColor =15066597
                                    Name ="lstAbfragen"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;3969;3969"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="mit Doppelclick Excel-Auswertung starten"

                                    LayoutCachedLeft =7149
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =18207
                                    LayoutCachedHeight =11964
                                End
                                Begin CommandButton
                                    OverlapFlags =247
                                    Left =5390
                                    Top =5835
                                    Height =567
                                    TabIndex =1
                                    Name ="btnlstAbfragen"
                                    Caption ="EXCEL"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadada0000000dadadadadd00000dadadadada ,
                                        0xad000dadadadadaddad0dadadadadadaadadadadad72727ddada2727272f272a ,
                                        0xadad727272f272addada27272f2727daadada272f27272addadada2f2727dada ,
                                        0xadada2f272727daddada2f27272727daadad72727d7272addada2727dad727da ,
                                        0xadadadadadadadad000000000000000000000000000000000000000000000000 ,
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

                                    LayoutCachedLeft =5390
                                    LayoutCachedTop =5835
                                    LayoutCachedWidth =7091
                                    LayoutCachedHeight =6402
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    Left =15870
                    Top =270
                    Width =2271
                    Height =255
                    FontWeight =700
                    TabIndex =26
                    BackColor =15523798
                    ForeColor =9868950
                    Name ="f0"
                    ControlSource ="NrLexikon"
                    FontName ="Arial"
                    ControlTipText ="ID (Zähler Datensätze)"

                    LayoutCachedLeft =15870
                    LayoutCachedTop =270
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =525
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    Left =6862
                    Top =1256
                    Width =8706
                    Height =2943
                    FontSize =11
                    TabIndex =28
                    Name ="bemLexikon"
                    ControlSource ="bemLexikon"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Beschreibungsfeld \015\012(kann editiert werden, wenn ein Bereich markiert wird)"
                    TextFormat =1

                    LayoutCachedLeft =6862
                    LayoutCachedTop =1256
                    LayoutCachedWidth =15568
                    LayoutCachedHeight =4199
                End
                Begin TextBox
                    Locked = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =6862
                    Top =178
                    Width =903
                    Height =255
                    FontWeight =700
                    TabIndex =1
                    BackColor =16249583
                    Name ="GruppeNr"
                    ControlSource ="GruppeNr"
                    FontName ="Arial"
                    ControlTipText ="Gruppe-Nr.\015\012kann hier nicht geändert werden!"

                    LayoutCachedLeft =6862
                    LayoutCachedTop =178
                    LayoutCachedWidth =7765
                    LayoutCachedHeight =433
                End
                Begin TextBox
                    Locked = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =6862
                    Top =532
                    Width =8706
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    BackColor =16249583
                    Name ="Gruppe"
                    ControlSource ="Gruppe"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Bezeichnung der Gruppe\015\012Kann hier nicht geändert werden!!"

                    LayoutCachedLeft =6862
                    LayoutCachedTop =532
                    LayoutCachedWidth =15568
                    LayoutCachedHeight =817
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =87
                    BackStyle =0
                    Left =15870
                    Top =570
                    Width =2271
                    Height =228
                    TabIndex =29
                    BackColor =39423
                    ForeColor =9868950
                    Name ="NrBoss"
                    ControlSource ="NrBoss"
                    FontName ="Arial"
                    ControlTipText ="NrBoss"

                    LayoutCachedLeft =15870
                    LayoutCachedTop =570
                    LayoutCachedWidth =18141
                    LayoutCachedHeight =798
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    ColumnCount =3
                    Left =113
                    Top =56
                    Width =4536
                    Height =967
                    FontWeight =600
                    TabIndex =27
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="lstOrderGruppe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;4536"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Tahoma"
                    Tag ="m1"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Sortierung der Gruppen;\015\012mit Gruppe-Filter: können Sie auch einen dauerhaf"
                        "ten Filter setzen."

                    LayoutCachedLeft =113
                    LayoutCachedTop =56
                    LayoutCachedWidth =4649
                    LayoutCachedHeight =1023
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Lexikon.cls"
