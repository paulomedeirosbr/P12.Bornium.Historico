program TesteDll;

uses
  MidasLib,
  Vcl.Forms,
  TesteDLL.FRM_FPrincipal in 'FRM_FPrincipal\TesteDLL.FRM_FPrincipal.pas' {FRM_FPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_FPrincipal, FRM_FPrincipal);
  Application.Run;
end.
