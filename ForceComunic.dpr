program ForceComunic;

uses
  Vcl.Forms,
  uSelecionaTabelas in 'uSelecionaTabelas.pas' {frmSelecionaTabelas},
  uDtmPrincipal in 'uDtmPrincipal.pas' {dtmPrincipal: TDataModule},
  uEnum in 'uEnum.pas',
  Enter in 'Enter.pas',
  uFiltros in 'uFiltros.pas' {frmFiltros},
  uConfirmacaoEnvio in 'uConfirmacaoEnvio.pas' {frmConfirmacaoEnvio},
  uFinal in 'uFinal.pas' {frmFinal},
  Helper.UWebServicesBIG in 'Helper.UWebServicesBIG.pas',
  Service.WSInstaladorBIGIntf in 'Service.WSInstaladorBIGIntf.pas',
  ULoginSuporte in 'ULoginSuporte.pas' {FLoginSuporte},
  cLogForceComunic in 'cLogForceComunic.pas',
  cLogForceComunicTabela in 'cLogForceComunicTabela.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSelecionaTabelas, frmSelecionaTabelas);
  Application.Run;
end.
