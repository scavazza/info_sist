program infoSistemas;

uses
  Forms,
  untPessoa in 'untPessoa.pas' {frmPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPessoa, frmPessoa);
  Application.Run;
end.
