Version =20
VersionRequired =20
Begin Form
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    BorderStyle =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6824
    DatasheetFontHeight =10
    ItemSuffix =36
    Left =6780
    Top =1275
    Right =13680
    Bottom =11535
    BeforeDelConfirm ="[Event Procedure]"
    AfterDelConfirm ="[Event Procedure]"
    Tag ="Stichwort"
    RecSrcDt = Begin
        0x0e10f3dfd0d0e540
    End
    UniqueTable ="T_Stichwort"
    Caption ="Stichwort"
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
        Begin TextBox
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin FormHeader
            Height =2819
            BackColor =6723891
            Name ="fh"
            Begin
                Begin CommandButton
                    FontUnderline = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =63
                    Top =2495
                    Width =1644
                    Height =284
                    TabIndex =27
                    ForeColor =16711680
                    Name ="btnHyperlink"
                    Caption ="Link"
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="top2"
                    ControlTipText ="Hyperlink bearbeiten\015\012=Doppel-Click"

                    LayoutCachedLeft =63
                    LayoutCachedTop =2495
                    LayoutCachedWidth =1707
                    LayoutCachedHeight =2779
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =57
                    Top =60
                    Width =516
                    Height =309
                    TabIndex =15
                    ForeColor =0
                    Name ="btnNeu"
                    Caption ="Stichwort hinzufügen"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                        0xadadadadadadadadd1dadadadadadadaa11dadadada4adadd111dadad4d4d4da ,
                        0xa1111dadad444dadd11111da4444444aa1111dadad444dadd111dadad4d4d4da ,
                        0xa11dadadada4adadd1dadadadadadadaadadadadadadadaddadadadadadadada ,
                        0xadadadadadadadad
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Stichwort hinzufügen"

                    LayoutCachedLeft =57
                    LayoutCachedTop =60
                    LayoutCachedWidth =573
                    LayoutCachedHeight =369
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =2490
                    Top =454
                    Width =1431
                    Height =284
                    TabIndex =16
                    ForeColor =0
                    Name ="btnPrintMarkerStichwort"
                    Caption ="Anzeige"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                        0xa000adad000dadad08e80ad08e80dada0e8e0da0e8e0adad0fe80ad0fe80dada ,
                        0x0efe0da0efe0adad7000d00a0007dadaa0adadadada0ada0da0ada0adada0ad0 ,
                        0xada0ad0dadada0a0dada0a0adadada0aadada0adadadadaddadadadadadadada ,
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
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Manage Print-Möglichkeiten"

                    LayoutCachedLeft =2490
                    LayoutCachedTop =454
                    LayoutCachedWidth =3921
                    LayoutCachedHeight =738
                    PictureCaptionArrangement =1
                    Overlaps =1
                End
                Begin ComboBox
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =93
                    TextAlign =1
                    ListRows =30
                    ListWidth =2835
                    Left =1708
                    Top =1485
                    Width =4251
                    Height =284
                    ColumnOrder =13
                    TabIndex =6
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="Stichwort"
                    ControlSource ="Stichwort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Stichwort"

                    LayoutCachedLeft =1708
                    LayoutCachedTop =1485
                    LayoutCachedWidth =5959
                    LayoutCachedHeight =1769
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =2
                    ListRows =30
                    Left =1701
                    Top =454
                    Width =570
                    Height =284
                    ColumnOrder =10
                    TabIndex =1
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="StichwortNr"
                    ControlSource ="StichwortNr"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Position"

                    LayoutCachedLeft =1701
                    LayoutCachedTop =454
                    LayoutCachedWidth =2271
                    LayoutCachedHeight =738
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    TabStop = NotDefault
                    IsHyperlink = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =1711
                    Top =2495
                    Width =4536
                    Height =284
                    ColumnOrder =15
                    TabIndex =11
                    BackColor =15263976
                    ForeColor =16711680
                    Name ="StichwortHyperlink"
                    ControlSource ="HL"
                    FontName ="Arial"
                    Tag ="top2"
                    ControlTipText ="Dateiname / Hyperlink mit rechter Maustate öffnen"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1711
                    LayoutCachedTop =2495
                    LayoutCachedWidth =6247
                    LayoutCachedHeight =2779
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CheckBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =4071
                    Top =454
                    Width =215
                    Height =284
                    ColumnOrder =12
                    TabIndex =2
                    Name ="PrintMarkerStichwort"
                    ControlSource ="PrintMarkerStichwort"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Soll dieser Datensatz ausgedruckt werden?"

                    LayoutCachedLeft =4071
                    LayoutCachedTop =454
                    LayoutCachedWidth =4286
                    LayoutCachedHeight =738
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =57
                    Top =454
                    Width =1644
                    Height =284
                    TabIndex =18
                    ForeColor =0
                    Name ="btnStichwortNr"
                    Caption ="lfd. Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =57
                    LayoutCachedTop =454
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =738
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =63
                    Top =1814
                    Width =1644
                    Height =284
                    TabIndex =23
                    ForeColor =0
                    Name ="btnBemStichwort"
                    Caption ="Bemerkung"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =63
                    LayoutCachedTop =1814
                    LayoutCachedWidth =1707
                    LayoutCachedHeight =2098
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1020
                    Top =56
                    Width =1020
                    Height =270
                    ColumnOrder =9
                    BackColor =12632256
                    BorderColor =9868950
                    ForeColor =12632256
                    Name ="NrStichwort"
                    ControlSource ="NrStichwort"
                    FontName ="Arial"
                    ControlTipText ="ID"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4536
                    Left =5421
                    Top =454
                    Width =825
                    Height =284
                    ColumnOrder =11
                    TabIndex =3
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="MarkerStichwort"
                    ControlSource ="MarkerStichwort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;852;3402"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Layout beeinflussen"

                    LayoutCachedLeft =5421
                    LayoutCachedTop =454
                    LayoutCachedWidth =6246
                    LayoutCachedHeight =738
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =4485
                    Top =454
                    Width =851
                    Height =284
                    TabIndex =17
                    ForeColor =0
                    Name ="btnMarkerStichwort"
                    Caption ="Layout"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Beeinflussen des Layouts"

                    LayoutCachedLeft =4485
                    LayoutCachedTop =454
                    LayoutCachedWidth =5336
                    LayoutCachedHeight =738
                    Overlaps =1
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2948
                    Top =56
                    Width =1020
                    Height =270
                    ColumnOrder =16
                    TabIndex =12
                    BackColor =12632256
                    BorderColor =9868950
                    ForeColor =12632256
                    Name ="F0"
                    ControlSource ="NrStichwort"
                    FontName ="Arial"
                    ControlTipText ="ID"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =93
                    TextAlign =1
                    ListRows =30
                    ListWidth =5670
                    Left =5968
                    Top =1814
                    Width =284
                    Height =284
                    ColumnOrder =8
                    TabIndex =24
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="BemStichwortLex"
                    ControlSource ="BemStichwort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="5670"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Bemerkungen zum Stichwort, die im Lexikon hinterlegt sind"

                    LayoutCachedLeft =5968
                    LayoutCachedTop =1814
                    LayoutCachedWidth =6252
                    LayoutCachedHeight =2098
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    ListWidth =5387
                    Left =5965
                    Top =1485
                    Width =284
                    Height =284
                    ColumnOrder =7
                    TabIndex =22
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="StichwortLex"
                    ControlSource ="Stichwort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Stichwort, das im Lexikon als Gruppe hinterlegt ist"

                    LayoutCachedLeft =5965
                    LayoutCachedTop =1485
                    LayoutCachedWidth =6249
                    LayoutCachedHeight =1769
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    ListWidth =3969
                    Left =1710
                    Top =794
                    Width =4536
                    Height =284
                    ColumnOrder =6
                    TabIndex =4
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="StichwortGr"
                    ControlSource ="StichwortGr"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Stichwort"

                    LayoutCachedLeft =1710
                    LayoutCachedTop =794
                    LayoutCachedWidth =6246
                    LayoutCachedHeight =1078
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =57
                    Top =794
                    Width =1644
                    Height =284
                    TabIndex =19
                    ForeColor =0
                    Name ="btnStichwortGr"
                    Caption ="Stichwort-Gruppe"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =57
                    LayoutCachedTop =794
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =1078
                    Overlaps =1
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =93
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =4536
                    Left =1713
                    Top =1134
                    Width =4536
                    Height =284
                    ColumnOrder =5
                    TabIndex =5
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="NrFunktion"
                    ControlSource ="NrFunktion"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;4536"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Stichwort"

                    LayoutCachedLeft =1713
                    LayoutCachedTop =1134
                    LayoutCachedWidth =6249
                    LayoutCachedHeight =1418
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =60
                    Top =1134
                    Width =1644
                    Height =284
                    TabIndex =20
                    ForeColor =0
                    Name ="btnNrFunktion"
                    Caption ="Firma"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Stichworte sind dieser Firma zugeordnet"

                    LayoutCachedLeft =60
                    LayoutCachedTop =1134
                    LayoutCachedWidth =1704
                    LayoutCachedHeight =1418
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    Left =1706
                    Top =2155
                    Width =1418
                    Height =284
                    ColumnOrder =4
                    TabIndex =9
                    BackColor =15263976
                    Name ="bemwert"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="top1"
                    ControlTipText ="Wert (erfasst in den Bemerkungen zum Stichwort)"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =1706
                    LayoutCachedTop =2155
                    LayoutCachedWidth =3124
                    LayoutCachedHeight =2439
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    ListRows =30
                    Left =4825
                    Top =2155
                    Width =1418
                    Height =284
                    ColumnOrder =3
                    TabIndex =10
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="bemEinheit"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="top1"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Einheit (erfasst in den Bemerkungen zum Stichwort)"
                    AllowValueListEdits =255

                    LayoutCachedLeft =4825
                    LayoutCachedTop =2155
                    LayoutCachedWidth =6243
                    LayoutCachedHeight =2439
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =4365
                    Top =56
                    Width =1020
                    Height =270
                    ColumnOrder =1
                    TabIndex =13
                    BackColor =12632256
                    BorderColor =9868950
                    ForeColor =12632256
                    Name ="wert"
                    ControlSource ="wert"
                    FontName ="Arial"
                    ControlTipText ="ID"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =4365
                    LayoutCachedTop =56
                    LayoutCachedWidth =5385
                    LayoutCachedHeight =326
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =247
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =5329
                    Top =56
                    Width =1020
                    Height =270
                    ColumnOrder =2
                    TabIndex =14
                    BackColor =12632256
                    BorderColor =9868950
                    ForeColor =12632256
                    Name ="einheit"
                    ControlSource ="einheit"
                    FontName ="Arial"
                    ControlTipText ="ID"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =5329
                    LayoutCachedTop =56
                    LayoutCachedWidth =6349
                    LayoutCachedHeight =326
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =3180
                    Top =2155
                    Width =1644
                    Height =284
                    TabIndex =25
                    ForeColor =0
                    Name ="btnEinheit"
                    Caption ="Einheit"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="top1"
                    ControlTipText ="Lexikon mit Einheiten anzeigen"

                    LayoutCachedLeft =3180
                    LayoutCachedTop =2155
                    LayoutCachedWidth =4824
                    LayoutCachedHeight =2439
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =63
                    Top =2155
                    Width =1644
                    Height =284
                    TabIndex =26
                    ForeColor =0
                    Name ="btnWert"
                    Caption ="Wert"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="top1"
                    ControlTipText ="Hinweis zur Anzeige Wert und Einheit"

                    LayoutCachedLeft =63
                    LayoutCachedTop =2155
                    LayoutCachedWidth =1707
                    LayoutCachedHeight =2439
                    Overlaps =1
                End
                Begin TextBox
                    ScrollBars =2
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =1
                    Left =1716
                    Top =1814
                    Width =3951
                    Height =284
                    ColumnOrder =0
                    TabIndex =8
                    BackColor =15263976
                    Name ="BemStichwort"
                    ControlSource ="BemStichwort"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m1"
                    ControlTipText ="Stichwort"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    TextFormat =1

                    LayoutCachedLeft =1716
                    LayoutCachedTop =1814
                    LayoutCachedWidth =5667
                    LayoutCachedHeight =2098
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =87
                    Left =60
                    Top =1485
                    Width =1644
                    Height =284
                    TabIndex =21
                    ForeColor =0
                    Name ="btnStichwort"
                    Caption ="Stichwort"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =60
                    LayoutCachedTop =1485
                    LayoutCachedWidth =1704
                    LayoutCachedHeight =1769
                    Overlaps =1
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =87
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =5670
                    Left =5677
                    Top =1814
                    Width =291
                    Height =284
                    ColumnOrder =14
                    TabIndex =7
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="comBemStichwort"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5670"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Bemerkungen zum Stichwort\015\012Die Aufklappliste zeigt alle jemals getätigten "
                        "Einträge zu diesem Stichwort\015\012Wenn ein Wert mit einer Einheit vermutet wir"
                        "d, wird der Wert und die Einheit unten separat angezeigt."

                    LayoutCachedLeft =5677
                    LayoutCachedTop =1814
                    LayoutCachedWidth =5968
                    LayoutCachedHeight =2098
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
            End
        End
        Begin Section
            Height =270
            BackColor =12632256
            Name ="Det"
            Begin
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Width =285
                    Height =270
                    BackColor =12632256
                    Name ="f1"
                    ControlSource ="StichwortNr"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Position"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =567
                    Width =2835
                    Height =270
                    TabIndex =1
                    BackColor =12632256
                    Name ="f2"
                    ControlSource ="Stichwort"
                    FontName ="Arial"
                    ControlTipText ="Stichwort"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =567
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =270
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3402
                    Width =1985
                    Height =270
                    TabIndex =2
                    BackColor =12632256
                    Name ="f3"
                    ControlSource ="BemStichwort"
                    FontName ="Arial"
                    ControlTipText ="Stichwort"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    TextFormat =1

                    LayoutCachedLeft =3402
                    LayoutCachedWidth =5387
                    LayoutCachedHeight =270
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    IsHyperlink = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =5387
                    Width =1437
                    Height =270
                    TabIndex =3
                    BackColor =12632256
                    ForeColor =16711680
                    Name ="StichwortHyperlinkDet"
                    ControlSource ="HL"
                    FontName ="Arial"
                    Tag ="Del2"
                    ControlTipText ="Dateiname / Hyperlink mit rechter Maustate öffnen"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =5387
                    LayoutCachedWidth =6824
                    LayoutCachedHeight =270
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =340
                    Top =56
                    Width =215
                    Height =199
                    TabIndex =4
                    Name ="PrintMarkerStichwortDet"
                    ControlSource ="PrintMarkerStichwort"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Soll dieser Datensatz ausgedruckt werden?"

                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =-2147483633
            Name ="ff"
        End
    End
End
CodeBehindForm
' See "UF_Stichwort.cls"
