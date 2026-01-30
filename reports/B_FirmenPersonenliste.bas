Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    DefaultView =0
    AllowUpdating =4
    TabularFamily =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =9923
    DatasheetFontHeight =10
    ItemSuffix =20
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xfd36ecce9c18e540
    End
    Caption ="Firma und Mitarbeiter"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    AllowLayoutView =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            TextFontFamily =2
            FontName ="Arial"
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin TextBox
            OldBorderStyle =0
            TextFontFamily =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            KeepTogether =2
            ControlSource ="Firma"
        End
        Begin BreakLevel
            ControlSource ="NachVorname"
        End
        Begin PageHeader
            Height =963
            Name ="ph"
            Begin
                Begin Label
                    TextFontFamily =34
                    Top =566
                    Width =945
                    Height =225
                    FontWeight =700
                    Name ="Bezeichnungsfeld0"
                    Caption ="Firma:"
                End
                Begin Label
                    TextFontFamily =34
                    Left =3975
                    Top =570
                    Width =1515
                    Height =225
                    FontWeight =700
                    Name ="Bezeichnungsfeld2"
                    Caption ="Anschrift"
                End
                Begin Label
                    TextFontFamily =34
                    Left =6237
                    Top =566
                    Width =1050
                    Height =225
                    FontWeight =700
                    Name ="Bezeichnungsfeld5"
                    Caption ="Telefon:"
                End
                Begin Line
                    LineSlant = NotDefault
                    BorderWidth =2
                    Top =906
                    Width =9923
                    Name ="Linie17"
                End
                Begin Label
                    TextFontFamily =34
                    Top =56
                    Width =4320
                    Height =330
                    FontSize =12
                    FontWeight =700
                    ForeColor =8388608
                    Name ="Bezeichnungsfeld19"
                    Caption ="Adressliste: Firma und Mitarbeiter"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =7426
                    Width =2494
                    Height =630
                    ColumnOrder =0
                    Name ="Text491"
                    ControlSource ="=\"Firma- DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page]"
                        " & \" von \" & [Pages]"

                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =240
            Name ="gh"
            Begin
                Begin TextBox
                    TextFontFamily =34
                    Width =2835
                    ColumnWidth =3570
                    FontWeight =700
                    Name ="Firma"
                    ControlSource ="Firma"

                End
                Begin TextBox
                    TextFontFamily =34
                    Left =2835
                    Width =3402
                    FontWeight =700
                    TabIndex =1
                    Name ="FirmaAdresse"
                    ControlSource ="FirmaAdresse"

                End
                Begin TextBox
                    TextFontFamily =34
                    Left =6237
                    Width =3636
                    FontWeight =700
                    TabIndex =2
                    Name ="FirmaTelefon"
                    ControlSource ="FirmaTelefon"
                    StatusBarText ="Telefon"

                End
                Begin Line
                    LineSlant = NotDefault
                    BorderWidth =1
                    Width =9923
                    Name ="Linie18"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =60
            Name ="det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    Left =284
                    Width =2552
                    Height =60
                    Name ="MA"
                    ControlSource ="MA"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =6237
                    Width =3686
                    Height =60
                    TabIndex =1
                    Name ="MAtel"
                    ControlSource ="MAtel"
                    StatusBarText ="Telefon"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =2835
                    Width =3402
                    Height =60
                    TabIndex =2
                    Name ="FunktionAbteil"
                    ControlSource ="FunktionAbteil"

                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            Height =0
            Name ="gf"
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_FirmenPersonenliste.cls"
