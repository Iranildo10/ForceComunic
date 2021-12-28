unit Helper.UConstantesBig;

interface


type
  TConstantesBigClass = class
  private
    class function Crypt(Action, Src, Key: String): String;
    class function ExecuteScalar(const Sql: String; const DefaultValue: Variant): Variant;
  public
    class function GetRazaoSocialEmpresa: String;
    class function GetCNPJEmpresa: String;
    class function GetCNPJEmpresaSoNum: String;
    class function GetNomeEmpresa: String;
    class function GetNomeSistema: String;
    class function GetNomeSistemaStart: String;
    class function GetTelefone: String;
    class function GetTelefone2: String;
    class function GetTelefoneFinanceiro : String;
    class function GetTelefoneComercial : String;
    class function GetTelefoneFinanceiroCompleto: String;
    class function GetDominioWebSiteEmpresa: String;
    class function GetWebSiteEmpresa: string;
    class function GetDominioWebSiteLinx: string;
    class function GetWebSiteLinx: string;

    class function GetSMTPEmpresa: String;
    class function GetSMTPUsuario: String;
    class function GetSMTPSenha: String;
    class function GetSMTPSenhaCriptografada: String;
    class function GetSMTPPorta: Integer;
    class function GetSMTPUtilizaCriptografia: Boolean;
    class function GetSMTPTipoCriptografia: TTipoCrypt;
    class function GetSMTPTipoCriptografiaAsString: String;

    class function GetWebServiceCasBrasil: String;
    class function GetWebServiceCotacaoOnline: String;
    class function GetWebSiteCotacaoOnline: String;
    class function GetWebServiceGestaoDeProjetos: String;
    class function GetWebServiceAtualizacaoDeCrm: String;
    class function GetWebServiceListaPec: String;
    class function GetWebServiceInstallBig: String;
    class function GetWebServicePedeSenha: String;
    class function GetWebServiceRelatorios: String;

    class function GetHostWebServicePedeSenha: String;
    class function GetHostWebServiceInstallBig: String;
    class function GetHostSuporte: String;
    class function GetHostChatLinx : String;

    class function GetHostShareLinx: String;
    class function GetArtigoDoShareLinx(const pageId: Int64): String; overload;
    class function GetArtigoDoShareLinx(const Code: String): String; overload;
    class function GetDicaLinxBig: String;
  end;

  ConstantesBig = TConstantesBigClass;

implementation

uses UDAO, SysUtils;

{ TConstSistemaBigClass }

function SoNumero(txt : string) : string;
var i : integer;
    x: String;
begin
   result := '';
   for i := 1 to length(txt) do
           if txt[i] in ['0'..'9'] then
                   x := x + txt[i];
   result := x;
end;

class function TConstantesBigClass.Crypt(Action, Src, Key: String): String;
var
   KeyLen    : Integer;
   KeyPos    : Integer;
   offset    : Integer;
   dest      : string;
   SrcPos    : Integer;
   SrcAsc    : Integer;
   TmpSrcAsc : Integer;
   Range     : Integer;
begin
   dest:='';
   KeyLen:=Length(Key);
   KeyPos:=0;
   Range:=256;
   if Action = UpperCase('E') then
   begin
        Randomize;
        offset:=Random(Range);
        dest:=format('%1.2x',[offset]);
        for SrcPos := 1 to Length(Src) do
        begin
             SrcAsc:=(Ord(Src[SrcPos]) + offset) MOD 255;
             if KeyPos < KeyLen then KeyPos:= KeyPos + 1 else KeyPos:=1;
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
              if KeyPos < KeyLen Then KeyPos := KeyPos + 1 else KeyPos := 1;
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

class function TConstantesBigClass.ExecuteScalar(const Sql: String; const DefaultValue: Variant): Variant;
var
  Conexao: TGlobalConnection;
begin
  Conexao := TDao.GetConnection;
  try
    Result := TDao.ExecuteScalar(conexao, Sql, DefaultValue);
  finally
    FreeAndNil(Conexao);
  end;
end;

class function TConstantesBigClass.GetCNPJEmpresa: String;
begin
  Result := '54.517.628/0001-98';
end;

class function TConstantesBigClass.GetCNPJEmpresaSoNum: String;
begin
  Result := SoNumero(GetCNPJEmpresa);
end;

class function TConstantesBigClass.GetDominioWebSiteEmpresa: String;
begin
  Result := 'bigsistemas.com.br';
end;

class function TConstantesBigClass.GetNomeEmpresa: string;
begin
  Result := 'Linx BIG Sistemas';
end;

class function TConstantesBigClass.GetNomeSistema: String;
begin
  Result := 'Linx BIG';
end;

class function TConstantesBigClass.GetRazaoSocialEmpresa: String;
begin
  Result := 'LINX SISTEMAS E CONSULTORIA LTDA';
end;

class function TConstantesBigClass.GetSMTPEmpresa: String;
begin
  Result := ExecuteScalar('SELECT host FROM email_notificacao_sistema', '');
end;

class function TConstantesBigClass.GetSMTPPorta: Integer;
begin
  Result := ExecuteScalar('SELECT porta FROM email_notificacao_sistema', 0);
end;

class function TConstantesBigClass.GetSMTPSenha: String;
begin
  try
    Result := Crypt('D', ExecuteScalar('SELECT senha FROM email_notificacao_sistema', ''), 'GIB');
  except
    Result := '';
  end;
end;

class function TConstantesBigClass.GetSMTPSenhaCriptografada: String;
begin
  Result := ExecuteScalar('SELECT senha FROM email_notificacao_sistema', '');
end;

class function TConstantesBigClass.GetSMTPTipoCriptografia: TTipoCrypt;
begin
  Result := TMapTypesCrypt.StringToTipoCrypt(ExecuteScalar('SELECT tipo_criptografia FROM email_notificacao_sistema', ''));
end;

class function TConstantesBigClass.GetSMTPTipoCriptografiaAsString: String;
begin
  Result := ExecuteScalar('SELECT tipo_criptografia FROM email_notificacao_sistema', '');
end;

class function TConstantesBigClass.GetSMTPUsuario: String;
begin
  Result := ExecuteScalar('SELECT email FROM email_notificacao_sistema', '');
end;

class function TConstantesBigClass.GetSMTPUtilizaCriptografia: Boolean;
begin
  Result := (ExecuteScalar('SELECT utiliza_criptografia FROM email_notificacao_sistema', 'N') = 'S');
end;

class function TConstantesBigClass.GetTelefone: String;
begin
  Result := '(17) 3313-0909';
end;

class function TConstantesBigClass.GetWebSiteEmpresa: string;
begin
  Result := 'www.' + GetDominioWebSiteEmpresa;
end;

class function TConstantesBigClass.GetWebServiceCasBrasil: String;
begin
  Result := 'http://cas.' + GetDominioWebSiteEmpresa + '/cas.asmx';
end;

class function TConstantesBigClass.GetWebServiceCotacaoOnline: String;
begin
  Result := 'http://cotacao.' + GetDominioWebSiteEmpresa + '/cotacaoservice.asmx';
end;

class function TConstantesBigClass.GetWebSiteCotacaoOnline: String;
begin
  Result := 'http://cotacao.' + GetDominioWebSiteEmpresa;
end;

class function TConstantesBigClass.GetWebServiceGestaoDeProjetos: String;
begin
  Result := 'http://gestaoprojetos.' + GetDominioWebSiteEmpresa + '/publicos_p.aspx';
end;

class function TConstantesBigClass.GetWebServiceAtualizacaoDeCrm: String;
begin
  Result := 'http://capturacrm.' + GetDominioWebSiteEmpresa + '/CapturaCRM.dll';
end;

class function TConstantesBigClass.GetWebServiceListaPec: String;
begin
  Result := 'http://pec.' + GetDominioWebSiteEmpresa + '/servicepec.asmx';
end;

class function TConstantesBigClass.GetWebServiceInstallBig: String;
begin
  Result := 'http://installbig.' + GetDominioWebSiteEmpresa + '/InstallBIG.dll';
end;

class function TConstantesBigClass.GetWebServicePedeSenha: String;
begin
  Result := 'http://pedesenha.' + GetDominioWebSiteEmpresa + '/PedeSenha.dll';
end;

class function TConstantesBigClass.GetWebServiceRelatorios: String;
begin
  Result := 'http://relatorios.' + GetDominioWebSiteEmpresa + '/wsrelatorios.asmx';
end;

class function TConstantesBigClass.GetHostWebServiceInstallBig: String;
begin
  Result := 'http://installbig.' + GetDominioWebSiteEmpresa;
end;

class function TConstantesBigClass.GetHostWebServicePedeSenha: String;
begin
  Result := 'http://pedesenha.' + GetDominioWebSiteEmpresa;
end;

class function TConstantesBigClass.GetHostSuporte: String;
begin
  result := 'http://suporte.' + GetDominioWebSiteEmpresa;
end;

class function TConstantesBigClass.GetTelefone2: String;
begin
  Result := '(17) 3313-0900';
end;

class function TConstantesBigClass.GetHostChatLinx: String;
begin
  Result := 'http://help.linx.com.br/livechat/';
end;

class function TConstantesBigClass.GetTelefoneFinanceiro: String;
begin
  Result := '0800 729 5469';
end;

class function TConstantesBigClass.GetArtigoDoShareLinx(const pageId: Int64): String;
begin
  Result := 'https://' + GetHostShareLinx + '/pages/viewpage.action?pageId=' + IntToStr(pageId);
end;

class function TConstantesBigClass.GetHostShareLinx: String;
begin
 Result := 'share.linx.com.br';
end;

class function TConstantesBigClass.GetArtigoDoShareLinx(
  const Code: String): String;
begin
  Result := 'https://' + GetHostShareLinx + '/x/' + Code;
end;

class function TConstantesBigClass.GetDicaLinxBig: String;
begin
  Result := GetArtigoDoShareLinx('5y4bAQ');
end;

class function TConstantesBigClass.GetTelefoneFinanceiroCompleto: String;
begin
  Result := '0800 729 5469 / (11) 2103-4321 opção 2 e opção 1 ou help.linx.com.br/adm/financeiro';
end;

class function TConstantesBigClass.GetNomeSistemaStart: String;
begin
  Result := 'Linx BIG START';
end;

class function TConstantesBigClass.GetDominioWebSiteLinx: string;
begin
  Result := 'linx.com.br';
end;

class function TConstantesBigClass.GetWebSiteLinx: string;
begin
  Result := 'www.' + GetDominioWebSiteLinx;
end;

class function TConstantesBigClass.GetTelefoneComercial: String;
begin
  Result := '(17) 3313-0906';
end;

end.

