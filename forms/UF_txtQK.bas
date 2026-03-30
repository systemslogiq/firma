Version =20
VersionRequired =20
Begin Form
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8553
    DatasheetFontHeight =10
    ItemSuffix =14
    Right =19740
    Bottom =11445
    Tag ="QK"
    RecSrcDt = Begin
        0xe9f2352df75de540
    End
    DatasheetFontName ="Arial"
    OnDblClick ="[Event Procedure]"
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
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin FormHeader
            Height =260
            BackColor =12632256
            Name ="fh"
            Begin
                Begin Label
                    OverlapFlags =93
                    Width =795
                    Height =255
                    Name ="Bezeichnungsfeld4"
                    Caption ="Feld-Nr."
                    FontName ="Arial"
                End
                Begin Label
                    OverlapFlags =85
                    Left =1020
                    Width =1560
                    Height =255
                    Name ="Bezeichnungsfeld5"
                    Caption ="Name / Bezeichnung"
                    FontName ="Arial"
                End
                Begin Label
                    OverlapFlags =93
                    Left =4648
                    Width =1560
                    Height =255
                    Name ="Bezeichnungsfeld6"
                    Caption ="Vorgabewerte"
                    FontName ="Arial"
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    Width =576
                    BackColor =10092543
                    Name ="f0"
                    ControlSource ="NrTxt"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =6179
                    Width =576
                    TabIndex =1
                    BackColor =10092543
                    Name ="f1"
                    ControlSource ="TxtNr"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7029
                    Width =576
                    TabIndex =2
                    BackColor =10092543
                    Name ="f2"
                    ControlSource ="Txt"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7880
                    Width =576
                    TabIndex =3
                    BackColor =10092543
                    Name ="f3"
                    ControlSource ="txtV"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3004
                    Width =576
                    TabIndex =4
                    BackColor =10092543
                    Name ="NrTxt"
                    ControlSource ="NrTxt"
                    FontName ="Arial"

                    LayoutCachedLeft =3004
                    LayoutCachedWidth =3580
                    LayoutCachedHeight =240
                End
            End
        End
        Begin Section
            Height =262
            BackColor =12632256
            Name ="Det"
            Begin
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =85
                    ListRows =30
                    ListWidth =2268
                    Left =1301
                    Top =7
                    Width =3092
                    Height =255
                    ColumnWidth =2340
                    TabIndex =1
                    Name ="txt"
                    ControlSource ="txt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick um Lexikon zu öffnen"

                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Width =284
                    Height =255
                    LeftMargin =57
                    Name ="TxtNr"
                    ControlSource ="TxtNr"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick um Lexikon zu öffnen"

                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =4476
                    Width =4077
                    Height =255
                    TabIndex =2
                    LeftMargin =57
                    Name ="TxtV"
                    ControlSource ="txtV"
                    FontName ="Arial"

                End
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4536
                    Left =396
                    Width =825
                    Height =255
                    TabIndex =3
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000072000000030000000000000002000000000000000200000001000000 ,
                        0x0000000099cc0000000000000200000003000000050000000100000000000000 ,
                        0xffff0000000000000200000006000000080000000100000000000000ed1c2400 ,
                        0x320000000000330000000000340000000000
                    End
                    Name ="txtMarker"
                    ControlSource ="txtMarker"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;853;3402"
                    FontName ="Arial"
                    ControlTipText ="Layout beeinflussen"

                    ConditionalFormat14 = Begin
                        0x0100030000000000000002000000010000000000000099cc0000010000003200 ,
                        0x0000000000000000000000000000000000000000000000000002000000010000 ,
                        0x0000000000ffff00000100000033000000000000000000000000000000000000 ,
                        0x0000000000000000020000000100000000000000ed1c24000100000034000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =12632256
            Name ="ff"
        End
    End
End
CodeBehindForm
' See "UF_txtQK.cls"
