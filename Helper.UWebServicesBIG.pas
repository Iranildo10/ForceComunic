unit Helper.UWebServicesBIG;

interface

uses
  IdTCPClient, SysUtils, StrUtils;

type
  TTipoRetorno = (ttrCompleto,ttrApenasHost,ttrApenasPath);

  TWebServicesBIG = class
  public
    class function GetPegaSenhaURL  (TipoRetorno: TTipoRetorno = ttrCompleto): String;
    class function GetPegaSenhaWSDL (TipoRetorno: TTipoRetorno = ttrCompleto): String;
    class function GetInstallBigURL (TipoRetorno: TTipoRetorno = ttrCompleto): String;
    class function GetInstallBigWSDL(TipoRetorno: TTipoRetorno = ttrCompleto): String;
    class function TestHost(HostName: String;Path: String; var ReturnMsg: String): Boolean;
  end;
  WebServicesBIG = TWebServicesBIG;

implementation

{ TWebServicesBIG }

class function TWebServicesBIG.GetPegaSenhaURL(TipoRetorno: TTipoRetorno): String;
const
  URL = '/PedeSenha.dll/soap/IWebSenha';
begin
  Case TipoRetorno of
    ttrCompleto   : Result := 'http://pedesenha.bigsistemas.com.br' + URL;
    ttrApenasHost : Result := 'http://pedesenha.bigsistemas.com.br';
    ttrApenasPath : Result := URL;
  end;
end;

class function TWebServicesBIG.GetPegaSenhaWSDL(TipoRetorno: TTipoRetorno): String;
const
  URL = '/PedeSenha.dll/wsdl/IWebSenha';
begin
  Case TipoRetorno of
    ttrCompleto   : Result := 'http://pedesenha.bigsistemas.com.br' + URL;
    ttrApenasHost : Result := 'http://pedesenha.bigsistemas.com.br';
    ttrApenasPath : Result := URL;
  end;
end;

class function TWebServicesBIG.TestHost(HostName, Path: String;
  var ReturnMsg: String): Boolean;
var
  TcpClient: TidTcpClient;
begin
  try
    TcpClient := TidTcpClient.Create(nil);

    try
      TcpClient.Host := HostName;
      TcpClient.Port := 80;
      TcpClient.Connect;
      Result := TcpClient.Connected;
      if Result and (Trim(Path) <> '') then
      begin
  {$IFDEF DEBUG}
        TcpClient.IOHandler.Writeln('GET '+Path+' HTTP/1.1'+sLineBreak+
                         'Host: '+HostName+sLineBreak+sLineBreak);
        ReturnMsg := TcpClient.IOHandler.ReadLn();
        Result := AnsiEndsText('OK',ReturnMsg) or AnsiContainsText(ReturnMsg,' 200 ');
  {$ENDIF}
      end;
    except
      on e:Exception do
      begin
        Result := False;
        ReturnMsg := e.Message;
      end;
    end;
  finally
    TcpClient.Free;
  end;
end;

class function TWebServicesBIG.GetInstallBigURL(TipoRetorno: TTipoRetorno): String;
const
  URL = '/InstallBIG.dll/soap/IInstallBIG';
begin
  Case TipoRetorno of
    ttrCompleto   : Result := 'http://installbig.bigsistemas.com.br' + URL;
    ttrApenasHost : Result := 'http://installbig.bigsistemas.com.br';
    ttrApenasPath : Result := URL;
  end;
end;

class function TWebServicesBIG.GetInstallBigWSDL(TipoRetorno: TTipoRetorno): String;
const
  URL = '/InstallBIG.dll/wsdl/IInstallBIG';
begin
  Case TipoRetorno of
    ttrCompleto   : Result := 'http://installbig.bigsistemas.com.br' + URL;
    ttrApenasHost : Result := 'http://installbig.bigsistemas.com.br';
    ttrApenasPath : Result := URL;
  end;
end;

end.

