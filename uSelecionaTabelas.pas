unit uSelecionaTabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDtmPrincipal, System.IniFiles, uEnum,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Enter, uFiltros;

type
  TfrmSelecionaTabelas = class(TForm)
    qryTabelas: TFDQuery;
    dtsTabelas: TDataSource;
    qryTabelastabela: TStringField;
    qryTabelasenvia_matriz: TStringField;
    qryTabelasrecebe_matriz: TStringField;
    Panel1: TPanel;
    ShapeFiltro: TShape;
    PanelFiltroCaption: TPanel;
    Label2: TLabel;
    edtFiltroTabela: TEdit;
    gridTabelas: TDBGrid;
    Panel2: TPanel;
    Shape1: TShape;
    lblSelecionarTabela: TLabel;
    Panel3: TPanel;
    lblAtalhos: TLabel;
    Image1: TImage;
    Image2: TImage;
    Panel5: TPanel;
    Shape2: TShape;
    Panel6: TPanel;
    btnFiltrarRegistros: TBitBtn;
    ImageLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFiltroTabelaChange(Sender: TObject);
    procedure btnFiltrarRegistrosClick(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter : TMREnter;
    function VerificaTabelaSelecionada : Boolean;
    function Crypt(Action, Src, Key : String) : String;
  public
    { Public declarations }
    codFisica : Integer;

  end;

var
  frmSelecionaTabelas: TfrmSelecionaTabelas;

const
  ARQ_INI = 'sistema_big.ini';

implementation

{$R *.dfm}

uses ULoginSuporte;

procedure TfrmSelecionaTabelas.FormShow(Sender: TObject);
begin
  qryTabelas.Connection := dtmPrincipal.ConnLoja;
  qryTabelas.Open();
end;

function TfrmSelecionaTabelas.VerificaTabelaSelecionada: Boolean;
var Qry : TFDQuery;
begin
  try
    Result := True;
    Qry :=  TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipal.ConnCentral;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT * FROM ' +  qryTabelas.FieldByName('tabela').AsString + ' LIMIT 0,1');

  try
        Qry.Open();
      except on E : EDatabaseError do
      begin
        MessageDlg('Não é possível forçar comunicação da tabela ' + qryTabelas.FieldByName('tabela').AsString + #13 + #13 +
                   'Mensagem original: ' + E.Message, TMsgDlgType.mtError, [mbOK], 0);
        Result := False;
      end;

      end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);

  end;

end;

procedure TfrmSelecionaTabelas.btnFiltrarRegistrosClick(Sender: TObject);
begin
  if VerificaTabelaSelecionada then
  begin
    frmFiltros := TfrmFiltros.Create(Self);
    frmFiltros.nomeTabela := qryTabelas.FieldByName('tabela').AsString;
    frmFiltros.codFisica := codFisica.ToString;
    frmFiltros.ShowModal;
    frmFiltros.Release;
  end;

end;

function TfrmSelecionaTabelas.Crypt(Action, Src, Key: String): String;
var
  KeyLen : Integer;
  KeyPos : Integer;
  offset : Integer;
  dest : string;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  dest:='';
  KeyLen:=Length(Key);
  KeyPos:=0;
  //SrcPos:=0;
  //SrcAsc:=0;
  Range:=256;
  if Action = UpperCase('E') then
    begin
    Randomize;
    offset:=Random(Range);
    dest:=format('%1.2x',[offset]);
    for SrcPos := 1 to Length(Src) do
    begin
    SrcAsc:=(Ord(Src[SrcPos]) + offset) MOD 255;



  if KeyPos < KeyLen then
  KeyPos:= KeyPos + 1 else KeyPos:=1;



  SrcAsc:= SrcAsc xor Ord(Key[KeyPos]);
  dest:=dest + format('%1.2x',[SrcAsc]);
  offset:=SrcAsc;
  end;
  end;



  if Action = UpperCase('D') then
  begin
  offset:=StrToInt('$'+ copy(src,1,2));
  SrcPos:=3;
  repeat
  SrcAsc:=StrToInt('$'+ copy(src,SrcPos,2));



  if KeyPos < KeyLen Then
  KeyPos := KeyPos + 1 else KeyPos := 1;



  TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
  if TmpSrcAsc <= offset then
  TmpSrcAsc := 255 + TmpSrcAsc - offset
  else
  TmpSrcAsc := TmpSrcAsc - offset;



  dest := dest + chr(TmpSrcAsc);
  offset:=srcAsc;
  SrcPos:=SrcPos + 2;
  until SrcPos >= Length(Src);
  end;
  Crypt:=dest;
end;


procedure TfrmSelecionaTabelas.edtFiltroTabelaChange(Sender: TObject);
begin
  qryTabelas.Locate('tabela', TEdit(Sender).Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmSelecionaTabelas.FormCreate(Sender: TObject);
var
  ArqINI: TIniFile;
  FLoginSuporte : TFLoginSuporte;
begin

  ArqINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + ARQ_INI);

  {$REGION ' sistema_big.ini '}
    codFisica := 0;
    codFisica := ArqINI.ReadInteger('FilialMatriz', 'CodFisica', 0);
  {$ENDREGION}

  TeclaEnter := TMREnter.Create(Self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clInfoBk;

  {$REGION 'Conexão Loja'}
  try
    dtmPrincipal := TdtmPrincipal.Create(Self);
    dtmPrincipal.DriverMysql.VendorLib := GetCurrentDir + '\libmySQL.dll';
    with dtmPrincipal.ConnLoja do
    begin
      Params.Database := ArqINI.ReadString('ip', 'database', '');
      Params.UserName := 'root';
      //Params.Password := '123456big';
      Params.Password := Crypt('D', ArqINI.ReadString('ip', 'senha', '') , 'GIB');
      Params.DriverID := 'MYSQL';
      Params.Values['Server'] := ArqINI.ReadString('ip', 'local', '');
      Connected := true;
    end;
  except
    MessageDlg('Não foi possível conectar com o banco de dados Loja', TMsgDlgType.mtError, [mbOK], 0);
    Application.Terminate;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Conexão Central'}
  try
    with dtmPrincipal.ConnCentral do
    begin
      Params.Database := ArqINI.ReadString('ip', 'databasecentral', '');
      Params.UserName := 'root';
      Params.Password := Crypt('D', ArqINI.ReadString('ip', 'senha', '') , 'GIB');
      Params.DriverID := 'MYSQL';
      Params.Values['Server'] := ArqINI.ReadString('ip', 'central', '');
      Connected := true;
    end;

  except
    MessageDlg('Não foi possível conectar com o banco de dados Central', TMsgDlgType.mtError, [mbOK], 0);
    Application.Terminate;
    Exit;
  end;

  {$ENDREGION}

  try
      FLoginSuporte := TFLoginSuporte.Create(Self);
      FLoginSuporte.ShowModal;
      if not (FLoginSuporte.ModalResult = MrOk) then
      Application.Terminate

    finally
      FLoginSuporte.Free;
    end;

end;


end.
