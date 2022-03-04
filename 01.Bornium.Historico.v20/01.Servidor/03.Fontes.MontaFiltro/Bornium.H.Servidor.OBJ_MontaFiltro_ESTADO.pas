unit Bornium.H.Servidor.OBJ_MontaFiltro_ESTADO;

interface

uses
  Bornium.H.Servidor.OBJ_MontaFiltro_ColecaoPadrao;

Type
  TOBJ_MontaFiltro_ESTADO = Class(TOBJ_ColecaoPadrao)

    class function getInstance : TOBJ_MontaFiltro_ESTADO;

    function Executar(ACodEmpresa :Integer; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime) :String; Override;

  End;

implementation

uses
  System.SysUtils, Variants;

var
  oTabela :TOBJ_MontaFiltro_ESTADO;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

class function TOBJ_MontaFiltro_ESTADO.getInstance: TOBJ_MontaFiltro_ESTADO;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  if not Assigned(oTabela) then begin
    oTabela:= TOBJ_MontaFiltro_ESTADO.ObjCriar;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Result:= oTabela;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TOBJ_MontaFiltro_ESTADO.Executar(ACodEmpresa :Integer; ACodRegistro :Variant; ANomeUsuario :String; ADataInicio :TDateTime): String;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oFiltro.Clear;
  oFiltro.Append('{');
  oFiltro.Append(' "' + UpperCase('cdEmpresa') + '":"' + ACodEmpresa  .toString + '"');
  oFiltro.Append(',"' + UpperCase('cdEstado')  + '":"' + VarToStr(ACodRegistro) + '"');
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