Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =5205
    DatasheetFontHeight =12
    ItemSuffix =97
    OnNoData ="[Event Procedure]"
    OnPage ="[Event Procedure]"
    RecSrcDt = Begin
        0xc687c5d89c18e540
    End
    Caption ="grosse Etikette"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            FontSize =10
            FontWeight =700
            FontName ="Times New Roman"
        End
        Begin Rectangle
            BorderWidth =1
            BorderLineStyle =0
            Width =2846
            Height =210
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderWidth =1
            TextAlign =1
            TextFontFamily =18
            BorderLineStyle =0
            Width =2163
            Height =264
            LabelX =-1701
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin PageBreak
            Width =283
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =2654
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Label
                    TextFontFamily =34
                    Left =225
                    Top =450
                    Width =4980
                    Height =450
                    FontSize =8
                    FontWeight =400
                    Name ="TX_Absender"
                    FontName ="Arial"
                End
                Begin TextBox
                    TextFontFamily =34
                    Left =225
                    Top =900
                    Width =4974
                    Height =1734
                    FontWeight =700
                    Name ="Adr"
                    ControlSource ="Adr"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =3229
                    Top =226
                    Width =963
                    Height =240
                    FontSize =8
                    TabIndex =1
                    BackColor =10092543
                    Name ="LenN"
                    ControlSource ="LenN"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =1530
                    Top =113
                    Width =963
                    Height =240
                    FontSize =8
                    TabIndex =2
                    BackColor =10092543
                    Name ="NrFunktion"
                    ControlSource ="NrFunktion"
                    FontName ="Arial"

                End
            End
        End
    End
End
CodeBehindForm
' See "B_Etikettegross.cls"
