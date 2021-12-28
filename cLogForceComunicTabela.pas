unit cLogForceComunicTabela;

interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,
     System.SysUtils, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
     FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
     FireDAC.Comp.Client;

type
  TLogForceComunicTabela = class

  private

    ConnLoja: TFDConnection;
    ConnCentral: TFDConnection;

    F_log_force_comunic_tabela_id : integer;
    F_log_force_comunic_id : integer;
    F_tabela : string;
    F_total_registros : integer;
    F_filtro_utilizado : string;
    F_direcao_comunicacao : string;

  public
    constructor Create (ConnLoja, ConnCentral : TFDConnection);
    destructor Destroy; override;

  published
    property log_force_comunic_tabela_id : integer   read F_log_force_comunic_tabela_id write F_log_force_comunic_tabela_id;
    property log_force_comunic_id        : integer   read F_log_force_comunic_id        write F_log_force_comunic_id;
    property tabela                      : string    read F_tabela                      write F_tabela;
    property total_registros             : integer   read F_total_registros             write F_total_registros;
    property filtro_utilizado            : string    read F_filtro_utilizado            write F_filtro_utilizado;
    property direcao_comunicacao         : string    read F_direcao_comunicacao         write F_direcao_comunicacao;

  end;

implementation

{ TLogForceComunic }

{$REGION 'Construtor e Destrutor'}

constructor TLogForceComunicTabela.Create(ConnLoja, ConnCentral: TFDConnection);
begin
  ConnLoja := ConnLoja;
  ConnCentral := ConnCentral;
end;

destructor TLogForceComunicTabela.Destroy;
begin

  inherited;
end;

{$ENDREGION}

end.

