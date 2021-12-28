unit uConfirmacaoEnvio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RxCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uFiltros, uDtmPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmConfirmacaoEnvio = class(TForm)
    lblConfirmacaoEnvio: TLabel;
    Image1: TImage;
    lblQuantidadeRegistros: TLabel;
    pnlContinuar: TPanel;
    pnlVoltar: TPanel;
    procedure pnlContinuarClick(Sender: TObject);
    procedure pnlVoltarClick(Sender: TObject);
    function CriarTabelasLog() : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    direcao, filtrosWhere, nomeTabela, codFisica : String;
  end;

var
  frmConfirmacaoEnvio: TfrmConfirmacaoEnvio;

implementation

{$R *.dfm}

uses uFinal;

function TfrmConfirmacaoEnvio.CriarTabelasLog : Boolean;
var Qry : TFDQuery;
begin
  try
    Result := True;
    Qry :=  TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipal.ConnLoja;
    Qry.SQL.Clear;
    Qry.SQL.Add('CREATE TABLE IF NOT EXISTS log_force_comunic '+ '(' +
                ' log_force_comunic_id INT PRIMARY KEY AUTO_INCREMENT, ' +
                ' usuario_big INT NOT NULL, ' +
                ' data_hora DATETIME NOT NULL, ' +
                ' cnpj_loja VARCHAR(20) NOT NULL, ' +
                ' cnpj_central VARCHAR(20) NOT NULL, ' +
                ' filial_id INT NOT NULL, ' +
                ' nome_loja VARCHAR(35) NOT NULL, ' +
                ' nome_central VARCHAR(35)  ' +
                ');');
    try
      Qry.ExecSQL;
    except on E : EDatabaseError do
      begin
        Result := False;
        MessageDlg('Erro ao criar tabela log_force_comunic ' + #13 + #13 +
                    'Mensagem original: ' + E.Message, TMsgDlgType.mtError, [mbOK], 0);
      end;
    end;

    Qry.SQL.Clear;
    Qry.SQL.Add('CREATE TABLE IF NOT EXISTS log_force_comunic_tabela '+ '(' +
                ' log_force_comunic_tabela_id INT PRIMARY KEY AUTO_INCREMENT, ' +
                ' log_force_comunic_id INT NOT NULL, ' +
                ' tabela VARCHAR(60) NOT NULL, ' +
                ' total_registros INT NOT NULL, ' +
                ' filtro_utilizado VARCHAR(200), ' +
                ' direcao_comunicacao CHAR(3) NOT NULL, ' +
                ' FOREIGN KEY (log_force_comunic_id) REFERENCES log_force_comunic (log_force_comunic_id) ' +
                ');');
    try
      Qry.ExecSQL;
    except on E : EDatabaseError do
      begin
        Result := False;
        MessageDlg('Erro ao criar tabela log_force_comunic_tabela ' + #13 + #13 +
                    'Mensagem original: ' + E.Message, TMsgDlgType.mtError, [mbOK], 0);
      end;

    end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;

end;

procedure TfrmConfirmacaoEnvio.pnlContinuarClick(Sender: TObject);
var Qry : TFDQuery;
begin

  if not CriarTabelasLog then
    abort;

  if direcao = 'C' then
  begin
  try
    Qry :=  TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipal.ConnCentral;
    Qry.SQL.Clear;
    if filtrosWhere <> '' then
      Qry.SQL.Add('UPDATE ' + nomeTabela + ' SET lojas_leram = "' + '*' + '" WHERE ' + filtrosWhere )
    else
      Qry.SQL.Add('UPDATE ' + nomeTabela + ' SET lojas_leram = "' + '*' + '"');

  try
    Qry.ExecSQL;
  except
     ShowMessage('Erro ao  mudar lojas_leram');
  end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
  end;

  if direcao = 'L' then
  begin
    try
    Qry :=  TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipal.ConnLoja;
    Qry.SQL.Clear;
    if filtrosWhere <> '' then
      Qry.SQL.Add('UPDATE ' + nomeTabela + ' SET lojas_leram = "' + codFisica + '" WHERE ' + filtrosWhere )
    else
      Qry.SQL.Add('UPDATE ' + nomeTabela + ' SET lojas_leram = "' + codFisica + '" ');

  try
    Qry.ExecSQL;
  except
     ShowMessage('Erro ao mudar  lojas_leram');
  end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;

  end;

  //gravarLog();

  frmFinal := TfrmFinal.Create(Self);
  frmFinal.ShowModal;
  frmConfirmacaoEnvio.Close;

end;

procedure TfrmConfirmacaoEnvio.pnlVoltarClick(Sender: TObject);
begin
  frmConfirmacaoEnvio.Close;
end;

end.
