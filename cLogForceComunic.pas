unit cLogForceComunic;

interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,
     System.SysUtils, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
     FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
     FireDAC.Comp.Client;

type
  TLogForceComunic = class

  private

    ConnLoja: TFDConnection;
    ConnCentral: TFDConnection;

    F_log_force_comunic_id : integer;
    F_usuario_big : integer;
    F_data_hora : TDateTime;
    F_cnpj_loja : string;
    F_cnpj_central : string;
    F_filial_id : integer;
    F_nome_loja : string;
    F_nome_central : string;

  public
    constructor Create (ConnLoja, ConnCentral : TFDConnection);
    destructor Destroy; override;

  published
    property log_force_comunic_id : integer   read F_log_force_comunic_id write F_log_force_comunic_id;
    property usuario_big          : integer   read F_usuario_big          write F_usuario_big;
    property data_hora            : TDateTime read F_data_hora            write F_data_hora;
    property cnpj_loja            : string    read F_cnpj_loja            write F_cnpj_loja;
    property cnpj_central         : string    read F_cnpj_central         write F_cnpj_central;
    property filial_id            : integer   read F_filial_id            write F_filial_id;
    property nome_loja            : string    read F_nome_loja            write F_nome_loja;
    property nome_central         : string    read F_nome_central         write F_nome_central;
  end;

implementation

{ TLogForceComunic }

{$REGION 'Construtor e Destrutor'}

constructor TLogForceComunic.Create(ConnLoja, ConnCentral: TFDConnection);
begin
  ConnLoja := ConnLoja;
  ConnCentral := ConnCentral;
end;

destructor TLogForceComunic.Destroy;
begin

  inherited;
end;

{$ENDREGION}

end.
