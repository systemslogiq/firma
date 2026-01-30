Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =5
    PictureSizeMode =1
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =17010
    DatasheetFontHeight =10
    ItemSuffix =41
    Right =28035
    Bottom =12600
    PaintPalette = Begin
        0x000301000000000000000000
    End
    OnUnload ="[Event Procedure]"
    Tag ="Chronik"
    RecSrcDt = Begin
        0x7ffe8f6bd91fe440
    End
    Caption ="Chronik"
    BeforeUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
    ShowPageMargins =0
    PictureSizeMode =1
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            FontName ="Arial"
        End
        Begin Rectangle
            BackStyle =0
            BorderWidth =1
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderWidth =1
            BorderLineStyle =0
            Width =1701
        End
        Begin Image
            SpecialEffect =1
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
            SpecialEffect =1
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin CheckBox
            SpecialEffect =1
            BorderWidth =3
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderColor =12632256
        End
        Begin BoundObjectFrame
            SpecialEffect =1
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            BorderColor =12632256
            FontName ="Arial"
        End
        Begin ListBox
            SpecialEffect =1
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontName ="Arial"
        End
        Begin ComboBox
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            BorderColor =12632256
            FontName ="Arial"
        End
        Begin Subform
            SpecialEffect =1
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            SpecialEffect =1
            BackStyle =0
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
            FontName ="Arial"
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
            Height =10530
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =6237
                    Top =137
                    Width =912
                    Height =255
                    FontWeight =700
                    BackColor =12632256
                    BorderColor =13209
                    ForeColor =128
                    Name ="Jahre"
                    ControlSource ="Jahre"
                    OnEnter ="[Event Procedure]"
                    Tag ="m1"

                    LayoutCachedLeft =6237
                    LayoutCachedTop =137
                    LayoutCachedWidth =7149
                    LayoutCachedHeight =392
                End
                Begin ComboBox
                    OverlapFlags =85
                    ListRows =30
                    Left =6237
                    Top =436
                    Width =5670
                    Height =255
                    FontWeight =700
                    TabIndex =2
                    BorderColor =13209
                    Name ="Zeitraum"
                    ControlSource ="Zeitraum"
                    RowSourceType ="Table/Query"
                    Tag ="m2"

                    LayoutCachedLeft =6237
                    LayoutCachedTop =436
                    LayoutCachedWidth =11907
                    LayoutCachedHeight =691
                End
                Begin ComboBox
                    OverlapFlags =85
                    ListRows =20
                    Left =6237
                    Top =1039
                    Width =5670
                    Height =255
                    FontWeight =700
                    TabIndex =8
                    BorderColor =13209
                    Name ="Wer"
                    ControlSource ="Wer"
                    RowSourceType ="Table/Query"
                    DefaultValue ="\"Familie\""

                    LayoutCachedLeft =6237
                    LayoutCachedTop =1039
                    LayoutCachedWidth =11907
                    LayoutCachedHeight =1294
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    Left =6237
                    Top =760
                    Width =912
                    Height =255
                    FontWeight =700
                    TabIndex =5
                    BorderColor =13209
                    Name ="DatumEreignis"
                    ControlSource ="DatumEreignis"
                    Format ="Short Date"
                    AfterUpdate ="[Event Procedure]"
                    OnKeyPress ="[Event Procedure]"
                    Tag ="del1"
                    ControlTipText ="Datum des Ereignisses\015\012kann mit Plus- oder Minus-Taste um einen Tag geände"
                        "rt werden"

                    LayoutCachedLeft =6237
                    LayoutCachedTop =760
                    LayoutCachedWidth =7149
                    LayoutCachedHeight =1015
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =7653
                    Top =737
                    Width =276
                    Height =276
                    TabIndex =6
                    Name ="btnDatumEreignis"
                    Caption ="Datum"
                    StatusBarText ="Fax"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadad000000adada ,
                        0xada00ffffff00dadda0ffff00ffff0daad0ffffffff0f0add0ffffffff0fff0a ,
                        0xa0fffffff0ffff0dd0f0fff00fff0f0aa0f0fff00fff0f0dd0fffffff0ffff0a ,
                        0xa0ffffffff0fff0dda0ffffffffff0daad0ffff00ffff0addad00ffffff00ada ,
                        0xadada000000dadad000000000000000000000000000000000000000000000000 ,
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
                    ControlTipText ="Kalender öffnen"

                    LayoutCachedLeft =7653
                    LayoutCachedTop =737
                    LayoutCachedWidth =7929
                    LayoutCachedHeight =1013
                    Overlaps =1
                End
                Begin Label
                    OverlapFlags =85
                    Left =4956
                    Top =137
                    Width =1140
                    Height =255
                    Name ="Bezeichnungsfeld29"
                    Caption ="Jahr"
                    LayoutCachedLeft =4956
                    LayoutCachedTop =137
                    LayoutCachedWidth =6096
                    LayoutCachedHeight =392
                End
                Begin Label
                    OverlapFlags =85
                    Left =4956
                    Top =760
                    Width =1140
                    Height =255
                    Name ="Bezeichnungsfeld30"
                    Caption ="Datum"
                    LayoutCachedLeft =4956
                    LayoutCachedTop =760
                    LayoutCachedWidth =6096
                    LayoutCachedHeight =1015
                End
                Begin Label
                    OverlapFlags =85
                    Left =4956
                    Top =432
                    Width =1140
                    Height =255
                    Name ="Bezeichnungsfeld31"
                    Caption ="Zeitraum"
                    LayoutCachedLeft =4956
                    LayoutCachedTop =432
                    LayoutCachedWidth =6096
                    LayoutCachedHeight =687
                End
                Begin Label
                    OverlapFlags =93
                    Left =4956
                    Top =1035
                    Width =1140
                    Height =255
                    Name ="Bezeichnungsfeld32"
                    Caption ="Wer"
                    LayoutCachedLeft =4956
                    LayoutCachedTop =1035
                    LayoutCachedWidth =6096
                    LayoutCachedHeight =1290
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    TextAlign =1
                    Left =15309
                    Top =392
                    Height =255
                    TabIndex =3
                    BackColor =12632256
                    BorderColor =0
                    ForeColor =8421504
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    Format ="General Date"
                    StatusBarText ="geändert am .."
                    DefaultValue ="Date()"
                    ControlTipText ="letzte Änderung am.."

                    LayoutCachedLeft =15309
                    LayoutCachedTop =392
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =647
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =1
                            Left =14175
                            Top =392
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld38"
                            Caption ="letzte\015\012Änderung"
                            LayoutCachedLeft =14175
                            LayoutCachedTop =392
                            LayoutCachedWidth =15309
                            LayoutCachedHeight =647
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    Left =15309
                    Top =137
                    Height =255
                    TabIndex =1
                    BackColor =12632256
                    BorderColor =0
                    ForeColor =8421504
                    Name ="whoUpdate"
                    ControlSource ="WhoUpdate"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    ControlTipText ="Adresse Update von .."

                    LayoutCachedLeft =15309
                    LayoutCachedTop =137
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =392
                    Begin
                        Begin Label
                            OverlapFlags =95
                            TextAlign =1
                            Left =14175
                            Top =137
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld37"
                            Caption ="geändert\015\012von"
                            LayoutCachedLeft =14175
                            LayoutCachedTop =137
                            LayoutCachedWidth =15309
                            LayoutCachedHeight =392
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    TextAlign =1
                    Left =15309
                    Top =647
                    Height =255
                    TabIndex =4
                    BackColor =12632256
                    BorderColor =0
                    ForeColor =8421504
                    Name ="chronikErfasst"
                    ControlSource ="ChronikErfasst"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    ControlTipText ="Adresse erfasst am ..."

                    LayoutCachedLeft =15309
                    LayoutCachedTop =647
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =902
                    Begin
                        Begin Label
                            OverlapFlags =95
                            TextAlign =1
                            Left =14175
                            Top =647
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld39"
                            Caption ="erfasst am"
                            LayoutCachedLeft =14175
                            LayoutCachedTop =647
                            LayoutCachedWidth =15309
                            LayoutCachedHeight =902
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    BorderWidth =2
                    OverlapFlags =85
                    Left =6237
                    Top =1333
                    Width =10773
                    Height =2445
                    FontWeight =700
                    TabIndex =9
                    BorderColor =13209
                    Name ="Ereignis"
                    ControlSource ="Ereignis"
                    Tag ="m3"

                    LayoutCachedLeft =6237
                    LayoutCachedTop =1333
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =3778
                End
                Begin Label
                    OverlapFlags =215
                    Left =4956
                    Top =1270
                    Width =1140
                    Height =225
                    Name ="Bezeichnungsfeld33"
                    Caption ="Bemerkungen"
                    LayoutCachedLeft =4956
                    LayoutCachedTop =1270
                    LayoutCachedWidth =6096
                    LayoutCachedHeight =1495
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =1
                    Left =15309
                    Top =902
                    Height =255
                    TabIndex =7
                    BackColor =12632256
                    BorderColor =0
                    ForeColor =8421504
                    Name ="MarkerChronik"
                    ControlSource ="MarkerChronik"
                    DefaultValue ="Date()"
                    ControlTipText ="Marker Chronik"

                    LayoutCachedLeft =15309
                    LayoutCachedTop =902
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =1157
                    Begin
                        Begin Label
                            OverlapFlags =95
                            TextAlign =1
                            Left =14175
                            Top =902
                            Width =1134
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld35"
                            Caption ="markiert"
                            LayoutCachedLeft =14175
                            LayoutCachedTop =902
                            LayoutCachedWidth =15309
                            LayoutCachedHeight =1157
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =24
                    Top =3424
                    Width =4854
                    Height =7073
                    TabIndex =10
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;907"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"

                    LayoutCachedLeft =24
                    LayoutCachedTop =3424
                    LayoutCachedWidth =4878
                    LayoutCachedHeight =10497
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =24
                    Top =24
                    Width =4854
                    Height =2960
                    TabIndex =11
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;567"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="=Year(date())"
                    FontName ="Tahoma"

                    LayoutCachedLeft =24
                    LayoutCachedTop =24
                    LayoutCachedWidth =4878
                    LayoutCachedHeight =2984
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =1
                    IMESentenceMode =3
                    Left =984
                    Top =3097
                    Width =3549
                    FontWeight =600
                    TabIndex =12
                    BackColor =12975858
                    BorderColor =0
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"
                    AsianLineBreak =255

                    LayoutCachedLeft =984
                    LayoutCachedTop =3097
                    LayoutCachedWidth =4533
                    LayoutCachedHeight =3337
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =1
                    IMESentenceMode =3
                    Left =24
                    Top =3097
                    Width =849
                    Height =227
                    FontWeight =600
                    TabIndex =13
                    BackColor =12975858
                    BorderColor =0
                    ForeColor =4210816
                    Name ="countRec"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =24
                    LayoutCachedTop =3097
                    LayoutCachedWidth =873
                    LayoutCachedHeight =3324
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    ListRows =20
                    ListWidth =1701
                    Left =4587
                    Top =3054
                    Width =291
                    Height =270
                    TabIndex =14
                    BackColor =12975858
                    BorderColor =0
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Anrede auswählen"

                    LayoutCachedLeft =4587
                    LayoutCachedTop =3054
                    LayoutCachedWidth =4878
                    LayoutCachedHeight =3324
                End
                Begin Tab
                    OverlapFlags =85
                    BackStyle =1
                    Left =5100
                    Top =3990
                    Width =11910
                    Height =6540
                    TabIndex =15
                    Name ="regd"
                    FontName ="Tahoma"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =5100
                    LayoutCachedTop =3990
                    LayoutCachedWidth =17010
                    LayoutCachedHeight =10530
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =5238
                            Top =4395
                            Width =11634
                            Height =6000
                            Name ="pg1"
                            Caption ="pro Jahr"
                            LayoutCachedLeft =5238
                            LayoutCachedTop =4395
                            LayoutCachedWidth =16872
                            LayoutCachedHeight =10395
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =5326
                                    Top =4440
                                    Width =11316
                                    Height =5847
                                    BackColor =15066597
                                    Name ="lstJahr"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;1701;1701"
                                    AfterUpdate ="[Event Procedure]"

                                    LayoutCachedLeft =5326
                                    LayoutCachedTop =4440
                                    LayoutCachedWidth =16642
                                    LayoutCachedHeight =10287
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5238
                            Top =4395
                            Width =11636
                            Height =6000
                            Name ="pg0"
                            Caption ="Stichworte"
                            LayoutCachedLeft =5238
                            LayoutCachedTop =4395
                            LayoutCachedWidth =16874
                            LayoutCachedHeight =10395
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =7
                                    Left =7733
                                    Top =4441
                                    Width =9072
                                    Height =5874
                                    BackColor =15066597
                                    Name ="lstStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;297;2268;3402;1134;856"

                                    LayoutCachedLeft =7733
                                    LayoutCachedTop =4441
                                    LayoutCachedWidth =16805
                                    LayoutCachedHeight =10315
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5293
                                    Top =4441
                                    Width =2268
                                    Height =5874
                                    BackColor =12975858
                                    Name ="lstStichwortAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    ControlTipText ="Handling der (markierten) Stichworte"

                                    LayoutCachedLeft =5293
                                    LayoutCachedTop =4441
                                    LayoutCachedWidth =7561
                                    LayoutCachedHeight =10315
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =5237
                            Top =4395
                            Width =11637
                            Height =6000
                            Name ="pageMarker"
                            Caption ="Chronik-Einträge managen"
                            LayoutCachedLeft =5237
                            LayoutCachedTop =4395
                            LayoutCachedWidth =16874
                            LayoutCachedHeight =10395
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =7733
                                    Top =4420
                                    Width =9072
                                    Height =5964
                                    BackColor =15066597
                                    Name ="lstM"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;1701;1701"
                                    AfterUpdate ="[Event Procedure]"

                                    LayoutCachedLeft =7733
                                    LayoutCachedTop =4420
                                    LayoutCachedWidth =16805
                                    LayoutCachedHeight =10384
                                End
                                Begin TextBox
                                    Locked = NotDefault
                                    FELineBreak = NotDefault
                                    OverlapFlags =215
                                    TextAlign =2
                                    BackStyle =1
                                    IMESentenceMode =3
                                    Left =5237
                                    Top =4420
                                    Width =2268
                                    Height =227
                                    FontWeight =600
                                    BackColor =12975858
                                    BorderColor =0
                                    ForeColor =4210816
                                    Name ="countM"
                                    FontName ="Tahoma"
                                    ControlTipText ="Anzahl der von mir markierten Datensätze"
                                    AsianLineBreak =255

                                    LayoutCachedLeft =5237
                                    LayoutCachedTop =4420
                                    LayoutCachedWidth =7505
                                    LayoutCachedHeight =4647
                                End
                                Begin ListBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5238
                                    Top =4674
                                    Width =2268
                                    Height =5710
                                    BackColor =12975858
                                    Name ="lstMdo"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="0"
                                    ControlTipText ="Handling der markierten Daten"

                                    LayoutCachedLeft =5238
                                    LayoutCachedTop =4674
                                    LayoutCachedWidth =7506
                                    LayoutCachedHeight =10384
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =5238
                            Top =4395
                            Width =11636
                            Height =6000
                            Name ="pg3"
                            Caption ="top 100"
                            LayoutCachedLeft =5238
                            LayoutCachedTop =4395
                            LayoutCachedWidth =16874
                            LayoutCachedHeight =10395
                            Begin
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    SpecialEffect =2
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    ColumnCount =5
                                    Left =7733
                                    Top =4456
                                    Width =9072
                                    Height =5932
                                    BackColor =15066597
                                    Name ="lstTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;1134;1701;1701"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"

                                    LayoutCachedLeft =7733
                                    LayoutCachedTop =4456
                                    LayoutCachedWidth =16805
                                    LayoutCachedHeight =10388
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    BorderWidth =1
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    Left =5313
                                    Top =4456
                                    Width =2268
                                    Height =5932
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="comTop"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;2268"
                                    AfterUpdate ="[Event Procedure]"
                                    DefaultValue ="1"

                                    LayoutCachedLeft =5313
                                    LayoutCachedTop =4456
                                    LayoutCachedWidth =7581
                                    LayoutCachedHeight =10388
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    Left =8578
                    Top =137
                    Width =1309
                    Height =255
                    TabIndex =16
                    BackColor =12632256
                    BorderColor =0
                    ForeColor =8421504
                    Name ="f0"
                    ControlSource ="NrChronik"
                    DefaultValue ="Date()"
                    ControlTipText ="ID des Datensatzes"

                    LayoutCachedLeft =8578
                    LayoutCachedTop =137
                    LayoutCachedWidth =9887
                    LayoutCachedHeight =392
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =8125
                            Top =137
                            Width =390
                            Height =255
                            BackColor =12632256
                            Name ="Bezeichnungsfeld40"
                            Caption ="ID"
                            LayoutCachedLeft =8125
                            LayoutCachedTop =137
                            LayoutCachedWidth =8515
                            LayoutCachedHeight =392
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Chronik.cls"
