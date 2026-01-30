Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =10319
    DatasheetFontHeight =12
    ItemSuffix =230
    RecSrcDt = Begin
        0x54ddd4c6581ae540
    End
    RecordSource ="SELECT * FROM A_VGdet; "
    Caption ="Vorgang Report"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            FontSize =10
            FontWeight =700
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BorderWidth =1
            BorderLineStyle =0
            Width =2846
            Height =210
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            BorderLineStyle =0
            Width =2163
            Height =264
            LabelX =-1701
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
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
            ControlSource ="Position"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            ControlSource ="NrVG"
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =411
            BreakLevel =1
            Name ="gh"
            Begin
                Begin Label
                    TextFontFamily =34
                    Top =56
                    Width =795
                    Height =225
                    FontSize =8
                    FontWeight =400
                    Name ="Text73"
                    Caption ="Pos."
                    FontName ="Arial"
                    Tag ="lg"
                End
                Begin Label
                    TextFontFamily =34
                    Left =1020
                    Top =56
                    Width =630
                    Height =225
                    FontSize =8
                    FontWeight =400
                    Name ="TextAnzahl"
                    Caption ="Anzahl"
                    FontName ="Arial"
                    Tag ="lg"
                End
                Begin TextBox
                    AutoTab = NotDefault
                    BorderWidth =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =7596
                    Top =56
                    Width =672
                    Height =225
                    ColumnOrder =0
                    FontSize =8
                    Name ="Rabatt"
                    Format ="\"Rabatt %\""
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                End
                Begin Label
                    TextFontFamily =34
                    Left =1725
                    Top =56
                    Width =3195
                    Height =225
                    FontSize =8
                    FontWeight =400
                    Name ="Text94"
                    Caption ="Artikel-Nr./ Bezeichnung"
                    FontName ="Arial"
                    Tag ="lg"
                End
                Begin TextBox
                    AutoTab = NotDefault
                    BorderWidth =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =8274
                    Top =56
                    Width =1767
                    Height =225
                    ColumnOrder =1
                    FontSize =8
                    TabIndex =1
                    Name ="TextEPreis"
                    ControlSource ="VGWährung"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                End
                Begin TextBox
                    AutoTab = NotDefault
                    BorderWidth =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =6467
                    Top =56
                    Width =1062
                    Height =225
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =2
                    Name ="TextEinzelPreis"
                    ControlSource ="VGWährung"
                    StatusBarText ="Rabatt"
                    DefaultValue ="0"
                    FontName ="Arial"

                End
                Begin Line
                    Top =339
                    Width =10044
                    Name ="Linie68"
                End
                Begin Line
                    Top =396
                    Width =10044
                    Name ="Linie98"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =360
            Name ="Det"
            Begin
                Begin TextBox
                    TextFontFamily =34
                    Width =351
                    Height =240
                    FontSize =10
                    FontWeight =700
                    Name ="Position"
                    ControlSource ="Position"
                    Format ="00"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =3
                    TextFontFamily =34
                    Left =351
                    Width =756
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="AnzahlVG"
                    ControlSource ="AnzahlVG"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1107
                    Width =567
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="LiefereinheitVG"
                    ControlSource ="LiefereinheitVG"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =6345
                    Width =1233
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="EinzelpreisVG"
                    ControlSource ="EinzelpreisVG"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7596
                    Width =579
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="RabattVG"
                    ControlSource ="RabattVG"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =8217
                    Width =1818
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="EPreis"
                    ControlSource ="EPreis"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1701
                    Width =4650
                    Height =240
                    FontSize =10
                    FontWeight =700
                    TabIndex =6
                    Name ="Artikeltext"
                    ControlSource ="ArtikelText"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1695
                    Top =255
                    Width =7371
                    Height =45
                    FontSize =10
                    TabIndex =7
                    Name ="Bem"
                    ControlSource ="BemVGDet"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =3911
                    Width =861
                    Height =240
                    FontSize =10
                    TabIndex =8
                    BackColor =65535
                    Name ="NrVGDet"
                    ControlSource ="NrVGDet"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =5385
                    Width =861
                    Height =240
                    FontSize =10
                    TabIndex =9
                    BackColor =65535
                    Name ="BemVGDet"
                    ControlSource ="BemVGDet"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =283
                    Width =1701
                    Height =45
                    FontSize =10
                    TabIndex =10
                    Name ="VGDettxt"
                    FontName ="Arial"

                End
                Begin Line
                    Top =345
                    Width =10044
                    Name ="LinieDet"
                End
                Begin Subform
                    OldBorderStyle =0
                    Left =1695
                    Top =300
                    Width =7371
                    Height =45
                    TabIndex =11
                    Name ="UB_Stichwort"
                    SourceObject ="Report.UB_Stichwort"
                    LinkChildFields ="nrVGDet"
                    LinkMasterFields ="nrVGDet"

                End
            End
        End
    End
End
CodeBehindForm
' See "UB_VGDet.cls"
