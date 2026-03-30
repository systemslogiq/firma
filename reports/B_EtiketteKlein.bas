Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =3750
    DatasheetFontHeight =12
    ItemSuffix =98
    OnNoData ="[Event Procedure]"
    OnPage ="[Event Procedure]"
    RecSrcDt = Begin
        0x7b7f20d79c18e540
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
            ControlSource ="adr"
        End
        Begin Section
            KeepTogether = NotDefault
            Height =2299
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Label
                    BackStyle =0
                    Left =435
                    Top =375
                    Width =3315
                    Height =375
                    FontSize =7
                    FontWeight =400
                    BackColor =8421504
                    Name ="TX_Absender"
                    Caption ="Firmenname"
                End
                Begin TextBox
                    BackStyle =0
                    Left =435
                    Top =793
                    Width =3309
                    Height =1506
                    FontSize =9
                    FontWeight =700
                    BackColor =8421504
                    Name ="Adr"
                    ControlSource ="Adr"

                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =1
                    TextFontFamily =34
                    Left =2372
                    Top =56
                    Width =1293
                    Height =240
                    FontSize =8
                    TabIndex =1
                    BackColor =10092543
                    Name ="LenN"
                    ControlSource ="LenN"
                    FontName ="Arial"

                End
            End
        End
    End
End
CodeBehindForm
' See "B_EtiketteKlein.cls"
