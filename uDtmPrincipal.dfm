object dtmPrincipal: TdtmPrincipal
  Height = 339
  Width = 574
  PixelsPerInch = 96
  object ConnLoja: TFDConnection
    Params.Strings = (
      'Server=127.0.0.1'
      'Database=gerente'
      'User_Name=root'
      'Password=123456big'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object ConnCentral: TFDConnection
    Left = 176
    Top = 24
  end
  object DriverMysql: TFDPhysMySQLDriverLink
    VendorLib = '.\libmysql.dll'
    Left = 64
    Top = 112
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 112
  end
end
