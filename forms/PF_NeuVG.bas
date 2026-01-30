Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    AllowUpdating =2
    ScrollBars =0
    ViewsAllowed =1
    TabularFamily =18
    BorderStyle =3
    GridX =20
    GridY =20
    Width =5100
    DatasheetFontHeight =12
    ItemSuffix =243
    Left =3855
    Top =3030
    Right =21915
    Bottom =15015
    RecSrcDt = Begin
        0x04dccbb63ac9e140
    End
    Caption ="Vorgänge erstellen / kopieren für IB OH"
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Times New Roman"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    AllowLayoutView =0
    Begin
        Begin Label
            BackStyle =0
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
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =8
            FontWeight =400
            ForeColor =-2147483630
            FontName ="MS Sans Serif"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin TextBox
            AutoLabel = NotDefault
            OldBorderStyle =0
            TextFontFamily =18
            BorderLineStyle =0
            Width =4305
            Height =264
            LabelX =-793
            FontSize =10
            BackColor =12632256
            FontName ="Times New Roman"
        End
        Begin ListBox
            SpecialEffect =2
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
        End
        Begin ComboBox
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
        End
        Begin UnboundObjectFrame
            SpecialEffect =2
            OldBorderStyle =1
            Width =4536
            Height =2835
        End
        Begin CustomControl
            SpecialEffect =2
            Width =4536
            Height =2835
        End
        Begin Section
            CanGrow = NotDefault
            Height =8100
            BackColor =12632256
            Name ="det"
            Begin
                Begin OptionGroup
                    OverlapFlags =93
                    Left =64
                    Top =30
                    Width =5036
                    Height =6585
                    Name ="ogVG"

                    LayoutCachedLeft =64
                    LayoutCachedTop =30
                    LayoutCachedWidth =5100
                    LayoutCachedHeight =6615
                End
                Begin CommandButton
                    OverlapFlags =93
                    Left =139
                    Top =7071
                    Width =3576
                    Height =340
                    FontWeight =700
                    TabIndex =24
                    ForeColor =32768
                    Name ="btnOk"
                    Caption ="F7: erstelle Neuen Vorgang (Kopiere)"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Erstelle den neuen Vorgang\015\012Der neue Vorgang wird in der Liste  angezeigt"

                    LayoutCachedLeft =139
                    LayoutCachedTop =7071
                    LayoutCachedWidth =3715
                    LayoutCachedHeight =7411
                    Overlaps =1
                End
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =87
                    Left =3715
                    Top =7071
                    Width =1086
                    Height =340
                    TabIndex =36
                    ForeColor =0
                    Name ="btnEscape"
                    Caption ="abbrechen"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="abbrechen"

                    LayoutCachedLeft =3715
                    LayoutCachedTop =7071
                    LayoutCachedWidth =4801
                    LayoutCachedHeight =7411
                    Overlaps =1
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =223
                    TextFontFamily =34
                    Left =2607
                    Top =1247
                    Width =765
                    Height =255
                    FontSize =8
                    TabIndex =31
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="NrVG"
                    FontName ="Arial"

                    LayoutCachedLeft =2607
                    LayoutCachedTop =1247
                    LayoutCachedWidth =3372
                    LayoutCachedHeight =1502
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =315
                    Top =5618
                    TabIndex =27
                    Name ="OVG"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"

                    LayoutCachedLeft =315
                    LayoutCachedTop =5618
                    LayoutCachedWidth =575
                    LayoutCachedHeight =5858
                End
                Begin OptionButton
                    OverlapFlags =215
                    Left =173
                    Top =930
                    TabIndex =9
                    Name ="OAdr"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="-1"

                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =255
                    TextAlign =1
                    TextFontFamily =34
                    BackStyle =0
                    Left =1370
                    Top =821
                    Width =3225
                    Height =939
                    FontWeight =700
                    TabIndex =6
                    BackColor =13884874
                    Name ="txtAdr"
                    FontName ="Arial Narrow"

                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =223
                    BackStyle =0
                    Left =797
                    Top =5618
                    Width =3930
                    FontWeight =700
                    TabIndex =28
                    BackColor =13884874
                    Name ="TxtVG"

                    LayoutCachedLeft =797
                    LayoutCachedTop =5618
                    LayoutCachedWidth =4727
                    LayoutCachedHeight =5882
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =454
                    Top =5893
                    TabIndex =29
                    Name ="OmitArtikel"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="-1"

                    LayoutCachedLeft =454
                    LayoutCachedTop =5893
                    LayoutCachedWidth =714
                    LayoutCachedHeight =6133
                    Begin
                        Begin Label
                            OverlapFlags =223
                            Left =789
                            Top =5893
                            Width =1470
                            Height =240
                            Name ="B4"
                            Caption ="mit Artikel"
                            LayoutCachedLeft =789
                            LayoutCachedTop =5893
                            LayoutCachedWidth =2259
                            LayoutCachedHeight =6133
                        End
                    End
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =454
                    Top =6135
                    TabIndex =32
                    Name ="OmitBem"
                    DefaultValue ="0"

                    LayoutCachedLeft =454
                    LayoutCachedTop =6135
                    LayoutCachedWidth =714
                    LayoutCachedHeight =6375
                    Begin
                        Begin Label
                            OverlapFlags =215
                            Left =795
                            Top =6126
                            Width =1350
                            Height =240
                            BackColor =12632256
                            Name ="B6"
                            Caption ="mit Bemerkungen"
                            LayoutCachedLeft =795
                            LayoutCachedTop =6126
                            LayoutCachedWidth =2145
                            LayoutCachedHeight =6366
                        End
                    End
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =454
                    Top =6377
                    TabIndex =33
                    Name ="OmitStichwort"
                    DefaultValue ="0"

                    LayoutCachedLeft =454
                    LayoutCachedTop =6377
                    LayoutCachedWidth =714
                    LayoutCachedHeight =6617
                    Begin
                        Begin Label
                            OverlapFlags =223
                            Left =796
                            Top =6380
                            Width =1695
                            Height =240
                            BackColor =12632256
                            Name ="B7"
                            Caption ="mit Stichworten / Links"
                            LayoutCachedLeft =796
                            LayoutCachedTop =6380
                            LayoutCachedWidth =2491
                            LayoutCachedHeight =6620
                        End
                    End
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =454
                    Top =6619
                    Height =270
                    TabIndex =35
                    Name ="oMitTeilnehmer"
                    DefaultValue ="0"

                    LayoutCachedLeft =454
                    LayoutCachedTop =6619
                    LayoutCachedWidth =714
                    LayoutCachedHeight =6889
                    Begin
                        Begin Label
                            OverlapFlags =87
                            Left =796
                            Top =6620
                            Width =1995
                            Height =240
                            BackColor =12632256
                            Name ="Bezeichnungsfeld199"
                            Caption ="mit Beteiligten/Teilnehmern"
                            LayoutCachedLeft =796
                            LayoutCachedTop =6620
                            LayoutCachedWidth =2791
                            LayoutCachedHeight =6860
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =215
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =2835
                    Left =2079
                    Top =501
                    Width =2759
                    Height =255
                    FontWeight =700
                    TabIndex =4
                    BackColor =10092543
                    Name ="NrQK"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2268"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="23"
                    FontName ="Arial"
                    ControlTipText ="Bezeichnung, Art des Vorganges"

                End
                Begin OptionButton
                    OverlapFlags =215
                    Left =173
                    Top =514
                    TabIndex =5
                    Name ="ONeu"
                    AfterUpdate ="[Event Procedure]"

                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =423
                            Top =506
                            Width =1590
                            Height =240
                            FontWeight =700
                            Name ="B1"
                            Caption ="neu (keine Kopie)"
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextFontFamily =34
                    Left =3458
                    Top =1247
                    Width =765
                    Height =255
                    FontSize =8
                    TabIndex =34
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="Land"
                    FontName ="Arial"

                    LayoutCachedLeft =3458
                    LayoutCachedTop =1247
                    LayoutCachedWidth =4223
                    LayoutCachedHeight =1502
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextFontFamily =34
                    Left =1729
                    Top =1247
                    Width =765
                    Height =255
                    FontSize =8
                    TabIndex =26
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="NrFirma"
                    FontName ="Arial"

                    LayoutCachedLeft =1729
                    LayoutCachedTop =1247
                    LayoutCachedWidth =2494
                    LayoutCachedHeight =1502
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =2895
                    Top =5886
                    Height =270
                    TabIndex =30
                    Name ="OmitTechDat"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"

                    LayoutCachedLeft =2895
                    LayoutCachedTop =5886
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =6156
                    Begin
                        Begin Label
                            OverlapFlags =215
                            Left =3234
                            Top =5886
                            Width =1470
                            Height =240
                            BackColor =12632256
                            Name ="Bezeichnungsfeld206"
                            Caption ="mit techn. Daten"
                            LayoutCachedLeft =3234
                            LayoutCachedTop =5886
                            LayoutCachedWidth =4704
                            LayoutCachedHeight =6126
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =215
                    TextAlign =1
                    ColumnCount =6
                    ListRows =30
                    ListWidth =8791
                    Left =4599
                    Top =821
                    Width =239
                    Height =255
                    TabIndex =7
                    BackColor =10092543
                    Name ="NrFunktion"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;2835;2835;2835;0;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    DefaultValue ="23"
                    FontName ="Arial"
                    ControlTipText ="Auswahl Ansprechpartner"

                End
                Begin ComboBox
                    LimitToList = NotDefault
                    Visible = NotDefault
                    OverlapFlags =223
                    TextAlign =1
                    ColumnCount =7
                    ListRows =20
                    ListWidth =6237
                    Left =4559
                    Top =170
                    Width =279
                    Height =255
                    TabIndex =3
                    BackColor =10092543
                    Name ="NrMitarbeiter"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1134;1423;3402;0;0;0"
                    ValidationRule ="Is Not Null"
                    ValidationText ="\"bitte ausfüllen\""
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Verantwortlicher Mitarbeiter"

                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    DisplayWhen =2
                    OverlapFlags =223
                    TextAlign =2
                    ColumnCount =8
                    ListRows =30
                    ListWidth =10206
                    Left =4583
                    Top =4221
                    Width =255
                    Height =255
                    FontWeight =700
                    TabIndex =19
                    BackColor =16776960
                    Name ="comVGID"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="856;3687;3687;0;856;856;0;0"
                    AfterUpdate ="[Event Procedure]"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ID des Vorganges (zum Auswählen und Ändern)"

                    LayoutCachedLeft =4583
                    LayoutCachedTop =4221
                    LayoutCachedWidth =4838
                    LayoutCachedHeight =4476
                    ForeThemeColorIndex =0
                End
                Begin OptionGroup
                    OverlapFlags =255
                    Left =60
                    Top =3495
                    Width =5036
                    Height =2091
                    TabIndex =14
                    Name ="OGVGID"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="-1"

                    LayoutCachedLeft =60
                    LayoutCachedTop =3495
                    LayoutCachedWidth =5096
                    LayoutCachedHeight =5586
                    Begin
                        Begin OptionButton
                            OverlapFlags =247
                            Left =120
                            Top =3981
                            OptionValue =1
                            Name ="OVGID"
                            AfterUpdate ="[Event Procedure]"
                            DefaultValue ="-1"

                            LayoutCachedLeft =120
                            LayoutCachedTop =3981
                            LayoutCachedWidth =380
                            LayoutCachedHeight =4221
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =350
                                    Top =3951
                                    Width =4530
                                    Height =255
                                    FontWeight =700
                                    BackColor =13884874
                                    Name ="lblVGID"
                                    Caption ="Click, um ein Projekt anzuwählen (blaues Feld)"
                                    FontName ="Arial"
                                    LayoutCachedLeft =350
                                    LayoutCachedTop =3951
                                    LayoutCachedWidth =4880
                                    LayoutCachedHeight =4206
                                    ForeThemeColorIndex =0
                                End
                            End
                        End
                        Begin OptionButton
                            OverlapFlags =247
                            Left =120
                            Top =4976
                            OptionValue =0
                            Name ="OVGIDNeu"
                            DefaultValue ="-1"

                            LayoutCachedLeft =120
                            LayoutCachedTop =4976
                            LayoutCachedWidth =380
                            LayoutCachedHeight =5216
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =350
                                    Top =4946
                                    Width =2970
                                    Height =255
                                    FontWeight =700
                                    BackColor =13884874
                                    Name ="lblNeuVGID"
                                    Caption ="neues Projekt mit ID:"
                                    FontName ="Arial"
                                    LayoutCachedLeft =350
                                    LayoutCachedTop =4946
                                    LayoutCachedWidth =3320
                                    LayoutCachedHeight =5201
                                    ForeThemeColorIndex =0
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =3447
                    Top =4935
                    Width =1395
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =22
                    BackColor =16763904
                    Name ="VGIDNeu"
                    FontName ="Arial"
                    ControlTipText ="ID des Vorganges (zum Auswählen und Ändern)"

                    LayoutCachedLeft =3447
                    LayoutCachedTop =4935
                    LayoutCachedWidth =4842
                    LayoutCachedHeight =5190
                    ForeThemeColorIndex =0
                End
                Begin ComboBox
                    OverlapFlags =255
                    IMESentenceMode =3
                    ListRows =30
                    ListWidth =4536
                    Left =4830
                    Top =5226
                    Width =255
                    Height =255
                    FontWeight =700
                    TabIndex =25
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="comVG"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="4254"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Projektname (Liste aller bisher erfassten Titel)"

                    LayoutCachedLeft =4830
                    LayoutCachedTop =5226
                    LayoutCachedWidth =5085
                    LayoutCachedHeight =5481
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =450
                    Top =825
                    Width =861
                    Height =636
                    TabIndex =8
                    ForeColor =0
                    Name ="btnNavigator"
                    Caption ="ändere Partner"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="zeigt Adressen-Auswahl"

                    Overlaps =1
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =247
                    TextAlign =2
                    ListRows =30
                    ListWidth =567
                    Left =3443
                    Top =4536
                    Width =1395
                    Height =255
                    FontWeight =700
                    TabIndex =21
                    BackColor =16776960
                    Name ="VGIDu"
                    RowSourceType ="Value List"
                    RowSource ="1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30"
                        ";31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49;50;51;52;53;54;55;56;5"
                        "7;58;59;60;61;62;63;64;65;66;67;68;69;70;71;72;73;74;75;76;77;78;79;80;81;82;83;"
                        "84;85;86;87;88;89;90;91;92;93;94;95;96;97;98;99;100;101;102;103;104;105;106;107;"
                        "108;109;110;111;112;113;114;115;116;117;118;119;120;121;122;123;124;125;126;127;"
                        "128;129;130;131;132;133;134;135;136;137;138;139;140;141;142;143;144;145;146;147;"
                        "148;149;150;151;152;153;154;155;156;157;158;159;160;161;162;163;164;165;166;167;"
                        "168;169;170;171;172;173;174;175;176;177;178;179;180;181;182;183;184;185;186;187;"
                        "188;189;190;191;192;193;194;195;196;197;198;199;200;201;202;203;204;205;206;207;"
                        "208;209;210;211;212;213;214;215;216;217;218;219;220;221;222;223;224;225;226;227;"
                        "228;229;230;231;232;233;234;235;236;237;238;239;240;241;242;243;244;245;246;247;"
                        "248;249;250;251;252;253;254;255;256;257;258;259;260;261;262;263;264;265;266;267;"
                        "268;269;270;271;272;273;274;275;276;277;278;279;280;281;282;283;284;285;286;287;"
                        "288;289;290;291;292;293;294;295;296;297;298;299;300"
                    ColumnWidths ="567"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Projekt-Unternummer; mit Doppelklick umschalten zwischen bestehender und neuer U"
                        "nternummer"
                    Format ="00"

                    LayoutCachedLeft =3443
                    LayoutCachedTop =4536
                    LayoutCachedWidth =4838
                    LayoutCachedHeight =4791
                    ForeThemeColorIndex =0
                End
                Begin CommandButton
                    OverlapFlags =255
                    Left =450
                    Top =4527
                    Width =2736
                    Height =321
                    TabIndex =20
                    Name ="btnVGIDu"
                    Caption ="berechne nächste Unter-Nr."
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="berechne die nächst grössere Unternummer zum aktuellen Projekt"

                    LayoutCachedLeft =450
                    LayoutCachedTop =4527
                    LayoutCachedWidth =3186
                    LayoutCachedHeight =4848
                    ForeThemeColorIndex =0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =450
                    Top =113
                    Width =1341
                    Height =321
                    TabIndex =1
                    ForeColor =0
                    Name ="btnNrMitarbeiter"
                    Caption ="ändere Mandant"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="Öffne Mandantenliste, um den Mandant zu ändern"

                    Overlaps =1
                End
                Begin TextBox
                    Locked = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =215
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2068
                    Top =170
                    Width =2499
                    Height =255
                    FontSize =8
                    TabIndex =2
                    BackColor =10092543
                    Name ="Mitarbeiter"
                    ValidationRule ="Is Not Null"
                    FontName ="Arial"
                    ControlTipText ="Verantwortlicher Mitarbeiter"

                    LayoutCachedLeft =2068
                    LayoutCachedTop =170
                    LayoutCachedWidth =4567
                    LayoutCachedHeight =425
                End
                Begin TextBox
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =3442
                    Top =4221
                    Width =1125
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =18
                    BackColor =16776960
                    Name ="vgid"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="ID des Vorganges (zum Auswählen und Ändern)"

                    LayoutCachedLeft =3442
                    LayoutCachedTop =4221
                    LayoutCachedWidth =4567
                    LayoutCachedHeight =4476
                    ForeThemeColorIndex =0
                End
                Begin TextBox
                    AutoTab = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =255
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =570
                    Top =5220
                    Width =4013
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =23
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="VG"
                    FontName ="Arial"
                    ControlTipText ="Projektname"

                    LayoutCachedLeft =570
                    LayoutCachedTop =5220
                    LayoutCachedWidth =4583
                    LayoutCachedHeight =5475
                End
                Begin CommandButton
                    OverlapFlags =247
                    Left =1935
                    Top =4206
                    Width =1251
                    Height =321
                    TabIndex =17
                    Name ="btncomVGID"
                    Caption ="ändere Projekt"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt Projektliste und ändert die Projekt-Nr."

                    LayoutCachedLeft =1935
                    LayoutCachedTop =4206
                    LayoutCachedWidth =3186
                    LayoutCachedHeight =4527
                    ForeThemeColorIndex =0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =247
                    Left =450
                    Top =4206
                    Width =1341
                    Height =321
                    TabIndex =16
                    Name ="btncomNrVG"
                    Caption ="ändere Vorgang"
                    OnClick ="[Event Procedure]"
                    FontName ="Arial"
                    ControlTipText ="zeigt Projektliste und nimmt den letzten Vorgang des Projektes als Kopie-Grundla"
                        "ge"

                    LayoutCachedLeft =450
                    LayoutCachedTop =4206
                    LayoutCachedWidth =1791
                    LayoutCachedHeight =4527
                    ForeThemeColorIndex =0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    Overlaps =1
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =215
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =3457
                    Top =2195
                    Width =1110
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =11
                    BackColor =10092543
                    Name ="VGDatum"
                    Format ="dd/mm/yy"
                    DefaultValue ="Date()"
                    FontName ="Arial"
                    ControlTipText ="Datum des Vorganges (Standardwert : Heute)"

                    LayoutCachedLeft =3457
                    LayoutCachedTop =2195
                    LayoutCachedWidth =4567
                    LayoutCachedHeight =2450
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =3
                            Left =375
                            Top =2202
                            Width =2970
                            Height =255
                            FontWeight =700
                            BackColor =13884874
                            Name ="lblVGDatum"
                            Caption ="Datum des Vorganges"
                            FontName ="Arial"
                            LayoutCachedLeft =375
                            LayoutCachedTop =2202
                            LayoutCachedWidth =3345
                            LayoutCachedHeight =2457
                            ForeThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =247
                    TextAlign =2
                    IMESentenceMode =3
                    ColumnCount =2
                    ListRows =30
                    ListWidth =1134
                    Left =3450
                    Top =3598
                    Width =1395
                    Height =255
                    FontWeight =700
                    TabIndex =15
                    BackColor =10092543
                    Name ="VGWährung"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567;567"
                    FontName ="Arial"
                    ControlTipText ="Währung ändern"

                    LayoutCachedLeft =3450
                    LayoutCachedTop =3598
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =3853
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =247
                            TextAlign =3
                            Left =368
                            Top =3605
                            Width =2970
                            Height =255
                            FontWeight =700
                            BackColor =12632256
                            Name ="lblWährung"
                            Caption ="Währung"
                            FontName ="Arial"
                            LayoutCachedLeft =368
                            LayoutCachedTop =3605
                            LayoutCachedWidth =3338
                            LayoutCachedHeight =3860
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =215
                    Left =4599
                    Top =2145
                    Width =254
                    Height =330
                    AutoActivate =1
                    TabIndex =10
                    Name ="SpinButtonVGDatum"
                    OleData = Begin
                        0x000e0000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000020000000000000000100000 ,
                        0x0400000001000000feffffff0000000003000000ffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff01000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000801810513688c8010700000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000007a000000 ,
                        0x0000000003004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x00000000fefffffffdfffffffffffffffffffffffffffffffffffffffeffffff ,
                        0xfeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff01000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000508e353c3009d4010500000000010000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000300000018000000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000078000000 ,
                        0x0000000003004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x00000000fffffffffffffffffefffffffdfffffffefffffffeffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffeffffff02000000fefffffffeffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff38000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000042757474 ,
                        0x6f6e00100100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000b65 ,
                        0xfc0b0b6500021400880800006400000000000000c001000046020000340c0b65 ,
                        0x3c0c0b65440c0b654c0c0b65540c0b655c0c0b65640c0b656c0c0b65740c0b65 ,
                        0x7c0c0b65840c0b658c0c0b65940c0b659c0c0b65a40c0b65ac0c0b65b40c0b65 ,
                        0xbc0c0b65c40c0b65cc0c0b65d40c0b65dc0c0b65e40c0b65ec0c0b65f40c0b65 ,
                        0xfc0c0b65040d0b650c0d0b65140d0b651c0d0b65240d0b652c0d0b65340d0b65 ,
                        0x3c0d0b65440d0b654c0d0b65540d0b655c0d0b65640d0b656c0d0b65740d0b65 ,
                        0x7c0d0b65840d0b658c0d0b65940d0b659c0d0b65a40d0b65ac0d0b65b40d0b65 ,
                        0xbc0d0b65c40d0b65cc0d0b65d40d0b65dc0d0b65e40d0b65ec0d0b65f40d0b65 ,
                        0xfc0d0b65040e0b650c0e0b65140e0b651c0e0b65240e0b652c0e0b65340e0b65 ,
                        0x3c0e0b65440e0b654c0e0b65540e0b655c0e0b65640e0b656c0e0b65740e0b65 ,
                        0x7c0e0b6500000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =4599
                    LayoutCachedTop =2145
                    LayoutCachedWidth =4853
                    LayoutCachedHeight =2475
                End
                Begin Label
                    Visible = NotDefault
                    BackStyle =1
                    OverlapFlags =93
                    TextAlign =2
                    Left =64
                    Top =7533
                    Width =4886
                    Height =567
                    FontWeight =700
                    BackColor =255
                    ForeColor =10092543
                    Name ="lblAchtung"
                    Caption ="Achtung"
                    FontName ="Arial"
                    ControlTipText ="Stichwort \"Achtung\" bei Firma hinterlegt"
                    LayoutCachedLeft =64
                    LayoutCachedTop =7533
                    LayoutCachedWidth =4950
                    LayoutCachedHeight =8100
                End
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    ListRows =30
                    ListWidth =4536
                    Left =4583
                    Top =5220
                    Width =255
                    Height =255
                    FontWeight =700
                    TabIndex =37
                    BackColor =10092543
                    BorderColor =4210752
                    Name ="comVGL"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="4255"
                    AfterUpdate ="[Event Procedure]"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Projektname (Liste der im Lexikon unter Gruppe <Projekttitel> hinterlegten Stand"
                        "ard-Titel)"

                    LayoutCachedLeft =4583
                    LayoutCachedTop =5220
                    LayoutCachedWidth =4838
                    LayoutCachedHeight =5475
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =247
                    Left =85
                    Top =5220
                    Width =391
                    Height =330
                    TabIndex =38
                    ForeColor =0
                    Name ="btnVGL"
                    Caption ="Titel"
                    OnClick ="[Event Procedure]"
                    PictureData = Begin
                        0x2800000010000000100000000100040000000000800000000000000000000000 ,
                        0x0000000000000000000000000000800000800000008080008000000080008000 ,
                        0x8080000080808000c0c0c0000000ff00c0c0c00000ffff00ff000000c0c0c000 ,
                        0xffff0000ffffff00dddddddddddddddddddddddddddddddddddddddddddddddd ,
                        0xddddddddddddddddddd0000dddddd000ddd0220dddddd000ddd0220ddddddddd ,
                        0x0000220000ddd0000222222220ddd0000222222220ddd0000000220000ddd000 ,
                        0xddd0220dddddd000ddd0220dddddd000ddd0000ddddddddddddddddddddddddd ,
                        0xdddddddddddddddd000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    FontName ="Arial"
                    ObjectPalette = Begin
                        0x000301000000000000000000
                    End
                    ControlTipText ="Titel im Lexikon ablegen"

                    LayoutCachedLeft =85
                    LayoutCachedTop =5220
                    LayoutCachedWidth =476
                    LayoutCachedHeight =5550
                    Overlaps =1
                End
                Begin OptionButton
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =2895
                    Top =6152
                    TabIndex =39
                    Name ="OmitInfo"
                    DefaultValue ="0"
                    ControlTipText ="sollen die internen Infos auch kopiert werden?"

                    LayoutCachedLeft =2895
                    LayoutCachedTop =6152
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =6392
                    Begin
                        Begin Label
                            OverlapFlags =215
                            Left =3234
                            Top =6143
                            Width =1320
                            Height =240
                            BackColor =12632256
                            Name ="Bezeichnungsfeld232"
                            Caption ="mit internen Infos"
                            LayoutCachedLeft =3234
                            LayoutCachedTop =6143
                            LayoutCachedWidth =4554
                            LayoutCachedHeight =6383
                        End
                    End
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =215
                    TextAlign =2
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =3457
                    Top =2510
                    Width =1110
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =12
                    BackColor =10092543
                    Name ="VGDat1"
                    Format ="dd/mm/yy"
                    OnEnter ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    FontName ="Arial"
                    OnKeyDown ="[Event Procedure]"
                    ControlTipText ="Durch die Eingabe einer Zahl wird ein Datum erzeugt (ausgehend vom 01.05.20)\015"
                        "\012Mit Doppel-Klick wird das heutige Datm eingetragen!"

                    LayoutCachedLeft =3457
                    LayoutCachedTop =2510
                    LayoutCachedWidth =4567
                    LayoutCachedHeight =2765
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =3
                            Left =375
                            Top =2517
                            Width =2970
                            Height =255
                            FontWeight =700
                            BackColor =13884874
                            Name ="lblVGDat1"
                            Caption ="Lieferwunsch"
                            FontName ="Arial"
                            LayoutCachedLeft =375
                            LayoutCachedTop =2517
                            LayoutCachedWidth =3345
                            LayoutCachedHeight =2772
                            ForeThemeColorIndex =0
                        End
                    End
                End
                Begin CustomControl
                    Enabled = NotDefault
                    TabStop = NotDefault
                    SizeMode =1
                    SpecialEffect =0
                    OverlapFlags =215
                    Left =4599
                    Top =2476
                    Width =254
                    Height =289
                    AutoActivate =1
                    TabIndex =40
                    Name ="SpinButtonVGDat1"
                    OleData = Begin
                        0x00100000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000020000000000000000100000 ,
                        0x0400000001000000feffffff0000000003000000ffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d2776000000000000000000000000508e353c3009d4010900000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000018000000 ,
                        0x0000000008000000fdffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff05000000b06f1779f2b7ce1197ef00aa ,
                        0x006d277600000000000000000000000060e185e1f533d6010600000080010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000200000078000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000500000014000000 ,
                        0x0000000063006f006e00740065006e0074007300000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000400000018000000 ,
                        0x00000000ffffffffffffffff05000000fdfffffffefffffffefffffffeffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffefffffffeffffff03000000fefffffffefffffffeffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff03004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000038000000 ,
                        0x0000000002004f006c0065005000720065007300300030003000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000180002010100000004000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000024000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000400000001000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000038000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000000000000 ,
                        0x000000000100feff030a0000ffffffffb06f1779f2b7ce1197ef00aa006d2776 ,
                        0x1d0000004d6963726f736f667420466f726d7320322e302d4472656866656c64 ,
                        0x0010000000456d626564646564204f626a6563740013000000466f726d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000066656c64 ,
                        0x0010000000021400880800005900000000000000c0010000fd0100006d732e53 ,
                        0x70696e427574746f6e2e3100f439b27100000000000000000000000000000000 ,
                        0x0000000001000002000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    OLEClass ="Microsoft Forms 2.0"
                    Class ="Forms.SpinButton.1"

                    LayoutCachedLeft =4599
                    LayoutCachedTop =2476
                    LayoutCachedWidth =4853
                    LayoutCachedHeight =2765
                End
                Begin TextBox
                    Visible = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =215
                    TextAlign =1
                    TextFontFamily =34
                    IMESentenceMode =3
                    Left =2977
                    Top =2805
                    Width =1590
                    Height =255
                    FontSize =8
                    FontWeight =700
                    TabIndex =13
                    BackColor =10092543
                    Name ="txtFrei"
                    OnEnter ="[Event Procedure]"
                    FontName ="Arial"

                    LayoutCachedLeft =2977
                    LayoutCachedTop =2805
                    LayoutCachedWidth =4567
                    LayoutCachedHeight =3060
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =215
                            TextAlign =3
                            Left =375
                            Top =2812
                            Width =2490
                            Height =255
                            FontWeight =700
                            BackColor =13884874
                            Name ="lbltxtFrei"
                            FontName ="Arial"
                            LayoutCachedLeft =375
                            LayoutCachedTop =2812
                            LayoutCachedWidth =2865
                            LayoutCachedHeight =3067
                            ForeThemeColorIndex =0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =215
                    TextAlign =2
                    IMESentenceMode =3
                    ListRows =30
                    ListWidth =1134
                    Left =3450
                    Top =3166
                    Width =1395
                    Height =255
                    FontWeight =700
                    TabIndex =41
                    BackColor =10092543
                    Name ="comAnzahl"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="567"
                    ValidationRule ="Between 1 And 50"
                    ValidationText ="zwischen 1 und 50"
                    DefaultValue ="1"
                    FontName ="Arial"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Wieviele Vorgänge sollen gleichzeitig erstellt werden (1 bis max. 50)"

                    LayoutCachedLeft =3450
                    LayoutCachedTop =3166
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =3421
                    ForeThemeColorIndex =0
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =215
                            TextAlign =3
                            Left =368
                            Top =3173
                            Width =2970
                            Height =255
                            FontWeight =700
                            BackColor =12632256
                            Name ="Bezeichnungsfeld240"
                            Caption ="Anzahl Vorgänge"
                            FontName ="Arial"
                            LayoutCachedLeft =368
                            LayoutCachedTop =3173
                            LayoutCachedWidth =3338
                            LayoutCachedHeight =3428
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    EnterKeyBehavior = NotDefault
                    FELineBreak = NotDefault
                    ScrollBars =2
                    OldBorderStyle =1
                    OverlapFlags =215
                    TextAlign =1
                    TextFontFamily =0
                    Left =141
                    Top =7731
                    Width =4641
                    Height =284
                    FontSize =11
                    TabIndex =42
                    BackColor =16777215
                    Name ="vgbem"
                    FontName ="Arial 11"
                    OnGotFocus ="[Event Procedure]"
                    ControlTipText ="Bemerkungen (editierbar, wenn Sie Teile des Textes markieren)\015\012Hier können"
                        " Sie auch Ersetzungstexte (<xxx>) einbauen"
                    AsianLineBreak =255
                    TextFormat =1

                    LayoutCachedLeft =141
                    LayoutCachedTop =7731
                    LayoutCachedWidth =4782
                    LayoutCachedHeight =8015
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =247
                    TextAlign =1
                    ColumnCount =2
                    ListRows =30
                    ListWidth =6521
                    Left =1370
                    Top =1757
                    Width =3449
                    Height =255
                    FontWeight =700
                    TabIndex =43
                    BackColor =10092543
                    Name ="comEmailPDF"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="3402;2835"
                    DefaultValue ="0"
                    FontName ="Arial"
                    ControlTipText ="an welche Email-Adresse soll der Vorgang gemailt werden"

                    LayoutCachedLeft =1370
                    LayoutCachedTop =1757
                    LayoutCachedWidth =4819
                    LayoutCachedHeight =2012
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =215
                            Left =375
                            Top =1757
                            Width =750
                            Height =240
                            FontWeight =700
                            Name ="lblcomEmailPDF"
                            Caption ="als PDF"
                            ControlTipText ="Hintergrund wird gelb, falls mehrere Mail-Adressen vorhanden sind!"
                            LayoutCachedLeft =375
                            LayoutCachedTop =1757
                            LayoutCachedWidth =1125
                            LayoutCachedHeight =1997
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "PF_NeuVG.cls"
