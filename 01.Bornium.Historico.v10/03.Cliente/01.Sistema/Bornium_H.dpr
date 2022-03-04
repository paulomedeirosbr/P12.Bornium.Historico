program Bornium_H;

uses
  Vcl.Forms,
  Bornium.H.FRM_FPrincipal in '..\02.Fontes\FRM_FPrincipal\Bornium.H.FRM_FPrincipal.pas' {FRM_FPrincipal},
  Bornium.H.DLG_TesteConexao in '..\02.Fontes\DLG_TesteConexao\Bornium.H.DLG_TesteConexao.pas' {DLG_DTesteConexao};

{$R *.res}

begin
//------------------------------------------------------------------------------
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_FPrincipal, FRM_FPrincipal);
  Application.Run;
//------------------------------------------------------------------------------
end.
