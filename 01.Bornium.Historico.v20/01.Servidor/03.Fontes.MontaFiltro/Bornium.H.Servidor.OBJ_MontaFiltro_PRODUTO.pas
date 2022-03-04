unit Bornium.H.Servidor.OBJ_MontaFiltro_PRODUTO;

interface

uses
  Bornium.H.Servidor.OBJ_MontaFiltro_ColecaoPadrao;

Type
  TOBJ_MontaFiltro_PRODUTO = Class(TOBJ_ColecaoPadrao)

    class function getInstance : TOBJ_MontaFiltro_PRODUTO;

    function Executar(ACodEmpresa :Integer; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime) :String; Override;

  End;

implementation

uses
  System.SysUtils, Variants;

var
  oTabela :TOBJ_MontaFiltro_PRODUTO;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

class function TOBJ_MontaFiltro_PRODUTO.getInstance: TOBJ_MontaFiltro_PRODUTO;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  if not Assigned(oTabela) then begin
    oTabela:= TOBJ_MontaFiltro_PRODUTO.ObjCriar;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Result:= oTabela;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TOBJ_MontaFiltro_PRODUTO.Executar(ACodEmpresa :Integer; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime): String;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oFiltro.Clear;
  oFiltro.Append('{');
  oFiltro.Append(' "' + UpperCase('cdEmpresa') + '":"' + ACodEmpresa  .toString + '"');
  oFiltro.Append(',"' + UpperCase('cdProduto') + '":"' + VarToStr(ACodRegistro) + '"');
  oFiltro.Append('}');
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Result:= oFiltro.ToString;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

initialization

finalization

   if Assigned(oTabela) then begin
     oTabela.ObjDestruir;
     oTabela:= nil;
   end;

end.