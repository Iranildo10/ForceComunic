object frmSelecionaTabelas: TfrmSelecionaTabelas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sele'#231#227'o de Tabelas'
  ClientHeight = 515
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Malgun Gothic'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 594
    Height = 87
    Align = alTop
    TabOrder = 0
    object ShapeFiltro: TShape
      Left = 3
      Top = 21
      Width = 577
      Height = 3
      Brush.Color = 9514330
      Pen.Color = 5898285
      Pen.Style = psClear
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 34
      Width = 142
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Filtrar pelo nome da tabela'
      Transparent = False
    end
    object PanelFiltroCaption: TPanel
      Left = 11
      Top = 15
      Width = 55
      Height = 16
      BevelOuter = bvNone
      Caption = 'Filtro'
      Color = 9514330
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtFiltroTabela: TEdit
      AlignWithMargins = True
      Left = 11
      Top = 52
      Width = 558
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      TabOrder = 1
      OnChange = edtFiltroTabelaChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 97
    Align = alTop
    TabOrder = 1
    DesignSize = (
      594
      97)
    object Shape1: TShape
      Left = 3
      Top = 21
      Width = 577
      Height = 3
      Brush.Color = 9514330
      Pen.Color = 5898285
      Pen.Style = psClear
    end
    object lblSelecionarTabela: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 44
      Width = 94
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Selecione a tabela'
      Transparent = False
    end
    object lblAtalhos: TLabel
      Left = 11
      Top = 65
      Width = 49
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Atalhos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object Image1: TImage
      Left = 66
      Top = 65
      Width = 24
      Height = 24
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000000
        C94944415478DA6364A031601C541638046D4DF9F7EFFFFF431B7CE652DD02BB
        E0ED5E8CFFFE6D02B1FF3331F91D5AEBB98D6A163806EFD0FEF7EFEF3120930F
        2AF4898989D96AFF5A8FAB145BE0E0BB59E43F2BD32986FF0C8A683AEF33FEFE
        677660B3EF1BB22DD00E5DC526F2877B0F90698B43C9E1372C5F5DAEAE0EFB45
        9605F6815B8091C99884DF8FFFE71D5CEF934CB20576015BF319191926100A42
        B015FF190A0E6DF09E48B20F507DB3F53F32FFE07A6FA2F48E5A306AC1A805A3
        1650D30272C1D0B70000540F6919919745200000000049454E44AE426082}
    end
    object Image2: TImage
      Left = 81
      Top = 65
      Width = 24
      Height = 24
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000000
        C54944415478DA6364A031601C3916D8076EFD8FCC3FB8DE9B28BDA3168C5A30
        6AC1A8059458601FB0AD8C81F17F2791F697012DEC26D907F6415BA631FC67CC
        C4EFC4FFD30FAEF3C9222B888CD3CEB072BF7EB19D9181D1199BFC7F86FF7BBF
        8A4A789E9D65F29B2C0B40C032748710DB9FBFC7814C3534A95BBF58982D8FAF
        F67887D783842C000147BFEDEAFF98FF812C11840ABD67FACB64B97F93E74D42
        7A494945AE406A1B94EB058CD4DDC4E823A9CAB40BDC9A0DA20FADF79E4AAC9E
        C15327930B00628163199C07878F0000000049454E44AE426082}
    end
    object ImageLogo: TImage
      Left = 495
      Top = 30
      Width = 85
      Height = 50
      AutoSize = True
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000550000
        003208060000015A03A72E0000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C0000032269545874584D4C3A636F6D2E
        61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
        BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
        223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
        3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
        352E332D633031312036362E3134353636312C20323031322F30322F30362D31
        343A35363A32372020202020202020223E203C7264663A52444620786D6C6E73
        3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
        32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
        74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
        3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
        312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
        526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
        746F73686F7020435336202857696E646F7773292220786D704D4D3A496E7374
        616E636549443D22786D702E6969643A39433334384244344443433431314535
        383838384141454238343236343641452220786D704D4D3A446F63756D656E74
        49443D22786D702E6469643A3943333438424435444343343131453538383838
        414145423834323634364145223E203C786D704D4D3A4465726976656446726F
        6D2073745265663A696E7374616E636549443D22786D702E6969643A39433334
        3842443244434334313145353838383841414542383432363436414522207374
        5265663A646F63756D656E7449443D22786D702E6469643A3943333438424433
        444343343131453538383838414145423834323634364145222F3E203C2F7264
        663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D
        706D6574613E203C3F787061636B657420656E643D2272223F3EEBA6EED40000
        0D624944415478DAED5C09581447167E33DC0CC32D728C48041113010F10D100
        117023CAA58088A8B81B35EAC6230A9278CB917890A8ACBB1A45D72BA0A25C0A
        5E808A072A88CA65022A2C04211CE20832C030D3FB0A856F24C330C8244CBEF0
        BEAFBFEEAE7AF5FAEFBF5FD57BD5D533348AA2402C196F46D1C452761B41C1B9
        9F69E229078CA3E0E87D31943F41ABD3959BC1FCA5220D4F519FA2B5B5B529B5
        B4B4282E5AB4282A3A3ADA8BE8BD7EFD5A8DC160B03BDA752A7B7979259C3D7B
        D6B3B3A2FDA2144DF022ED3048052A279E3973A65DB9A6A6466FD0A041957825
        868282C2EB7794C5959E959B2B46C0CA5589F043AC59CFCA53C772E0628E9278
        965D8650B0408D0FB372D4DE5116C68048CC1A1A1A0DF5F5F54CA1CA36363639
        77EEDC192B96726FA8EB51027C1AE168AC061E712563385E9D82484D80ABCF3A
        B9E9BBE1DBD767C3D78B63603417C09A0E30F749BB719A8C8C0C1F1D99DEA137
        72E4C8E2C78F1F0F17CBA8ABFD4B389FA12EACAAD3F13B0A3A3A404242828FA7
        A7672C29DBBD7B77D0AA55AB762A2929B571381C59140AC1D0445D9316131333
        67F6ECD9D15D0D0B2A753C7D2B2BABDCECEC6C0B6B6BEB4759595996220D4BD4
        2B5A5B35405EBE5EB246276157BA552EE6D8D6931CF0BF05318F26C2D57C9A64
        6EBFFEA62B44F89F835559A360904E81648C127132A360B9F933F08C35968C51
        27130A98E8F276D8190CD579E0F340B66F46271851A0A907A05F0E606FF80298
        25D87FE940CBCDCD1D6D6E6EFE90E8787878242726264E17DB68C8BA73B0E91B
        B7AEC5B4FBF7EF5B8F1D3B36EBEDB90C6E3C72A0AFAF5F575959A9D9D1EB0407
        D81E075B41A39B376F0EDBBA75EB06C1EE686060505D5151A1438E376DDAB44D
        4545A571EDDAB561A26E40A85141240F1E3CB01A33664C36392E2A2AFAB0B9B9
        59C9C2C2E2BE48A3AAAAAA4D6C365B591CA3A4FFCBC9C9B56666665A8934DA11
        79B1619E9B9B5B221ADD28CC68AF389568DF97B4580EA380A5D500C959AAD20A
        561616CCE442691E3EE7BD0B61F2A7873A2AA4036C920C058D18F773B1073E62
        61EEF70220A3E437EE201D60DB85AD0B132D2B411F87D1336942FD563AC06E5D
        93043793DD80D7063002CF3FE2030C35AB04B7147DE901CBE5AA8383713D28A3
        0BD05A0006613061211E5DACD3447299B8F170609E55228B25BCFE03BBEE9F97
        E076EADF0070C8FCFB82EF21606520960A01D3A20EF97333A03A77787BF686A3
        F77881382328A49EDC15B77FEEE8B760BA054B22447E7EFEA88E0CB1AAAA6A88
        9E9E5E59646464D0F2E5CB2330BE31304A641514148CE472B99D9D62CA9429D7
        30DE1914161676E6C2249AC8CBCBB7DCBE7DDBFA0F01DB5D84494D4D9D1A1010
        700401EABE631CF5636363E7FAF8F89C101599C406CB62B12AC2C2C236E2C50E
        BF2F58123A1D1D1DAF769D8DE1CC83B2B5B5CD226CF2F9FCBE83251D0C1F0F85
        8F2E2D3939D9591260F1E643B66CD9B251705642D2A2F0F0F04DC1C1C1A17D02
        2BB5B2797D02383B1D073BC7B3D20B34E1CC56F82E7813C4651AE374E3997402
        AD287786990E5790C91B1011654F8AA40F68D2A98DB0674708705F6202F35482
        2F1D242294323C8EF3871D5F1D80862100BF3EC5F1AF481B1414EAA40768B6DF
        79A8B8341DCA3115CCC27C00A781B0326C0378CC0A1754EB7FA0442E8F62435D
        AD2AFCA00E3098F51A4EA5AA7455910EA044BE72AA80FBCFF561DBFE9530CE21
        523A813E2BB68585536F636400B0C5946FFD1D5390D72E9636A074B065F14081
        01A04507306FC6A41AC17A5FB701E607F7A407A89D29C671EC481466FF2CCCFC
        3FC0CD8024D4B8B78FFA071838FFB7FF817EEEFB109E3EB0044A11400599D46B
        7B0372106252C7BD02EE4D96EF03F32F97F51FD094F8E510111C09B26A78D288
        40EB713E85D37D23CD97A0CA9301B95A2628E2D4450E5D427D5A72FF01B51942
        811C4E4F869AD4C3F7FBEC61B061BE50BDFA0BF3A170C9511A49DFBACB19491D
        A66B8A985FB6481464CDAFC6E0FDE91388BD340A74061788D3E4376FC10585CD
        66EBA8A9A955FFAECC8A2922819696968E303232FA59B08CBC030C0D0D0D26C7
        0C06838B89F398E1C38777B2327EFCF89C2FBEF8E2DFF3E7CF3F24D82E3E3EDE
        77C58A15BBCBCBCBF5240EB46B566F6A6A5A525757A7F5ECD93313C2F4850B17
        3CA64D9B96909292E2E9E2E2924874783C9E2266F49CDADA5A3D2D2DAD2A52D6
        D8D8A8C164325F343535A92A292935FCAE401F3D7A64357AF4E8ACAEBACF9F3F
        37343030F89F607946468693838343AAE02B48BC190FBC99A4F701D92BA0BEBE
        BE670D0D0DCB76EEDCF9A530BD8686060D151595971D65CB962D8BC2C7ED8973
        B256049D71ECD8B1D9EF0BB25740A74E9D7AC5C9C9292D2828689B30BDEAEA6A
        7DB2A42A588E8F9B83F37FB9E6E666D9BE80FC5D819E3F7F7EA69B9BDB591CDA
        202E2ECEC7DDDDFD4C9F811617177F686262F2585240D10D34555555EB5EBD7A
        A5851DAB4D5959994DCAD035EADF1B687A7AFA149C975F2E2929214351912480
        92736474C6F4E9D313C839E948E4B82F6F4EDA43E8CD9B3727DBD9D9A5771462
        1959A4E17705EAECEC9C161818D81D50B2EC5FA5ABAB5BEBEAEA9A1C15151520
        A8131010109D999939A1A8A868D87B031D905E8B2C846C8C87D8A3AE20C705D8
        FAAFC5E0E67DB0A37280D4DECAD36277F87C5E0234D7D28087E9DACAD04D307B
        C13BAFD5064815570AF33C616F44343CB8A3040AE89D6A835FC1BED88F419F95
        D755758054515292E70487776F8387795640C769091BE305B70960D6D263B072
        5D4077CD064825529BE60D457BD7C1EB4A5DA87AAE0765753875C29C8AAD8DB9
        016E6CF4CC364C1295D4F9B027DA19869B5D15656E805422F5375CE1AE5F12B4
        35D1A0551E49E603946152F1B306928BF53C9CDD3BFBA6C2E69D53E1EDE720A2
        64805441692E3187ECCFCF40659E294433005E60990C92BC32E45BF0F05E27AE
        990152BBCA95E44510F2E50150C063BA1C802613C0CEB0163EDBF30928EA89F7
        066580D4B7C269D281657E37E0C9435350507AF36D81320E01FAB8B19A01B471
        5C35B22E01A7FF4C07C5C18F45991A2095C88903DFC0DED0AF8189119E4787F6
        AF4D947072A689759A78AC851C69E0B92A6E24D95719DA007691B3417B4C8A30
        737F6D522BCA2C61C9ACEBF0EA573590C3FECEC7884F127A652456053D55957A
        B3A9516FBE8C219FEF29E39E7C4E4FC77A0ADB8CDDBC014CFCA470C5AC3F64E7
        96E3101B3517543120F1B18B2BA8E21EBBB90C078943C298D49B8D81990003F7
        CAD41BB289072BE25E1EF7B2ED2F78005AF0411805C48255C87C64BBF9AF476A
        79E91858E87D1338F5CA404732E9387ECA29E2988AB9A9863C05A32DEF83956D
        2A985ADE83C1864F81A151875E8C4CD3F94071E581FB9A099C6A3D682C1A05F5
        B79DE1D51D476829D3687F83C6C187A13BE7146DDFBE7DCB1B1B1B998181813B
        F0926DE2622B28281813111111E4EFEF7FC2D9D93945DC76FD2ABF948E82792E
        B9D0D24A034E2BC050D366F0FF6C37B87AEE0225E53E2E69508AD078CF11DEBE
        2A6B775511DFA20995C8C8C8C0D5AB57EF5CB264C9C1BD7BF72EEE6FBEC49697
        F543804FC982A6662908FD48AFEFF2DEA4F6569A9A9A34B2B3B3AD9E3C7962DC
        D6D62667606050316EDCB86C5D5DDDB29EDA1616168E2E2D2DFD60DAB469F1E2
        5EEFF2E5CBAE0C06A369D2A449E9E2B69194BC37A9274F9E9CE7E7E7776CC386
        0DDB434343BF12A6535C5CFCD1CC9933E3F2F3F34DC9B9A6A666A3A9A9693159
        5941928CCACACA0693722693D97CF8F0E1CFBCBDBDA385D9090A0ADA8343CD0A
        A2979E9EEE6865659529E201583A38385CAFADAD555BB870E1B183070F76FBE2
        43EA48259FFB858484AC47D212BBFE3688C8DCB9734FFDF8E38FB3F4F5F56B2E
        5EBCE8626E6E2EF447071C0E476DC68C19F1972E5D9A3C6CD8B072C4314E5D5D
        BDA6AB5E454585919D9DDD8D929212968787474A4242823B749987775C534F4F
        AFF6C68D1BF6C6C6C62293F43F15A9E1E1E19BD183B74C9830213B3333D3068B
        F83DD9231E8FEDD6A297DDBA76EDDAC7DDE9EDDFBF7FC5D2A54BF790E3D3A74F
        FBFBF8F84493B51A7777F7041ECE8276ECD8B1013D3BBCA7EBFDE948757171B9
        82DEE9BC7DFBF6756BD7AEFD561C7B393939D638C6DE432F6D282A2A32256B48
        DDE9B6B6B632A64C9972252323C3962C29123271487874F5EAD54F041772FB8D
        545959591EF971E2AD5BB71C264E9C98210952C9C21B766767F49AAF85AD120A
        13F2553079A8486AE35B522B45E9EFDAB52B18B38F4EDBF80037F6F463A93F8C
        542425212E2ECE03C7A393C78F1FF79376527FFAE927731288AAABAB3530509E
        8D8E8EF62601E9D0A143F3B0CD4BF45E073333B3DC7E2595FC0EDCDEDEFEE6DD
        BB77C7B9BABA5E4A4A4A72A7D168AD52482A6DCE9C39B13131315E3A3A3AF584
        BC11234674AE0F61AAF62106B28CAAAA2A2D9C909C3E71E2846FBF91DA314D3D
        72E4C8E2458B16FD804301E0B8D4EAE8E8988EC34126E691954832D8D8D8DC11
        BC893F9254EC49BE5E5E5E27C931A656EBD6AC59D3ED388DD75C1F1C1C1C46A7
        D3011DA4F3C3837E21B543F87CBE426A6AAAD3B973E7DC7373732DEAEAEA3431
        ED51C6AE161D1616D6998F62BD2746DC781CCBD6E358F68DA00DBCA9EFF0E656
        635476C7A0754E1C20353535BA161616792C16EB17EC3536484A7B6F61B3D95A
        18C072B4B5B56BD2D2D29C04FF4DA13B216DB0F765686969BDC0BC7632F462FA
        2D09F93F2A4B2D49898488BC0000000049454E44AE426082}
    end
    object Panel3: TPanel
      Left = 11
      Top = 15
      Width = 55
      Height = 16
      BevelOuter = bvNone
      Caption = 'Legendas'
      Color = 9514331
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 184
    Width = 594
    Height = 333
    Align = alTop
    TabOrder = 2
    DesignSize = (
      594
      333)
    object Shape2: TShape
      Left = 3
      Top = 21
      Width = 577
      Height = 3
      Brush.Color = 9514330
      Pen.Color = 5898285
      Pen.Style = psClear
    end
    object Panel6: TPanel
      Left = 11
      Top = 15
      Width = 150
      Height = 16
      BevelOuter = bvNone
      Caption = 'Tabelas que comunicam'
      Color = 9514331
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object gridTabelas: TDBGrid
      Left = 11
      Top = 37
      Width = 569
      Height = 252
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsTabelas
      DrawingStyle = gdsClassic
      FixedColor = 9514330
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Malgun Gothic'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -11
      TitleFont.Name = 'Malgun Gothic'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'tabela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'envia_matriz'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'recebe_matriz'
          Width = 76
          Visible = True
        end>
    end
    object btnFiltrarRegistros: TBitBtn
      Left = 232
      Top = 295
      Width = 105
      Height = 25
      Caption = 'Filtrar Registros'
      TabOrder = 2
      OnClick = btnFiltrarRegistrosClick
    end
  end
  object qryTabelas: TFDQuery
    SQL.Strings = (
      'select tabela, envia_matriz, recebe_matriz from comunicacao')
    Left = 432
    Top = 40
    object qryTabelastabela: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'tabela'
      Origin = 'tabela'
      Required = True
      Size = 40
    end
    object qryTabelasenvia_matriz: TStringField
      DisplayLabel = 'Envia'
      FieldName = 'envia_matriz'
      Origin = 'envia_matriz'
      FixedChar = True
      Size = 1
    end
    object qryTabelasrecebe_matriz: TStringField
      DisplayLabel = 'Recebe'
      FieldName = 'recebe_matriz'
      Origin = 'recebe_matriz'
      FixedChar = True
      Size = 1
    end
  end
  object dtsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 360
    Top = 40
  end
end