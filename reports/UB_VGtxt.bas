Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    DefaultView =0
    AllowUpdating =4
    TabularFamily =17
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =9639
    ItemSuffix =8
    RecSrcDt = Begin
        0x117c83607880e540
    End
    RecordSource ="SELECT vwUB_VGtxt.* FROM vwUB_VGtxt; "
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    AllowLayoutView =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin TextBox
            OldBorderStyle =0
            TextFontFamily =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
            ShowDatePicker =0
        End
        Begin PageBreak
            Width =283
        End
        Begin BreakLevel
            ControlSource ="txtNr"
        End
        Begin Section
            Visible = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =270
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Width =2835
                    Height =270
                    FontSize =10
                    Name ="f1"
                    ControlSource ="f1"

                    LayoutCachedWidth =2835
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =2835
                    Width =6804
                    Height =270
                    FontSize =10
                    TabIndex =1
                    Name ="f2"
                    ControlSource ="f2"

                    LayoutCachedLeft =2835
                    LayoutCachedWidth =9639
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =4143
                    Width =558
                    Height =270
                    FontSize =10
                    TabIndex =2
                    BackColor =10092543
                    Name ="NrQK"
                    ControlSource ="NrQK"

                    LayoutCachedLeft =4143
                    LayoutCachedWidth =4701
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =5107
                    Width =558
                    Height =270
                    FontSize =10
                    TabIndex =3
                    BackColor =10092543
                    Name ="TxtNr"
                    ControlSource ="TxtNr"

                    LayoutCachedLeft =5107
                    LayoutCachedWidth =5665
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =6411
                    Width =558
                    Height =270
                    FontSize =10
                    TabIndex =4
                    BackColor =10092543
                    Name ="TxtMarker"
                    ControlSource ="txtMarker"

                    LayoutCachedLeft =6411
                    LayoutCachedWidth =6969
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =0
                    Left =1303
                    Width =558
                    Height =270
                    FontSize =10
                    TabIndex =5
                    BackColor =10092543
                    Name ="ID"
                    ControlSource ="ID"

                    LayoutCachedLeft =1303
                    LayoutCachedWidth =1861
                    LayoutCachedHeight =270
                End
            End
        End
    End
End
CodeBehindForm
' See "UB_VGtxt.cls"
