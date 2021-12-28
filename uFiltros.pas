unit uFiltros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  uDtmPrincipal, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, RxToolEdit;

type
  TfrmFiltros = class(TForm)
    ComboBoxCampoTabela: TDBLookupComboBox;
    ComboBoxCondicoes: TComboBox;
    edtValor: TEdit;
    lblCampo: TLabel;
    lblCondicao: TLabel;
    lblValor: TLabel;
    qryCamposTabela: TFDQuery;
    dtsCamposTabela: TDataSource;
    qryCamposTabelaField: TStringField;
    qryCamposTabelaType: TStringField;
    lblTitulo: TLabel;
    lblNomeTabelaSelecionada: TLabel;
    pnlFiltros: TPanel;
    ShapeFiltro: TShape;
    PanelFiltroCaption: TPanel;
    btnBuscarRegistros: TBitBtn;
    Shape1: TShape;
    Panel1: TPanel;
    gridTabelas: TDBGrid;
    lblFiltrosWhere: TLabel;
    btnLimparFiltros: TBitBtn;
    btnForcarCentral: TBitBtn;
    btnAplicarFiltro: TBitBtn;
    qryRegistros: TFDQuery;
    dtsRegistros: TDataSource;
    btnForcarLoja: TBitBtn;
    lblComunicar: TLabel;
    edtValor1: TEdit;
    edtValor2: TEdit;
    edtHora1: TMaskEdit;
    edtHora2: TMaskEdit;
    qryTotalRegistros: TFDQuery;
    DateTime1: TDateEdit;
    DateTime2: TDateEdit;
    lblTotalRegistros: TLabel;
    Image1: TImage;
    lblQuantidadeRegistros: TLabel;
    edtQuantidadeRegistros: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ComboBoxCampoTabelaExit(Sender: TObject);
    procedure btnBuscarRegistrosClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure btnAplicarFiltroClick(Sender: TObject);
    procedure btnForcarCentralClick(Sender: TObject);
    procedure btnForcarLojaClick(Sender: TObject);
    procedure ComboBoxCondicoesExit(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure edtQuantidadeRegistrosExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtivaCampoValor;
    procedure AtivaCampoValoresEntre;
    procedure AtivaCampoData;
    procedure AtivaCampoDataHora;
    procedure ValidaTipoDeDados(campo : String);
    procedure AceitaSomenteNumeros(opcao : Boolean);
    procedure LimpaCampos;
    procedure AtualizaLableFiltros;

    procedure PopularComboboxCondicoes(condicaoContemVisivel : Boolean);
    function TraduzirCondicao(condicao : String) : String;
    function ValidaValores() : String;
  public
    { Public declarations }
    totalRegistros : Integer;
    nomeTabela : String;
    tipoCampoTabela : String;
    filtrosWhere : String;
    codFisica : String;
    limit : Integer;

    procedure LojasLeramHexa();

  end;

var
  frmFiltros: TfrmFiltros;

implementation

{$R *.dfm}

uses uConfirmacaoEnvio;

{$REGION 'Procedures'}
procedure TfrmFiltros.LimpaCampos;
begin
  edtValor.Text := EmptyStr;
end;

procedure TfrmFiltros.LojasLeramHexa;
var
  codFisicaInt, i : Integer;
  hexa : String;
begin
  hexa := '.........ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$&+-!()={}[]<>;:abcdefghijklmnopqrstuvwxyz';
  codFisicaInt := codFisica.ToInteger;

  if codFisicaInt > 9 then
  begin
    for i := 10 to 79 do
    begin
      if codFisicaInt = i then
        codFisica := hexa[i];
    end;
  end;

end;

procedure TfrmFiltros.PopularComboboxCondicoes(condicaoContemVisivel: Boolean);
begin
  ComboBoxCondicoes.Items.Clear;
  ComboBoxCondicoes.Items.Add('igual a');
  ComboBoxCondicoes.Items.Add('maior que');
  ComboBoxCondicoes.Items.Add('menor que');
  ComboBoxCondicoes.Items.Add('maior ou igual a');
  ComboBoxCondicoes.Items.Add('menor ou igual a');
  ComboBoxCondicoes.Items.Add('diferente de');
  ComboBoxCondicoes.Items.Add('entre');
  if condicaoContemVisivel then
    ComboBoxCondicoes.Items.Add('contêm');
end;

function TfrmFiltros.TraduzirCondicao(condicao: String): String;
begin

  if condicao = 'igual a' then
    result := '='
  else if condicao = 'maior que' then
    result := '>'
  else if condicao = 'menor que' then
    result := '<'
  else if condicao = 'maior ou igual a' then
    result := '>='
  else if condicao = 'menor ou igual a' then
    result := '<='
  else if condicao = 'diferente de' then
    result := '<>'
  else if condicao = 'entre' then
    result := 'BETWEEN'
  else if condicao = 'contêm' then
    result := 'LIKE';

end;

procedure TfrmFiltros.ValidaTipoDeDados(campo: String);
begin
  tipoCampoTabela := '';
  //Inteiro
  if (campo[6] = 'n' ) or (campo[1] = 's') or (campo[1] = 'i') or (campo[7] = 'i') or (campo[3] = 'g')  then
  begin
    tipoCampoTabela := 'inteiro';

  end;
  //Real
  if (campo[3] = 'c') or (campo[1] = 'f') or (campo[3] = 'u') or (campo[4] = 'l')  then
  begin
    tipoCampoTabela := 'real';

  end;
  //Lógico
  if (campo = 'bit') or (campo = 'boolean')  then
  begin
    tipoCampoTabela := 'logico';

  end;
  //Date
  if (campo = 'date') then
  begin
    tipoCampoTabela := 'data';

  end;
  //DateTime
  if (campo = 'datetime') then
  begin
    tipoCampoTabela := 'datahora';

  end;
  //Caractere
  if (campo[4] = 'r') or (campo[3] = 'r') then
  begin
    tipoCampoTabela := 'caractere';

  end;
  //Texto
  if (campo[7] = 'x') or (campo[4] = 't') or (campo = 'mediumtext') or (campo = 'longtext') then
  begin
    tipoCampoTabela := 'texto';

  end;
  //Binário
  if (campo = 'tinyblob') or (campo = 'blob') or (campo = 'mediumblob') or (campo = 'longblog') then
  begin
    tipoCampoTabela := 'binario';

  end;
  //Coleção
  if (campo = 'enum') or (campo = 'set') then
  begin
    tipoCampoTabela := 'colecao';

  end;
  //Espacial
  if (campo = 'geometry') or (campo = 'point') or (campo = 'polygon') or (campo = 'multipolygon') then
  begin
    tipoCampoTabela := 'espacial';

  end;

end;

function TfrmFiltros.ValidaValores: String;
begin
  result := '';

  if ComboBoxCampoTabela.Text = '' then
  begin
    MessageDlg(' Escolha um campo da tabela', mtWarning, [mbOK], 0);
    abort;
  end;

  if ComboBoxCondicoes.Text = 'Condição' then
  begin
    MessageDlg('Escolha uma condição para filtrar os registros', mtWarning, [mbOK], 0);
    ComboBoxCondicoes.SetFocus;
    abort;
  end;

  //Campo valor
  if edtValor.Visible then
  begin
    if edtValor.Text = '' then
    begin
      MessageDlg(' Preencha o campo valor', mtWarning, [mbOK], 0);
      edtValor.SetFocus;
    end
    else
      result := '"'+edtValor.Text+'"';

    if ComboBoxCondicoes.Text = 'contêm' then
      result := '"%'+edtValor.Text+'%"';

  end;

  //Campos valores BEETWEEN
  if edtValor1.Visible and edtValor2.Visible  then
  begin
    if (edtValor1.Text = '') then
    begin
      MessageDlg(' Preencha o primeiro valor', mtWarning, [mbOK], 0);
      edtValor1.SetFocus;
    end
    else if (edtValor2.Text = '') then
    begin
      MessageDlg(' Preencha o segundo valor', mtWarning, [mbOK], 0);
      edtValor2.SetFocus;
    end
    else
      result := '"'+edtValor1.Text+'"' + ' AND ' + '"'+edtValor2.Text+'"';
  end;

  //Campo data
  if DateTime1.Visible and not(edtHora1.Visible) then
  begin
    if DateTime1.Text = '' then
    begin
      MessageDlg(' Defina a data', mtWarning, [mbOK], 0);
      DateTime1.SetFocus;
    end
    else
      result := '"'+DateToStr(DateTime1.Date)+'"';
  end;

  //Campo datahora
  if DateTime1.Visible and edtHora1.Visible then
  begin
    if DateTime1.Text = '' then
    begin
      MessageDlg(' Defina a data', mtWarning, [mbOK], 0);
      DateTime1.SetFocus;
    end
    else if edtHora1.Text = '' then
    begin
      MessageDlg(' Defina a hora', mtWarning, [mbOK], 0);
      edtHora1.SetFocus;
    end
    else
      result := '"'+formatdatetime('yyyy-mm-dd',(DateTime1.Date)) + ' ' + edtHora1.Text+'"';
  end;

  //Campo data BEETWEEN
  if DateTime1.Visible and DateTime2.Visible and edtHora1.Visible = false and edtHora2.Visible = false then
  begin
    if DateTime1.Text = '' then
    begin
      MessageDlg(' Defina a data inicio', mtWarning, [mbOK], 0);
      DateTime1.SetFocus;
    end
    else if DateTime2.Text = '' then
    begin
      MessageDlg(' Defina a data fim', mtWarning, [mbOK], 0);
      DateTime2.SetFocus;
    end
    else
      result := '"'+formatdatetime('yyyy-mm-dd',(DateTime1.Date))+'"' + ' AND ' + '"'+formatdatetime('yyyy-mm-dd',(DateTime1.Date))+'"';
  end;

  //Campo datahora BEETWEEN
  if DateTime1.Visible and DateTime2.Visible and edtHora1.Visible  and edtHora2.Visible  then
  begin
    if DateTime1.Text = '  /  /    ' then
    begin
      MessageDlg(' Defina a data inicio', mtWarning, [mbOK], 0);
      DateTime1.SetFocus;
    end
    else if edtHora1.Text = '  :  :  ' then
    begin
      MessageDlg(' Defina a hora inicio', mtWarning, [mbOK], 0);
      edtHora1.SetFocus;
    end
    else if DateTime2.Text = '  /  /    ' then
    begin
      MessageDlg(' Defina a data fim', mtWarning, [mbOK], 0);
      DateTime2.SetFocus;
    end
    else if edtHora2.Text = '  :  :  ' then
    begin
      MessageDlg(' Defina a hora fim', mtWarning, [mbOK], 0);
      edtHora2.SetFocus;
    end
    else
      result := '"'+formatdatetime('yyyy-mm-dd',(DateTime1.Date))+ ' ' + edtHora1.Text + '" AND "' + formatdatetime('yyyy-mm-dd',(DateTime1.Date))+ ' ' + edtHora2.Text +'"';
  end;

end;

procedure TfrmFiltros.AceitaSomenteNumeros(opcao : Boolean);
begin
  if opcao then
  begin
    edtValor.NumbersOnly := true;
    edtValor1.NumbersOnly := true;
    edtValor2.NumbersOnly := true;

  end
  else
  begin
    edtValor.NumbersOnly := false;
    edtValor1.NumbersOnly := true;
    edtValor2.NumbersOnly := true;
  end;


end;

procedure TfrmFiltros.AtivaCampoData;
begin
    DateTime1.Visible := true;
    DateTime1.Text := DateToStr(Date());
    DateTime2.Visible := false;
    edtValor1.Visible := false;
    edtValor2.Visible := false;
    edtValor.Visible := false;
    edtHora1.Visible := false;
    edtHora2.Visible := false;
end;

procedure TfrmFiltros.AtivaCampoDataHora;
begin
    DateTime2.Visible := false;
    edtValor1.Visible := false;
    edtValor2.Visible := false;
    edtValor.Visible := false;
    edtHora2.Visible := false;
    DateTime1.Visible := true;
    edtHora1.Visible := true;
    DateTime1.Text := DateToStr(Date());
    edtHora1.Text := TimeToStr(Time());

end;

procedure TfrmFiltros.AtivaCampoValor;
begin
    DateTime1.Visible := false;
    DateTime2.Visible := false;
    edtValor1.Visible := false;
    edtValor2.Visible := false;
    edtHora1.Visible := false;
    edtHora2.Visible := false;
    edtValor.Visible := true;
    edtValor.Text := '';

end;

procedure TfrmFiltros.AtivaCampoValoresEntre;
begin
    DateTime1.Visible := false;
    DateTime2.Visible := false;
    edtValor.Visible := false;
    edtHora1.Visible := false;
    edtHora2.Visible := false;
    edtValor1.Visible := true;
    edtValor2.Visible := true;
    edtValor1.Text := '';
    edtValor2.Text := '';

end;

procedure TfrmFiltros.AtualizaLableFiltros;
begin
  lblFiltrosWhere.Caption := filtrosWhere;
end;

procedure TfrmFiltros.btnAplicarFiltroClick(Sender: TObject);
begin
    if ValidaValores() = '' then
    begin
      abort;
    end;

    if filtrosWhere = '' then
        filtrosWhere := ComboBoxCampoTabela.Text + ' ' + TraduzirCondicao(ComboBoxCondicoes.Text) + ' ' + ValidaValores()
    else
      filtrosWhere := filtrosWhere + ' ' + ' AND ' + ComboBoxCampoTabela.Text + ' ' + TraduzirCondicao(ComboBoxCondicoes.Text) + ' ' + ValidaValores();

    AtualizaLableFiltros;

end;

{$ENDREGION}

{$REGION 'Eventos Form / Componentes'}

procedure TfrmFiltros.btnBuscarRegistrosClick(Sender: TObject);
var
  sql : String;
begin
  totalRegistros := 0;

  if (edtQuantidadeRegistros.Text = '') or (StrToInt(edtQuantidadeRegistros.Text) = 0) then
    edtQuantidadeRegistros.Text := '100';


  if filtrosWhere = '' then
  begin
    if (MessageDlg('Pesquisar registros sem um filtro pode ocasionar lentidão e até travamento do banco de dados! '+#13+#13+
                 'Deseja prosseguir sem adicionar um filtro?   ' , TMsgDlgType.mtWarning, [mbYes, mbNo], 0))= mrNo then
    begin
      abort;
    end;
    try
      sql := '';
      sql := 'SELECT * FROM ' +  nomeTabela + ' LIMIT 0,' + edtQuantidadeRegistros.Text;
      qryRegistros.SQL.Clear;
      qryRegistros.SQL.Add(sql);

      try
        qryRegistros.Open();
      except
        MessageDlg('Não foi possível localizar registros', TMsgDlgType.mtError, [mbOK], 0);
      end;

      try
        //Contar registros
        sql := 'SELECT COUNT(*) AS TOTAL FROM ' +  nomeTabela;
        qryTotalRegistros.SQL.Clear;
        qryTotalRegistros.SQL.Add(sql);
        qryTotalRegistros.Open();
        totalRegistros := qryTotalRegistros.FieldByName('TOTAL').AsInteger;
      except
        MessageDlg('Não foi possível contar quantos registros serão enviados', TMsgDlgType.mtError, [mbOK], 0);
      end;

    finally
      //if Assigned(qryRegistros) then
        //FreeAndNil(qryRegistros);

    end;

  end
  else
  begin
    try
      sql := '';
      sql := 'SELECT * FROM ' +  nomeTabela + ' WHERE ' + filtrosWhere + ' ' + ' LIMIT 0,' + edtQuantidadeRegistros.Text;
      qryRegistros.SQL.Clear;
      qryRegistros.SQL.Add(sql);

      try
        qryRegistros.Open();
      except
        MessageDlg('Não foi possível localizar registros, verifique se o filtro aplicado condiz com a condição e o valor desejado', TMsgDlgType.mtError, [mbOK], 0);
      end;

      try
        //Contar registros
        sql := 'SELECT COUNT(*) AS TOTAL FROM ' +  nomeTabela + ' WHERE ' + filtrosWhere;
        qryTotalRegistros.SQL.Clear;
        qryTotalRegistros.SQL.Add(sql);
        qryTotalRegistros.Open();
        totalRegistros := qryTotalRegistros.FieldByName('TOTAL').AsInteger;
      except
        MessageDlg('Não foi possível contar quantos registros serão enviados', TMsgDlgType.mtError, [mbOK], 0);
      end;

    finally
      //if Assigned(qryRegistros) then
        //FreeAndNil(qryRegistros);
    end;
  end;

  lblTotalRegistros.Caption := 'Total de registros: ' + IntToStr(totalRegistros);

end;

procedure TfrmFiltros.btnForcarCentralClick(Sender: TObject);
begin
  if totalRegistros = 0 then
  begin
    MessageDlg('Não há registros para comunicar', TMsgDlgType.mtInformation, [mbOK], 0);
    abort;
  end;

  frmConfirmacaoEnvio := TfrmConfirmacaoEnvio.Create(Self);
  frmConfirmacaoEnvio.lblQuantidadeRegistros.Caption := IntToStr(totalRegistros) + ' Registos serão reenviados para o servidor Loja.';
  frmConfirmacaoEnvio.direcao := 'C';
  frmConfirmacaoEnvio.filtrosWhere := filtrosWhere;
  frmConfirmacaoEnvio.nomeTabela := nomeTabela;
  frmConfirmacaoEnvio.codFisica := codFisica;
  frmConfirmacaoEnvio.ShowModal;
end;

procedure TfrmFiltros.btnForcarLojaClick(Sender: TObject);
begin
  if totalRegistros = 0 then
  begin
    MessageDlg('Não há registros para comunicar', TMsgDlgType.mtInformation, [mbOK], 0);
    abort;
  end;

  frmConfirmacaoEnvio := TfrmConfirmacaoEnvio.Create(Self);
  frmConfirmacaoEnvio.lblQuantidadeRegistros.Caption := IntToStr(totalRegistros) + ' Registos serão reenviados para o servidor Central.';
  frmConfirmacaoEnvio.direcao := 'L';
  frmConfirmacaoEnvio.filtrosWhere := filtrosWhere;
  frmConfirmacaoEnvio.nomeTabela := nomeTabela;
  frmConfirmacaoEnvio.codFisica := codFisica;
  frmConfirmacaoEnvio.ShowModal;

end;

procedure TfrmFiltros.btnLimparFiltrosClick(Sender: TObject);
begin
  filtrosWhere := '';
  AtualizaLableFiltros;

end;

procedure TfrmFiltros.ComboBoxCampoTabelaExit(Sender: TObject);
begin
    
    LimpaCampos;
    ValidaTipoDeDados(qryCamposTabela.FieldByName('Type').AsString);

    if tipoCampoTabela = 'datahora' then
    begin
      AtivaCampoDataHora;
      PopularComboboxCondicoes(false);
      abort;
    end;
    if tipoCampoTabela = 'data' then
    begin
      AtivaCampoData;
      PopularComboboxCondicoes(false);
      abort;
    end;
    if (tipoCampoTabela = 'inteiro') or (tipoCampoTabela = 'real')  then
    begin
      AceitaSomenteNumeros(true);
      AtivaCampoValor;
      PopularComboboxCondicoes(true);
      abort;
    end;
    if (tipoCampoTabela = 'espacial') or (tipoCampoTabela = 'colecao') or (tipoCampoTabela = 'binario') or (tipoCampoTabela = 'texto') or (tipoCampoTabela = 'caractere') or (tipoCampoTabela = 'logico') then
    begin
      AceitaSomenteNumeros(false);
      AtivaCampoValor;
      PopularComboboxCondicoes(true);
      abort;
    end;

end;

procedure TfrmFiltros.ComboBoxCondicoesExit(Sender: TObject);
begin
  if ComboBoxCondicoes.Text = 'entre' then
  begin
    if tipoCampoTabela = 'data' then
    begin
      DateTime2.Visible := true;
      DateTime2.Text := DateToStr(Date());
      abort;
    end;
    if tipoCampoTabela = 'datahora' then
    begin
      DateTime2.Visible := true;
      DateTime2.Text := DateToStr(Date());
      edtHora2.Visible := true;
      edtHora2.Text := TimeToStr(Time());
      abort;
    end;

    AtivaCampoValoresEntre;

  end;
  if ComboBoxCondicoes.Text <> 'entre' then
    ComboBoxCampoTabelaExit(Self);

end;

procedure TfrmFiltros.edtQuantidadeRegistrosExit(Sender: TObject);
begin
  if edtQuantidadeRegistros.Text = '' then
    edtQuantidadeRegistros.Text := '1';
end;

procedure TfrmFiltros.FormShow(Sender: TObject);
var
  sql : String;
begin

  edtQuantidadeRegistros.Text := '100';


  qryCamposTabela.Connection := dtmPrincipal.ConnCentral;
  dtsCamposTabela.DataSet := qryCamposTabela;

  ComboBoxCampoTabela.ListField := 'Field';
  ComboBoxCampoTabela.KeyField := 'Field';
  ComboBoxCampoTabela.ListSource := dtsCamposTabela;

  qryCamposTabela.SQL.Clear;
  sql := 'SHOW columns FROM ' +  nomeTabela;
  qryCamposTabela.SQL.Add(sql);
  qryCamposTabela.Open();

  qryRegistros.Connection := dtmPrincipal.ConnCentral;
  dtsRegistros.DataSet := qryRegistros;
  gridTabelas.DataSource := dtsRegistros;

  lblNomeTabelaSelecionada.Caption := nomeTabela;

  AtivaCampoValor;

  LojasLeramHexa;

end;
procedure TfrmFiltros.Image2Click(Sender: TObject);
begin
  limit := limit + 100;
  btnBuscarRegistros.Click();
end;

{$ENDREGION}

end.
