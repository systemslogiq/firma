Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ViewsAllowed =1
    TabularFamily =18
    BorderStyle =3
    GridX =20
    GridY =20
    Width =10866
    RowHeight =480
    DatasheetFontHeight =10
    ItemSuffix =29
    Left =3855
    Top =3030
    Right =28545
    Bottom =15015
    Tag ="Land"
    ShortcutMenuBar ="tlbOHrightMouse"
    RecSrcDt = Begin
        0x1c2804624b74e640
    End
    Caption ="Land / Kurs"
    BeforeUpdate ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
    OrderByOnLoad =0
    Begin
        Begin Label
            BackStyle =0
            FontName ="Tahoma"
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
        Begin CommandButton
            TextFontFamily =2
            Width =1701
            Height =283
            BorderLineStyle =0
        End
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            BorderLineStyle =0
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
            TextFontFamily =18
            BorderLineStyle =0
            Width =1473
            Height =480
            LabelX =-793
            FontSize =20
            FontName ="times New Roman"
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
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin ToggleButton
            TextFontFamily =2
            Width =283
            Height =283
            BorderLineStyle =0
        End
        Begin FormHeader
            Height =1303
            BackColor =12632256
            Name ="fh"
            Begin
                Begin Label
                    OverlapFlags =85
                    Top =988
                    Width =285
                    Height =255
                    Name ="Bezeichnungsfeld6"
                    Caption ="DB"
                    FontName ="Arial"
                    LayoutCachedTop =988
                    LayoutCachedWidth =285
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =401
                    Top =988
                    Width =633
                    Height =255
                    Name ="lblKZ"
                    Caption ="KZ<>"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    LayoutCachedLeft =401
                    LayoutCachedTop =988
                    LayoutCachedWidth =1034
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =1090
                    Top =988
                    Width =2418
                    Height =255
                    Name ="lblName"
                    Caption ="Name<>"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    LayoutCachedLeft =1090
                    LayoutCachedTop =988
                    LayoutCachedWidth =3508
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =3645
                    Top =988
                    Width =735
                    Height =255
                    Name ="lblWährung"
                    Caption ="Währung<>"
                    FontName ="Arial"
                    LayoutCachedLeft =3645
                    LayoutCachedTop =988
                    LayoutCachedWidth =4380
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =93
                    Left =4484
                    Top =988
                    Width =420
                    Height =255
                    Name ="Bezeichnungsfeld10"
                    Caption ="Kurs"
                    FontName ="Arial"
                    LayoutCachedLeft =4484
                    LayoutCachedTop =988
                    LayoutCachedWidth =4904
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =5517
                    Top =988
                    Width =495
                    Height =255
                    Name ="Bezeichnungsfeld12"
                    Caption ="MWSt"
                    FontName ="Arial"
                    LayoutCachedLeft =5517
                    LayoutCachedTop =988
                    LayoutCachedWidth =6012
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =7058
                    Top =988
                    Width =1134
                    Height =255
                    Name ="Bezeichnungsfeld13"
                    Caption ="Sprache"
                    FontName ="Arial"
                    LayoutCachedLeft =7058
                    LayoutCachedTop =988
                    LayoutCachedWidth =8192
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =9722
                    Top =988
                    Width =480
                    Height =255
                    Name ="Bezeichnungsfeld14"
                    Caption ="EG"
                    FontName ="Arial"
                    LayoutCachedLeft =9722
                    LayoutCachedTop =988
                    LayoutCachedWidth =10202
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =8294
                    Top =823
                    Width =794
                    Height =420
                    Name ="Bezeichnungsfeld17"
                    Caption ="Tel. Vorwahl"
                    FontName ="Arial"
                    LayoutCachedLeft =8294
                    LayoutCachedTop =823
                    LayoutCachedWidth =9088
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =9128
                    Top =988
                    Width =450
                    Height =255
                    Name ="Bezeichnungsfeld19"
                    Caption ="Code"
                    FontName ="Arial"
                    LayoutCachedLeft =9128
                    LayoutCachedTop =988
                    LayoutCachedWidth =9578
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =215
                    Left =4873
                    Top =793
                    Width =555
                    Height =450
                    Name ="Bezeichnungsfeld21"
                    Caption ="Tages-Kurs"
                    FontName ="Arial"
                    LayoutCachedLeft =4873
                    LayoutCachedTop =793
                    LayoutCachedWidth =5428
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =6297
                    Top =988
                    Width =660
                    Height =255
                    Name ="Bezeichnungsfeld23"
                    Caption ="MWSt 1"
                    FontName ="Arial"
                    LayoutCachedLeft =6297
                    LayoutCachedTop =988
                    LayoutCachedWidth =6957
                    LayoutCachedHeight =1243
                End
                Begin Label
                    OverlapFlags =85
                    Left =10261
                    Top =796
                    Width =570
                    Height =450
                    Name ="lblISO3Code"
                    Caption ="ISO 3 Code"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    LayoutCachedLeft =10261
                    LayoutCachedTop =796
                    LayoutCachedWidth =10831
                    LayoutCachedHeight =1246
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1587
                    Height =885
                    FontSize =9
                    BackColor =10092543
                    Name ="lstLAndOB"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =1587
                    LayoutCachedWidth =3288
                    LayoutCachedHeight =885
                    BackThemeColorIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =368
                            Top =141
                            Width =1170
                            Height =240
                            Name ="Bezeichnungsfeld28"
                            Caption ="sortieren nach:"
                            LayoutCachedLeft =368
                            LayoutCachedTop =141
                            LayoutCachedWidth =1538
                            LayoutCachedHeight =381
                        End
                    End
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =268
            BackColor =12632256
            Name ="Det"
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =401
                    Width =633
                    Height =255
                    FontSize =8
                    Name ="LandKZ"
                    ControlSource ="LandKZ"
                    FontName ="Arial"
                    ControlTipText ="Kurzzeichen"

                    LayoutCachedLeft =401
                    LayoutCachedWidth =1034
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =1090
                    Width =2418
                    Height =255
                    FontSize =8
                    TabIndex =1
                    Name ="Land"
                    ControlSource ="Land"
                    FontName ="Arial"
                    ControlTipText ="Land"

                    LayoutCachedLeft =1090
                    LayoutCachedWidth =3508
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4436
                    Width =468
                    Height =255
                    ColumnWidth =1005
                    FontSize =8
                    TabIndex =3
                    Name ="Kurs"
                    ControlSource ="Kurs"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Kurs"

                    LayoutCachedLeft =4436
                    LayoutCachedWidth =4904
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =5484
                    Width =663
                    Height =255
                    FontSize =8
                    TabIndex =5
                    Name ="LandMWSt"
                    ControlSource ="LandMWSt"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="MWST"

                    LayoutCachedLeft =5484
                    LayoutCachedWidth =6147
                    LayoutCachedHeight =255
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =85
                    Top =28
                    ColumnWidth =585
                    TabIndex =10
                    Name ="DBLand"
                    ControlSource ="DBLand"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    ControlTipText ="Bitte NUR EIN Land ankreuzen: Land ist Vorgabewert für Datenbank"

                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =9828
                    Top =28
                    Width =455
                    TabIndex =11
                    Name ="EG"
                    ControlSource ="EG"
                    ControlTipText ="in EG ??"

                    LayoutCachedLeft =9828
                    LayoutCachedTop =28
                    LayoutCachedWidth =10283
                    LayoutCachedHeight =268
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =3672
                    Width =708
                    Height =255
                    TabIndex =2
                    Name ="Währung"
                    ControlSource ="Währung"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    ControlTipText ="Währung"

                    LayoutCachedLeft =3672
                    LayoutCachedWidth =4380
                    LayoutCachedHeight =255
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListRows =30
                    Left =7099
                    Width =1134
                    Height =255
                    TabIndex =7
                    Name ="Sprache"
                    ControlSource ="Sprache"
                    RowSourceType ="Table/Query"
                    FontName ="Arial"
                    ControlTipText ="Sprache"

                    LayoutCachedLeft =7099
                    LayoutCachedWidth =8233
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =9139
                    Width =633
                    Height =255
                    FontSize =8
                    TabIndex =9
                    Name ="Code"
                    ControlSource ="Code"
                    FontName ="Arial"
                    ControlTipText ="Kurzzeichen"

                    LayoutCachedLeft =9139
                    LayoutCachedWidth =9772
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4960
                    Width =468
                    Height =255
                    FontSize =8
                    TabIndex =4
                    Name ="TagesKurs"
                    ControlSource ="TagesKurs"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Tages-Kurs\015\012Wird nur benutzt für den Umrechnungsfaktor (= Kurs) bei Vorgän"
                        "geNICHT verwendet z.B. für Berechnung von Artikel-Preisen"

                    LayoutCachedLeft =4960
                    LayoutCachedWidth =5428
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =8289
                    Width =794
                    Height =255
                    FontSize =8
                    TabIndex =8
                    Name ="VorwahlTelefon"
                    ControlSource ="VorwahlTelefon"
                    FontName ="Arial"
                    ControlTipText ="Sprache"

                    LayoutCachedLeft =8289
                    LayoutCachedWidth =9083
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =6264
                    Width =663
                    Height =255
                    FontSize =8
                    TabIndex =6
                    Name ="LandMWSt1"
                    ControlSource ="LandMWSt1"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="MWSt1"

                    LayoutCachedLeft =6264
                    LayoutCachedWidth =6927
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    OverlapFlags =247
                    TextFontFamily =34
                    Left =10233
                    Width =633
                    Height =255
                    FontSize =8
                    TabIndex =12
                    Name ="Iso3Code"
                    ControlSource ="Iso3Code"
                    FontName ="Arial"
                    ControlTipText ="Kurzzeichen"

                    LayoutCachedLeft =10233
                    LayoutCachedWidth =10866
                    LayoutCachedHeight =255
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =12632256
            Name ="ff"
        End
    End
End
CodeBehindForm
' See "PF_Land.cls"
