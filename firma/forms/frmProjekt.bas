Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =22434
    RowHeight =225
    ItemSuffix =103
    Left =29430
    Top =3030
    Right =-8191
    Bottom =14895
    TimerInterval =600000
    OnUnload ="[Event Procedure]"
    Tag ="Projekt"
    RecSrcDt = Begin
        0x4b49d529ad1be540
    End
    Caption ="Projektmappen"
    OnCurrent ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnTimer ="[Event Procedure]"
    OnActivate ="[Event Procedure]"
    OnDblClick ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FetchDefaults =0
    FilterOnLoad =0
    FetchDefaults =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            BackColor =-2147483633
            ForeColor =-2147483630
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin CheckBox
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
        Begin BoundObjectFrame
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            FELineBreak = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
            AsianLineBreak =255
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            BackColor =-2147483643
            ForeColor =-2147483640
        End
        Begin Subform
            SpecialEffect =2
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
        Begin ToggleButton
            Width =283
            Height =283
            FontSize =8
            FontWeight =400
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin Tab
            BackStyle =0
            Width =5103
            Height =3402
            BorderLineStyle =0
        End
        Begin FormHeader
            Height =2523
            BackColor =-2147483633
            Name ="fh"
            Begin
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =570
                    Top =135
                    Width =3402
                    Height =1691
                    ColumnOrder =2
                    FontWeight =700
                    BackColor =10092543
                    ForeColor =0
                    Name ="lstProjektAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="10"
                    FontName ="Arial"
                    ControlTipText ="Funktionen mit der Projektliste"

                    LayoutCachedLeft =570
                    LayoutCachedTop =135
                    LayoutCachedWidth =3972
                    LayoutCachedHeight =1826
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =573
                    Top =1860
                    Width =3402
                    Height =255
                    ColumnOrder =1
                    FontWeight =600
                    TabIndex =1
                    BackColor =10092543
                    ForeColor =4210816
                    Name ="txtFind"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Tahoma"
                    ControlTipText ="Suchbegriff über alle Felder oder Teile davon\015\012Doppelclick löscht Eintrag\015"
                        "\012ID, Projekt-Nummer, Titel, Jahr, Firma, Status, Info, Wer\015\012In mehr als"
                        " 1 Feld suchen: Suchtext mit * trennen"

                    LayoutCachedLeft =573
                    LayoutCachedTop =1860
                    LayoutCachedWidth =3975
                    LayoutCachedHeight =2115
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    BorderWidth =1
                    IMESentenceMode =3
                    ColumnCount =5
                    Left =5103
                    Top =62
                    Width =17298
                    Height =2136
                    ColumnOrder =0
                    TabIndex =2
                    BackColor =-2147483633
                    ForeColor =0
                    Name ="lstExplorer"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;1134;1701"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Liste der Dokumente, die dem Vorgang zugeordnet sind.\015\012Diese Dokumente sin"
                        "d in unserem DATEV DMS gespeichert\015\012Doppelclick zeigt das Dokument an"

                    LayoutCachedLeft =5103
                    LayoutCachedTop =62
                    LayoutCachedWidth =22401
                    LayoutCachedHeight =2198
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =2
                    Left =20166
                    Top =2268
                    Width =1134
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld92"
                    Caption ="ID"
                    FontName ="Arial"
                    LayoutCachedLeft =20166
                    LayoutCachedTop =2268
                    LayoutCachedWidth =21300
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =2
                    Left =3970
                    Top =2268
                    Width =1134
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld93"
                    Caption ="Projekt-Nr"
                    FontName ="Arial"
                    LayoutCachedLeft =3970
                    LayoutCachedTop =2268
                    LayoutCachedWidth =5104
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =2
                    Left =5104
                    Top =2268
                    Width =3402
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld94"
                    Caption ="Firma"
                    FontName ="Arial"
                    LayoutCachedLeft =5104
                    LayoutCachedTop =2268
                    LayoutCachedWidth =8506
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =2
                    Left =8506
                    Top =2268
                    Width =4005
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld95"
                    Caption ="Titel"
                    FontName ="Arial"
                    LayoutCachedLeft =8506
                    LayoutCachedTop =2268
                    LayoutCachedWidth =12511
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =2
                    Left =12511
                    Top =2268
                    Width =1418
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld96"
                    Caption ="Datum"
                    FontName ="Arial"
                    LayoutCachedLeft =12511
                    LayoutCachedTop =2268
                    LayoutCachedWidth =13929
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =2
                    Left =1702
                    Top =2268
                    Width =2268
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld97"
                    Caption ="Vorgangs-Art"
                    FontName ="Arial"
                    LayoutCachedLeft =1702
                    LayoutCachedTop =2268
                    LayoutCachedWidth =3970
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =2
                    Left =284
                    Top =2268
                    Width =1418
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld98"
                    Caption ="Status"
                    FontName ="Arial"
                    LayoutCachedLeft =284
                    LayoutCachedTop =2268
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =2
                    Left =13929
                    Top =2268
                    Width =6237
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld99"
                    Caption ="Info"
                    FontName ="Arial"
                    LayoutCachedLeft =13929
                    LayoutCachedTop =2268
                    LayoutCachedWidth =20166
                    LayoutCachedHeight =2523
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =2
                    Left =21300
                    Top =2268
                    Width =1134
                    Height =255
                    BackColor =12632256
                    ForeColor =0
                    Name ="Bezeichnungsfeld100"
                    Caption ="Wer"
                    FontName ="Arial"
                    LayoutCachedLeft =21300
                    LayoutCachedTop =2268
                    LayoutCachedWidth =22434
                    LayoutCachedHeight =2523
                End
            End
        End
        Begin Section
            Height =255
            BackColor =-2147483633
            Name ="Det"
            AlternateBackColor =15658734
            Begin
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Left =3970
                    Width =1134
                    Height =255
                    ColumnWidth =2268
                    FontWeight =700
                    TabIndex =3
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="ProjektNr"
                    ControlSource ="ProjektNr"
                    Format ="Standard"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Projekt-Nr.\015\012Doppel-Klick zeigt alle Vorgänge dieses Projektes"
                    ConditionalFormat = Begin
                        0x0100000080000000020000000100000000000000000000000700000001010000 ,
                        0x00000000a7da4e000100000000000000080000000f00000001000000ffffff00 ,
                        0xffffff0000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d003000000000005b004f0042005d003d00310000000000
                    End

                    LayoutCachedLeft =3970
                    LayoutCachedWidth =5104
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000200000001000000000000000101000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d00300000000000000000000000000000000000000000000001 ,
                        0x0000000000000001000000ffffff00ffffff00060000005b004f0042005d003d ,
                        0x003100000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8506
                    Width =4005
                    Height =255
                    ColumnWidth =1134
                    TabIndex =5
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="Titel"
                    ControlSource ="Titel"
                    Format ="Standard"
                    FontName ="Arial"
                    Tag ="m3"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001010000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =8506
                    LayoutCachedWidth =12511
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    ColumnHidden = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =20166
                    Width =1134
                    Height =255
                    ColumnWidth =0
                    TabIndex =9
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="ID"
                    ControlSource ="ID"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ID Vorgang\015\012Doppelclick zeigt den Vorgang an"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001010000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =20166
                    LayoutCachedWidth =21300
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5104
                    Width =3402
                    Height =255
                    ColumnWidth =1134
                    TabIndex =4
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="Firma"
                    ControlSource ="Firma"
                    Format ="Standard"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Firma\015\012Doppelclick filtert alle Daten dieser Firma"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =5104
                    LayoutCachedWidth =8506
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1702
                    Width =2268
                    Height =255
                    ColumnWidth =1134
                    TabIndex =2
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="NrQKTxt"
                    ControlSource ="NrQKTxt"
                    Format ="Standard"
                    FontName ="Arial"
                    ControlTipText ="Vorgangsart (Nummer)"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =1702
                    LayoutCachedWidth =3970
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =21300
                    Width =1134
                    Height =255
                    TabIndex =8
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="wer"
                    ControlSource ="wer"
                    Format ="Standard"
                    FontName ="Arial"
                    Tag ="m2"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =21300
                    LayoutCachedWidth =22434
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =13929
                    Width =6237
                    Height =255
                    TabIndex =7
                    LeftMargin =57
                    ForeColor =0
                    Name ="Info"
                    ControlSource ="Info"
                    Format ="Standard"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    Tag ="m2"
                    ControlTipText ="Interne Infos zum Vorgang; können hier mit einem Doppel-Klick editiert/geändert/"
                        "gelöscht werden"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =13929
                    LayoutCachedWidth =20166
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =2
                    IMESentenceMode =3
                    Left =12511
                    Width =1418
                    Height =255
                    TabIndex =6
                    LeftMargin =57
                    ForeColor =9605778
                    Name ="vgdat1"
                    ControlSource ="vgdat1"
                    Format ="Short Date"
                    FontName ="Arial"
                    ControlTipText ="Datum 1"
                    ConditionalFormat = Begin
                        0x0100000070000000010000000100000000000000000000000700000001000000 ,
                        0x00000000a7da4e00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =12511
                    LayoutCachedWidth =13929
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000a7da4e00060000005b00 ,
                        0x4f0042005d003d003000000000000000000000000000000000000000000000
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    SpecialEffect =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =284
                    Height =255
                    LeftMargin =57
                    BackColor =62207
                    ForeColor =9605778
                    Name ="ob"
                    ControlSource ="ob"
                    Format ="Standard"
                    FontName ="Arial"
                    Tag ="m2"
                    ConditionalFormat = Begin
                        0x01000000ee000000030000000100000000000000000000001600000001000000 ,
                        0xa7da4e00a7da4e000100000000000000170000002e00000001000000ed1c2400 ,
                        0xed1c240001000000000000002f0000004600000001000000fff20000fff20000 ,
                        0x5b00560047005300740061007400750073005d003d002700650072006c006500 ,
                        0x64006900670074002700000000005b0056004700530074006100740075007300 ,
                        0x5d003d00270049006e0020004100720062006500690074002700000000005b00 ,
                        0x560047005300740061007400750073005d003d00270076006500720073006500 ,
                        0x6e00640065007400270000000000
                    End

                    LayoutCachedWidth =284
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x010003000000010000000000000001000000a7da4e00a7da4e00150000005b00 ,
                        0x560047005300740061007400750073005d003d002700650072006c0065006400 ,
                        0x6900670074002700000000000000000000000000000000000000000000010000 ,
                        0x000000000001000000ed1c2400ed1c2400160000005b00560047005300740061 ,
                        0x007400750073005d003d00270049006e00200041007200620065006900740027 ,
                        0x0000000000000000000000000000000000000000000001000000000000000100 ,
                        0x0000fff20000fff20000160000005b0056004700530074006100740075007300 ,
                        0x5d003d002700760065007200730065006e006400650074002700000000000000 ,
                        0x000000000000000000000000000000
                    End
                End
                Begin TextBox
                    SpecialEffect =0
                    OverlapFlags =87
                    Left =284
                    Width =1418
                    Height =255
                    TabIndex =1
                    LeftMargin =57
                    BackColor =16777215
                    ForeColor =0
                    Name ="VGStatus"
                    ControlSource ="VGStatus"
                    OnDblClick ="[Event Procedure]"
                    DefaultValue ="\"in Arbeit\""
                    FontName ="Arial"
                    ControlTipText ="Status des Vorganges\015\012Mit Doppelclick kann man Umschalten auf den nächsten"
                        " Status"
                    ConditionalFormat = Begin
                        0x010000009a000000030000000000000002000000000000000b00000001000000 ,
                        0x00000000fff2000000000000020000000c000000140000000100000000000000 ,
                        0xed1c24000100000000000000150000001c0000000100000000000000a7da4e00 ,
                        0x220067006500730065006e006400650074002200000000002200660065006800 ,
                        0x6c0074002200000000005b004f0042005d003d00300000000000
                    End

                    LayoutCachedLeft =284
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x01000300000000000000020000000100000000000000fff200000a0000002200 ,
                        0x67006500730065006e0064006500740022000000000000000000000000000000 ,
                        0x0000000000000000000000020000000100000000000000ed1c24000700000022 ,
                        0x006600650068006c007400220000000000000000000000000000000000000000 ,
                        0x000001000000000000000100000000000000a7da4e00060000005b004f004200 ,
                        0x5d003d003000000000000000000000000000000000000000000000
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =-2147483633
            Name ="ff"
        End
    End
End
CodeBehindForm
' See "frmProjekt.cls"
