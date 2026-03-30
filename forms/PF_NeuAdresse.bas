Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =18
    BorderStyle =3
    GridX =20
    GridY =20
    Width =9513
    DatasheetFontHeight =12
    ItemSuffix =213
    Left =-7936
    Top =3030
    Right =20609
    Bottom =15225
    RecSrcDt = Begin
        0x04dccbb63ac9e140
    End
    Caption ="NEUE ADRESSE erfassen Firma + Mitarbeiter"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    AllowDatasheetView =0
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            BackStyle =0
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
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            Width =4305
            Height =264
            LabelX =-793
            FontSize =10
            BackColor =12632256
            FontName ="Times New Roman"
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
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
        Begin UnboundObjectFrame
            SpecialEffect =2
            OldBorderStyle =1
            Width =4536
            Height =2835
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin Section
            CanGrow = NotDefault
            Height =2849
            BackColor =12632256
            Name ="Det"
            Begin
                Begin ComboBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    TextAlign =1
                    ListRows =20
                    ListWidth =1134
                    Left =285
                    Top =885
                    Width =1134
                    Height =255
                    ConditionalFormat = Begin
                        0x0100000080000000020000000000000002000000000000000700000001000000 ,
                        0x00000000d6dfec000000000002000000080000000f0000000100000000000000 ,
                        0xefd3d20000000000000000000000000000000000000000000000000000000000 ,
                        0x2200480065007200720022000000000022004600720061007500220000000000
                    End
                    Name ="ArtAdresse"
                    RowSourceType ="Table/Query"
                    StatusBarText ="Anrede"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Herr\""
                    FontName ="Arial"
                    ControlTipText ="Anrede (Firma, Herr oder Frau)"

                    LayoutCachedLeft =285
                    LayoutCachedTop =885
                    LayoutCachedWidth =1419
                    LayoutCachedHeight =1140
                    ConditionalFormat14 = Begin
                        0x01000200000000000000020000000100000000000000d6dfec00060000002200 ,
                        0x4800650072007200220000000000000000000000000000000000000000000000 ,
                        0x000000020000000100000000000000efd3d20006000000220046007200610075 ,
                        0x002200000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =95
                    TextFontFamily =34
                    Left =1419
                    Top =892
                    Width =4820
                    Height =255
                    FontSize =8
                    TabIndex =1
                    BackColor =16777215
                    Name ="Nachname"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Namen eintragen\015\012Doppel-Klick entfernt den Eintrag"

                    LayoutCachedLeft =1419
                    LayoutCachedTop =892
                    LayoutCachedWidth =6239
                    LayoutCachedHeight =1147
                End
                Begin CommandButton
                    OverlapFlags =93
                    Left =284
                    Top =2097
                    Width =4536
                    Height =340
                    FontWeight =700
                    TabIndex =5
                    ForeColor =32768
                    Name ="btnOk"
                    Caption ="ok"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ok, Daten übernehmen"

                    LayoutCachedLeft =284
                    LayoutCachedTop =2097
                    LayoutCachedWidth =4820
                    LayoutCachedHeight =2437
                    Overlaps =1
                End
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =87
                    Left =4820
                    Top =2097
                    Width =1418
                    Height =340
                    TabIndex =6
                    ForeColor =0
                    Name ="btnEscape"
                    Caption ="abbrechen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="abbrechen"

                    LayoutCachedLeft =4820
                    LayoutCachedTop =2097
                    LayoutCachedWidth =6238
                    LayoutCachedHeight =2437
                    Overlaps =1
                End
                Begin TextBox
                    Visible = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextFontFamily =34
                    Left =4821
                    Top =892
                    Width =1418
                    Height =255
                    FontSize =8
                    TabIndex =2
                    BackColor =16777215
                    Name ="Vorname"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Vornamen eintragen\015\012Doppel-Klick entfernt den Eintrag"

                    LayoutCachedLeft =4821
                    LayoutCachedTop =892
                    LayoutCachedWidth =6239
                    LayoutCachedHeight =1147
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =7140
                    Top =120
                    Width =2373
                    Height =2729
                    FontWeight =700
                    TabIndex =7
                    BackColor =12975858
                    Name ="lstActNeu"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="39"
                    FontName ="Arial"
                    ShortcutMenuBar ="cbEmpty"
                    ControlTipText ="Bestimmen Sie welche Adressen Sie neur erfassen wollen"

                    LayoutCachedLeft =7140
                    LayoutCachedTop =120
                    LayoutCachedWidth =9513
                    LayoutCachedHeight =2849
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =6522
                    Top =892
                    Width =576
                    Height =255
                    TabIndex =8
                    Name ="btnSuch"
                    Caption ="Suche adresse"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddd00000ddddd00000d ,
                        0x0f000ddddd0f000d0f000ddddd0f000d0000000d0000000d00f000000f00000d ,
                        0x00f000d00f00000d00f000d00f00000dd0000000000000dddd0f000d0f000ddd ,
                        0xdd00000d00000dddddd000ddd000ddddddd0f0ddd0f0ddddddd000ddd000dddd ,
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
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="bestehende Adresse suchen und zuordnen"

                    LayoutCachedLeft =6522
                    LayoutCachedTop =892
                    LayoutCachedWidth =7098
                    LayoutCachedHeight =1147
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =93
                    TextFontFamily =34
                    Left =1419
                    Top =1267
                    Width =3118
                    Height =255
                    FontSize =8
                    TabIndex =3
                    BackColor =16777215
                    Name ="Nachname1"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="1"
                    ControlTipText ="Namen eintragen\015\012Doppel-Klick entfernt den Eintrag"

                    LayoutCachedLeft =1419
                    LayoutCachedTop =1267
                    LayoutCachedWidth =4537
                    LayoutCachedHeight =1522
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =4821
                    Top =1267
                    Width =1418
                    Height =255
                    FontSize =8
                    TabIndex =4
                    BackColor =16777215
                    Name ="vorname1"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnClick ="[Event Procedure]"
                    Tag ="1"
                    ControlTipText ="Vornamen eintragen\015\012Doppel-Klick entfernt den Eintrag"

                    LayoutCachedLeft =4821
                    LayoutCachedTop =1267
                    LayoutCachedWidth =6239
                    LayoutCachedHeight =1522
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =6522
                    Top =1267
                    Width =576
                    Height =255
                    TabIndex =9
                    Name ="btnSuch1"
                    Caption ="Suche Adresse"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddd00000ddddd00000d ,
                        0x0f000ddddd0f000d0f000ddddd0f000d0000000d0000000d00f000000f00000d ,
                        0x00f000d00f00000d00f000d00f00000dd0000000000000dddd0f000d0f000ddd ,
                        0xdd00000d00000dddddd000ddd000ddddddd0f0ddd0f0ddddddd000ddd000dddd ,
                        0xdddddddddddddddd
                    End
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Tag ="1"
                    ControlTipText ="bestehende Adresse suchen und zuordnen"

                    LayoutCachedLeft =6522
                    LayoutCachedTop =1267
                    LayoutCachedWidth =7098
                    LayoutCachedHeight =1522
                End
                Begin Label
                    OverlapFlags =85
                    Left =284
                    Top =226
                    Width =6510
                    Height =240
                    FontWeight =700
                    BackColor =5066944
                    Name ="lblCheck"
                    Caption ="Sie haben überprüft, dass die Adresse(n) nicht schon vorhanden sind??!!??"
                    LayoutCachedLeft =284
                    LayoutCachedTop =226
                    LayoutCachedWidth =6794
                    LayoutCachedHeight =466
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =283
                    Top =2494
                    Width =1170
                    Height =285
                    TabIndex =10
                    Name ="NrFunktion"
                    ControlTipText ="Id der 1. Adresse"

                    LayoutCachedLeft =283
                    LayoutCachedTop =2494
                    LayoutCachedWidth =1453
                    LayoutCachedHeight =2779
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1530
                    Top =2494
                    Width =1170
                    Height =285
                    TabIndex =11
                    Name ="NrFunktion1"
                    ControlTipText ="Id der 2. Adresse"

                    LayoutCachedLeft =1530
                    LayoutCachedTop =2494
                    LayoutCachedWidth =2700
                    LayoutCachedHeight =2779
                End
                Begin ComboBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =87
                    TextAlign =1
                    ListRows =20
                    ListWidth =1134
                    Left =285
                    Top =1260
                    Width =1134
                    Height =255
                    TabIndex =12
                    ConditionalFormat = Begin
                        0x0100000080000000020000000000000002000000000000000700000001000000 ,
                        0x00000000d6dfec000000000002000000080000000f0000000100000000000000 ,
                        0xefd3d20000000000000000000000000000000000000000000000000000000000 ,
                        0x2200480065007200720022000000000022004600720061007500220000000000
                    End
                    Name ="ArtAdresse1"
                    RowSourceType ="Table/Query"
                    StatusBarText ="Anrede"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="\"Herr\""
                    FontName ="Arial"
                    Tag ="1"
                    ControlTipText ="Anrede (Firma, Herr oder Frau)"

                    LayoutCachedLeft =285
                    LayoutCachedTop =1260
                    LayoutCachedWidth =1419
                    LayoutCachedHeight =1515
                    ConditionalFormat14 = Begin
                        0x01000200000000000000020000000100000000000000d6dfec00060000002200 ,
                        0x4800650072007200220000000000000000000000000000000000000000000000 ,
                        0x000000020000000100000000000000efd3d20006000000220046007200610075 ,
                        0x002200000000000000000000000000000000000000000000
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_NeuAdresse.cls"
