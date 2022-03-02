unit Bornium.H.MongoDB.DLG_Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Datasnap.DBClient, Datasnap.DSConnect, Bornium.H.MongoDB.DTM_DHistorico;

type
  TDLG_DHistorico = class(TForm)
    PnInfoProcesso: TPanel;
    Label1: TLabel;
    PnProcesso: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label2: TLabel;
    CbxDataInicio: TCheckBox;
    BtConsultar: TBitBtn;
    EdData: TDateTimePicker;
    PnPrincipal: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    DsPadrao: TDataSource;
    DsInformacao: TDataSource;
    EdUsuario: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    PnCodRegistro: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BtConsultarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CbxDataInicioClick(Sender: TObject);

  private

    DTM : TDTM_DHistorico;

    procedure setCodEmpresa  (const Value: Integer);
    procedure setCodProcesso (const Value: Integer);
    procedure setCodRegistro (const Value: Variant);

    procedure VerJanela;

  public

    property CodEmpresa  :Integer write setCodEmpresa;
    property CodProcesso :Integer write setCodProcesso;
    property CodRegistro :Variant write setCodRegistro;

  end;

implementation

{$R *.dfm}

uses
  Geral.B01_002.DTM_ConexaoDS,
  Bornium.H.MongoDB.CTE_VersaoDLL, Geral.A01_001.TIPO_TCodTabela;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DHistorico.BtConsultarClick(Sender: TObject);
var
  DataInicio :TDateTime;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DataInicio:= EdData.DateTime;
  if not CbxDataInicio.Checked then begin
    DataInicio:= StrToDateTime('01/01/01');
  end;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  try
    DTM.Consultar(EdUsuario.Text, DataInicio);
  except
    Raise;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.FormCreate(Sender: TObject);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DTM:= TDTM_DHistorico.Create(Self);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Caption:= 'Histórico - ' + CTE_VERSAO_DLL;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  VerJanela;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.FormDestroy(Sender: TObject);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  FreeAndNil(DTM);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.setCodEmpresa(const Value: Integer);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DTM.CodEmpresa:= Value;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.setCodProcesso(const Value: Integer);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DTM.CodProcesso:= Value;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  PnProcesso.Caption:= ' ' + NomeTabela(TCodTabela(Value));
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.setCodRegistro(const Value: Variant);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DTM.CodRegistro:= Value;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  PnCodRegistro.Caption:= Value;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DHistorico.CbxDataInicioClick(Sender: TObject);
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  VerJanela;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

procedure TDLG_DHistorico.VerJanela;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  EdData.Enabled:= CbxDataInicio.Checked;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;


end.
