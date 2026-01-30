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
    ScrollBars =1
    ViewsAllowed =1
    TabularFamily =48
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =14690
    DatasheetFontHeight =10
    ItemSuffix =65
    Right =25530
    Bottom =12600
    OnUnload ="[Event Procedure]"
    BeforeDelConfirm ="[Event Procedure]"
    Tag ="Filter"
    RecSrcDt = Begin
        0x00c2fd444c3ae540
    End
    Caption ="Filter"
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
            AutoLabel = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1146
            Height =255
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
            Name ="Det"
            Begin
                Begin TextBox
                    BorderWidth =1
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =13728
                    Width =900
                    ColumnWidth =1701
                    BackColor =10079487
                    ForeColor =0
                    Name ="NrFilter"
                    ControlSource ="NrFilter"
                    FontName ="Arial"

                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =93
                            Left =12642
                            Width =1026
                            Height =255
                            BackColor =10079487
                            ForeColor =0
                            Name ="NrFilter_Bezeichnungsfeld"
                            Caption ="NrFilter"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5054
                    Top =113
                    Width =900
                    ColumnWidth =900
                    TabIndex =2
                    Name ="ReportNr"
                    ControlSource ="ReportNr"
                    StatusBarText ="Steuerung der Reports"
                    FontName ="Arial"
                    Tag ="m1"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =113
                            Width =1026
                            Height =255
                            Name ="ReportNr_Bezeichnungsfeld"
                            Caption ="ReportNr"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =5054
                    Top =421
                    Width =2775
                    Height =255
                    ColumnWidth =2310
                    TabIndex =3
                    Name ="FormN"
                    ControlSource ="FormN"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    Tag ="m2"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =421
                            Width =1026
                            Height =255
                            Name ="Form1_Bezeichnungsfeld"
                            Caption ="FormN"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =5054
                    Top =729
                    Width =2775
                    Height =255
                    ColumnWidth =2310
                    TabIndex =4
                    Name ="FormName"
                    ControlSource ="FormName"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    Tag ="m3"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =729
                            Width =1026
                            Height =255
                            Name ="FormName_Bezeichnungsfeld"
                            Caption ="FormName"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5054
                    Top =1345
                    Width =9582
                    Height =435
                    ColumnWidth =2310
                    TabIndex =6
                    Name ="FieldN"
                    ControlSource ="FieldN"
                    StatusBarText ="auch Klartext zum Report"
                    FontName ="Arial"
                    Tag ="m3"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =1345
                            Width =1026
                            Height =255
                            Name ="Field_Bezeichnungsfeld"
                            Caption ="Field"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    BorderWidth =1
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =6796
                    Top =113
                    Width =585
                    ColumnWidth =465
                    TabIndex =1
                    Name ="FilterNr"
                    ControlSource ="FilterNr"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="x"

                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =5054
                    Top =2321
                    Width =2775
                    Height =255
                    ColumnWidth =2310
                    TabIndex =8
                    Name ="IsText"
                    ControlSource ="IsText"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    Tag ="x"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =2321
                            Width =1026
                            Height =255
                            Name ="IsText_Bezeichnungsfeld"
                            Caption ="IsText"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =10
                    ListWidth =2268
                    Left =9533
                    Top =2321
                    Width =2775
                    Height =255
                    ColumnWidth =2310
                    TabIndex =9
                    Name ="Compare"
                    ControlSource ="Compare"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    StatusBarText ="Wie soll verglichen werden"
                    FontName ="Arial"
                    Tag ="x"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =8447
                            Top =2321
                            Width =1026
                            Height =255
                            Name ="Compare_Bezeichnungsfeld"
                            Caption ="Compare"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5061
                    Top =3416
                    Width =9582
                    Height =735
                    ColumnWidth =3000
                    TabIndex =11
                    Name ="FindSQL"
                    ControlSource ="FindSQL"
                    StatusBarText ="Recordsource der Felder \"ec\" im Filter falls abweichend vom Standart"
                    FontName ="Arial"
                    Tag ="x"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3975
                            Top =3416
                            Width =1026
                            Height =255
                            Name ="FindSQL_Bezeichnungsfeld"
                            Caption ="FindSQL"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5061
                    Top =2640
                    Width =9582
                    Height =735
                    ColumnWidth =3000
                    TabIndex =10
                    Name ="FilterSQL"
                    ControlSource ="FilterSQL"
                    StatusBarText ="Joins der Tabellen und ev. weitere Where-Bedingungen"
                    FontName ="Arial"
                    Tag ="x"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3975
                            Top =2640
                            Width =1026
                            Height =255
                            Name ="FilterSQL_Bezeichnungsfeld"
                            Caption ="FilterSQL"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5054
                    Top =1818
                    Width =9582
                    Height =435
                    ColumnWidth =3000
                    TabIndex =7
                    Name ="BemFilter"
                    ControlSource ="BemFilter"
                    FontName ="Arial"
                    Tag ="x"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =1818
                            Width =1026
                            Height =255
                            Name ="BemFilter_Bezeichnungsfeld"
                            Caption ="Bemerkung"
                            FontName ="Arial"
                        End
                    End
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =5054
                    Top =1037
                    Width =9582
                    Height =255
                    ColumnWidth =3000
                    TabIndex =5
                    Name ="FieldName"
                    ControlSource ="FieldName"
                    RowSourceType ="Table/Query"
                    StatusBarText ="auch Reportname"
                    FontName ="Arial"
                    Tag ="m3"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =3968
                            Top =1037
                            Width =1026
                            Height =255
                            Name ="FieldName_Bezeichnungsfeld"
                            Caption ="FieldName"
                            FontName ="Arial"
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =87
                    Left =6053
                    Top =115
                    Width =741
                    TabIndex =12
                    Name ="btnFilterNr"
                    Caption ="Filter-Nr"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Neu Sortieren"

                    Overlaps =1
                End
                Begin TextBox
                    BorderWidth =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8447
                    Top =453
                    Width =585
                    TabIndex =13
                    BackColor =10092543
                    Name ="SortNr"
                    ControlSource ="SortNr"
                    FontName ="Arial"

                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =255
                    TextAlign =1
                    BackStyle =0
                    Left =12755
                    Top =226
                    Width =1866
                    TabIndex =14
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="Filtererfasst"
                    ControlSource ="Filtererfasst"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="erfasst am ..."
                    AsianLineBreak =0

                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =127
                    TextAlign =1
                    BackStyle =0
                    Left =12755
                    Top =481
                    Width =1866
                    TabIndex =15
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="WhoUpdate"
                    ControlSource ="WhoUpdate"
                    Format ="dd/mm/yy"
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="Adresse Update von .."
                    AsianLineBreak =0

                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =119
                    TextAlign =1
                    BackStyle =0
                    Left =12755
                    Top =736
                    Width =1866
                    FontSize =7
                    TabIndex =16
                    BackColor =12632256
                    ForeColor =8421504
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Now()"
                    FontName ="Arial"
                    ControlTipText ="letzte Änderung am.."
                    AsianLineBreak =0

                End
                Begin ListBox
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =90
                    Top =4939
                    Width =3804
                    Height =7530
                    TabIndex =17
                    BackColor =14803425
                    ForeColor =0
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701;284;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Liste der gefilterten (152) Daten für Filter\015\012Verwenden Sie die Pfeiltaste"
                        "n, um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =90
                    LayoutCachedTop =4939
                    LayoutCachedWidth =3894
                    LayoutCachedHeight =12469
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1005
                    Top =4650
                    Width =2559
                    Height =240
                    FontWeight =600
                    TabIndex =18
                    BackColor =12975858
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"

                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =90
                    Top =45
                    Width =3804
                    Height =1374
                    TabIndex =19
                    BackColor =14803425
                    ForeColor =0
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"
                    FontName ="Arial"
                    ControlTipText ="Auswahl der Adressen"

                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =90
                    Top =4650
                    Width =849
                    Height =227
                    FontWeight =600
                    TabIndex =20
                    BackColor =12975858
                    ForeColor =0
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"

                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =3648
                    Top =4620
                    Width =246
                    Height =270
                    TabIndex =21
                    BackColor =12975858
                    ForeColor =0
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="test;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Anrede auswählen"

                End
                Begin Tab
                    OverlapFlags =85
                    BackStyle =1
                    Left =3945
                    Top =4230
                    Width =10740
                    Height =8385
                    TabIndex =22
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =3945
                    LayoutCachedTop =4230
                    LayoutCachedWidth =14685
                    LayoutCachedHeight =12615
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =4080
                            Top =4635
                            Width =10470
                            Height =7839
                            Name ="pg1"
                            Caption ="pro Formular"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =4635
                            LayoutCachedWidth =14550
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =4223
                                    Top =4939
                                    Width =10206
                                    Height =7406
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstForm"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;567;567;1134;1701;852;852"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnMouseDown ="[Event Procedure]"

                                    LayoutCachedLeft =4223
                                    LayoutCachedTop =4939
                                    LayoutCachedWidth =14429
                                    LayoutCachedHeight =12345
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4080
                            Top =4635
                            Width =10470
                            Height =7839
                            Name ="pg0"
                            Caption ="Stichworte"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =4635
                            LayoutCachedWidth =14550
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =5605
                                    Top =4939
                                    Width =8811
                                    Height =7346
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;297;2268;2268;1134;858"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5605
                                    LayoutCachedTop =4939
                                    LayoutCachedWidth =14416
                                    LayoutCachedHeight =12285
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4081
                                    Top =4939
                                    Width =1418
                                    Height =7346
                                    BackColor =12975858
                                    ForeColor =0
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =4081
                                    LayoutCachedTop =4939
                                    LayoutCachedWidth =5499
                                    LayoutCachedHeight =12285
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =4080
                            Top =4635
                            Width =10470
                            Height =7839
                            Name ="pageMarker"
                            Caption ="Filter managen"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =4635
                            LayoutCachedWidth =14550
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =5331
                                    Top =4939
                                    Width =9150
                                    Height =7350
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;739;683;855;855;855;855;855;855;855;855;855;855;855"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =5331
                                    LayoutCachedTop =4939
                                    LayoutCachedWidth =14481
                                    LayoutCachedHeight =12289
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    OverlapFlags =215
                                    TextAlign =2
                                    IMESentenceMode =3
                                    Left =4081
                                    Top =4939
                                    Width =1134
                                    Height =227
                                    FontWeight =600
                                    BackColor =12975858
                                    ForeColor =4210816
                                    Name ="countM"
                                    FontName ="Tahoma"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"

                                    LayoutCachedLeft =4081
                                    LayoutCachedTop =4939
                                    LayoutCachedWidth =5215
                                    LayoutCachedHeight =5166
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4082
                                    Top =5223
                                    Width =1134
                                    Height =7066
                                    BackColor =12975858
                                    ForeColor =0
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    FontName ="Arial"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =4082
                                    LayoutCachedTop =5223
                                    LayoutCachedWidth =5216
                                    LayoutCachedHeight =12289
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =4080
                            Top =4635
                            Width =10470
                            Height =7839
                            Name ="pg3"
                            Caption ="top 100"
                            LayoutCachedLeft =4080
                            LayoutCachedTop =4635
                            LayoutCachedWidth =14550
                            LayoutCachedHeight =12474
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =11
                                    Left =4210
                                    Top =5569
                                    Width =10206
                                    Height =6720
                                    BackColor =15066597
                                    ForeColor =0
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;739;683;854;854;854;854;854;854;854;854;854;854;854"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4210
                                    LayoutCachedTop =5569
                                    LayoutCachedWidth =14416
                                    LayoutCachedHeight =12289
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    BorderWidth =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =4210
                                    Top =4697
                                    Width =2031
                                    Height =622
                                    TabIndex =1
                                    BackColor =10092543
                                    ForeColor =0
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"
                                    FontName ="Arial"

                                    LayoutCachedLeft =4210
                                    LayoutCachedTop =4697
                                    LayoutCachedWidth =6241
                                    LayoutCachedHeight =5319
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
                    Left =90
                    Top =1487
                    Width =3804
                    Height =3105
                    TabIndex =23
                    BackColor =14803425
                    ForeColor =0
                    Name ="lstb"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"_\""
                    FontName ="Arial"
                    ControlTipText ="Auswahl der Adressen"

                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    Left =9023
                    Top =113
                    Width =2775
                    Height =255
                    TabIndex =24
                    Name ="filterArt"
                    ControlSource ="filterArt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    FontName ="Arial"
                    Tag ="m2"

                    Begin
                        Begin Label
                            OldBorderStyle =1
                            BorderWidth =1
                            OverlapFlags =85
                            Left =7937
                            Top =113
                            Width =1026
                            Height =255
                            Name ="Bezeichnungsfeld64"
                            Caption ="Filterart"
                            FontName ="Arial"
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Filter.cls"
