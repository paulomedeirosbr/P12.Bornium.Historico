object FRM_FPrincipal: TFRM_FPrincipal
  Left = 270
  Top = 114
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Servidor Mongo DB'
  ClientHeight = 106
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 106
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 11
      Height = 106
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 252
      ExplicitHeight = 34
    end
    object BtFechar: TButton
      Left = 350
      Top = 21
      Width = 135
      Height = 60
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = BtFecharClick
    end
    object BtConectar: TButton
      Left = 29
      Top = 21
      Width = 135
      Height = 60
      Caption = 'Conectar'
      TabOrder = 1
      OnClick = BtConectarClick
    end
    object BtDesconectar: TButton
      Left = 191
      Top = 21
      Width = 130
      Height = 60
      Caption = 'Desconectar'
      TabOrder = 2
      OnClick = BtDesconectarClick
    end
  end
  object ApEvento: TApplicationEvents
    OnException = ApEventoException
    Left = 8
    Top = 80
  end
end
