Version =20
VersionRequired =20
Begin Report
    DefaultView =0
    AllowUpdating =4
    GridY =10
    Width =9937
    ItemSuffix =79
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xfa4203d39c18e540
    End
    Caption ="Übersicht"
    OnOpen ="[Event Procedure]"
    OnDblClick ="[Ereignisprozedur]"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            TextFontFamily =18
            FontSize =10
            BackColor =12632256
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
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
        Begin TextBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =264
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin ListBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin ComboBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =264
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin BreakLevel
            ControlSource ="NrQK"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            KeepTogether =2
            ControlSource ="QK"
        End
        Begin BreakLevel
            ControlSource ="VGAbteilung"
        End
        Begin BreakLevel
            ControlSource ="VGdatum"
        End
        Begin BreakLevel
            ControlSource ="VGNr"
        End
        Begin PageHeader
            Height =1575
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Label
                    TextAlign =1
                    TextFontFamily =34
                    Left =4
                    Width =9930
                    Height =690
                    FontSize =14
                    FontWeight =700
                    Name ="ReportTitel"
                    Caption ="Übersicht "
                    FontName ="Arial"
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =8163
                    Width =1700
                    Height =340
                    ColumnOrder =0
                    FontSize =8
                    Name ="Feld38"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"
                    FontName ="Arial"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =9184
                    Top =340
                    Width =680
                    Height =225
                    ColumnOrder =1
                    FontSize =8
                    TabIndex =1
                    Name ="Feld39"
                    ControlSource ="=Now()"
                    Format ="Short Time"
                    FontName ="Arial"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =8163
                    Top =340
                    Width =905
                    Height =225
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =2
                    Name ="Feld40"
                    ControlSource ="=Now()"
                    Format ="Short Date"
                    FontName ="Arial"

                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =1
                    TextFontFamily =34
                    Top =1110
                    Width =1140
                    Height =465
                    FontWeight =700
                    BackColor =16777215
                    Name ="Text12"
                    Caption ="Nummer"
                    FontName ="Arial"
                    LayoutCachedTop =1110
                    LayoutCachedWidth =1140
                    LayoutCachedHeight =1575
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1140
                    Top =1110
                    Width =2319
                    Height =465
                    FontWeight =700
                    BackColor =16777215
                    Name ="Text14"
                    Caption ="Firma"
                    FontName ="Arial"
                    LayoutCachedLeft =1140
                    LayoutCachedTop =1110
                    LayoutCachedWidth =3459
                    LayoutCachedHeight =1575
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =3459
                    Top =1110
                    Width =3237
                    Height =465
                    FontWeight =700
                    BackColor =16777215
                    Name ="bezProjektname"
                    Caption ="Projektname"
                    FontName ="Arial"
                    LayoutCachedLeft =3459
                    LayoutCachedTop =1110
                    LayoutCachedWidth =6696
                    LayoutCachedHeight =1575
                End
                Begin Label
                    Visible = NotDefault
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =7437
                    Top =1110
                    Width =1032
                    Height =465
                    FontWeight =700
                    BackColor =16777215
                    Name ="EUR1"
                    Caption ="EUR"
                    FontName ="Arial"
                    LayoutCachedLeft =7437
                    LayoutCachedTop =1110
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =1575
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =8469
                    Top =1110
                    Width =732
                    Height =465
                    FontWeight =700
                    BackColor =16777215
                    Name ="Bezeichnungsfeld67"
                    Caption ="vom"
                    FontName ="Arial"
                    LayoutCachedLeft =8469
                    LayoutCachedTop =1110
                    LayoutCachedWidth =9201
                    LayoutCachedHeight =1575
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    Left =9201
                    Top =1110
                    Width =690
                    Height =465
                    ColumnOrder =3
                    FontSize =7
                    FontWeight =700
                    TabIndex =3
                    Name ="Dat2"
                    ControlSource ="Dat2"
                    FontName ="Arial"

                    LayoutCachedLeft =9201
                    LayoutCachedTop =1110
                    LayoutCachedWidth =9891
                    LayoutCachedHeight =1575
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    Top =680
                    Width =9937
                    Height =285
                    ColumnOrder =4
                    FontWeight =700
                    TabIndex =4
                    BorderColor =4210752
                    Name ="Text73"
                    ControlSource ="QK"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    TextFontFamily =34
                    Top =680
                    Width =741
                    Height =255
                    ColumnOrder =5
                    FontSize =8
                    TabIndex =5
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="IDQK"
                    ControlSource ="IDQK"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6696
                    Top =1110
                    Width =741
                    Height =465
                    ColumnOrder =6
                    FontWeight =700
                    TabIndex =6
                    Name ="MWStML"
                    ControlSource ="MWSTML"
                    FontName ="Arial"

                    LayoutCachedLeft =6696
                    LayoutCachedTop =1110
                    LayoutCachedWidth =7437
                    LayoutCachedHeight =1575
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7437
                    Top =1110
                    Width =1032
                    Height =465
                    ColumnOrder =7
                    FontWeight =700
                    TabIndex =7
                    Name ="Loc1"
                    ControlSource ="Loc1"
                    FontName ="Arial"

                    LayoutCachedLeft =7437
                    LayoutCachedTop =1110
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =1575
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =0
            BreakLevel =1
            OnFormat ="[Event Procedure]"
            Name ="GKQK"
        End
        Begin Section
            CanGrow = NotDefault
            Height =255
            Name ="Det"
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextFontFamily =34
                    Left =1140
                    Width =2319
                    Height =255
                    ColumnWidth =2400
                    FontSize =8
                    TabIndex =1
                    Name ="Firma"
                    ControlSource ="Firma"
                    FontName ="Arial"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =34
                    Width =1140
                    Height =255
                    ColumnWidth =324
                    FontSize =8
                    Name ="Nummer"
                    ControlSource ="Nummer"
                    FontName ="Arial"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextFontFamily =34
                    Left =3459
                    Width =3237
                    Height =255
                    ColumnWidth =3576
                    FontSize =8
                    TabIndex =2
                    Name ="Projektname"
                    ControlSource ="Projektname"
                    FontName ="Arial"

                    LayoutCachedLeft =3459
                    LayoutCachedWidth =6696
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =8469
                    Width =732
                    Height =255
                    FontSize =8
                    TabIndex =3
                    Name ="Feld24"
                    ControlSource ="VGdatum"
                    Format ="dd/mm/yy"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7437
                    Width =1032
                    Height =255
                    FontSize =8
                    TabIndex =4
                    Name ="Loc2"
                    ControlSource ="SumVGML"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7437
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7437
                    Width =1032
                    Height =255
                    FontSize =8
                    TabIndex =5
                    Name ="EUR2"
                    ControlSource ="SumVGEUR"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextFontFamily =34
                    Left =6696
                    Width =741
                    Height =255
                    FontSize =8
                    TabIndex =6
                    Name ="MWST2"
                    ControlSource ="SumVGMWSt"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =6696
                    LayoutCachedWidth =7437
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextFontFamily =34
                    Left =9201
                    Width =690
                    Height =255
                    FontSize =8
                    TabIndex =7
                    Name ="VGDat2"
                    ControlSource ="VGDat2"
                    Format ="dd/mm/yy"
                    StatusBarText ="Bezahlt am"
                    FontName ="Arial"

                End
                Begin Line
                    Width =9864
                    Name ="LinieDetail"
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            ForceNewPage =2
            Height =1289
            BreakLevel =1
            Name ="Gruppenfuß0"
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextFontFamily =34
                    Top =113
                    Width =1927
                    Height =285
                    FontWeight =700
                    Name ="Feld37"
                    ControlSource ="=\"Anzahl: \" & Count([NrVG])"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7437
                    Top =195
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    Name ="Loc3"
                    ControlSource ="=Sum([SumVGML])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7437
                    LayoutCachedTop =195
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =450
                    Begin
                        Begin Label
                            BackStyle =0
                            TextFontFamily =34
                            Left =4965
                            Top =202
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld54"
                            Caption ="Summe"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7439
                    Top =195
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =2
                    Name ="EUR3"
                    ControlSource ="=Sum([SumVGEUR])"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7437
                    Top =1015
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =3
                    Name ="Loc5"
                    ControlSource ="=Sum([SumVGMLtot])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7437
                    LayoutCachedTop =1015
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =1270
                    Begin
                        Begin Label
                            BackStyle =0
                            TextFontFamily =34
                            Left =4965
                            Top =1022
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld56"
                            Caption ="mit MWSt"
                            FontName ="Arial"
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7439
                    Top =1015
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =4
                    Name ="EUR5"
                    ControlSource ="=Sum([SumVGEURtot])"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7437
                    Top =645
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =5
                    Name ="Loc4"
                    ControlSource ="=Sum([SumVGMWSt])"
                    Format ="Standard"
                    FontName ="Arial"

                    LayoutCachedLeft =7437
                    LayoutCachedTop =645
                    LayoutCachedWidth =8469
                    LayoutCachedHeight =900
                    Begin
                        Begin Label
                            BackStyle =0
                            TextFontFamily =34
                            Left =4965
                            Top =652
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld64"
                            Caption ="Summe MWSt"
                            FontName ="Arial"
                        End
                    End
                End
                Begin Line
                    Left =6390
                    Top =120
                    Width =2139
                    Name ="Linie70"
                End
                Begin Line
                    Left =6390
                    Top =945
                    Width =2139
                    Name ="Linie71"
                End
                Begin Line
                    Left =6390
                    Top =975
                    Width =2139
                    Name ="Linie72"
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7439
                    Top =645
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =6
                    Name ="EUR4"
                    Format ="Standard"
                    FontName ="Arial"

                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="Seitenfuß1"
        End
    End
End
CodeBehindForm
' See "B_VGTotal.cls"
