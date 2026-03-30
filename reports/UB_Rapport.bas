Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =4941
    DatasheetFontHeight =12
    ItemSuffix =121
    RecSrcDt = Begin
        0xce66fc1df916e540
    End
    RecordSource ="SELECT DISTINCTROW Month([DatumTag]) AS Monat, Year([DatumTag]) AS Jahr, T_Beste"
        "ll.NrBestell, T_Leistung.NrBearbeiter, T_Artikel.Artikelname, T_Artikel.Lieferei"
        "nheit, T_Leistung.NrBestellDetails, T_Leistung.AnzahlLeistung FROM T_Funktion IN"
        "NER JOIN (T_Bestell INNER JOIN ((T_Artikel INNER JOIN T_BestellDetails ON T_Arti"
        "kel.NrArtikel = T_BestellDetails.NrArtikel) INNER JOIN T_Leistung ON T_BestellDe"
        "tails.NrBestellDetails = T_Leistung.NrBestellDetails) ON T_Bestell.NrBestell = T"
        "_BestellDetails.NrBestell) ON T_Funktion.NrMitarbeiter = T_Leistung.NrBearbeiter"
        " GROUP BY Month([DatumTag]), Year([DatumTag]), T_Bestell.NrBestell, T_Leistung.N"
        "rBearbeiter, T_Artikel.Artikelname, T_Artikel.Liefereinheit, T_Leistung.NrBestel"
        "lDetails, T_Leistung.AnzahlLeistung ORDER BY Month([DatumTag]), Year([DatumTag])"
        ", T_Leistung.AnzahlLeistung; "
    Caption ="Rapport"
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
        Begin BreakLevel
            ControlSource ="Jahr"
        End
        Begin BreakLevel
            ControlSource ="Monat"
        End
        Begin BreakLevel
            ControlSource ="AnzahlLeistung"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="Berichtskopf0"
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =285
            Name ="Detail1"
            Begin
                Begin TextBox
                    TextFontFamily =34
                    Left =765
                    Width =737
                    Height =285
                    FontSize =10
                    Name ="Feld115"
                    ControlSource ="Liefereinheit"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1530
                    Width =3411
                    Height =285
                    FontSize =10
                    TabIndex =1
                    Name ="Feld116"
                    ControlSource ="Artikelname"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    DecimalPlaces =2
                    TextAlign =0
                    TextFontFamily =34
                    Width =737
                    Height =285
                    FontSize =10
                    TabIndex =2
                    Name ="Feld118"
                    ControlSource ="AnzahlLeistung"
                    Format ="Standard"
                    FontName ="Futura Lt BT"

                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =0
            Name ="Berichtsfuß1"
        End
    End
End
CodeBehindForm
' See "UB_Rapport.cls"
