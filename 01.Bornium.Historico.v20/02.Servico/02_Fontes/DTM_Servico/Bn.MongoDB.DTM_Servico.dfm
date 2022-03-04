object Bornium_MongoDB: TBornium_MongoDB
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'Bornium - Mongo DB'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 525
  Width = 608
end
