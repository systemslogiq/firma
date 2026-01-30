Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =2777
    ItemSuffix =39
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x62ac70d09c18e540
    End
    Caption ="Ordner-Rücken"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            TextFontFamily =2
            FontName ="Arial"
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
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
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
            TextAlign =1
            TextFontFamily =18
            BorderLineStyle =0
            Width =2271
            Height =390
            LabelX =-1701
            FontSize =12
            FontName ="Times New Roman"
        End
        Begin UnboundObjectFrame
            Width =4536
            Height =2835
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =10773
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Image
                    SizeMode =3
                    Left =57
                    Width =1418
                    Height =795
                    Name ="logoOrdner"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    LeftPadding =57

                    LayoutCachedLeft =57
                    LayoutCachedWidth =1475
                    LayoutCachedHeight =795
                    TabIndex =10
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =1247
                    Width =1478
                    Height =405
                    FontSize =16
                    FontWeight =700
                    TabIndex =1
                    Name ="Mandant"
                    ControlSource ="Mandant"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =2679
                    Width =1479
                    Height =1134
                    FontSize =16
                    FontWeight =700
                    Name ="x2"
                    ControlSource ="Fa2"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =1644
                    Width =1478
                    Height =1035
                    FontSize =16
                    FontWeight =700
                    TabIndex =3
                    Name ="x1"
                    ControlSource ="Fa1"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =3813
                    Width =1478
                    Height =1134
                    FontSize =16
                    FontWeight =700
                    TabIndex =4
                    Name ="x3"
                    ControlSource ="Fa3"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =4947
                    Width =1478
                    Height =1134
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="x4"
                    ControlSource ="BemAblage"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =2
                    TextFontFamily =34
                    Left =30
                    Top =793
                    Width =1491
                    Height =435
                    FontSize =16
                    FontWeight =700
                    TabIndex =6
                    Name ="AblageArt"
                    ControlSource ="AblageArt"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    TextAlign =2
                    TextFontFamily =34
                    Top =283
                    Width =1478
                    Height =240
                    FontSize =8
                    TabIndex =7
                    BackColor =65535
                    Name ="TextFarbe"
                    ControlSource ="TextFarbe"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Left =30
                    Top =6081
                    Width =1491
                    Height =4125
                    FontSize =8
                    TabIndex =8
                    Name ="x5"
                    ControlSource ="=[1] & \"\015\012\" & [2] & \"\015\012\" & [3] & \"\015\012\" & [4] & \"\015\012"
                        "\" & [5] & \"\015\012\" & [6] & \"\015\012\" & [7] & \"\015\012\" & [8] & \"\015"
                        "\012\" & [9] & \"\015\012\" & [10] & \"\015\012\" & [11] & \"\015\012\" & [12] &"
                        " \"\015\012\" & [13] & \"\015\012\" & [14] & \"\015\012\" & [15] & \"\015\012\" "
                        "& [16]"

                End
                Begin Rectangle
                    BackStyle =0
                    BorderWidth =1
                    Left =30
                    Width =1491
                    Height =10773
                    Name ="ReOrdner"
                End
                Begin TextBox
                    Visible = NotDefault
                    TextAlign =2
                    TextFontFamily =34
                    Top =56
                    Width =1478
                    Height =240
                    FontSize =8
                    TabIndex =9
                    BackColor =65535
                    Name ="EFNrFun"
                    ControlSource ="EFNrFun"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    OldBorderStyle =1
                    BorderWidth =1
                    TextAlign =2
                    TextFontFamily =0
                    Left =30
                    Top =10275
                    Width =1491
                    Height =480
                    FontSize =8
                    TabIndex =2
                    Name ="x6"
                    ControlSource ="=[Nummer] & \" - \" & [Ort] & \"\015\012\" & [Ablageerfasst]"
                    FontName ="Futura Lt BT"

                End
            End
        End
    End
End
CodeBehindForm
' See "B_OrdnerRücken.cls"
