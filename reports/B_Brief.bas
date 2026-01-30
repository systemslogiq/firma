Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowUpdating =4
    TabularFamily =18
    DateGrouping =1
    GridY =10
    Width =10320
    DatasheetFontHeight =12
    ItemSuffix =172
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xc3ac65cf9c18e540
    End
    Caption ="Rundschreiben"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
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
        Begin ComboBox
            OldBorderStyle =0
            TextFontFamily =2
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontName ="Arial"
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="SortGroup"
        End
        Begin BreakLevel
            GroupFooter = NotDefault
            ControlSource ="=[Fun1]"
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="Fun"
        End
        Begin PageHeader
            Height =1475
            OnFormat ="[Event Procedure]"
            Name ="SK"
            Begin
                Begin Image
                    SizeMode =3
                    Width =10212
                    Height =1375
                    Name ="LogoSeiteO"

                    TabIndex =2
                End
                Begin TextBox
                    Visible = NotDefault
                    BorderWidth =0
                    TextAlign =0
                    TextFontFamily =34
                    Left =8050
                    Top =1133
                    Width =660
                    Height =285
                    ColumnOrder =0
                    FontSize =10
                    BackColor =10092543
                    Name ="unsichtbareSeitenZahl"
                    ControlSource ="=[Pages]"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1247
                    Top =1133
                    Width =1287
                    Height =285
                    ColumnOrder =2
                    TabIndex =1
                    BackColor =65535
                    Name ="Fun"
                    ControlSource ="Fun"
                    FontName ="Arial"

                End
            End
        End
        Begin BreakHeader
            CanGrow = NotDefault
            Height =4098
            BreakLevel =2
            OnFormat ="[Event Procedure]"
            Name ="GHFun"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =3004
                    Width =7200
                    Height =270
                    FontSize =10
                    Name ="BetreffKontakt"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =3
                    TextFontFamily =34
                    Left =7263
                    Top =3004
                    Width =2382
                    Height =270
                    FontSize =10
                    TabIndex =1
                    BorderColor =255
                    Name ="txtDatum"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =3693
                    Width =10149
                    Height =405
                    FontSize =10
                    TabIndex =2
                    Name ="Anrede"
                    ControlSource ="Anrede"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    BackStyle =0
                    Top =670
                    Width =5664
                    Height =1650
                    FontSize =10
                    TabIndex =3
                    BackColor =10092543
                    Name ="Adresse"
                    ControlSource ="Adresse"
                    FontName ="Arial"

                    LayoutCachedTop =670
                    LayoutCachedWidth =5664
                    LayoutCachedHeight =2320
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Width =5616
                    Height =240
                    FontSize =8
                    FontWeight =700
                    TabIndex =4
                    BorderColor =255
                    Name ="FaxEmailSeite"
                    FontName ="Arial"

                    LayoutCachedWidth =5616
                    LayoutCachedHeight =240
                End
                Begin Image
                    SizeMode =3
                    Left =7486
                    Top =4
                    Width =2682
                    Height =2905
                    BorderColor =255
                    Name ="LogoAdresse"

                    TabIndex =10
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    BackStyle =0
                    Top =270
                    Width =5664
                    Height =225
                    FontSize =8
                    TabIndex =5
                    BackColor =255
                    Name ="TX_EFKlein"
                    FontName ="Arial"

                    LayoutCachedTop =270
                    LayoutCachedWidth =5664
                    LayoutCachedHeight =495
                End
                Begin TextBox
                    TextFontFamily =34
                    Left =7363
                    Width =2957
                    Height =2857
                    FontSize =8
                    TabIndex =6
                    BorderColor =16711935
                    Name ="TX_EFAbsender"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2040
                    Top =113
                    Width =1302
                    Height =240
                    FontSize =8
                    TabIndex =7
                    BackColor =10092543
                    Name ="Fax"
                    ControlSource ="Fax"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =2040
                    Top =473
                    Width =1302
                    Height =240
                    FontSize =8
                    TabIndex =8
                    BackColor =10092543
                    Name ="Email"
                    ControlSource ="Email"
                    FontName ="Arial"

                End
                Begin TextBox
                    Visible = NotDefault
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =6066
                    Top =983
                    Width =1302
                    Height =240
                    FontSize =8
                    TabIndex =9
                    BackColor =10092543
                    Name ="Land"
                    ControlSource ="Land"
                    FontName ="Arial"

                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =1305
            Name ="Det"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Width =10149
                    Height =225
                    FontSize =10
                    Name ="BemKontakt1"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Width =10149
                    Height =1305
                    FontSize =10
                    TabIndex =1
                    Name ="RT"
                    FontName ="Arial"
                    TextFormat =1

                    LayoutCachedWidth =10149
                    LayoutCachedHeight =1305
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =1687
            BreakLevel =2
            Name ="GF"
            Begin
                Begin TextBox
                    TextFontFamily =34
                    Top =226
                    Width =7326
                    Height =270
                    FontSize =10
                    TabIndex =1
                    Name ="GrussLg"
                    ControlSource ="=lg([Gruss])"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    IMESentenceMode =3
                    Top =1417
                    Width =4761
                    Height =270
                    FontSize =10
                    Name ="Mitarbeiter"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =496
                    Width =7320
                    Height =270
                    FontSize =10
                    TabIndex =2
                    Name ="TX_EFName"
                    FontName ="Arial"

                End
                Begin Image
                    SizeMode =3
                    PictureAlignment =3
                    Top =793
                    Width =4755
                    Height =570
                    Name ="UnterschriftPic"

                    TabIndex =3
                End
            End
        End
        Begin BreakFooter
            CanGrow = NotDefault
            Height =335
            BreakLevel =1
            OnFormat ="[Event Procedure]"
            Name ="GFCC"
            Begin
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1531
                    Top =135
                    Width =8730
                    Height =45
                    FontSize =10
                    Name ="CC"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Left =1531
                    Top =225
                    Width =8730
                    Height =45
                    FontSize =10
                    TabIndex =1
                    Name ="Attachment"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =120
                    Width =1418
                    Height =60
                    FontSize =10
                    TabIndex =2
                    Name ="TxtCC"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =210
                    Width =1418
                    Height =60
                    FontSize =10
                    TabIndex =3
                    Name ="TxtAttachment"
                    FontName ="Arial"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextFontFamily =34
                    Top =305
                    Width =10260
                    Height =30
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="txtPS"
                    FontName ="Arial"

                End
            End
        End
        Begin BreakFooter
            CanGrow = NotDefault
            ForceNewPage =2
            Height =0
            Name ="gfSortGroup"
        End
        Begin PageFooter
            Height =1355
            Name ="PF"
            Begin
                Begin Image
                    SizeMode =3
                    Top =223
                    Width =2532
                    Height =1075
                    Name ="LogoSeiteU"

                    TabIndex =1
                End
                Begin TextBox
                    BorderWidth =0
                    TextFontFamily =34
                    BackStyle =0
                    Width =10320
                    Height =225
                    FontSize =8
                    Name ="ctlGrpPages"
                    FontName ="Arial"

                End
            End
        End
    End
End
CodeBehindForm
' See "B_Brief.cls"
