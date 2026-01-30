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
    Width =7371
    ItemSuffix =6
    RecSrcDt = Begin
        0xdada4b29cd33e540
    End
    RecordSource ="SELECT * FROM A_StichwortVG; "
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
            ControlSource ="StichwortNr"
        End
        Begin Section
            CanGrow = NotDefault
            Height =225
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Width =3402
                    Height =225
                    TabIndex =1
                    Name ="F1"
                    ControlSource ="f1"

                    LayoutCachedWidth =3402
                    LayoutCachedHeight =225
                End
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =1
                    TextFontFamily =34
                    Left =3402
                    Width =3969
                    Height =225
                    TabIndex =2
                    Name ="f2"
                    ControlSource ="f2"
                    TextFormat =1

                    LayoutCachedLeft =3402
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =225
                End
                Begin TextBox
                    Visible = NotDefault
                    FELineBreak = NotDefault
                    TextFontFamily =0
                    IMESentenceMode =3
                    Left =510
                    Width =1011
                    Height =225
                    FontSize =10
                    BackColor =10092543
                    Name ="txtMarker"
                    ControlSource ="txtMarker"
                    AsianLineBreak =255

                    LayoutCachedLeft =510
                    LayoutCachedWidth =1521
                    LayoutCachedHeight =225
                End
            End
        End
    End
End
CodeBehindForm
' See "UB_StichwortVG.cls"
