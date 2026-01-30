Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    Modal = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    AllowUpdating =4
    ScrollBars =2
    ViewsAllowed =2
    TabularFamily =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10206
    DatasheetFontHeight =10
    ItemSuffix =10
    Left =2835
    Top =2415
    Right =28545
    Bottom =15015
    Tag ="txt"
    ShortcutMenuBar ="tlbOHrightMouse"
    RecSrcDt = Begin
        0x895520219c18e540
    End
    Caption ="51  Rechnung - Honeywell AG, Aesch       - Anpassungen Access-DB mod"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="ARIAL"
    OnLoad ="[Event Procedure]"
    AllowFormView =0
    FilterOnLoad =0
    OrderByOnLoad =0
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
        Begin Section
            CanGrow = NotDefault
            Height =680
            BackColor =-2147483633
            Name ="Det"
            Begin
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =567
                    Height =680
                    FontWeight =700
                    LeftMargin =57
                    BackColor =-2147483633
                    Name ="TxtNr"
                    ControlSource ="TxtNr"
                    FontName ="Arial"
                    ControlTipText ="Hier Reihenfolge einstellen"

                    LayoutCachedWidth =567
                    LayoutCachedHeight =680
                End
                Begin TextBox
                    Locked = NotDefault
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    TabStop = NotDefault
                    FELineBreak = NotDefault
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =95
                    TextAlign =1
                    Left =567
                    Width =2835
                    Height =680
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BackColor =-2147483633
                    Name ="txt"
                    ControlSource ="txt"
                    FontName ="Arial"
                    AsianLineBreak =0
                    ShowDatePicker =0

                    LayoutCachedLeft =567
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =680
                End
                Begin TextBox
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    EnterKeyBehavior = NotDefault
                    FELineBreak = NotDefault
                    ScrollBars =2
                    SpecialEffect =0
                    BorderWidth =1
                    OverlapFlags =87
                    TextAlign =1
                    Left =3402
                    Width =6804
                    Height =680
                    FontSize =10
                    TabIndex =2
                    Name ="txtV"
                    ControlSource ="txtV"
                    FontName ="Arial"
                    AsianLineBreak =0
                    ShowDatePicker =0

                    LayoutCachedLeft =3402
                    LayoutCachedWidth =10206
                    LayoutCachedHeight =680
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OldBorderStyle =1
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =1474
                    Top =170
                    Width =794
                    Height =270
                    TabIndex =3
                    LeftMargin =57
                    BackColor =-2147483633
                    Name ="NrTxt"
                    ControlSource ="NrTxt"
                    FontName ="Arial"
                    ControlTipText ="Hier Reihenfolge einstellen"

                    LayoutCachedLeft =1474
                    LayoutCachedTop =170
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =440
                End
            End
        End
    End
End
CodeBehindForm
' See "pfrmTxt.cls"
