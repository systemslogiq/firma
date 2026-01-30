Version =20
VersionRequired =20
Begin Form
    AutoResize = NotDefault
    PopUp = NotDefault
    MaxButton = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6978
    DatasheetFontHeight =10
    ItemSuffix =90
    Left =314
    Top =3000
    Right =7694
    Bottom =14310
    Tag ="PFFilter"
    RecSrcDt = Begin
        0x532d23620da3e540
    End
    UniqueTable ="T_Filter"
    Caption ="Filtern ==> 14 Vorgänge"
    AfterUpdate ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnLoad ="[Event Procedure]"
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
        Begin Tab
            Width =5103
            Height =3402
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
        End
        Begin FormHeader
            Height =340
            BackColor =-2147483633
            Name ="Formularkopf"
            Begin
                Begin Label
                    OverlapFlags =93
                    TextAlign =2
                    Left =119
                    Top =60
                    Width =2661
                    Height =255
                    Name ="Bezeichnungsfeld1"
                    Caption ="Feld:"
                    FontName ="Arial"
                    LayoutCachedLeft =119
                    LayoutCachedTop =60
                    LayoutCachedWidth =2780
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =2
                    Left =2777
                    Top =60
                    Width =1506
                    Height =255
                    Name ="Bezeichnungsfeld3"
                    Caption ="Vergleich:"
                    FontName ="Arial"
                    LayoutCachedLeft =2777
                    LayoutCachedTop =60
                    LayoutCachedWidth =4283
                    LayoutCachedHeight =315
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    ColumnCount =3
                    ListRows =30
                    ListWidth =1701
                    Left =4421
                    Top =60
                    Width =2496
                    Height =255
                    ColumnOrder =0
                    BackColor =10092543
                    Name ="comForm"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;1134"
                    ValidationRule ="Is Not Null"
                    ValidationText ="Bitte ein Formular auswählen"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"F_Adresse\""
                    FontName ="Arial"

                    LayoutCachedLeft =4421
                    LayoutCachedTop =60
                    LayoutCachedWidth =6917
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =290
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =93
                    ColumnCount =2
                    ListRows =30
                    Left =164
                    Top =20
                    Width =2616
                    Height =270
                    BackColor =10092543
                    Name ="f"
                    ControlSource ="f"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701;0"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =164
                    LayoutCachedTop =20
                    LayoutCachedWidth =2780
                    LayoutCachedHeight =290
                End
                Begin ComboBox
                    OverlapFlags =87
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4536
                    Left =2777
                    Top =20
                    Width =1506
                    Height =270
                    TabIndex =1
                    BackColor =10092543
                    Name ="c"
                    ControlSource ="c"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1420;2835"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    Left =4309
                    Top =20
                    Width =2331
                    Height =270
                    FontWeight =700
                    TabIndex =2
                    BackColor =10092543
                    Name ="e"
                    ControlSource ="e"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="nach dieser Eingabe wird gefiltert"

                    LayoutCachedLeft =4309
                    LayoutCachedTop =20
                    LayoutCachedWidth =6640
                    LayoutCachedHeight =290
                End
                Begin ComboBox
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =3969
                    Left =6686
                    Top =20
                    Width =231
                    Height =270
                    TabIndex =3
                    BackColor =10092543
                    Name ="ec"
                    ControlSource ="e"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3969"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =6686
                    LayoutCachedTop =20
                    LayoutCachedWidth =6917
                    LayoutCachedHeight =290
                End
            End
        End
        Begin FormFooter
            Height =5095
            BackColor =-2147483633
            Name ="Formularfuß"
            Begin
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5924
                    Top =62
                    Width =993
                    Height =340
                    FontWeight =700
                    ForeColor =0
                    Name ="btnOK"
                    Caption ="ok"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =5924
                    LayoutCachedTop =62
                    LayoutCachedWidth =6917
                    LayoutCachedHeight =402
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =3915
                    Top =60
                    Width =993
                    Height =340
                    TabIndex =1
                    ForeColor =0
                    Name ="btnEscape"
                    Caption ="abbrechen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =3915
                    LayoutCachedTop =60
                    LayoutCachedWidth =4908
                    LayoutCachedHeight =400
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =4908
                    Top =60
                    Width =993
                    Height =340
                    TabIndex =2
                    ForeColor =255
                    Name ="btnDelete"
                    Caption ="alle löschen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =4908
                    LayoutCachedTop =60
                    LayoutCachedWidth =5901
                    LayoutCachedHeight =400
                    Overlaps =1
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =3580
                    Top =146
                    TabIndex =3
                    Name ="CloseFilter"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="soll der Filter geschlossen werden nach einem Suchvorgang"

                    LayoutCachedLeft =3580
                    LayoutCachedTop =146
                    LayoutCachedWidth =3840
                    LayoutCachedHeight =386
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =1530
                            Top =116
                            Width =1935
                            Height =240
                            Name ="Bezeichnungsfeld71"
                            Caption ="nach Filtern schliessen"
                            FontName ="Arial"
                            LayoutCachedLeft =1530
                            LayoutCachedTop =116
                            LayoutCachedWidth =3465
                            LayoutCachedHeight =356
                        End
                    End
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =113
                    Top =1303
                    Width =3345
                    Height =3792
                    TabIndex =5
                    BackColor =12632256
                    Name ="lstStandard"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;0"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =113
                    LayoutCachedTop =1303
                    LayoutCachedWidth =3458
                    LayoutCachedHeight =5095
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =113
                    Top =445
                    Width =6804
                    Height =822
                    FontWeight =700
                    TabIndex =6
                    Name ="lstUseFilter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5670"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"

                    LayoutCachedLeft =113
                    LayoutCachedTop =445
                    LayoutCachedWidth =6917
                    LayoutCachedHeight =1267
                    BackThemeColorIndex =1
                    BackShade =85.0
                End
                Begin ListBox
                    OverlapFlags =85
                    ColumnCount =2
                    Left =3572
                    Top =1303
                    Width =3345
                    Height =2107
                    TabIndex =4
                    BackColor =10092543
                    Name ="lstAction"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"

                    LayoutCachedLeft =3572
                    LayoutCachedTop =1303
                    LayoutCachedWidth =6917
                    LayoutCachedHeight =3410
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Filter.cls"
