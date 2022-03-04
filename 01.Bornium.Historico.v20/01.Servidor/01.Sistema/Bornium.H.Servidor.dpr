program Bornium.H.Servidor;

uses
  MidasLib,
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Bornium.H.Servidor.DTM_FPrincipal in '..\02.Fontes\Servidor.DTM_FPrincipal\Bornium.H.Servidor.DTM_FPrincipal.pas' {DTM_FPrincipal: TDataModule},
  Bornium.H.Servidor.DAO_Processo in '..\02.Fontes\Servidor.DAO_Processo\Bornium.H.Servidor.DAO_Processo.pas' {DAO_Processo: TDSServerModule},
  Bornium.H.Servidor.DTM_Conexao in '..\02.Fontes\Servidor.DTM_Conexao\Bornium.H.Servidor.DTM_Conexao.pas' {DTM_Conexao: TDataModule},
  Bornium.H.Servidor.OBJ_RegistraServerClass in '..\02.Fontes\Servidor.OBJ_RegistraServerClass\Bornium.H.Servidor.OBJ_RegistraServerClass.pas',
  Geral.Servidor.DTM_ServerClass in '..\..\..\21.Geral.Servidor\Geral.Servidor.DTM_ServerClass\Geral.Servidor.DTM_ServerClass.pas' {DTM_ServerClass: TDataModule},
  Geral.A07_008.OBJ_LogWin in '..\..\..\23.Geral.Pacotes\PAC_A07\A07_008_RotinasGeral\02_Fontes\OBJ_LogWin\Geral.A07_008.OBJ_LogWin.pas',
  Bornium.H.Servidor.FRM_FPrincipal in '..\02.Fontes\Servidor.FRM_FPrincipal\Bornium.H.Servidor.FRM_FPrincipal.pas' {FRM_FPrincipal},
  Bornium.H.Servidor.CTE_VersaoServidor in '..\02.Fontes\Servidor.CTE_VersaoServidor\Bornium.H.Servidor.CTE_VersaoServidor.pas',
  Geral.A03_001.TIPO_TCodTabela in '..\..\..\23.Geral.Pacotes\PAC_A03\A03_001_DeclaracaoTipo\02_Fontes\TIPO_TCodTabela\Geral.A03_001.TIPO_TCodTabela.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro in '..\02.Fontes\Servidor.OBJ_MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_ESTADO in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_ESTADO.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_ColecaoPadrao in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_ColecaoPadrao.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_TELEVENDA in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_TELEVENDA.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_PRODUTO in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_PRODUTO.pas',
  Geral.A03_001.TIPO_TLogSistemaCampo in '..\..\..\23.Geral.Pacotes\PAC_A03\A03_001_DeclaracaoTipo\02_Fontes\TIPO_TLogSistemaCampo\Geral.A03_001.TIPO_TLogSistemaCampo.pas',
  Geral.A03_001.TIPO_TLogSistemaInfo in '..\..\..\23.Geral.Pacotes\PAC_A03\A03_001_DeclaracaoTipo\02_Fontes\TIPO_TLogSistemaInfo\Geral.A03_001.TIPO_TLogSistemaInfo.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_FORNECEDOR in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_FORNECEDOR.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_CLIENTE in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_CLIENTE.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_PAIS in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_PAIS.pas',
  Bornium.H.Servidor.OBJ_MontaFiltro_CIDADE in '..\03.Fontes.MontaFiltro\Bornium.H.Servidor.OBJ_MontaFiltro_CIDADE.pas',
  Geral.A10_009.OBJ_Texto in '..\..\..\23.Geral.Pacotes\PAC_A10\A10_009_OBJ_Texto\02_Fontes\Geral.A10_009.OBJ_Texto.pas',
  Bornium.H.Servidor.A00_Revisao in '..\02.Fontes\Bornium.H.Servidor.A00_Revisao\Bornium.H.Servidor.A00_Revisao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_FPrincipal, FRM_FPrincipal);
  Application.Run;
end.

