unit Bornium.H.MongoDB.Rotinas;

interface

Uses
  Windows, System.Classes, System.SysUtils;

  function  FUNC_01_ConecaoAbrir(AServidor, APorta :WideString)  :Boolean; stdcall; export;
  function  FUNC_02_ConexaoFechar :Boolean; stdcall; export;

  procedure PROC_03_InfoGravar(ACodProcesso, AInformacao : WideString);  stdcall; export;

  procedure PROC_04_ApresentarHitorico(ACodEmpresa, ACodProcesso, ACodRegistro, AServidor, APorta :WideString); stdcall; export;

implementation

uses
  Geral.B01_002.DTM_ConexaoDS,
  Bornium.H.MongoDB.DTM_Processo,
  Bornium.H.MongoDB.DLG_Historico, Geral.A01_001.TIPO_TCodTabela;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function FUNC_VerEstaConectado: WideString; stdcall; export;
var
  ConexaoEstaAberta :Boolean;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    ConexaoEstaAberta:= TDTM_ConexaoDS.getInstance.ConexaoEstaAberta;
  except
    Raise;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  if ConexaoEstaAberta then begin
    Result:= '[0]'
  end  else begin
    Result:= '[1]'
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function FUNC_01_ConecaoAbrir(AServidor, APorta :WideString)  :Boolean; stdcall; export;
var
  oConexaoDS :TDTM_ConexaoDS;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oConexaoDS:= TDTM_ConexaoDS.getInstance;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oConexaoDS.NomeServidor:= AServidor;
  oConexaoDS.PortaConexao:= StrToIntDef(APorta, 0);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    Result:= oConexaoDS.ConexaoAbrir;
  except
    Raise;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function FUNC_02_ConexaoFechar :Boolean; stdcall; export;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    Result:= TDTM_ConexaoDS.getInstance.ConexaoFechar;
  except
    Raise;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure PROC_03_InfoGravar (ACodProcesso, AInformacao : WideString); stdcall; export;
var
  DProcesso   :TDTM_Processo;
  CodProcesso :TCodTabela;

begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    if FUNC_VerEstaConectado <> '[0]' then begin
      raise Exception.Create('Erro ao Conectar ao Banco de Dados MongoDB');
    end;
  except
    Raise;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  CodProcesso:= TCodTabela(StrToInt(ACodProcesso));
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DProcesso:= TDTM_Processo.Create(nil);
  try
    try
      DProcesso.RegistroGravar('BORNIUM', NomeTabela(CodProcesso), AInformacao);
    except
      Raise
    end;
  finally
    FreeAndNil(DProcesso);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure PROC_04_ApresentarHitorico(ACodEmpresa, ACodProcesso, ACodRegistro, AServidor, APorta :WideString); stdcall; export;
var
  DHistorico :TDLG_DHistorico;
  oConexao   :TDTM_ConexaoDS;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oConexao:= TDTM_ConexaoDS.getInstance;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oConexao.ConexaoFechar;
  oConexao.NomeServidor := AServidor;
  oConexao.PortaConexao := StrToInt(APorta);
  oConexao.ConexaoAbrir;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  if not oConexao.ConexaoEstaAberta then begin
    raise Exception.Create('Erro ao conectar com o Servidor Bornium.H');
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    DHistorico:= TDLG_DHistorico.Create(nil);
    DHistorico.CodEmpresa  := StrToIntDef(ACodEmpresa  , -1);
    DHistorico.CodProcesso := StrToIntDef(ACodProcesso , -1);
    DHistorico.CodRegistro := ACodRegistro;
    DHistorico.ShowModal;
  finally
    FreeAndNil(DHistorico);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

exports
  FUNC_01_ConecaoAbrir        index 1,
  FUNC_02_ConexaoFechar       index 2,
  PROC_03_InfoGravar          index 3,
  PROC_04_ApresentarHitorico  index 4;
end.