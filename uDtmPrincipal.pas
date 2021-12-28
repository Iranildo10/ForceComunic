unit uDtmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, ZAbstractConnection, ZConnection;

type
  TdtmPrincipal = class(TDataModule)
    ConnLoja: TFDConnection;
    ConnCentral: TFDConnection;
    DriverMysql: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
