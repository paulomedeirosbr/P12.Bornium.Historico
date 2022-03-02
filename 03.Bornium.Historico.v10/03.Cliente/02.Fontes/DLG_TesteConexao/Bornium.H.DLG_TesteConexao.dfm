object DLG_DTesteConexao: TDLG_DTesteConexao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Teste de Conex'#227'o'
  ClientHeight = 387
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 71
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object Label3: TLabel
    Left = 85
    Top = 56
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object BtConectar: TButton
    Left = 208
    Top = 184
    Width = 105
    Height = 57
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = BtConectarClick
  end
  object BtDesconectar: TButton
    Left = 352
    Top = 184
    Width = 97
    Height = 57
    Caption = 'Desconectar'
    TabOrder = 1
    OnClick = BtDesconectarClick
  end
  object EdServidor: TEdit
    Left = 122
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EdPorta: TEdit
    Left = 122
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BtTestar: TButton
    Left = 208
    Top = 288
    Width = 105
    Height = 57
    Caption = 'Testar'
    TabOrder = 4
    OnClick = BtTestarClick
  end
  object Conexao: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=127.0.0.1'
      'port=40000')
    Left = 80
    Top = 176
    UniqueId = '{F3C72526-1C31-42DE-B7E8-B86161C7B6ED}'
  end
end
