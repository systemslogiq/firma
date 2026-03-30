Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =21660
    RowHeight =225
    ItemSuffix =190
    Left =29430
    Top =3030
    Right =-8191
    Bottom =14895
    Tag ="Tank"
    RecSrcDt = Begin
        0xd10005098ad8e440
    End
    Caption ="Tank-Übersicht"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    AllowDatasheetView =0
    FetchDefaults =0
    FilterOnLoad =0
    FetchDefaults =0
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
            FELineBreak = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
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
        Begin Section
            Height =13842
            Name ="Det"
            AlternateBackColor =15658734
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =5
                    Left =120
                    Top =1879
                    Width =7938
                    Height =4586
                    ColumnOrder =0
                    BackColor =-2147483633
                    ForeColor =0
                    Name ="lstTank"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="851;3969;567;1134;1134"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Übersichtsliste der Tanks.\015\012Click zeigt rechts den Tankverlauf an."

                    LayoutCachedLeft =120
                    LayoutCachedTop =1879
                    LayoutCachedWidth =8058
                    LayoutCachedHeight =6465
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =120
                    Top =120
                    Width =7938
                    Height =1640
                    FontWeight =700
                    TabIndex =1
                    BackColor =10092543
                    ForeColor =0
                    Name ="lstTankAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5103"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ControlTipText ="Liste möglicher Aktionen im Tanklager."

                    LayoutCachedLeft =120
                    LayoutCachedTop =120
                    LayoutCachedWidth =8058
                    LayoutCachedHeight =1760
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =93
                    Left =9442
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =16774552
                    BorderColor =65535
                    Name ="m102"
                    OnClick ="[Event Procedure]"
                    Tag ="02.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =9442
                    LayoutCachedTop =5985
                    LayoutCachedWidth =10247
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =8632
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m101"
                    OnClick ="[Event Procedure]"
                    Tag ="01.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =8632
                    LayoutCachedTop =5985
                    LayoutCachedWidth =9437
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =10251
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =16774552
                    BorderColor =65535
                    Name ="m103"
                    OnClick ="[Event Procedure]"
                    Tag ="03.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =10251
                    LayoutCachedTop =5985
                    LayoutCachedWidth =11056
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =11061
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m104"
                    OnClick ="[Event Procedure]"
                    Tag ="04.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =11061
                    LayoutCachedTop =5985
                    LayoutCachedWidth =11866
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =11871
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m105"
                    OnClick ="[Event Procedure]"
                    Tag ="05.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =11871
                    LayoutCachedTop =5985
                    LayoutCachedWidth =12676
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =12680
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m106"
                    OnClick ="[Event Procedure]"
                    Tag ="06.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =12680
                    LayoutCachedTop =5985
                    LayoutCachedWidth =13485
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =13490
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m107"
                    OnClick ="[Event Procedure]"
                    Tag ="07.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =13490
                    LayoutCachedTop =5985
                    LayoutCachedWidth =14295
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =14300
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m108"
                    OnClick ="[Event Procedure]"
                    Tag ="08.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =14300
                    LayoutCachedTop =5985
                    LayoutCachedWidth =15105
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =15109
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =16774552
                    BorderColor =65535
                    Name ="m109"
                    OnClick ="[Event Procedure]"
                    Tag ="09.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =15109
                    LayoutCachedTop =5985
                    LayoutCachedWidth =15914
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =15919
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =16774552
                    BorderColor =65535
                    Name ="m110"
                    OnClick ="[Event Procedure]"
                    Tag ="10.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =15919
                    LayoutCachedTop =5985
                    LayoutCachedWidth =16724
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =16729
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m111"
                    OnClick ="[Event Procedure]"
                    Tag ="11.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =16729
                    LayoutCachedTop =5985
                    LayoutCachedWidth =17534
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =17538
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m112"
                    OnClick ="[Event Procedure]"
                    Tag ="12.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =17538
                    LayoutCachedTop =5985
                    LayoutCachedWidth =18343
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =18348
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m113"
                    OnClick ="[Event Procedure]"
                    Tag ="13.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =18348
                    LayoutCachedTop =5985
                    LayoutCachedWidth =19153
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =95
                    Left =19158
                    Top =5985
                    Width =805
                    Height =1335
                    BackColor =10526303
                    BorderColor =65535
                    Name ="m114"
                    OnClick ="[Event Procedure]"
                    Tag ="14.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =19158
                    LayoutCachedTop =5985
                    LayoutCachedWidth =19963
                    LayoutCachedHeight =7320
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =8
                    Left =120
                    Top =6510
                    Width =7938
                    Height =5403
                    TabIndex =2
                    BackColor =-2147483633
                    ForeColor =0
                    Name ="lstVerlauf"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;0;1134;1418;1134;2835;1134"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste der Ein-/ Auslagerungen.\015\012Einfach-Click stellt das angeclickte Datum"
                        " in die 4. Stelle auf der X-Achse\015\012Den hier markierten Vorgang können Sie "
                        "im gelben Feld öffnen."

                    LayoutCachedLeft =120
                    LayoutCachedTop =6510
                    LayoutCachedWidth =8058
                    LayoutCachedHeight =11913
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =19158
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t14"
                    Caption ="14.03"
                    LayoutCachedLeft =19158
                    LayoutCachedTop =7815
                    LayoutCachedWidth =19963
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =18348
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t13"
                    Caption ="13.03"
                    LayoutCachedLeft =18348
                    LayoutCachedTop =7815
                    LayoutCachedWidth =19153
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =17538
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t12"
                    Caption ="12.03"
                    LayoutCachedLeft =17538
                    LayoutCachedTop =7815
                    LayoutCachedWidth =18343
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =16729
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t11"
                    Caption ="11.03"
                    LayoutCachedLeft =16729
                    LayoutCachedTop =7815
                    LayoutCachedWidth =17534
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =15919
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t10"
                    Caption ="10.03"
                    LayoutCachedLeft =15919
                    LayoutCachedTop =7815
                    LayoutCachedWidth =16724
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =15109
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t09"
                    Caption ="09.03"
                    LayoutCachedLeft =15109
                    LayoutCachedTop =7815
                    LayoutCachedWidth =15914
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =14300
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t08"
                    Caption ="08.03"
                    LayoutCachedLeft =14300
                    LayoutCachedTop =7815
                    LayoutCachedWidth =15105
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =13490
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t07"
                    Caption ="07.03"
                    LayoutCachedLeft =13490
                    LayoutCachedTop =7815
                    LayoutCachedWidth =14295
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =12680
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t06"
                    Caption ="06.03"
                    LayoutCachedLeft =12680
                    LayoutCachedTop =7815
                    LayoutCachedWidth =13485
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =11871
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t05"
                    Caption ="05.03"
                    LayoutCachedLeft =11871
                    LayoutCachedTop =7815
                    LayoutCachedWidth =12676
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =11061
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    FontWeight =700
                    ForeColor =255
                    Name ="t04"
                    Caption ="04.03"
                    LayoutCachedLeft =11061
                    LayoutCachedTop =7815
                    LayoutCachedWidth =11866
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =10251
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t03"
                    Caption ="03.03"
                    LayoutCachedLeft =10251
                    LayoutCachedTop =7815
                    LayoutCachedWidth =11056
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextAlign =2
                    Left =9442
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t02"
                    Caption ="02.03"
                    LayoutCachedLeft =9442
                    LayoutCachedTop =7815
                    LayoutCachedWidth =10247
                    LayoutCachedHeight =8124
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =87
                    TextAlign =2
                    Left =8632
                    Top =7815
                    Width =805
                    Height =309
                    FontSize =10
                    ForeColor =0
                    Name ="t01"
                    Caption ="01.03"
                    LayoutCachedLeft =8632
                    LayoutCachedTop =7815
                    LayoutCachedWidth =9437
                    LayoutCachedHeight =8124
                End
                Begin CommandButton
                    OverlapFlags =93
                    Left =8625
                    Top =1080
                    Width =576
                    Height =576
                    TabIndex =3
                    Name ="btnPrev"
                    Caption ="Befehl139"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xdddddddddddddddddddddddddcddddddddddddddccdddddddddddddcccdddddd ,
                        0xddddddccccdddddddddddcccccddddddddddddccccdddddddddddddcccdddddd ,
                        0xddddddddccdddddddddddddddcdddddddddddddddddddddddddddddddddddddd ,
                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
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
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="um eine Woche zurück"

                    LayoutCachedLeft =8625
                    LayoutCachedTop =1080
                    LayoutCachedWidth =9201
                    LayoutCachedHeight =1656
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =93
                    TextFontFamily =0
                    Left =19396
                    Top =1080
                    Width =576
                    Height =576
                    TabIndex =4
                    Name ="btnNext"
                    Caption ="Befehl139"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xddddddddddddddddddddddcdddddddddddddddccddddddddddddddcccddddddd ,
                        0xddddddccccddddddddddddcccccdddddddddddccccddddddddddddcccddddddd ,
                        0xddddddccddddddddddddddcddddddddddddddddddddddddddddddddddddddddd ,
                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
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
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="um eine Woche vorwärts"

                    LayoutCachedLeft =19396
                    LayoutCachedTop =1080
                    LayoutCachedWidth =19972
                    LayoutCachedHeight =1656
                    Overlaps =1
                End
                Begin Rectangle
                    OverlapFlags =223
                    Left =8632
                    Top =1650
                    Width =11340
                    Height =5670
                    Name ="reV"
                    LayoutCachedLeft =8632
                    LayoutCachedTop =1650
                    LayoutCachedWidth =19972
                    LayoutCachedHeight =7320
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =20115
                    Top =7080
                    Width =1545
                    Height =240
                    Name ="lblleer"
                    LayoutCachedLeft =20115
                    LayoutCachedTop =7080
                    LayoutCachedWidth =21660
                    LayoutCachedHeight =7320
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =20115
                    Top =1650
                    Width =1545
                    Height =240
                    Name ="lblVoll"
                    LayoutCachedLeft =20115
                    LayoutCachedTop =1650
                    LayoutCachedWidth =21660
                    LayoutCachedHeight =1890
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =20115
                    Top =4260
                    Width =1545
                    Height =240
                    Name ="lblhalb"
                    LayoutCachedLeft =20115
                    LayoutCachedTop =4260
                    LayoutCachedWidth =21660
                    LayoutCachedHeight =4500
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =9978
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m302"
                    OnClick ="[Event Procedure]"
                    Tag ="02.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =9978
                    LayoutCachedTop =7320
                    LayoutCachedWidth =10246
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =9168
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m301"
                    OnClick ="[Event Procedure]"
                    Tag ="01.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =9168
                    LayoutCachedTop =7320
                    LayoutCachedWidth =9436
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =10787
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m303"
                    OnClick ="[Event Procedure]"
                    Tag ="03.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =10787
                    LayoutCachedTop =7320
                    LayoutCachedWidth =11055
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =11597
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m304"
                    OnClick ="[Event Procedure]"
                    Tag ="04.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =11597
                    LayoutCachedTop =7320
                    LayoutCachedWidth =11865
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =12407
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m305"
                    OnClick ="[Event Procedure]"
                    Tag ="05.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =12407
                    LayoutCachedTop =7320
                    LayoutCachedWidth =12675
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =13216
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m306"
                    OnClick ="[Event Procedure]"
                    Tag ="06.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =13216
                    LayoutCachedTop =7320
                    LayoutCachedWidth =13484
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =14026
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m307"
                    OnClick ="[Event Procedure]"
                    Tag ="07.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =14026
                    LayoutCachedTop =7320
                    LayoutCachedWidth =14294
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =14836
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m308"
                    OnClick ="[Event Procedure]"
                    Tag ="08.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =14836
                    LayoutCachedTop =7320
                    LayoutCachedWidth =15104
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =15645
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m309"
                    OnClick ="[Event Procedure]"
                    Tag ="09.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =15645
                    LayoutCachedTop =7320
                    LayoutCachedWidth =15913
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =16455
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m310"
                    OnClick ="[Event Procedure]"
                    Tag ="10.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =16455
                    LayoutCachedTop =7320
                    LayoutCachedWidth =16723
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =17265
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m311"
                    OnClick ="[Event Procedure]"
                    Tag ="11.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =17265
                    LayoutCachedTop =7320
                    LayoutCachedWidth =17533
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =18074
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m312"
                    OnClick ="[Event Procedure]"
                    Tag ="12.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =18074
                    LayoutCachedTop =7320
                    LayoutCachedWidth =18342
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =18884
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m313"
                    OnClick ="[Event Procedure]"
                    Tag ="13.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =18884
                    LayoutCachedTop =7320
                    LayoutCachedWidth =19152
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =87
                    Left =19694
                    Top =7320
                    Width =268
                    Height =0
                    BackColor =255
                    BorderColor =65280
                    Name ="m314"
                    OnClick ="[Event Procedure]"
                    Tag ="14.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =19694
                    LayoutCachedTop =7320
                    LayoutCachedWidth =19962
                    LayoutCachedHeight =7320
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =9442
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =16774552
                    BorderColor =16711680
                    Name ="m202"
                    OnClick ="[Event Procedure]"
                    Tag ="02.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =9442
                    LayoutCachedTop =5848
                    LayoutCachedWidth =10247
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =215
                    Left =8632
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m201"
                    OnClick ="[Event Procedure]"
                    Tag ="01.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =8632
                    LayoutCachedTop =5848
                    LayoutCachedWidth =9437
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =10251
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =16774552
                    BorderColor =16711680
                    Name ="m203"
                    OnClick ="[Event Procedure]"
                    Tag ="03.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =10251
                    LayoutCachedTop =5848
                    LayoutCachedWidth =11056
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =11061
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m204"
                    OnClick ="[Event Procedure]"
                    Tag ="04.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =11061
                    LayoutCachedTop =5848
                    LayoutCachedWidth =11866
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =11871
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m205"
                    OnClick ="[Event Procedure]"
                    Tag ="05.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =11871
                    LayoutCachedTop =5848
                    LayoutCachedWidth =12676
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =12680
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m206"
                    OnClick ="[Event Procedure]"
                    Tag ="06.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =12680
                    LayoutCachedTop =5848
                    LayoutCachedWidth =13485
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =13490
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m207"
                    OnClick ="[Event Procedure]"
                    Tag ="07.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =13490
                    LayoutCachedTop =5848
                    LayoutCachedWidth =14295
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =14300
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m208"
                    OnClick ="[Event Procedure]"
                    Tag ="08.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =14300
                    LayoutCachedTop =5848
                    LayoutCachedWidth =15105
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =15109
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =16774552
                    BorderColor =16711680
                    Name ="m209"
                    OnClick ="[Event Procedure]"
                    Tag ="09.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =15109
                    LayoutCachedTop =5848
                    LayoutCachedWidth =15914
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =15919
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =16774552
                    BorderColor =16711680
                    Name ="m210"
                    OnClick ="[Event Procedure]"
                    Tag ="10.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =15919
                    LayoutCachedTop =5848
                    LayoutCachedWidth =16724
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =16729
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m211"
                    OnClick ="[Event Procedure]"
                    Tag ="11.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =16729
                    LayoutCachedTop =5848
                    LayoutCachedWidth =17534
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =17538
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m212"
                    OnClick ="[Event Procedure]"
                    Tag ="12.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =17538
                    LayoutCachedTop =5848
                    LayoutCachedWidth =18343
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =223
                    Left =18348
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m213"
                    OnClick ="[Event Procedure]"
                    Tag ="13.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =18348
                    LayoutCachedTop =5848
                    LayoutCachedWidth =19153
                    LayoutCachedHeight =5985
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    BorderWidth =1
                    OverlapFlags =215
                    Left =19158
                    Top =5848
                    Width =805
                    Height =137
                    BackColor =10526303
                    BorderColor =16711680
                    Name ="m214"
                    OnClick ="[Event Procedure]"
                    Tag ="14.03 ==> TOTAL in MT : \011408\015\012\015\012gelb T1-Ware             \011370\015"
                        "\012blau T2-Ware             \01138\015\012grün T2-Ware EU          \0110"
                    LayoutCachedLeft =19158
                    LayoutCachedTop =5848
                    LayoutCachedWidth =19963
                    LayoutCachedHeight =5985
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =95
                    Left =11464
                    Top =1647
                    Width =0
                    Height =5670
                    BorderColor =2366701
                    Name ="linHeute"
                    LayoutCachedLeft =11464
                    LayoutCachedTop =1647
                    LayoutCachedWidth =11464
                    LayoutCachedHeight =7317
                End
                Begin Line
                    BorderWidth =2
                    OverlapFlags =87
                    Left =8626
                    Top =4482
                    Width =11340
                    Name ="lin50"
                    LayoutCachedLeft =8626
                    LayoutCachedTop =4482
                    LayoutCachedWidth =19966
                    LayoutCachedHeight =4482
                    BorderThemeColorIndex =3
                    BorderShade =90.0
                End
                Begin OptionGroup
                    SpecialEffect =4
                    BorderWidth =3
                    OverlapFlags =85
                    Left =10374
                    Top =453
                    Width =1386
                    Height =943
                    TabIndex =5
                    Name ="ogTank"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"

                    LayoutCachedLeft =10374
                    LayoutCachedTop =453
                    LayoutCachedWidth =11760
                    LayoutCachedHeight =1396
                    Begin
                        Begin CheckBox
                            OverlapFlags =87
                            Left =10560
                            Top =691
                            OptionValue =1
                            Name ="Kontrollkästchen184"

                            LayoutCachedLeft =10560
                            LayoutCachedTop =691
                            LayoutCachedWidth =10820
                            LayoutCachedHeight =931
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =10790
                                    Top =663
                                    Width =450
                                    Height =240
                                    Name ="Bezeichnungsfeld185"
                                    Caption ="Tank"
                                    LayoutCachedLeft =10790
                                    LayoutCachedTop =663
                                    LayoutCachedWidth =11240
                                    LayoutCachedHeight =903
                                End
                            End
                        End
                        Begin CheckBox
                            OverlapFlags =87
                            Left =10560
                            Top =1021
                            OptionValue =2
                            Name ="Kontrollkästchen186"

                            LayoutCachedLeft =10560
                            LayoutCachedTop =1021
                            LayoutCachedWidth =10820
                            LayoutCachedHeight =1261
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =10790
                                    Top =993
                                    Width =645
                                    Height =240
                                    Name ="Bezeichnungsfeld187"
                                    Caption ="Produkt"
                                    LayoutCachedLeft =10790
                                    LayoutCachedTop =993
                                    LayoutCachedWidth =11435
                                    LayoutCachedHeight =1233
                                End
                            End
                        End
                    End
                End
                Begin OptionButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =12982
                    Top =623
                    TabIndex =6
                    Name ="oFrigutec"
                    BeforeUpdate ="[Event Procedure]"

                    LayoutCachedLeft =12982
                    LayoutCachedTop =623
                    LayoutCachedWidth =13242
                    LayoutCachedHeight =863
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =247
                            Left =13212
                            Top =593
                            Width =1695
                            Height =240
                            Name ="lbloFrigutec"
                            Caption ="Frigutec-Anzeige"
                            LayoutCachedLeft =13212
                            LayoutCachedTop =593
                            LayoutCachedWidth =14907
                            LayoutCachedHeight =833
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "frmTank.cls"
