unit ULoginSuporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ExtCtrls, Vcl.Imaging.pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFLoginSuporte = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    Image1: TImage;
    txtMensagem: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EditLoginEnter(Sender: TObject);
    procedure EditSenhaEnter(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FLinxUsuarioID: Integer;
    FLinxUsuarioNome : String;

    procedure SetLinxUsuarioID(const Value: Integer);

    function GetLinxUsuarioID: Integer;
    function SalvarLogSuperUsuarioBig(superUsuarioBig, lojaOuCentral : Integer ; lojas_leram : String) : Boolean;

    procedure SetLinxUsuarioNome(const Value: String);
    function GetLinxUsuarioNome: String;

    function ValidarUsuario : Boolean;
  public
    { Public declarations }
    function LojasLeramHexa(codFisica : String) : String;
  published
    property LinxUsuarioID: Integer read GetLinxUsuarioID write SetLinxUsuarioID;
    property LinxUsuarioNome: String read GetLinxUsuarioNome write SetLinxUsuarioNome;
  end;

var
  FLoginSuporte: TFLoginSuporte;

implementation

uses
  Service.WSInstaladorBIGIntf, uSelecionaTabelas, uDtmPrincipal, uFiltros;

{$R *.dfm}

function TFLoginSuporte.SalvarLogSuperUsuarioBig(
  superUsuarioBig, lojaOuCentral: Integer ; lojas_leram : String): Boolean;
var
  Qry : TFDQuery;
  sequenciador : Integer;
begin
  try

    Result := True;

    Qry :=  TFDQuery.Create(nil);
    if lojaOuCentral = 1 then
      Qry.Connection := dtmPrincipal.ConnCentral
    else
      Qry.Connection := dtmPrincipal.ConnLoja;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT superusuariobig_log_id FROM superusuariobig_log ' +
                'ORDER BY superusuariobig_log_id DESC ' +
                'LIMIT 0,1 ');

    try
      Qry.Open;
      sequenciador := Qry.FieldByName('superusuariobig_log_id').value;
      sequenciador := sequenciador + 1000;

    except
      Result := False;
      abort;
    end;

    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO superusuariobig_log_id (superusuariobig_log_id, superusuariobig_id, lojas_leram, apagado, data_hora) ' +
                'VALUES (:superusuariobig_log_id, :superusuariobig_id, :lojas_leram, :apagado, :data_hora)');

    Qry.ParamByName('superusuariobig_log_id').value := sequenciador;
    Qry.ParamByName('superusuariobig_id').value     := superUsuarioBig;
    Qry.ParamByName('lojas_leram').value            := lojas_leram;
    Qry.ParamByName('apagado').value                := 'N';
    Qry.ParamByName('data_hora').value              := now;

    try
      Qry.ExecSQL;

    except
      Result := False;
      abort;
    end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;

end;

procedure TFLoginSuporte.SetLinxUsuarioID(const Value: Integer);
begin
  FLinxUsuarioID := Value;
end;

function TFLoginSuporte.GetLinxUsuarioID: Integer;
begin
  Result := FLinxUsuarioID;
end;

procedure TFLoginSuporte.SetLinxUsuarioNome(const Value: String);
begin
  FLinxUsuarioNome := Value;
end;

function TFLoginSuporte.GetLinxUsuarioNome: String;
begin
  Result := FLinxUsuarioNome;
end;

function TFLoginSuporte.LojasLeramHexa(codFisica: String): String;
var
  codFisicaInt, i : Integer;
  hexa : String;
begin
  hexa := '.........ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$&+-!()={}[]<>;:abcdefghijklmnopqrstuvwxyz';
  codFisicaInt := StrToInt(codFisica);

  if codFisicaInt > 9 then
  begin
    for i := 10 to 79 do
    begin
      if codFisicaInt = i then
        codFisica := hexa[i];
    end;
  end;

  Result := codFisica;

end;

procedure TFLoginSuporte.FormShow(Sender: TObject);
begin
  EditLogin.SetFocus;
end;

procedure TFLoginSuporte.EditLoginEnter(Sender: TObject);
begin
 //
end;

procedure TFLoginSuporte.EditSenhaEnter(Sender: TObject);
begin
  //
end;

procedure TFLoginSuporte.EditLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EditSenha.SetFocus;
end;

procedure TFLoginSuporte.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnOK.SetFocus;
end;

procedure TFLoginSuporte.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFLoginSuporte.btnOKClick(Sender: TObject);
var
valida : boolean;
begin

  try
    if ValidarUsuario then
    begin

      //valida := SalvarLogSuperUsuarioBig(5297, 2, '2');

      valida := True;

      if valida then
        ModalResult := mrOk
      else
        ShowMessage('Erro ao gravar log de Super Usu�rio Big.');
    end;
  except
    on e : Exception do
    begin
      Application.MessageBox(PChar('Falha ao validar usu�rio.' + sLineBreak + 'Motivo: ' + e.message), 'Erro', MB_ICONERROR);
    end;
  end;
end;

function TFLoginSuporte.ValidarUsuario: Boolean;
var
  strRetorno : String;
begin
  Result := False;

  if Trim(EditLogin.Text) = '' then
  begin
    Application.MessageBox('Defina um usu�rio', 'Aten��o',MB_ICONWARNING);
    EditLogin.SetFocus;
  end
  else if Trim(EditSenha.Text) = '' then
  begin
    Application.MessageBox('Defina uma senha','Aten��o',MB_ICONWARNING);
    EditSenha.SetFocus;
  end
  else
  begin
    strRetorno := GetIInstallBIG().GetLoginFuncionarioBIG(StrToIntDef(EditLogin.Text, 0), EditSenha.Text);

    LinxUsuarioID := StrToInt(GetIInstallBIG().GetLoginFuncionarioBIG(StrToIntDef(EditLogin.Text, 0), EditSenha.Text));
    LinxUsuarioNome :=GetIInstallBIG().GetNomeFuncionarioBIG(LinxUsuarioID);

    if Length(strRetorno) > 8 then
    begin
      Application.MessageBox(PChar(strRetorno), 'Aten��o', MB_ICONINFORMATION or MB_OK);
    end
    else if strRetorno = EditLogin.Text then
    begin
      Result := True;
    end; 
  end;
end;

end.
