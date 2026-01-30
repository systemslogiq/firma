Version =20
VersionRequired =20
Begin Form
    AutoResize = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    NavigationButtons = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =0
    ViewsAllowed =1
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7500
    DatasheetFontHeight =10
    ItemSuffix =83
    Left =-7306
    Top =3030
    Right =20609
    Bottom =15225
    Tag ="Stichwort"
    RecSrcDt = Begin
        0xf6f92943f6cde140
    End
    Caption ="Speichern"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
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
            SpecialEffect =3
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
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
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
            Height =11970
            BackColor =10092543
            Name ="Det"
            Begin
                Begin Tab
                    OverlapFlags =85
                    Left =30
                    Top =30
                    Width =7470
                    Height =11940
                    Name ="Reg"
                    FontName ="Arial"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =30
                    LayoutCachedTop =30
                    LayoutCachedWidth =7500
                    LayoutCachedHeight =11970
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =165
                            Top =450
                            Width =7199
                            Height =11385
                            Name ="PageStichwort"
                            Caption ="Stichwort"
                            LayoutCachedLeft =165
                            LayoutCachedTop =450
                            LayoutCachedWidth =7364
                            LayoutCachedHeight =11835
                            Begin
                                Begin Subform
                                    OverlapFlags =247
                                    Left =185
                                    Top =849
                                    Width =7179
                                    Height =10551
                                    Name ="UF_Stichwort"
                                    SourceObject ="Form.UF_Stichwort"

                                    LayoutCachedLeft =185
                                    LayoutCachedTop =849
                                    LayoutCachedWidth =7364
                                    LayoutCachedHeight =11400
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =165
                            Top =450
                            Width =7200
                            Height =11385
                            Name ="PageSuchen"
                            Caption ="suchen..."
                            LayoutCachedLeft =165
                            LayoutCachedTop =450
                            LayoutCachedWidth =7365
                            LayoutCachedHeight =11835
                            Begin
                                Begin ListBox
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    Left =230
                                    Top =1196
                                    Width =3402
                                    Height =10206
                                    BackColor =12632256
                                    Name ="Stichwort"
                                    RowSourceType ="Table/Query"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    OnKeyUp ="[Event Procedure]"
                                    ControlTipText ="Stichworte (mit Shift oder Ctrl-Taste mehrere markieren)"

                                    LayoutCachedLeft =230
                                    LayoutCachedTop =1196
                                    LayoutCachedWidth =3632
                                    LayoutCachedHeight =11402
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    ColumnCount =2
                                    Left =3705
                                    Top =1196
                                    Width =2978
                                    Height =10206
                                    TabIndex =1
                                    BackColor =8421376
                                    ForeColor =16777215
                                    BorderColor =8421376
                                    Name ="BemStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="1701;0"
                                    AfterUpdate ="[Event Procedure]"
                                    OnDblClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Alle Bemerkungen zum Stichwort < Ablage Server >"

                                    LayoutCachedLeft =3705
                                    LayoutCachedTop =1196
                                    LayoutCachedWidth =6683
                                    LayoutCachedHeight =11402
                                End
                                Begin Rectangle
                                    SpecialEffect =2
                                    BackStyle =1
                                    OverlapFlags =223
                                    Left =230
                                    Top =468
                                    Width =3402
                                    Height =385
                                    BackColor =12632256
                                    Name ="Rechteck23"
                                    LayoutCachedLeft =230
                                    LayoutCachedTop =468
                                    LayoutCachedWidth =3632
                                    LayoutCachedHeight =853
                                End
                                Begin Rectangle
                                    SpecialEffect =2
                                    BackStyle =1
                                    OverlapFlags =223
                                    Left =3695
                                    Top =456
                                    Width =2363
                                    Height =385
                                    BackColor =8421376
                                    Name ="Rechteck17"
                                    LayoutCachedLeft =3695
                                    LayoutCachedTop =456
                                    LayoutCachedWidth =6058
                                    LayoutCachedHeight =841
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =937
                                    Top =472
                                    Width =576
                                    Height =351
                                    FontWeight =700
                                    TabIndex =2
                                    Name ="btnSuch"
                                    Caption ="suchen"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadad00000adada00000a ,
                                        0x0f000dadad0f000d0f000adada0f000a0000000d0000000d00f000000f00000a ,
                                        0x00f000a00f00000d00f000d00f00000aa0000000000000adda0f000a0f000ada ,
                                        0xad00000d00000daddad000dad000dadaada0f0ada0f0adaddad000dad000dada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="nach markierten Stichworten suchen"

                                    LayoutCachedLeft =937
                                    LayoutCachedTop =472
                                    LayoutCachedWidth =1513
                                    LayoutCachedHeight =823
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =339
                                    Top =472
                                    Width =567
                                    Height =351
                                    TabIndex =3
                                    Name ="btnDelete"
                                    Caption ="L"
                                    StatusBarText ="Stichwortmarkierung aufheben"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Markierung aufheben"

                                    LayoutCachedLeft =339
                                    LayoutCachedTop =472
                                    LayoutCachedWidth =906
                                    LayoutCachedHeight =823
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =1544
                                    Top =472
                                    Width =576
                                    Height =345
                                    FontWeight =700
                                    TabIndex =4
                                    Name ="btnEintragen"
                                    Caption ="suchen"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadaddad0000adadad000ada0220dadada000dad0220adadadada ,
                                        0x0000220000ada0000222222220dad0000222222220ada0000000220000dad000 ,
                                        0xada0220dadada000dad0220adadad000ada0000dadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="markierte Stichworte für aktuellen Datensatz eintragen"

                                    LayoutCachedLeft =1544
                                    LayoutCachedTop =472
                                    LayoutCachedWidth =2120
                                    LayoutCachedHeight =817
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =3665
                                    Top =467
                                    Width =576
                                    Height =351
                                    FontWeight =700
                                    TabIndex =5
                                    Name ="SucheBemStichwort"
                                    Caption ="suchen"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadad00000adada00000a ,
                                        0x0f000dadad0f000d0f000adada0f000a0000000d0000000d00f000000f00000a ,
                                        0x00f000a00f00000d00f000d00f00000aa0000000000000adda0f000a0f000ada ,
                                        0xad00000d00000daddad000dad000dadaada0f0ada0f0adaddad000dad000dada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="nach markierten Stichworten suchen"

                                    LayoutCachedLeft =3665
                                    LayoutCachedTop =467
                                    LayoutCachedWidth =4241
                                    LayoutCachedHeight =818
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4272
                                    Top =471
                                    Width =576
                                    Height =351
                                    FontWeight =700
                                    TabIndex =6
                                    Name ="btnBemEintragen"
                                    Caption ="suchen"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadaddad0000adadad000ada0220dadada000dad0220adadadada ,
                                        0x0000220000ada0000222222220dad0000222222220ada0000000220000dad000 ,
                                        0xada0220dadada000dad0220adadad000ada0000dadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="markierte Stichworte für aktuellen Datensatz eintragen"

                                    LayoutCachedLeft =4272
                                    LayoutCachedTop =471
                                    LayoutCachedWidth =4848
                                    LayoutCachedHeight =822
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =225
                                    Top =11506
                                    Width =900
                                    Height =327
                                    TabIndex =7
                                    ForeColor =255
                                    Name ="btnDeleteStichwort"
                                    Caption ="löschen..."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="markiertes Stichwort löschen"

                                    LayoutCachedLeft =225
                                    LayoutCachedTop =11506
                                    LayoutCachedWidth =1125
                                    LayoutCachedHeight =11833
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =1209
                                    Top =11506
                                    Width =900
                                    Height =327
                                    TabIndex =8
                                    ForeColor =16711680
                                    Name ="btnChange"
                                    Caption ="ändern..."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="markiertes Stichwort ändern"

                                    LayoutCachedLeft =1209
                                    LayoutCachedTop =11506
                                    LayoutCachedWidth =2109
                                    LayoutCachedHeight =11833
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =3760
                                    Top =11505
                                    Width =900
                                    Height =327
                                    TabIndex =9
                                    ForeColor =255
                                    Name ="btnBemStichwortDelete"
                                    Caption ="löschen..."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="markierte Bemerkung zum Stichwort löschen"

                                    LayoutCachedLeft =3760
                                    LayoutCachedTop =11505
                                    LayoutCachedWidth =4660
                                    LayoutCachedHeight =11832
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    Left =4773
                                    Top =11505
                                    Width =900
                                    Height =327
                                    TabIndex =10
                                    ForeColor =16711680
                                    Name ="btnBemStichwortChange"
                                    Caption ="ändern..."
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="markierte Bemerkung zum Stichwort ändern"

                                    LayoutCachedLeft =4773
                                    LayoutCachedTop =11505
                                    LayoutCachedWidth =5673
                                    LayoutCachedHeight =11832
                                End
                                Begin ComboBox
                                    OverlapFlags =215
                                    TextAlign =2
                                    IMESentenceMode =3
                                    ColumnCount =2
                                    ListRows =10
                                    ListWidth =3686
                                    Left =963
                                    Top =907
                                    Width =786
                                    Height =255
                                    FontWeight =700
                                    TabIndex =13
                                    BackColor =10092543
                                    Name ="comStichwort"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="567;2835"
                                    AfterUpdate ="[Event Procedure]"
                                    OnEnter ="[Event Procedure]"
                                    DefaultValue ="\"A-Z\""
                                    FontName ="Arial"
                                    ControlTipText ="Auswahl der Anzeige (Umfang der Stichworte reduzieren)"

                                    LayoutCachedLeft =963
                                    LayoutCachedTop =907
                                    LayoutCachedWidth =1749
                                    LayoutCachedHeight =1162
                                    Begin
                                        Begin Label
                                            OverlapFlags =223
                                            Left =283
                                            Top =907
                                            Width =720
                                            Height =255
                                            Name ="Bezeichnungsfeld27"
                                            Caption ="Anzeige:"
                                            FontName ="Arial"
                                            LayoutCachedLeft =283
                                            LayoutCachedTop =907
                                            LayoutCachedWidth =1003
                                            LayoutCachedHeight =1162
                                        End
                                    End
                                End
                                Begin TextBox
                                    TabStop = NotDefault
                                    OverlapFlags =215
                                    IMESentenceMode =3
                                    Left =1870
                                    Top =879
                                    Width =960
                                    Height =283
                                    TabIndex =19
                                    BackColor =10092543
                                    Name ="txtFirst"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Stichwort-Anzeige begrenzen auf Anfangsbuchstabe(n) = eingegebene(r) Buchstabe(n"
                                        ")"

                                    LayoutCachedLeft =1870
                                    LayoutCachedTop =879
                                    LayoutCachedWidth =2830
                                    LayoutCachedHeight =1162
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =165
                            Top =450
                            Width =7200
                            Height =11385
                            Name ="PageManage"
                            Caption ="diverse Funktionen"
                            LayoutCachedLeft =165
                            LayoutCachedTop =450
                            LayoutCachedWidth =7365
                            LayoutCachedHeight =11835
                            Begin
                                Begin TextBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =240
                                    Top =850
                                    Width =2552
                                    BackColor =15658734
                                    ForeColor =0
                                    Name ="aktStichwort"
                                    FontName ="Arial"

                                    LayoutCachedLeft =240
                                    LayoutCachedTop =850
                                    LayoutCachedWidth =2792
                                    LayoutCachedHeight =1090
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            Left =240
                                            Top =585
                                            Width =2552
                                            Height =210
                                            FontWeight =700
                                            Name ="Bezeichnungsfeld52"
                                            Caption ="Stichwort / Spezifikation"
                                            FontName ="Arial"
                                            LayoutCachedLeft =240
                                            LayoutCachedTop =585
                                            LayoutCachedWidth =2792
                                            LayoutCachedHeight =795
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =3078
                                    Top =850
                                    Width =2552
                                    TabIndex =1
                                    BackColor =16777158
                                    ForeColor =0
                                    Name ="aktBemStichwort"
                                    FontName ="Arial"

                                    LayoutCachedLeft =3078
                                    LayoutCachedTop =850
                                    LayoutCachedWidth =5630
                                    LayoutCachedHeight =1090
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            Left =3078
                                            Top =585
                                            Width =2552
                                            Height =210
                                            FontWeight =700
                                            Name ="Bezeichnungsfeld53"
                                            Caption ="Bemerkung / Wert"
                                            FontName ="Arial"
                                            LayoutCachedLeft =3078
                                            LayoutCachedTop =585
                                            LayoutCachedWidth =5630
                                            LayoutCachedHeight =795
                                        End
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =2
                                    ListRows =30
                                    Left =4040
                                    Top =1845
                                    Width =675
                                    Height =255
                                    TabIndex =2
                                    BackColor =10092543
                                    ForeColor =0
                                    ConditionalFormat = Begin
                                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000
                                    End
                                    Name ="NeueStichwortNr"
                                    RowSourceType ="Table/Query"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Bitte eine Zahl auswählen!"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Position"

                                    LayoutCachedLeft =4040
                                    LayoutCachedTop =1845
                                    LayoutCachedWidth =4715
                                    LayoutCachedHeight =2100
                                    ConditionalFormat14 = Begin
                                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                                        0x00000000000000000000000000000000000000
                                    End
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =5045
                                    Top =1845
                                    Width =630
                                    TabIndex =3
                                    BackColor =10092543
                                    ForeColor =-2147483630
                                    Name ="ID"
                                    FontName ="Arial"
                                    Tag ="nrBegriff"

                                    LayoutCachedLeft =5045
                                    LayoutCachedTop =1845
                                    LayoutCachedWidth =5675
                                    LayoutCachedHeight =2085
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =6521
                                    Left =920
                                    Top =3960
                                    Width =5715
                                    Height =255
                                    TabIndex =4
                                    BackColor =10092543
                                    ForeColor =0
                                    ConditionalFormat = Begin
                                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000
                                    End
                                    Name ="comTransVon"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670;567"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Bitte eine Zahl auswählen!"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Transfer der Stichworte......"

                                    LayoutCachedLeft =920
                                    LayoutCachedTop =3960
                                    LayoutCachedWidth =6635
                                    LayoutCachedHeight =4215
                                    ConditionalFormat14 = Begin
                                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                                        0x00000000000000000000000000000000000000
                                    End
                                End
                                Begin ComboBox
                                    SpecialEffect =0
                                    OverlapFlags =247
                                    TextAlign =1
                                    ColumnCount =3
                                    ListRows =30
                                    ListWidth =6521
                                    Left =920
                                    Top =4301
                                    Width =5715
                                    Height =255
                                    TabIndex =5
                                    BackColor =10092543
                                    ForeColor =0
                                    ConditionalFormat = Begin
                                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                                        0x00000000
                                    End
                                    Name ="comTransNach"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;5670;567"
                                    ValidationRule ="Is Not Null"
                                    ValidationText ="Bitte eine Zahl auswählen!"
                                    OnEnter ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Transfer der Stichworte......"

                                    LayoutCachedLeft =920
                                    LayoutCachedTop =4301
                                    LayoutCachedWidth =6635
                                    LayoutCachedHeight =4556
                                    ConditionalFormat14 = Begin
                                        0x01000100000002000000000000000100000000000000ffffff00000000000000 ,
                                        0x00000000000000000000000000000000000000
                                    End
                                End
                                Begin ListBox
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    ColumnCount =2
                                    Left =240
                                    Top =2162
                                    Width =6395
                                    Height =1567
                                    FontWeight =700
                                    TabIndex =6
                                    BackColor =10092543
                                    Name ="lstAct"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;4536"
                                    AfterUpdate ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="Aktionen auslösen"

                                    LayoutCachedLeft =240
                                    LayoutCachedTop =2162
                                    LayoutCachedWidth =6635
                                    LayoutCachedHeight =3729
                                End
                                Begin TextBox
                                    Visible = NotDefault
                                    SpecialEffect =0
                                    OldBorderStyle =0
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =240
                                    Top =4692
                                    Width =6395
                                    Height =6705
                                    FontSize =10
                                    FontWeight =700
                                    TabIndex =7
                                    BackColor =-2147483633
                                    ForeColor =-2147483630
                                    Name ="txtwie"
                                    FontName ="Arial"

                                    LayoutCachedLeft =240
                                    LayoutCachedTop =4692
                                    LayoutCachedWidth =6635
                                    LayoutCachedHeight =11397
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =255
                                    Left =240
                                    Top =3911
                                    Width =567
                                    Height =351
                                    TabIndex =8
                                    Name ="btnVon"
                                    Caption ="von"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="zeige Adresse"

                                    LayoutCachedLeft =240
                                    LayoutCachedTop =3911
                                    LayoutCachedWidth =807
                                    LayoutCachedHeight =4262
                                End
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =240
                                    Top =4262
                                    Width =567
                                    Height =351
                                    TabIndex =9
                                    Name ="btnNach"
                                    Caption ="nach"
                                    OnClick ="[Event Procedure]"
                                    FontName ="Arial"
                                    ControlTipText ="zeige Adresse"

                                    LayoutCachedLeft =240
                                    LayoutCachedTop =4262
                                    LayoutCachedWidth =807
                                    LayoutCachedHeight =4613
                                End
                                Begin TextBox
                                    OverlapFlags =247
                                    IMESentenceMode =3
                                    Left =226
                                    Top =1455
                                    Width =5387
                                    TabIndex =10
                                    BackColor =15658734
                                    ForeColor =0
                                    Name ="aktHL"
                                    FontName ="Arial"

                                    LayoutCachedLeft =226
                                    LayoutCachedTop =1455
                                    LayoutCachedWidth =5613
                                    LayoutCachedHeight =1695
                                    Begin
                                        Begin Label
                                            OverlapFlags =247
                                            Left =226
                                            Top =1190
                                            Width =2552
                                            Height =210
                                            FontWeight =700
                                            Name ="Bezeichnungsfeld76"
                                            Caption ="Hyperlink"
                                            FontName ="Arial"
                                            LayoutCachedLeft =226
                                            LayoutCachedTop =1190
                                            LayoutCachedWidth =2778
                                            LayoutCachedHeight =1400
                                        End
                                    End
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =165
                            Top =450
                            Width =7200
                            Height =11385
                            Name ="pageCopy"
                            Caption ="kopieren / übertragen"
                            LayoutCachedLeft =165
                            LayoutCachedTop =450
                            LayoutCachedWidth =7365
                            LayoutCachedHeight =11835
                            Begin
                                Begin CommandButton
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    Left =245
                                    Top =471
                                    Width =5601
                                    Height =345
                                    FontWeight =700
                                    Name ="btnCopy"
                                    Caption ="   kopiere (mit SHIFT / CTRL) markierte Stichworte"
                                    OnClick ="[Event Procedure]"
                                    PictureData = Begin
                                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                                        0xffff0000ffffff00dadadadadadadadaadadadadadadadaddadadadadadadada ,
                                        0xadadadadadadadaddad0000adadad000ada0220dadada000dad0220adadadada ,
                                        0x0000220000ada0000222222220dad0000222222220ada0000000220000dad000 ,
                                        0xada0220dadada000dad0220adadad000ada0000dadadadaddadadadadadadada ,
                                        0xadadadadadadadad
                                    End
                                    FontName ="Arial"
                                    ObjectPalette = Begin
                                        0x000301000000000000000000
                                    End
                                    ControlTipText ="markierte Stichworte für aktuellen Datensatz eintragen"

                                    LayoutCachedLeft =245
                                    LayoutCachedTop =471
                                    LayoutCachedWidth =5846
                                    LayoutCachedHeight =816
                                    PictureCaptionArrangement =1
                                End
                                Begin ListBox
                                    ColumnHeads = NotDefault
                                    TabStop = NotDefault
                                    OverlapFlags =247
                                    MultiSelect =2
                                    ColumnCount =4
                                    Left =226
                                    Top =907
                                    Width =6395
                                    Height =10777
                                    FontWeight =700
                                    TabIndex =1
                                    BackColor =10092543
                                    Name ="lstCopy"
                                    RowSourceType ="Table/Query"
                                    ColumnWidths ="0;567;3402"
                                    FontName ="Arial"
                                    ControlTipText ="markieren mit SHIFT / CTRL"

                                    LayoutCachedLeft =226
                                    LayoutCachedTop =907
                                    LayoutCachedWidth =6621
                                    LayoutCachedHeight =11684
                                End
                            End
                        End
                    End
                End
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =247
                    Left =6130
                    Top =471
                    Width =576
                    Height =351
                    TabIndex =1
                    Name ="btnClose"
                    Caption ="Befehl50"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dadad0dadadadadaadad00adadadadaddad030dadadadada ,
                        0xad0330adadadadad0033300000000adaa03330ff0dadadadd03300ff0adad4da ,
                        0xa03330ff0dad44add03330ff0ad44444a03330ff0d444444d03330ff0ad44444 ,
                        0xa0330fff0dad44add030ffff0adad4daa00fffff0dadadadd00000000adadada ,
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
                    ControlTipText ="Formular schließen"

                    LayoutCachedLeft =6130
                    LayoutCachedTop =471
                    LayoutCachedWidth =6706
                    LayoutCachedHeight =822
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Stichwort.cls"
