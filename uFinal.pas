unit uFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, uSelecionaTabelas;

type
  TfrmFinal = class(TForm)
    pnlConcluir: TPanel;
    Image1: TImage;
    lblConfirmacaoEnvio: TLabel;
    lblQuantidadeRegistros: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure pnlConcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinal: TfrmFinal;

implementation

{$R *.dfm}

procedure TfrmFinal.pnlConcluirClick(Sender: TObject);
begin
  frmFinal.Close;

end;

end.
