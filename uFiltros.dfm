object frmFiltros: TfrmFiltros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Filtros'
  ClientHeight = 664
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 336
    Top = 232
    Width = 105
    Height = 105
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 664
    Align = alClient
    TabOrder = 0
    DesignSize = (
      758
      664)
    object ShapeFiltro: TShape
      Left = 11
      Top = 15
      Width = 735
      Height = 3
      Brush.Color = 9514330
      Pen.Color = 5898285
      Pen.Style = psClear
    end
    object lblTitulo: TLabel
      Left = 11
      Top = 46
      Width = 370
      Height = 19
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'Defina o filtro de reenvio das informa'#231#245'es da tabela '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object lblNomeTabelaSelecionada: TLabel
      Left = 381
      Top = 45
      Width = 56
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'Tabela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lblCampo: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 82
      Width = 33
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Campo'
      Transparent = False
    end
    object lblCondicao: TLabel
      AlignWithMargins = True
      Left = 168
      Top = 82
      Width = 44
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Condi'#231#227'o'
      Transparent = False
    end
    object lblValor: TLabel
      AlignWithMargins = True
      Left = 328
      Top = 82
      Width = 24
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Valor'
      Transparent = False
    end
    object Shape1: TShape
      Left = 11
      Top = 175
      Width = 735
      Height = 3
      Brush.Color = 9514330
      Pen.Color = 5898285
      Pen.Style = psClear
    end
    object TLabel
      Left = 11
      Top = 197
      Width = 36
      Height = 13
      Caption = 'Filtros: '
    end
    object lblFiltrosWhere: TLabel
      Left = 53
      Top = 197
      Width = 3
      Height = 13
    end
    object lblComunicar: TLabel
      Left = 530
      Top = 612
      Width = 116
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'For'#231'ar comunica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lblTotalRegistros: TLabel
      Left = 11
      Top = 579
      Width = 106
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'Total de registros: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lblQuantidadeRegistros: TLabel
      AlignWithMargins = True
      Left = 526
      Top = 577
      Width = 162
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Caption = 'Quantidade de registros na grade'
      Transparent = False
    end
    object PanelFiltroCaption: TPanel
      Left = 19
      Top = 15
      Width = 55
      Height = 16
      BevelOuter = bvNone
      Caption = 'Filtros'
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
    object ComboBoxCampoTabela: TDBLookupComboBox
      Left = 17
      Top = 103
      Width = 145
      Height = 21
      TabOrder = 1
      OnExit = ComboBoxCampoTabelaExit
    end
    object ComboBoxCondicoes: TComboBox
      Left = 168
      Top = 103
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'Condi'#231#227'o'
      OnExit = ComboBoxCondicoesExit
      Items.Strings = (
        '')
    end
    object edtValor: TEdit
      Left = 328
      Top = 103
      Width = 357
      Height = 21
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 19
      Top = 175
      Width = 100
      Height = 16
      BevelOuter = bvNone
      Caption = 'Total de registros'
      Color = 9514331
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 16
    end
    object gridTabelas: TDBGrid
      Left = 11
      Top = 216
      Width = 735
      Height = 352
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsRegistros
      DrawingStyle = gdsClassic
      FixedColor = 9514330
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Malgun Gothic'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 12
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -11
      TitleFont.Name = 'Malgun Gothic'
      TitleFont.Style = []
    end
    object btnLimparFiltros: TBitBtn
      Left = 474
      Top = 133
      Width = 140
      Height = 25
      Caption = 'Limpar Filtros'
      TabOrder = 11
      OnClick = btnLimparFiltrosClick
    end
    object btnForcarCentral: TBitBtn
      Left = 530
      Top = 629
      Width = 105
      Height = 25
      Caption = 'Central para Loja'
      TabOrder = 14
      OnClick = btnForcarCentralClick
    end
    object btnAplicarFiltro: TBitBtn
      Left = 328
      Top = 133
      Width = 140
      Height = 25
      Caption = 'Aplicar Filtros'
      TabOrder = 10
      OnClick = btnAplicarFiltroClick
    end
    object btnForcarLoja: TBitBtn
      Left = 641
      Top = 629
      Width = 105
      Height = 25
      Caption = 'Loja para Central'
      TabOrder = 15
      OnClick = btnForcarLojaClick
    end
    object edtValor1: TEdit
      Left = 328
      Top = 103
      Width = 140
      Height = 21
      TabOrder = 4
    end
    object edtValor2: TEdit
      Left = 474
      Top = 103
      Width = 140
      Height = 21
      TabOrder = 5
    end
    object edtHora1: TMaskEdit
      Left = 474
      Top = 103
      Width = 55
      Height = 21
      EditMask = '00:00:00;1;_'
      MaxLength = 8
      TabOrder = 7
      Text = '  :  :  '
    end
    object edtHora2: TMaskEdit
      Left = 691
      Top = 103
      Width = 55
      Height = 21
      EditMask = '00:00:00;1;_'
      MaxLength = 8
      TabOrder = 9
      Text = '  :  :  '
    end
    object DateTime1: TDateEdit
      Left = 328
      Top = 103
      Width = 140
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 6
      Text = '09/12/2021'
    end
    object DateTime2: TDateEdit
      Left = 545
      Top = 103
      Width = 140
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 8
      Text = '09/12/2021'
    end
    object btnBuscarRegistros: TBitBtn
      Left = 11
      Top = 629
      Width = 105
      Height = 25
      Caption = 'Buscar Registros'
      TabOrder = 13
      OnClick = btnBuscarRegistrosClick
    end
    object edtQuantidadeRegistros: TEdit
      Left = 691
      Top = 574
      Width = 55
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 17
      OnExit = edtQuantidadeRegistrosExit
    end
  end
  object qryCamposTabela: TFDQuery
    IndexesActive = False
    Connection = dtmPrincipal.ConnLoja
    SQL.Strings = (
      '')
    Left = 32
    Top = 104
    object qryCamposTabelaField: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Field'
      Origin = 'Field'
      ProviderFlags = []
      ReadOnly = True
      Size = 64
    end
    object qryCamposTabelaType: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Type'
      Origin = 'Type'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object dtsCamposTabela: TDataSource
    DataSet = qryCamposTabela
    Left = 128
    Top = 104
  end
  object qryRegistros: TFDQuery
    Left = 104
    Top = 344
  end
  object dtsRegistros: TDataSource
    Left = 168
    Top = 344
  end
  object qryTotalRegistros: TFDQuery
    Connection = dtmPrincipal.ConnLoja
    Left = 440
    Top = 640
  end
end
