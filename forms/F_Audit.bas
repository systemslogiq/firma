Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =5
    PictureSizeMode =1
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =22110
    DatasheetFontHeight =10
    ItemSuffix =52
    Right =24690
    Bottom =11865
    PaintPalette = Begin
        0x000301000000000000000000
    End
    OnUnload ="[Event Procedure]"
    Tag ="Audit"
    RecSrcDt = Begin
        0x9bd4d1de4d79e640
    End
    Caption ="Change Control"
    OnCurrent ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
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
            Height =11340
            BackColor =16711164
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =1041
                    Width =2835
                    Height =270
                    BackColor =12632256
                    Name ="tablename"
                    ControlSource ="tablename"
                    StatusBarText ="Form Name"
                    Tag ="m2"
                    ControlTipText ="betroffene Tabelle"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =1041
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =1311
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =1041
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblTabelle"
                            Caption ="Tabelle"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =1041
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =1311
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =1729
                    Width =2835
                    Height =270
                    TabIndex =1
                    BackColor =12632256
                    Name ="AuditDate"
                    ControlSource ="AuditDate"
                    ControlTipText ="Änderungsdatum (Doppelclick zum Filtern)"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =1729
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =1999
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =1729
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblWann"
                            Caption ="Wann"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =1729
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =1999
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =2073
                    Width =2835
                    Height =270
                    TabIndex =2
                    BackColor =12632256
                    Name ="AuditWho"
                    ControlSource ="AuditWho"
                    ControlTipText ="Wer hat geändert"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =2073
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =2343
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =2073
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblWer"
                            Caption ="Wer"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =2073
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =2343
                        End
                    End
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =9510
                    Top =353
                    Width =1440
                    Height =270
                    FontWeight =700
                    Name ="Bezeichnungsfeld15"
                    Caption ="lfd.-Nr."
                    Tag ="DetachedLabel"
                    LayoutCachedLeft =9510
                    LayoutCachedTop =353
                    LayoutCachedWidth =10950
                    LayoutCachedHeight =623
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =105
                    Top =113
                    Width =2268
                    Height =420
                    FontWeight =700
                    TabIndex =3
                    ForeColor =128
                    Name ="btnArchiv"
                    Caption ="archivieren..."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="als Admin kann man archivieren; d.h. die Audit-Daten in eine Archiv-Datenbank au"
                        "slagern, um Platz zu sparen."

                    LayoutCachedLeft =105
                    LayoutCachedTop =113
                    LayoutCachedWidth =2373
                    LayoutCachedHeight =533
                    Overlaps =1
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =1385
                    Width =2835
                    Height =270
                    TabIndex =4
                    BackColor =12632256
                    Name ="colname"
                    ControlSource ="colname"
                    StatusBarText ="Form Name"
                    Tag ="m3"
                    ControlTipText ="betroffenes Feld"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =1385
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =1655
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =1385
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblSpaltenname"
                            Caption ="Spaltenname"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =1385
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =1655
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =697
                    Width =2835
                    Height =270
                    TabIndex =5
                    BackColor =12632256
                    Name ="keycol"
                    ControlSource ="keycol"
                    StatusBarText ="Form Name"
                    OnDblClick ="[Event Procedure]"
                    Tag ="m1"
                    ControlTipText ="betroffene ID; Doppelklick zeigt Datensatz im Formular"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =697
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =967
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =697
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblFeldname"
                            Caption ="Primärschlüssel"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =697
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =967
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    Left =14157
                    Top =685
                    Width =6237
                    Height =1928
                    TabIndex =6
                    Name ="oldVal"
                    ControlSource ="oldVal"
                    Tag ="Del1"
                    ControlTipText ="alter Wert (vor Änderung)"

                    LayoutCachedLeft =14157
                    LayoutCachedTop =685
                    LayoutCachedWidth =20394
                    LayoutCachedHeight =2613
                    BackThemeColorIndex =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =14157
                            Top =345
                            Width =6237
                            Height =255
                            FontWeight =700
                            ForeColor =2366701
                            Name ="Bezeichnungsfeld17"
                            Caption ="alter Wert"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =14157
                            LayoutCachedTop =345
                            LayoutCachedWidth =20394
                            LayoutCachedHeight =600
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    Left =14157
                    Top =3241
                    Width =6237
                    Height =1644
                    TabIndex =7
                    BackColor =13434828
                    Name ="newval"
                    ControlSource ="newval"
                    Tag ="Del1"
                    ControlTipText ="neuer Wert (nach Änderung)"

                    LayoutCachedLeft =14157
                    LayoutCachedTop =3241
                    LayoutCachedWidth =20394
                    LayoutCachedHeight =4885
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =14157
                            Top =2953
                            Width =6237
                            Height =255
                            FontWeight =700
                            ForeColor =5026082
                            Name ="Bezeichnungsfeld29"
                            Caption ="neuer Wert"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =14157
                            LayoutCachedTop =2953
                            LayoutCachedWidth =20394
                            LayoutCachedHeight =3208
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =352
                    Width =2835
                    Height =270
                    TabIndex =8
                    BackColor =12632256
                    Name ="NrAudit"
                    ControlSource ="NrAudit"
                    StatusBarText ="Form Name"
                    Tag ="m1"
                    ControlTipText ="betroffene ID"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =352
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =622
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    MultiSelect =2
                    IMESentenceMode =3
                    ColumnCount =8
                    Left =108
                    Top =5097
                    Width =16905
                    Height =6243
                    TabIndex =9
                    BackColor =14803425
                    Name ="lstDet"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1418;1418;1418;1134;4536;4536;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    OnKeyDown ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der gefilterten (40) Daten für Audit\015\012Verwenden Sie die Pfeiltasten,"
                        " um zu blättern.\015\012Nutzen Sie die CTRL-/SHIFT-Tasten für die Markierung"

                    LayoutCachedLeft =108
                    LayoutCachedTop =5097
                    LayoutCachedWidth =17013
                    LayoutCachedHeight =11340
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =105
                    Top =625
                    Width =2268
                    Height =2271
                    TabIndex =10
                    BackColor =14803425
                    Name ="lstA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =105
                    LayoutCachedTop =625
                    LayoutCachedWidth =2373
                    LayoutCachedHeight =2896
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =1
                    IMESentenceMode =3
                    Left =1065
                    Top =4740
                    Width =3471
                    Height =255
                    FontWeight =600
                    TabIndex =11
                    BackColor =12975858
                    BorderColor =0
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    ControlTipText ="Geben Sie Ihren Suchbegriff hier ein: Suche in allen wichtigen Feldern"
                    AsianLineBreak =255

                    LayoutCachedLeft =1065
                    LayoutCachedTop =4740
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =4995
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =1
                    IMESentenceMode =3
                    Left =105
                    Top =4740
                    Width =849
                    Height =227
                    FontWeight =600
                    TabIndex =12
                    BackColor =12910525
                    BorderColor =0
                    Name ="countRec"
                    ControlTipText ="Anzahl der gefundenen Datensätze"
                    AsianLineBreak =255

                    LayoutCachedLeft =105
                    LayoutCachedTop =4740
                    LayoutCachedWidth =954
                    LayoutCachedHeight =4967
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
                    Left =4574
                    Top =4725
                    Width =246
                    Height =255
                    TabIndex =13
                    BackColor =12975858
                    BorderColor =0
                    Name ="comtxtFind"
                    RowSourceType ="Value List"
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Anrede auswählen"

                    LayoutCachedLeft =4574
                    LayoutCachedTop =4725
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =4980
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =1
                    Left =11097
                    Top =2386
                    Width =2835
                    Height =270
                    TabIndex =14
                    BackColor =12632256
                    Name ="Art"
                    ControlSource ="Art"
                    StatusBarText ="Form Name"
                    Tag ="m1"
                    ControlTipText ="Art der Änderung (siehe auch Liste links)"

                    LayoutCachedLeft =11097
                    LayoutCachedTop =2386
                    LayoutCachedWidth =13932
                    LayoutCachedHeight =2656
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =9510
                            Top =2386
                            Width =1440
                            Height =270
                            FontWeight =700
                            Name ="lblArt"
                            Caption ="Art"
                            Tag ="DetachedLabel"
                            LayoutCachedLeft =9510
                            LayoutCachedTop =2386
                            LayoutCachedWidth =10950
                            LayoutCachedHeight =2656
                        End
                    End
                End
                Begin ListBox
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =113
                    Top =2948
                    Width =2268
                    Height =1701
                    TabIndex =15
                    BackColor =16773098
                    Name ="lstTopA"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Wieviele Datensätze sollen gezeigt werden"

                    LayoutCachedLeft =113
                    LayoutCachedTop =2948
                    LayoutCachedWidth =2381
                    LayoutCachedHeight =4649
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2552
                    Top =113
                    Width =2268
                    Height =2783
                    TabIndex =16
                    BackColor =14803425
                    Name ="lstTabelle"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =2552
                    LayoutCachedTop =113
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =2896
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =4988
                    Top =113
                    Width =3402
                    Height =2798
                    TabIndex =17
                    BackColor =14803425
                    Name ="lstUser"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2268"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der User"

                    LayoutCachedLeft =4988
                    LayoutCachedTop =113
                    LayoutCachedWidth =8390
                    LayoutCachedHeight =2911
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =2552
                    Top =2948
                    Width =2268
                    Height =1701
                    TabIndex =18
                    BackColor =14803425
                    Name ="lstC"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    ShortcutMenuBar ="cbEmpty"

                    LayoutCachedLeft =2552
                    LayoutCachedTop =2948
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =4649
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =17574
                    Top =5102
                    Width =4536
                    Height =2723
                    TabIndex =19
                    BackColor =14803425
                    Name ="lstActualUser"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="0"
                    OnClick ="[Event Procedure]"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Liste der aktuellen User (ermittelt aus Anmeldungen ohne Abmeldungen seit gester"
                        "n)\015\012Doppelklick zum Refresh der Liste"

                    LayoutCachedLeft =17574
                    LayoutCachedTop =5102
                    LayoutCachedWidth =22110
                    LayoutCachedHeight =7825
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =8617
                    Top =4216
                    Width =4110
                    Height =435
                    FontSize =12
                    TabIndex =20
                    ForeColor =255
                    Name ="btnInsertDeleted"
                    Caption ="Wiederherstellen..."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Wiederherstellen eines gelöschten Datensatzes  (geht nur für ADMIN)"

                    LayoutCachedLeft =8617
                    LayoutCachedTop =4216
                    LayoutCachedWidth =12727
                    LayoutCachedHeight =4651
                    HoverForeColor =255
                    PressedForeColor =255
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    SpecialEffect =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =4988
                    Top =2948
                    Width =3402
                    Height =2003
                    TabIndex =21
                    BackColor =14803425
                    Name ="lstT"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Filter nach Änderungszeitpunkt der Änderungen"

                    LayoutCachedLeft =4988
                    LayoutCachedTop =2948
                    LayoutCachedWidth =8390
                    LayoutCachedHeight =4951
                End
            End
        End
    End
End
CodeBehindForm
' See "F_Audit.cls"
