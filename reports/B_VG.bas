Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    TabularFamily =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10220
    DatasheetFontHeight =10
    ItemSuffix =238
    OnNoData ="[Event Procedure]"
    Toolbar ="tlbOHR"
    RecSrcDt = Begin
        0x88eafb159d4ee640
    End
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnDeactivate ="[Event Procedure]"
    FilterOnLoad =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            FontItalic = NotDefault
            BackStyle =0
            TextAlign =1
            TextFontFamily =18
            FontSize =11
            FontWeight =700
            ForeColor =8388608
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BackStyle =0
            BorderWidth =1
            BorderLineStyle =0
            Width =850
            Height =850
            BorderColor =8388608
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderColor =8388608
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            FELineBreak = NotDefault
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
            AsianLineBreak =255
            ShowDatePicker =0
        End
        Begin ListBox
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontName ="Arial"
        End
        Begin ComboBox
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
        End
        Begin Subform
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            Width =4536
            Height =2835
        End
        Begin PageBreak
            Width =283
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="id1"
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="id2"
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="id3"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="id4"
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="id5"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            ControlSource ="id6"
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="id7"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="id8"
        End
        Begin BreakLevel
            SortOrder = NotDefault
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="MWSTx"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            ControlSource ="PosnrSort"
        End
        Begin PageHeader
            Height =1146
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Image
                    Visible = NotDefault
                    SizeMode =3
                    Top =56
                    Width =5893
                    Height =670
                    BorderColor =16711680
                    Name ="LogoSeiteO2"

                    LayoutCachedTop =56
                    LayoutCachedWidth =5893
                    LayoutCachedHeight =726
                    TabIndex =7
                End
                Begin Image
                    SizeMode =3
                    PictureType =2
                    Left =9070
                    Width =1134
                    Height =1134
                    Name ="picBC"

                    LayoutCachedLeft =9070
                    LayoutCachedWidth =10204
                    LayoutCachedHeight =1134
                    TabIndex =8
                End
                Begin Image
                    SizeMode =3
                    Width =9072
                    Height =1146
                    BorderColor =16711680
                    Name ="LogoSeiteO"

                    LayoutCachedWidth =9072
                    LayoutCachedHeight =1146
                    TabIndex =6
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextFontFamily =0
                    BackStyle =1
                    Width =630
                    ColumnOrder =6
                    TabIndex =3
                    Name ="SK1"
                    ControlSource ="SK1"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedWidth =630
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =680
                    Width =804
                    ColumnOrder =7
                    TabIndex =4
                    Name ="SK2"
                    ControlSource ="SK2"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =680
                    LayoutCachedWidth =1484
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1814
                    Width =4305
                    ColumnOrder =8
                    TabIndex =5
                    Name ="SK3"
                    ControlSource ="SK3"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1814
                    LayoutCachedWidth =6119
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =6404
                    ColumnOrder =5
                    TabIndex =2
                    Name ="SK4"
                    ControlSource ="SK4"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =6404
                    LayoutCachedWidth =8105
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8864
                    Width =1017
                    ColumnOrder =4
                    TabIndex =1
                    Name ="SK6"
                    ControlSource ="SK6"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8864
                    LayoutCachedWidth =9881
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8094
                    Width =777
                    ColumnOrder =3
                    Name ="SK5"
                    ControlSource ="SK5"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8094
                    LayoutCachedWidth =8871
                    LayoutCachedHeight =240
                    ForeThemeColorIndex =0
                End
            End
        End
        Begin BreakHeader
            CanGrow = NotDefault
            Height =2070
            BreakLevel =3
            OnFormat ="[Event Procedure]"
            Name ="GKID"
            BackThemeColorIndex =1
            Begin
                Begin Image
                    Visible = NotDefault
                    BackStyle =0
                    SizeMode =3
                    Left =6746
                    Width =2607
                    Height =1690
                    BackColor =255
                    BorderColor =255
                    Name ="LogoAdresse"

                    LayoutCachedLeft =6746
                    LayoutCachedWidth =9353
                    LayoutCachedHeight =1690
                    TabIndex =46
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    BorderWidth =1
                    Left =6804
                    Width =2838
                    Height =1585
                    TabIndex =20
                    BackColor =255
                    BorderColor =16711935
                    Name ="TX_EFAbsender"
                    AsianLineBreak =0

                    LayoutCachedLeft =6804
                    LayoutCachedWidth =9642
                    LayoutCachedHeight =1585
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =56
                    Width =966
                    FontSize =9
                    TabIndex =13
                    BackColor =65535
                    Name ="FirmenName"
                    ControlSource ="Firma"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =56
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =296
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3515
                    Top =56
                    Width =966
                    FontSize =9
                    TabIndex =21
                    BackColor =65535
                    BorderColor =255
                    Name ="VGSprache"
                    ControlSource ="VGSprache"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3515
                    LayoutCachedTop =56
                    LayoutCachedWidth =4481
                    LayoutCachedHeight =296
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =56
                    Width =966
                    FontSize =9
                    TabIndex =18
                    BackColor =65535
                    Name ="ArtAdresse"
                    ControlSource ="ArtAdresse"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =56
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =296
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    BackStyle =1
                    Top =90
                    Width =5655
                    Height =270
                    TabIndex =2
                    Name ="TX_EFKlein"
                    AsianLineBreak =0

                    LayoutCachedTop =90
                    LayoutCachedWidth =5655
                    LayoutCachedHeight =360
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =170
                    Width =966
                    FontSize =9
                    TabIndex =35
                    BackColor =65535
                    Name ="NrQK"
                    ControlSource ="NrQK"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =170
                    LayoutCachedWidth =6691
                    LayoutCachedHeight =410
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =7653
                    Top =283
                    Width =966
                    FontSize =9
                    TabIndex =36
                    BackColor =65535
                    Name ="NrVG"
                    ControlSource ="NrVG"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =7653
                    LayoutCachedTop =283
                    LayoutCachedWidth =8619
                    LayoutCachedHeight =523
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =8674
                    Top =283
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =40
                    BackColor =65535
                    Name ="Barcodetxt"
                    ControlSource ="Barcodetxt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8674
                    LayoutCachedTop =283
                    LayoutCachedWidth =9640
                    LayoutCachedHeight =508
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =296
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =23
                    BackColor =65535
                    Name ="NrFirma"
                    ControlSource ="NrFirma"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =296
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =521
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =296
                    Width =966
                    FontSize =9
                    TabIndex =12
                    BackColor =65535
                    Name ="VNr"
                    ControlSource ="VNr"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =296
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =536
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3515
                    Top =296
                    Width =966
                    FontSize =9
                    TabIndex =24
                    BackColor =65535
                    BorderColor =255
                    Name ="DefReport"
                    ControlSource ="DefReport"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3515
                    LayoutCachedTop =296
                    LayoutCachedWidth =4481
                    LayoutCachedHeight =536
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =296
                    Width =966
                    FontSize =9
                    TabIndex =4
                    BackColor =65535
                    Name ="FirmaAdresse"
                    ControlSource ="NrFirma"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =296
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =536
                End
                Begin TextBox
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Top =487
                    Width =5649
                    Height =1179
                    FontSize =10
                    TabIndex =1
                    BackColor =16711935
                    Name ="Adresse"
                    ControlSource ="Adresse"
                    AsianLineBreak =0

                    LayoutCachedTop =487
                    LayoutCachedWidth =5649
                    LayoutCachedHeight =1666
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =510
                    Width =966
                    FontSize =9
                    TabIndex =29
                    BackColor =65535
                    Name ="ID2"
                    ControlSource ="ID2"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =510
                    LayoutCachedWidth =6691
                    LayoutCachedHeight =750
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =521
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =28
                    BackColor =65535
                    Name ="vgdatumX"
                    ControlSource ="vgdatumX"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =521
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =746
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =536
                    Width =966
                    FontSize =9
                    TabIndex =6
                    BackColor =65535
                    Name ="VGPrint"
                    ControlSource ="VGPrint"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =536
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =776
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3515
                    Top =536
                    Width =966
                    FontSize =9
                    TabIndex =10
                    BackColor =65535
                    Name ="VGID"
                    ControlSource ="VGID"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3515
                    LayoutCachedTop =536
                    LayoutCachedWidth =4481
                    LayoutCachedHeight =776
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =536
                    Width =966
                    FontSize =9
                    TabIndex =5
                    BackColor =65535
                    Name ="Email"
                    ControlSource ="Email"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =536
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =776
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =6746
                    Top =566
                    Width =966
                    Height =255
                    FontSize =9
                    TabIndex =43
                    BackColor =65535
                    Name ="Rahmenvertrag"
                    ControlSource ="Rahmenvertrag"
                    Format ="General Number"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =6746
                    LayoutCachedTop =566
                    LayoutCachedWidth =7712
                    LayoutCachedHeight =821
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =746
                    Width =966
                    FontSize =9
                    TabIndex =11
                    BackColor =65535
                    Name ="Fax"
                    ControlSource ="Fax"
                    Format ="General Number"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =746
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =986
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =776
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =26
                    BackColor =65535
                    Name ="VGAbschluss"
                    ControlSource ="VGAbschluss"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =776
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =1001
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3515
                    Top =776
                    Width =966
                    FontSize =9
                    TabIndex =7
                    BackColor =65535
                    Name ="ID1"
                    ControlSource ="ID1"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3515
                    LayoutCachedTop =776
                    LayoutCachedWidth =4481
                    LayoutCachedHeight =1016
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =776
                    Width =966
                    FontSize =9
                    TabIndex =27
                    BackColor =65535
                    Name ="LayoutLand"
                    ControlSource ="LayoutLand"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =776
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =1016
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =680
                    Top =793
                    Width =3060
                    Height =270
                    FontSize =10
                    Name ="FeldDatum"
                    AsianLineBreak =0

                    LayoutCachedLeft =680
                    LayoutCachedTop =793
                    LayoutCachedWidth =3740
                    LayoutCachedHeight =1063
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =7370
                    Top =907
                    Width =2211
                    FontSize =9
                    TabIndex =33
                    BackColor =65535
                    Name ="Druckvorlage"
                    ControlSource ="Druckvorlage"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =7370
                    LayoutCachedTop =907
                    LayoutCachedWidth =9581
                    LayoutCachedHeight =1147
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =870
                    Width =966
                    FontSize =9
                    TabIndex =31
                    BackColor =65535
                    Name ="FileN"
                    ControlSource ="FileN"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =870
                    LayoutCachedWidth =6691
                    LayoutCachedHeight =1110
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =870
                    Width =966
                    FontSize =9
                    TabIndex =34
                    BackColor =65535
                    Name ="Xunterschrift"
                    ControlSource ="Xunterschrift"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =870
                    LayoutCachedWidth =6691
                    LayoutCachedHeight =1110
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =986
                    Width =966
                    FontSize =9
                    TabIndex =17
                    BackColor =65535
                    Name ="QK"
                    ControlSource ="QK"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =986
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =1226
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =1001
                    Width =966
                    FontSize =9
                    TabIndex =19
                    BackColor =65535
                    Name ="KZMA"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =1001
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =1241
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =1016
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =25
                    BackColor =65535
                    Name ="VGIDu"
                    ControlSource ="VGIDu"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =1016
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =1241
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3514
                    Top =1077
                    Width =966
                    FontSize =9
                    TabIndex =38
                    BackColor =65535
                    Name ="ProjektNr"
                    ControlSource ="ProjektNr"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3514
                    LayoutCachedTop =1077
                    LayoutCachedWidth =4480
                    LayoutCachedHeight =1317
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    BackStyle =1
                    Left =9524
                    Top =1133
                    Width =696
                    Height =285
                    FontSize =10
                    TabIndex =42
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="Gesamtübersicht"
                    ControlSource ="Gesamtübersicht"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =9524
                    LayoutCachedTop =1133
                    LayoutCachedWidth =10220
                    LayoutCachedHeight =1418
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =1226
                    Width =966
                    FontSize =9
                    TabIndex =3
                    BackColor =65535
                    Name ="Personadresse"
                    ControlSource ="NrPerson"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =1226
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =1466
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =1241
                    Width =966
                    Height =270
                    FontSize =9
                    TabIndex =15
                    BackColor =65535
                    Name ="VGWährung"
                    ControlSource ="VGWährung"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =1241
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =1511
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4536
                    Top =1241
                    Width =966
                    FontSize =9
                    TabIndex =8
                    BackColor =65535
                    Name ="VGNr"
                    ControlSource ="VGNr"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4536
                    LayoutCachedTop =1241
                    LayoutCachedWidth =5502
                    LayoutCachedHeight =1481
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5782
                    Top =1247
                    Width =2031
                    FontSize =9
                    TabIndex =32
                    BackColor =65535
                    Name ="Gelangensbestätigung"
                    ControlSource ="Gelangensbestätigung"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5782
                    LayoutCachedTop =1247
                    LayoutCachedWidth =7813
                    LayoutCachedHeight =1487
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =7937
                    Top =1247
                    Width =966
                    FontSize =9
                    TabIndex =37
                    BackColor =65535
                    Name ="VGBEMNeueSeite"
                    ControlSource ="VGBEMNeueSeite"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =7937
                    LayoutCachedTop =1247
                    LayoutCachedWidth =8903
                    LayoutCachedHeight =1487
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3514
                    Top =1437
                    Width =966
                    FontSize =9
                    TabIndex =39
                    BackColor =65535
                    Name ="ReportCaption"
                    ControlSource ="ReportCaption"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3514
                    LayoutCachedTop =1437
                    LayoutCachedWidth =4480
                    LayoutCachedHeight =1677
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1474
                    Top =1466
                    Width =966
                    FontSize =9
                    TabIndex =22
                    BackColor =65535
                    BorderColor =255
                    Name ="Anschrift"
                    ControlSource ="Anschrift"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1474
                    LayoutCachedTop =1466
                    LayoutCachedWidth =2440
                    LayoutCachedHeight =1706
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =1511
                    Width =966
                    FontSize =9
                    TabIndex =9
                    BackColor =65535
                    Name ="PrintMarkerVG"
                    ControlSource ="PrintMarkerVG"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =1511
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =1751
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =1590
                    Width =3351
                    FontSize =9
                    TabIndex =30
                    BackColor =65535
                    Name ="Achtung"
                    ControlSource ="Achtung"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =1590
                    LayoutCachedWidth =9076
                    LayoutCachedHeight =1830
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2495
                    Top =1751
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =14
                    BackColor =65535
                    Name ="IDQK"
                    ControlSource ="IDQK"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2495
                    LayoutCachedTop =1751
                    LayoutCachedWidth =3461
                    LayoutCachedHeight =1976
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5725
                    Top =1770
                    Width =3351
                    FontSize =9
                    TabIndex =41
                    BackColor =65535
                    Name ="Absenderadresse"
                    ControlSource ="Absenderadresse"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =5725
                    LayoutCachedTop =1770
                    LayoutCachedWidth =9076
                    LayoutCachedHeight =2010
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =1785
                    Width =5676
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =16
                    Name ="FAXEmailInfo"
                    ControlSource ="FAXEmailInfo"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =1785
                    LayoutCachedWidth =5676
                    LayoutCachedHeight =2070
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =8390
                    Top =566
                    Width =966
                    FontSize =9
                    TabIndex =44
                    BackColor =65535
                    Name ="blRabatt"
                    ControlSource ="blRabatt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8390
                    LayoutCachedTop =566
                    LayoutCachedWidth =9356
                    LayoutCachedHeight =806
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2777
                    Top =1814
                    Width =3351
                    FontSize =9
                    TabIndex =45
                    BackColor =65535
                    Name ="Rechnungsformat"
                    ControlSource ="Rechnungsformat"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2777
                    LayoutCachedTop =1814
                    LayoutCachedWidth =6128
                    LayoutCachedHeight =2054
                End
            End
        End
        Begin BreakHeader
            CanGrow = NotDefault
            Height =680
            BreakLevel =5
            Name ="GKAnrede"
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    BackStyle =1
                    BorderWidth =1
                    TextFontFamily =0
                    Left =2840
                    Width =6516
                    Height =567
                    FontSize =9
                    FontWeight =400
                    BackColor =65535
                    ForeColor =255
                    Name ="ErklärungGKAnrede"
                    Caption ="hier befinden sich die Felder Betreff für Brief, Anrede und Einleitung (Höhe =0)"
                        " - Abstände werden in SQL definiert (@nl)"
                    FontName ="ARIAL"
                    LayoutCachedLeft =2840
                    LayoutCachedWidth =9356
                    LayoutCachedHeight =567
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =113
                    Width =9825
                    Height =45
                    FontSize =10
                    FontWeight =700
                    Name ="VGBrief"
                    ControlSource ="VGBrief"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =113
                    LayoutCachedWidth =9825
                    LayoutCachedHeight =158
                    BackThemeColorIndex =1
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =158
                    Width =9825
                    Height =270
                    FontSize =10
                    TabIndex =1
                    BorderColor =2366701
                    Name ="Anrede"
                    ControlSource ="Anrede"
                    AsianLineBreak =0

                    LayoutCachedTop =158
                    LayoutCachedWidth =9825
                    LayoutCachedHeight =428
                    BackThemeColorIndex =1
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =428
                    Width =9825
                    Height =57
                    FontSize =10
                    TabIndex =2
                    BorderColor =2366701
                    Name ="EinleitungX"
                    ControlSource ="EinleitungX"
                    AsianLineBreak =0

                    LayoutCachedTop =428
                    LayoutCachedWidth =9825
                    LayoutCachedHeight =485
                    BackThemeColorIndex =1
                    ForeThemeColorIndex =0
                End
            End
        End
        Begin BreakHeader
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =1020
            BreakLevel =7
            Name ="GKVG"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =45
                    Width =2769
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="VGArt"
                    ControlSource ="VGArt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =45
                    LayoutCachedWidth =2769
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2835
                    Top =45
                    Width =6984
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="VGtext"
                    ControlSource ="VGtext"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2835
                    LayoutCachedTop =45
                    LayoutCachedWidth =9819
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =6122
                    Top =152
                    Width =966
                    Height =255
                    FontSize =9
                    TabIndex =5
                    BackColor =65535
                    Name ="VG"
                    ControlSource ="VG"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =6122
                    LayoutCachedTop =152
                    LayoutCachedWidth =7088
                    LayoutCachedHeight =407
                End
                Begin Subform
                    CanShrink = NotDefault
                    Top =360
                    Width =9814
                    Height =237
                    TabIndex =6
                    Name ="UB_VGtxt"
                    SourceObject ="Report.UB_VGtxt"
                    LinkChildFields ="ID1"
                    LinkMasterFields ="ID1"

                    LayoutCachedTop =360
                    LayoutCachedWidth =9814
                    LayoutCachedHeight =597
                End
                Begin TextBox
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =6404
                    Top =750
                    Height =225
                    TabIndex =2
                    RightMargin =57
                    Name ="TextEinzelPreis"
                    ControlSource ="SK4"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"
                    AsianLineBreak =0

                    LayoutCachedLeft =6404
                    LayoutCachedTop =750
                    LayoutCachedWidth =8105
                    LayoutCachedHeight =975
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =2
                    TextFontFamily =0
                    BackStyle =1
                    Left =8120
                    Top =750
                    Width =777
                    Height =225
                    Name ="Rabatt"
                    ControlSource ="SK5"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"
                    AsianLineBreak =0

                    LayoutCachedLeft =8120
                    LayoutCachedTop =750
                    LayoutCachedWidth =8897
                    LayoutCachedHeight =975
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8948
                    Top =750
                    Width =987
                    Height =225
                    TabIndex =1
                    Name ="TextEPreis"
                    ControlSource ="SK6"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"
                    AsianLineBreak =0

                    LayoutCachedLeft =8948
                    LayoutCachedTop =750
                    LayoutCachedWidth =9935
                    LayoutCachedHeight =975
                End
                Begin TextBox
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    IMESentenceMode =3
                    Left =1814
                    Top =750
                    Width =4305
                    Height =225
                    TabIndex =7
                    Name ="Bezeichnung"
                    ControlSource ="SK3"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"

                    LayoutCachedLeft =1814
                    LayoutCachedTop =750
                    LayoutCachedWidth =6119
                    LayoutCachedHeight =975
                End
                Begin TextBox
                    BorderWidth =1
                    TextAlign =2
                    TextFontFamily =0
                    BackStyle =1
                    IMESentenceMode =3
                    Left =680
                    Top =750
                    Width =804
                    Height =225
                    TabIndex =8
                    Name ="TxtAnzahl"
                    ControlSource ="SK2"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"

                    LayoutCachedLeft =680
                    LayoutCachedTop =750
                    LayoutCachedWidth =1484
                    LayoutCachedHeight =975
                End
                Begin TextBox
                    BorderWidth =1
                    TextFontFamily =0
                    BackStyle =1
                    IMESentenceMode =3
                    Top =750
                    Width =680
                    Height =225
                    TabIndex =9
                    Name ="txtPos"
                    ControlSource ="SK1"
                    FontName ="ARIAL"
                    Tag ="lblÜberschriften"

                    LayoutCachedTop =750
                    LayoutCachedWidth =680
                    LayoutCachedHeight =975
                End
                Begin Line
                    Visible = NotDefault
                    LineSlant = NotDefault
                    Top =737
                    Width =9923
                    BorderColor =0
                    Name ="LinGKVG1"
                    LayoutCachedTop =737
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =737
                End
            End
        End
        Begin BreakHeader
            Visible = NotDefault
            CanGrow = NotDefault
            Height =0
            BreakLevel =8
            Name ="ghMWStx"
        End
        Begin BreakHeader
            Visible = NotDefault
            CanGrow = NotDefault
            Height =375
            BreakLevel =9
            OnFormat ="[Event Procedure]"
            Name ="ghPosnr"
            Begin
                Begin TextBox
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextFontFamily =0
                    Top =45
                    Width =801
                    Height =285
                    FontSize =10
                    FontWeight =700
                    Name ="Text118"
                    ControlSource ="Posnr"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =45
                    LayoutCachedWidth =801
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =2124
                    Top =45
                    Width =6105
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="ArtikelTextL1"
                    ControlSource ="ArtikelTextL"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2124
                    LayoutCachedTop =45
                    LayoutCachedWidth =8229
                    LayoutCachedHeight =330
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =2130
                    Top =330
                    Width =7221
                    Height =45
                    FontSize =10
                    TabIndex =2
                    Name ="BemVGDetTitel"
                    ControlSource ="BemVGDet"
                    AsianLineBreak =0
                    TextFormat =1

                    LayoutCachedLeft =2130
                    LayoutCachedTop =330
                    LayoutCachedWidth =9351
                    LayoutCachedHeight =375
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    Left =8353
                    Top =45
                    Width =1578
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="SumTitelNr"
                    Format ="Standard"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8353
                    LayoutCachedTop =45
                    LayoutCachedWidth =9931
                    LayoutCachedHeight =330
                End
                Begin PageBreak
                    Name ="nextPagePosnr"
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    Left =480
                    Width =2835
                    Height =0
                    FontSize =9
                    FontWeight =700
                    TabIndex =4
                    BorderColor =16777215
                    ForeColor =16777215
                    Name ="SeiteBeeinflussenPosnr"
                    AsianLineBreak =0

                    LayoutCachedLeft =480
                    LayoutCachedWidth =3315
                End
                Begin Line
                    LineSlant = NotDefault
                    Left =480
                    Width =9359
                    BorderColor =0
                    Name ="linghPosnr"
                    LayoutCachedLeft =480
                    LayoutCachedWidth =9839
                End
            End
        End
        Begin Section
            Visible = NotDefault
            CanGrow = NotDefault
            Height =492
            OnFormat ="[Event Procedure]"
            Name ="Det"
            BackThemeColorIndex =1
            Begin
                Begin PageBreak
                    Name ="nextPage"
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    Left =831
                    Width =2835
                    Height =6
                    FontSize =9
                    FontWeight =700
                    BorderColor =16777215
                    ForeColor =16777215
                    Name ="SeiteBeeinflussen"
                    AsianLineBreak =0

                    LayoutCachedLeft =831
                    LayoutCachedWidth =3666
                    LayoutCachedHeight =6
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =480
                    Top =40
                    Width =7938
                    Height =0
                    FontSize =9
                    FontWeight =700
                    TabIndex =8
                    Name ="EinleitungDet"
                    ControlSource ="EinleitungDet"
                    AsianLineBreak =0

                    LayoutCachedLeft =480
                    LayoutCachedTop =40
                    LayoutCachedWidth =8418
                    LayoutCachedHeight =40
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4108
                    Top =45
                    Width =287
                    Height =270
                    FontSize =10
                    TabIndex =17
                    BackColor =65535
                    Name ="ModuloAnzahl"
                    ControlSource ="ModuloAnzahl"
                    AsianLineBreak =0

                    LayoutCachedLeft =4108
                    LayoutCachedTop =45
                    LayoutCachedWidth =4395
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4675
                    Top =45
                    Width =170
                    Height =270
                    FontSize =10
                    TabIndex =14
                    BackColor =65535
                    Name ="TitelNr"
                    ControlSource ="TitelNr"
                    AsianLineBreak =0

                    LayoutCachedLeft =4675
                    LayoutCachedTop =45
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4958
                    Top =45
                    Width =170
                    Height =270
                    FontSize =10
                    TabIndex =9
                    BackColor =65535
                    Name ="NrVGDet"
                    ControlSource ="NrVGDet"
                    AsianLineBreak =0

                    LayoutCachedLeft =4958
                    LayoutCachedTop =45
                    LayoutCachedWidth =5128
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5355
                    Top =45
                    Width =170
                    Height =270
                    FontSize =10
                    TabIndex =15
                    BackColor =65535
                    Name ="Position"
                    ControlSource ="Position"
                    AsianLineBreak =0

                    LayoutCachedLeft =5355
                    LayoutCachedTop =45
                    LayoutCachedWidth =5525
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5639
                    Top =45
                    Width =170
                    Height =270
                    FontSize =10
                    TabIndex =10
                    BackColor =65535
                    Name ="VGDetTxt1"
                    ControlSource ="VGDetTxt1"
                    AsianLineBreak =0

                    LayoutCachedLeft =5639
                    LayoutCachedTop =45
                    LayoutCachedWidth =5809
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =6319
                    Top =45
                    Width =170
                    Height =270
                    FontSize =10
                    TabIndex =11
                    BackColor =65535
                    Name ="DetTxt1"
                    ControlSource ="DetTxt1"
                    AsianLineBreak =0

                    LayoutCachedLeft =6319
                    LayoutCachedTop =45
                    LayoutCachedWidth =6489
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3428
                    Top =56
                    Width =672
                    Height =270
                    FontSize =10
                    TabIndex =16
                    BackColor =65535
                    Name ="MwstEPreis"
                    ControlSource ="MwstEPreis"
                    AsianLineBreak =0

                    LayoutCachedLeft =3428
                    LayoutCachedTop =56
                    LayoutCachedWidth =4100
                    LayoutCachedHeight =326
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3458
                    Top =56
                    Width =590
                    Height =270
                    FontSize =10
                    TabIndex =13
                    BackColor =65535
                    Name ="MoveRecord"
                    ControlSource ="MoveRecord"
                    AsianLineBreak =0

                    LayoutCachedLeft =3458
                    LayoutCachedTop =56
                    LayoutCachedWidth =4048
                    LayoutCachedHeight =326
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =75
                    Width =284
                    Height =270
                    FontSize =10
                    TabIndex =2
                    Name ="Posnr"
                    ControlSource ="Posnr"
                    AsianLineBreak =0

                    LayoutCachedTop =75
                    LayoutCachedWidth =284
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =284
                    Top =75
                    Width =1418
                    Height =284
                    FontSize =10
                    TabIndex =1
                    Name ="AnzahlEinheitF"
                    ControlSource ="AnzahlEinheitF"
                    AsianLineBreak =0

                    LayoutCachedLeft =284
                    LayoutCachedTop =75
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =359
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1814
                    Top =75
                    Width =4990
                    Height =270
                    FontSize =10
                    TabIndex =20
                    BorderColor =1643706
                    Name ="ArtikeltextL"
                    ControlSource ="ArtikeltextL"
                    AsianLineBreak =0
                    LeftPadding =31

                    LayoutCachedLeft =1814
                    LayoutCachedTop =75
                    LayoutCachedWidth =6804
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    BackStyle =1
                    Left =6924
                    Top =75
                    Width =1173
                    Height =270
                    FontSize =10
                    TabIndex =21
                    Name ="Bestellt"
                    ControlSource ="Bestellt"
                    Format ="Standard"
                    AsianLineBreak =0

                    LayoutCachedLeft =6924
                    LayoutCachedTop =75
                    LayoutCachedWidth =8097
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =6932
                    Top =75
                    Width =1173
                    Height =270
                    FontSize =10
                    TabIndex =3
                    Name ="EinzelpreisVG"
                    ControlSource ="EinzelpreisVGdet"
                    Format ="Standard"
                    AsianLineBreak =0

                    LayoutCachedLeft =6932
                    LayoutCachedTop =75
                    LayoutCachedWidth =8105
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    BorderWidth =1
                    TextAlign =3
                    BackStyle =1
                    Left =8104
                    Top =75
                    Width =597
                    Height =270
                    FontSize =10
                    TabIndex =19
                    Name ="RabattVG"
                    ControlSource ="RabattVG"
                    Format ="Standard"
                    FontName ="Arial Narrow"
                    AsianLineBreak =0

                    LayoutCachedLeft =8104
                    LayoutCachedTop =75
                    LayoutCachedWidth =8701
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    BackStyle =1
                    Left =8234
                    Top =75
                    Width =618
                    Height =270
                    FontSize =10
                    TabIndex =22
                    Name ="Rückstand"
                    ControlSource ="Rückstand"
                    Format ="Standard"
                    AsianLineBreak =0

                    LayoutCachedLeft =8234
                    LayoutCachedTop =75
                    LayoutCachedWidth =8852
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8700
                    Top =75
                    Width =1233
                    Height =270
                    FontSize =10
                    TabIndex =4
                    Name ="EPreis"
                    Format ="Standard"
                    AsianLineBreak =0

                    LayoutCachedLeft =8700
                    LayoutCachedTop =75
                    LayoutCachedWidth =9933
                    LayoutCachedHeight =345
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =2834
                    Top =113
                    Width =623
                    Height =270
                    FontSize =10
                    TabIndex =12
                    BackColor =65535
                    Name ="EPreisDet"
                    ControlSource ="EPreis"
                    AsianLineBreak =0

                    LayoutCachedLeft =2834
                    LayoutCachedTop =113
                    LayoutCachedWidth =3457
                    LayoutCachedHeight =383
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4195
                    Top =113
                    Width =830
                    Height =270
                    FontSize =10
                    TabIndex =18
                    BackColor =65535
                    Name ="countPos"
                    ControlSource ="countPos"
                    AsianLineBreak =0

                    LayoutCachedLeft =4195
                    LayoutCachedTop =113
                    LayoutCachedWidth =5025
                    LayoutCachedHeight =383
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1814
                    Top =360
                    Width =7938
                    Height =57
                    FontSize =10
                    TabIndex =5
                    Name ="BemVGdet"
                    ControlSource ="BemVGdet"
                    AsianLineBreak =0
                    LeftPadding =57
                    TextFormat =1

                    LayoutCachedLeft =1814
                    LayoutCachedTop =360
                    LayoutCachedWidth =9752
                    LayoutCachedHeight =417
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =390
                    Height =42
                    FontSize =10
                    TabIndex =6
                    Name ="VGDettxt"
                    AsianLineBreak =0

                    LayoutCachedTop =390
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =432
                End
                Begin Subform
                    Left =1814
                    Top =420
                    Width =7938
                    Height =57
                    TabIndex =7
                    Name ="UB_StichwortVG"
                    SourceObject ="Report.UB_StichwortVG"
                    LinkChildFields ="nrVGDet"
                    LinkMasterFields ="nrVGDet"

                    LayoutCachedLeft =1814
                    LayoutCachedTop =420
                    LayoutCachedWidth =9752
                    LayoutCachedHeight =477
                End
                Begin Line
                    Top =29
                    Width =9923
                    Name ="Liniedet"
                    LayoutCachedTop =29
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =29
                End
                Begin Line
                    LineSlant = NotDefault
                    Top =477
                    Width =9927
                    Name ="liniedetHelp"
                    LayoutCachedTop =477
                    LayoutCachedWidth =9927
                    LayoutCachedHeight =477
                    BorderThemeColorIndex =0
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    BackStyle =1
                    Left =5612
                    Top =56
                    Width =830
                    Height =270
                    FontSize =10
                    TabIndex =23
                    BackColor =65535
                    Name ="rowNumber"
                    ControlSource ="rowNumber"
                    AsianLineBreak =0

                    LayoutCachedLeft =5612
                    LayoutCachedTop =56
                    LayoutCachedWidth =6442
                    LayoutCachedHeight =326
                End
            End
        End
        Begin BreakFooter
            Visible = NotDefault
            CanGrow = NotDefault
            Height =765
            BreakLevel =8
            OnFormat ="[Event Procedure]"
            Name ="gfMWST"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4738
                    Top =431
                    Width =681
                    Height =225
                    FontSize =10
                    TabIndex =1
                    BackColor =65535
                    Name ="MWSTx"
                    ControlSource ="MWSTx"
                    AsianLineBreak =0

                    LayoutCachedLeft =4738
                    LayoutCachedTop =431
                    LayoutCachedWidth =5419
                    LayoutCachedHeight =656
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =600
                    Top =375
                    Width =1026
                    Height =285
                    FontSize =10
                    TabIndex =2
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="VGRabatt"
                    ControlSource ="VGRabatt"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =600
                    LayoutCachedTop =375
                    LayoutCachedWidth =1626
                    LayoutCachedHeight =660
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    Left =8355
                    Top =56
                    Width =1581
                    Height =255
                    FontSize =10
                    TabIndex =3
                    BackColor =13421619
                    Name ="Zwischentotal1"
                    ControlSource ="=Sum([EPreis])"
                    Format ="Standard"
                    StatusBarText ="Zwischentotal"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =56
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =311
                End
                Begin TextBox
                    Visible = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2497
                    Top =435
                    Width =4200
                    Height =255
                    FontSize =10
                    TabIndex =4
                    BorderColor =4210752
                    Name ="MWSt_Anzeige"
                    StatusBarText ="MWSt"
                    DefaultValue ="0.065"
                    AsianLineBreak =0

                    LayoutCachedLeft =2497
                    LayoutCachedTop =435
                    LayoutCachedWidth =6697
                    LayoutCachedHeight =690
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =438
                    Width =1581
                    Height =255
                    FontSize =10
                    TabIndex =5
                    Name ="E_MWSt"
                    ControlSource ="=OH_Runde([Zwischentotal2]*[MWSTx]/100)"
                    Format ="Standard"
                    StatusBarText ="Gesamttotal"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =438
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =693
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =6684
                    Top =438
                    Width =1490
                    Height =255
                    FontSize =10
                    TabIndex =6
                    Name ="Zwischentotal2"
                    ControlSource ="=[Zwischentotal1]-[E_Rabatt]-[E_Rabatt1]+IIf([inclMWST]=1,-[sumMWST],0)"
                    Format ="Standard"
                    StatusBarText ="Zwischentotal"
                    AsianLineBreak =0

                    LayoutCachedLeft =6684
                    LayoutCachedTop =438
                    LayoutCachedWidth =8174
                    LayoutCachedHeight =693
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2325
                    Top =345
                    Width =5839
                    Height =12
                    FontSize =10
                    TabIndex =7
                    Name ="RabattRech_Anzeige"
                    ControlSource ="RabattRech_Anzeige"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =2325
                    LayoutCachedTop =345
                    LayoutCachedWidth =8164
                    LayoutCachedHeight =357
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =345
                    Width =1581
                    Height =12
                    FontSize =10
                    TabIndex =8
                    Name ="E_Rabatt"
                    ControlSource ="=OH_Runde([ZwischenTotal1]*[VGRabatt]/100)"
                    Format ="Standard"
                    StatusBarText ="Rabatt"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =345
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =357
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2698
                    Top =431
                    Width =1026
                    Height =225
                    FontSize =10
                    TabIndex =9
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="Rabattart"
                    ControlSource ="RabattArt"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =2698
                    LayoutCachedTop =431
                    LayoutCachedWidth =3724
                    LayoutCachedHeight =656
                End
                Begin TextBox
                    TextAlign =3
                    TextFontFamily =0
                    IMESentenceMode =3
                    Left =3662
                    Top =56
                    Width =4504
                    Height =255
                    FontSize =10
                    BackColor =255
                    Name ="Zwischentotal"
                    ControlSource ="Zwischentotal"
                    Tag ="lg"

                    LayoutCachedLeft =3662
                    LayoutCachedTop =56
                    LayoutCachedWidth =8166
                    LayoutCachedHeight =311
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =3945
                    Top =431
                    Width =732
                    Height =255
                    FontSize =10
                    TabIndex =10
                    BackColor =65535
                    Name ="sumMWST"
                    ControlSource ="=Sum([MwstEPreis])"
                    AsianLineBreak =0

                    LayoutCachedLeft =3945
                    LayoutCachedTop =431
                    LayoutCachedWidth =4677
                    LayoutCachedHeight =686
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2325
                    Top =357
                    Width =5839
                    Height =12
                    FontSize =10
                    TabIndex =11
                    Name ="RabattRech_Anzeige1"
                    ControlSource ="RabattRech_Anzeige1"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =2325
                    LayoutCachedTop =357
                    LayoutCachedWidth =8164
                    LayoutCachedHeight =369
                    BackThemeColorIndex =1
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =1620
                    Top =375
                    Width =1026
                    Height =285
                    FontSize =10
                    TabIndex =12
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="VGRabatt1"
                    ControlSource ="VGRabatt1"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =1620
                    LayoutCachedTop =375
                    LayoutCachedWidth =2646
                    LayoutCachedHeight =660
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =357
                    Width =1581
                    Height =12
                    FontSize =10
                    TabIndex =13
                    Name ="E_Rabatt1"
                    ControlSource ="=OH_Runde(([ZwischenTotal1]-[E_Rabatt])*[VGRabatt1]/100)"
                    Format ="Standard"
                    StatusBarText ="Rabatt"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =357
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =369
                End
                Begin PageBreak
                    Name ="nextPageSum"
                End
                Begin Line
                    Left =4833
                    Top =735
                    Width =5103
                    BorderColor =0
                    Name ="linMWstx"
                    LayoutCachedLeft =4833
                    LayoutCachedTop =735
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =735
                End
                Begin Line
                    Top =29
                    Width =9923
                    Name ="linMWStxTop"
                    LayoutCachedTop =29
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =29
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =453
            BreakLevel =7
            OnFormat ="[Event Procedure]"
            Name ="GFA"
            Begin
                Begin TextBox
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8460
                    Top =105
                    Width =1476
                    Height =285
                    FontSize =10
                    FontWeight =700
                    Name ="Gesamtpreis"
                    ControlSource ="=Sum([EPreis])"
                    Format ="Standard"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8460
                    LayoutCachedTop =105
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =390
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =3662
                    Top =105
                    Width =4505
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="TextGesamtpreis"
                    ControlSource ="TextGesamtpreis"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =3662
                    LayoutCachedTop =105
                    LayoutCachedWidth =8167
                    LayoutCachedHeight =390
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =0
                    Left =706
                    Top =56
                    Width =3600
                    Height =285
                    FontSize =10
                    BackColor =10092543
                    BorderColor =255
                    ForeColor =0
                    Name ="Bezeichnungsfeld151"
                    Caption ="Das ist der Bereich für Angebote etc."
                    FontName ="ARIAL"
                    LayoutCachedLeft =706
                    LayoutCachedTop =56
                    LayoutCachedWidth =4306
                    LayoutCachedHeight =341
                End
                Begin Line
                    Width =9923
                    Name ="Linie233"
                    LayoutCachedWidth =9923
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =680
            BreakLevel =6
            Name ="GFA1"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1020
                    Top =170
                    Width =861
                    FontSize =10
                    BackColor =65535
                    Name ="MWSt"
                    ControlSource ="MWSt"
                    AsianLineBreak =0

                    LayoutCachedLeft =1020
                    LayoutCachedTop =170
                    LayoutCachedWidth =1881
                    LayoutCachedHeight =410
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2325
                    Top =90
                    Width =5839
                    Height =12
                    FontSize =9
                    TabIndex =1
                    Name ="E_RabattText"
                    ControlSource ="RabattRech_Anzeige"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2325
                    LayoutCachedTop =90
                    LayoutCachedWidth =8164
                    LayoutCachedHeight =102
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =90
                    Width =1581
                    Height =12
                    FontSize =9
                    TabIndex =2
                    Name ="E_Rabattf"
                    ControlSource ="=OH_Runde([Gesamtpreis]*[VGRabatt]/100)"
                    Format ="Standard"
                    StatusBarText ="Rabatt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =90
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =102
                End
                Begin TextBox
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2745
                    Top =240
                    Width =5421
                    Height =102
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="TotalText"
                    ControlSource ="TotalText"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2745
                    LayoutCachedTop =240
                    LayoutCachedWidth =8166
                    LayoutCachedHeight =342
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =240
                    Width =1581
                    Height =117
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="Total"
                    ControlSource ="=[Gesamtpreis]-[E_Rabattf]-[E_Rabatt1f]"
                    Format ="Standard"
                    StatusBarText ="Rabatt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =240
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =357
                    ForeThemeColorIndex =0
                End
                Begin Line
                    Left =8355
                    Top =436
                    Width =1581
                    BorderColor =0
                    Name ="LinieTotal1"
                    LayoutCachedLeft =8355
                    LayoutCachedTop =436
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =436
                End
                Begin Line
                    Left =8355
                    Top =404
                    Width =1581
                    BorderColor =0
                    Name ="LinieTotal"
                    LayoutCachedLeft =8355
                    LayoutCachedTop =404
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =404
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =2325
                    Top =150
                    Width =5839
                    Height =12
                    FontSize =9
                    TabIndex =5
                    Name ="E_RabattText1"
                    ControlSource ="RabattRech_Anzeige1"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =2325
                    LayoutCachedTop =150
                    LayoutCachedWidth =8164
                    LayoutCachedHeight =162
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =150
                    Width =1581
                    Height =12
                    FontSize =9
                    TabIndex =6
                    Name ="E_Rabatt1f"
                    ControlSource ="=OH_Runde(([Gesamtpreis]-[E_Rabattf])*[VGRabatt1]/100)"
                    Format ="Standard"
                    StatusBarText ="Rabatt"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =150
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =162
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextFontFamily =0
                    BackStyle =1
                    Left =4185
                    Top =510
                    Width =5757
                    Height =0
                    FontSize =10
                    TabIndex =7
                    Name ="GesamttotalEuro1"
                    ControlSource ="GesamttotalEuro"
                    Format ="Standard"
                    StatusBarText ="Zwischentotal"
                    AsianLineBreak =0

                    LayoutCachedLeft =4185
                    LayoutCachedTop =510
                    LayoutCachedWidth =9942
                    LayoutCachedHeight =510
                End
                Begin Line
                    Width =9923
                    Name ="Linie234"
                    LayoutCachedWidth =9923
                End
            End
        End
        Begin BreakFooter
            Visible = NotDefault
            Height =56
            BreakLevel =4
            Name ="GFRech1"
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            Visible = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =695
            BreakLevel =3
            OnFormat ="[Event Procedure]"
            Name ="GFRech"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =8355
                    Top =60
                    Width =1581
                    Height =285
                    FontSize =10
                    FontWeight =700
                    Name ="sumvgTot"
                    ControlSource ="sumvgTot"
                    Format ="Standard"
                    StatusBarText ="Zwischentotal"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8355
                    LayoutCachedTop =60
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =345
                End
                Begin Line
                    LineSlant = NotDefault
                    Left =8355
                    Top =390
                    Width =1581
                    BorderColor =0
                    Name ="LinGesamttotal1"
                    LayoutCachedLeft =8355
                    LayoutCachedTop =390
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =390
                End
                Begin Line
                    LineSlant = NotDefault
                    Left =8355
                    Top =450
                    Width =1581
                    BorderColor =0
                    Name ="linGesamttotal2"
                    LayoutCachedLeft =8355
                    LayoutCachedTop =450
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =450
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =2
                    TextFontFamily =0
                    BackStyle =1
                    Left =4179
                    Top =510
                    Width =5757
                    Height =0
                    FontSize =10
                    TabIndex =1
                    Name ="GesamttotalEuro"
                    ControlSource ="GesamttotalEuro"
                    Format ="Standard"
                    StatusBarText ="Zwischentotal"
                    AsianLineBreak =0

                    LayoutCachedLeft =4179
                    LayoutCachedTop =510
                    LayoutCachedWidth =9936
                    LayoutCachedHeight =510
                End
                Begin TextBox
                    FELineBreak = NotDefault
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =4112
                    Top =60
                    Width =4056
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="TextGesamttotal"
                    ControlSource ="TextGesamttotal"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =4112
                    LayoutCachedTop =60
                    LayoutCachedWidth =8168
                    LayoutCachedHeight =345
                    ForeThemeColorIndex =0
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =0
                    Left =990
                    Top =170
                    Width =2100
                    Height =525
                    FontSize =10
                    BackColor =10092543
                    BorderColor =255
                    ForeColor =0
                    Name ="Bezeichnungsfeld152"
                    Caption ="Das ist der Bereich für Rechnungen"
                    FontName ="ARIAL"
                    LayoutCachedLeft =990
                    LayoutCachedTop =170
                    LayoutCachedWidth =3090
                    LayoutCachedHeight =695
                End
            End
        End
        Begin BreakFooter
            Visible = NotDefault
            CanGrow = NotDefault
            Height =445
            BreakLevel =2
            OnFormat ="[Event Procedure]"
            Name ="GFRT"
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Width =9924
                    Height =105
                    FontSize =10
                    Name ="VGBemerkung"
                    ControlSource ="VGBemerkung"
                    AsianLineBreak =0
                    TextFormat =1

                    LayoutCachedWidth =9924
                    LayoutCachedHeight =105
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =165
                    Width =9923
                    Height =105
                    FontSize =10
                    TabIndex =1
                    Name ="Schluss"
                    ControlSource ="Schlusstxt"
                    AsianLineBreak =0

                    LayoutCachedTop =165
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =270
                    BackThemeColorIndex =1
                End
                Begin Image
                    Visible = NotDefault
                    SizeMode =3
                    PictureAlignment =3
                    Top =375
                    Width =1425
                    Height =0
                    Name ="picSignatureInvoice"

                    LayoutCachedTop =375
                    LayoutCachedWidth =1425
                    LayoutCachedHeight =375
                    TabIndex =3
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =8957
                    Top =56
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =2
                    BackColor =65535
                    Name ="Stempel"
                    ControlSource ="Stempel"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =8957
                    LayoutCachedTop =56
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =281
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =2091
            BreakLevel =1
            OnFormat ="[Event Procedure]"
            Name ="GFID"
            BackThemeColorIndex =1
            Begin
                Begin Image
                    SizeMode =3
                    PictureAlignment =3
                    Top =1080
                    Width =4755
                    Height =709
                    Name ="UnterschriftPic"

                    LayoutCachedTop =1080
                    LayoutCachedWidth =4755
                    LayoutCachedHeight =1789
                    TabIndex =8
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =1821
                    Width =4749
                    Height =270
                    FontSize =10
                    Name ="Mitarbeiter"
                    AsianLineBreak =0

                    LayoutCachedTop =1821
                    LayoutCachedWidth =4749
                    LayoutCachedHeight =2091
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =210
                    Width =9300
                    Height =270
                    FontSize =10
                    TabIndex =1
                    Name ="Gruss"
                    ControlSource ="Gruss"
                    AsianLineBreak =0

                    LayoutCachedTop =210
                    LayoutCachedWidth =9300
                    LayoutCachedHeight =480
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =4818
                    Top =1815
                    Width =4470
                    Height =270
                    FontSize =10
                    TabIndex =2
                    Name ="Mitarbeiter2"
                    AsianLineBreak =0

                    LayoutCachedLeft =4818
                    LayoutCachedTop =1815
                    LayoutCachedWidth =9288
                    LayoutCachedHeight =2085
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1644
                    Top =1136
                    Width =1251
                    FontSize =10
                    TabIndex =4
                    BackColor =65535
                    Name ="NrMitarbeiter"
                    ControlSource ="NrMitarbeiter"
                    AsianLineBreak =0

                    LayoutCachedLeft =1644
                    LayoutCachedTop =1136
                    LayoutCachedWidth =2895
                    LayoutCachedHeight =1376
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =480
                    Width =9300
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="TX_EFName"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =480
                    LayoutCachedWidth =9300
                    LayoutCachedHeight =765
                End
                Begin Image
                    Visible = NotDefault
                    SizeMode =3
                    PictureAlignment =3
                    Left =4818
                    Top =1080
                    Width =4470
                    Height =709
                    Name ="UnterschriftPic2"

                    LayoutCachedLeft =4818
                    LayoutCachedTop =1080
                    LayoutCachedWidth =9288
                    LayoutCachedHeight =1789
                    TabIndex =7
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =5272
                    Top =1209
                    Width =1251
                    FontSize =10
                    TabIndex =3
                    BackColor =65535
                    Name ="NrMA2"
                    ControlSource ="NrMA2"
                    AsianLineBreak =0

                    LayoutCachedLeft =5272
                    LayoutCachedTop =1209
                    LayoutCachedWidth =6523
                    LayoutCachedHeight =1449
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =0
                    Width =3855
                    Height =285
                    FontSize =10
                    BackColor =10092543
                    BorderColor =255
                    ForeColor =0
                    Name ="Bezeichnungsfeld190"
                    Caption ="Abstände werden in SQL definiert (@nl)"
                    FontName ="ARIAL"
                    LayoutCachedWidth =3855
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    AutoTab = NotDefault
                    FELineBreak = NotDefault
                    DecimalPlaces =1
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =0
                    BackStyle =1
                    Left =7880
                    Top =793
                    Width =696
                    Height =285
                    FontSize =10
                    TabIndex =6
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="idt8"
                    ControlSource ="idt8"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    AsianLineBreak =0

                    LayoutCachedLeft =7880
                    LayoutCachedTop =793
                    LayoutCachedWidth =8576
                    LayoutCachedHeight =1078
                End
            End
        End
        Begin BreakFooter
            Visible = NotDefault
            CanGrow = NotDefault
            ForceNewPage =2
            Height =850
            OnFormat ="[Event Procedure]"
            Name ="GFVG"
            BackThemeColorIndex =1
            Begin
                Begin PageBreak
                    Name ="GesamtübersichtSeitenumbruch"
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Width =966
                    Height =225
                    FontSize =9
                    TabIndex =7
                    BackColor =65535
                    Name ="SwissQRCode"
                    ControlSource ="SwissQRCode"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedWidth =966
                    LayoutCachedHeight =225
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    BackStyle =1
                    Top =75
                    Width =9924
                    Height =60
                    FontSize =10
                    TabIndex =6
                    Name ="AnhangVorgang"
                    ControlSource ="AnhangVorgang"
                    AsianLineBreak =0
                    TextFormat =1

                    LayoutCachedTop =75
                    LayoutCachedWidth =9924
                    LayoutCachedHeight =135
                    BackThemeColorIndex =1
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =170
                    Width =9303
                    Height =60
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="txtPS"
                    ControlSource ="txtPS"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =170
                    LayoutCachedWidth =9303
                    LayoutCachedHeight =230
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =230
                    Width =1418
                    Height =60
                    FontSize =10
                    TabIndex =2
                    Name ="TxtCC"
                    AsianLineBreak =0

                    LayoutCachedTop =230
                    LayoutCachedWidth =1418
                    LayoutCachedHeight =290
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1531
                    Top =230
                    Width =7770
                    Height =60
                    FontSize =10
                    Name ="CC"
                    AsianLineBreak =0

                    LayoutCachedLeft =1531
                    LayoutCachedTop =230
                    LayoutCachedWidth =9301
                    LayoutCachedHeight =290
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =290
                    Width =1418
                    Height =60
                    FontSize =10
                    TabIndex =3
                    Name ="TxtAttachment"
                    AsianLineBreak =0

                    LayoutCachedTop =290
                    LayoutCachedWidth =1418
                    LayoutCachedHeight =350
                End
                Begin TextBox
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Left =1531
                    Top =290
                    Width =7770
                    Height =60
                    FontSize =10
                    TabIndex =1
                    Name ="Attachment"
                    AsianLineBreak =0

                    LayoutCachedLeft =1531
                    LayoutCachedTop =290
                    LayoutCachedWidth =9301
                    LayoutCachedHeight =350
                End
                Begin Subform
                    Visible = NotDefault
                    Left =284
                    Top =525
                    Width =9639
                    Height =57
                    TabIndex =4
                    Name ="UB_VGGesamtÜbersicht"
                    SourceObject ="Report.UB_VGGesamtÜbersicht"

                    LayoutCachedLeft =284
                    LayoutCachedTop =525
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =582
                End
                Begin Image
                    Visible = NotDefault
                    SizeMode =3
                    Top =793
                    Width =10149
                    Height =57
                    Name ="picQRBill"

                    LayoutCachedTop =793
                    LayoutCachedWidth =10149
                    LayoutCachedHeight =850
                    TabIndex =9
                End
                Begin Subform
                    Visible = NotDefault
                    Left =283
                    Top =623
                    Width =9639
                    Height =57
                    TabIndex =8
                    Name ="UB_VGRahmenvertrag"
                    SourceObject ="Report.UB_VGRahmenvertrag"

                    LayoutCachedLeft =283
                    LayoutCachedTop =623
                    LayoutCachedWidth =9922
                    LayoutCachedHeight =680
                End
            End
        End
        Begin PageFooter
            Height =734
            OnFormat ="[Event Procedure]"
            Name ="pf"
            BackThemeColorIndex =1
            Begin
                Begin Image
                    SizeMode =3
                    Left =6804
                    Width =2268
                    Height =734
                    Name ="LogoSeiteU"

                    LayoutCachedLeft =6804
                    LayoutCachedWidth =9072
                    LayoutCachedHeight =734
                    TabIndex =3
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    FELineBreak = NotDefault
                    TextAlign =1
                    TextFontFamily =0
                    BackStyle =1
                    Top =509
                    Width =6583
                    Height =225
                    Name ="FeldSF"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedTop =509
                    LayoutCachedWidth =6583
                    LayoutCachedHeight =734
                    BackThemeColorIndex =1
                End
                Begin Line
                    Visible = NotDefault
                    LineSlant = NotDefault
                    Width =9359
                    BorderColor =0
                    Name ="Linsf"
                    LayoutCachedWidth =9359
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    TextFontFamily =0
                    BackStyle =1
                    Left =793
                    Top =170
                    Width =1065
                    Height =285
                    FontSize =9
                    TabIndex =1
                    BackColor =10092543
                    Name ="pages"
                    ControlSource ="=[Pages]"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =793
                    LayoutCachedTop =170
                    LayoutCachedWidth =1858
                    LayoutCachedHeight =455
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    TextFontFamily =0
                    BackStyle =1
                    Left =1983
                    Top =170
                    Width =1065
                    Height =285
                    FontSize =9
                    TabIndex =2
                    BackColor =10092543
                    Name ="page"
                    ControlSource ="=[Page]"
                    FontName ="ARIAL"
                    AsianLineBreak =0

                    LayoutCachedLeft =1983
                    LayoutCachedTop =170
                    LayoutCachedWidth =3048
                    LayoutCachedHeight =455
                End
            End
        End
    End
End
CodeBehindForm
' See "B_VG.cls"
