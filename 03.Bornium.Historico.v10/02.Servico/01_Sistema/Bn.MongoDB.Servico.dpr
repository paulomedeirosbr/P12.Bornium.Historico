program Bn.MongoDB.Servico;

uses
  Vcl.SvcMgr,
  Bn.MongoDB.DAO_Servidor in '..\..\02_Fontes\DTM_Servidor\Bn.MongoDB.DAO_Servidor.pas' {DTM_Servidor: TDataModule},
  Bn.MongoDB.DAO_Processo in '..\..\02_Fontes\DAO_Processo\Bn.MongoDB.DAO_Processo.pas' {DAO_Processo: TDSServerModule},
  Bn.MongoDB.OBJ_MongoDB in '..\..\02_Fontes\OBJ_MongoDB\Bn.MongoDB.OBJ_MongoDB.pas',
  Bn.MongoDB.OBJ_ControlePacote in '..\..\02_Fontes\OBJ_ControlePacote\Bn.MongoDB.OBJ_ControlePacote.pas',
  Bn.MongoDB.OBJ_Windows in '..\..\02_Fontes\OBJ_Windows\Bn.MongoDB.OBJ_Windows.pas',
  Bn.MongoDB.DTM_Servico in '..\02_Fontes\DTM_Servico\Bn.MongoDB.DTM_Servico.pas' {Bornium_MongoDB: TService};

(*

  Bn.MongoDB.DTM_Servico in '..\02_Fontes\DTM_Servico\Bn.MongoDB.DTM_Servico.pas' {Bornium_MongoDB: TService},

*)


{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBornium_MongoDB, Bornium_MongoDB);
  Application.CreateForm(TBornium_MongoDB, Bornium_MongoDB);
  Application.Run;
end.
