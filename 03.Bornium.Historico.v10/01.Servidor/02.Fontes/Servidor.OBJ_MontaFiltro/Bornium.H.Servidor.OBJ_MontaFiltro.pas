unit Bornium.H.Servidor.OBJ_MontaFiltro;

interface

uses
  System.SysUtils, Geral.A03_001.TIPO_TCodTabela;

Type
  TOBJ_MontaFiltro = Class(TObject)

  public

   function Executar(ACodEmpresa:Integer; ACodProcesso :TCodTabela; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime) :String;


  End;

implementation

uses
  Bornium.H.Servidor.OBJ_MontaFiltro_PAIS,
  Bornium.H.Servidor.OBJ_MontaFiltro_CIDADE,
  Bornium.H.Servidor.OBJ_MontaFiltro_ESTADO,
  Bornium.H.Servidor.OBJ_MontaFiltro_PRODUTO,
  Bornium.H.Servidor.OBJ_MontaFiltro_TELEVENDA,
  Bornium.H.Servidor.OBJ_MontaFiltro_CLIENTE,
  Bornium.H.Servidor.OBJ_MontaFiltro_FORNECEDOR;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TOBJ_MontaFiltro.Executar(ACodEmpresa:Integer; ACodProcesso :TCodTabela; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime): String;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  case ACodProcesso of
    TCodTabela.CIDADE     : Result:= TOBJ_MontaFiltro_CIDADE      .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.CLIENTE    : Result:= TOBJ_MontaFiltro_CLIENTE     .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.ESTADO     : Result:= TOBJ_MontaFiltro_ESTADO      .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.FORNECEDOR : Result:= TOBJ_MontaFiltro_FORNECEDOR  .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.PAIS       : Result:= TOBJ_MontaFiltro_PAIS        .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.PRODUTO    : Result:= TOBJ_MontaFiltro_PRODUTO     .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
    TCodTabela.TELEVENDA  : Result:= TOBJ_MontaFiltro_TELEVENDA   .getInstance.Executar(ACodEmpresa, ACodRegistro, ANomeUsuario, ADataInicio);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

end.
