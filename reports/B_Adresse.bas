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
    Width =15996
    DatasheetFontHeight =10
    ItemSuffix =32
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x076133ce9c18e540
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
        Begin BreakLevel
            GroupHeader = NotDefault
            ControlSource ="Sort"
        End
        Begin BreakLevel
            ControlSource ="p1"
        End
        Begin BreakLevel
            ControlSource ="p2"
        End
        Begin PageHeader
            Height =453
            Name ="Seitenkopf"
            Begin
                Begin Label
                    TextFontFamily =34
                    Left =566
                    Top =57
                    Width =570
                    Height =240
                    FontSize =8
                    Name ="Name Bezeichnungsfeld"
                    Caption ="Name"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Name_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =2493
                    Top =56
                    Width =1095
                    Height =240
                    FontSize =8
                    Name ="Orte Bezeichnungsfeld"
                    Caption ="Ort /Strasse"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Orte_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =4647
                    Top =56
                    Width =855
                    Height =240
                    FontSize =8
                    Name ="Funktionen Bezeichnungsfeld"
                    Caption ="Funktion"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Funktionen_Bezeichnungsfeld"
                End
                Begin Label
                    TextFontFamily =34
                    Left =6075
                    Top =60
                    Width =1245
                    Height =240
                    FontSize =8
                    Name ="Telefon Bezeichnungsfeld"
                    Caption ="Telefon / Handy"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Telefon_Bezeichnungsfeld"
                End
                Begin Line
                    BorderWidth =2
                    Top =372
                    Width =15936
                    Name ="Linie13"
                End
                Begin TextBox
                    FontItalic = NotDefault
                    TextAlign =1
                    Left =1189
                    Top =56
                    Width =1080
                    FontWeight =700
                    ForeColor =8388608
                    Name ="Sortierung"
                    ControlSource ="=left([p1],1)"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"

                End
                Begin TextBox
                    FontItalic = NotDefault
                    TextAlign =3
                    TextFontFamily =18
                    Left =15418
                    Top =56
                    Width =495
                    TabIndex =1
                    ForeColor =8388608
                    Name ="Text6"
                    ControlSource ="=Date()"
                    Format ="mm/yy"
                    FontName ="Times New Roman"

                End
                Begin Label
                    TextFontFamily =34
                    Left =9127
                    Top =57
                    Width =570
                    Height =240
                    FontSize =8
                    Name ="Bezeichnungsfeld20"
                    Caption ="Name"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Left =11054
                    Top =56
                    Width =1095
                    Height =240
                    FontSize =8
                    Name ="Bezeichnungsfeld21"
                    Caption ="Ort /Strasse"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Left =13208
                    Top =56
                    Width =855
                    Height =240
                    FontSize =8
                    Name ="Bezeichnungsfeld22"
                    Caption ="Funktion"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                End
                Begin Label
                    TextFontFamily =34
                    Left =14173
                    Top =56
                    Width =1215
                    Height =240
                    FontSize =8
                    Name ="Bezeichnungsfeld23"
                    Caption ="Telefon / Handy"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"
                End
                Begin TextBox
                    FontItalic = NotDefault
                    TextAlign =1
                    TextFontFamily =18
                    Left =7426
                    Top =56
                    Width =840
                    TabIndex =2
                    ForeColor =8388608
                    Name ="Text25"
                    ControlSource ="=Date()"
                    Format ="mm/yy"
                    FontName ="Times New Roman"

                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =113
            Name ="Gruppenkopf0"
            Begin
                Begin Line
                    BorderWidth =2
                    Width =15936
                    Name ="Linie18"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =195
            Name ="Det"
            AlternateBackColor =-2147483648
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    FontItalic = NotDefault
                    RunningSum =2
                    TextAlign =1
                    Left =226
                    Width =345
                    Height =195
                    FontSize =6
                    FontWeight =700
                    ForeColor =8388608
                    Name ="lfdNummer"
                    ControlSource ="=1"
                    FontName ="Arial Narrow"
                    Tag ="DetachedLabel"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =6700
                    Height =195
                    FontSize =7
                    TabIndex =1
                    BorderColor =255
                    Name ="TelefonNr"
                    ControlSource ="TelefonNr"
                    StatusBarText ="Telefon"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =566
                    Width =2268
                    Height =195
                    FontSize =7
                    TabIndex =2
                    Name ="p1"
                    ControlSource ="p1"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =2839
                    Width =2160
                    Height =195
                    FontSize =7
                    TabIndex =3
                    Name ="p2"
                    ControlSource ="p2"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    CanGrow = NotDefault
                    Left =4999
                    Height =195
                    FontSize =7
                    TabIndex =4
                    Name ="FA"
                    ControlSource ="FA"
                    FontName ="Arial Narrow"

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
' See "B_Adresse.cls"
