Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    DataEntry = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =3
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =20636
    DatasheetFontHeight =11
    ItemSuffix =65
    Left =-4861
    Top =3030
    Right =20609
    Bottom =15225
    RecSrcDt = Begin
        0xada7e09413bde440
    End
    Caption ="Adressen erstellen"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    DatasheetBackColor12 =-2147483643
    ShowPageMargins =0
    DatasheetAlternateBackColor =16053492
    DatasheetGridlinesColor12 =15062992
    FitToScreen =1
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            ForeThemeColorIndex =2
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BackColor =-2147483633
            BorderLineStyle =0
            BorderThemeColorIndex =3
            BorderShade =90.0
            ThemeFontIndex =1
        End
        Begin TextBox
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ThemeFontIndex =1
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =3
            BorderShade =90.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =7095
            Name ="det"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =511
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =1
                    Name ="Titel"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 20 30"
                    ControlTipText ="Titel: mit Doppelklick umschalten zwischen Dr. , Prof. und leer"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    SmartTags ="\"10 30\""

                    LayoutCachedLeft =8222
                    LayoutCachedTop =511
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =826
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =511
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld1"
                            Caption ="Titel:"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =511
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =826
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =882
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =2
                    BorderColor =255
                    Name ="Vorname"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10, 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =882
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =1197
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =882
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblVorname"
                            Caption ="Vorname"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =882
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =1197
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =1253
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =3
                    BorderColor =255
                    Name ="Nachname"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =1253
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =1568
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =1253
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblNAchname"
                            Caption ="Nachname"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =1253
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =1568
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =1624
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =4
                    Name ="Beruf"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =1624
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =1939
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =1624
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblBeruf"
                            Caption ="Beruf"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =1624
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =1939
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =5214
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =14
                    Name ="Telefon"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =5214
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =5529
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =5214
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblTelefon"
                            Caption ="Telefon"
                            FontName ="Arial"
                            Tag ="10 20 30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =5214
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =5529
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =5585
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =15
                    Name ="Fax"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =5585
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =5900
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =5585
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld15"
                            Caption ="Fax"
                            FontName ="Arial"
                            Tag ="10 20 30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =5585
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =5900
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =5956
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =16
                    BorderColor =0
                    Name ="email"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =5956
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =6271
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =5956
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblEmail"
                            Caption ="Email"
                            FontName ="Arial"
                            Tag ="10 20 30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =5956
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =6271
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =6327
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =17
                    Name ="internet"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =6327
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =6642
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =6327
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld19"
                            Caption ="www"
                            FontName ="Arial"
                            Tag ="10 20 30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =6327
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =6642
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =170
                    Width =5670
                    Height =285
                    FontSize =10
                    BorderColor =2366701
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End
                    Name ="Anrede"
                    RowSourceType ="Table/Query"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 20 30"
                    ControlTipText ="mit Doppelklick umschalten zwischen Herr und Frau"
                    AllowValueListEdits =0

                    LayoutCachedLeft =8222
                    LayoutCachedTop =170
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =455
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =170
                            Width =1701
                            Height =285
                            FontSize =10
                            Name ="Bezeichnungsfeld21"
                            Caption ="Anrede / Art"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =170
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =455
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14966
                    Top =566
                    Width =5670
                    Height =5670
                    FontSize =10
                    TabIndex =21
                    BackColor =62207
                    Name ="lstA"
                    RowSourceType ="Value List"
                    RowSource =";Senior Manager Maintenance Projects;"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Zuerst rechts das gewünschte Feld anclicken; dann mit Click hier eintragen lasse"
                        "n"
                    AllowValueListEdits =0
                    InheritValueList =0

                    ShowOnlyRowSourceValues =255
                    LayoutCachedLeft =14966
                    LayoutCachedTop =566
                    LayoutCachedWidth =20636
                    LayoutCachedHeight =6236
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =226
                    Top =170
                    Width =2268
                    Height =405
                    FontSize =10
                    TabIndex =19
                    Name ="btnCB"
                    Caption ="Zwischenablage einfügen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Hiermit wird die Zwischenablage eingefügt.\015\012Es wird versucht, daraus als e"
                        "rstes die Firmendaten zu generieren"

                    LayoutCachedLeft =226
                    LayoutCachedTop =170
                    LayoutCachedWidth =2494
                    LayoutCachedHeight =575
                    ThemeFontIndex =-1
                    Overlaps =1
                End
                Begin TextBox
                    TabStop = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =230
                    Top =1673
                    Width =5670
                    Height =3402
                    FontSize =10
                    TabIndex =23
                    Name ="cb"
                    OnExit ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Inhalt der Zwischenablage\015\012Sie können Text hier markieren und das Markiert"
                        "e mit einem einfachen Click in eines der Felder rechts übertragen"

                    LayoutCachedLeft =230
                    LayoutCachedTop =1673
                    LayoutCachedWidth =5900
                    LayoutCachedHeight =5075
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =6698
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =18
                    Name ="Mobile"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =6698
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =7013
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =6698
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld30"
                            Caption ="Mobile"
                            FontName ="Arial"
                            Tag ="10 20 30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =6698
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =7013
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =2745
                    Top =165
                    Width =2268
                    Height =405
                    FontSize =10
                    TabIndex =20
                    Name ="btnSave"
                    Caption ="Adresse eintragen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Adresse in Datenbank eintragen (wenn alle rot umrandeten Felder ausgefüllt sind)"

                    LayoutCachedLeft =2745
                    LayoutCachedTop =165
                    LayoutCachedWidth =5013
                    LayoutCachedHeight =570
                    ThemeFontIndex =-1
                    Overlaps =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =1995
                    Height =315
                    FontSize =10
                    TabIndex =5
                    Name ="GebTag"
                    Format ="Short Date"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =1995
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =2310
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =1995
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblGebTag"
                            Caption ="Geburtstag"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =1995
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =2310
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =2366
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =7
                    BorderColor =0
                    Name ="Strasse"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =2366
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =2681
                    BorderThemeColorIndex =-1
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =2366
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblStrasse"
                            Caption ="Strasse (privat)"
                            FontName ="Arial"
                            Tag ="10  30"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =2366
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =2681
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2553
                    Left =8222
                    Top =2737
                    Height =285
                    FontSize =10
                    TabIndex =6
                    BorderColor =255
                    ForeColor =0
                    Name ="Land"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;1701"
                    StatusBarText ="Land"
                    DefaultValue ="\"D\""
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Land"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =8222
                    LayoutCachedTop =2737
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =3022
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =2737
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblLand"
                            Caption ="Land (privat)"
                            FontName ="Arial"
                            Tag ="10 20"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =2737
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =3052
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =3078
                    Height =285
                    FontSize =10
                    TabIndex =8
                    Name ="PLZStrasse"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =3078
                    LayoutCachedWidth =9923
                    LayoutCachedHeight =3363
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =3078
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblPLZ"
                            Caption ="PLZ (privat)"
                            FontName ="Arial"
                            Tag ="10 20"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =3078
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =3393
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =3419
                    Width =5670
                    Height =285
                    FontSize =10
                    TabIndex =9
                    Name ="Ort"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =3419
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =3704
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =3419
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="lblOrt"
                            Caption ="Ort (privat)"
                            FontName ="Arial"
                            Tag ="10 20"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =3419
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =3734
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =3760
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =10
                    Name ="Bemerkung"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 10 20 30"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =3760
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =4075
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =6236
                            Top =3760
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld51"
                            Caption ="Bemerkungen"
                            FontName ="Arial"
                            Tag ="10 20"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =3760
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =4075
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =4472
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =12
                    Name ="funktion"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 20"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =4472
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =4787
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =6236
                            Top =4472
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld9"
                            Caption ="Funktion"
                            FontName ="Arial"
                            Tag ="10"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =4472
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =4787
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =1921
                    Top =680
                    Width =3975
                    Height =851
                    FontSize =10
                    TabIndex =22
                    Name ="lstArt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;28350"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Als erstes wird versucht, die Firma aus der Zwischenablage zu generieren.\015\012"
                        "Als nächstes können SIe dann auch eine Person ermitteln und als Mitarbeiter der "
                        "Fa. zuordnen."

                    ShowOnlyRowSourceValues =255
                    LayoutCachedLeft =1921
                    LayoutCachedTop =680
                    LayoutCachedWidth =5896
                    LayoutCachedHeight =1531
                    ThemeFontIndex =-1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =226
                    Top =680
                    Width =1635
                    Height =851
                    FontSize =10
                    Name ="Bezeichnungsfeld53"
                    Caption ="zu erfassende Adressen-Art auswählen"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    LayoutCachedLeft =226
                    LayoutCachedTop =680
                    LayoutCachedWidth =1861
                    LayoutCachedHeight =1531
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8222
                    Top =4843
                    Width =5670
                    Height =315
                    FontSize =10
                    TabIndex =13
                    Name ="Abteilung"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 20"
                    ConditionalFormat = Begin
                        0x0100000064000000010000000200000000000000000000000100000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000
                    End

                    LayoutCachedLeft =8222
                    LayoutCachedTop =4843
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =5158
                    ThemeFontIndex =-1
                    ConditionalFormat14 = Begin
                        0x01000100000002000000000000000100000000000000a7da4e00000000000000 ,
                        0x00000000000000000000000000000000000000
                    End
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6236
                            Top =4843
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld55"
                            Caption ="Abteilung"
                            FontName ="Arial"
                            Tag ="10"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =4843
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =5158
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2553
                    Left =8222
                    Top =4131
                    Width =5670
                    Height =285
                    FontSize =10
                    TabIndex =11
                    BorderColor =2366701
                    ForeColor =0
                    Name ="firma"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;4536"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="leermachen 20"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =8222
                    LayoutCachedTop =4131
                    LayoutCachedWidth =13892
                    LayoutCachedHeight =4416
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =6236
                            Top =4131
                            Width =1701
                            Height =315
                            FontSize =10
                            Name ="Bezeichnungsfeld61"
                            Caption ="arbeitet bei Fa."
                            FontName ="Arial"
                            Tag ="10 20"
                            LayoutCachedLeft =6236
                            LayoutCachedTop =4131
                            LayoutCachedWidth =7937
                            LayoutCachedHeight =4446
                            ThemeFontIndex =-1
                        End
                    End
                End
                Begin ListBox
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =226
                    Top =5159
                    Width =5670
                    Height =1936
                    FontSize =10
                    TabIndex =24
                    BackColor =255
                    ForeColor =16777215
                    Name ="lsts"
                    RowSourceType ="Value List"
                    RowSource ="Zwischenablage beinhaltet KEINE Adresse (nur 71 Zeichen)"
                    FontName ="Arial"
                    Tag ="10 20 30"
                    ControlTipText ="Hinweise nach Adress-Eingabe"
                    AllowValueListEdits =0
                    InheritValueList =0

                    ShowOnlyRowSourceValues =255
                    LayoutCachedLeft =226
                    LayoutCachedTop =5159
                    LayoutCachedWidth =5896
                    LayoutCachedHeight =7095
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =-1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =7712
                    Top =4081
                    Width =495
                    Height =405
                    FontSize =10
                    TabIndex =25
                    Name ="btnFirma"
                    Caption ="Firma asuwählen"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddd000000000000dddd0fff0bb0fff0dd ,
                        0xdd0fff0bb0fff0dddd0fff0bb0fff0dddd0fff0bb0fff0dddd0fff0000fff0dd ,
                        0xdd0ffffffffff0ddd0b0ffffffff0b0ddd0b0ffffff0b0ddddd0b0ffff0b0ddd ,
                        0xdddd0b0ff0b00dddddddd0b00b010ddddddddd0bb0d10dddddddddd00dd10ddd ,
                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Tag ="20 30"
                    ControlTipText ="Firma auswählen"

                    LayoutCachedLeft =7712
                    LayoutCachedTop =4081
                    LayoutCachedWidth =8207
                    LayoutCachedHeight =4486
                    ThemeFontIndex =-1
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =5329
                    Top =165
                    Width =567
                    Height =405
                    FontSize =10
                    TabIndex =26
                    Name ="btnSoGehts"
                    Caption ="so geht's"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00ddddddddddddddddddddddddddddddddddddddd000dddddd ,
                        0xdddddd0bb00ddddddddddd0bb00dddddddddddd00ddddddddddddd0b00dddddd ,
                        0xdddddd0b00dddddddddddd0b00dddddddddddd0bb00ddddddddd00d0bb00dddd ,
                        0xddd0b00d0bb00dddddd0b00dd0b00dddddd0bb000bb00ddddddd0bbbbb00dddd ,
                        0xddddd000000ddddd000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Tag ="10 20 30"
                    ControlTipText ="so geht's....."

                    LayoutCachedLeft =5329
                    LayoutCachedTop =165
                    LayoutCachedWidth =5896
                    LayoutCachedHeight =570
                    ThemeFontIndex =-1
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmAdresseCheck.cls"
