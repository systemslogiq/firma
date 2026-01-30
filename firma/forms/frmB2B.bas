Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =4
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =25764
    RowHeight =315
    ItemSuffix =145
    Left =1200
    Top =3600
    Right =26985
    Bottom =16875
    TimerInterval =600000
    Tag ="B2B"
    Filter ="StatusB2B = 'noch nicht gesendet'"
    RecSrcDt = Begin
        0x37a8c2adae62e640
    End
    Caption ="Übersicht von Lagerabrufen, bei denen NNT die ausgelieferte Menge bereits mitget"
        "eilt hat."
    DatasheetFontName ="Arial"
    OnActivate ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    OnError ="[Event Procedure]"
    AllowDatasheetView =0
    FetchDefaults =0
    FilterOnLoad =0
    SplitFormOrientation =1
    SplitFormSize =5655
    FetchDefaults =0
    SplitFormOrientation =1
    SplitFormSize =5655
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
        Begin Page
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =12864
            BackColor =-2147483633
            Name ="Det"
            AlternateBackColor =15658734
            Begin
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =247
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =21675
                    Top =390
                    Width =3969
                    Height =12474
                    FontSize =10
                    FontWeight =700
                    BackColor =10092543
                    ForeColor =0
                    Name ="lstB2BExAct"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;28350"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =21675
                    LayoutCachedTop =390
                    LayoutCachedWidth =25644
                    LayoutCachedHeight =12864
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =21826
                    Top =143
                    TabIndex =1
                    Name ="optOK"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Anzeige optimieren"

                    LayoutCachedLeft =21826
                    LayoutCachedTop =143
                    LayoutCachedWidth =22086
                    LayoutCachedHeight =383
                    Begin
                        Begin Label
                            OverlapFlags =255
                            Left =22056
                            Top =113
                            Width =1335
                            Height =285
                            FontSize =10
                            FontWeight =700
                            Name ="lbloptOK"
                            Caption ="Zeige nur OK"
                            FontName ="Arial"
                            LayoutCachedLeft =22056
                            LayoutCachedTop =113
                            LayoutCachedWidth =23391
                            LayoutCachedHeight =398
                        End
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =20
                    Top =340
                    Width =8378
                    Height =12474
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    BackColor =15527148
                    ForeColor =0
                    Name ="lstB2BEx"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Infos zum B2B mit NNT; mit Doppelklick zur Ausführung freigeben/nicht freigeben"

                    LayoutCachedTop =340
                    LayoutCachedWidth =8378
                    LayoutCachedHeight =12814
                End
                Begin ListBox
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =10669
                    Top =340
                    Width =10875
                    Height =12474
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    BackColor =15266810
                    ForeColor =0
                    Name ="lstB2B"
                    RowSourceType ="Table/Query"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Infos zum B2B mit NNT; mit Doppelklick zur Ausführung freigeben/nicht freigeben"

                    LayoutCachedLeft =10669
                    LayoutCachedTop =340
                    LayoutCachedWidth =21544
                    LayoutCachedHeight =12814
                End
            End
        End
    End
End
CodeBehindForm
' See "frmB2B.cls"
