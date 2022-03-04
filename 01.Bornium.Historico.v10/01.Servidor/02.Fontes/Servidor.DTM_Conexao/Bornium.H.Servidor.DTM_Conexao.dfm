object DTM_Conexao: TDTM_Conexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 255
  Width = 518
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 56
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Server=127.0.0.1'
      'Database=Bornium'
      'DriverID=Mongo')
    LoginPrompt = False
    Left = 48
    Top = 56
  end
  object FDPhysMongoDriverLink1: TFDPhysMongoDriverLink
    Left = 376
    Top = 56
  end
end
