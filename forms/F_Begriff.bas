Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    TabularFamily =18
    GridY =10
    Width =18180
    DatasheetFontHeight =10
    ItemSuffix =219
    Right =24675
    Bottom =12195
    OnUnload ="[Event Procedure]"
    Tag ="Begriff"
    RecSrcDt = Begin
        0x8fc2f5b00f1ce540
    End
    Caption ="Begriffe"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
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
            TextAlign =3
            TextFontFamily =18
            FontSize =12
            FontName ="Times New Roman"
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
        Begin TextBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =300
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin ListBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin ComboBox
            LabelAlign =3
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =300
            LabelX =-230
            FontSize =12
            FontName ="Times New Roman"
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
            Height =12615
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =5101
                    Top =169
                    Width =794
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =3
                    ForeColor =8421504
                    Name ="NrBegriff"
                    ControlSource ="NrBegriff"
                    StatusBarText ="NrBegriff (Zähler)"
                    FontName ="Arial"
                    ControlTipText ="NrBegriff (Zähler)"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4081
                            Top =169
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld210"
                            Caption ="ID"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =5101
                    Top =565
                    Width =7596
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =6
                    Name ="Begriff"
                    ControlSource ="Begriff"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Bezeichnung des Begriffs"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4081
                            Top =565
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld204"
                            Caption ="Begriff"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    AutoTab = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =5101
                    Top =1659
                    Width =7596
                    Height =900
                    FontSize =8
                    TabIndex =10
                    Name ="BemBegriff"
                    ControlSource ="BemBegriff"
                    FontName ="Arial"
                    ControlTipText ="Bemerkungen zum Begriff"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4081
                            Top =1656
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld209"
                            Caption ="Bemerkung"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =12869
                    Top =1416
                    Width =1821
                    Height =255
                    FontSize =8
                    TabIndex =4
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."

                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =12869
                    Top =1161
                    Width =1821
                    Height =255
                    FontSize =8
                    BackColor =12632256
                    ForeColor =9868950
                    Name ="whoUpdate"
                    ControlSource ="whoUpdate"
                    Format ="dd/mm/yy"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung durch..."

                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =12869
                    Top =651
                    Width =1821
                    Height =255
                    FontSize =8
                    TabIndex =1
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="BegriffErfasst"
                    ControlSource ="BegriffErfasst"
                    Format ="General Date"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Datensatz erfasst am..."

                End
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =12869
                    Top =906
                    Width =1821
                    Height =255
                    FontSize =8
                    TabIndex =5
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="MarkerBegriff"
                    ControlSource ="MarkerBegriff"
                    FontName ="Arial"
                    ControlTipText ="markiert von......"

                End
                Begin ComboBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =5101
                    Top =940
                    Width =7596
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =7
                    Name ="Begriffgruppe"
                    ControlSource ="Begriffgruppe"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="6804"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Bezeichnung des Begriffs"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4081
                            Top =940
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld212"
                            Caption ="Gruppe"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =9746
                    Top =1304
                    Width =2946
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =8
                    Name ="Kurzform"
                    ControlSource ="Kurzform"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Zusatz zum Begriff (z.B. Einheit)"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =8726
                            Top =1304
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld214"
                            Caption ="Kurzform"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    ListRows =30
                    Left =5101
                    Top =1309
                    Width =2946
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =9
                    Name ="Begriff1"
                    ControlSource ="Begriff1"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Zusatz zum Begriff (z.B. Einheit)"

                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4081
                            Top =1309
                            Width =855
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld206"
                            Caption ="Zusatz"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =12869
                    Top =396
                    Width =1821
                    Height =255
                    FontSize =8
                    TabIndex =2
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="PrintMarkerBegriff"
                    ControlSource ="PrintMarkerBegriff"
                    FontName ="Arial"
                    ControlTipText ="Datensatz erfasst am..."

                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =34
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =75
                    Top =3185
                    Width =3804
                    Height =9227
                    FontSize =8
                    TabIndex =11
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;567"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Liste der gefilterten (1) Daten für Begriff\015\012Verwenden Sie die Pfeiltasten"
                        ", um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =75
                    LayoutCachedTop =3185
                    LayoutCachedWidth =3879
                    LayoutCachedHeight =12412
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1035
                    Top =2865
                    Width =2499
                    Height =255
                    FontSize =8
                    FontWeight =600
                    TabIndex =12
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    Tag ="FilteForm"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"
                    AsianLineBreak =255

                    LayoutCachedLeft =1035
                    LayoutCachedTop =2865
                    LayoutCachedWidth =3534
                    LayoutCachedHeight =3120
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =75
                    Top =2865
                    Width =849
                    Height =255
                    FontSize =8
                    FontWeight =600
                    TabIndex =13
                    BackColor =12975858
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =75
                    LayoutCachedTop =2865
                    LayoutCachedWidth =924
                    LayoutCachedHeight =3120
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    ListRows =20
                    ListWidth =1701
                    Left =3603
                    Top =2850
                    Width =246
                    Height =255
                    FontSize =8
                    TabIndex =14
                    BackColor =12975858
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="kkkkAnti-Virenprogramm;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="letzte Suchkriterien auflisten und wieder setzen"

                    LayoutCachedLeft =3603
                    LayoutCachedTop =2850
                    LayoutCachedWidth =3849
                    LayoutCachedHeight =3105
                End
                Begin Tab
                    OverlapFlags =85
                    Left =3930
                    Top =2835
                    Width =14250
                    Height =9780
                    TabIndex =15
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =3930
                    LayoutCachedTop =2835
                    LayoutCachedWidth =18180
                    LayoutCachedHeight =12615
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =4065
                            Top =3240
                            Width =13980
                            Height =9234
                            Name ="pgStichwort"
                            Caption ="Stichworte"
                            LayoutCachedLeft =4065
                            LayoutCachedTop =3240
                            LayoutCachedWidth =18045
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4174
                                    Top =3280
                                    Width =1898
                                    Height =9033
                                    FontSize =8
                                    TabIndex =1
                                    BackColor =12975858
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =4174
                                    LayoutCachedTop =3280
                                    LayoutCachedWidth =6072
                                    LayoutCachedHeight =12313
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =6237
                                    Top =3280
                                    Width =11057
                                    Height =9033
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;2268;2835;1134;1134;567"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"
                                    ControlTipText ="Liste der (frei wählbaren) Stichworte zu Begriffe\015\012Doppelclick Stichwort: "
                                        "Stichworte bearbeiten\015\012Doppelclick Bemerkung: Bemerkung bearbeiten\015\012"
                                        "Doppelclick Hyperlink: Link öffnen, falls vorhanden"

                                    LayoutCachedLeft =6237
                                    LayoutCachedTop =3280
                                    LayoutCachedWidth =17294
                                    LayoutCachedHeight =12313
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4065
                            Top =3240
                            Width =13980
                            Height =9234
                            Name ="pg1"
                            Caption ="Artikel"
                            LayoutCachedLeft =4065
                            LayoutCachedTop =3240
                            LayoutCachedWidth =18045
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =4225
                                    Top =3279
                                    Width =13806
                                    Height =9030
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstArtikel"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4225
                                    LayoutCachedTop =3279
                                    LayoutCachedWidth =18031
                                    LayoutCachedHeight =12309
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4065
                            Top =3240
                            Width =13980
                            Height =9234
                            Name ="pageMarker"
                            Caption ="markierte Begriffe"
                            LayoutCachedLeft =4065
                            LayoutCachedTop =3240
                            LayoutCachedWidth =18045
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =6133
                                    Top =3311
                                    Width =11910
                                    Height =8985
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835;1134;3969;567"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =6133
                                    LayoutCachedTop =3311
                                    LayoutCachedWidth =18043
                                    LayoutCachedHeight =12296
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    OverlapFlags =215
                                    TextAlign =2
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    Left =4080
                                    Top =3285
                                    Width =1944
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

                                    LayoutCachedLeft =4080
                                    LayoutCachedTop =3285
                                    LayoutCachedWidth =6024
                                    LayoutCachedHeight =3512
                                End
                                Begin ListBox
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4076
                                    Top =3566
                                    Width =1944
                                    Height =8746
                                    FontSize =8
                                    TabIndex =2
                                    BackColor =12975858
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =4076
                                    LayoutCachedTop =3566
                                    LayoutCachedWidth =6020
                                    LayoutCachedHeight =12312
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4065
                            Top =3240
                            Width =13980
                            Height =9234
                            Name ="pg3"
                            Caption ="top 100"
                            LayoutCachedLeft =4065
                            LayoutCachedTop =3240
                            LayoutCachedWidth =18045
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =6882
                                    Top =3265
                                    Width =11151
                                    Height =9045
                                    FontSize =8
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2835;1134;5103;567"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =6882
                                    LayoutCachedTop =3265
                                    LayoutCachedWidth =18033
                                    LayoutCachedHeight =12310
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    TextFontFamily =34
                                    TextAlign =1
                                    BorderWidth =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4212
                                    Top =3283
                                    Width =2571
                                    Height =9028
                                    FontSize =8
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"
                                    FontName ="Arial"
                                    ControlTipText ="Sortierung"

                                    LayoutCachedLeft =4212
                                    LayoutCachedTop =3283
                                    LayoutCachedWidth =6783
                                    LayoutCachedHeight =12311
                                End
                            End
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =30
                    Top =120
                    Width =3804
                    Height =2705
                    FontSize =8
                    TabIndex =16
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"A L L E\""
                    FontName ="Tahoma"
                    Tag ="FilteForm"
                    ControlTipText ="Liste der Begriff-Gruppen"

                    LayoutCachedLeft =30
                    LayoutCachedTop =120
                    LayoutCachedWidth =3834
                    LayoutCachedHeight =2825
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =34
                    Left =6802
                    Top =170
                    Width =794
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =17
                    BackColor =62207
                    ForeColor =8421504
                    Name ="f0"
                    ControlSource ="NrBegriff"
                    StatusBarText ="NrBegriff (Zähler)"
                    FontName ="Arial"
                    ControlTipText ="NrBegriff (Zähler)"

                    LayoutCachedLeft =6802
                    LayoutCachedTop =170
                    LayoutCachedWidth =7596
                    LayoutCachedHeight =425
                    Begin
                        Begin Label
                            BackStyle =0
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =6127
                            Top =170
                            Width =510
                            Height =255
                            FontSize =8
                            Name ="Bezeichnungsfeld218"
                            Caption ="f0"
                            FontName ="Arial"
                            LayoutCachedLeft =6127
                            LayoutCachedTop =170
                            LayoutCachedWidth =6637
                            LayoutCachedHeight =425
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Begriff.cls"
