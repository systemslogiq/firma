Version =20
VersionRequired =20
Begin Report
    AllowFilters = NotDefault
    LayoutForPrint = NotDefault
    DefaultView =0
    AllowUpdating =4
    TabularFamily =17
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7324
    ItemSuffix =6
    RecSrcDt = Begin
        0x72feff1df916e540
    End
    RecordSource ="SELECT * FROM A_Stichwort; "
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
            ControlSource ="StichwortNr"
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =270
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Width =3408
                    Height =270
                    FontSize =10
                    TabIndex =1
                    Name ="f1"
                    ControlSource ="F1"

                    LayoutCachedWidth =3408
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Left =3406
                    Width =3918
                    Height =270
                    FontSize =10
                    TabIndex =2
                    Name ="f2"
                    ControlSource ="f2"
                    TextFormat =1

                    LayoutCachedLeft =3406
                    LayoutCachedWidth =7324
                    LayoutCachedHeight =270
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =1644
                    Width =576
                    Height =270
                    FontSize =10
                    BackColor =10092543
                    Name ="txtMarker"
                    ControlSource ="txtMarker"
                    AsianLineBreak =255

                    LayoutCachedLeft =1644
                    LayoutCachedWidth =2220
                    LayoutCachedHeight =270
                End
            End
        End
    End
End
CodeBehindForm
' See "UB_Stichwort.cls"
