object FRM_FPrincipal: TFRM_FPrincipal
  Left = 0
  Top = 0
  Caption = 'Bornium.H - 1.00'
  ClientHeight = 341
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MnPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MnPrincipal: TMainMenu
    Left = 80
    Top = 96
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object miTesteConexao: TMenuItem
        Caption = 'Teste de Conex'#227'o'
        OnClick = miTesteConexaoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miSair: TMenuItem
        Caption = 'Sair'
        OnClick = miSairClick
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Bornium1: TMenuItem
        Caption = 'Bornium - Distribuidora'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object BorniumFbrica1: TMenuItem
        Caption = 'Bornium - F'#225'brica'
      end
    end
    object SobreoSistema1: TMenuItem
      Caption = 'Sobre...'
      object SobreaEmpresa1: TMenuItem
        Caption = 'Sobre a Empresa'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SobreoSistema2: TMenuItem
        Caption = 'Sobre o Sistema'
      end
    end
  end
end
