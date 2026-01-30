Version =20
VersionRequired =20
Begin Form
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =1
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6554
    DatasheetFontHeight =10
    ItemSuffix =12
    Left =13155
    Top =450
    Right =19590
    Bottom =5925
    BeforeDelConfirm ="[Event Procedure]"
    ShortcutMenuBar ="tlbOHrightMouse"
    RecSrcDt = Begin
        0x82d4b113f075e640
    End
    UniqueTable ="T_"
    OnCurrent ="[Event Procedure]"
    BeforeUpdate ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnDblClick ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    NavigationCaption ="Datensatz:"
    OrderByOnLoad =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            FontName ="Tahoma"
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="Tahoma"
            BorderLineStyle =0
        End
        Begin TextBox
            FELineBreak = NotDefault
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
            AsianLineBreak =255
        End
        Begin ComboBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Tahoma"
        End
        Begin FormHeader
            Height =0
            Name ="fh"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =255
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin ComboBox
                    SpecialEffect =0
                    OverlapFlags =93
                    ColumnCount =6
                    ListRows =30
                    ListWidth =6237
                    Left =2124
                    Width =3783
                    Height =255
                    TabIndex =3
                    Name ="txtV"
                    ControlSource ="txtV"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="5960;0;0;0;0;0"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Liste der im Lexikon hinterlegten Begriffe zur Gruppe <Begründung Maßnahmenentsc"
                        "heidung>"

                    LayoutCachedLeft =2124
                    LayoutCachedWidth =5907
                    LayoutCachedHeight =255
                End
                Begin ComboBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    ListRows =30
                    ListWidth =6237
                    Left =5907
                    Width =256
                    Height =255
                    TabIndex =2
                    Name ="comtxtv"
                    ControlSource ="txtV"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="5957"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Auswahl von Texten, die hier bereits schon mal eingetragen wurden"

                    LayoutCachedLeft =5907
                    LayoutCachedWidth =6163
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =795
                    Width =1329
                    Height =255
                    TabIndex =1
                    LeftMargin =57
                    BackColor =15921906
                    Name ="txt"
                    ControlSource ="txt"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial Narrow"
                    ControlTipText ="Doppelclick um Lexikon zu öffnen"

                    LayoutCachedLeft =795
                    LayoutCachedWidth =2124
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =279
                    Height =255
                    LeftMargin =57
                    Name ="TxtNr"
                    ControlSource ="TxtNr"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Hier Reihenfolge einstellen"

                    LayoutCachedWidth =279
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =3010
                    Width =576
                    Height =255
                    TabIndex =4
                    BackColor =10092543
                    Name ="f0"
                    ControlSource ="NrTxt"
                    FontName ="Arial"

                    LayoutCachedLeft =3010
                    LayoutCachedWidth =3586
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =3586
                    Width =576
                    Height =255
                    TabIndex =5
                    BackColor =10092543
                    Name ="f1"
                    ControlSource ="TxtNr"
                    FontName ="Arial"

                    LayoutCachedLeft =3586
                    LayoutCachedWidth =4162
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =4162
                    Width =576
                    Height =255
                    TabIndex =6
                    BackColor =10092543
                    Name ="f2"
                    ControlSource ="Txt"
                    FontName ="Arial"

                    LayoutCachedLeft =4162
                    LayoutCachedWidth =4738
                    LayoutCachedHeight =255
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =4738
                    Width =576
                    Height =255
                    TabIndex =7
                    BackColor =10092543
                    Name ="f3"
                    ControlSource ="txtV"
                    FontName ="Arial"

                    LayoutCachedLeft =4738
                    LayoutCachedWidth =5314
                    LayoutCachedHeight =255
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =87
                    TextAlign =1
                    ColumnCount =3
                    ListRows =30
                    ListWidth =4536
                    Left =285
                    Width =510
                    Height =255
                    TabIndex =8
                    BackColor =15263976
                    ConditionalFormat = Begin
                        0x0100000072000000030000000000000002000000000000000200000001000000 ,
                        0x0000000099cc0000000000000200000003000000050000000100000000000000 ,
                        0xffff0000000000000200000006000000080000000100000000000000ff000000 ,
                        0x320000000000330000000000340000000000
                    End
                    Name ="txtmarker"
                    ControlSource ="txtmarker"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;853;3402"
                    FontName ="Arial"
                    ControlTipText ="Layout beeinflussen"

                    LayoutCachedLeft =285
                    LayoutCachedWidth =795
                    LayoutCachedHeight =255
                    ConditionalFormat14 = Begin
                        0x0100030000000000000002000000010000000000000099cc0000010000003200 ,
                        0x0000000000000000000000000000000000000000000000000002000000010000 ,
                        0x0000000000ffff00000100000033000000000000000000000000000000000000 ,
                        0x0000000000000000020000000100000000000000ff0000000100000034000000 ,
                        0x00000000000000000000000000000000000000
                    End
                End
            End
        End
        Begin FormFooter
            Height =283
            BackColor =-2147483633
            Name ="ff"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin CommandButton
                    OverlapFlags =93
                    Width =1743
                    ForeColor =5026082
                    Name ="btnAdd"
                    Caption ="   Texte ergänzen"
                    OnClick ="[Event Procedure]"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000020182080000000ff ,
                        0x0000007000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000808080ff606060ff ,
                        0x000000ff00000000000000000000000000000000304830ff203020ff102010ff ,
                        0x101810ff000000000000000000000000000000000000000070707080807880ff ,
                        0x1010105000000000000000000000000000000000305030ff509050ff407840ff ,
                        0x101810ff00000000000000000000000000000000000000000000000010081070 ,
                        0x0000000000000000000000000000000000000000406040ff509850ff408040ff ,
                        0x101810ff000000000000000000000000000000000000000000000000202020ff ,
                        0x0000000000000000609860ff508860ff507850ff406840ff60a860ff509050ff ,
                        0x101810ff101810ff101810ff101810ff000000000000000000000070404040ff ,
                        0x000000700000000070a880ffa0d0a0ff90c890ff80c080ff70b070ff60a060ff ,
                        0x509050ff408040ff407840ff102010ff0000000000000000202820ff404040ff ,
                        0x000000f00000000080b090ffb0d8b0ffa0d8a0ff90c890ff80c080ff70b070ff ,
                        0x60a860ff509850ff509050ff203820ff0000000040404070606060ff505850ff ,
                        0x202020ff0000003080b890ff80b890ff80b080ff70a870ff80c890ff70b870ff ,
                        0x508050ff507850ff306030ff304830ff00000000404040c0707070ff606060ff ,
                        0x504850ff0000008000000000000000000000000080b080ff90d0a0ff80c080ff ,
                        0x609060ff00000000000000000000000000000000605860ff909890ff606060ff ,
                        0x505050ff000000f000000000000000000000000080b890ffa0d8b0ff90d0a0ff ,
                        0x70a070ff00000000000000000000000000000000707070ffa0a8a0ff707070ff ,
                        0x606060ff101010f000000000000000000000000090c090ff80b890ff80b080ff ,
                        0x70a070ff00000000000000000000000000000000807880ffc0b8c0ffb0b0b0ff ,
                        0x908890ff100810e0000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000070707030807880ff606860ff ,
                        0x505050ff50505020000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedWidth =1743
                    LayoutCachedHeight =283
                    PictureCaptionArrangement =5
                    HoverForeColor =5026082
                    PressedForeColor =5026082
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =93
                    Left =4420
                    Width =1588
                    TabIndex =1
                    ForeColor =2366701
                    Name ="btndelete"
                    Caption =" löschen..."
                    OnClick ="[Event Procedure]"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000020182080000000ff ,
                        0x0000007000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000808080ff606060ff ,
                        0x000000ff00000000000000000000000000000000000000000030ff501020e0ff ,
                        0x0028ff30000000000000000000000000000000000020f05070707080807880ff ,
                        0x10101050000000000000000000000000000000002048ff100028ffff1028f0ff ,
                        0x4050d0ff0000000000000000000000000020e0c00010b0ff0000000010081070 ,
                        0x0000000000000000000000000000000000000000000000002048fff01030ffff ,
                        0x0028ffff1038ff10000000000020ff800018c0ff0020f09000000000202020ff ,
                        0x0000000000000000000000000000000000000000000000004060ff203050ffff ,
                        0x2040ffff2040ff801038ff500028f0ff4058f0ff0000000000000070404040ff ,
                        0x000000700000000000000000000000000000000000000000000000005068ff30 ,
                        0x4060fff03050ffff2040ffff3050ffff2040ff1000000000202820ff404040ff ,
                        0x000000f000000000000000000000000000000000000000000000000000000000 ,
                        0x5070ff404068ffff4060ffff3058ff400000000040404070606060ff505850ff ,
                        0x202020ff0000003000000000000000000000000000000000000000005078ff50 ,
                        0x5078ffff5078ffff5070ffe04068fff04060ff20404040c0707070ff606060ff ,
                        0x504850ff00000080000000000000000000000000000000005078ff705078ffff ,
                        0x5078ffff5078ff605078ff005078ffe05070fff0505880ff909890ff606060ff ,
                        0x505050ff000000f00000000000000000000000005078ffb05078ffff5078ffff ,
                        0x5078ff400000000000000000000000005078ff706070e0ffb0a8b0ff707070ff ,
                        0x606060ff101010f00000000000000000000000005078ffb05078ffe05078ff30 ,
                        0x0000000000000000000000000000000000000000808080ffc0b8c0ffb0b0b0ff ,
                        0x908890ff100810e0000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000070707030807880ff606860ff ,
                        0x505050ff50505020000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =4420
                    LayoutCachedWidth =6008
                    LayoutCachedHeight =283
                    PictureCaptionArrangement =5
                    HoverForeColor =2366701
                    PressedForeColor =2366701
                    Overlaps =1
                End
                Begin ComboBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =95
                    ListRows =30
                    ListWidth =3119
                    Left =1743
                    Width =256
                    Height =255
                    TabIndex =2
                    Name ="comtxt"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Auswahl von Texten, die hier bereits schon mal eingetragen wurden"

                    LayoutCachedLeft =1743
                    LayoutCachedWidth =1999
                    LayoutCachedHeight =255
                End
                Begin CommandButton
                    OverlapFlags =95
                    Left =2832
                    Width =1588
                    TabIndex =3
                    ForeColor =5026082
                    Name ="btnTXT"
                    Caption ="Vorgabe Lexikon"
                    OnClick ="[Event Procedure]"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x2048b080102890ff1030a0700000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x7088e0ff1048ffff102890ff0000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x7088d0807088e0ff2040b0500000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000002040a070000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000004050b0ff000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x203890700038f0ff001860700000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x2040c0ff0038f0ff002890f00000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000005068c070 ,
                        0x5070e0ff0040ffff0030d0ff0018503000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000005068c0c0 ,
                        0x5078e0ff1048ffff0040f0ff0018608000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000005068d0ff ,
                        0x7090ffff1050ffff1040f0ff0028a0f000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000006078d0ff ,
                        0x8098ffff3060ffff1050ffff1038c0f000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000007088e0ff ,
                        0x90a8f0ff80a0ffff6080f0ff2040a0e000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000000000007088c030 ,
                        0x7088e0ff6078d0ff5068d0ff4068d02000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =2832
                    LayoutCachedWidth =4420
                    LayoutCachedHeight =283
                    PictureCaptionArrangement =5
                    HoverForeColor =5026082
                    PressedForeColor =5026082
                    Overlaps =1
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =247
                    Left =1984
                    Width =858
                    TabIndex =4
                    ForeColor =5026082
                    Name ="btnCopy"
                    Caption ="  Copy"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xdddddd0000000ddddddddd0f8f8f0ddddddddd08f8f80d7ddddddd0f8f8f07fd ,
                        0xdddddd0000000bddddddddddd7f7b777d00000007b7b7bfdd0f8f8f0fd7fd7fd ,
                        0xd08f8f80dd7bdd7dd0f8f8f0dd7fddddd0000000dddddddddddddddddddddddd ,
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
                    ControlTipText ="Kopiere den aktuell markierten Text"

                    LayoutCachedLeft =1984
                    LayoutCachedWidth =2842
                    LayoutCachedHeight =283
                    PictureCaptionArrangement =5
                    HoverForeColor =5026082
                    PressedForeColor =5026082
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "UF_txt.cls"
