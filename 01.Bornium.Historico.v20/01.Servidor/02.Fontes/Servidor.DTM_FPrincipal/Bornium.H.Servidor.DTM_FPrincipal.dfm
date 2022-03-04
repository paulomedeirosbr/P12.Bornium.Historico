object DTM_FPrincipal: TDTM_FPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 193
  Width = 461
  object Servidor: TDSServer
    OnConnect = ServidorConnect
    OnDisconnect = ServidorDisconnect
    AutoStart = False
    Left = 48
    Top = 35
  end
  object CMAuthManager: TDSAuthenticationManager
    Roles = <>
    Left = 296
    Top = 32
  end
  object Protocolo_TCPIP: TDSTCPServerTransport
    Port = 40000
    Server = Servidor
    Filters = <>
    Left = 168
    Top = 33
  end
end
