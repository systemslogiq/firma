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
    ScrollBars =2
    ViewsAllowed =1
    TabularFamily =18
    GridY =10
    Width =18085
    ItemSuffix =244
    Right =24675
    Bottom =12195
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Ablage"
    RecSrcDt = Begin
        0xd6797c02371ce540
    End
    Caption ="Ablage / Ordner"
    BeforeInsert ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnActivate ="[Event Procedure]"
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
            FontWeight =700
            BackColor =12632256
        End
        Begin Rectangle
            SpecialEffect =2
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
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin TextBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =6129
            LabelX =-113
            FontSize =9
            FontName ="Times New Roman"
        End
        Begin ListBox
            SpecialEffect =2
            LabelAlign =3
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-230
        End
        Begin ComboBox
            SpecialEffect =2
            LabelAlign =3
            BorderLineStyle =0
            Width =1701
            LabelX =-230
        End
        Begin Subform
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1701
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
            Height =12045
            BackColor =14803425
            Name ="Det"
            Begin
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4860
                    Top =4125
                    Width =1254
                    Height =340
                    FontSize =8
                    FontWeight =400
                    ForeColor =8388608
                    Name ="btnVG"
                    Caption ="Vorgang"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Vorgang öffnen"

                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4860
                    Top =1934
                    Width =1254
                    Height =340
                    FontSize =8
                    FontWeight =400
                    TabIndex =1
                    ForeColor =8388608
                    Name ="btnAdresse"
                    Caption ="Firma"
                    StatusBarText ="Firma öffnen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="geht zu Firma"

                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4860
                    Top =919
                    Width =1254
                    Height =340
                    FontSize =8
                    FontWeight =400
                    TabIndex =2
                    ForeColor =16711680
                    Name ="btnAblageart"
                    Caption ="Ablageart"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Lexikon öffnen, Ablagearten definieren"

                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4860
                    Top =460
                    Width =1254
                    Height =340
                    FontSize =8
                    FontWeight =400
                    TabIndex =3
                    ForeColor =10040115
                    Name ="btnNrMitarbeiter"
                    Caption ="Ersteller"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Ersteller anzeigen"

                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4860
                    Top =5115
                    Width =1254
                    Height =340
                    FontSize =8
                    FontWeight =400
                    TabIndex =4
                    ForeColor =8388608
                    Name ="btnAblageErfasst"
                    Caption ="Datum"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Kalender öffnen"

                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4867
                    Top =2728
                    Width =1188
                    Height =285
                    FontSize =9
                    FontWeight =700
                    TabIndex =5
                    Name ="AnzahlRegister"
                    ControlSource ="AnzahlRegister"
                    RowSourceType ="Table/Query"
                    ValidationRule =">0 And <32"
                    ValidationText =">0 Und <32"
                    FontName ="Arial"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            Left =4860
                            Top =2389
                            Width =1230
                            Height =285
                            FontWeight =400
                            Name ="Bezeichnungsfeld215"
                            Caption ="Anzahl Register"
                            FontName ="Arial"
                        End
                    End
                End
                Begin Rectangle
                    SpecialEffect =0
                    OldBorderStyle =0
                    OverlapFlags =93
                    Left =6252
                    Top =361
                    Width =2482
                    Height =5473
                    Name ="Rechteck111"
                    LayoutCachedLeft =6252
                    LayoutCachedTop =361
                    LayoutCachedWidth =8734
                    LayoutCachedHeight =5834
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =2
                    ColumnCount =3
                    ListRows =10
                    ListWidth =5388
                    Left =6310
                    Top =475
                    Width =2668
                    Height =456
                    FontSize =16
                    TabIndex =6
                    BorderColor =2366701
                    Name ="NrMitarbeiter"
                    ControlSource ="NrMitarbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268;2835"
                    DefaultValue ="\"OH\""
                    FontName ="Arial"
                    ControlTipText ="Auswahl des Mitarbeiters (Kurzzeichen)"

                End
                Begin TextBox
                    Enabled = NotDefault
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =9923
                    Top =5442
                    Width =3402
                    Height =282
                    FontSize =10
                    TabIndex =7
                    BackColor =12632256
                    Name ="NrErfasstOrt"
                    ControlSource ="=[Nummer] & \" - \" & [AblageErfasst] & \" \" & [Ort]"
                    FontName ="Arial"
                    ControlTipText ="Nummer -Erfasst-Ort"

                    LayoutCachedLeft =9923
                    LayoutCachedTop =5442
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =5724
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OverlapFlags =223
                    TextAlign =2
                    TextFontFamily =34
                    Left =6360
                    Top =4485
                    Width =2268
                    Height =624
                    FontSize =8
                    FontWeight =700
                    TabIndex =8
                    Name ="BemAblage"
                    ControlSource ="BemAblage"
                    FontName ="Arial"

                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =2
                    ListRows =10
                    ListWidth =2268
                    Left =6353
                    Top =5473
                    Width =2268
                    Height =270
                    FontSize =10
                    TabIndex =9
                    Name ="Ort"
                    ControlSource ="Ort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    StatusBarText ="Auswahl des Ablageortes"
                    FontName ="Arial"

                End
                Begin ComboBox
                    AutoExpand = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =2
                    ListRows =10
                    ListWidth =2268
                    Left =6314
                    Top =1496
                    Width =2670
                    Height =456
                    ColumnWidth =1134
                    FontSize =16
                    TabIndex =10
                    Name ="Fa1"
                    ControlSource ="Fa1"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    FontName ="Arial"
                    Tag ="m2"

                End
                Begin ComboBox
                    AutoExpand = NotDefault
                    SpecialEffect =0
                    BorderWidth =2
                    OverlapFlags =223
                    TextAlign =2
                    ListRows =20
                    ListWidth =6804
                    Left =6314
                    Top =2347
                    Width =2670
                    Height =981
                    ColumnWidth =1134
                    FontSize =16
                    TabIndex =11
                    Name ="Fa2"
                    ControlSource ="Fa2"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    FontName ="Arial"
                    Tag ="m3"

                End
                Begin ComboBox
                    AutoExpand = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =2
                    ListRows =20
                    ListWidth =4536
                    Left =6315
                    Top =3375
                    Width =2670
                    Height =771
                    ColumnWidth =1701
                    FontSize =16
                    TabIndex =12
                    Name ="Fa3"
                    ControlSource ="Fa3"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    FontName ="Arial"

                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4821
                    Left =6314
                    Top =2006
                    Width =2670
                    Height =255
                    TabIndex =13
                    Name ="NrFirma"
                    ControlSource ="NrFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;1701"
                    StatusBarText ="Auswahl der Firma"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Auswahl der Firma"

                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =1
                    ColumnCount =4
                    ListRows =20
                    ListWidth =8223
                    Left =6315
                    Top =4170
                    Width =2670
                    Height =255
                    TabIndex =14
                    Name ="NrVG"
                    ControlSource ="NrVG"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;3402;2835;1701"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Auswahl des Angebotes"

                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =223
                    TextAlign =2
                    ColumnCount =3
                    ListWidth =5955
                    Left =6309
                    Top =985
                    Width =2668
                    Height =456
                    FontSize =14
                    TabIndex =15
                    BackColor =255
                    Name ="AblageArt"
                    ControlSource ="AblageArt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268;3402;0"
                    BeforeUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"

                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =0
                    BorderWidth =2
                    OverlapFlags =255
                    Left =6254
                    Top =361
                    Width =2493
                    Height =5753
                    Name ="Rechteck19"
                End
                Begin TextBox
                    OverlapFlags =247
                    TextAlign =2
                    TextFontFamily =34
                    Left =6353
                    Top =5160
                    Width =2268
                    Height =285
                    FontSize =8
                    FontWeight =700
                    TabIndex =16
                    Name ="AblageErfasst"
                    ControlSource ="AblageErfasst"
                    DefaultValue ="=Date()"
                    FontName ="Arial"
                    ControlTipText ="Erstelldatum"

                End
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =4917
                    Top =1424
                    Width =567
                    Height =228
                    FontSize =8
                    TabIndex =17
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="NrAblage"
                    ControlSource ="NrAblage"
                    StatusBarText ="Zähler der Datenbank"
                    FontName ="Arial"
                    ControlTipText ="Zähler Ablage"

                End
                Begin TextBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =5142
                    Width =1026
                    Height =312
                    FontSize =12
                    TabIndex =18
                    BackColor =65535
                    Name ="Nummer"
                    ControlSource ="Nummer"
                    StatusBarText ="Nummer des Ordners, wird autom. festgelegt"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="=DMax(\"Nummer\",\"T_Ablage\")+1"
                    FontName ="Arial"

                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =9923
                    Top =2494
                    Width =3402
                    Height =576
                    FontSize =8
                    FontWeight =400
                    TabIndex =19
                    ForeColor =16711680
                    Name ="btnEtikettenText"
                    Caption ="===>Etiketten-Text generieren"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Etiketten-Text übernehmen"

                    LayoutCachedLeft =9923
                    LayoutCachedTop =2494
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =3070
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =93
                    TextAlign =2
                    ListRows =20
                    Left =9923
                    Top =3458
                    Width =3402
                    Height =1380
                    FontSize =10
                    TabIndex =20
                    Name ="EtikettenText"
                    ControlSource ="EtikettenText"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    FontName ="Arial"

                    LayoutCachedLeft =9923
                    LayoutCachedTop =3458
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =4838
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =2
                    Left =9923
                    Top =3175
                    Width =3402
                    Height =255
                    FontWeight =400
                    Name ="Bezeichnungsfeld306"
                    Caption ="Text auf Ausdruck"
                    FontName ="Arial"
                    LayoutCachedLeft =9923
                    LayoutCachedTop =3175
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =3430
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =9923
                    Top =1647
                    Width =3402
                    Height =255
                    FontSize =8
                    TabIndex =21
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =9923
                    LayoutCachedTop =1647
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =1902
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =9923
                    Top =1392
                    Width =3402
                    Height =255
                    FontSize =8
                    TabIndex =22
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="whoUpdate"
                    ControlSource ="WhoUpdate"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung durch..."

                    LayoutCachedLeft =9923
                    LayoutCachedTop =1392
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =1647
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =9923
                    Top =1902
                    Width =3402
                    Height =255
                    FontSize =8
                    TabIndex =23
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="BegriffErfasst"
                    ControlSource ="AblageErfasst"
                    Format ="General Date"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Datensatz erfasst am..."

                    LayoutCachedLeft =9923
                    LayoutCachedTop =1902
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =2157
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =9923
                    Top =2157
                    Width =3402
                    Height =255
                    FontSize =8
                    TabIndex =24
                    BackColor =12632256
                    Name ="MarkerAblage"
                    ControlSource ="MarkerAblage"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="markiert von......"

                    LayoutCachedLeft =9923
                    LayoutCachedTop =2157
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =2412
                End
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =5
                    Left =30
                    Top =6240
                    Width =3759
                    Height =5667
                    TabIndex =25
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;1134"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Liste der gefilterten (9) Daten für Ablage\015\012Verwenden Sie die Pfeiltasten,"
                        " um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =30
                    LayoutCachedTop =6240
                    LayoutCachedWidth =3789
                    LayoutCachedHeight =11907
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =30
                    Top =60
                    Width =3804
                    Height =2268
                    TabIndex =26
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835;567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"A L L E\""
                    FontName ="Tahoma"
                    Tag ="FilterForm"

                    LayoutCachedLeft =30
                    LayoutCachedTop =60
                    LayoutCachedWidth =3834
                    LayoutCachedHeight =2328
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =990
                    Top =5940
                    Width =2499
                    FontSize =8
                    FontWeight =600
                    TabIndex =27
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    Tag ="FilterForm"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"
                    AsianLineBreak =255

                    LayoutCachedLeft =990
                    LayoutCachedTop =5940
                    LayoutCachedWidth =3489
                    LayoutCachedHeight =6180
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =30
                    Top =5953
                    Width =849
                    Height =227
                    FontSize =8
                    FontWeight =600
                    TabIndex =28
                    BackColor =12975858
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze\015\012Doppelclick öffnet entsprechende Tabelle"
                    AsianLineBreak =255

                    LayoutCachedLeft =30
                    LayoutCachedTop =5953
                    LayoutCachedWidth =879
                    LayoutCachedHeight =6180
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =3588
                    Top =5910
                    Width =246
                    Height =270
                    TabIndex =29
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Anrede auswählen"

                    LayoutCachedLeft =3588
                    LayoutCachedTop =5910
                    LayoutCachedWidth =3834
                    LayoutCachedHeight =6180
                End
                Begin Tab
                    OverlapFlags =247
                    Left =3855
                    Top =5895
                    Width =12390
                    Height =6150
                    TabIndex =30
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =3855
                    LayoutCachedTop =5895
                    LayoutCachedWidth =16245
                    LayoutCachedHeight =12045
                    Begin
                        Begin Page
                            OverlapFlags =119
                            Left =3990
                            Top =6300
                            Width =12120
                            Height =5607
                            Name ="pg0"
                            Caption ="Griffe 1 bis 20"
                            LayoutCachedLeft =3990
                            LayoutCachedTop =6300
                            LayoutCachedWidth =16110
                            LayoutCachedHeight =11907
                            Begin
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    ListRows =30
                                    Left =4604
                                    Top =6443
                                    Width =4743
                                    Height =255
                                    Name ="1"
                                    ControlSource ="1"
                                    RowSourceType ="Table/Query"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl1"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =6443
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =6698
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =6443
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text35"
                                            Caption ="1:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =6443
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =6659
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    ListRows =30
                                    Left =4604
                                    Top =6698
                                    Width =4743
                                    Height =255
                                    TabIndex =1
                                    Name ="2"
                                    ControlSource ="2"
                                    RowSourceType ="Table/Query"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl2"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =6698
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =6953
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =6699
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text37"
                                            Caption ="2:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =6699
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =6915
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    ListRows =30
                                    Left =4604
                                    Top =6953
                                    Width =4743
                                    Height =255
                                    TabIndex =2
                                    Name ="3"
                                    ControlSource ="3"
                                    RowSourceType ="Table/Query"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl3"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =6953
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =7208
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =6955
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text39"
                                            Caption ="3:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =6955
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =7171
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    ListRows =30
                                    Left =4604
                                    Top =7208
                                    Width =4743
                                    Height =255
                                    TabIndex =3
                                    Name ="4"
                                    ControlSource ="4"
                                    RowSourceType ="Table/Query"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl4"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =7208
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =7463
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =7211
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text41"
                                            Caption ="4:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =7211
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =7427
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =7463
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =4
                                    Name ="5"
                                    ControlSource ="5"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl5"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =7463
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =7718
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =7467
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text43"
                                            Caption ="5:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =7467
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =7683
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =7718
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =5
                                    Name ="6"
                                    ControlSource ="6"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl6"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =7718
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =7973
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =7723
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text45"
                                            Caption ="6:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =7723
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =7939
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =7973
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =6
                                    Name ="7"
                                    ControlSource ="7"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl7"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =7973
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =8228
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =7979
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text47"
                                            Caption ="7:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =7979
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =8195
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =8228
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =7
                                    Name ="8"
                                    ControlSource ="8"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl8"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =8228
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =8483
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =8235
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text49"
                                            Caption ="8:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =8235
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =8451
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =8483
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =8
                                    Name ="9"
                                    ControlSource ="9"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl9"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =8483
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =8738
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4229
                                            Top =8491
                                            Width =351
                                            Height =216
                                            FontWeight =400
                                            Name ="Text51"
                                            Caption ="9:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4229
                                            LayoutCachedTop =8491
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =8707
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =8738
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =9
                                    Name ="10"
                                    ControlSource ="10"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl10"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =8738
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =8993
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4163
                                            Top =8747
                                            Width =417
                                            Height =216
                                            FontWeight =400
                                            Name ="Text53"
                                            Caption ="10:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4163
                                            LayoutCachedTop =8747
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =8963
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =8991
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =10
                                    Name ="11"
                                    ControlSource ="11"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl11"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =8991
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =9246
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4169
                                            Top =9001
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text55"
                                            Caption ="11:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4169
                                            LayoutCachedTop =9001
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =9217
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =9246
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =11
                                    Name ="12"
                                    ControlSource ="12"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl12"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =9246
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =9501
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4169
                                            Top =9257
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text57"
                                            Caption ="12:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4169
                                            LayoutCachedTop =9257
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =9473
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =9501
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =12
                                    Name ="13"
                                    ControlSource ="13"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl13"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =9501
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =9756
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4169
                                            Top =9513
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text59"
                                            Caption ="13:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4169
                                            LayoutCachedTop =9513
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =9729
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =4604
                                    Top =9756
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =13
                                    Name ="14"
                                    ControlSource ="14"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl14"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =9756
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =10011
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4169
                                            Top =9769
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text61"
                                            Caption ="14:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4169
                                            LayoutCachedTop =9769
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =9985
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    Left =4604
                                    Top =10011
                                    Width =4743
                                    Height =1896
                                    FontSize =8
                                    TabIndex =14
                                    Name ="15"
                                    ControlSource ="15"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl15"

                                    LayoutCachedLeft =4604
                                    LayoutCachedTop =10011
                                    LayoutCachedWidth =9347
                                    LayoutCachedHeight =11907
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =4169
                                            Top =10025
                                            Width =411
                                            Height =1882
                                            FontWeight =400
                                            Name ="Text63"
                                            Caption ="15:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =4169
                                            LayoutCachedTop =10025
                                            LayoutCachedWidth =4580
                                            LayoutCachedHeight =11907
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =6440
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =15
                                    Name ="16"
                                    ControlSource ="16"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl16"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =6440
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =6695
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =6455
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text65"
                                            Caption ="16:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =6455
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =6671
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =6695
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =16
                                    Name ="17"
                                    ControlSource ="17"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl17"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =6695
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =6950
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =6711
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text67"
                                            Caption ="17:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =6711
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =6927
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =6950
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =17
                                    Name ="18"
                                    ControlSource ="18"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl18"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =6950
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =7205
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =6967
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text69"
                                            Caption ="18:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =6967
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =7183
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =7205
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =18
                                    Name ="19"
                                    ControlSource ="19"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl19"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =7205
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =7460
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =7223
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text71"
                                            Caption ="19:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =7223
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =7439
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    Left =9923
                                    Top =7460
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =19
                                    Name ="20"
                                    ControlSource ="20"
                                    FontName ="Arial"
                                    EventProcPrefix ="Ctl20"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =7460
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =7715
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =7479
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Text73"
                                            Caption ="20:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =7479
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =7695
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =7744
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =20
                                    Name ="Text146"
                                    ControlSource ="21"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =7744
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =7999
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =7744
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld147"
                                            Caption ="21:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =7744
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =7960
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =7999
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =21
                                    Name ="Text148"
                                    ControlSource ="22"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =7999
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =8254
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =7999
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld149"
                                            Caption ="22:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =7999
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =8215
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =8254
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =22
                                    Name ="Text150"
                                    ControlSource ="23"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =8254
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =8509
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =8254
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld151"
                                            Caption ="23:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =8254
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =8470
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =8509
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =23
                                    Name ="Text152"
                                    ControlSource ="24"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =8509
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =8764
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =8509
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld153"
                                            Caption ="24:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =8509
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =8725
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =8764
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =24
                                    Name ="Text154"
                                    ControlSource ="25"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =8764
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =9019
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =8764
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld155"
                                            Caption ="25:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =8764
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =8980
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =9019
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =25
                                    Name ="Text156"
                                    ControlSource ="26"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =9019
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =9274
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =9019
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld157"
                                            Caption ="26:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =9019
                                            LayoutCachedWidth =9825
                                            LayoutCachedHeight =9235
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =9274
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =26
                                    Name ="Text158"
                                    ControlSource ="27"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =9274
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =9529
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9416
                                            Top =9274
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld159"
                                            Caption ="27:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9416
                                            LayoutCachedTop =9274
                                            LayoutCachedWidth =9827
                                            LayoutCachedHeight =9490
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =9529
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =27
                                    Name ="Text160"
                                    ControlSource ="28"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =9529
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =9784
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9416
                                            Top =9529
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld161"
                                            Caption ="28:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9416
                                            LayoutCachedTop =9529
                                            LayoutCachedWidth =9827
                                            LayoutCachedHeight =9745
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =9784
                                    Width =4743
                                    Height =255
                                    FontSize =8
                                    TabIndex =28
                                    Name ="Text162"
                                    ControlSource ="29"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =9784
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =10039
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9416
                                            Top =9784
                                            Width =411
                                            Height =216
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld163"
                                            Caption ="29:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9416
                                            LayoutCachedTop =9784
                                            LayoutCachedWidth =9827
                                            LayoutCachedHeight =10000
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =255
                                    TextFontFamily =34
                                    Left =9923
                                    Top =10039
                                    Width =4743
                                    Height =1868
                                    FontSize =8
                                    TabIndex =29
                                    Name ="Text164"
                                    ControlSource ="30"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =10039
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =11907
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =255
                                            Left =9416
                                            Top =10039
                                            Width =411
                                            Height =1868
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld165"
                                            Caption ="30:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9416
                                            LayoutCachedTop =10039
                                            LayoutCachedWidth =9827
                                            LayoutCachedHeight =11907
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    Left =9923
                                    Top =10294
                                    Width =4743
                                    Height =1613
                                    FontSize =8
                                    TabIndex =30
                                    Name ="Bezeichnungsfeld167"
                                    ControlSource ="31"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9923
                                    LayoutCachedTop =10294
                                    LayoutCachedWidth =14666
                                    LayoutCachedHeight =11907
                                    Begin
                                        Begin Label
                                            BackStyle =0
                                            OverlapFlags =247
                                            Left =9414
                                            Top =10294
                                            Width =420
                                            Height =1613
                                            FontWeight =400
                                            Name ="Bezeichnungsfeld216"
                                            Caption ="31:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =9414
                                            LayoutCachedTop =10294
                                            LayoutCachedWidth =9834
                                            LayoutCachedHeight =11907
                                        End
                                    End
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =3990
                            Top =6300
                            Width =12120
                            Height =5607
                            Name ="pageMarker"
                            Caption ="Ordner / Ablagen managen"
                            LayoutCachedLeft =3990
                            LayoutCachedTop =6300
                            LayoutCachedWidth =16110
                            LayoutCachedHeight =11907
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =5851
                                    Top =6350
                                    Width =10245
                                    Height =5557
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5851
                                    LayoutCachedTop =6350
                                    LayoutCachedWidth =16096
                                    LayoutCachedHeight =11907
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    OverlapFlags =255
                                    TextAlign =2
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    Left =4085
                                    Top =6347
                                    Width =1701
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

                                    LayoutCachedLeft =4085
                                    LayoutCachedTop =6347
                                    LayoutCachedWidth =5786
                                    LayoutCachedHeight =6574
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4085
                                    Top =6575
                                    Height =5332
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =4085
                                    LayoutCachedTop =6575
                                    LayoutCachedWidth =5786
                                    LayoutCachedHeight =11907
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =3990
                            Top =6300
                            Width =12120
                            Height =5607
                            Name ="pg3"
                            Caption ="top 100"
                            LayoutCachedLeft =3990
                            LayoutCachedTop =6300
                            LayoutCachedWidth =16110
                            LayoutCachedHeight =11907
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =5899
                                    Top =6350
                                    Width =10206
                                    Height =5557
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5899
                                    LayoutCachedTop =6350
                                    LayoutCachedWidth =16105
                                    LayoutCachedHeight =11907
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4085
                                    Top =6328
                                    Height =5579
                                    BackColor =10092543
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"

                                    LayoutCachedLeft =4085
                                    LayoutCachedTop =6328
                                    LayoutCachedWidth =5786
                                    LayoutCachedHeight =11907
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =4251
                    Top =113
                    Width =567
                    Height =228
                    FontSize =8
                    TabIndex =31
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="f0"
                    ControlSource ="NrAblage"
                    StatusBarText ="Zähler der Datenbank"
                    FontName ="Arial"
                    ControlTipText ="Zähler Adresse"

                End
                Begin CommandButton
                    FontUnderline = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =9923
                    Top =623
                    Width =3402
                    Height =309
                    FontSize =8
                    FontWeight =400
                    TabIndex =32
                    ForeColor =16711680
                    Name ="btnfldr"
                    Caption ="Ordner"
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Hyperlink bearbeiten\015\012=Doppel-Click"

                    LayoutCachedLeft =9923
                    LayoutCachedTop =623
                    LayoutCachedWidth =13325
                    LayoutCachedHeight =932
                    Overlaps =1
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    IsHyperlink = NotDefault
                    BorderWidth =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =9923
                    Top =1020
                    Width =6246
                    Height =270
                    FontSize =8
                    TabIndex =33
                    BackColor =15263976
                    ForeColor =16711680
                    Name ="fldr"
                    ControlSource ="Fldr"
                    FontName ="Arial"
                    Tag ="Del2"
                    ControlTipText ="Dateiname / Hyperlink mit rechter Maustate öffnen"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =9923
                    LayoutCachedTop =1020
                    LayoutCachedWidth =16169
                    LayoutCachedHeight =1290
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =30
                    Top =2448
                    Width =3804
                    Height =3393
                    TabIndex =34
                    BackColor =14803425
                    Name ="lstFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"A L L E\""
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ControlTipText ="Liste der Ordner pro Firma"

                    LayoutCachedLeft =30
                    LayoutCachedTop =2448
                    LayoutCachedWidth =3834
                    LayoutCachedHeight =5841
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Ablage.cls"
