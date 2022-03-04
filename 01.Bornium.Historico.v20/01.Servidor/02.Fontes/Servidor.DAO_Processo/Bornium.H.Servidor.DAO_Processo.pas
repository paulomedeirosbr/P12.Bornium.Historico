unit Bornium.H.Servidor.DAO_Processo;

//##############################################################################################################################################################
//
//  Objetivo:
//
//##############################################################################################################################################################
//
//  Revisão: xx/xx/xx - Quem - O que?
//
//##############################################################################################################################################################

interface

uses
  Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Datasnap.Provider, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Bornium.H.Servidor.DTM_Conexao, Bornium.H.Servidor.OBJ_MontaFiltro,
  Geral.A03_001.TIPO_TLogSistemaInfo, Geral.A10_009.OBJ_Texto;

type
  TDAO_Processo = class(TDSServerModule)
    DspPadrao: TDataSetProvider;

    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function DspPadraoDataRequest(Sender: TObject; Input: OleVariant): OleVariant;

  private

    oConexao            :TDTM_Conexao;
    oMontaFiltro        :TOBJ_MontaFiltro;
    oTexto              :TOBJ_Texto;
    oTabelaEstrutura_B  :TOBJ_TabEstrutura_B;

    procedure ConverteTXT_Lista(AInformacao :WideString);

  public

    function  EstaConectando :Boolean;

    function  InfoGravar   (ANomeArqDB, ANomeTabela, AInfo : String) :String;

  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils,
  FireDAC.Phys.MongoDBWrapper,
  Geral.A03_001.TIPO_TLogSistemaCampo,
  Geral.A03_001.TIPO_TCodTabela;

{$R *.dfm}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDAO_Processo.DSServerModuleCreate(Sender: TObject);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oConexao:= TDTM_Conexao.getInstance;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  QryPadrao.Connection:= oConexao.Conexao;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oTabelaEstrutura_B := TOBJ_TabEstrutura_B .Create;
  oMontaFiltro       := TOBJ_MontaFiltro    .Create;
  oTexto             := TOBJ_Texto.getInstance;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  QryPadrao.FetchOptions.Mode := fmAll;
  QryPadrao.CachedUpdates     := True;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDAO_Processo.DSServerModuleDestroy(Sender: TObject);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  FreeAndNil(oTabelaEstrutura_B);
  FreeAndNil(oMontaFiltro);;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TDAO_Processo.EstaConectando: Boolean;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Result:= oConexao.EstaConectando;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TDAO_Processo.InfoGravar(ANomeArqDB, ANomeTabela, AInfo: String) :String;
var
  oDoc       :TMongoDocument;
  oCampo     :TReg_CampoChave_B;
  oCampoInfo :TReg_CampoInfo_B;
  NumCampo   :Integer;

begin
  Exit;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  ConverteTXT_Lista(AInfo);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  oDoc := oConexao.FEnv.NewDoc;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    for oCampo in oTabelaEstrutura_B.oTabelaChave_B.ListaChave_B do begin
      oDoc.Add(oCampo.NomeCampoChave,oCampo.Info);
    end;
  except
    raise Exception.Create('Erro ao Recuperar Informações dos Atributos Chave!');
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    oDoc.BeginArray('info');
      NumCampo := 0;
      for oCampoInfo in oTabelaEstrutura_B.oTabelaCampo_B.ListaCampo_B do begin
        oDoc.BeginObject(NumCampo.ToString);
        oDoc.Add('Nome Fisico' ,oCampoInfo.NomeFisico);
        oDoc.Add('Nome Logico' ,oCampoInfo.NomeLogico);
        oDoc.Add('Info Antiga' ,oCampoInfo.InfoAntiga);
        oDoc.Add('Info Nova'   ,oCampoInfo.InfoNova);
        oDoc.EndObject;
        Inc(NumCampo);
      end;
    oDoc.EndArray;
  except
    raise Exception.Create('Erro ao Recuperar Informações dos Atributos de Informação!');
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    oConexao.FCon[ANomeArqDB][ANomeTabela].Insert(oDoc);
  except
    raise Exception.Create('Erro ao gravar a Informação no Bando de Dados MongoDB!');
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDAO_Processo.ConverteTXT_Lista(AInformacao :WideString);

Const
  CTE_NumCampo = 5;

var
  oLista : TStringList;
 // oInfo  : TStringList;
  i, j      : Integer;
  oRegChave  :TReg_CampoChave_B;
  oCampoInfo :TReg_CampoInfo_B;
  LinhaInfo  :String;


  Campo      :Array[1..CTE_NumCampo] of String;

begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    oLista := TStringList.Create;

    AInformacao:= oTexto.RetiraNovaLinha(AInformacao);

    while Length(AInformacao)  > 0 do begin
      LinhaInfo   := oTexto.CopiarTextoTag(AInformacao,'<LINHA>','</LINHA>');
      AInformacao := oTexto.RetiraTextoTag(AInformacao,'<LINHA>','</LINHA>');

      oLista.Add(LinhaInfo);
    end;

    oTabelaEstrutura_B.LiberarLista;
    for i := 0 to oLista.Count-1 do begin

      LinhaInfo:= oLista.Strings[i];

      for j := 1 to CTE_NumCampo do begin
        Campo[j]:= '';
      end;

      j:= 1;
      while Length(LinhaInfo) > 0 do begin
        Campo[j]    := oTexto.CopiarTextoTag(LinhaInfo,'<CAMPO>','</CAMPO>');
        LinhaInfo   := oTexto.RetiraTextoTag(LinhaInfo,'<CAMPO>','</CAMPO>');
        Inc(j);
      end;

      if Campo[1] = '1' then begin
        oRegChave.NomeCampoChave := Campo[2];
        oRegChave.Info           := Campo[3];
        oTabelaEstrutura_B.oTabelaChave_B.ListaChave_B.Add(oRegChave);
      end;

      if Campo[1] = '2' then begin
        oCampoInfo.NomeFisico := Campo[2];
        oCampoInfo.NomeLogico := Campo[3];
        oCampoInfo.InfoAntiga := Campo[4];
        oCampoInfo.InfoNova   := Campo[5];
        oTabelaEstrutura_B.oTabelaCampo_B.ListaCampo_B.Add(oCampoInfo);
      end;
    end;
  finally
    FreeAndNil(oLista);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

function TDAO_Processo.DspPadraoDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
var
  ATR_CodEmpresa   :Integer;
  ATR_CodProcesso  :TCodTabela;
  ATR_CodRegistro  :Variant;
  ATR_NomeUsuario  :String;
  ATR_DataInicio   :TDateTime;

begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  ATR_CodEmpresa  := StrToIntDef(Input[0], -1);
  ATR_CodProcesso := TCodTabela(StrToInt(Input[1]));
  ATR_CodRegistro := Input[2];
  ATR_NomeUsuario := Input[3];
  ATR_DataInicio  := StrToDateTime(Input[4]);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  QryPadrao.Close;
  QryPadrao.CollectionName:= NomeTabela(ATR_CodProcesso);
  QryPadrao.QMatch:= oMontaFiltro.Executar(ATR_CodEmpresa, ATR_CodProcesso, ATR_CodRegistro, ATR_NomeUsuario, ATR_DataInicio);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
   Result:= DspPadrao.Data;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

end.

