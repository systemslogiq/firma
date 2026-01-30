Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    DefaultView =0
    AllowUpdating =4
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8677
    DatasheetFontHeight =10
    ItemSuffix =21
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xcb7c1ad29c18e540
    End
    Caption ="Chronik"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    AllowLayoutView =0
    DatasheetGridlinesColor12 =12632256
    Begin
        Begin Label
            BackStyle =0
            TextAlign =1
            FontSize =9
            FontWeight =700
            ForeColor =128
            FontName ="Arial"
        End
        Begin Rectangle
            BackStyle =0
            BorderWidth =1
            BorderLineStyle =0
            Width =850
            Height =850
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderColor =128
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
            Width =1701
            Height =1701
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            FontSize =9
            FontName ="Times New Roman"
        End
        Begin ListBox
            TextFontFamily =18
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =9
            FontName ="Times New Roman"
        End
        Begin ComboBox
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            BackStyle =0
            Width =1701
            LabelX =-1701
            FontSize =9
            FontName ="Times New Roman"
        End
        Begin Subform
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            Width =4536
            Height =2835
        End
        Begin BreakLevel
            SortOrder = NotDefault
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="Jahre"
        End
        Begin BreakLevel
            ControlSource ="DatumEreignis"
        End
        Begin PageHeader
            Height =1077
            Name ="ph"
            Begin
                Begin TextBox
                    DecimalPlaces =0
                    TextAlign =2
                    Left =3685
                    Top =170
                    Width =1230
                    Height =480
                    ColumnWidth =570
                    ColumnOrder =0
                    FontSize =18
                    FontWeight =700
                    ForeColor =128
                    Name ="J"
                    ControlSource ="Jahre"

                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =0
            Name ="gh"
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =625
            Name ="det"
            Begin
                Begin TextBox
                    OverlapFlags =4
                    Left =-4
                    Top =56
                    Width =864
                    Height =285
                    FontSize =10
                    Name ="DatumEreignis"
                    ControlSource ="DatumEreignis"
                    Format ="Short Date"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =907
                    Top =340
                    Width =7770
                    Height =285
                    ColumnWidth =5835
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="Ereignis"
                    ControlSource ="Ereignis"

                End
                Begin TextBox
                    Left =907
                    Top =57
                    Width =3525
                    Height =285
                    ColumnWidth =1515
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="Zeitraum"
                    ControlSource ="Zeitraum"

                End
                Begin TextBox
                    TextAlign =3
                    Left =4422
                    Top =56
                    Width =4245
                    Height =285
                    ColumnWidth =900
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="Wer"
                    ControlSource ="Wer"

                End
                Begin Line
                    LineSlant = NotDefault
                    Left =3
                    Top =-3
                    Width =8667
                    Name ="Linie19"
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            ForceNewPage =2
            Height =0
            Name ="gf"
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_Chronik.cls"
