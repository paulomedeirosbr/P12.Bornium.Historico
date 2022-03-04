library Bornium.H.MongoDB;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  MidasLib,
  System.SysUtils,
  System.Classes,
  Bornium.H.MongoDB.Rotinas in '..\02.Fontes\MongoDB.Rotinas\Bornium.H.MongoDB.Rotinas.pas',
  Geral.B01_002.DTM_ConexaoDS in '..\..\..\23.Geral.Pacotes\PAC_B01\B01_002_DTM_ConexaoDS\02_Fontes\DTM_ConexaoDS\Geral.B01_002.DTM_ConexaoDS.pas' {DTM_ConexaoDS: TDataModule},
  Bornium.H.MongoDB.DTM_Processo in '..\02.Fontes\MongoDB.DTM_Processo\Bornium.H.MongoDB.DTM_Processo.pas' {DTM_Processo: TDataModule},
  Bornium.H.MongoDB.PRX_Processo in '..\02.Fontes\MongoDB.PRX_Processo\Bornium.H.MongoDB.PRX_Processo.pas',
  Bornium.H.MongoDB.DAO_ConexaoMongoDB in '..\02.Fontes\MongoDB.DAO_ConexaoMongoDB\Bornium.H.MongoDB.DAO_ConexaoMongoDB.pas',
  Bornium.H.MongoDB.DLG_Historico in '..\02.Fontes\MongoDB.DLG_Historico\Bornium.H.MongoDB.DLG_Historico.pas' {DLG_DHistorico},
  Bornium.H.MongoDB.DTM_DHistorico in '..\02.Fontes\MongoDB.DTM_DHistorico\Bornium.H.MongoDB.DTM_DHistorico.pas' {DTM_DHistorico: TDataModule},
  Bornium.H.MongoDB.CTE_VersaoDLL in '..\02.Fontes\MongoDB.CTE_VersaoDLL\Bornium.H.MongoDB.CTE_VersaoDLL.pas',
  Geral.A01_001.TIPO_TCodTabela in '..\..\..\23.Geral.Pacotes\PAC_A01\A01_001_DeclaracaoTipo.v1_04a\02_Fontes\TIPO_TCodTabela\Geral.A01_001.TIPO_TCodTabela.pas';

{$R *.res}

begin





end.
