Version =20
VersionRequired =20
Begin Report
    DefaultView =0
    AllowUpdating =4
    GridY =10
    Width =15585
    ItemSuffix =99
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x207bbdd39c18e540
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
            ControlSource ="Anschrift1"
        End
        Begin BreakLevel
            SortOrder = NotDefault
            ControlSource ="VGDat2"
        End
        Begin BreakLevel
            ControlSource ="VGNr"
        End
        Begin PageHeader
            Height =1587
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Label
                    TextAlign =1
                    Left =-4
                    Width =15585
                    Height =690
                    FontSize =14
                    FontWeight =700
                    Name ="ReportTitel"
                    Caption ="Übersichts-Liste"
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    Left =12330
                    Width =1640
                    Height =340
                    ColumnOrder =0
                    FontSize =8
                    Name ="Feld38"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"

                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    BackStyle =0
                    Left =12330
                    Top =340
                    Width =1625
                    Height =225
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =1
                    Name ="Feld40"
                    ControlSource ="=Now()"
                    Format ="dd/mm/yyyy hh:nn"

                    LayoutCachedLeft =12330
                    LayoutCachedTop =340
                    LayoutCachedWidth =13955
                    LayoutCachedHeight =565
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =1
                    Top =1110
                    Width =1140
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Text12"
                    Caption ="Nummer"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    Left =1140
                    Top =1110
                    Width =2199
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Text14"
                    Caption ="Firma"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14501
                    Top =1110
                    Width =1050
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="EUR1"
                    Caption ="Netto in EUR"
                End
                Begin TextBox
                    TextAlign =2
                    BackStyle =0
                    Left =7235
                    Top =1110
                    Width =1050
                    Height =465
                    ColumnOrder =3
                    FontSize =8
                    FontWeight =700
                    TabIndex =2
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Dat2"
                    ControlSource ="Dat2"

                End
                Begin TextBox
                    TextAlign =2
                    Left =-4
                    Top =680
                    Width =15585
                    Height =285
                    ColumnOrder =4
                    FontWeight =700
                    TabIndex =3
                    BorderColor =4210752
                    Name ="Text73"
                    ControlSource ="QK"

                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =2
                    Top =680
                    Width =741
                    Height =255
                    ColumnOrder =5
                    FontSize =8
                    TabIndex =4
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="IDQK"
                    ControlSource ="IDQK"
                    Format ="Standard"

                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10057
                    Top =1110
                    Width =1050
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="MWST1"
                    Caption ="MWSt-Betrag"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11664
                    Top =1110
                    Width =1050
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Loc"
                    Caption ="Brutto"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5658
                    Top =1110
                    Width =527
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Bezeichnungsfeld79"
                    Caption ="Land"
                End
                Begin TextBox
                    TextAlign =2
                    BackStyle =0
                    Left =6185
                    Top =1110
                    Width =1050
                    Height =465
                    ColumnOrder =6
                    FontSize =8
                    FontWeight =700
                    TabIndex =5
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="VorgangsDatum"
                    ControlSource ="=Left([QK],1) & \"-Datum\""

                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9335
                    Top =1110
                    Width =722
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Bezeichnungsfeld83"
                    Caption ="MWSt %"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11107
                    Top =1110
                    Width =557
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Bezeichnungsfeld85"
                    Caption ="Währ."
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12714
                    Top =1110
                    Width =737
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Bezeichnungsfeld87"
                    Caption ="Kurs"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    Left =3339
                    Top =1110
                    Width =2319
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Bezeichnungsfeld89"
                    Caption ="Bezeichnung"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13451
                    Top =1110
                    Width =1050
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="Loc1"
                    Caption ="lokale Währung"
                End
                Begin Label
                    BackStyle =0
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8285
                    Top =1110
                    Width =1050
                    Height =465
                    FontSize =8
                    FontWeight =700
                    BackColor =8421504
                    BorderColor =16711680
                    Name ="lblNetto"
                    Caption ="Netto"
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
            Height =264
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    BackStyle =0
                    Left =1140
                    Width =2199
                    Height =255
                    ColumnWidth =2400
                    FontSize =8
                    TabIndex =1
                    LeftMargin =57
                    Name ="Anschrift"
                    ControlSource ="Anschrift"

                End
                Begin TextBox
                    TextAlign =1
                    Width =1140
                    Height =255
                    ColumnWidth =324
                    FontSize =8
                    LeftMargin =57
                    Name ="Nummer"
                    ControlSource ="Nummer"

                End
                Begin TextBox
                    TextAlign =2
                    BackStyle =0
                    Left =6185
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =2
                    LeftMargin =57
                    Name ="Feld24"
                    ControlSource ="VGdatum"
                    Format ="dd/mm/yy"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =11664
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =3
                    LeftMargin =57
                    Name ="SumVGLOCtot"
                    ControlSource ="SumVGMLtot"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =14483
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =4
                    LeftMargin =57
                    Name ="EUR2"
                    ControlSource ="SumVGEUR"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    BackStyle =0
                    Left =10057
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =5
                    LeftMargin =57
                    Name ="MWST2"
                    ControlSource ="SumVGMWSt"
                    Format ="Standard"

                End
                Begin TextBox
                    TextAlign =2
                    BackStyle =0
                    Left =7235
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =6
                    LeftMargin =57
                    Name ="VGDat2"
                    ControlSource ="VGDat2"
                    Format ="dd/mm/yy"
                    StatusBarText ="Bezahlt am"

                End
                Begin TextBox
                    TextAlign =2
                    BackStyle =0
                    Left =5658
                    Width =527
                    Height =255
                    FontSize =8
                    TabIndex =7
                    LeftMargin =57
                    Name ="LandFirma"
                    ControlSource ="LandFirma"

                End
                Begin TextBox
                    DecimalPlaces =2
                    BackStyle =0
                    Left =9335
                    Width =722
                    Height =255
                    FontSize =8
                    TabIndex =8
                    LeftMargin =57
                    Name ="MWST"
                    ControlSource ="MWST"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =11107
                    Width =557
                    Height =255
                    FontSize =8
                    TabIndex =9
                    LeftMargin =57
                    Name ="VGWährung"
                    ControlSource ="VGWährung"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =12714
                    Width =737
                    Height =255
                    FontSize =8
                    TabIndex =10
                    LeftMargin =57
                    Name ="VGKurs"
                    ControlSource ="VGKurs"
                    Format ="Standard"

                End
                Begin TextBox
                    BackStyle =0
                    Left =3339
                    Width =2319
                    Height =255
                    FontSize =8
                    TabIndex =11
                    LeftMargin =57
                    Name ="VG"
                    ControlSource ="VG"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =13451
                    Width =1032
                    Height =255
                    FontSize =8
                    TabIndex =12
                    LeftMargin =57
                    Name ="Loc2"
                    ControlSource ="SumVGML"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    BackStyle =0
                    Left =8285
                    Width =1050
                    Height =255
                    FontSize =8
                    TabIndex =13
                    LeftMargin =57
                    Name ="Netto"
                    ControlSource ="sumVG"
                    Format ="Standard"

                End
                Begin TextBox
                    Visible = NotDefault
                    Left =4081
                    Width =741
                    Height =255
                    FontSize =8
                    TabIndex =14
                    LeftMargin =57
                    BackColor =65535
                    BorderColor =4210752
                    Name ="Achtung"
                    ControlSource ="Achtung"

                End
                Begin TextBox
                    Visible = NotDefault
                    Left =4818
                    Width =741
                    Height =255
                    FontSize =8
                    TabIndex =15
                    LeftMargin =57
                    BackColor =65535
                    BorderColor =4210752
                    Name ="WaehrungML"
                    ControlSource ="WaehrungML"

                    LayoutCachedLeft =4818
                    LayoutCachedWidth =5559
                    LayoutCachedHeight =255
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            ForceNewPage =2
            Height =1367
            BreakLevel =1
            Name ="Gruppenfuß0"
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    Top =113
                    Width =1927
                    Height =285
                    FontWeight =700
                    Name ="Feld37"
                    ControlSource ="=\"Anzahl: \" & Count([NrVG])"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =13485
                    Top =285
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =1
                    Name ="Loc3"
                    ControlSource ="=Sum([SumVGML])"
                    Format ="Standard"

                    Begin
                        Begin Label
                            BackStyle =0
                            Left =12090
                            Top =292
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld54"
                            Caption ="Summe"
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =14553
                    Top =285
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =2
                    Name ="EUR3"
                    ControlSource ="=Sum([SumVGEUR])"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =13485
                    Top =1105
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =3
                    Name ="Loc5"
                    ControlSource ="=Sum([SumVGMLtot])"
                    Format ="Standard"

                    Begin
                        Begin Label
                            BackStyle =0
                            Left =12090
                            Top =1112
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld56"
                            Caption ="mit MWSt"
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =14553
                    Top =1105
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =4
                    Name ="EUR5"
                    ControlSource ="=Sum([SumVGEURtot])"
                    Format ="Standard"

                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =13485
                    Top =735
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =5
                    Name ="Loc4"
                    ControlSource ="=Sum([SumVGMWSt])"
                    Format ="Standard"

                    Begin
                        Begin Label
                            BackStyle =0
                            Left =12090
                            Top =742
                            Width =1395
                            Height =255
                            BackColor =16777215
                            Name ="Bezeichnungsfeld64"
                            Caption ="Summe MWSt"
                        End
                    End
                End
                Begin Line
                    Left =13446
                    Top =1035
                    Width =2139
                    Name ="Linie71"
                End
                Begin Line
                    Left =13446
                    Top =1065
                    Width =2139
                    Name ="Linie72"
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    TextAlign =3
                    Left =14553
                    Top =735
                    Width =1032
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =6
                    Name ="EUR4"
                    Format ="Standard"

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
' See "B_VGTotalQuer.cls"
