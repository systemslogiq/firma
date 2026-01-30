Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    PictureTiling = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18141
    DatasheetFontHeight =10
    ItemSuffix =60
    Right =28170
    Bottom =12450
    Tag ="Language"
    RecSrcDt = Begin
        0xf2be6678b82ee640
    End
    Caption ="Sprachen / Übersetzungen"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
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
            TextFontFamily =18
            FontSize =10
            FontWeight =700
            ForeColor =13209
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BorderColor =13209
        End
        Begin Line
            OldBorderStyle =2
            BorderWidth =2
            Width =1701
            BorderColor =13209
        End
        Begin CommandButton
            TextFontFamily =18
            Width =1701
            Height =283
            ForeColor =13209
            FontName ="Times New Roman"
            BorderLineStyle =0
        End
        Begin OptionButton
            BorderWidth =3
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderColor =13209
        End
        Begin CheckBox
            BorderWidth =3
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderColor =13209
        End
        Begin OptionGroup
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderColor =13209
        End
        Begin TextBox
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =9
            BorderColor =13209
            FontName ="Arial"
            AsianLineBreak =255
        End
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =9
            BorderColor =13209
            FontName ="Arial"
        End
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =9
            BorderColor =13209
            FontName ="Arial"
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderColor =13209
        End
        Begin UnboundObjectFrame
            BackStyle =0
            OldBorderStyle =1
            Width =4536
            Height =2835
            BorderColor =13209
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
            ForeColor =-2147483630
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
            Height =11964
            Name ="Det"
            AlternateBackColor =16317438
            BackThemeColorIndex =3
            Begin
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =4
                    Left =120
                    Top =3972
                    Width =17904
                    Height =7992
                    FontSize =8
                    TabIndex =7
                    BackColor =14803425
                    BorderColor =0
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1134;1134"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ShortcutMenuBar ="cbF_Language"
                    ControlTipText ="Liste der gefilterten (242) Daten für Language\015\012Verwenden Sie die Pfeiltas"
                        "ten, um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =120
                    LayoutCachedTop =3972
                    LayoutCachedWidth =18024
                    LayoutCachedHeight =11964
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =120
                    Top =60
                    Height =2435
                    FontSize =8
                    TabIndex =2
                    BackColor =14803425
                    BorderColor =0
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    Tag ="FilterForm"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der Sprachen (unterer Teil = noch nicht verwendet)"

                    LayoutCachedLeft =120
                    LayoutCachedTop =60
                    LayoutCachedWidth =1821
                    LayoutCachedHeight =2495
                End
                Begin TextBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1985
                    Top =3615
                    Width =2835
                    FontSize =8
                    FontWeight =600
                    TabIndex =6
                    BackColor =12975858
                    BorderColor =0
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"

                    LayoutCachedLeft =1985
                    LayoutCachedTop =3615
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =3855
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =120
                    Top =3628
                    Width =696
                    Height =227
                    FontSize =8
                    FontWeight =600
                    TabIndex =5
                    BackColor =12975858
                    BorderColor =0
                    Name ="countRec"
                    FontName ="Tahoma"
                    ControlTipText ="Anzahl der gefundenen Datensätze"

                    LayoutCachedLeft =120
                    LayoutCachedTop =3628
                    LayoutCachedWidth =816
                    LayoutCachedHeight =3855
                End
                Begin ComboBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    SpecialEffect =2
                    OverlapFlags =87
                    TextAlign =1
                    ListRows =20
                    ListWidth =1701
                    Left =4820
                    Top =3600
                    Width =246
                    Height =255
                    FontSize =8
                    TabIndex =4
                    BackColor =12975858
                    BorderColor =0
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    RowSource ="Noch zu überprüfen!;neuer Eintrag zum Übersetzen;Noch zu übersetzen!;mit fre;mit"
                        " fr;ex;zeit;time;"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="letzte Such-Einträge"

                    LayoutCachedLeft =4820
                    LayoutCachedTop =3600
                    LayoutCachedWidth =5066
                    LayoutCachedHeight =3855
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1985
                    Top =53
                    Width =2835
                    Height =3474
                    FontSize =8
                    BackColor =10092543
                    BorderColor =0
                    Name ="lstAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134"
                    AfterUpdate ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="mögliche Aktionen"

                    LayoutCachedLeft =1985
                    LayoutCachedTop =53
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =3527
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =1
                    ListRows =30
                    ListWidth =6237
                    Left =13854
                    Top =2601
                    Width =231
                    Height =255
                    FontSize =8
                    TabIndex =3
                    BorderColor =0
                    Name ="coml2"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="5670"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    ControlTipText ="übersetzter Wert"

                    LayoutCachedLeft =13854
                    LayoutCachedTop =2601
                    LayoutCachedWidth =14085
                    LayoutCachedHeight =2856
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =6262
                    Top =1406
                    Width =7536
                    Height =1020
                    FontSize =8
                    TabIndex =8
                    BackColor =15527148
                    Name ="l1"
                    OnChange ="[Event Procedure]"
                    ControlTipText ="DEUTSCH"

                    LayoutCachedLeft =6262
                    LayoutCachedTop =1406
                    LayoutCachedWidth =13798
                    LayoutCachedHeight =2426
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            TextFontFamily =34
                            Left =4958
                            Top =1406
                            Width =1200
                            Height =255
                            FontSize =8
                            Name ="lblDeutsch"
                            Caption ="Deutsch"
                            FontName ="Arial"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =4958
                            LayoutCachedTop =1406
                            LayoutCachedWidth =6158
                            LayoutCachedHeight =1661
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =6262
                    Top =2601
                    Width =7536
                    Height =1020
                    FontSize =8
                    TabIndex =9
                    Name ="l2"
                    OnChange ="[Event Procedure]"
                    ControlTipText ="Übersetzung"

                    LayoutCachedLeft =6262
                    LayoutCachedTop =2601
                    LayoutCachedWidth =13798
                    LayoutCachedHeight =3621
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    Left =4935
                    Top =2627
                    Width =1251
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    BackColor =11525325
                    BorderColor =0
                    Name ="Language"
                    DefaultValue ="\"deutsch\""
                    ControlTipText ="Übersetzung in diese Sprache"

                    LayoutCachedLeft =4935
                    LayoutCachedTop =2627
                    LayoutCachedWidth =6186
                    LayoutCachedHeight =2882
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =120
                    Top =2637
                    Height =890
                    FontSize =8
                    TabIndex =10
                    BackColor =14803425
                    BorderColor =0
                    Name ="lstOB"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Tahoma"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Sortieren nach"

                    LayoutCachedLeft =120
                    LayoutCachedTop =2637
                    LayoutCachedWidth =1821
                    LayoutCachedHeight =3527
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =6262
                    Top =570
                    Width =4701
                    Height =681
                    TabIndex =11
                    Name ="btnSave"
                    Caption ="      Speichern"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddd0000000000000dd03300000088030d ,
                        0xd03300000088030dd03300000088030dd03300000000030dd03333333333330d ,
                        0xd03300000000330dd03088888888030dd03088888888030dd03088888888030d ,
                        0xd03088888888030dd03088888888000dd03088888888080dd00000000000000d ,
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
                    ControlTipText ="Datensatz speichern"

                    LayoutCachedLeft =6262
                    LayoutCachedTop =570
                    LayoutCachedWidth =10963
                    LayoutCachedHeight =1251
                    PictureCaptionArrangement =1
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =12097
                    Top =566
                    Height =681
                    TabIndex =12
                    Name ="btnEscape"
                    Caption ="Rückgängig"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xddddddddddddddddddddddddddddddddddddddddddd74ddddd44444ddddd47dd ,
                        0xdd4444ddddddd4dddd444dddddddd4dddd44d4ddddddd4dddd4ddd44dddd47dd ,
                        0xdddddddd44447ddddddddddddddddddddddddddddddddddddddddddddddddddd ,
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
                    ControlTipText ="Datensatz rückgängig"

                    LayoutCachedLeft =12097
                    LayoutCachedTop =566
                    LayoutCachedWidth =13798
                    LayoutCachedHeight =1247
                    PictureCaptionArrangement =1
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Language.cls"
