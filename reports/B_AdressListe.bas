Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    DefaultView =0
    AllowUpdating =4
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10208
    DatasheetFontHeight =10
    ItemSuffix =33
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xe4fe9ad59c18e540
    End
    Caption ="Adressen ausdrucken"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    AllowLayoutView =0
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
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
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
        Begin PageHeader
            Height =855
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Label
                    FontItalic = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Width =10200
                    Height =855
                    FontSize =14
                    BackColor =12632256
                    BorderColor =255
                    ForeColor =0
                    Name ="strReportTitel"
                End
                Begin TextBox
                    TextAlign =3
                    TextFontFamily =18
                    Left =7934
                    Width =2165
                    Height =445
                    ColumnOrder =0
                    Name ="Feld38"
                    ControlSource ="=Format(Now(),\"dd/mm/yy hh:nn\") & \"\015\012Seite \" & [Page] & \" von \" & [P"
                        "ages]"
                    FontName ="Times New Roman"

                End
                Begin Label
                    TextFontFamily =34
                    Left =622
                    Top =511
                    Width =915
                    Height =285
                    FontSize =10
                    Name ="Name Bezeichnungsfeld"
                    Caption ="Name"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Name_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =2895
                    Top =510
                    Width =2265
                    Height =285
                    FontSize =10
                    Name ="Orte Bezeichnungsfeld"
                    Caption ="Firma / Ort /Strasse"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Orte_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =5272
                    Top =510
                    Width =1425
                    Height =285
                    FontSize =10
                    Name ="Funktionen Bezeichnungsfeld"
                    Caption ="Funktion"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Funktionen_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =7880
                    Top =510
                    Width =1770
                    Height =285
                    FontSize =10
                    Name ="Telefon Bezeichnungsfeld"
                    Caption ="Telefon / Handy"
                    FontName ="Arial"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Telefon_Bezeichnungsfeld"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =240
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =7937
                    Width =2271
                    Height =225
                    TabIndex =4
                    BorderColor =255
                    Name ="TelefonNr"
                    ControlSource ="TelefonNr"
                    StatusBarText ="Telefon"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =345
                    Width =2478
                    Height =225
                    ColumnWidth =3075
                    Name ="p1"
                    ControlSource ="p1"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =2823
                    Width =2478
                    Height =225
                    ColumnWidth =3570
                    TabIndex =1
                    Name ="p2"
                    ControlSource ="p2"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =5301
                    Width =2628
                    Height =225
                    ColumnWidth =2565
                    TabIndex =2
                    Name ="FA"
                    ControlSource ="FA"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontItalic = NotDefault
                    RunningSum =2
                    Width =345
                    FontWeight =700
                    TabIndex =3
                    ForeColor =8388608
                    Name ="lfdNummer"
                    ControlSource ="=1"
                    Tag ="DetachedLabel"

                End
                Begin Line
                    Width =10206
                    Name ="LinieDet"
                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="Seitenfuß"
        End
    End
End
CodeBehindForm
' See "B_AdressListe.cls"
