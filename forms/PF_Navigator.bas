Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =18
    BorderStyle =3
    PictureAlignment =5
    PictureSizeMode =1
    GridY =10
    Width =6521
    DatasheetFontHeight =10
    ItemSuffix =254
    Left =32655
    Top =3030
    Right =-8191
    Bottom =14895
    Tag ="Navigator"
    RecSrcDt = Begin
        0x8030c9b63ac9e140
    End
    Caption ="Adresse dem Vorgang 30 Projekt zuordnen"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnActivate ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    AllowLayoutView =0
    PictureSizeMode =1
    Begin
        Begin Label
            FontWeight =700
            BackColor =12632256
        End
        Begin Rectangle
            SpecialEffect =2
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin CommandButton
            TextFontFamily =18
            Width =690
            Height =513
            FontSize =8
            FontWeight =400
            ForeColor =8388608
            FontName ="Times New Roman"
            BorderLineStyle =0
        End
        Begin OptionButton
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =187
            Height =187
        End
        Begin CheckBox
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =187
            Height =187
        End
        Begin OptionGroup
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =255
            LabelX =-1701
        End
        Begin ListBox
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
        End
        Begin ComboBox
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =255
            LabelX =-1701
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin PageBreak
            Width =283
        End
        Begin ToggleButton
            Width =690
            Height =240
            FontSize =8
            FontWeight =400
            FontName ="Arial"
            BorderLineStyle =0
        End
        Begin Section
            CanGrow = NotDefault
            SpecialEffect =2
            Height =4454
            BackColor =12632256
            Name ="det"
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =5
                    ListRows =30
                    ListWidth =14175
                    Left =1418
                    Top =2104
                    Width =5103
                    TabIndex =4
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="comAdresse"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5103;3969;2835;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Wählen Sie die Adresse aus"
                    Format ="Standard"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =2104
                    LayoutCachedWidth =6521
                    LayoutCachedHeight =2359
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    Visible = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =93
                    TextAlign =1
                    ColumnCount =5
                    ListRows =30
                    ListWidth =6521
                    Left =1418
                    Width =5103
                    TabIndex =9
                    BackColor =52479
                    Name ="ComVG"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5103;1134;0;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="68"
                    ControlTipText ="Wählen Sie den Vorgang"

                    LayoutCachedLeft =1418
                    LayoutCachedWidth =6521
                    LayoutCachedHeight =255
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    Visible = NotDefault
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =255
                    TextAlign =1
                    ColumnCount =4
                    ListRows =30
                    ListWidth =9356
                    Left =1418
                    Width =5103
                    TabIndex =7
                    BackColor =13434828
                    Name ="comQK"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;5103;3969;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    DefaultValue ="31"
                    FontName ="Arial"
                    Tag ="62"
                    ControlTipText ="Wählen Sie den Vorgang aus"

                    LayoutCachedLeft =1418
                    LayoutCachedWidth =6521
                    LayoutCachedHeight =255
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =225
                    Top =2080
                    Width =1134
                    Height =313
                    TabIndex =3
                    ForeColor =0
                    Name ="btnAdresse"
                    Caption ="Adresse"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Adresse öffnen"

                    LayoutCachedLeft =225
                    LayoutCachedTop =2080
                    LayoutCachedWidth =1359
                    LayoutCachedHeight =2393
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextFontFamily =34
                    Left =225
                    Width =1134
                    Height =313
                    TabIndex =6
                    ForeColor =0
                    Name ="btnQK"
                    Caption ="QK"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial Narrow"
                    Tag ="62"
                    ControlTipText ="QK anzeigen"

                    LayoutCachedLeft =225
                    LayoutCachedWidth =1359
                    LayoutCachedHeight =313
                    Overlaps =1
                End
                Begin CheckBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =282
                    Top =1798
                    TabIndex =2
                    Name ="chkMinimize"
                    DefaultValue ="-1"
                    ControlTipText ="Navigator nach Suche verkleinern"

                    LayoutCachedLeft =282
                    LayoutCachedTop =1798
                    LayoutCachedWidth =469
                    LayoutCachedHeight =1985
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =223
                    TextFontFamily =34
                    Left =225
                    Width =1134
                    Height =313
                    TabIndex =1
                    ForeColor =0
                    Name ="btnLeistung"
                    Caption ="Leistung"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="75"
                    ControlTipText ="Leistungen/Stunden öffnen"

                    LayoutCachedLeft =225
                    LayoutCachedWidth =1359
                    LayoutCachedHeight =313
                    Overlaps =1
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =1418
                    Top =1740
                    Width =5103
                    Height =270
                    BackColor =10092543
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="suche einen Teil des Namens; mit Enter abschliessen\015\012Mit Doppelklick Eintr"
                        "ag entfernen;\015\012Umlaute werden umgewandelt"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =1740
                    LayoutCachedWidth =6521
                    LayoutCachedHeight =2010
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =215
                    TextFontFamily =34
                    Left =225
                    Width =1134
                    Height =313
                    TabIndex =10
                    ForeColor =0
                    Name ="btnVG"
                    Caption ="Vorgang"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial Narrow"
                    Tag ="68"
                    ControlTipText ="ausgewählten Vorgang anzeigen"

                    LayoutCachedLeft =225
                    LayoutCachedWidth =1359
                    LayoutCachedHeight =313
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =225
                    Top =2820
                    Width =6296
                    Height =567
                    FontWeight =700
                    TabIndex =5
                    ForeColor =16711680
                    Name ="btnOK"
                    Caption ="...Adresse dem Vorgang 30 Projekt zuordnen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="übertragen"

                    LayoutCachedLeft =225
                    LayoutCachedTop =2820
                    LayoutCachedWidth =6521
                    LayoutCachedHeight =3387
                End
                Begin ListBox
                    TabStop = NotDefault
                    OverlapFlags =247
                    ColumnCount =2
                    Left =1418
                    Top =113
                    Width =2268
                    Height =1418
                    FontWeight =700
                    TabIndex =8
                    BackColor =10092543
                    Name ="lstStatus"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ControlTipText ="Adressen eingrenzen nach \015\012Aktiv/Nicht aktiv/unsere Mitarbeiter"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =113
                    LayoutCachedWidth =3686
                    LayoutCachedHeight =1531
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1418
                    Top =2526
                    Width =786
                    Height =240
                    TabIndex =11
                    BackColor =39423
                    BorderColor =4210752
                    Name ="rabatt"
                    Format ="Fixed"
                    FontName ="Arial"

                    LayoutCachedLeft =1418
                    LayoutCachedTop =2526
                    LayoutCachedWidth =2204
                    LayoutCachedHeight =2766
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =283
                            Top =2526
                            Width =1065
                            Height =210
                            Name ="lblRabatt"
                            Caption ="Rabatt in %"
                            ControlTipText ="Rabatt zwischen 0 und 100 %"
                            LayoutCachedLeft =283
                            LayoutCachedTop =2526
                            LayoutCachedWidth =1348
                            LayoutCachedHeight =2736
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    OverlapFlags =247
                    ColumnCount =2
                    Left =3969
                    Top =113
                    Width =2268
                    Height =1418
                    FontWeight =700
                    TabIndex =12
                    BackColor =10092543
                    Name ="lstAktiv"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ControlTipText ="Adressen eingrenzen nach \015\012Aktiv/Nicht aktiv/unsere Mitarbeiter"

                    LayoutCachedLeft =3969
                    LayoutCachedTop =113
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =1531
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =1019
                    Top =1700
                    Width =340
                    Height =340
                    TabIndex =13
                    ForeColor =0
                    Name ="btntxtFind"
                    Caption ="suchen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Adressen mit den oben eingestellten Bedingungen unten anzeigen.\015\012Die wicht"
                        "igsten Felder werden durchsucht nach dem im gelben Suchfeld eingetragenen Wert."
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

                    LayoutCachedLeft =1019
                    LayoutCachedTop =1700
                    LayoutCachedWidth =1359
                    LayoutCachedHeight =2040
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Navigator.cls"
