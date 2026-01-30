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
    Width =10206
    DatasheetFontHeight =10
    ItemSuffix =42
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x431641140e05e340
    End
    Caption ="Preisliste"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
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
        Begin BreakLevel
            GroupHeader = NotDefault
            ControlSource ="Artikel"
        End
        Begin BreakLevel
            ControlSource ="ArtikelNr"
        End
        Begin PageHeader
            Height =1551
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Image
                    SizeMode =3
                    Width =10152
                    Height =1375
                    Name ="LogoSeiteO"

                End
                Begin Label
                    BackStyle =1
                    TextFontFamily =34
                    Top =510
                    Width =3600
                    Height =510
                    FontSize =20
                    Name ="Bezeichnungsfeld30"
                    Caption ="Preisliste "
                    FontName ="Arial"
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =696
            Name ="Gruppenkopf0"
            Begin
                Begin TextBox
                    FontItalic = NotDefault
                    DecimalPlaces =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2834
                    Width =5154
                    Height =285
                    FontSize =11
                    FontWeight =700
                    ForeColor =8388608
                    Name ="Artikel"
                    ControlSource ="Artikel"
                    StatusBarText ="Primärschlüssel der Tabelle Typen, dient zur Verknüpfung"

                End
                Begin Label
                    TextFontFamily =34
                    Left =56
                    Width =2679
                    Height =300
                    Name ="Artikel_Bezeichnungsfeld"
                    Caption ="Artikelgruppe:"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Top =396
                    Width =1593
                    Height =300
                    FontSize =10
                    FontWeight =400
                    Name ="ArtikelNr_Bezeichnungsfeld"
                    Caption ="ArtikelNr"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Left =1590
                    Top =396
                    Width =2379
                    Height =300
                    FontSize =10
                    FontWeight =400
                    Name ="Artikelname_Bezeichnungsfeld"
                    Caption ="Artikelname"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextAlign =3
                    TextFontFamily =34
                    Left =7758
                    Top =396
                    Width =978
                    Height =300
                    FontSize =10
                    FontWeight =400
                    Name ="Einzelpreis_Bezeichnungsfeld"
                    Caption ="Preis"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Left =8730
                    Top =396
                    Width =978
                    Height =300
                    FontSize =10
                    FontWeight =400
                    Name ="Bezeichnungsfeld39"
                    Caption ="Einheit"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                End
                Begin Line
                    BorderWidth =2
                    Width =10206
                    Name ="Linie41"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =396
            Name ="Detailbereich"
            Begin
                Begin TextBox
                    IMESentenceMode =3
                    Width =1143
                    Height =270
                    FontSize =10
                    Name ="ArtikelNr"
                    ControlSource ="ArtikelNr"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =1143
                    Width =6174
                    Height =270
                    ColumnWidth =3075
                    FontSize =10
                    TabIndex =1
                    Name ="ArtikelnameHersteller"
                    ControlSource ="=[Artikelname] & \" \" & [Hersteller]"

                    LayoutCachedLeft =1143
                    LayoutCachedWidth =7317
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8735
                    Width =912
                    Height =270
                    ColumnWidth =690
                    FontSize =10
                    TabIndex =2
                    Name ="Liefereinheit"
                    ControlSource ="Liefereinheit"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =283
                    Top =283
                    Width =9429
                    Height =60
                    TabIndex =3
                    Name ="BemArtikel"
                    ControlSource ="BemArtikel"

                End
                Begin TextBox
                    OverlapFlags =12
                    TextAlign =3
                    IMESentenceMode =3
                    Left =7369
                    Width =1368
                    Height =270
                    FontSize =10
                    TabIndex =4
                    Name ="Einzelpreis"
                    ControlSource ="Einzelpreis"
                    Format ="Standard"
                    StatusBarText ="Verkaufspreis"

                    LayoutCachedLeft =7369
                    LayoutCachedWidth =8737
                    LayoutCachedHeight =270
                End
                Begin Line
                    Width =10206
                    Name ="Linie40"
                End
            End
        End
        Begin PageFooter
            Height =356
            Name ="Seitenfußbereich"
            Begin
                Begin TextBox
                    FontItalic = NotDefault
                    TextAlign =1
                    IMESentenceMode =3
                    Top =56
                    Width =5040
                    Height =300
                    ForeColor =8388608
                    Name ="Text31"
                    ControlSource ="=Now()"
                    Format ="Long Date"

                End
                Begin TextBox
                    FontItalic = NotDefault
                    TextAlign =3
                    IMESentenceMode =3
                    Left =5725
                    Top =56
                    Width =3975
                    Height =300
                    TabIndex =1
                    ForeColor =8388608
                    Name ="Text32"
                    ControlSource ="=\"SEITE \" & [Page] & \" VON \"  & [Pages]"

                End
            End
        End
    End
End
CodeBehindForm
' See "B_ArtikelPreise.cls"
