Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    AutoCenter = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    AllowUpdating =4
    ViewsAllowed =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7920
    RowHeight =315
    ItemSuffix =84
    Left =-570
    Top =1140
    Right =24960
    Bottom =13710
    Tag ="F_Adresse"
    ShortcutMenuBar ="tlbOHrightMouseTab"
    RecSrcDt = Begin
        0x69482a804c0be640
    End
    RecordSource ="qdfTab"
    Caption ="Adressen in Tabellenform"
    AfterUpdate ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnClick ="[Event Procedure]"
    OnDblClick ="[Event Procedure]"
    AllowFormView =0
    FetchDefaults =0
    FilterOnLoad =0
    OrderByOnLoad =0
    SplitFormDatasheet =1
    FetchDefaults =0
    OrderByOnLoad =0
    SplitFormDatasheet =1
    ShowPageMargins =0
    DatasheetAlternateBackColor =15266810
    DatasheetGridlinesColor12 =12632256
    RibbonName ="TabTab"
    FitToScreen =255
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
            Height =11156
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =363
                    Width =1479
                    ColumnWidth =-2
                    ColumnOrder =0
                    BackColor =16777215
                    ForeColor =0
                    Name ="NrFunktion"
                    ControlSource ="NrFunktion"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =363
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =603
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =726
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =1
                    TabIndex =1
                    BackColor =16777215
                    ForeColor =0
                    Name ="Anrede"
                    ControlSource ="Anrede"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =726
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =981
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =1089
                    Width =1479
                    Height =255
                    ColumnWidth =2685
                    ColumnOrder =2
                    TabIndex =2
                    BackColor =16777215
                    ForeColor =0
                    Name ="Wer"
                    ControlSource ="Wer"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =1089
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =1344
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =1452
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =3
                    TabIndex =3
                    BackColor =16777215
                    ForeColor =0
                    Name ="Wo"
                    ControlSource ="Wo"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =1452
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =1707
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =1815
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =4
                    TabIndex =4
                    BackColor =16777215
                    ForeColor =0
                    Name ="Was"
                    ControlSource ="Was"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =1815
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =2070
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =2178
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =5
                    TabIndex =5
                    BackColor =16777215
                    ForeColor =0
                    Name ="Telefon"
                    ControlSource ="Telefon"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =2178
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =2433
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =2541
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =6
                    TabIndex =6
                    BackColor =16777215
                    ForeColor =0
                    Name ="Mobil"
                    ControlSource ="Mobil"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =2541
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =2796
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =2904
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =7
                    TabIndex =7
                    BackColor =16777215
                    ForeColor =0
                    Name ="Branche"
                    ControlSource ="Branche"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =2904
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =3159
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    IsHyperlink = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =3267
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =8
                    TabIndex =8
                    BackColor =16777215
                    ForeColor =0
                    Name ="LastUpdate"
                    ControlSource ="LastUpdate"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =3267
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =3522
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    IsHyperlink = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =3630
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =9
                    TabIndex =9
                    BackColor =16777215
                    ForeColor =0
                    Name ="Marker"
                    ControlSource ="Marker"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =3630
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =3885
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    IsHyperlink = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =10
                    TabIndex =10
                    BackColor =16777215
                    ForeColor =0
                    Name ="Kurzzeichen"
                    ControlSource ="Kurzzeichen"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1143
                    Top =3993
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =11
                    TabIndex =11
                    BackColor =16777215
                    ForeColor =0
                    Name ="EndeFunktion"
                    ControlSource ="EndeFunktion"
                    FontName ="Arial"

                    LayoutCachedLeft =1143
                    LayoutCachedTop =3993
                    LayoutCachedWidth =2622
                    LayoutCachedHeight =4248
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =4356
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =12
                    TabIndex =12
                    BackColor =16777215
                    Name ="AnschriftPrivat"
                    ControlSource ="AnschriftPrivat"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =4356
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =4611
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =4719
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =13
                    TabIndex =13
                    BackColor =16777215
                    Name ="AnschriftFirma"
                    ControlSource ="AnschriftFirma"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =4719
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =4974
                End
                Begin TextBox
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =5082
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =14
                    TabIndex =14
                    BackColor =16777215
                    Name ="landfirma"
                    ControlSource ="landfirma"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =5082
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =5337
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =5445
                    Width =1479
                    Height =255
                    ColumnWidth =990
                    ColumnOrder =15
                    TabIndex =15
                    BackColor =16777215
                    Name ="Anwahl"
                    ControlSource ="Anwahl"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =5445
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =5700
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =5808
                    Width =1479
                    Height =255
                    ColumnWidth =2010
                    ColumnOrder =16
                    TabIndex =16
                    BackColor =16777215
                    Name ="erfasst"
                    ControlSource ="erfasst"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =5808
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =6063
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =6171
                    Width =1479
                    Height =255
                    ColumnWidth =1755
                    ColumnOrder =17
                    TabIndex =17
                    BackColor =16777215
                    Name ="f17"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =6171
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =6426
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =6534
                    Width =1479
                    Height =255
                    ColumnWidth =1044
                    ColumnOrder =18
                    TabIndex =18
                    BackColor =16777215
                    Name ="f18"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =6534
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =6789
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =6897
                    Width =1479
                    Height =255
                    ColumnWidth =735
                    ColumnOrder =19
                    TabIndex =19
                    BackColor =16777215
                    Name ="f19"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =6897
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =7152
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =7260
                    Width =1479
                    Height =255
                    ColumnWidth =3105
                    ColumnOrder =20
                    TabIndex =20
                    BackColor =16777215
                    Name ="f20"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =7260
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =7515
                End
                Begin TextBox
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =7623
                    Width =1479
                    Height =255
                    ColumnWidth =-2
                    ColumnOrder =21
                    TabIndex =21
                    BackColor =16777215
                    ForeColor =0
                    Name ="f21"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =7623
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =7878
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =7986
                    Width =1479
                    Height =255
                    ColumnOrder =22
                    TabIndex =22
                    BackColor =16777215
                    ForeColor =0
                    Name ="f22"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =7986
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =8241
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =8349
                    Width =1479
                    Height =255
                    ColumnOrder =23
                    TabIndex =23
                    BackColor =16777215
                    ForeColor =0
                    Name ="f23"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =8349
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =8604
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =8712
                    Width =1479
                    Height =255
                    ColumnOrder =24
                    TabIndex =24
                    BackColor =16777215
                    ForeColor =0
                    Name ="f24"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =8712
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =8967
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =9075
                    Width =1479
                    Height =255
                    ColumnOrder =25
                    TabIndex =25
                    BackColor =16777215
                    ForeColor =0
                    Name ="f25"
                    FontName ="Arial"
                    ControlTipText ="Doppelclick filtert entsprechende Datensätze"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =9075
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =9330
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =9438
                    Width =1479
                    Height =255
                    ColumnOrder =26
                    TabIndex =26
                    BackColor =16777215
                    ForeColor =0
                    Name ="f26"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =9438
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =9693
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =9801
                    Width =1479
                    Height =255
                    ColumnOrder =27
                    TabIndex =27
                    BackColor =16777215
                    ForeColor =0
                    Name ="f27"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =9801
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =10056
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =10164
                    Width =1479
                    Height =255
                    ColumnOrder =28
                    TabIndex =28
                    BackColor =16777215
                    ForeColor =0
                    Name ="f28"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =10164
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =10419
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =10527
                    Width =1479
                    Height =255
                    ColumnOrder =29
                    TabIndex =29
                    BackColor =16777215
                    ForeColor =0
                    Name ="f29"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =10527
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =10782
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    AutoTab = NotDefault
                    AllowAutoCorrect = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =10890
                    Width =1479
                    Height =255
                    ColumnWidth =2052
                    ColumnOrder =30
                    TabIndex =30
                    BackColor =16777215
                    ForeColor =0
                    Name ="f30"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =10890
                    LayoutCachedWidth =2612
                    LayoutCachedHeight =11145
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_Tab.cls"
