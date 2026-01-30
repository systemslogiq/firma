Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =11168
    DatasheetFontHeight =12
    ItemSuffix =102
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0x2c45deda9c18e540
    End
    Caption ="Etikette klein"
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
        Begin BreakLevel
            ControlSource ="=[b]"
        End
        Begin PageHeader
            Height =283
            Name ="ph"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin Section
            KeepTogether = NotDefault
            Height =2419
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Label
                    BackStyle =0
                    Left =120
                    Top =840
                    Width =3315
                    Height =375
                    FontSize =7
                    FontWeight =400
                    LeftMargin =284
                    RightMargin =284
                    BackColor =8421504
                    Name ="l1"
                    Caption ="Firmenname"
                    LayoutCachedLeft =120
                    LayoutCachedTop =840
                    LayoutCachedWidth =3435
                    LayoutCachedHeight =1215
                End
                Begin TextBox
                    BackStyle =0
                    Left =120
                    Top =1258
                    Width =3309
                    Height =1161
                    FontSize =9
                    FontWeight =700
                    LeftMargin =284
                    RightMargin =284
                    BackColor =10855845
                    Name ="a1"
                    ControlSource ="a1"

                    LayoutCachedLeft =120
                    LayoutCachedTop =1258
                    LayoutCachedWidth =3429
                    LayoutCachedHeight =2419
                End
                Begin Label
                    BackStyle =0
                    Left =3521
                    Top =840
                    Width =3315
                    Height =375
                    FontSize =7
                    FontWeight =400
                    LeftMargin =284
                    RightMargin =284
                    BackColor =8421504
                    Name ="l2"
                    Caption ="Firmenname"
                    LayoutCachedLeft =3521
                    LayoutCachedTop =840
                    LayoutCachedWidth =6836
                    LayoutCachedHeight =1215
                End
                Begin TextBox
                    BackStyle =0
                    Left =3521
                    Top =1258
                    Width =3309
                    Height =1161
                    FontSize =9
                    FontWeight =700
                    TabIndex =1
                    LeftMargin =284
                    RightMargin =284
                    BackColor =8421504
                    Name ="a2"
                    ControlSource ="a2"

                    LayoutCachedLeft =3521
                    LayoutCachedTop =1258
                    LayoutCachedWidth =6830
                    LayoutCachedHeight =2419
                End
                Begin Label
                    BackStyle =0
                    Left =6866
                    Top =840
                    Width =3315
                    Height =375
                    FontSize =7
                    FontWeight =400
                    LeftMargin =284
                    RightMargin =284
                    BackColor =8421504
                    Name ="l3"
                    Caption ="Firmenname"
                    LayoutCachedLeft =6866
                    LayoutCachedTop =840
                    LayoutCachedWidth =10181
                    LayoutCachedHeight =1215
                End
                Begin TextBox
                    BackStyle =0
                    Left =6866
                    Top =1258
                    Width =3309
                    Height =1161
                    FontSize =9
                    FontWeight =700
                    TabIndex =2
                    LeftMargin =284
                    RightMargin =284
                    BackColor =8421504
                    Name ="a3"
                    ControlSource ="a3"

                    LayoutCachedLeft =6866
                    LayoutCachedTop =1258
                    LayoutCachedWidth =10175
                    LayoutCachedHeight =2419
                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="pf"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
    End
End
CodeBehindForm
' See "B_EtiketteX.cls"
