Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    FastLaserPrinting = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =9637
    DatasheetFontHeight =10
    ItemSuffix =36
    Left =-19276
    Top =3600
    Right =-9586
    Bottom =14640
    Tag ="PFArtikel"
    RecSrcDt = Begin
        0xaa0a8376de2ce240
    End
    Caption ="Artikel auswählen"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    AllowLayoutView =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
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
            FontName ="Tahoma"
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
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
        Begin Section
            CanGrow = NotDefault
            Height =10889
            BackColor =-2147483633
            Name ="Detailbereich"
            Begin
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =151
                    Top =1257
                    Width =1433
                    Height =342
                    TabIndex =8
                    ForeColor =0
                    Name ="btnBegriff"
                    Caption ="Bezeichnung"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =1257
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =1599
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =1608
                    Top =1272
                    Width =4647
                    Height =255
                    TabIndex =9
                    BackColor =10092543
                    BorderColor =255
                    Name ="Artikel"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;285"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="Del1"
                    ControlTipText ="Artikelbegriff auswählen"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =1272
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =1527
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =151
                    Top =2283
                    Width =1433
                    Height =342
                    TabIndex =14
                    ForeColor =0
                    Name ="btnLieferant"
                    Caption ="Lieferant"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =2283
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =2625
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =20
                    ListWidth =4253
                    Left =1608
                    Top =2308
                    Width =4647
                    Height =255
                    TabIndex =15
                    BackColor =10092543
                    Name ="Firma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;567"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Lieferant mit Name, Ort (aus Firmenliste auswählen)"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =2308
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =2563
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =95
                    Left =151
                    Top =2625
                    Width =1433
                    Height =342
                    TabIndex =16
                    ForeColor =0
                    Name ="btnHersteller"
                    Caption ="Hersteller"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =2625
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =2967
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =20
                    ListWidth =3969
                    Left =1608
                    Top =2653
                    Width =4647
                    Height =255
                    TabIndex =17
                    BackColor =10092543
                    Name ="Hersteller"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;286"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Hersteller (freie Eingabe möglich)"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =2653
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =2908
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =1608
                    Top =1621
                    Width =4647
                    Height =255
                    TabIndex =11
                    BackColor =10092543
                    Name ="ArtikelName"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;286"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="Del2"
                    ControlTipText ="Typ des Artikels"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =1621
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =1876
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =1608
                    Top =1966
                    Width =4647
                    Height =255
                    TabIndex =13
                    BackColor =10092543
                    Name ="ArtikelNr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;286"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Artikel-Nr."

                    LayoutCachedLeft =1608
                    LayoutCachedTop =1966
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =2221
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =95
                    Left =151
                    Top =1599
                    Width =1433
                    Height =342
                    TabIndex =10
                    ForeColor =0
                    Name ="btnArtikelName"
                    Caption ="Typ/Bez."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =1599
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =1941
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =151
                    Top =1941
                    Width =1433
                    Height =342
                    TabIndex =12
                    ForeColor =0
                    Name ="btnArtikelNr"
                    Caption ="Art.-Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =1941
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =2283
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =0
                    Left =151
                    Top =3350
                    Width =1433
                    Height =255
                    TabIndex =22
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="NrArtikel"
                    FontName ="Arial"
                    ControlTipText ="ID Artikel"

                    LayoutCachedLeft =151
                    LayoutCachedTop =3350
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =3605
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =1608
                    Top =3366
                    Height =255
                    TabIndex =23
                    BackColor =40863
                    Name ="showPreis"
                    FontName ="Arial"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =3366
                    LayoutCachedWidth =3309
                    LayoutCachedHeight =3621
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    Left =4494
                    Top =3366
                    Width =1761
                    Height =255
                    TabIndex =24
                    BackColor =12632256
                    Name ="woher"
                    FontName ="Arial"

                    LayoutCachedLeft =4494
                    LayoutCachedTop =3366
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =3621
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =3498
                            Top =3366
                            Width =922
                            Height =240
                            Name ="Bezeichnungsfeld27"
                            Caption ="Woher "
                            FontName ="Arial"
                            LayoutCachedLeft =3498
                            LayoutCachedTop =3366
                            LayoutCachedWidth =4420
                            LayoutCachedHeight =3606
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6413
                    Top =4037
                    TabIndex =28
                    Name ="mitTechDat"
                    DefaultValue ="-1"

                    LayoutCachedLeft =6413
                    LayoutCachedTop =4037
                    LayoutCachedWidth =6673
                    LayoutCachedHeight =4277
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6924
                            Top =4037
                            Width =1200
                            Height =435
                            Name ="Bezeichnungsfeld9"
                            Caption ="techn. Daten\015\012mit übernehmen"
                            FontName ="Arial"
                            LayoutCachedLeft =6924
                            LayoutCachedTop =4037
                            LayoutCachedWidth =8124
                            LayoutCachedHeight =4472
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =151
                    Top =915
                    Width =1433
                    Height =342
                    TabIndex =6
                    ForeColor =0
                    Name ="btnWarenGruppe"
                    Caption ="Warengruppe"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =915
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =1257
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =1608
                    Top =936
                    Width =4647
                    Height =255
                    TabIndex =7
                    BackColor =10092543
                    BorderColor =255
                    Name ="WarenGruppe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;288"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="Del1"
                    ControlTipText ="Warengruppe auswählen"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =936
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =1191
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =151
                    Top =2960
                    Width =1433
                    Height =342
                    TabIndex =18
                    ForeColor =0
                    Name ="btnLiefereinheit"
                    Caption ="Lief-Einheit"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =151
                    LayoutCachedTop =2960
                    LayoutCachedWidth =1584
                    LayoutCachedHeight =3302
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =20
                    ListWidth =1701
                    Left =1608
                    Top =2988
                    Height =255
                    TabIndex =21
                    BackColor =10092543
                    Name ="Liefereinheit"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134;287"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liefereinheit (freie Eingabe möglich)"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =2988
                    LayoutCachedWidth =3309
                    LayoutCachedHeight =3243
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =3453
                    Top =2976
                    Width =967
                    Height =342
                    TabIndex =19
                    ForeColor =0
                    Name ="btnVKWährung"
                    Caption ="Währung"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =3453
                    LayoutCachedTop =2976
                    LayoutCachedWidth =4420
                    LayoutCachedHeight =3318
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =20
                    ListWidth =1701
                    Left =4494
                    Top =2985
                    Width =1761
                    Height =255
                    TabIndex =20
                    BackColor =10092543
                    Name ="VKWährung"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134;287"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liefereinheit (freie Eingabe möglich)"

                    LayoutCachedLeft =4494
                    LayoutCachedTop =2985
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =3240
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =1701
                    Left =1601
                    Top =113
                    Height =255
                    TabIndex =2
                    BackColor =10079487
                    Name ="comFrei"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="ArtikelNr"
                    FontName ="Arial"
                    ControlTipText ="Suchfeld auswählen"

                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =3332
                    Top =113
                    Width =2887
                    Height =255
                    TabIndex =3
                    BackColor =10092543
                    Name ="txtFrei"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Suchfeld; beliebiege Suche eingeben"

                End
                Begin Line
                    BorderWidth =2
                    OverlapFlags =85
                    Left =158
                    Top =453
                    Width =6177
                    BorderColor =16711680
                    Name ="Linie19"
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =144
                    Top =56
                    Width =1433
                    Height =342
                    ForeColor =0
                    Name ="btnFrei"
                    Caption ="Suche...."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Suchfeld einstellen"

                End
                Begin TextBox
                    AutoTab = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =1608
                    Top =3713
                    Height =255
                    TabIndex =25
                    Name ="AnzahlVG"
                    DefaultValue ="1"
                    FontName ="Arial"
                    ControlTipText ="Anzahl"

                    LayoutCachedLeft =1608
                    LayoutCachedTop =3713
                    LayoutCachedWidth =3309
                    LayoutCachedHeight =3968
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =2
                            Left =151
                            Top =3720
                            Width =1433
                            Height =240
                            Name ="Bezeichnungsfeld24"
                            Caption ="Anzahl "
                            FontName ="Arial"
                            LayoutCachedLeft =151
                            LayoutCachedTop =3720
                            LayoutCachedWidth =1584
                            LayoutCachedHeight =3960
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    DecimalPlaces =1
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =3
                    Left =4449
                    Top =3753
                    Width =1761
                    Height =255
                    TabIndex =26
                    Name ="RabattVG"
                    Format ="Standard"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Rabatt"

                    LayoutCachedLeft =4449
                    LayoutCachedTop =3753
                    LayoutCachedWidth =6210
                    LayoutCachedHeight =4008
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =3465
                            Top =3753
                            Width =967
                            Height =240
                            Name ="Bezeichnungsfeld25"
                            Caption ="Rabatt in %"
                            FontName ="Arial"
                            LayoutCachedLeft =3465
                            LayoutCachedTop =3753
                            LayoutCachedWidth =4432
                            LayoutCachedHeight =3993
                        End
                    End
                End
                Begin TextBox
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =1609
                    Top =4014
                    Width =4629
                    Height =868
                    TabIndex =27
                    Name ="BemVGDet"
                    FontName ="Arial"
                    ControlTipText ="Bemerkung"
                    TextFormat =1

                    LayoutCachedLeft =1609
                    LayoutCachedTop =4014
                    LayoutCachedWidth =6238
                    LayoutCachedHeight =4882
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =2
                            Left =151
                            Top =4010
                            Width =1433
                            Height =240
                            Name ="Bezeichnungsfeld26"
                            Caption ="Bemerkung"
                            FontName ="Arial"
                            LayoutCachedLeft =151
                            LayoutCachedTop =4010
                            LayoutCachedWidth =1584
                            LayoutCachedHeight =4250
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =6877
                    Top =113
                    Width =2541
                    Height =3112
                    TabIndex =1
                    BackColor =10092543
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5670"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Aktionen Artikel zuordnen"

                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =6
                    Left =120
                    Top =5219
                    Width =9305
                    Height =5670
                    TabIndex =29
                    BackColor =12632256
                    Name ="lstArtikel"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;1701;1701;2268;1134"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnMouseDown ="[Event Procedure]"
                    ControlTipText ="Doppelclick trägt den markierten Artikel ein"

                    LayoutCachedLeft =120
                    LayoutCachedTop =5219
                    LayoutCachedWidth =9425
                    LayoutCachedHeight =10889
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =120
                            Top =5001
                            Width =9135
                            Height =210
                            Name ="Bezeichnungsfeld23"
                            Caption ="Liste der ausgewählten Artikel (Doppelclicken zum Eintragen);  mehrere markieren"
                                " mit SHIFT / CTRL-Taste:"
                            FontName ="Arial"
                            LayoutCachedLeft =120
                            LayoutCachedTop =5001
                            LayoutCachedWidth =9255
                            LayoutCachedHeight =5211
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =150
                    Top =525
                    Width =1433
                    Height =342
                    TabIndex =4
                    ForeColor =0
                    Name ="Befehl33"
                    Caption ="verfügbar"
                    FontName ="Arial"
                    ControlTipText ="lösche Eintrag"

                    LayoutCachedLeft =150
                    LayoutCachedTop =525
                    LayoutCachedWidth =1583
                    LayoutCachedHeight =867
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =1607
                    Top =546
                    Width =2082
                    Height =255
                    TabIndex =5
                    BackColor =10092543
                    BorderColor =255
                    Name ="Verfügbar"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Ja\""
                    FontName ="Arial"
                    Tag ="Del1"
                    ControlTipText ="Auswahl nach Verfügbarkeit; Standardwert = JA"

                    LayoutCachedLeft =1607
                    LayoutCachedTop =546
                    LayoutCachedWidth =3689
                    LayoutCachedHeight =801
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =3969
                    Left =4173
                    Top =566
                    Width =2082
                    Height =255
                    TabIndex =30
                    BackColor =10092543
                    BorderColor =255
                    Name ="Lager"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Alle\""
                    FontName ="Arial"
                    Tag ="Del1"
                    ControlTipText ="Auswahl nach Lager-Verfügbarkeit; Standardwert = alle Artikel egal ob an Lager o"
                        "der Nicht"

                    LayoutCachedLeft =4173
                    LayoutCachedTop =566
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =821
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Artikel.cls"
