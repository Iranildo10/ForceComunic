// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://xxxxxxxxxx/InstaladorBIG/InstallBIG.dll/wsdl/IInstallBIG
// Encoding : utf-8
// Version  : 1.0
// (29/11/2010 11:32:30 - 1.33.2.5)
// ************************************************************************ //

unit Service.WSInstaladorBIGIntf;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:InstallBIGIntf-IInstallBIG
  // soapAction: urn:InstallBIGIntf-IInstallBIG#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IInstallBIGbinding
  // service   : IInstallBIGservice
  // port      : IInstallBIGPort
  // URL       : http://xxxxxxxxx/InstaladorBIG/InstallBIG.dll/soap/IInstallBIG
  // ************************************************************************ //
  IInstallBIG = interface(IInvokable)
  ['{5F935D85-27E8-DCE6-7523-12D152578CD1}']
    function  DadosClientes(const CNPJ: WideString): WideString; stdcall;
    function  CNPJCadastrado(const CNPJ: WideString): WideString; stdcall;
    function  TamanhoSistemaBIG: Double; stdcall;
    function  GetBIGPlus(const CNPJ: WideString): WideString; stdcall;
    function  GetLoginFuncionarioBIG(const iFuncionario_id: Integer; const sSenha: WideString): WideString; stdcall;
    function  GetNomeFuncionarioBIG(const iFuncionario_id: Integer): WideString; stdcall;
    function  SetDadosHardwareCliente(const sXML: WideString): WideString; stdcall;
    function  GetClienteBetaTeste(const sCNPJ: WideString): WideString; stdcall;
    function  GetHorarioVerao(const sEstado: WideString; const iAno: Integer): WideString; stdcall;
    function  GetNCM(sCapitulos: WideString): WideString; stdcall;
    function  GetCapitulos: WideString; stdcall;
    function  GetDadosCliente(const sCNPJ: WideString): WideString; stdcall;
  end;

function GetIInstallBIGIsOnLine(var SeverReturn:String):Boolean;
function GetIInstallBIG(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IInstallBIG;


implementation

uses  Helper.UWebServicesBIG;

function GetIInstallBIGIsOnLine(var SeverReturn:String):Boolean;
begin
  Result := TWebServicesBIG.TestHost(TWebServicesBIG.GetInstallBigURL(ttrApenasHost),TWebServicesBIG.GetInstallBigURL(ttrApenasPath),SeverReturn);
end;

function GetIInstallBIG(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IInstallBIG;
const
  defSvc  = 'IInstallBIGservice';
  defPrt  = 'IInstallBIGPort';
var
  RIO: THTTPRIO;
  defWSDL, defURL: String;
begin
  defWSDL := TWebServicesBIG.GetInstallBigWSDL;
  defURL  := TWebServicesBIG.GetInstallBigURL;
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IInstallBIG);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(IInstallBIG), 'urn:InstallBIGIntf-IInstallBIG', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IInstallBIG), 'urn:InstallBIGIntf-IInstallBIG#%operationName%');

end.
