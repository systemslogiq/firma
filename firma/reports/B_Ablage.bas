Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =8796
    ItemSuffix =72
    RecSrcDt = Begin
        0x0a0790ce9c18e540
    End
    Caption ="Deckblatt Ordnerinhalt"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    OnActivate ="[Event Procedure]"
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
        Begin PageHeader
            Height =1056
            Name ="ph"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =4422
                    Top =283
                    Width =4296
                    Height =570
                    FontSize =10
                    Name ="Datum"
                    ControlSource ="=\"Ordnerinhalt \" & [Nummer] & \" -  \" & Date()"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =2943
                    Top =170
                    Width =741
                    Height =270
                    FontSize =10
                    TabIndex =1
                    BackColor =65535
                    Name ="TextFarbe"
                    ControlSource ="TextFarbe"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Top =113
                    Width =2494
                    Height =630
                    FontSize =8
                    TabIndex =2
                    Name ="Text491"
                    ControlSource ="=\"Firma- DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page]"
                        " & \" von \" & [Pages]"
                    FontName ="Arial"

                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =9172
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =2
                    TextAlign =2
                    TextFontFamily =34
                    Top =56
                    Width =8777
                    Height =441
                    FontSize =16
                    FontWeight =700
                    Name ="EtikettenText"
                    ControlSource ="EtikettenText"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =1267
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =1
                    Name ="F01"
                    ControlSource ="=\"01  \" & [1]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =1522
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =2
                    Name ="F02"
                    ControlSource ="=\"02  \" & [2]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =1777
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =3
                    Name ="F03"
                    ControlSource ="=\"03  \" & [3]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =2032
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =4
                    Name ="F04"
                    ControlSource ="=\"04  \" & [4]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =2287
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =5
                    Name ="F05"
                    ControlSource ="=\"05  \" & [5]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =2542
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =6
                    Name ="F06"
                    ControlSource ="=\"06  \" & [6]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =2797
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =7
                    Name ="F07"
                    ControlSource ="=\"07  \" & [7]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =3052
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =8
                    Name ="F08"
                    ControlSource ="=\"08  \" & [8]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =3307
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =9
                    Name ="F09"
                    ControlSource ="=\"09  \" & [9]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =3562
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =10
                    Name ="F10"
                    ControlSource ="=\"10  \" & [10]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =3817
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =11
                    Name ="F11"
                    ControlSource ="=\"11  \" & [11]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =4072
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =12
                    Name ="F12"
                    ControlSource ="=\"12  \" & [12]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =4582
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =13
                    Name ="F14"
                    ControlSource ="=\"14  \" & [14]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =4837
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =14
                    Name ="F15"
                    ControlSource ="=\"15  \" & [15]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =5092
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =15
                    Name ="F16"
                    ControlSource ="=\"16  \" & [16]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =5347
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =16
                    Name ="F17"
                    ControlSource ="=\"17  \" & [17]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =5602
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =17
                    Name ="F18"
                    ControlSource ="=\"18  \" & [18]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =5857
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =18
                    Name ="F19"
                    ControlSource ="=\"19  \" & [19]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =6112
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =19
                    Name ="F20"
                    ControlSource ="=\"20  \" & [20]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =6367
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =20
                    Name ="F21"
                    ControlSource ="=\"21  \" & [21]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =6622
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =21
                    Name ="F22"
                    ControlSource ="=\"22  \" & [22]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =6877
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =22
                    Name ="F23"
                    ControlSource ="=\"23  \" & [23]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =7132
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =23
                    Name ="F24"
                    ControlSource ="=\"24  \" & [24]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =7387
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =24
                    Name ="F25"
                    ControlSource ="=\"25  \" & [25]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =7642
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =25
                    Name ="F26"
                    ControlSource ="=\"26  \" & [26]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =7897
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =26
                    Name ="F27"
                    ControlSource ="=\"27  \" & [27]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =8152
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =27
                    Name ="F28"
                    ControlSource ="=\"28  \" & [28]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =8407
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =28
                    Name ="F29"
                    ControlSource ="=\"29  \" & [29]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =8662
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =29
                    Name ="F30"
                    ControlSource ="=\"30  \" & [30]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =8917
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =30
                    Name ="F31"
                    ControlSource ="=\"31  \" & [31]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    OldBorderStyle =1
                    BorderWidth =1
                    TextFontFamily =34
                    Top =4327
                    Width =8796
                    Height =255
                    FontSize =14
                    TabIndex =31
                    Name ="F13"
                    ControlSource ="=\"13  \" & [13]"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    CanShrink = NotDefault
                    TextFontFamily =34
                    BackStyle =0
                    Left =1138
                    Top =623
                    Width =7637
                    Height =480
                    FontSize =14
                    FontWeight =700
                    TabIndex =32
                    BackColor =65535
                    BorderColor =255
                    Name ="BemAblage"
                    ControlSource ="BemAblage"
                    FontName ="Futura Lt BT"

                End
                Begin TextBox
                    Visible = NotDefault
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =34
                    Left =4025
                    Top =680
                    Width =741
                    Height =270
                    FontSize =10
                    TabIndex =33
                    BackColor =65535
                    Name ="AnzahlRegister"
                    ControlSource ="AnzahlRegister"
                    FontName ="Futura Lt BT"

                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_Ablage.cls"
