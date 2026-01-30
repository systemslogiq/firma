Version =20
VersionRequired =20
Begin Report
    DefaultView =0
    AllowUpdating =4
    GridY =10
    Width =10208
    ItemSuffix =120
    OnNoData ="[Event Procedure]"
    RecSrcDt = Begin
        0xbc634fd69c18e540
    End
    Caption ="Übersicht"
    OnOpen ="[Event Procedure]"
    OnDblClick ="[Ereignisprozedur]"
    FilterOnLoad =0
    AllowLayoutView =0
    RibbonName ="tlbOH"
    Begin
        Begin Label
            TextFontFamily =18
            FontSize =10
            BackColor =12632256
            FontName ="Times New Roman"
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
        Begin OptionButton
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =187
            Height =187
        End
        Begin CheckBox
            AutoLabel = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
            Width =187
            Height =187
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =264
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin ListBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
        End
        Begin ComboBox
            AutoLabel = NotDefault
            TextFontFamily =18
            BorderLineStyle =0
            Width =1701
            Height =264
            LabelX =-1701
            FontSize =10
            FontName ="Times New Roman"
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
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="NrFunktion"
        End
        Begin BreakLevel
            SortOrder = NotDefault
            ControlSource ="VGdatum"
        End
        Begin PageHeader
            Height =737
            OnFormat ="[Event Procedure]"
            Name ="ph"
            Begin
                Begin TextBox
                    TextAlign =1
                    Left =4
                    Width =10200
                    Height =690
                    ColumnOrder =3
                    FontSize =14
                    FontWeight =700
                    TabIndex =3
                    BackColor =12632256
                    BorderColor =255
                    Name ="rptTitel"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    Left =8163
                    Width =1700
                    Height =340
                    ColumnOrder =0
                    FontSize =8
                    Name ="Feld38"
                    ControlSource ="=\"Seite \" & [Page] & \" von \" & [Pages]"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    Left =9184
                    Top =340
                    Width =680
                    Height =225
                    ColumnOrder =1
                    FontSize =8
                    TabIndex =1
                    Name ="Feld39"
                    ControlSource ="=Now()"
                    Format ="Short Time"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    Left =8163
                    Top =340
                    Width =905
                    Height =225
                    ColumnOrder =2
                    FontSize =8
                    TabIndex =2
                    Name ="Feld40"
                    ControlSource ="=Now()"
                    Format ="Short Date"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    Left =60
                    Top =315
                    Width =10041
                    Height =375
                    ColumnOrder =4
                    FontSize =14
                    TabIndex =4
                    Name ="Vornachname"
                    ControlSource ="=[Vorname] & \" \" & [NAchname]"

                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =5819
            OnFormat ="[Event Procedure]"
            Name ="GKFun"
            Begin
                Begin TextBox
                    TextAlign =2
                    Left =1137
                    Width =1356
                    FontWeight =700
                    BackColor =10092543
                    Name ="NrAdresse"
                    ControlSource ="IDAdresse"

                End
                Begin TextBox
                    Left =1133
                    Top =310
                    Width =2835
                    TabIndex =1
                    Name ="Vorname"
                    ControlSource ="Vorname"

                End
                Begin TextBox
                    Left =1133
                    Top =620
                    Width =2835
                    ColumnWidth =3570
                    TabIndex =2
                    Name ="Nachname"
                    ControlSource ="Nachname"

                End
                Begin TextBox
                    Left =1133
                    Top =930
                    Width =2835
                    TabIndex =3
                    Name ="Rufname"
                    ControlSource ="Rufname"

                End
                Begin TextBox
                    Left =1984
                    Top =1550
                    Width =1986
                    TabIndex =4
                    Name ="Titel"
                    ControlSource ="Titel"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =1133
                    Top =1860
                    Width =2841
                    TabIndex =5
                    Name ="Beruf"
                    ControlSource ="Beruf"
                    StatusBarText ="Berufsbezeichnung/Branche"

                End
                Begin TextBox
                    Left =1133
                    Top =1240
                    Width =786
                    TabIndex =6
                    Name ="Kurzzeichen"
                    ControlSource ="Kurzzeichen"
                    StatusBarText ="Kurzzeichen des Mitarbeiters"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =1133
                    Top =2490
                    Width =2841
                    Height =564
                    TabIndex =7
                    Name ="PostAdr"
                    ControlSource ="PostAdr"

                End
                Begin TextBox
                    TextAlign =1
                    Left =1133
                    Top =2170
                    Width =2841
                    TabIndex =8
                    Name ="Geb"
                    ControlSource ="GebTag"
                    Format ="dd/mm/yy"

                End
                Begin TextBox
                    TextFontFamily =34
                    Left =1137
                    Top =5555
                    Width =1251
                    FontSize =8
                    TabIndex =9
                    Name ="AdresseErfasst"
                    ControlSource ="AdresseErfasst"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    Left =1133
                    Top =3100
                    Width =2841
                    TabIndex =10
                    Name ="Unterschrift"
                    ControlSource ="Unterschrift"
                    StatusBarText ="ppa / iV"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =5657
                    Top =310
                    Width =4551
                    Height =549
                    FontWeight =700
                    TabIndex =11
                    Name ="Firma"
                    ControlSource ="=[FirmaName] & \"\015\012\" & [FirmaPostAdr]"

                End
                Begin TextBox
                    TextAlign =2
                    Left =8152
                    Width =1356
                    FontWeight =700
                    TabIndex =12
                    BackColor =10092543
                    Name ="NrFunktion"
                    ControlSource ="NrFunktion"

                End
                Begin TextBox
                    TextAlign =2
                    Left =5657
                    Width =1356
                    FontWeight =700
                    TabIndex =13
                    BackColor =10092543
                    Name ="NrAdrZuord"
                    ControlSource ="NrAdrZuord"

                End
                Begin TextBox
                    Left =9116
                    Top =918
                    Width =1086
                    TabIndex =14
                    Name ="FunktionNr"
                    ControlSource ="FunktionNr"

                End
                Begin TextBox
                    Left =5657
                    Top =917
                    Width =3396
                    ColumnWidth =2295
                    TabIndex =15
                    Name ="Funktion"
                    ControlSource ="Funktion"

                End
                Begin TextBox
                    Left =5657
                    Top =1229
                    Width =4551
                    ColumnWidth =2250
                    TabIndex =16
                    Name ="Abteil"
                    ControlSource ="Abteil"
                    StatusBarText ="Abteilung"

                End
                Begin TextBox
                    Left =5657
                    Top =1541
                    Width =4551
                    TabIndex =17
                    Name ="BauBuero"
                    ControlSource ="BauBuero"

                End
                Begin TextBox
                    Left =5657
                    Top =1853
                    Width =4551
                    TabIndex =18
                    Name ="Telefon"
                    ControlSource ="Telefon"
                    StatusBarText ="Telefon"

                End
                Begin TextBox
                    Left =5657
                    Top =2165
                    Width =4551
                    TabIndex =19
                    Name ="Fax"
                    ControlSource ="Fax"
                    StatusBarText ="Fax"

                End
                Begin TextBox
                    Left =5657
                    Top =2789
                    Width =4551
                    TabIndex =20
                    Name ="www"
                    ControlSource ="=hyperlinkpart([Internet],2)"

                End
                Begin TextBox
                    TextAlign =1
                    Left =5657
                    Top =3101
                    Width =4551
                    TabIndex =21
                    Name ="Mobil"
                    ControlSource ="Mobil"

                End
                Begin TextBox
                    Left =5657
                    Top =2477
                    Width =4551
                    TabIndex =22
                    Name ="Email"
                    ControlSource ="Email"

                End
                Begin TextBox
                    Left =5657
                    Top =3413
                    Width =1251
                    TabIndex =23
                    Name ="StartFunktion"
                    ControlSource ="StartFunktion"
                    Format ="dd/mm/yy"

                End
                Begin TextBox
                    Left =6908
                    Top =3413
                    Width =1251
                    TabIndex =24
                    Name ="EndeFunktion"
                    ControlSource ="EndeFunktion"
                    Format ="dd/mm/yy"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =5657
                    Top =4090
                    Width =4551
                    Height =459
                    TabIndex =25
                    Name ="Bem"
                    ControlSource ="=[BemAdresse] & \" \" & [BemFunktion]"
                    TextFormat =1

                End
                Begin TextBox
                    TextFontFamily =34
                    Left =2441
                    Top =5555
                    FontSize =8
                    TabIndex =26
                    Name ="FunktionErfasst"
                    ControlSource ="FunktionErfasst"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    TextAlign =1
                    Left =5657
                    Top =3753
                    Width =4551
                    TabIndex =27
                    Name ="Update"
                    ControlSource ="=[LastUpdate] & \" \" & [WhoUpdate]"
                    Format ="General Date"
                    StatusBarText ="Last update of table"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    Left =5657
                    Top =4585
                    Width =4551
                    Height =1194
                    TabIndex =28
                    Name ="Stich"
                    ControlSource ="Stich"

                End
                Begin TextBox
                    Left =1133
                    Top =1550
                    Width =786
                    TabIndex =29
                    Name ="artadresse"
                    ControlSource ="artadresse"

                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld82"
                    Caption ="ID-Adresse"
                End
                Begin Label
                    BackStyle =0
                    Left =7075
                    Width =1005
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld83"
                    Caption ="ID-Funktion"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =310
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld86"
                    Caption ="Vorname"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =620
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld87"
                    Caption ="Nachname"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =930
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld88"
                    Caption ="Rufname"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =1240
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld89"
                    Caption ="Kurzzeichen"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =1550
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld90"
                    Caption ="Art / Titel"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =2170
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld93"
                    Caption ="Geburtstag"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =2480
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld94"
                    Caption ="Adresse"
                End
                Begin Label
                    BackStyle =0
                    Left =-4
                    Top =3100
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld96"
                    Caption ="Unterschrift"
                End
                Begin Label
                    BackStyle =0
                    Top =3405
                    Width =1080
                    Height =630
                    FontSize =8
                    Name ="Bezeichnungsfeld97"
                    Caption ="Bild / Logo / Unterschrift"
                End
                Begin Label
                    BackStyle =0
                    Top =5555
                    Width =1065
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld98"
                    Caption ="erfasst"
                End
                Begin Label
                    BackStyle =0
                    TextAlign =2
                    Left =1966
                    Top =1240
                    Width =645
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld100"
                    Caption ="per Du"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld101"
                    Caption ="ID-Adresse"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =310
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld102"
                    Caption ="Zuordnung"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =915
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld103"
                    Caption ="Funktion"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =1225
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld104"
                    Caption ="Abteilung"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =1535
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld105"
                    Caption ="Bau / Büro"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =1845
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld106"
                    Caption ="Telefon"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =2155
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld107"
                    Caption ="Fax"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =2465
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld108"
                    Caption ="eMail"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =2775
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld109"
                    Caption ="WWW"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =3085
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld110"
                    Caption ="Handy"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =3395
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld111"
                    Caption ="Start / Ende"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =3753
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld112"
                    Caption ="letzte Änderung"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =4585
                    Width =1275
                    Height =255
                    FontSize =8
                    Name ="Bezeichnungsfeld113"
                    Caption ="Stichworte"
                End
                Begin Label
                    BackStyle =0
                    Left =4305
                    Top =4090
                    Width =1275
                    Height =435
                    FontSize =8
                    Name ="Bezeichnungsfeld114"
                    Caption ="Bemerkungen"
                End
                Begin Image
                    SizeMode =3
                    Left =1133
                    Top =3401
                    Width =2847
                    Height =2050
                    Name ="Pic"

                    TabIndex =32
                End
                Begin TextBox
                    Left =2608
                    Top =1240
                    Width =1371
                    TabIndex =30
                    Name ="Du"
                    ControlSource ="Du"
                    StatusBarText ="Kurzzeichen des Mitarbeiters"

                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =-4
                    Top =1860
                    Width =1065
                    Height =255
                    FontSize =8
                    TabIndex =31
                    BackColor =12632256
                    Name ="lblBeruf"
                    ControlSource ="lblBeruf"

                    LayoutCachedLeft =-4
                    LayoutCachedTop =1860
                    LayoutCachedWidth =1061
                    LayoutCachedHeight =2115
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =255
            OnFormat ="[Event Procedure]"
            Name ="Det"
            Begin
                Begin Line
                    Width =10179
                    Name ="LinieDetail"
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    Width =1140
                    Height =255
                    ColumnWidth =324
                    FontSize =8
                    Name ="Nummer"
                    ControlSource ="Nummer"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =0
                    BackStyle =0
                    Left =1134
                    Width =5670
                    Height =255
                    ColumnWidth =3576
                    FontSize =8
                    TabIndex =1
                    Name ="VGt"
                    ControlSource ="VGt"

                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    BackStyle =0
                    Left =9069
                    Width =1137
                    Height =255
                    FontSize =8
                    TabIndex =2
                    Name ="Feld24"
                    ControlSource ="VGdatum"
                    Format ="dd/mm/yy"

                End
                Begin TextBox
                    CanGrow = NotDefault
                    OldBorderStyle =0
                    BackStyle =0
                    Left =6812
                    Width =2265
                    Height =255
                    FontSize =8
                    TabIndex =3
                    Name ="VGStatus"
                    ControlSource ="VGStatus"

                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            ForceNewPage =2
            Height =0
            Name ="Gruppenfuß2gf"
        End
        Begin PageFooter
            Height =0
            Name ="pf"
        End
    End
End
CodeBehindForm
' See "B_Info.cls"
