Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =9081
    DatasheetFontHeight =12
    ItemSuffix =137
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x01e728d99c18e540
    End
    Caption ="Bestellt-Geleistet-Verrechnet"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
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
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="NrProjekt"
        End
        Begin BreakLevel
            ControlSource ="Position"
        End
        Begin PageHeader
            Height =2876
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Label
                    BorderWidth =2
                    TextAlign =2
                    TextFontFamily =34
                    Left =120
                    Top =566
                    Width =7080
                    Height =435
                    FontSize =16
                    Name ="Text120"
                    Caption ="Vergleich Bestellt-Geleistet-Verrechnet"
                    FontName ="Arial"
                End
                Begin TextBox
                    BorderWidth =0
                    TextFontFamily =34
                    Left =7360
                    Top =849
                    Width =1641
                    FontSize =10
                    FontWeight =700
                    Name ="Feld120"
                    ControlSource ="=Date()"
                    Format ="dd\\.mm\\.yy"
                    FontName ="Arial"

                End
                Begin TextBox
                    BorderWidth =0
                    TextFontFamily =34
                    Left =7313
                    Top =566
                    Width =1719
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="Feld25"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"
                    Format ="Short Date"
                    FontName ="Arial"

                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1531
                    Width =1590
                    Height =285
                    FontWeight =400
                    Name ="Text24"
                    Caption ="Auftraggeber"
                    FontName ="Arial"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1531
                    Width =7242
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="FirmaPartner"
                    ControlSource ="FirmaPartner"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1246
                    Width =7242
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="Feld42"
                    ControlSource ="=[ANr] & \" \" & [VG]"
                    FontName ="Arial"

                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1246
                    Width =1590
                    Height =285
                    FontWeight =400
                    Name ="Text104"
                    Caption ="Projekt"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =2101
                    Width =1590
                    Height =285
                    FontWeight =400
                    Name ="Text101"
                    Caption ="Bestell-Nr."
                    FontName ="Arial"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =2101
                    Width =7242
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="BestellNr"
                    ControlSource ="BestellNr"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1717
                    Top =1816
                    Width =7242
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="Partner"
                    ControlSource ="Partner"
                    FontName ="Arial"

                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Top =1816
                    Width =1590
                    Height =285
                    FontWeight =400
                    Name ="Text106"
                    Caption ="Partner"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =5835
                    Top =2606
                    Width =1035
                    Height =270
                    FontWeight =400
                    Name ="Text26"
                    Caption ="bestellt"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =480
                    Top =2606
                    Width =5355
                    Height =270
                    FontWeight =400
                    Name ="Text37"
                    Caption ="Detailbeschreibung"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =34
                    Top =2606
                    Width =480
                    Height =270
                    FontWeight =400
                    Name ="Text38"
                    Caption ="Pos."
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =6870
                    Top =2606
                    Width =1035
                    Height =270
                    FontWeight =400
                    Name ="Text87"
                    Caption ="geleistet"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7905
                    Top =2606
                    Width =1035
                    Height =270
                    FontWeight =400
                    Name ="Bezeichnungsfeld126"
                    Caption ="verrechnet"
                    FontName ="Arial"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =7154
                    Top =56
                    Width =1902
                    Height =375
                    FontSize =14
                    FontWeight =700
                    TabIndex =6
                    Name ="ProjektNr"
                    ControlSource ="ProjektNr"
                    FontName ="Arial"

                End
                Begin Label
                    SpecialEffect =4
                    OldBorderStyle =1
                    BorderWidth =3
                    TextFontFamily =34
                    Width =7089
                    Height =480
                    FontSize =14
                    Name ="strReportTitel"
                    Caption ="Rapport"
                    FontName ="Arial"
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =0
            Name ="Gruppenkopf1"
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =285
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =2
                    TextFontFamily =34
                    Width =564
                    Height =270
                    FontSize =10
                    Name ="Position"
                    ControlSource ="Position"
                    Format ="00"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =6889
                    Width =1035
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="geleistet"
                    ControlSource ="geleistet"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =7924
                    Width =1035
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="verrechnet"
                    ControlSource ="verrechnet"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =5854
                    Width =1035
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="bestellt"
                    ControlSource ="bestellt"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =2
                    TextAlign =3
                    TextFontFamily =34
                    Left =4819
                    Width =1035
                    Height =270
                    FontSize =10
                    TabIndex =5
                    Name ="LiefereinheitVG"
                    ControlSource ="LiefereinheitVG"
                    Format ="Standard"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =3
                    TextFontFamily =34
                    Left =7937
                    Width =225
                    Height =285
                    FontSize =10
                    FontWeight =700
                    TabIndex =6
                    Name ="Diff"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =510
                    Width =4308
                    Height =270
                    FontSize =10
                    TabIndex =2
                    Name ="Feld116"
                    ControlSource ="ArtikelText"
                    FontName ="Arial"

                End
                Begin Line
                    Width =9072
                    Name ="LinieDetaisl"
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            ForceNewPage =2
            Height =15
            Name ="Gruppenfuß1"
            Begin
                Begin Line
                    Width =9081
                    Name ="Linie124"
                End
            End
        End
        Begin PageFooter
            Height =345
            Name ="Seitenfuß2"
            Begin
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =195
                    Top =56
                    Width =2985
                    Height =285
                    Name ="Bezeichnungsfeld131"
                    Caption =": weniger verrechnet als bestellt\015\012"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =3315
                    Top =60
                    Width =2745
                    Height =285
                    Name ="Bezeichnungsfeld133"
                    Caption =": mehr verrechnet als bestellt\015\012"
                    FontName ="Arial"
                End
                Begin Label
                    OldBorderStyle =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =6147
                    Top =56
                    Width =2235
                    Height =285
                    Name ="Bezeichnungsfeld135"
                    Caption =": verrechnet =  bestellt\015\012"
                    FontName ="Arial"
                End
                Begin Label
                    BackStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =170
                    Top =56
                    Width =195
                    Height =285
                    ForeColor =65280
                    Name ="Bezeichnungsfeld130"
                    Caption ="+\015\012"
                    FontName ="Arial"
                End
                Begin Label
                    BackStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =3344
                    Top =56
                    Width =135
                    Height =285
                    ForeColor =255
                    Name ="Bezeichnungsfeld132"
                    Caption ="-\015\012"
                    FontName ="Arial"
                End
                Begin Label
                    BackStyle =0
                    TextAlign =3
                    TextFontFamily =34
                    Left =6236
                    Top =56
                    Width =135
                    Height =285
                    Name ="Bezeichnungsfeld134"
                    Caption ="=\015\012"
                    FontName ="Arial"
                End
            End
        End
    End
End
CodeBehindForm
' See "B_SollIst.cls"
