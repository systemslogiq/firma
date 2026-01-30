Version =20
VersionRequired =20
Begin Form
    NavigationButtons = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    TabularFamily =4
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =27240
    DatasheetFontHeight =10
    ItemSuffix =91
    Right =28170
    Bottom =11865
    Tag ="VG"
    ShortcutMenuBar ="tlbOHrightMouse"
    RecSrcDt = Begin
        0xe06ab113f075e640
    End
    UniqueTable ="T_VG"
    Caption ="Vorgänge"
    OnDelete ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnKeyDown ="[Event Procedure]"
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
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
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
        Begin Subform
            SpecialEffect =2
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
            FontName ="Tahoma"
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
        End
        Begin Section
            CanGrow = NotDefault
            Height =11820
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin Tab
                    OverlapFlags =85
                    Left =5745
                    Width =18636
                    Height =6150
                    FontWeight =600
                    Name ="RegMain"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5745
                    LayoutCachedWidth =24381
                    LayoutCachedHeight =6150
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5886
                            Top =420
                            Width =18360
                            Height =5595
                            Name ="pageVorgang"
                            Caption ="99 ITV001 Fehler - 53045.002 - Noord Natie Terminals N.V - Frigutec OAT+ 50/50 l"
                                "ilac"
                            LayoutCachedLeft =5886
                            LayoutCachedTop =420
                            LayoutCachedWidth =24246
                            LayoutCachedHeight =6015
                            Begin
                                Begin Rectangle
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    OverlapFlags =223
                                    Left =19629
                                    Top =1851
                                    Width =4590
                                    Height =4122
                                    Name ="REPreis"
                                    LayoutCachedLeft =19629
                                    LayoutCachedTop =1851
                                    LayoutCachedWidth =24219
                                    LayoutCachedHeight =5973
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =40
                                    ListWidth =2835
                                    Left =8378
                                    Top =484
                                    Width =3001
                                    Height =255
                                    FontWeight =700
                                    BackColor =255
                                    Name ="NrQK"
                                    ControlSource ="NrQK"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="m1"
                                    ControlTipText ="Nummer und Bezeichnung der Vorgangsart\015\012Doppelklick öffnet ein separates F"
                                        "ormular und zeigt die Vorgaben zur Vorgangsart, um diese ggf. anzupassen"

                                    LayoutCachedLeft =8378
                                    LayoutCachedTop =484
                                    LayoutCachedWidth =11379
                                    LayoutCachedHeight =739
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =21741
                                    Top =5690
                                    Width =221
                                    Height =255
                                    TabIndex =1
                                    Name ="VGDat1D"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnLostFocus ="[Event Procedure]"
                                    ControlTipText ="Datum 1 D 1 / Leistung am\015\012Tageseingabe ==> Datum wird automatisch generie"
                                        "rt aus dem aktuellen Monat\015\012Doppel-Klick==> heutiges Datum eintragen, wenn"
                                        " noch nichts eingetragen ist"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21741
                                    LayoutCachedTop =5690
                                    LayoutCachedWidth =21962
                                    LayoutCachedHeight =5945
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =22012
                                    Top =5691
                                    Width =964
                                    Height =255
                                    TabIndex =2
                                    Name ="VGDat1"
                                    ControlSource ="VGDat1"
                                    Format ="Short Date"
                                    OnExit ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    ControlTipText ="Datum 1 D 1 / Leistung am"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22012
                                    LayoutCachedTop =5691
                                    LayoutCachedWidth =22976
                                    LayoutCachedHeight =5946
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =420
                                    Width =1224
                                    Height =340
                                    TabIndex =3
                                    ForeColor =10040115
                                    Name ="btnVG"
                                    Caption ="Art"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Öffne Vorgangsart 99 ITV001 Fehler\015\012ggf. zum Anpassen der Texte"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =420
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =760
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =760
                                    Width =1224
                                    Height =340
                                    TabIndex =4
                                    ForeColor =0
                                    Name ="btnVGDatum"
                                    Caption ="Datum"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kalender öffnen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =760
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =1100
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =7301
                                    Top =784
                                    Width =964
                                    Height =255
                                    TabIndex =5
                                    Name ="VGdatum"
                                    ControlSource ="VGdatum"
                                    Format ="Short Date"
                                    StatusBarText ="VG erstellt am ..."
                                    OnExit ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="=Date()"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    Tag ="m2"
                                    ControlTipText ="Datum des Vorganges (kann mit Plus- oder Minus-Taste verändert werden)\015\012Do"
                                        "ppelclick zeigt alle gleichen Vorgänge am gleichen Tag"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =784
                                    LayoutCachedWidth =8265
                                    LayoutCachedHeight =1039
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =5
                                    ListRows =30
                                    ListWidth =7656
                                    Left =8378
                                    Top =784
                                    Width =1134
                                    Height =255
                                    FontWeight =700
                                    TabIndex =6
                                    BackColor =255
                                    Name ="VGID"
                                    ControlSource ="VGID"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="852;3402;2268;0;852"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Projekt-Nr. (ID) des Vorganges (zum Auswählen und Ändern)\015\012Doppelklick zei"
                                        "gt Projekt-Kurz-Übersicht"

                                    LayoutCachedLeft =8378
                                    LayoutCachedTop =784
                                    LayoutCachedWidth =9512
                                    LayoutCachedHeight =1039
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =2
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =1701
                                    Left =9581
                                    Top =780
                                    Width =740
                                    Height =255
                                    FontWeight =700
                                    TabIndex =7
                                    BackColor =255
                                    Name ="VGIDu"
                                    ControlSource ="VGIDu"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;1134"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Projekt-Unternummer"
                                    Format ="000"

                                    LayoutCachedLeft =9581
                                    LayoutCachedTop =780
                                    LayoutCachedWidth =10321
                                    LayoutCachedHeight =1035
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    TextAlign =2
                                    ColumnCount =3
                                    ListRows =10
                                    ListWidth =3119
                                    Left =10697
                                    Top =784
                                    Width =680
                                    Height =255
                                    FontWeight =700
                                    TabIndex =8
                                    Name ="VGAbteilung"
                                    ControlSource ="VGAbteilung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;2268;0"
                                    StatusBarText ="Abteilung"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Abteilung resp. Mandant"

                                    LayoutCachedLeft =10697
                                    LayoutCachedTop =784
                                    LayoutCachedWidth =11377
                                    LayoutCachedHeight =1039
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    DecimalPlaces =0
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =11377
                                    Top =784
                                    Width =680
                                    Height =255
                                    FontWeight =700
                                    TabIndex =9
                                    Name ="VGNr"
                                    ControlSource ="VGNr"
                                    Format ="0000"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Laufende Nummer pro Vorgang\015\012Doppelclick nimmt die Nummer in den Zwischens"
                                        "peicher"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11377
                                    LayoutCachedTop =784
                                    LayoutCachedWidth =12057
                                    LayoutCachedHeight =1039
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    DecimalPlaces =0
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =12074
                                    Top =784
                                    Width =680
                                    Height =255
                                    FontWeight =700
                                    TabIndex =10
                                    Name ="VGJahr"
                                    ControlSource ="VGJahr"
                                    DefaultValue ="=Format([VGDatum],\"yy\")"
                                    FontName ="Arial"
                                    ControlTipText ="Jahr, in dem der Vorgang erstellt wurde"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =12074
                                    LayoutCachedTop =784
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =1039
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =7301
                                    Top =1099
                                    Width =4074
                                    Height =255
                                    TabIndex =11
                                    Name ="Firma"
                                    ControlSource ="Firma"
                                    StatusBarText ="Firma"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="del2"
                                    ShortcutMenuBar ="m1"
                                    ControlTipText ="Firma (Doppelclick zeigt alle Vorgänge mit dieser Firma an)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =1099
                                    LayoutCachedWidth =11375
                                    LayoutCachedHeight =1354
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =1100
                                    Width =1224
                                    Height =340
                                    TabIndex =12
                                    ForeColor =10040115
                                    Name ="btnFirma"
                                    Caption ="Firma"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Firma und alle Mitarbeiter anzeigen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =1100
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =1440
                                    Overlaps =1
                                End
                                Begin OptionGroup
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    BorderWidth =3
                                    OverlapFlags =223
                                    Left =10348
                                    Top =1394
                                    Width =1066
                                    Height =309
                                    TabIndex =13
                                    Name ="DuSieVG"
                                    ControlSource ="DuSieVG"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"

                                    LayoutCachedLeft =10348
                                    LayoutCachedTop =1394
                                    LayoutCachedWidth =11414
                                    LayoutCachedHeight =1703
                                    Begin
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =10348
                                            Top =1473
                                            Width =187
                                            Height =187
                                            OptionValue =1
                                            Name ="DuSieVG_Du"

                                            LayoutCachedLeft =10348
                                            LayoutCachedTop =1473
                                            LayoutCachedWidth =10535
                                            LayoutCachedHeight =1660
                                            Begin
                                                Begin Label
                                                    OverlapFlags =247
                                                    TextAlign =1
                                                    Left =10522
                                                    Top =1419
                                                    Width =270
                                                    Height =255
                                                    BackColor =12632256
                                                    Name ="Bezeichnungsfeld178"
                                                    Caption ="Du"
                                                    FontName ="Arial"
                                                    LayoutCachedLeft =10522
                                                    LayoutCachedTop =1419
                                                    LayoutCachedWidth =10792
                                                    LayoutCachedHeight =1674
                                                End
                                            End
                                        End
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =10887
                                            Top =1473
                                            Width =187
                                            Height =187
                                            OptionValue =0
                                            Name ="DuSieVG_Sie"

                                            LayoutCachedLeft =10887
                                            LayoutCachedTop =1473
                                            LayoutCachedWidth =11074
                                            LayoutCachedHeight =1660
                                            Begin
                                                Begin Label
                                                    OverlapFlags =215
                                                    TextAlign =1
                                                    Left =11114
                                                    Top =1419
                                                    Width =300
                                                    Height =255
                                                    BackColor =12632256
                                                    Name ="Bezeichnungsfeld180"
                                                    Caption ="Sie"
                                                    FontName ="Arial"
                                                    LayoutCachedLeft =11114
                                                    LayoutCachedTop =1419
                                                    LayoutCachedWidth =11414
                                                    LayoutCachedHeight =1674
                                                End
                                            End
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =7301
                                    Top =1409
                                    Width =2934
                                    Height =255
                                    TabIndex =14
                                    Name ="NamePerson"
                                    ControlSource ="NamePerson"
                                    StatusBarText ="Firma"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Partner (Doppelclick zeigt alle Vorgänge mit diesem Partner an)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =1409
                                    LayoutCachedWidth =10235
                                    LayoutCachedHeight =1664
                                End
                                Begin CommandButton
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =1440
                                    Width =819
                                    Height =340
                                    TabIndex =15
                                    ForeColor =10040115
                                    Name ="btnKunde"
                                    Caption ="Partner"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Partner anzeigen (Firma und Mitarbeiter werden ebenfalls angezeigt)"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =1440
                                    LayoutCachedWidth =6854
                                    LayoutCachedHeight =1780
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6910
                                    Top =1440
                                    Width =351
                                    Height =340
                                    TabIndex =16
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

                                    LayoutCachedLeft =6910
                                    LayoutCachedTop =1440
                                    LayoutCachedWidth =7261
                                    LayoutCachedHeight =1780
                                    Overlaps =1
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    TabStop = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    FELineBreak = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =7301
                                    Top =1710
                                    Width =4074
                                    Height =1020
                                    TabIndex =17
                                    Name ="Anschrift"
                                    ControlSource ="Anschrift"
                                    StatusBarText ="Anschrift"
                                    FontName ="Arial"
                                    ControlTipText ="komplette Anschrift (kann hier individuell geändert werden)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =1710
                                    LayoutCachedWidth =11375
                                    LayoutCachedHeight =2730
                                End
                                Begin CommandButton
                                    OverlapFlags =223
                                    Left =6035
                                    Top =1780
                                    Width =1224
                                    Height =340
                                    TabIndex =18
                                    ForeColor =255
                                    Name ="btnNavigator"
                                    Caption ="ändere Partner"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="zeigt Adressen-Auswahl beim 1. Click\015\012übernimmt Adresse beim 2. Click!"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =1780
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =2120
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =2120
                                    Width =1224
                                    Height =355
                                    TabIndex =19
                                    ForeColor =10040115
                                    Name ="btncomAnschrift"
                                    Caption ="Anschrift"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =2120
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =2475
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    OverlapFlags =223
                                    TextAlign =1
                                    ColumnCount =4
                                    ListRows =30
                                    ListWidth =9925
                                    Left =6035
                                    Top =2475
                                    Width =1224
                                    Height =270
                                    TabIndex =20
                                    BackColor =10092543
                                    Name ="comAnschrift"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835;6804;0;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"Person/Abteilung\""
                                    FontName ="Arial"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Anschrift auswählen\015\012Geänderte Anschrift wird eingetragen, Vorgang wird au"
                                        "tomatisch gespeichert!"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =2475
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =2745
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =2745
                                    Width =1224
                                    Height =340
                                    TabIndex =21
                                    ForeColor =10040115
                                    Name ="btnAnrede"
                                    Caption ="Anrede"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Tabelle öffnen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =2745
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =3085
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =7301
                                    Top =2782
                                    Width =4074
                                    Height =255
                                    TabIndex =22
                                    Name ="VGAnrede"
                                    ControlSource ="VGAnrede"
                                    FontName ="Arial"
                                    ControlTipText ="Anrede"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =2782
                                    LayoutCachedWidth =11375
                                    LayoutCachedHeight =3037
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =2835
                                    Left =11446
                                    Top =2782
                                    Width =246
                                    Height =255
                                    TabIndex =23
                                    Name ="COMAnrede"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Anrede auswählen"

                                    LayoutCachedLeft =11446
                                    LayoutCachedTop =2782
                                    LayoutCachedWidth =11692
                                    LayoutCachedHeight =3037
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6035
                                    Top =3085
                                    Width =579
                                    Height =340
                                    TabIndex =24
                                    ForeColor =0
                                    Name ="btnVGID"
                                    Caption ="Titel"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Projektname, Titel: mit Click alle Vorgänge des gleichen Projektes öffnen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =3085
                                    LayoutCachedWidth =6614
                                    LayoutCachedHeight =3425
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =6616
                                    Top =3085
                                    Width =384
                                    Height =340
                                    TabIndex =25
                                    ForeColor =10040115
                                    Name ="btnStandardText"
                                    Caption ="St."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Standardtexte anzeigen"

                                    LayoutCachedLeft =6616
                                    LayoutCachedTop =3085
                                    LayoutCachedWidth =7000
                                    LayoutCachedHeight =3425
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =3969
                                    Left =7301
                                    Top =3180
                                    Width =5161
                                    Height =270
                                    FontWeight =700
                                    TabIndex =26
                                    Name ="VG"
                                    ControlSource ="VG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3969"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"Projektname ?\""
                                    FontName ="Arial"
                                    Tag ="m3"
                                    ControlTipText ="Projektname (Auswahlliste aus Lexikon)\015\012Doppelclick trägt diesen Wert in d"
                                        "as Suchfeld ein und filtert entsprechend"

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =3180
                                    LayoutCachedWidth =12462
                                    LayoutCachedHeight =3450
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =6804
                                    Left =12535
                                    Top =3180
                                    Width =219
                                    Height =270
                                    FontWeight =700
                                    TabIndex =27
                                    Name ="VGV"
                                    ControlSource ="VG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="6804"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="Del2"
                                    ControlTipText ="Projektname (Auswahlliste aus bereits erstellten Daten)"

                                    LayoutCachedLeft =12535
                                    LayoutCachedTop =3180
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =3450
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =20
                                    ListWidth =6804
                                    Left =7000
                                    Top =3135
                                    Width =221
                                    FontWeight =700
                                    TabIndex =28
                                    BackColor =10092543
                                    Name ="StandardText"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2835;3402;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Standardtexte übernehmen"

                                    LayoutCachedLeft =7000
                                    LayoutCachedTop =3135
                                    LayoutCachedWidth =7221
                                    LayoutCachedHeight =3375
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =6035
                                    Top =3425
                                    Width =1224
                                    Height =313
                                    TabIndex =29
                                    ForeColor =10040115
                                    Name ="btnEinleitung"
                                    Caption ="Einleitung"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =6035
                                    LayoutCachedTop =3425
                                    LayoutCachedWidth =7259
                                    LayoutCachedHeight =3738
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =7088
                                    Left =7301
                                    Top =3431
                                    Width =5161
                                    Height =270
                                    TabIndex =30
                                    Name ="Einleitung"
                                    ControlSource ="Einleitung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="6804"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Einleitung (Auswahlliste aus Lexikon)\015\012Hier können Sie auch Ersetzungstext"
                                        "e (<xxx>) einbauen"

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =3431
                                    LayoutCachedWidth =12462
                                    LayoutCachedHeight =3701
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =6804
                                    Left =12535
                                    Top =3465
                                    Width =219
                                    Height =270
                                    FontWeight =700
                                    TabIndex =31
                                    Name ="EinleitungV"
                                    ControlSource ="Einleitung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="6804"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Einleitung (Auswahlliste aus bereits erstellten Daten)"

                                    LayoutCachedLeft =12535
                                    LayoutCachedTop =3465
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =3735
                                End
                                Begin Subform
                                    OverlapFlags =247
                                    SpecialEffect =0
                                    Left =12864
                                    Top =450
                                    Width =6717
                                    Height =5496
                                    TabIndex =32
                                    Name ="UF_txt"
                                    SourceObject ="Form.UF_txt"
                                    StatusBarText ="freie Texte; Doppelclick filtert die Vorgänge"

                                    LayoutCachedLeft =12864
                                    LayoutCachedTop =450
                                    LayoutCachedWidth =19581
                                    LayoutCachedHeight =5946
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =19688
                                    Top =1065
                                    Width =780
                                    Height =345
                                    TabIndex =33
                                    ForeColor =0
                                    Name ="btnNrMitarbeiter"
                                    Caption ="MA 1"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Ersteller anzeigen"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =1065
                                    LayoutCachedWidth =20468
                                    LayoutCachedHeight =1410
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    TextAlign =1
                                    ColumnCount =7
                                    ListRows =30
                                    ListWidth =6804
                                    Left =20558
                                    Top =1155
                                    Width =1071
                                    Height =255
                                    TabIndex =34
                                    Name ="NrMitarbeiter"
                                    ControlSource ="NrMitarbeiter"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;2268;3402;0;0;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Verantwortlicher Mitarbeiter"

                                    LayoutCachedLeft =20558
                                    LayoutCachedTop =1155
                                    LayoutCachedWidth =21629
                                    LayoutCachedHeight =1410
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =21635
                                    Top =1065
                                    Width =735
                                    Height =345
                                    TabIndex =35
                                    ForeColor =0
                                    Name ="btn2Unterschrift"
                                    Caption ="MA 2"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zweite Unterschrift: Adresse öffnen, wenn eingetragen"

                                    LayoutCachedLeft =21635
                                    LayoutCachedTop =1065
                                    LayoutCachedWidth =22370
                                    LayoutCachedHeight =1410
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =5
                                    ListRows =30
                                    ListWidth =6804
                                    Left =22433
                                    Top =1155
                                    Width =1658
                                    Height =255
                                    TabIndex =36
                                    Name ="NrMitarbeiter2"
                                    ControlSource ="NrMitarbeiter2"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;2268;3402;0;0;0"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Verantwortlicher 2. Mitarbeiter"

                                    LayoutCachedLeft =22433
                                    LayoutCachedTop =1155
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =1410
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =20
                                    ListWidth =1701
                                    Left =22433
                                    Top =1493
                                    Width =1658
                                    Height =255
                                    TabIndex =37
                                    Name ="VGSprache"
                                    ControlSource ="VGSprache"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"deutsch\""
                                    FontName ="Arial"
                                    ControlTipText ="Auswahlmöglichkeiten für die Sprache"

                                    LayoutCachedLeft =22433
                                    LayoutCachedTop =1493
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =1748
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =21635
                                    Top =1470
                                    Width =735
                                    Height =340
                                    TabIndex =38
                                    ForeColor =10040115
                                    Name ="btnVGSprache"
                                    Caption ="Sprache"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Übersetzungstabelle öffnen"

                                    LayoutCachedLeft =21635
                                    LayoutCachedTop =1470
                                    LayoutCachedWidth =22370
                                    LayoutCachedHeight =1810
                                    Overlaps =1
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =0
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =223
                                    TextAlign =1
                                    Left =11511
                                    Top =1099
                                    Width =1243
                                    Height =255
                                    TabIndex =39
                                    Name ="Marker"
                                    ControlSource ="MarkerVG"
                                    FontName ="Arial"
                                    ControlTipText ="Markierung durch aktuellen User"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11511
                                    LayoutCachedTop =1099
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =1354
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    TextAlign =1
                                    Left =11511
                                    Top =1612
                                    Width =1243
                                    Height =255
                                    TabIndex =40
                                    ForeColor =8421504
                                    Name ="NrFunktion"
                                    ControlSource ="IDF"
                                    StatusBarText ="NrFunktion"
                                    FontName ="Arial"
                                    ControlTipText ="ID NrFunktion"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11511
                                    LayoutCachedTop =1612
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =1867
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =19688
                                    Top =450
                                    Width =780
                                    Height =325
                                    TabIndex =41
                                    ForeColor =10040115
                                    Name ="btnPrint"
                                    Caption ="drucke Seitenansicht"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaad00000000000dadd0888888888080da ,
                                        0x000000000000080d0888888bbb88000a088888877788080d0000000000000880 ,
                                        0x0888888888808080d000000000080800ad0ffffffff08080dad0f00000f0000a ,
                                        0xada0ffffffff0daddada0f00000f0adaadad0ffffffff0addadad000000000da ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="zeige Vorgang, wie rechts eingestellt"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =450
                                    LayoutCachedWidth =20468
                                    LayoutCachedHeight =775
                                    Overlaps =1
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    BackStyle =0
                                    IMESentenceMode =3
                                    Left =9214
                                    Top =3911
                                    Width =3540
                                    Height =573
                                    FontWeight =700
                                    TabIndex =42
                                    BackColor =12632256
                                    ForeColor =255
                                    Name ="txtHinweis"
                                    FontName ="Arial"
                                    Tag ="0"
                                    ControlTipText ="Hinweise"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =9214
                                    LayoutCachedTop =3911
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =4484
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =1969
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =43
                                    Name ="VGDetSum"
                                    ControlSource ="VGDetSum"
                                    Format ="Standard"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Zwischentotal (Summe der einzelnen Artikel)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =1969
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =2224
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =1134
                                    Left =23176
                                    Top =1969
                                    Width =915
                                    Height =255
                                    TabIndex =44
                                    Name ="VGWährung"
                                    ControlSource ="VGWährung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =1969
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =2224
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =2253
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =45
                                    BackColor =14342874
                                    Name ="VGDetSum1"
                                    ControlSource ="VGdetsum1"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    ControlTipText ="Zwischentotal (Summe der einzelnen Artikel) mit 2. MWST (kann nur in den Artikel"
                                        "n geändert werden)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =2253
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =2508
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    BackStyle =0
                                    IMESentenceMode =3
                                    Left =19688
                                    Top =2254
                                    Width =2040
                                    Height =255
                                    TabIndex =46
                                    BackColor =12632256
                                    Name ="txt2MWST"
                                    ControlSource ="=\"Zwischentotal 2. MWST\""
                                    FontName ="Arial"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =2254
                                    LayoutCachedWidth =21728
                                    LayoutCachedHeight =2509
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =5103
                                    Left =19688
                                    Top =2604
                                    Width =1367
                                    Height =255
                                    TabIndex =47
                                    Name ="RabattArt"
                                    ControlSource ="RabattArt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1423;3402"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"Rabatt %\""
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Rabatt-Art"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =2604
                                    LayoutCachedWidth =21055
                                    LayoutCachedHeight =2859
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =21004
                                    Top =2604
                                    Width =701
                                    Height =255
                                    TabIndex =48
                                    Name ="VGRabatt"
                                    ControlSource ="VGRabatt"
                                    Format ="Standard"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte ein \"0\" ein beim Rabatt"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Rabatt"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21004
                                    LayoutCachedTop =2604
                                    LayoutCachedWidth =21705
                                    LayoutCachedHeight =2859
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =2604
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =49
                                    Name ="Rabatt"
                                    Format ="Standard"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte ein \"0\" ein beim Rabatt-Wert"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Rabatt (hier änderbar, %-Satz wird dann neu berechnet)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =2604
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =2859
                                End
                                Begin TextBox
                                    Enabled = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =2604
                                    Width =915
                                    Height =255
                                    TabIndex =50
                                    BackColor =12632256
                                    Name ="VGWährungRabattProz"
                                    ControlSource ="VGWährung"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =2604
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =2859
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21004
                                    Top =3221
                                    Width =701
                                    Height =255
                                    TabIndex =51
                                    ForeColor =255
                                    Name ="MWSt"
                                    ControlSource ="MWSt"
                                    Format ="Standard"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte ein \"0\" ein bei MWSt"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Mehrwertsteuer\015\012Mit Doppelclick umschalten zwischen 0 und MWSt des Landes"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21004
                                    LayoutCachedTop =3221
                                    LayoutCachedWidth =21705
                                    LayoutCachedHeight =3476
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =3
                                            Left =19688
                                            Top =3221
                                            Width =1266
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld4"
                                            Caption ="MwSt"
                                            FontName ="Arial"
                                            LayoutCachedLeft =19688
                                            LayoutCachedTop =3221
                                            LayoutCachedWidth =20954
                                            LayoutCachedHeight =3476
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =3221
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =52
                                    BackColor =12632256
                                    Name ="SumVGMWSt"
                                    ControlSource ="SumVGMWSt"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    ControlTipText ="MWSt-Betrag"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =3221
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =3476
                                End
                                Begin TextBox
                                    Enabled = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =3221
                                    Width =915
                                    Height =255
                                    TabIndex =53
                                    BackColor =12632256
                                    Name ="Text231"
                                    ControlSource ="VGWährung"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =3221
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =3476
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21004
                                    Top =3503
                                    Width =701
                                    Height =255
                                    TabIndex =54
                                    BackColor =14342874
                                    ForeColor =255
                                    Name ="MWSt1"
                                    ControlSource ="MWST1"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    ControlTipText ="abweichende MwSt (2 unterschiedl. MWSt vorhanden!, kann nur bei den Artikeln geä"
                                        "ndert werden)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21004
                                    LayoutCachedTop =3503
                                    LayoutCachedWidth =21705
                                    LayoutCachedHeight =3758
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =3
                                            Left =19688
                                            Top =3503
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld426"
                                            Caption ="2."
                                            FontName ="Arial"
                                            LayoutCachedLeft =19688
                                            LayoutCachedTop =3503
                                            LayoutCachedWidth =20969
                                            LayoutCachedHeight =3758
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =3503
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =55
                                    BackColor =12632256
                                    Name ="SumVGMWSt1"
                                    ControlSource ="SumVGMWSt1"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    ControlTipText ="MWSt-Betrag"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =3503
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =3758
                                End
                                Begin TextBox
                                    Enabled = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =3503
                                    Width =915
                                    Height =255
                                    TabIndex =56
                                    BackColor =12632256
                                    Name ="Text428"
                                    ControlSource ="VGWährung"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =3503
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =3758
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =3941
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =57
                                    BorderColor =255
                                    Name ="SumVGTotA"
                                    Format ="Standard"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Gesamttotal"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =3941
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =4196
                                End
                                Begin TextBox
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =3941
                                    Width =915
                                    Height =255
                                    TabIndex =58
                                    BackColor =12632256
                                    BorderColor =255
                                    Name ="VGWährung1"
                                    ControlSource ="VGWährung"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =3941
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =4196
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =20
                                    ListWidth =7656
                                    Left =19688
                                    Top =3949
                                    Width =2040
                                    Height =255
                                    TabIndex =59
                                    Name ="VGPrint"
                                    ControlSource ="VGPrint"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268;5103"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Darstellung des Layouts; mit Doppelklick umschalten"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =3949
                                    LayoutCachedWidth =21728
                                    LayoutCachedHeight =4204
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =19688
                                    Top =4260
                                    Width =2040
                                    Height =340
                                    TabIndex =60
                                    ForeColor =0
                                    Name ="btnKurs"
                                    Caption ="Kurs"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Ländertabelle öffnen"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =4260
                                    LayoutCachedWidth =21728
                                    LayoutCachedHeight =4600
                                    Overlaps =1
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =4303
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =61
                                    BackColor =12632256
                                    BorderColor =32768
                                    ForeColor =32768
                                    Name ="SumVGMLtot"
                                    ControlSource ="SumVGMLtot"
                                    Format ="Standard"
                                    StatusBarText ="Gesamttotal"
                                    FontName ="Arial"
                                    ControlTipText ="Summe in LOC"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =4303
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =4558
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =4303
                                    Width =915
                                    Height =255
                                    TabIndex =62
                                    BackColor =12632256
                                    BorderColor =32768
                                    Name ="WährungDBLand"
                                    ControlSource ="WährungDBLand"
                                    FontName ="Arial"
                                    ControlTipText ="Währung (siehe Tabelle Land, das angekreuzt ist)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =4303
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =4558
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    Visible = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    DecimalPlaces =4
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =2268
                                    Left =19688
                                    Top =4643
                                    Width =2040
                                    Height =255
                                    TabIndex =63
                                    BorderColor =32768
                                    ForeColor =32768
                                    Name ="VGKurs"
                                    ControlSource ="VGKurs"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134;851"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte einen Kurswert ein!"
                                    DefaultValue ="1"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="aktueller Tages-Kurs EUR zu EUR"
                                    Format ="Standard"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =4643
                                    LayoutCachedWidth =21728
                                    LayoutCachedHeight =4898
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =4643
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =64
                                    BackColor =12632256
                                    BorderColor =32768
                                    ForeColor =32768
                                    Name ="SumVGEURTot"
                                    ControlSource ="SumVGEURTot"
                                    Format ="Standard"
                                    StatusBarText ="Gesamttotal"
                                    FontName ="Arial"
                                    ControlTipText ="Summe in EUR"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =4643
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =4898
                                    Begin
                                        Begin Label
                                            BackStyle =1
                                            OldBorderStyle =1
                                            OverlapFlags =215
                                            TextAlign =1
                                            Left =23176
                                            Top =4643
                                            Width =915
                                            Height =255
                                            BackColor =12632256
                                            BorderColor =32768
                                            ForeColor =32768
                                            Name ="lblEUR"
                                            Caption ="EUR"
                                            FontName ="Arial"
                                            LayoutCachedLeft =23176
                                            LayoutCachedTop =4643
                                            LayoutCachedWidth =24091
                                            LayoutCachedHeight =4898
                                        End
                                    End
                                End
                                Begin CommandButton
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =19688
                                    Top =4968
                                    Width =2019
                                    Height =340
                                    TabIndex =65
                                    ForeColor =0
                                    Name ="btnVGDat2"
                                    Caption ="Einlagerung"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kalender öffnen"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =4968
                                    LayoutCachedWidth =21707
                                    LayoutCachedHeight =5308
                                    Overlaps =1
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =23165
                                    Top =5019
                                    Width =926
                                    Height =255
                                    TabIndex =66
                                    BackColor =65280
                                    Name ="VGSng1"
                                    ControlSource ="VGSng1"
                                    Format ="Standard"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Fehlerbetrag"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23165
                                    LayoutCachedTop =5019
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =5274
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =5313
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =67
                                    BorderColor =255
                                    Name ="BetragKasse"
                                    ControlSource ="VGDetSum"
                                    Format ="Standard"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Betrag (Entnahme als Minus eingeben)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =5313
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =5568
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            TextAlign =3
                                            Left =19688
                                            Top =5313
                                            Width =2040
                                            Height =255
                                            BackColor =12632256
                                            BorderColor =255
                                            Name ="Bezeichnungsfeld293"
                                            Caption ="Betrag"
                                            FontName ="Arial"
                                            LayoutCachedLeft =19688
                                            LayoutCachedTop =5313
                                            LayoutCachedWidth =21728
                                            LayoutCachedHeight =5568
                                        End
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    Visible = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =567
                                    Left =23176
                                    Top =5313
                                    Width =915
                                    Height =255
                                    TabIndex =68
                                    BorderColor =255
                                    Name ="WährungKasse"
                                    ControlSource ="VGWährung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;0"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    ControlTipText ="Währung"

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =5313
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =5568
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =19688
                                    Top =5646
                                    Width =2004
                                    Height =340
                                    TabIndex =69
                                    ForeColor =0
                                    Name ="btnVGDat1"
                                    Caption ="D 1 / Leistung am"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Öffne Kalender"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =5646
                                    LayoutCachedWidth =21692
                                    LayoutCachedHeight =5986
                                    Overlaps =1
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =11511
                                    Top =1357
                                    Width =1243
                                    Height =255
                                    TabIndex =70
                                    ForeColor =8421504
                                    Name ="f0"
                                    ControlSource ="NrVG"
                                    StatusBarText ="NrVG"
                                    FontName ="Arial"
                                    ControlTipText ="ID VG"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11511
                                    LayoutCachedTop =1357
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =1612
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =21743
                                    Top =5018
                                    Width =221
                                    Height =255
                                    TabIndex =71
                                    Name ="vgdat2D"
                                    ValidationRule =">0 And <32"
                                    ValidationText ="Tageseingabe zwischen 1 und 31"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Datum 2 Einlagerung\015\012Tageseingabe ==> Datum wird automatisch generiert aus"
                                        " dem aktuellen Monat\015\012Doppel-Klick==> heutiges Datum eintragen, wenn noch "
                                        "nichts eingetragen ist"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21743
                                    LayoutCachedTop =5018
                                    LayoutCachedWidth =21964
                                    LayoutCachedHeight =5273
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =22012
                                    Top =5019
                                    Width =964
                                    Height =255
                                    TabIndex =72
                                    Name ="VGDat2"
                                    ControlSource ="VGDat2"
                                    Format ="Short Date"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyPress ="[Event Procedure]"
                                    OnLostFocus ="[Event Procedure]"
                                    ControlTipText ="Datum 2 Einlagerung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22012
                                    LayoutCachedTop =5019
                                    LayoutCachedWidth =22976
                                    LayoutCachedHeight =5274
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =11511
                                    Top =484
                                    Width =1243
                                    Height =255
                                    TabIndex =73
                                    ForeColor =8421504
                                    Name ="Anr"
                                    ControlSource ="Anr"
                                    StatusBarText ="NrVG"
                                    FontName ="Arial"
                                    ControlTipText ="Komplette Nummer"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11511
                                    LayoutCachedTop =484
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =739
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =19688
                                    Top =1470
                                    Width =780
                                    Height =340
                                    TabIndex =74
                                    ForeColor =10040115
                                    Name ="btnLayout"
                                    Caption ="Layout"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Layout-Möglichkeiten zum Logo oben / unten"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =1470
                                    LayoutCachedWidth =20468
                                    LayoutCachedHeight =1810
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    DecimalPlaces =0
                                    ColumnCount =3
                                    ListRows =2
                                    ListWidth =4536
                                    Left =19688
                                    Top =1950
                                    Width =2040
                                    Height =255
                                    TabIndex =75
                                    Name ="inclMWST"
                                    ControlSource ="inclMWST"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="inclusive oder Excl. MWST (Standardwert = excl.)"
                                    Format ="Standard"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =1950
                                    LayoutCachedWidth =21728
                                    LayoutCachedHeight =2205
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =8223
                                    Left =20536
                                    Top =483
                                    Width =3555
                                    Height =255
                                    TabIndex =76
                                    BackColor =10092543
                                    Name ="comPrint"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835;5103"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="So wird der aktuelle Vorgang ausgedruckt resp. angezeigt\015\012Der eingestellte"
                                        " Wert wird gespeichert, sodass beim nächsten Start der \"alte\" Wert wieder für "
                                        "Sie eingestellt ist."

                                    LayoutCachedLeft =20536
                                    LayoutCachedTop =483
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =738
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    BorderWidth =2
                                    OverlapFlags =215
                                    TextAlign =2
                                    Left =7301
                                    Top =453
                                    Width =964
                                    Height =255
                                    FontWeight =700
                                    TabIndex =77
                                    Name ="NrVG"
                                    ControlSource ="NrVG"
                                    StatusBarText ="NrVG"
                                    FontName ="Arial"
                                    ControlTipText ="EINDEUTIGE ID des Vorganges\015\012Gibt es nur EINMAL in ALLEN Vorgängen"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =7301
                                    LayoutCachedTop =453
                                    LayoutCachedWidth =8265
                                    LayoutCachedHeight =708
                                    BackThemeColorIndex =1
                                    BackShade =95.0
                                    BorderThemeColorIndex =0
                                    ForeThemeColorIndex =0
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =9214
                                    Top =4626
                                    Width =1193
                                    Height =340
                                    TabIndex =78
                                    ForeColor =0
                                    Name ="btnPriority"
                                    Caption ="Priorität"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =9214
                                    LayoutCachedTop =4626
                                    LayoutCachedWidth =10407
                                    LayoutCachedHeight =4966
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =2552
                                    Left =10592
                                    Top =4648
                                    Width =2162
                                    Height =255
                                    FontWeight =700
                                    TabIndex =79
                                    Name ="Priority"
                                    ControlSource ="Priority"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Priorität auswählen"

                                    LayoutCachedLeft =10592
                                    LayoutCachedTop =4648
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =4903
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =9214
                                    Top =4966
                                    Width =1193
                                    Height =340
                                    TabIndex =80
                                    ForeColor =8388608
                                    Name ="btnVGAbschluss"
                                    Caption ="Abschluss"
                                    StatusBarText ="erledigt"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="erledigt ==>Wiedervorlage löschen"

                                    LayoutCachedLeft =9214
                                    LayoutCachedTop =4966
                                    LayoutCachedWidth =10407
                                    LayoutCachedHeight =5306
                                    Overlaps =1
                                End
                                Begin CheckBox
                                    OverlapFlags =215
                                    Left =10582
                                    Top =5055
                                    Width =800
                                    Height =255
                                    TabIndex =81
                                    Name ="VGAbschluss"
                                    ControlSource ="VGAbschluss"
                                    AfterUpdate ="[Event Procedure]"
                                    ControlTipText ="ankreuzen, wenn Vorgang abgeschlossen ist (Änderungen sind dann nicht mehr mögli"
                                        "ch!)"

                                    LayoutCachedLeft =10582
                                    LayoutCachedTop =5055
                                    LayoutCachedWidth =11382
                                    LayoutCachedHeight =5310
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =223
                                    Left =9214
                                    Top =5306
                                    Width =1193
                                    Height =340
                                    TabIndex =82
                                    ForeColor =0
                                    Name ="btnVGStatus"
                                    Caption ="Status"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =9214
                                    LayoutCachedTop =5306
                                    LayoutCachedWidth =10407
                                    LayoutCachedHeight =5646
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    ColumnCount =3
                                    ListRows =20
                                    ListWidth =8223
                                    Left =10592
                                    Top =5355
                                    Width =2162
                                    Height =255
                                    TabIndex =83
                                    Name ="VGStatus"
                                    ControlSource ="VGStatus"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3402;4536;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"in Arbeit\""
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    OnLostFocus ="[Event Procedure]"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Status des Vorganges"

                                    LayoutCachedLeft =10592
                                    LayoutCachedTop =5355
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =5610
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =9214
                                    Top =5646
                                    Width =3540
                                    Height =340
                                    TabIndex =84
                                    ForeColor =32768
                                    Name ="btnVGAbschluss1"
                                    Caption ="Vorgang abschliessen"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =9214
                                    LayoutCachedTop =5646
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =5986
                                    Overlaps =1
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    FELineBreak = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    Left =6048
                                    Top =4199
                                    Width =2835
                                    Height =1773
                                    TabIndex =85
                                    BackColor =13434879
                                    Name ="VGInfo"
                                    ControlSource ="VGInfo"
                                    FontName ="Arial"
                                    ControlTipText ="Interne Bemerkungen zum Vorgang, die aber nicht ausgedruckt werden.\015\012Begin"
                                        "nt der Text mit <copy>, werden diese Infos beim Kopieren übernommen.\015\012Nutz"
                                        "en Sie hierfür einfach den Button."
                                    ConditionalFormat = Begin
                                        0x0100000098000000010000000100000000000000000000001b00000001010000 ,
                                        0xffffff00ed1c2400000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x4c0065006600740028005b005600470069006e0066006f005d002c0037002900 ,
                                        0x3d002200480069006e007700650069007300220000000000
                                    End
                                    AsianLineBreak =0

                                    LayoutCachedLeft =6048
                                    LayoutCachedTop =4199
                                    LayoutCachedWidth =8883
                                    LayoutCachedHeight =5972
                                    ConditionalFormat14 = Begin
                                        0x010001000000010000000000000001010000ffffff00ed1c24001a0000004c00 ,
                                        0x65006600740028005b005600470069006e0066006f005d002c00370029003d00 ,
                                        0x2200480069006e00770065006900730022000000000000000000000000000000 ,
                                        0x00000000000000
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =11511
                                    Top =2475
                                    Width =1243
                                    Height =255
                                    TabIndex =86
                                    ForeColor =8421504
                                    Name ="telefon"
                                    ControlSource ="telefon"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Telefon-Nummer des Ansprechpartners \015\012Diese Nummer wird gewählt beim Doppe"
                                        "lclicken oder wenn das Telefon-Symbol gedrückt wird"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11511
                                    LayoutCachedTop =2475
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =2730
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    Visible = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =7371
                                    Left =20540
                                    Top =767
                                    Width =3551
                                    Height =255
                                    TabIndex =87
                                    BackColor =10092543
                                    Name ="OutlookVorlage"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;4536"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Liste der Outlook-Vorlagen\015\012Der Pfad ist in T_Filter festeglegt"

                                    LayoutCachedLeft =20540
                                    LayoutCachedTop =767
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =1022
                                End
                                Begin CommandButton
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =11545
                                    Top =2040
                                    Width =1209
                                    Height =340
                                    TabIndex =88
                                    ForeColor =10040115
                                    Name ="btnCheckVG"
                                    Caption ="CHECK!"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =11545
                                    LayoutCachedTop =2040
                                    LayoutCachedWidth =12754
                                    LayoutCachedHeight =2380
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =5955
                                    Left =8602
                                    Top =3825
                                    Width =281
                                    Height =345
                                    FontWeight =700
                                    TabIndex =89
                                    Name ="comVGInfo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Wählen Sie Einträge aus, um z.B. offene Vorgänge zu begründen"

                                    LayoutCachedLeft =8602
                                    LayoutCachedTop =3825
                                    LayoutCachedWidth =8883
                                    LayoutCachedHeight =4170
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =223
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =5103
                                    Left =19688
                                    Top =2921
                                    Width =1367
                                    Height =255
                                    TabIndex =90
                                    Name ="RabattArt1"
                                    ControlSource ="RabattArt1"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1424;3402"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="\"Rabatt %\""
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    OnNotInList ="[Event Procedure]"
                                    ControlTipText ="Rabatt-Art (über alles)"

                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =21055
                                    LayoutCachedHeight =3176
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =21004
                                    Top =2921
                                    Width =701
                                    Height =255
                                    TabIndex =91
                                    Name ="VGRabatt1"
                                    ControlSource ="VGRabatt1"
                                    Format ="Standard"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte ein \"0\" ein beim Rabatt"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Rabatt über alles"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21004
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =21705
                                    LayoutCachedHeight =3176
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =215
                                    TextAlign =3
                                    Left =21772
                                    Top =2921
                                    Width =1286
                                    Height =255
                                    FontWeight =700
                                    TabIndex =92
                                    Name ="Rabatt1"
                                    Format ="Standard"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Tragen Sie bitte ein \"0\" ein beim Rabatt-Wert"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Rabatt über alles (hier änderbar, %-Satz wird dann neu berechnet)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =21772
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =23058
                                    LayoutCachedHeight =3176
                                End
                                Begin TextBox
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =215
                                    TextAlign =1
                                    Left =23176
                                    Top =2921
                                    Width =915
                                    Height =255
                                    TabIndex =93
                                    BackColor =12632256
                                    Name ="VGWährungRabatt1"
                                    ControlSource ="VGWährung"
                                    FontName ="Arial"
                                    ControlTipText ="Währung"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =23176
                                    LayoutCachedTop =2921
                                    LayoutCachedWidth =24091
                                    LayoutCachedHeight =3176
                                End
                                Begin Line
                                    LineSlant = NotDefault
                                    BorderWidth =2
                                    OverlapFlags =87
                                    Left =19688
                                    Top =2559
                                    Width =4449
                                    Name ="Linie233"
                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =2559
                                    LayoutCachedWidth =24137
                                    LayoutCachedHeight =2559
                                End
                                Begin Line
                                    LineSlant = NotDefault
                                    BorderWidth =2
                                    OverlapFlags =87
                                    Left =19688
                                    Top =3893
                                    Width =4449
                                    Name ="Linie237"
                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =3893
                                    LayoutCachedWidth =24137
                                    LayoutCachedHeight =3893
                                End
                                Begin Line
                                    LineSlant = NotDefault
                                    BorderWidth =2
                                    OverlapFlags =87
                                    Left =19688
                                    Top =3813
                                    Width =4449
                                    Name ="Linie236"
                                    LayoutCachedLeft =19688
                                    LayoutCachedTop =3813
                                    LayoutCachedWidth =24137
                                    LayoutCachedHeight =3813
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =6054
                                    Top =3825
                                    Width =2490
                                    Height =345
                                    TabIndex =94
                                    ForeColor =10040115
                                    Name ="btnVGInfo"
                                    Caption ="Infos   (NICHT auf Ausdruck)"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Steuern des Kopierverhaltens:\015\012Interne Bemerkungen zum Vorgang, die aber n"
                                        "icht ausgedruckt werden.\015\012Beginnt der Text mit <copy>, werden diese Infos "
                                        "beim Kopieren übernommen.\015\012Nutzen Sie hierfür einfach den Button."

                                    LayoutCachedLeft =6054
                                    LayoutCachedTop =3825
                                    LayoutCachedWidth =8544
                                    LayoutCachedHeight =4170
                                    Overlaps =1
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5886
                            Top =420
                            Width =18360
                            Height =5595
                            Name ="PageBemerkung"
                            Caption ="Bemerkungen"
                            LayoutCachedLeft =5886
                            LayoutCachedTop =420
                            LayoutCachedWidth =24246
                            LayoutCachedHeight =6015
                            Begin
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    TextFontFamily =0
                                    Left =9161
                                    Top =435
                                    Width =11699
                                    Height =4320
                                    FontSize =11
                                    Name ="vgbem"
                                    ControlSource ="vgbem"
                                    FontName ="Aptos 11"
                                    ControlTipText ="Bemerkungen (editierbar, wenn Sie Teile des Textes markieren)\015\012Hier können"
                                        " Sie auch Ersetzungstexte (<xxx>) einbauen"
                                    TextFormat =1

                                    LayoutCachedLeft =9161
                                    LayoutCachedTop =435
                                    LayoutCachedWidth =20860
                                    LayoutCachedHeight =4755
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    ListRows =20
                                    ListWidth =11340
                                    Left =9167
                                    Top =5653
                                    Width =11654
                                    Height =255
                                    FontWeight =700
                                    TabIndex =1
                                    Name ="PS"
                                    ControlSource ="PS"
                                    RowSourceType ="Table/Query"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Text auf dem Seitenfuss in Fett!"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =5653
                                    LayoutCachedWidth =20821
                                    LayoutCachedHeight =5908
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =6237
                                    Left =20621
                                    Top =4845
                                    Width =219
                                    Height =255
                                    TabIndex =2
                                    Name ="comSchluss"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Schluss (Auswahlliste aus Lexikon, ggf. mit Ersetzungstexten xxx)\015\012Wird so"
                                        "fort gespeichert."

                                    LayoutCachedLeft =20621
                                    LayoutCachedTop =4845
                                    LayoutCachedWidth =20840
                                    LayoutCachedHeight =5100
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =5994
                                    Top =4851
                                    Width =3119
                                    Height =313
                                    TabIndex =3
                                    ForeColor =0
                                    Name ="btnSchluss"
                                    Caption ="Schluss"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =4851
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =5164
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    Visible = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =14175
                                    Left =6000
                                    Top =3465
                                    Width =221
                                    Height =255
                                    TabIndex =4
                                    BackColor =14680063
                                    Name ="comStText"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;4536;9072"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Text aus Lexikon auswählen"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =3465
                                    LayoutCachedWidth =6221
                                    LayoutCachedHeight =3720
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =7
                                    ListRows =30
                                    ListWidth =11340
                                    Left =6317
                                    Top =3465
                                    Width =227
                                    Height =255
                                    TabIndex =5
                                    Name ="comVGBem"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;851;567;1701;2268;851;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Bemerkungen aus den Vorgängen"

                                    LayoutCachedLeft =6317
                                    LayoutCachedTop =3465
                                    LayoutCachedWidth =6544
                                    LayoutCachedHeight =3720
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =255
                                    Left =6000
                                    Top =5295
                                    Width =3119
                                    Height =340
                                    TabIndex =6
                                    ForeColor =0
                                    Name ="btnPS"
                                    Caption ="PS"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Text nach Unterschrift öffnen"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =5295
                                    LayoutCachedWidth =9119
                                    LayoutCachedHeight =5635
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =6000
                                    Top =5635
                                    Width =3119
                                    Height =340
                                    TabIndex =7
                                    ForeColor =0
                                    Name ="btnGenerellesPS"
                                    Caption ="Generelles PS"
                                    StatusBarText ="Art"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Lexikon öffnen, generelles PS definieren / sperren oder freischalten!"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =5635
                                    LayoutCachedWidth =9119
                                    LayoutCachedHeight =5975
                                    Overlaps =1
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =5994
                                    Top =3771
                                    Width =3119
                                    Height =255
                                    TabIndex =8
                                    BackColor =12632256
                                    Name ="LastUpdate"
                                    ControlSource ="LastUpdate"
                                    Format ="General Date"
                                    StatusBarText ="geändert am .."
                                    FontName ="Arial"
                                    ControlTipText ="letzte Änderung am.."
                                    AsianLineBreak =0

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =3771
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =4026
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =5994
                                    Top =4026
                                    Width =3119
                                    Height =255
                                    TabIndex =9
                                    BackColor =12632256
                                    Name ="whoUpdate"
                                    ControlSource ="WhoUpdate"
                                    Format ="dd/mm/yy"
                                    DefaultValue ="Date()"
                                    FontName ="Arial"
                                    ControlTipText ="Update von .."
                                    AsianLineBreak =0

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =4026
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =4281
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =5994
                                    Top =4281
                                    Width =3119
                                    Height =255
                                    TabIndex =10
                                    BackColor =12632256
                                    Name ="VGErfasst"
                                    ControlSource ="VGErfasst"
                                    Format ="dd/mm/yy"
                                    DefaultValue ="Date()"
                                    FontName ="Arial"
                                    ControlTipText ="Erfasst am"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =4281
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =4536
                                End
                                Begin TextBox
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =5994
                                    Top =4536
                                    Width =3119
                                    Height =255
                                    TabIndex =11
                                    BackColor =12632256
                                    Name ="MarkerVG"
                                    ControlSource ="MarkerVG"
                                    FontName ="Arial"
                                    ControlTipText ="markiert von......"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =4536
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =4791
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5994
                                    Top =438
                                    Width =3119
                                    Height =2951
                                    FontWeight =700
                                    TabIndex =12
                                    BackColor =10092543
                                    Name ="lstActBemVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="39"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit der Bemerkung"

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =438
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =3389
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =9167
                                    Top =4845
                                    Width =11369
                                    Height =690
                                    TabIndex =13
                                    Name ="Schluss"
                                    ControlSource ="Schluss"
                                    FontName ="Arial"
                                    ControlTipText ="Schluss-Text\015\012Hier können Sie auch Ersetzungstexte (<xxx>) einbauen"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =4845
                                    LayoutCachedWidth =20536
                                    LayoutCachedHeight =5535
                                    BorderThemeColorIndex =0
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =6775
                                    Top =3458
                                    Width =1416
                                    Height =255
                                    TabIndex =14
                                    BackColor =10092543
                                    Name ="Kreditlimitdiff"
                                    ControlSource ="Kreditlimitdiff"
                                    FontName ="Arial"

                                    LayoutCachedLeft =6775
                                    LayoutCachedTop =3458
                                    LayoutCachedWidth =8191
                                    LayoutCachedHeight =3713
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =390
                            Width =18360
                            Height =5627
                            Name ="PageArtikelMain"
                            Tag ="79349"
                            Caption ="          Artikel"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =390
                            LayoutCachedWidth =24240
                            LayoutCachedHeight =6017
                            Begin
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =11887
                                    Top =736
                                    Width =1134
                                    Height =255
                                    Name ="AnzahlVG"
                                    Format ="#,##0.000"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Anzahl"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =11887
                                    LayoutCachedTop =736
                                    LayoutCachedWidth =13021
                                    LayoutCachedHeight =991
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =1
                                            Left =11263
                                            Top =736
                                            Width =585
                                            Height =255
                                            BackColor =12632256
                                            Name ="lblAnzahlVG"
                                            Caption ="Anzahl"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =11263
                                            LayoutCachedTop =736
                                            LayoutCachedWidth =11848
                                            LayoutCachedHeight =991
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =6000
                                    Top =396
                                    Width =1887
                                    Height =321
                                    FontWeight =700
                                    TabIndex =1
                                    ForeColor =0
                                    Name ="btnArtikelAdd"
                                    Caption ="Artikel hinzufügen"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Artikel ergänzen (Popup-Menu wird geöffnet"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =396
                                    LayoutCachedWidth =7887
                                    LayoutCachedHeight =717
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =18412
                                    Top =390
                                    Width =1418
                                    Height =516
                                    FontWeight =700
                                    TabIndex =2
                                    ForeColor =5026082
                                    Name ="btnVGDetSave"
                                    Caption ="Speichern"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Speichern Pos. 1"
                                    ImageData = Begin
                                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000b09880ff201010ff201010ff201010ff201010ff201010ff ,
                                        0x201010ff201010ff201810ff201810ff201810ff201810ff201810ff00000000 ,
                                        0x0000000000000000c0a090fffff8f0fffff8f0fffff0f0fffff0e0fff0e8e0ff ,
                                        0xf0e8d0fff0e0d0fff0e0d0fff0e0d0fff0e0d0fff0e0d0ff403830ff00000000 ,
                                        0x0000000000000000c0a090ffffffffffd07850ffd07840ffd07040ffc07040ff ,
                                        0xc07040ffc07850ffd09070ffd0a890ffd0a890fff0f0f0ff909090ff00000000 ,
                                        0x0000000000000000c0a890ffffffffffd07850fff0b8a0fff0b090fff0a880ff ,
                                        0xf0a880fff0b090ffe0b0a0ff804040ff703840ff703840ff703840ff703840ff ,
                                        0x703840ff703840ffc0a890ffffffffffd07850ffd07850ffd07840ffd07040ff ,
                                        0xd08050ffe0a890ffa05850ffc07870ff604840ffd0d8d0ffd0d8d0ff605040ff ,
                                        0xc06060ff703840ffc0a8a0fffffffffffffffffffffffffffffffffffff8f0ff ,
                                        0xfff8f0fffff8f0ffb06060ffe09090ff605040ff605040ff605040ff605040ff ,
                                        0xc07070ff703840ffc0a8a0ffc0a8a0ffc0a890ffc0a090ffc0a090ffc0a090ff ,
                                        0xc0a8a0ffe0d0c0ffc07070fff0a8b0ffe0a0a0ffe098a0ffe09090ffe08890ff ,
                                        0xd08080ff703840ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000d08080ffd07070ffd06860ffd06860ffc05850ffc05850ff ,
                                        0xb05040ff804040ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000d08890ffe07070ffffffffffffffffffffffffffffffffff ,
                                        0xc05850ff904850ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000d09090ffe07070ffffffffffffffffffffffffffffffffff ,
                                        0xd06860ffa05860ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000e0a0a0ffd09090ffd08890ffd08080ffc07070ffc06870ff ,
                                        0xc06870ffc06860ff000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000
                                    End

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =390
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =906
                                    PictureCaptionArrangement =5
                                    HoverForeColor =5026082
                                    PressedForeColor =5026082
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =7987
                                    Top =396
                                    Width =848
                                    Height =321
                                    FontWeight =700
                                    TabIndex =3
                                    ForeColor =0
                                    Name ="btnArtikelCopy"
                                    Caption ="kopieren"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="aktuell markierten Artikel kopieren (wenn keiner vorhanden Artikel hinzufügen)"

                                    LayoutCachedLeft =7987
                                    LayoutCachedTop =396
                                    LayoutCachedWidth =8835
                                    LayoutCachedHeight =717
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =9167
                                    Top =390
                                    Width =1134
                                    Height =321
                                    FontWeight =700
                                    TabIndex =4
                                    ForeColor =0
                                    Name ="btnEinleitungDet"
                                    Caption ="Einleitung"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="öffne Lexikon"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =390
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =711
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =3969
                                    Left =10443
                                    Top =390
                                    Width =6522
                                    Height =255
                                    FontWeight =700
                                    TabIndex =5
                                    Name ="EinleitungDet"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3969"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Einleitungstext (Auswahlliste aus Lexikon, Gruppe muss heissen: Einleitungstext "
                                        "Artikel)"

                                    LayoutCachedLeft =10443
                                    LayoutCachedTop =390
                                    LayoutCachedWidth =16965
                                    LayoutCachedHeight =645
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    BackStyle =0
                                    Left =17051
                                    Top =390
                                    Width =1281
                                    Height =255
                                    TabIndex =6
                                    Name ="Starttermin"
                                    Format ="Short Date"
                                    StatusBarText ="Starttermin"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Starttermin"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =17051
                                    LayoutCachedTop =390
                                    LayoutCachedWidth =18332
                                    LayoutCachedHeight =645
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    BackStyle =0
                                    Left =17051
                                    Top =674
                                    Width =1281
                                    Height =255
                                    TabIndex =7
                                    Name ="Endtermin"
                                    Format ="Short Date"
                                    StatusBarText ="Endtermin"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Endtermin"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =17051
                                    LayoutCachedTop =674
                                    LayoutCachedWidth =18332
                                    LayoutCachedHeight =929
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    ColumnCount =2
                                    Left =6000
                                    Top =801
                                    Width =2835
                                    Height =5103
                                    TabIndex =8
                                    BackColor =10092543
                                    Name ="lstArtikelAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Wählen sie die gewünschte Artikel-Aktion aus"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =801
                                    LayoutCachedWidth =8835
                                    LayoutCachedHeight =5904
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =2
                                    ListRows =30
                                    Left =9167
                                    Top =736
                                    Width =636
                                    Height =255
                                    TabIndex =9
                                    Name ="TitelNr"
                                    RowSourceType ="Table/Query"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Titel-Nr."
                                    Format ="00"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =736
                                    LayoutCachedWidth =9803
                                    LayoutCachedHeight =991
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =2
                                    ListRows =30
                                    Left =10442
                                    Top =736
                                    Width =636
                                    Height =255
                                    TabIndex =10
                                    Name ="Position"
                                    RowSourceType ="Table/Query"
                                    ValidationText ="Um eine 0 einzutragen, bitte  \"Titel hinzufügen\" benutzen"
                                    DefaultValue ="1"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Position"

                                    LayoutCachedLeft =10442
                                    LayoutCachedTop =736
                                    LayoutCachedWidth =11078
                                    LayoutCachedHeight =991
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =9938
                                            Top =729
                                            Width =390
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld223"
                                            Caption ="Pos."
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =9938
                                            LayoutCachedTop =729
                                            LayoutCachedWidth =10328
                                            LayoutCachedHeight =984
                                        End
                                    End
                                End
                                Begin CustomControl
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    SizeMode =1
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    Left =13081
                                    Top =729
                                    Width =264
                                    Height =309
                                    AutoActivate =1
                                    TabIndex =11
                                    Name ="SpinButtonAnzahlVG"
                                    OleData = Begin
                                        0x00160000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                                        0xfeff090006000000000000000000000001000000000000000000000000100000 ,
                                        0x0700000001000000feffffff0000000001000000ffffffffffffffffffffffff ,
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
                                        0x006d277600000000000000000000000060ff37819f08d4010900000080010000 ,
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
                                        0x006d27760000000000000000000000005053da83eaedd3010600000080010000 ,
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
                                        0x0010000000021400880800006400000000000000d1010000210200006d732e53 ,
                                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                                        0x0000000001000002000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000fefffffffeffffff03000000fefffffffefffffffeffffffffffffff ,
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
                                        0x0010000000021400880800006300000000000000d1010000210200006d732e53 ,
                                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                                        0x0000000001000002000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000
                                    End
                                    Tag ="VGDET"
                                    OLEClass ="Microsoft Forms 2.0"
                                    Class ="Forms.SpinButton.1"

                                    LayoutCachedLeft =13081
                                    LayoutCachedTop =729
                                    LayoutCachedWidth =13345
                                    LayoutCachedHeight =1038
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =13502
                                    Top =736
                                    Width =711
                                    Height =321
                                    TabIndex =12
                                    ForeColor =0
                                    Name ="btnLiefereinheit"
                                    Caption ="Einheit"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Lexikon öffnen"

                                    LayoutCachedLeft =13502
                                    LayoutCachedTop =736
                                    LayoutCachedWidth =14213
                                    LayoutCachedHeight =1057
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =2
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =3686
                                    Left =14263
                                    Top =736
                                    Width =1404
                                    Height =255
                                    TabIndex =13
                                    Name ="LiefereinheitVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134;2268"
                                    BeforeUpdate ="[Event Procedure]"
                                    DefaultValue ="\"Stk.\""
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Liefereinheit"

                                    LayoutCachedLeft =14263
                                    LayoutCachedTop =736
                                    LayoutCachedWidth =15667
                                    LayoutCachedHeight =991
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    FELineBreak = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =10442
                                    Top =1077
                                    Width =6237
                                    Height =600
                                    TabIndex =14
                                    Name ="ArtikelText"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Artikel-Text (frei wählbar)\015\012Mit Doppelclick Lexikon öffnen, um Vorgaben f"
                                        "ür dieses Feld festzulegen"
                                    ConditionalFormat = Begin
                                        0x01000000d6000000010000000100000000000000000000003a00000001000000 ,
                                        0x00000000ed1c2400000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x4c0065006600740028005b0041007200740069006b0065006c00740065007800 ,
                                        0x74005d002c003300320029003d00270041005200540049004b0045004c002000 ,
                                        0x49005300540020004e00490043004800540020004d0045004800520020005600 ,
                                        0x450052004600dc004700420041005200270000000000
                                    End
                                    AsianLineBreak =0

                                    LayoutCachedLeft =10442
                                    LayoutCachedTop =1077
                                    LayoutCachedWidth =16679
                                    LayoutCachedHeight =1677
                                    ConditionalFormat14 = Begin
                                        0x01000100000001000000000000000100000000000000ed1c2400390000004c00 ,
                                        0x65006600740028005b0041007200740069006b0065006c007400650078007400 ,
                                        0x5d002c003300320029003d00270041005200540049004b0045004c0020004900 ,
                                        0x5300540020004e00490043004800540020004d00450048005200200056004500 ,
                                        0x52004600dc004700420041005200270000000000000000000000000000000000 ,
                                        0x0000000000
                                    End
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =1
                                            Left =9167
                                            Top =1077
                                            Width =1134
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld224"
                                            Caption ="Artikel"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =9167
                                            LayoutCachedTop =1077
                                            LayoutCachedWidth =10301
                                            LayoutCachedHeight =1332
                                        End
                                    End
                                End
                                Begin ComboBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =3969
                                    Left =16693
                                    Top =1287
                                    Width =264
                                    Height =255
                                    FontWeight =700
                                    TabIndex =15
                                    Name ="comTitel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="3969"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Titel (aus Lexikon auswählen, Gruppe muss heissen: Titel Vorgangsdetails)"

                                    LayoutCachedLeft =16693
                                    LayoutCachedTop =1287
                                    LayoutCachedWidth =16957
                                    LayoutCachedHeight =1542
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =1
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =18412
                                    Top =1343
                                    Width =1418
                                    Height =255
                                    TabIndex =16
                                    Name ="RabattVG"
                                    Format ="Standard"
                                    BeforeUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    OnGotFocus ="[Event Procedure]"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Rabatt"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =1343
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =1598
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =18412
                                    Top =1665
                                    Width =1418
                                    Height =255
                                    TabIndex =17
                                    Name ="EinzelpreisVG"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Einzelpreis"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =1665
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =1920
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =17049
                                            Top =1665
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="lblPreis"
                                            Caption ="Preis"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            LayoutCachedLeft =17049
                                            LayoutCachedTop =1665
                                            LayoutCachedWidth =18330
                                            LayoutCachedHeight =1920
                                        End
                                    End
                                End
                                Begin TextBox
                                    AutoTab = NotDefault
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =18412
                                    Top =2490
                                    Width =1418
                                    Height =255
                                    TabIndex =18
                                    ForeColor =255
                                    Name ="MWSTDet"
                                    Format ="Standard"
                                    StatusBarText ="Rabatt"
                                    BeforeUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="abweichende MWSt\015\012mit Doppleklick umschalten"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =2490
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =2745
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =17049
                                            Top =2490
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld235"
                                            Caption ="andere MWSt "
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            LayoutCachedLeft =17049
                                            LayoutCachedTop =2490
                                            LayoutCachedWidth =18330
                                            LayoutCachedHeight =2745
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =9167
                                    Top =1756
                                    Width =1134
                                    Height =561
                                    TabIndex =19
                                    ForeColor =0
                                    Name ="btnZoom"
                                    Caption ="Zoome Bemerkungen"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="zoome Bemerkungsfeld"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =1756
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =2317
                                    Overlaps =1
                                End
                                Begin TextBox
                                    CanGrow = NotDefault
                                    AutoTab = NotDefault
                                    TabStop = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    FELineBreak = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =10441
                                    Top =1764
                                    Width =6237
                                    Height =1134
                                    FontSize =11
                                    TabIndex =20
                                    Name ="BemVGDet"
                                    FontName ="Aptos"
                                    OnChange ="[Event Procedure]"
                                    ControlTipText ="Bemerkung zum Artikel\015\012Text kann editiert werden!"
                                    AsianLineBreak =0
                                    TextFormat =1

                                    LayoutCachedLeft =10441
                                    LayoutCachedTop =1764
                                    LayoutCachedWidth =16678
                                    LayoutCachedHeight =2898
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =1473
                                    Height =255
                                    TabIndex =21
                                    BackColor =12632256
                                    ForeColor =8421504
                                    Name ="NrArtikel"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="ID des Artikels"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =1473
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =1728
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =963
                                    Height =255
                                    FontWeight =700
                                    TabIndex =22
                                    BackColor =12632256
                                    ForeColor =8421504
                                    Name ="NrVGDet"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="ID NrVGDet"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =963
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =1218
                                    Begin
                                        Begin Label
                                            OverlapFlags =255
                                            TextAlign =1
                                            Left =22148
                                            Top =963
                                            Width =225
                                            Height =255
                                            FontWeight =700
                                            BackColor =12632256
                                            Name ="lblNrVGDet"
                                            Caption ="ID"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =22148
                                            LayoutCachedTop =963
                                            LayoutCachedWidth =22373
                                            LayoutCachedHeight =1218
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =1728
                                    Height =255
                                    TabIndex =23
                                    BackColor =12632256
                                    ForeColor =8421504
                                    Name ="NrVGDetBoss"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="ID NrVGdetBoss"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =1728
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =1983
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =1983
                                    Height =255
                                    TabIndex =24
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="LastUpdateDet"
                                    Format ="General Date"
                                    StatusBarText ="geändert am .."
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="letzte Änderung am.."
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =1983
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =2238
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =2238
                                    Height =255
                                    TabIndex =25
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="WhoUpdateDet"
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="Update von .."
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =2238
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =2493
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =2493
                                    Height =255
                                    TabIndex =26
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="VGdetErfasst"
                                    Format ="dd/mm/yy"
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="Erfasst am"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =2493
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =2748
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    DecimalPlaces =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    Left =10433
                                    Top =3009
                                    Width =6237
                                    Height =255
                                    TabIndex =27
                                    Name ="VGDetTxt1"
                                    Format ="Standard"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Anlage-Nr."
                                    AsianLineBreak =0

                                    LayoutCachedLeft =10433
                                    LayoutCachedTop =3009
                                    LayoutCachedWidth =16670
                                    LayoutCachedHeight =3264
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =9167
                                            Top =3009
                                            Width =1134
                                            Height =255
                                            BackColor =12632256
                                            Name ="DetTxt1"
                                            Caption ="Anlage-Nr."
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =9167
                                            LayoutCachedTop =3009
                                            LayoutCachedWidth =10301
                                            LayoutCachedHeight =3264
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =9167
                                    Top =3322
                                    Width =1134
                                    Height =321
                                    TabIndex =28
                                    ForeColor =0
                                    Name ="btnWarengruppe"
                                    Caption ="Warengruppe"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="zeige Warengruppe-Formular"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =3322
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =3643
                                    Overlaps =1
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =2268
                                    Left =10428
                                    Top =3408
                                    Width =6237
                                    Height =255
                                    TabIndex =29
                                    Name ="WarengruppeDet"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="2268"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Warengruppe auswählen aus Liste"

                                    LayoutCachedLeft =10428
                                    LayoutCachedTop =3408
                                    LayoutCachedWidth =16665
                                    LayoutCachedHeight =3663
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =1134
                                    Left =10433
                                    Top =3759
                                    Width =2268
                                    Height =255
                                    TabIndex =30
                                    Name ="Sollkonto"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Soll-Konto (Liste aus Warengruppen)"

                                    LayoutCachedLeft =10433
                                    LayoutCachedTop =3759
                                    LayoutCachedWidth =12701
                                    LayoutCachedHeight =4014
                                End
                                Begin ComboBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ListRows =30
                                    ListWidth =1134
                                    Left =10433
                                    Top =4059
                                    Width =2268
                                    Height =255
                                    TabIndex =31
                                    Name ="Habenkonto"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Haben-Konto (Liste aus Warengruppen)"

                                    LayoutCachedLeft =10433
                                    LayoutCachedTop =4059
                                    LayoutCachedWidth =12701
                                    LayoutCachedHeight =4314
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =255
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =2748
                                    Height =255
                                    TabIndex =32
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="VGDetlng1"
                                    DefaultValue ="Date()"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="Erfasst am"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =2748
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =3003
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    EnterKeyBehavior = NotDefault
                                    FELineBreak = NotDefault
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    Left =12769
                                    Top =3732
                                    Width =3918
                                    Height =516
                                    TabIndex =33
                                    BackColor =15132390
                                    BorderColor =65535
                                    Name ="VGDetInfo"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="interne Bemerkungen zu dieser Position\015\012\015\012(werden NICHT ausgedruckt)"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =12769
                                    LayoutCachedTop =3732
                                    LayoutCachedWidth =16687
                                    LayoutCachedHeight =4248
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =2553
                                    Left =18412
                                    Top =2842
                                    Width =2268
                                    Height =255
                                    TabIndex =34
                                    ConditionalFormat = Begin
                                        0x0100000066000000010000000000000002000000000000000200000001000000 ,
                                        0x00000000ed1c2400000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x310000000000
                                    End
                                    Name ="VGDetPreis"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="soll der Preis auf dem Ausdruck angezeigt werden?\015\012Standardwert : Preis an"
                                        "zeigen\015\012Wenn \"Nicht anzeigen\" ausgewählt wird, wechselt die Hintergrundf"
                                        "arbe auf ROT!\015\012Der gewählte Text wird in die Bemerkungen übernommen.\015\012"
                                        "Mit Doppelclick das Lexikon öffnen"

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =2842
                                    LayoutCachedWidth =20680
                                    LayoutCachedHeight =3097
                                    ConditionalFormat14 = Begin
                                        0x01000100000000000000020000000100000000000000ed1c2400010000003100 ,
                                        0x000000000000000000000000000000000000000000
                                    End
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =17049
                                            Top =2842
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld62"
                                            Caption ="Preis anzeigen"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =17049
                                            LayoutCachedTop =2842
                                            LayoutCachedWidth =18330
                                            LayoutCachedHeight =3097
                                        End
                                    End
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =2268
                                    Left =18412
                                    Top =3148
                                    Width =2268
                                    Height =255
                                    TabIndex =35
                                    BackColor =13828095
                                    ConditionalFormat = Begin
                                        0x0100000066000000010000000000000003000000000000000200000001000000 ,
                                        0xffffff00c0504d00000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x300000000000
                                    End
                                    Name ="MoveRecord"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    OnChange ="[Event Procedure]"
                                    Tag ="VGDET"
                                    ControlTipText ="Auf dem Ausdruck eine oder mehrere leere Linien oder einen ganzen Seitenumbruch "
                                        "erzeugen\015\012Wenn kein Standard==>Feld erscheint dunkelrot mit weisser Schrif"
                                        "t\015\012Doppelklick entfernt den Eintrag"

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =3148
                                    LayoutCachedWidth =20680
                                    LayoutCachedHeight =3403
                                    ConditionalFormat14 = Begin
                                        0x010001000000000000000300000001000000ffffff00c0504d00010000003000 ,
                                        0x000000000000000000000000000000000000000000
                                    End
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =17049
                                            Top =3148
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld63"
                                            Caption ="Layout"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            ControlTipText ="ID"
                                            LayoutCachedLeft =17049
                                            LayoutCachedTop =3148
                                            LayoutCachedWidth =18330
                                            LayoutCachedHeight =3403
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =1218
                                    Height =255
                                    TabIndex =36
                                    BackColor =12632256
                                    ForeColor =8421504
                                    Name ="IdVG"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="ID des Vorgangs"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =1218
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =1473
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =13
                                    Left =9167
                                    Top =4361
                                    Width =15066
                                    Height =1582
                                    TabIndex =37
                                    BackColor =15066597
                                    Name ="lstArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;567;851;567;3402;2268;1134;1134;567;567;567;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der dem Vorgang zugeordneten Artikel\015\012Klick zeigt oben diesen Artike"
                                        "l an\015\012Doppel-Klick öffnet den Artikel im Artikel-Formular"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =4361
                                    LayoutCachedWidth =24233
                                    LayoutCachedHeight =5943
                                End
                                Begin CommandButton
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =9167
                                    Top =2545
                                    Width =1134
                                    Height =340
                                    TabIndex =38
                                    ForeColor =10040115
                                    Name ="btnCheckVGArtikel"
                                    Caption ="CHECK!"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =2545
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =2885
                                    Overlaps =1
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =9167
                                    Top =4059
                                    Width =1134
                                    Height =255
                                    BackColor =12632256
                                    Name ="lblHabenkonto"
                                    Caption ="Habenkonto"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =4059
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =4314
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =3
                                    Left =9167
                                    Top =3759
                                    Width =1134
                                    Height =255
                                    BackColor =12632256
                                    Name ="lbloSollkonto"
                                    Caption ="Sollkonto"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="ID"
                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =3759
                                    LayoutCachedWidth =10301
                                    LayoutCachedHeight =4014
                                End
                                Begin CommandButton
                                    Enabled = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =18412
                                    Top =939
                                    Width =1418
                                    Height =321
                                    FontWeight =700
                                    TabIndex =39
                                    ForeColor =2366701
                                    Name ="btnVGDetEscape"
                                    Caption ="Abbrechen"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Rückgängig machen der Artikel-Zuordnung-Änderung"
                                    ImageData = Begin
                                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000f0906060d0784080b0583010000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000e0785040f08850ffd07040ffa05830500000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000f0906020d0704060f08050ffd07050f0a050300000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000000000000000000000000000c06840d0f08850ffc078508000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0xf0c0b01000000000000000000000000090482040e07840ffe08860ffe0a08000 ,
                                        0x00000000000000000000000000000000d07040ffd07040ffc06840ffb06030ff ,
                                        0xb05830ff905030ff0000000000000000b0603020c06840ffe08050ffd0886080 ,
                                        0x00000000000000000000000000000000d07850ffe07030fff08050fff09870ff ,
                                        0xe09060fff0a08040000000000000000080402000c06840ffe07840f0e09870c0 ,
                                        0x00000000000000000000000000000000d08050ffe08050fff09060fff0a070ff ,
                                        0x904830b0b0603040000000000000000080402000c06840ffd07040f0e09870d0 ,
                                        0x00000000000000000000000000000000d08860ffe09060fff09870fff08850f0 ,
                                        0xb06040ffb06040ffb060307000000000b0805020a05830f0d07840f0e09070d0 ,
                                        0x000000000000000000000000e0b09010c08060ffd09870e0d0886090d09070ff ,
                                        0xd08050ffc07040ffc06840ffb06030c0b07040e0a06040ffe08050ffd0a080e0 ,
                                        0x00000000000000000000000000000000c08860ffd0a0804000000000d08860c0 ,
                                        0xd08860ffd08050f0c06840ffb06840ffb06030f0e07840f0e0a080f0d09880e0 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0xf0a880c0e09880ffe09870f0e09070f0e09070e0e0a080f0e0a890f0f0b8a020 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000f0b89060f0b090c0f0b8a0e0f0c0a0c0f0c0a090f0c0b02000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000
                                    End

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =939
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =1260
                                    PictureCaptionArrangement =5
                                    HoverForeColor =5026082
                                    PressedForeColor =5026082
                                    Overlaps =1
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =17051
                                    Top =1303
                                    Width =1281
                                    Height =321
                                    TabIndex =40
                                    ForeColor =0
                                    Name ="btnRabattVG"
                                    Caption ="% Rabatt"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDET"
                                    ControlTipText ="Rabatt-Check: Sind Rabatte hinterlegt, wenn ja zuordnen!"

                                    LayoutCachedLeft =17051
                                    LayoutCachedTop =1303
                                    LayoutCachedWidth =18332
                                    LayoutCachedHeight =1624
                                    Overlaps =1
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    Visible = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    ColumnCount =5
                                    Left =6000
                                    Top =3988
                                    Width =2835
                                    Height =2029
                                    TabIndex =41
                                    BackColor =10092543
                                    Name ="lstArtikelVorgemerkt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;0;2835;0"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der vorgemerkten Artikel; Klicken zum Ausführen"

                                    LayoutCachedLeft =6000
                                    LayoutCachedTop =3988
                                    LayoutCachedWidth =8835
                                    LayoutCachedHeight =6017
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    FELineBreak = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    BackStyle =0
                                    Left =22373
                                    Top =3003
                                    Height =255
                                    TabIndex =42
                                    BackColor =8421504
                                    ForeColor =9868950
                                    Name ="Markervgdet"
                                    FontName ="Arial Narrow"
                                    Tag ="VGDET"
                                    ControlTipText ="Marker in Vorgangsdetail"
                                    AsianLineBreak =0

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =3003
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =3258
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =20
                                    ListWidth =1134
                                    Left =18412
                                    Top =2017
                                    Width =1418
                                    Height =255
                                    TabIndex =43
                                    Name ="VGWährungA"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    Tag ="VGDet"
                                    ControlTipText ="Währung"

                                    LayoutCachedLeft =18412
                                    LayoutCachedTop =2017
                                    LayoutCachedWidth =19830
                                    LayoutCachedHeight =2272
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            TextAlign =3
                                            Left =17049
                                            Top =2017
                                            Width =1281
                                            Height =255
                                            BackColor =12632256
                                            Name ="Bezeichnungsfeld76"
                                            Caption ="Währung"
                                            FontName ="Arial"
                                            Tag ="VGDET"
                                            LayoutCachedLeft =17049
                                            LayoutCachedTop =2017
                                            LayoutCachedWidth =18330
                                            LayoutCachedHeight =2272
                                        End
                                    End
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =22373
                                    Top =396
                                    Height =516
                                    FontWeight =700
                                    TabIndex =44
                                    ForeColor =5026082
                                    Name ="btnRefresh"
                                    Caption ="aktualisieren"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dd0000ddd7227ddddd0ffd2d727727dd0f0ffd2727dd727d ,
                                        0x0f0ffd227dddd72d0f0ffd2222dddddd0f0ffdddddd2222d0f0ffd27dddd722d ,
                                        0x0f0ffd727dd7272d0f0fffd727727d2d0f0ffffd7227dddd0f0fffffd0000ddd ,
                                        0x0f0ffffff0f08ddd0f0ffffff008dddd0f000000008ddddd0fffffffdddddddd ,
                                        0x00000000dddddddd000000000000000000000000000000000000000000000000 ,
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
                                    Tag ="VGDET"
                                    ControlTipText ="Refresh der Anzeige (ggf. nach löschen oder editieren drücken)"

                                    LayoutCachedLeft =22373
                                    LayoutCachedTop =396
                                    LayoutCachedWidth =24074
                                    LayoutCachedHeight =912
                                    PictureCaptionArrangement =5
                                    HoverForeColor =5026082
                                    PressedForeColor =5026082
                                End
                            End
                        End
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =8
                    Left =45
                    Top =6522
                    Width =5643
                    Height =5288
                    TabIndex =1
                    BackColor =16773098
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;737;340;0;0;3742;0"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    OnKeyUp ="[Event Procedure]"
                    Tag ="54900"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (30) Daten für VG\015\012Verwenden Sie die Pfeiltasten, um"
                        " zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =45
                    LayoutCachedTop =6522
                    LayoutCachedWidth =5688
                    LayoutCachedHeight =11810
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =2103
                    Top =1305
                    Width =3585
                    Height =4492
                    TabIndex =2
                    BackColor =13172735
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =2103
                    LayoutCachedTop =1305
                    LayoutCachedWidth =5688
                    LayoutCachedHeight =5797
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2092
                    Top =6165
                    Width =3302
                    Height =270
                    FontWeight =600
                    TabIndex =3
                    BackColor =-2147483633
                    BorderColor =128
                    ForeColor =128
                    Name ="txtFind"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="A: Sucht in Adressen\015\012N: Projekt-Nummern\015\012V: Vorgängen\015\012S: Sti"
                        "chworte\015\012D0: Vorgangs -Datum\015\012D1: Datum 1\015\012D2: Datum 2\015\012"
                        "FA: Firmenname\015\0121, 2 Buchstaben==> suche nach Anfang des Firmennamens\015\012"
                        "*:Wildcard Datum, Projekt-Nr.,Firma, Person, Titel, Anschrift etc."

                    LayoutCachedLeft =2092
                    LayoutCachedTop =6165
                    LayoutCachedWidth =5394
                    LayoutCachedHeight =6435
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =45
                    Top =1305
                    Width =1985
                    Height =2268
                    TabIndex =4
                    BackColor =-2147483633
                    Name ="lstAktiv"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="2"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Auswahl der Vorgänge nach Status"

                    LayoutCachedLeft =45
                    LayoutCachedTop =1305
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =3573
                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =444
                    Top =6165
                    Width =1209
                    Height =270
                    FontWeight =600
                    TabIndex =5
                    BackColor =12910525
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Anzahl der gefundenen Datensätze (Doppelclick zeigt Übersichtstabelle)"

                    LayoutCachedLeft =444
                    LayoutCachedTop =6165
                    LayoutCachedWidth =1653
                    LayoutCachedHeight =6435
                End
                Begin Tab
                    OverlapFlags =85
                    Left =5745
                    Top =6210
                    Width =18585
                    Height =5610
                    TabIndex =6
                    Name ="regd"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5745
                    LayoutCachedTop =6210
                    LayoutCachedWidth =24330
                    LayoutCachedHeight =11820
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pageProjekt"
                            ControlTipText ="Projekt-Übersicht"
                            Caption ="Übersicht"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =12286
                                    Top =7151
                                    Width =11909
                                    Height =4529
                                    BackColor =15066597
                                    Name ="lstVG"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;851;567;851;2835;2268;1418;1418;567"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Vorgänge pro Unternummer 53045.002\015\012 sortiert nach NRVG DESC\015"
                                        "\012Klick zeigt oben der Vorgang an"

                                    LayoutCachedLeft =12286
                                    LayoutCachedTop =7151
                                    LayoutCachedWidth =24195
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =9167
                                    Top =6660
                                    Width =2835
                                    Height =5020
                                    TabIndex =1
                                    BackColor =15066597
                                    Name ="lstVGID"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;1134;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Projekt-Nummern\015\012Klick zeigt rechts alle Vorgänge an und oben de"
                                        "n zuletzt erstellten Vorgang"

                                    LayoutCachedLeft =9167
                                    LayoutCachedTop =6660
                                    LayoutCachedWidth =12002
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    Left =5994
                                    Top =6660
                                    Width =3119
                                    Height =5020
                                    FontWeight =700
                                    TabIndex =2
                                    BackColor =10092543
                                    Name ="lstVGIDAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="400"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen und Übersichten mit den Vorgängen des aktuell angewählten Projektes\015"
                                        "\012Einfach-Click zeigt rechts die entesprechende Liste oder führt die Aktion au"
                                        "s.\015\012Doppel-Click öffnet entsprechende EXCEL-Liste."

                                    LayoutCachedLeft =5994
                                    LayoutCachedTop =6660
                                    LayoutCachedWidth =9113
                                    LayoutCachedHeight =11680
                                End
                                Begin OptionGroup
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    OverlapFlags =215
                                    Left =12282
                                    Top =6746
                                    Width =11882
                                    Height =325
                                    TabIndex =3
                                    Name ="oglstVG"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"

                                    LayoutCachedLeft =12282
                                    LayoutCachedTop =6746
                                    LayoutCachedWidth =24164
                                    LayoutCachedHeight =7071
                                    Begin
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =12325
                                            Top =6774
                                            OptionValue =1
                                            Name ="oglstVG_1"

                                            LayoutCachedLeft =12325
                                            LayoutCachedTop =6774
                                            LayoutCachedWidth =12585
                                            LayoutCachedHeight =7014
                                            Begin
                                                Begin Label
                                                    OverlapFlags =247
                                                    Left =12555
                                                    Top =6746
                                                    Width =5040
                                                    Height =240
                                                    Name ="txtoglstVG_1"
                                                    Caption ="Liste der Vorgangsarten innerhalb des ausgewählten Unter-Projektes"
                                                    LayoutCachedLeft =12555
                                                    LayoutCachedTop =6746
                                                    LayoutCachedWidth =17595
                                                    LayoutCachedHeight =6986
                                                End
                                            End
                                        End
                                        Begin CheckBox
                                            OverlapFlags =215
                                            Left =17768
                                            Top =6774
                                            OptionValue =2
                                            Name ="oglstVG_2"

                                            LayoutCachedLeft =17768
                                            LayoutCachedTop =6774
                                            LayoutCachedWidth =18028
                                            LayoutCachedHeight =7014
                                            Begin
                                                Begin Label
                                                    OverlapFlags =247
                                                    Left =17998
                                                    Top =6746
                                                    Width =5385
                                                    Height =240
                                                    Name ="txtoglstVG_2"
                                                    Caption ="Vergleich der Artikel über alle Vorgänge im ausgewählten Unter-Projekt"
                                                    LayoutCachedLeft =17998
                                                    LayoutCachedTop =6746
                                                    LayoutCachedWidth =23383
                                                    LayoutCachedHeight =6986
                                                End
                                            End
                                        End
                                    End
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgFilter"
                            Caption ="gefiltert"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pageFirma"
                            ControlTipText ="Vorgänge der aktuell angezeigten Firma"
                            Caption ="pro Firma"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =9168
                                    Top =6767
                                    Width =14742
                                    Height =4913
                                    BackColor =15066597
                                    Name ="lstFirma"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;851;567;851;1134;3402;3969;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der markierten Vorgänge"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =7127
                                    Width =2835
                                    Height =4553
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstFirmaAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen mit den Vorgängen der Firma"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7127
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin TextBox
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =6049
                                    Top =6767
                                    Width =2835
                                    Height =255
                                    FontWeight =600
                                    TabIndex =2
                                    BackColor =12975858
                                    BorderColor =128
                                    ForeColor =128
                                    Name ="txtFindFa"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Liste der Vorgänge mit der aktuellen Fa eingrenzen durch Filtern:\015\012z.B. Al"
                                        "le Rechnungen: \"Art:51\"\015\012Projekt-Nr: \"N:xxxxx\"\015\012Datum im Format "
                                        "tt.mm.jjjj\015\012Nutzen Sie auch das Sternchen z.B. Art:51*2016 = Rechnungen in"
                                        " 2016"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7022
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="PageKontakt"
                            Caption ="   Kontakte"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =9168
                                    Top =6766
                                    Width =14742
                                    Height =4914
                                    BackColor =15066597
                                    Name ="lstKontakt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;567;2268;1701;851;2268;2268;1134"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste zugeordneter Adressen\015\012Doppelklick zeigt die markierte Adresse"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6766
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ComboBox
                                    LimitToList = NotDefault
                                    Visible = NotDefault
                                    AutoExpand = NotDefault
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =2
                                    ListRows =30
                                    ListWidth =7088
                                    Left =6049
                                    Top =6766
                                    Width =2835
                                    Height =255
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comKArt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701;5103"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Auswahl der Zuordnungs-Möglichkeiten\015\012Doppelclick öffnet Lexikon, um Eintr"
                                        "äge zu editieren / erweitern"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6766
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7021
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =7471
                                    Width =2835
                                    Height =4209
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

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7471
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin ComboBox
                                    Visible = NotDefault
                                    AutoExpand = NotDefault
                                    TabStop = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    BorderWidth =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    DecimalPlaces =2
                                    ListRows =30
                                    ListWidth =1134
                                    Left =6049
                                    Top =7107
                                    Width =2835
                                    Height =255
                                    TabIndex =3
                                    BackColor =10092543
                                    Name ="ComAnzahlZuord"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Anzahl der Zuordnung (bei Provision = Prozent)"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7107
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7362
                                End
                            End
                        End
                        Begin Page
                            Visible = NotDefault
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pageLeistung"
                            Caption ="Leistungen"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =8
                                    Left =9168
                                    Top =6767
                                    Width =14742
                                    Height =4913
                                    BackColor =15066597
                                    Name ="lstLeistung"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;1134;567;1134;4536;6237;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnClick ="[Event Procedure]"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =6767
                                    Width =2835
                                    Height =4913
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstLeistungAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Leistungen mit dem aktuellen Artikel"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="PageArtikel"
                            Caption ="  Artikel"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =12
                                    Left =6049
                                    Top =6767
                                    Width =17861
                                    Height =4913
                                    BackColor =15066597
                                    Name ="LstArtikeld"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;567;851;851;3969;3402;1134;1134;851;851;851"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der dem Vorgang zugeordneten Artikel\015\012Klick zeigt oben diesen Artike"
                                        "l an\015\012Doppel-Klick öffnet den Artikel im Artikel-Formular"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgStichwort"
                            Caption ="Stichworte Vorgang"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =255
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =8864
                                    Top =6752
                                    Width =15089
                                    Height =4928
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2835;3969;1701;1134"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der (frei wählbaren) Stichworte zu Vorgänge\015\012Doppel-Klick Stichwort:"
                                        " Stichworte bearbeiten\015\012Doppel-Klick Bemerkung: Bemerkung bearbeiten\015\012"
                                        "Doppel-Klick Hyperlink: Link öffnen, falls vorhanden"

                                    LayoutCachedLeft =8864
                                    LayoutCachedTop =6752
                                    LayoutCachedWidth =23953
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =8056
                                    Width =2835
                                    Height =3624
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Stichworte mit dem aktuellen Artikel"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =8056
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =6049
                                    Top =6752
                                    Width =2835
                                    Height =1186
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

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6752
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7938
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pageMarker"
                            ControlTipText ="markieren / löschen"
                            Caption ="Markierte"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =9
                                    Left =9168
                                    Top =6767
                                    Width =14742
                                    Height =4913
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;851;567;851;1134;3402;3402;1134"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der markierten Vorgänge"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin TextBox
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =6049
                                    Top =6767
                                    Width =2835
                                    Height =227
                                    FontWeight =600
                                    TabIndex =1
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =6994
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =7803
                                    Width =2835
                                    Height =3877
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

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7803
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =7050
                                    Width =2835
                                    Height =657
                                    TabIndex =3
                                    BackColor =12975858
                                    Name ="lstMdoVg"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der markierten Daten\015\012Sie können Vorgänge (Standard-Wert) oder di"
                                        "e entsprechenden Ansprechpartner des Vorganges markieren"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7050
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7707
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgTop"
                            ControlTipText ="Letzte 30 Vorgänge je nach Sortierung"
                            Caption ="letzte 30"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =9168
                                    Top =6766
                                    Width =14742
                                    Height =4914
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="851;1134;567;1134;1134;1701;1701;1701;1134;567;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Daten"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6766
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =6766
                                    Width =2835
                                    Height =4914
                                    BackColor =10092543
                                    Name ="lstTopAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Leistungen mit dem aktuellen Artikel"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6766
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgSum"
                            ControlTipText ="Gesamtsumm der gefilterten Vorgänge (Pro Vorgangsart)"
                            Caption ="Summe / Profit"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =6049
                                    Top =7071
                                    Width =4536
                                    Height =4609
                                    BackColor =15527148
                                    Name ="lstSum"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1134;854"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Summen der Vorgangsarten"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7071
                                    LayoutCachedWidth =10585
                                    LayoutCachedHeight =11680
                                End
                                Begin Label
                                    BackStyle =1
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =6049
                                    Top =6765
                                    Width =4536
                                    Height =255
                                    BackColor =15527148
                                    Name ="Bezeichnungsfeld496"
                                    Caption ="Summen der gefilterten Vorgänge"
                                    FontName ="Arial"
                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6765
                                    LayoutCachedWidth =10585
                                    LayoutCachedHeight =7020
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =4
                                    Left =11152
                                    Top =7071
                                    Width =4536
                                    Height =4609
                                    TabIndex =1
                                    BackColor =16773098
                                    Name ="lstProfit"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;853;864"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Rohgewinn  pro Projekt-Unternummer mit Gesamt-Summe\015\012Doppelclick filtert l"
                                        "inks die entsprechenden Vorgänge \015\012und zeigt den letzten Vorgang oben an"

                                    LayoutCachedLeft =11152
                                    LayoutCachedTop =7071
                                    LayoutCachedWidth =15688
                                    LayoutCachedHeight =11680
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =11152
                                    Top =6765
                                    Width =4536
                                    Height =255
                                    Name ="Bezeichnungsfeld25"
                                    Caption ="Rohgewinn aktuelles Projekt pro Unter-Nr."
                                    FontName ="Arial"
                                    LayoutCachedLeft =11152
                                    LayoutCachedTop =6765
                                    LayoutCachedWidth =15688
                                    LayoutCachedHeight =7020
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =16107
                                    Top =7068
                                    Width =6237
                                    Height =4612
                                    TabIndex =2
                                    BackColor =16773098
                                    Name ="lstProfitProvision"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;1418;1701;851;851;567;0"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Provisionen in diesem Projekt"

                                    LayoutCachedLeft =16107
                                    LayoutCachedTop =7068
                                    LayoutCachedWidth =22344
                                    LayoutCachedHeight =11680
                                End
                                Begin Label
                                    OverlapFlags =247
                                    TextAlign =2
                                    Left =17637
                                    Top =6759
                                    Width =4707
                                    Height =255
                                    Name ="lblProfitProvision"
                                    Caption ="Liste der Provisionen Stand: Mai  6 2019  9:56AM"
                                    FontName ="Arial"
                                    LayoutCachedLeft =17637
                                    LayoutCachedTop =6759
                                    LayoutCachedWidth =22344
                                    LayoutCachedHeight =7014
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =16105
                                    Top =6705
                                    Width =1224
                                    Height =340
                                    TabIndex =3
                                    ForeColor =10040115
                                    Name ="btnCubeAktualisieren"
                                    Caption ="aktualisieren"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="aktualisiert die in der CUBE berechneten Zahlen zum Rohgewinn und Provisionen"

                                    LayoutCachedLeft =16105
                                    LayoutCachedTop =6705
                                    LayoutCachedWidth =17329
                                    LayoutCachedHeight =7045
                                    Overlaps =1
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgEdit"
                            Caption ="Bearbeitungslisten"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    Left =9168
                                    Top =6830
                                    Width =14742
                                    Height =4850
                                    BackColor =15066597
                                    Name ="lstEdit"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6830
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =6830
                                    Width =2835
                                    Height =4850
                                    BackColor =10092543
                                    Name ="lstEditAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Dienste"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6830
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgWV"
                            Caption ="Wiedervorlagen"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    IMESentenceMode =3
                                    ColumnCount =13
                                    Left =9168
                                    Top =8015
                                    Width =14742
                                    Height =3665
                                    BackColor =10092543
                                    Name ="lstWV"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;0;0;0;907;680;2835;1701;1701;1134;1134"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    OnClick ="[Event Procedure]"
                                    Tag ="5445"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste der Wiedervorlagen (WV)\015\012Doppel-Klick:\015\012-im linken Bereich öff"
                                        "net Editier-Modus\015\012-auf Partner zeigt Person\015\012-auf Firma zeigt Firma"
                                        "\015\012-auf Projekt zeigt Vorgang\015\012mehrere WV markieren mit SHIFT/CTRL-Ta"
                                        "ste"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =8015
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =6785
                                    Width =2835
                                    Height =4895
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstWVAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Wiedervorlage"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6785
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    DecimalPlaces =0
                                    ScrollBars =2
                                    SpecialEffect =0
                                    OldBorderStyle =1
                                    OverlapFlags =247
                                    TextAlign =1
                                    IMESentenceMode =3
                                    Left =9168
                                    Top =6785
                                    Width =14742
                                    Height =1134
                                    FontSize =11
                                    TabIndex =2
                                    BackColor =15527148
                                    Name ="txtWV"
                                    FontName ="Arial"
                                    ControlTipText ="Beschreibung der Wiedervorlage zum aktuell markierten Datensatz\015\012Doppel-Kl"
                                        "ick, um diese Daten zu editieren!"
                                    TextFormat =1

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6785
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =7919
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
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgExplorer"
                            ControlTipText ="Verwalten von Dokumenten pro Projekt"
                            Caption ="DMS / Datei-Ablage"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =7371
                                    Width =2835
                                    Height =4309
                                    BackColor =12975858
                                    Name ="lstExplorerAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Handling der (markierten) Files"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7371
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =9168
                                    Top =6765
                                    Width =14742
                                    Height =4915
                                    TabIndex =1
                                    BackColor =15066597
                                    Name ="lstExplorer"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5103;1134;1134;3969"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6765
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =6049
                                    Top =6765
                                    Width =2835
                                    Height =510
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
                                    ControlTipText ="mit Klick umschalten zwischen DMS oder Explorer-Anzeige\015\012mit Doppelklick d"
                                        "as Schlagwort-Formular öffnen"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6765
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7275
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgStatistik"
                            ControlTipText ="Vorgänge der aktuell angezeigten Firma"
                            Caption ="Statistik"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =9168
                                    Top =6767
                                    Width =14742
                                    Height =4913
                                    BackColor =16774625
                                    Name ="lstStatistikDet"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;851;1134;5670;1134"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Liste Einkauf\015\012Kontrakt 218\015\012Zeige Statistik\015\012Zusammenfassung "
                                        "pro Artikel"

                                    LayoutCachedLeft =9168
                                    LayoutCachedTop =6767
                                    LayoutCachedWidth =23910
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6049
                                    Top =8297
                                    Width =2835
                                    Height =3383
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstStatistikAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen innerhalb der Statistiken"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =8297
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =11680
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    AllowAutoCorrect = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =10490
                                    Left =7750
                                    Top =6810
                                    Width =1134
                                    Height =255
                                    FontWeight =700
                                    TabIndex =2
                                    BackColor =12975858
                                    BorderColor =128
                                    ForeColor =128
                                    Name ="Kontrakt"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1134;4536;4536"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Kontrakt\015\012Geben SIe hier die Projektnummer ein, für die Sie die einzelnen "
                                        "Daten sehen wollen:\015\012Doppelclick übernimmt die aktuelle Projekt-.Nr.\015\012"
                                        "Bei Vorgangsart 30, 31, 45, 46 erfolgt automatisch der Eintrag der Projekt-Nr."

                                    LayoutCachedLeft =7750
                                    LayoutCachedTop =6810
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =7065
                                End
                                Begin ComboBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ListRows =30
                                    ListWidth =1701
                                    Left =6049
                                    Top =6810
                                    Width =1134
                                    Height =255
                                    FontWeight =700
                                    TabIndex =3
                                    BackColor =10092543
                                    Name ="comStatistikY"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Auswahl nach Jahr\015\012siehe Lexikon Gruppe Statistik"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =6810
                                    LayoutCachedWidth =7183
                                    LayoutCachedHeight =7065
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =3
                                    Left =6049
                                    Top =7110
                                    Width =2835
                                    Height =1134
                                    FontWeight =700
                                    TabIndex =4
                                    BackColor =10092543
                                    Name ="lstStatistik"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701;0;0"
                                    BeforeUpdate ="[Event Procedure]"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="\"Einkauf\""
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Übersicht über Statistiken\015\012siehe Lexikon Gruppe Statistik"

                                    LayoutCachedLeft =6049
                                    LayoutCachedTop =7110
                                    LayoutCachedWidth =8884
                                    LayoutCachedHeight =8244
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgAudit"
                            Caption ="Audit"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =9217
                                    Top =6746
                                    Width =14742
                                    Height =4934
                                    BackColor =16773098
                                    Name ="lstAudit"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701;1134;1701;3402;3402"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"

                                    LayoutCachedLeft =9217
                                    LayoutCachedTop =6746
                                    LayoutCachedWidth =23959
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =6098
                                    Top =6746
                                    Width =2835
                                    Height =4934
                                    BackColor =10092543
                                    Name ="lstAuditAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Aktionen Dienste"

                                    LayoutCachedLeft =6098
                                    LayoutCachedTop =6746
                                    LayoutCachedWidth =8933
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5880
                            Top =6630
                            Width =18315
                            Height =5050
                            Name ="pgB2B"
                            Caption ="B 2 B"
                            LayoutCachedLeft =5880
                            LayoutCachedTop =6630
                            LayoutCachedWidth =24195
                            LayoutCachedHeight =11680
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =8
                                    Left =9085
                                    Top =6710
                                    Width =14742
                                    Height =4970
                                    BackColor =15066597
                                    Name ="lstB2B"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;1701;5670;1134;1134;1134;1134"
                                    OnDblClick ="[Event Procedure]"
                                    DefaultValue ="10"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Infos zum B2B mit NNT"

                                    LayoutCachedLeft =9085
                                    LayoutCachedTop =6710
                                    LayoutCachedWidth =23827
                                    LayoutCachedHeight =11680
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5966
                                    Top =6710
                                    Width =2835
                                    Height =4970
                                    BackColor =10092543
                                    Name ="lstB2BAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ShortcutMenuBar ="cbEmpty"
                                    ControlTipText ="Infos zum B2B mit NNT"

                                    LayoutCachedLeft =5966
                                    LayoutCachedTop =6710
                                    LayoutCachedWidth =8801
                                    LayoutCachedHeight =11680
                                End
                            End
                        End
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =5442
                    Top =6165
                    Width =246
                    Height =270
                    TabIndex =7
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="A: Sucht in Adressen;N: Projekt-Nummern;S: Stichworte;D0: Vorgangs-Datum;D1: Dat"
                        "um 1;D2: Datum 2;LN: lfd.-Nr.;FA: Firmenname"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Suchkriterien auflisten und wieder setzen"

                    LayoutCachedLeft =5442
                    LayoutCachedTop =6165
                    LayoutCachedWidth =5688
                    LayoutCachedHeight =6435
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =45
                    Top =6165
                    Width =340
                    Height =270
                    FontSize =10
                    FontWeight =700
                    TabIndex =8
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

                    LayoutCachedLeft =45
                    LayoutCachedTop =6165
                    LayoutCachedWidth =385
                    LayoutCachedHeight =6435
                    Overlaps =1
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =45
                    Top =60
                    Width =1985
                    Height =907
                    TabIndex =9
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

                    LayoutCachedLeft =45
                    LayoutCachedTop =60
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =967
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =247
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =45
                    Top =3865
                    Width =1985
                    Height =2225
                    TabIndex =10
                    BackColor =-2147483633
                    Name ="lstOrder"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Sortierung im Listenfeld festlegen"

                    LayoutCachedLeft =45
                    LayoutCachedTop =3865
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =6090
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =2103
                    Top =60
                    Width =3585
                    Height =907
                    TabIndex =11
                    BackColor =13172735
                    Name ="lstMandant"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;567;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der Mandanten; Die Vorgänge können pro Mandant gefiltert werden"

                    LayoutCachedLeft =2103
                    LayoutCachedTop =60
                    LayoutCachedWidth =5688
                    LayoutCachedHeight =967
                End
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2268
                    Left =3200
                    Top =1020
                    Width =2508
                    Height =255
                    TabIndex =12
                    BackColor =-2147483633
                    BorderColor =2366701
                    Name ="comA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl der Vorgänge\015\012Kombinieren von 2 Vorgangsarten\015\012innerhalb Pro"
                        "jekt-Nr. und Projekt-Unter-Nr.\015\012Mit Doppelklick auswählen, ob die Liste na"
                        "ch Häufigkeit sortiert werden soll"

                    LayoutCachedLeft =3200
                    LayoutCachedTop =1020
                    LayoutCachedWidth =5708
                    LayoutCachedHeight =1275
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =1418
                    Left =2103
                    Top =1020
                    Width =1077
                    Height =255
                    TabIndex =13
                    BackColor =13694459
                    BorderColor =2366701
                    Name ="comAA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;285;1134"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    Tag ="VgFilter"
                    ControlTipText ="Auswahl der Vorgänge inclusive oder exklusive\015\012Kombinieren von 2 Vorgangsa"
                        "rten\015\012innerhalb Projekt-Nr. und Projekt-Unter-Nr."

                    LayoutCachedLeft =2103
                    LayoutCachedTop =1020
                    LayoutCachedWidth =3180
                    LayoutCachedHeight =1275
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2268
                    Left =45
                    Top =3600
                    Width =1985
                    Height =255
                    TabIndex =15
                    BackColor =-2147483633
                    BorderColor =2366701
                    Name ="comTage"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl der Vorgänge nach Datum resp. Tagen\015\012mit Doppelclick umschalten zu"
                        "r nächsten Möglichkeit"

                    LayoutCachedLeft =45
                    LayoutCachedTop =3600
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =3855
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =45
                    Top =3885
                    Width =1707
                    Height =255
                    TabIndex =14
                    BackColor =-2147483633
                    Name ="datVon"
                    Format ="dd/mm/yy"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl der Vorgänge nach Datum Zeitraum ab...\015\012Doppel-Klick zum Entfernen"
                        " des Eintrages"

                    LayoutCachedLeft =45
                    LayoutCachedTop =3885
                    LayoutCachedWidth =1752
                    LayoutCachedHeight =4140
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =45
                    Top =4170
                    Width =1707
                    Height =255
                    TabIndex =16
                    BackColor =-2147483633
                    Name ="DatBis"
                    Format ="dd/mm/yy"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Auswahl der Vorgänge nach Datum Zeitraum bis...\015\012Doppel-Klick zum Entferne"
                        "n des Eintrages"

                    LayoutCachedLeft =45
                    LayoutCachedTop =4170
                    LayoutCachedWidth =1752
                    LayoutCachedHeight =4425
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =1690
                    Top =6095
                    Width =340
                    Height =340
                    TabIndex =17
                    ForeColor =0
                    Name ="btntxtFind"
                    Caption ="suchen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Vorgänge mit den oben eingestellten Bedingungen unten anzeigen.\015\012Die wicht"
                        "igsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen Wert.\015"
                        "\012Doppel-Klick = Liste fix / nicht fix einstellen"
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

                    LayoutCachedLeft =1690
                    LayoutCachedTop =6095
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =6435
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2268
                    Left =45
                    Top =1005
                    Width =1985
                    Height =255
                    TabIndex =19
                    BackColor =-2147483633
                    BorderColor =2366701
                    Name ="comVGAbschluss"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="-1"
                    FontName ="Arial"
                    Tag ="FilterForm"
                    ControlTipText ="Filter nach Abschluss; Standardwert = Alle\015\012mit Doppelklick umschalten"

                    LayoutCachedLeft =45
                    LayoutCachedTop =1005
                    LayoutCachedWidth =2030
                    LayoutCachedHeight =1260
                End
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =40
                    Left =2100
                    Top =5835
                    Width =3585
                    Height =255
                    TabIndex =18
                    BackColor =-2147483633
                    Name ="comFirma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Filter nach Firma;\015\012Die Liste ist sortiert nach dem Jahr des letzten Vorga"
                        "ngsdatums\015\012Doppelklick zeigt ALLE Firmen"

                    LayoutCachedLeft =2100
                    LayoutCachedTop =5835
                    LayoutCachedWidth =5685
                    LayoutCachedHeight =6090
                End
            End
        End
    End
End
CodeBehindForm
' See "F_VG.cls"
