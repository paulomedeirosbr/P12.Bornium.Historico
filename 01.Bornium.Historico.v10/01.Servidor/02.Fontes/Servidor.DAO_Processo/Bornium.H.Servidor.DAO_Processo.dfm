object DAO_Processo: TDAO_Processo
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 225
  Width = 469
  object DspPadrao: TDataSetProvider
    OnDataRequest = DspPadraoDataRequest
    Left = 136
    Top = 24
  end
end
