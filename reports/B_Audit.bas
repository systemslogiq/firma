Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    DateGrouping =1
    GridY =10
    Width =9644
    ItemSuffix =41
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xee09617f1205e340
    End
    Caption ="Change Control Report"
    OnOpen ="[Event Procedure]"
    FilterOnLoad =0
    AllowLayoutView =0
    Begin
        Begin Label
            FontUnderline = NotDefault
            FontSize =10
            FontWeight =700
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
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            BorderLineStyle =0
            Width =1641
            Height =225
            LabelX =-1701
            FontName ="Arial"
        End
        Begin BreakLevel
            SortOrder = NotDefault
            ControlSource ="NrAudit"
        End
        Begin PageHeader
            Height =1474
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin Label
                    FontUnderline = NotDefault
                    Left =60
                    Top =1095
                    Width =510
                    Height =285
                    Name ="Text15"
                    Caption ="ID"
                End
                Begin Line
                    BorderWidth =3
                    Top =1455
                    Width =9641
                    Name ="Linie25"
                End
                Begin Line
                    BorderWidth =3
                    Width =9641
                    Name ="Linie23"
                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =911
                    Top =1095
                    Width =945
                    Height =285
                    Name ="Bezeichnungsfeld29"
                    Caption ="Tabelle"
                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =7029
                    Top =1095
                    Width =1545
                    Height =285
                    Name ="Bezeichnungsfeld30"
                    Caption ="Datum / Uhrzeit"
                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =8787
                    Top =1095
                    Width =840
                    Height =285
                    Name ="Bezeichnungsfeld31"
                    Caption ="User"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    DecimalPlaces =0
                    BorderWidth =1
                    TextAlign =3
                    TextFontFamily =18
                    Left =7540
                    Top =113
                    Width =2104
                    Height =840
                    TabIndex =1
                    Name ="Text491"
                    ControlSource ="=\"IH-DB: \" & Format(Date(),\"dd\\.mm\\.yy\") & \"\015\012Seite \" & [Page] & \""
                        " von \" & [Pages]"
                    FontName ="Times New Roman"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    BorderWidth =1
                    TextAlign =2
                    BackStyle =0
                    Top =120
                    Width =7589
                    Height =615
                    FontSize =14
                    FontWeight =700
                    Name ="ReportTitel"

                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =2158
                    Top =1095
                    Width =945
                    Height =285
                    Name ="Bezeichnungsfeld35"
                    Caption ="Feld"
                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =3405
                    Top =1095
                    Width =1020
                    Height =285
                    Name ="Bezeichnungsfeld37"
                    Caption ="alter Wert"
                End
                Begin Label
                    FontUnderline = NotDefault
                    Left =5100
                    Top =1095
                    Width =1140
                    Height =285
                    Name ="Bezeichnungsfeld39"
                    Caption ="neuer Wert"
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =225
            Name ="Detail1"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    IMESentenceMode =3
                    Width =861
                    Name ="keycol"
                    ControlSource ="keycol"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =907
                    Width =1236
                    TabIndex =1
                    Name ="tableName"
                    ControlSource ="tableName"
                    StatusBarText ="Form Name"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7082
                    TabIndex =2
                    Name ="AuditDate"
                    ControlSource ="AuditDate"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =8787
                    Width =840
                    TabIndex =3
                    Name ="AuditWho"
                    ControlSource ="AuditWho"

                End
                Begin Line
                    BorderWidth =1
                    Width =9641
                    Name ="Linie32"
                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =2154
                    Width =1236
                    TabIndex =4
                    Name ="colname"
                    ControlSource ="colname"
                    StatusBarText ="Form Name"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =3401
                    Width =1236
                    TabIndex =5
                    Name ="oldval"
                    ControlSource ="oldval"
                    StatusBarText ="Form Name"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    IMESentenceMode =3
                    Left =5102
                    Width =1236
                    TabIndex =6
                    Name ="newval"
                    ControlSource ="newval"
                    StatusBarText ="Form Name"

                End
            End
        End
        Begin PageFooter
            Height =15
            Name ="Seitenfuß2"
            Begin
                Begin Line
                    BorderWidth =3
                    Width =9641
                    Name ="Linie34"
                End
            End
        End
    End
End
CodeBehindForm
' See "B_Audit.cls"
