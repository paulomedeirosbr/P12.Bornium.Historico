//
// Created by the DataSnap proxy generator.
// 18/02/2020 18:12:10
//

unit Bornium.H.MongoDB.DAO_ConexaoMongoDB;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDAO_ProcessoClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FDspPadraoDataRequestCommand: TDBXCommand;
    FEstaConectandoCommand: TDBXCommand;
    FInfoGravarCommand: TDBXCommand;
    FInfoRecuperarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function DspPadraoDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    function EstaConectando: Boolean;
    function InfoGravar(ANomeArqDB: string; ANomeTabela: string; AInfo: string): string;
    function InfoRecuperar(ANomeArqDB: string; ANomeTabela: string; AInfo: string): string;
  end;

implementation

procedure TDAO_ProcessoClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDAO_Processo.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDAO_ProcessoClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDAO_Processo.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

function TDAO_ProcessoClient.DspPadraoDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
begin
  if FDspPadraoDataRequestCommand = nil then
  begin
    FDspPadraoDataRequestCommand := FDBXConnection.CreateCommand;
    FDspPadraoDataRequestCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDspPadraoDataRequestCommand.Text := 'TDAO_Processo.DspPadraoDataRequest';
    FDspPadraoDataRequestCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDspPadraoDataRequestCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDspPadraoDataRequestCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDspPadraoDataRequestCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDspPadraoDataRequestCommand.Parameters[1].Value.AsVariant := Input;
  FDspPadraoDataRequestCommand.ExecuteUpdate;
  Result := FDspPadraoDataRequestCommand.Parameters[2].Value.AsVariant;
end;

function TDAO_ProcessoClient.EstaConectando: Boolean;
begin
  if FEstaConectandoCommand = nil then
  begin
    FEstaConectandoCommand := FDBXConnection.CreateCommand;
    FEstaConectandoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEstaConectandoCommand.Text := 'TDAO_Processo.EstaConectando';
    FEstaConectandoCommand.Prepare;
  end;
  FEstaConectandoCommand.ExecuteUpdate;
  Result := FEstaConectandoCommand.Parameters[0].Value.GetBoolean;
end;

function TDAO_ProcessoClient.InfoGravar(ANomeArqDB: string; ANomeTabela: string; AInfo: string): string;
begin
  if FInfoGravarCommand = nil then
  begin
    FInfoGravarCommand := FDBXConnection.CreateCommand;
    FInfoGravarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInfoGravarCommand.Text := 'TDAO_Processo.InfoGravar';
    FInfoGravarCommand.Prepare;
  end;
  FInfoGravarCommand.Parameters[0].Value.SetWideString(ANomeArqDB);
  FInfoGravarCommand.Parameters[1].Value.SetWideString(ANomeTabela);
  FInfoGravarCommand.Parameters[2].Value.SetWideString(AInfo);
  FInfoGravarCommand.ExecuteUpdate;
  Result := FInfoGravarCommand.Parameters[3].Value.GetWideString;
end;

function TDAO_ProcessoClient.InfoRecuperar(ANomeArqDB: string; ANomeTabela: string; AInfo: string): string;
begin
  if FInfoRecuperarCommand = nil then
  begin
    FInfoRecuperarCommand := FDBXConnection.CreateCommand;
    FInfoRecuperarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInfoRecuperarCommand.Text := 'TDAO_Processo.InfoRecuperar';
    FInfoRecuperarCommand.Prepare;
  end;
  FInfoRecuperarCommand.Parameters[0].Value.SetWideString(ANomeArqDB);
  FInfoRecuperarCommand.Parameters[1].Value.SetWideString(ANomeTabela);
  FInfoRecuperarCommand.Parameters[2].Value.SetWideString(AInfo);
  FInfoRecuperarCommand.ExecuteUpdate;
  Result := FInfoRecuperarCommand.Parameters[3].Value.GetWideString;
end;

constructor TDAO_ProcessoClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDAO_ProcessoClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDAO_ProcessoClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FDSServerModuleDestroyCommand.DisposeOf;
  FDspPadraoDataRequestCommand.DisposeOf;
  FEstaConectandoCommand.DisposeOf;
  FInfoGravarCommand.DisposeOf;
  FInfoRecuperarCommand.DisposeOf;
  inherited;
end;

end.

