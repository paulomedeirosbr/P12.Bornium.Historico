object DTM_Processo: TDTM_Processo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 294
  Width = 431
  object DspPadraoConection: TDSProviderConnection
    SQLConnection = DTM_ConexaoDS.Conexao
    Left = 96
    Top = 40
  end
end
