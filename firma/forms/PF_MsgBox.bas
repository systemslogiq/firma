Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    FastLaserPrinting = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8560
    DatasheetFontHeight =10
    ItemSuffix =27
    Left =28800
    Top =3030
    Right =-8191
    Bottom =15225
    RecSrcDt = Begin
        0xdc1ce86e7060e240
    End
    Caption ="Hinweis"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Arial"
    OnKeyPress ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
    FilterOnLoad =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
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
            ForeColor =-2147483630
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin TextBox
            SpecialEffect =2
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontName ="Tahoma"
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
            Height =6866
            BackColor =-2147483633
            Name ="Det"
            OnDblClick ="[Event Procedure]"
            Begin
                Begin ComboBox
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1136
                    Top =6285
                    Width =7305
                    Height =270
                    TabIndex =8
                    Name ="comInput"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Eingabefeld"

                    LayoutCachedLeft =1136
                    LayoutCachedTop =6285
                    LayoutCachedWidth =8441
                    LayoutCachedHeight =6555
                End
                Begin TextBox
                    Locked = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =60
                    Width =7305
                    Height =5850
                    TabIndex =10
                    BackColor =12632256
                    BorderColor =128
                    ForeColor =8388608
                    Name ="txtPrompt"
                    FontName ="Arial"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =60
                    LayoutCachedWidth =8438
                    LayoutCachedHeight =5910
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =60
                    Top =4715
                    Width =1022
                    Height =405
                    TabIndex =7
                    Name ="btnHelp"
                    Caption ="Hilfe"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =60
                    LayoutCachedTop =4715
                    LayoutCachedWidth =1082
                    LayoutCachedHeight =5120
                End
                Begin Image
                    PictureAlignment =0
                    Left =231
                    Top =4086
                    Width =622
                    Height =629
                    Name ="imgIcon"
                    PictureData = Begin
                        0x2800000020000000200000000100080000000000000400000000000000000000 ,
                        0x000100000001000000000000ff0000007b7b7b00bdbdbd00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00000000000000bf00 ,
                        0x00bf000000bfbf00bf000000bf00bf00bfbf0000c0c0c000808080000000ff00 ,
                        0x00ff000000ffff00ff000000ff00ff00ffff0000ffffff000000000000000000 ,
                        0x0000000000000000f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3020202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3ffff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3fffbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3fffbfbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302fffbfbfbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302020202fffbfbfbff0202020202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3020202ffffff03fbfbfbff0202020202 ,
                        0x0202f3f3f3f3f3f3f3f3f3f3f3f3f302ffffff03fbfbfbfbfbfb03ffffff0202 ,
                        0x020202f3f3f3f3f3f3f3f3f3f3f3ffff03fbfbfbfbfbfbfbfbfbfbfbfb03ffff ,
                        0x02020202f3f3f3f3f3f3f3f3f3ff03fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb03 ,
                        0xff02020202f3f3f3f3f3f3f3fffbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbff02020202f3f3f3f3f3fffbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbfbff02020202f3f3f302fbfbfbfbfbfbfbfbf8f8f8f8f8f8f8f8f8fbfbfbfb ,
                        0xfbfbfbff020202f3f30203fbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfb03ff020202f302fbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbff0202020203fbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfb03ff020202fbfbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbf8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbf8f8f8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff02f30203fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbfbfbfb03ff02f3f302fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbfbfbfbff02f3f3f30203fbfbfbfbfbfbfbfbfb03f8f8f8f803fbfbfbfbfbfb ,
                        0xfbfbfb03fff3f3f3f3f302fbfbfbfbfbfbfbfbfbf8f8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfff3f3f3f3f3f3f302fbfbfbfbfbfbfbfbf8f8f8f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfff3f3f3f3f3f3f3f3f302fbfbfbfbfbfbfb03f8f8f8f803fbfbfbfbfbfb ,
                        0xfbfff3f3f3f3f3f3f3f3f3f3f30203fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb03 ,
                        0x02f3f3f3f3f3f3f3f3f3f3f3f3f3020203fbfbfbfbfbfbfbfbfbfbfbfb030202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302020203fbfbfbfbfbfb03020202f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30202020202020202f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3
                    End
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Picture ="icoInfo.bmp"

                    LayoutCachedLeft =231
                    LayoutCachedTop =4086
                    LayoutCachedWidth =853
                    LayoutCachedHeight =4715
                    TabIndex =16
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =226
                    Top =453
                    Width =690
                    Height =255
                    Name ="lblHelp"
                    Caption ="Hilfe..."
                    FontName ="Arial"
                End
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =255
                    Left =1189
                    Top =6345
                    Width =792
                    Height =517
                    TabIndex =1
                    Name ="btn1"
                    Caption ="1"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =1189
                    LayoutCachedTop =6345
                    LayoutCachedWidth =1981
                    LayoutCachedHeight =6862
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =255
                    Left =1981
                    Top =6345
                    Width =792
                    Height =517
                    TabIndex =2
                    Name ="btn2"
                    Caption ="2"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =1981
                    LayoutCachedTop =6345
                    LayoutCachedWidth =2773
                    LayoutCachedHeight =6862
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =255
                    Left =2773
                    Top =6345
                    Width =852
                    Height =517
                    TabIndex =3
                    Name ="btn3"
                    Caption ="3"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =2773
                    LayoutCachedTop =6345
                    LayoutCachedWidth =3625
                    LayoutCachedHeight =6862
                    Overlaps =1
                End
                Begin Image
                    Visible = NotDefault
                    PictureAlignment =0
                    Left =4290
                    Top =60
                    Width =622
                    Height =629
                    Name ="imgFrage"
                    PictureData = Begin
                        0x2800000020000000200000000100080000000000000400000000000000000000 ,
                        0x000100000001000000000000ff0000007b7b7b00bdbdbd00c6c6c600ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00000000000000bf00 ,
                        0x00bf000000bfbf00bf000000bf00bf00bfbf0000c0c0c000808080000000ff00 ,
                        0x00ff000000ffff00ff000000ff00ff00ffff0000ffffff000000000000000000 ,
                        0x0000000000000000f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3020202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3ffff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3fffbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3fffbfbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302fffbfbfbff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302020202fffbfbfbff0202020202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3020202ffffff03fbfbfbff0202020202 ,
                        0x0202f3f3f3f3f3f3f3f3f3f3f3f3f302ffffff03fbfbfbfbfbfb03ffffff0202 ,
                        0x020202f3f3f3f3f3f3f3f3f3f3f3ffff03fbfbfbfbfbfbfbfbfbfbfbfb03ffff ,
                        0x02020202f3f3f3f3f3f3f3f3f3ff03fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb03 ,
                        0xff02020202f3f3f3f3f3f3f3fffbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbff02020202f3f3f3f3f3fffbfbfbfbfbfbfbfbfb03f8f803fbfbfbfbfbfbfb ,
                        0xfbfbff02020202f3f3f302fbfbfbfbfbfbfbfbfbfbf8f8f8f8fbfbfbfbfbfbfb ,
                        0xfbfbfbff020202f3f30203fbfbfbfbfbfbfbfbfbfbf8f8f8f8fbfbfbfbfbfbfb ,
                        0xfbfbfb03ff020202f302fbfbfbfbfbfbfbfbfbfbfb03f8f803fbfbfbfbfbfbfb ,
                        0xfbfbfbfbff0202020203fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbfbfbfb03ff020202fbfbfbfbfbfbfbfbfbfbfbfbfbf8f8fbfbfbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbfbf8f803fbfbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbfbf8f8f8fbfbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfbfbfbfbfb03f8f8f8fbfbfbfbfbfb ,
                        0xfbfbfbfbfbff020202fbfbfbfbfbfbfbfbfb03f8f803fbf8f8f8f8fbfbfbfbfb ,
                        0xfbfbfbfbfbff02f30203fbfbfbfbfbfbfbfbf8f8f8f8fb03f8f8f8f8fbfbfbfb ,
                        0xfbfbfbfb03ff02f3f302fbfbfbfbfbfbfbfbf8f8f8f8fbfbf8f8f8f8fbfbfbfb ,
                        0xfbfbfbfbff02f3f3f30203fbfbfbfbfbfbfbf8f8fbfbfbfbf8f8f8f8fbfbfbfb ,
                        0xfbfbfb03fff3f3f3f3f302fbfbfbfbfbfbfb03f803fbfbf8f8f8f803fbfbfbfb ,
                        0xfbfbfbfff3f3f3f3f3f3f302fbfbfbfbfbfbfb03f8f8f8f8f8f803fbfbfbfbfb ,
                        0xfbfbfff3f3f3f3f3f3f3f3f302fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb ,
                        0xfbfff3f3f3f3f3f3f3f3f3f3f30203fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb03 ,
                        0x02f3f3f3f3f3f3f3f3f3f3f3f3f3020203fbfbfbfbfbfbfbfbfbfbfbfb030202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f302020203fbfbfbfbfbfb03020202f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30202020202020202f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3
                    End
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Picture ="icoFrage.bmp"

                    TabIndex =13
                End
                Begin Image
                    Visible = NotDefault
                    PictureAlignment =0
                    Left =4970
                    Top =60
                    Width =622
                    Height =629
                    Name ="imgStop"
                    PictureData = Begin
                        0x2800000020000000200000000100080000000000000400000000000000000000 ,
                        0x000100000001000000007b007b7b7b000000ff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00000000000000bf00 ,
                        0x00bf000000bfbf00bf000000bf00bf00bfbf0000c0c0c000808080000000ff00 ,
                        0x00ff000000ffff00ff000000ff00ff00ffff0000ffffff000000000000000000 ,
                        0x0000000000000000f3f3f3f3f3f3f3f3f3f3f3f3f30101010101010101f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30101010101010101010101010101 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3010100000000000000000101010101 ,
                        0x01f3f3f3f3f3f3f3f3f3f3f3f3f3f301000000f5f5f5f5f5f5f5f50000000101 ,
                        0x010101f3f3f3f3f3f3f3f3f3f3f30100f5f5f5f5f5f5f5f5f5f5f5f5f5f50001 ,
                        0x01010101f3f3f3f3f3f3f3f3f30000f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f500 ,
                        0x0001010101f3f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf500010101f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf5f500010101f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf5f50001010101f3f3f300f5f5f5f5f5f5fbf5f5f5f5f5f5f5f5f5f5fbf5f5f5 ,
                        0xf5f5f500010101f3f300f5f5f5f5f5f5fbfbfbf5f5f5f5f5f5f5f5fbfbfbf5f5 ,
                        0xf5f5f5f5000101f3f300f5f5f5f5f5fbfbfbfbfbf5f5f5f5f5f5fbfbfbfbfbf5 ,
                        0xf5f5f5f500010101f300f5f5f5f5f5f5fbfbfbfbfbf5f5f5f5fbfbfbfbfbf5f5 ,
                        0xf5f5f5f50001010100f5f5f5f5f5f5f5f5fbfbfbfbfbf5f5fbfbfbfbfbf5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbfbfbfbfbf5f5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbfbfbf5f5f5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbf5f5f5f5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbf5f5f5f5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbfbfbf5f5f5f5f5 ,
                        0xf5f5f5f5f500010100f5f5f5f5f5f5f5f5f5fbfbfbfbfbfbfbfbfbfbf5f5f5f5 ,
                        0xf5f5f5f5f50001f300f5f5f5f5f5f5f5f5fbfbfbfbfbf5f5fbfbfbfbfbf5f5f5 ,
                        0xf5f5f5f5f50001f3f300f5f5f5f5f5f5fbfbfbfbfbf5f5f5f5fbfbfbfbfbf5f5 ,
                        0xf5f5f5f5000101f3f300f5f5f5f5f5fbfbfbfbfbf5f5f5f5f5f5fbfbfbfbfbf5 ,
                        0xf5f5f5f50001f3f3f300f5f5f5f5f5f5fbfbfbf5f5f5f5f5f5f5f5fbfbfbf5f5 ,
                        0xf5f5f5f500f3f3f3f3f300f5f5f5f5f5f5fbf5f5f5f5f5f5f5f5f5f5fbf5f5f5 ,
                        0xf5f5f50001f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf5f50001f3f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf5f500f3f3f3f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5 ,
                        0xf500f3f3f3f3f3f3f3f3f3f3f30000f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f500 ,
                        0x00f3f3f3f3f3f3f3f3f3f3f3f3f3f300f5f5f5f5f5f5f5f5f5f5f5f5f5f500f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3000000f5f5f5f5f5f5f5f5000000f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f30000000000000000f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3
                    End
                    ObjectPalette = Begin
                        0x000301007b00000000000000
                    End
                    Picture ="icoStop.bmp"

                    TabIndex =14
                End
                Begin Image
                    Visible = NotDefault
                    PictureAlignment =0
                    Left =5651
                    Top =60
                    Width =622
                    Height =629
                    Name ="imgWarn"
                    PictureData = Begin
                        0x2800000020000000200000000100080000000000000400000000000000000000 ,
                        0x000100000001000000000000007b7b007b7b7b00bdbdbd0000ffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00 ,
                        0xffffff00ffffff00ffffff00ffffff00ffffff00ffffff00000000000000bf00 ,
                        0x00bf000000bfbf00bf000000bf00bf00bfbf0000c0c0c000808080000000ff00 ,
                        0x00ff000000ffff00ff000000ff00ff00ffff0000ffffff000000000000000000 ,
                        0x0000000000000000f3f3f3f3f302020202020202020202020202020202020202 ,
                        0x020202020202f3f3f3f3f3f30202020202020202020202020202020202020202 ,
                        0x02020202020202f3f3f301ffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffff0202020202f301f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7 ,
                        0xf7f703ff0202020201f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7 ,
                        0xf7f7f703ff02020201f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7 ,
                        0xf7f7f7f7ff02020201f7f7f7f7f7f7f7f7f7f7f7f703ffff03f7f7f7f7f7f7f7 ,
                        0xf7f7f7f7ff0202f301f7f7f7f7f7f7f7f7f7f7f7f7fffffffff7f7f7f7f7f7f7 ,
                        0xf7f7f703ff0202f3f301f7f7f7f7f7f7f7f7f7f7f7fffffffff7f7f7f7f7f7f7 ,
                        0xf7f7f7ff0202f3f3f301f7f7f7f7f7f7f7f7f7f7f703ffff03f7f7f7f7f7f7f7 ,
                        0xf7f703ff0202f3f3f3f301f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7 ,
                        0xf7f7ff0202f3f3f3f3f301f7f7f7f7f7f7f7f7f7f7f7fff7f7f7f7f7f7f7f7f7 ,
                        0xf703ff0202f3f3f3f3f3f301f7f7f7f7f7f7f7f7f703ff03f7f7f7f7f7f7f7f7 ,
                        0xf7ff0202f3f3f3f3f3f3f301f7f7f7f7f7f7f7f7f701ff01f7f7f7f7f7f7f7f7 ,
                        0x03ff0202f3f3f3f3f3f3f3f301f7f7f7f7f7f7f7f7fffffff7f7f7f7f7f7f7f7 ,
                        0xff0202f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7f703ffffff03f7f7f7f7f7f703 ,
                        0xff0202f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f701ffffff01f7f7f7f7f7f7ff ,
                        0x0202f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7fffffffffff7f7f7f7f703ff ,
                        0x0202f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7fffffffffff7f7f7f7f7ff02 ,
                        0x02f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7fffffffffff7f7f7f703ff02 ,
                        0x02f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7fffffffffff7f7f7f7ff0202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7fffffffffff7f7f703ff0202 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f703ffffff03f7f7f7ff0202f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7f7f7f7f703ff0202f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7f7f7f7ff0202f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7f7f703ff0202f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f7f7ff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7f703ff0202f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f7f7ff0202f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f7f7f703ff02f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f301f7f703fff3f3f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3010101f3f3f3f3f3f3f3f3 ,
                        0xf3f3f3f3f3f3f3f3
                    End
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    Picture ="icoWarn.bmp"

                    TabIndex =15
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =1136
                    Top =6015
                    Width =7305
                    Height =270
                    Name ="Input"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Eingabefeld"

                    LayoutCachedLeft =1136
                    LayoutCachedTop =6015
                    LayoutCachedWidth =8441
                    LayoutCachedHeight =6285
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =255
                    Left =3627
                    Top =6345
                    Width =852
                    Height =517
                    TabIndex =4
                    Name ="btn4"
                    Caption ="4"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =3627
                    LayoutCachedTop =6345
                    LayoutCachedWidth =4479
                    LayoutCachedHeight =6862
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =247
                    Left =4482
                    Top =6345
                    Width =852
                    Height =517
                    TabIndex =5
                    Name ="btn5"
                    Caption ="5"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =6345
                    LayoutCachedWidth =5334
                    LayoutCachedHeight =6862
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =60
                    Top =5419
                    Width =1022
                    Height =517
                    TabIndex =6
                    Name ="btn0"
                    Caption ="Abbrechen"
                    OnClick ="[Event Procedure]"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Formular schließen"

                    LayoutCachedLeft =60
                    LayoutCachedTop =5419
                    LayoutCachedWidth =1082
                    LayoutCachedHeight =5936
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    SpecialEffect =0
                    OverlapFlags =85
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =60
                    Top =6015
                    Width =1020
                    Height =270
                    FontWeight =700
                    TabIndex =11
                    Name ="ListeCount"
                    FontName ="Arial"
                    ControlTipText ="Anzahl Datensätze in der Liste"

                    LayoutCachedLeft =60
                    LayoutCachedTop =6015
                    LayoutCachedWidth =1080
                    LayoutCachedHeight =6285
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =247
                    Left =15
                    Top =60
                    Width =1140
                    Height =255
                    Name ="lblSort"
                    Caption ="Click sortiert>>"
                    FontName ="Arial"
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    Visible = NotDefault
                    OverlapFlags =247
                    MultiSelect =2
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =1133
                    Top =742
                    Width =7305
                    Height =5160
                    TabIndex =9
                    BackColor =12632256
                    ForeColor =8388608
                    BorderColor =128
                    Name ="Liste"
                    RowSourceType ="Table/Query"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyUp ="[Event Procedure]"
                    OnMouseDown ="[Event Procedure]"
                    ControlTipText ="Auflistung der angeclickten Auswahl (mit SHIFT und/oder CTRL-Taste markieren)"

                    LayoutCachedLeft =1133
                    LayoutCachedTop =742
                    LayoutCachedWidth =8438
                    LayoutCachedHeight =5902
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =247
                    Left =5385
                    Top =6349
                    Width =852
                    Height =517
                    TabIndex =12
                    Name ="btn6"
                    Caption ="6"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =5385
                    LayoutCachedTop =6349
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =6866
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_MsgBox.cls"
