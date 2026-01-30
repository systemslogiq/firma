Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ViewsAllowed =1
    RecordLocks =2
    TabularFamily =18
    BorderStyle =3
    GridX =20
    GridY =20
    Width =11058
    RowHeight =480
    DatasheetFontHeight =10
    ItemSuffix =32
    Left =29430
    Top =3030
    Right =-8191
    Bottom =14895
    AfterDelConfirm ="[Event Procedure]"
    Tag ="Land"
    ShortcutMenuBar ="tlbOHrightMouse"
    OrderBy ="[PF_Rabatt].[WarenGruppe], [PF_Rabatt].[Mindestmenge]"
    RecSrcDt = Begin
        0x6ade714a8f66e640
    End
    RecordSource ="SELECT * FROM vwWarengruppeRabatt ORDER BY Kunde, Warengruppe, mindestmenge; "
    Caption ="unsere Rabatt-Matrix pro Kunde"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
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
            Height =1958
            BackColor =12632256
            Name ="fh"
            Begin
                Begin Label
                    OverlapFlags =93
                    Top =1418
                    Width =3402
                    Height =540
                    Name ="Bezeichnungsfeld8"
                    Caption ="Kunde"
                    FontName ="Arial"
                    LayoutCachedTop =1418
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =1958
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =2
                    Left =4820
                    Top =1418
                    Width =851
                    Height =540
                    Name ="Bezeichnungsfeld25"
                    Caption ="Mindest-Menge"
                    FontName ="Arial"
                    LayoutCachedLeft =4820
                    LayoutCachedTop =1418
                    LayoutCachedWidth =5671
                    LayoutCachedHeight =1958
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =2
                    Left =5671
                    Top =1418
                    Width =851
                    Height =540
                    Name ="Bezeichnungsfeld27"
                    Caption ="Rabatt in %"
                    FontName ="Arial"
                    LayoutCachedLeft =5671
                    LayoutCachedTop =1418
                    LayoutCachedWidth =6522
                    LayoutCachedHeight =1958
                End
                Begin Label
                    OverlapFlags =95
                    Left =6522
                    Top =1418
                    Width =4536
                    Height =540
                    Name ="Bezeichnungsfeld29"
                    Caption ="Bemerkungen"
                    FontName ="Arial"
                    LayoutCachedLeft =6522
                    LayoutCachedTop =1418
                    LayoutCachedWidth =11058
                    LayoutCachedHeight =1958
                End
                Begin ListBox
                    SpecialEffect =2
                    OverlapFlags =215
                    ColumnCount =2
                    Left =8223
                    Top =28
                    Width =2835
                    Height =1418
                    FontSize =8
                    BackColor =10092543
                    ForeColor =0
                    BorderColor =0
                    Name ="lstPF_RabattAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    FontName ="Arial"
                    GridlineColor =0
                    AllowValueListEdits =0
                    InheritValueList =0

                    LayoutCachedLeft =8223
                    LayoutCachedTop =28
                    LayoutCachedWidth =11058
                    LayoutCachedHeight =1446
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =-1
                    BorderShade =100.0
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =34
                    Left =311
                    Top =1105
                    Width =851
                    Height =255
                    FontSize =8
                    TabIndex =1
                    BackColor =62207
                    Name ="NrID"
                    ControlSource ="NrID"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Kurs"

                    LayoutCachedLeft =311
                    LayoutCachedTop =1105
                    LayoutCachedWidth =1162
                    LayoutCachedHeight =1360
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =87
                    TextAlign =2
                    TextFontFamily =34
                    BackStyle =0
                    IMESentenceMode =3
                    Left =3402
                    Top =1418
                    Width =1418
                    Height =540
                    FontSize =8
                    FontWeight =700
                    TabIndex =2
                    Name ="Rabattebene"
                    ControlSource ="Rabattebene"
                    FontName ="Arial"

                    LayoutCachedLeft =3402
                    LayoutCachedTop =1418
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =1958
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =255
            BackColor =12632256
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    TextFontFamily =34
                    Width =3402
                    Height =255
                    FontSize =8
                    Name ="Kunde"
                    ControlSource ="Kunde"
                    FontName ="Arial"
                    ControlTipText ="Land"

                    LayoutCachedWidth =3402
                    LayoutCachedHeight =255
                    BackThemeColorIndex =3
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    Left =3402
                    Width =1418
                    Height =255
                    FontSize =8
                    TabIndex =1
                    Name ="WarenGruppe"
                    ControlSource ="WarenGruppe"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Kurs"

                    LayoutCachedLeft =3402
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =255
                    BackThemeColorIndex =3
                End
                Begin TextBox
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    Left =4820
                    Width =851
                    Height =255
                    FontSize =8
                    TabIndex =2
                    Name ="Mindestmenge"
                    ControlSource ="Mindestmenge"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Kurs"

                    LayoutCachedLeft =4820
                    LayoutCachedWidth =5671
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    DecimalPlaces =1
                    OverlapFlags =95
                    TextAlign =2
                    TextFontFamily =34
                    Left =5671
                    Width =851
                    Height =255
                    FontSize =8
                    TabIndex =3
                    Name ="Rabatt"
                    ControlSource ="Rabatt"
                    Format ="Standard"
                    ValidationRule ="Is Null Or Between 0 And 100"
                    FontName ="Arial"
                    ControlTipText ="Kurs"

                    LayoutCachedLeft =5671
                    LayoutCachedWidth =6522
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =87
                    TextFontFamily =34
                    Left =6522
                    Width =4536
                    Height =255
                    FontSize =8
                    TabIndex =4
                    Name ="Bemerkungen"
                    ControlSource ="Bemerkungen"
                    FontName ="Arial"
                    ControlTipText ="Land"

                    LayoutCachedLeft =6522
                    LayoutCachedWidth =11058
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
' See "PF_Rabatt.cls"
