Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =3410
    DatasheetFontHeight =12
    ItemSuffix =93
    OnNoData ="[Event Procedure]"
    OnPage ="[Event Procedure]"
    RecSrcDt = Begin
        0x2ce93b0a2d05e340
    End
    Caption ="kleine Etikette"
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
            ControlSource ="Anschrift"
        End
        Begin PageHeader
            Height =0
            Name ="SK"
        End
        Begin Section
            Height =2037
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Label
                    Left =65
                    Top =56
                    Width =3345
                    Height =465
                    FontSize =7
                    FontWeight =400
                    Name ="TX_Absender"
                    Caption ="Firmenname"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =65
                    Top =516
                    Width =3339
                    Height =1521
                    FontSize =10
                    FontWeight =700
                    Name ="Anschrift"
                    ControlSource ="Anschrift"

                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="Seitenfuß1"
        End
    End
End
CodeBehindForm
' See "B_EtiketteKleinVG.cls"
