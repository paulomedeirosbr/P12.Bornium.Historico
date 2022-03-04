

unit Bornium.H.MongoDB.DTM_DHistorico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TDTM_DHistorico = class(TDataModule)
    TabPadrao: TClientDataSet;
    DspPadraoConection: TDSProviderConnection;
    TabInformacao: TClientDataSet;
    TabInformacaoElem: TADTField;
    TabInformacaoElemNomeFisico: TWideStringField;
    TabInformacaoElemNomeLogico: TWideStringField;
    TabInformacaoElemInfoAntiga: TWideStringField;
    TabInformacaoElemInfoNova: TWideStringField;
    TabPadrao_id: TWideStringField;
    TabPadraoinfo: TDataSetField;
    TabPadraocdEmpresa: TWideStringField;
    TabPadraocdUsuario: TWideStringField;
    TabPadraoNomeUsuario: TWideStringField;
    TabPadraoData: TWideStringField;
  private

    FCodEmpresa  : Integer;
    FCodProcesso : Integer;
    FCodRegistro : Variant;

  public

    property CodEmpresa  :Integer write FCodEmpresa;
    property CodProcesso :Integer write FCodProcesso;
    property CodRegistro :Variant write FCodRegistro;

    procedure Consultar(ANomeUsuario :String;  ADataInicio :TDateTime);

  end;

implementation

uses
  System.Variants;

{$R *.dfm}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDTM_DHistorico.Consultar(ANomeUsuario :String; ADataInicio :TDateTime);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  TabInformacao.DataSetField:= nil;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    TabPadrao.Close;
    TabPadrao.Data:= TabPadrao.DataRequest(VarArrayOf([FCodEmpresa, FCodProcesso, FCodRegistro, ANomeUsuario, ADataInicio]));
  except
    TabPadrao.Close;

    raise Exception.Create('Alterações não encontradas.');
  end;

  if not TabPadrao.IsEmpty then begin
    TabInformacao.DataSetField:= (TabPadrao.FieldByName('Info') as TDataSetField);
//        dsCoords.DataSet :=      (FDMongoQuery1.FieldByName('address.coord') as TDataSetField).NestedDataSet;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

end.
