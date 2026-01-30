Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11520
    DatasheetFontHeight =11
    ItemSuffix =39
    Right =24675
    Bottom =12195
    RecSrcDt = Begin
        0x00ae3d417151e640
    End
    RecordSource ="T_Adresse"
    Caption ="T_Adresse"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =1026
            Name ="Formularkopf"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =57
                    Top =57
                    Width =2124
                    Height =969
                    FontSize =20
                    Name ="Bezeichnungsfeld38"
                    Caption ="T_Adresse"
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =2181
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =8652
            Name ="Detailbereich"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =342
                    Height =315
                    ColumnWidth =1701
                    Name ="NrAdresse"
                    ControlSource ="NrAdresse"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =342
                    LayoutCachedWidth =3558
                    LayoutCachedHeight =657
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =1425
                            Height =330
                            Name ="NrAdresse_Bezeichnungsfeld"
                            Caption ="NrAdresse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =1
                    Name ="Vorname"
                    ControlSource ="Vorname"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =741
                    LayoutCachedWidth =5517
                    LayoutCachedHeight =1071
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =741
                            Width =1425
                            Height =330
                            Name ="Vorname_Bezeichnungsfeld"
                            Caption ="Vorname"
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =1140
                    Width =4185
                    Height =600
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Nachname"
                    ControlSource ="Nachname"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =1140
                    LayoutCachedWidth =6042
                    LayoutCachedHeight =1740
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =1425
                            Height =330
                            Name ="Nachname_Bezeichnungsfeld"
                            Caption ="Nachname"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =1824
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =3
                    Name ="Rufname"
                    ControlSource ="Rufname"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =1824
                    LayoutCachedWidth =5517
                    LayoutCachedHeight =2154
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1824
                            Width =1425
                            Height =330
                            Name ="Rufname_Bezeichnungsfeld"
                            Caption ="Rufname"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1824
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =2154
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =2223
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Titel"
                    ControlSource ="Titel"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =2223
                    LayoutCachedWidth =5517
                    LayoutCachedHeight =2553
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2223
                            Width =1425
                            Height =330
                            Name ="Titel_Bezeichnungsfeld"
                            Caption ="Titel"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2223
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =2553
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =2622
                    Width =1530
                    Height =330
                    ColumnWidth =1530
                    TabIndex =5
                    Name ="ArtAdresse"
                    ControlSource ="ArtAdresse"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =2622
                    LayoutCachedWidth =3387
                    LayoutCachedHeight =2952
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2622
                            Width =1425
                            Height =330
                            Name ="ArtAdresse_Bezeichnungsfeld"
                            Caption ="ArtAdresse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2622
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =2952
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =3021
                    Width =4185
                    Height =600
                    ColumnWidth =3000
                    TabIndex =6
                    Name ="Beruf"
                    ControlSource ="Beruf"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =3021
                    LayoutCachedWidth =6042
                    LayoutCachedHeight =3621
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3021
                            Width =1425
                            Height =330
                            Name ="Beruf_Bezeichnungsfeld"
                            Caption ="Beruf"
                            LayoutCachedLeft =342
                            LayoutCachedTop =3021
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =3351
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =3705
                    Width =1380
                    Height =330
                    ColumnWidth =1380
                    TabIndex =7
                    Name ="Kurzzeichen"
                    ControlSource ="Kurzzeichen"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =3705
                    LayoutCachedWidth =3237
                    LayoutCachedHeight =4035
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3705
                            Width =1425
                            Height =330
                            Name ="Kurzzeichen_Bezeichnungsfeld"
                            Caption ="Kurzzeichen"
                            LayoutCachedLeft =342
                            LayoutCachedTop =3705
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =4035
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =4104
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =8
                    Name ="Ort"
                    ControlSource ="Ort"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =4104
                    LayoutCachedWidth =5517
                    LayoutCachedHeight =4434
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4104
                            Width =1425
                            Height =330
                            Name ="Ort_Bezeichnungsfeld"
                            Caption ="Ort"
                            LayoutCachedLeft =342
                            LayoutCachedTop =4104
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =4434
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =4503
                    Width =960
                    Height =330
                    ColumnWidth =960
                    TabIndex =9
                    Name ="Land"
                    ControlSource ="Land"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =4503
                    LayoutCachedWidth =2817
                    LayoutCachedHeight =4833
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4503
                            Width =1425
                            Height =330
                            Name ="Land_Bezeichnungsfeld"
                            Caption ="Land"
                            LayoutCachedLeft =342
                            LayoutCachedTop =4503
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =4833
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =4902
                    Width =1530
                    Height =330
                    ColumnWidth =1530
                    TabIndex =10
                    Name ="PLZStrasse"
                    ControlSource ="PLZStrasse"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =4902
                    LayoutCachedWidth =3387
                    LayoutCachedHeight =5232
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4902
                            Width =1425
                            Height =330
                            Name ="PLZStrasse_Bezeichnungsfeld"
                            Caption ="PLZStrasse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =4902
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =5232
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =5301
                    Width =4185
                    Height =600
                    ColumnWidth =3000
                    TabIndex =11
                    Name ="Strasse"
                    ControlSource ="Strasse"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =5301
                    LayoutCachedWidth =6042
                    LayoutCachedHeight =5901
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5301
                            Width =1425
                            Height =330
                            Name ="Strasse_Bezeichnungsfeld"
                            Caption ="Strasse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =5301
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =5631
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =5985
                    Width =4185
                    Height =600
                    ColumnWidth =3000
                    TabIndex =12
                    Name ="Postadr"
                    ControlSource ="Postadr"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =5985
                    LayoutCachedWidth =6042
                    LayoutCachedHeight =6585
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5985
                            Width =1425
                            Height =330
                            Name ="Postadr_Bezeichnungsfeld"
                            Caption ="Postadr"
                            LayoutCachedLeft =342
                            LayoutCachedTop =5985
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =6315
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =6669
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =13
                    Name ="GebTag"
                    ControlSource ="GebTag"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =6669
                    LayoutCachedWidth =3477
                    LayoutCachedHeight =6999
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =6669
                            Width =1425
                            Height =330
                            Name ="GebTag_Bezeichnungsfeld"
                            Caption ="GebTag"
                            LayoutCachedLeft =342
                            LayoutCachedTop =6669
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =6999
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =7068
                    Width =4185
                    Height =1140
                    ColumnWidth =3000
                    TabIndex =14
                    Name ="BemAdresse"
                    ControlSource ="BemAdresse"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =7068
                    LayoutCachedWidth =6042
                    LayoutCachedHeight =8208
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =7068
                            Width =1425
                            Height =330
                            Name ="BemAdresse_Bezeichnungsfeld"
                            Caption ="BemAdresse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =7068
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =7398
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1857
                    Top =8322
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =15
                    Name ="AdresseErfasst"
                    ControlSource ="AdresseErfasst"

                    LayoutCachedLeft =1857
                    LayoutCachedTop =8322
                    LayoutCachedWidth =3477
                    LayoutCachedHeight =8652
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =8322
                            Width =1425
                            Height =330
                            Name ="AdresseErfasst_Bezeichnungsfeld"
                            Caption ="AdresseErfasst"
                            LayoutCachedLeft =342
                            LayoutCachedTop =8322
                            LayoutCachedWidth =1767
                            LayoutCachedHeight =8652
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7737
                    Top =342
                    Width =1530
                    Height =330
                    ColumnWidth =1530
                    TabIndex =16
                    Name ="TempHelp"
                    ControlSource ="TempHelp"

                    LayoutCachedLeft =7737
                    LayoutCachedTop =342
                    LayoutCachedWidth =9267
                    LayoutCachedHeight =672
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6222
                            Top =342
                            Width =1425
                            Height =330
                            Name ="TempHelp_Bezeichnungsfeld"
                            Caption ="TempHelp"
                            LayoutCachedLeft =6222
                            LayoutCachedTop =342
                            LayoutCachedWidth =7647
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7737
                    Top =741
                    Width =3726
                    Height =600
                    ColumnWidth =3000
                    TabIndex =17
                    Name ="Du"
                    ControlSource ="Du"

                    LayoutCachedLeft =7737
                    LayoutCachedTop =741
                    LayoutCachedWidth =11463
                    LayoutCachedHeight =1341
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6222
                            Top =741
                            Width =1425
                            Height =330
                            Name ="Du_Bezeichnungsfeld"
                            Caption ="Du"
                            LayoutCachedLeft =6222
                            LayoutCachedTop =741
                            LayoutCachedWidth =7647
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7737
                    Top =1425
                    Width =960
                    Height =330
                    ColumnWidth =960
                    TabIndex =18
                    Name ="AdrSecurity"
                    ControlSource ="AdrSecurity"

                    LayoutCachedLeft =7737
                    LayoutCachedTop =1425
                    LayoutCachedWidth =8697
                    LayoutCachedHeight =1755
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6222
                            Top =1425
                            Width =1425
                            Height =330
                            Name ="AdrSecurity_Bezeichnungsfeld"
                            Caption ="AdrSecurity"
                            LayoutCachedLeft =6222
                            LayoutCachedTop =1425
                            LayoutCachedWidth =7647
                            LayoutCachedHeight =1755
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="Formularfuß"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
