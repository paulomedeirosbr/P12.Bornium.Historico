object FRM_FPrincipal: TFRM_FPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste DLL'
  ClientHeight = 386
  ClientWidth = 1118
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 386
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 47
      Width = 44
      Height = 13
      Caption = 'Servidor:'
    end
    object Label2: TLabel
      Left = 54
      Top = 74
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object Label3: TLabel
      Left = 14
      Top = 15
      Width = 71
      Height = 13
      Caption = 'Cod. Empresa:'
    end
    object BtGravarInformacao: TButton
      Left = 40
      Top = 160
      Width = 153
      Height = 49
      Caption = 'Gravar Informa'#231#227'o'
      TabOrder = 0
      OnClick = BtGravarInformacaoClick
    end
    object BtRecuperarInformacao: TButton
      Left = 40
      Top = 232
      Width = 153
      Height = 49
      Caption = 'Recuperar Informa'#231#227'o'
      TabOrder = 1
      OnClick = BtRecuperarInformacaoClick
    end
    object BtConexaoAbrir: TButton
      Left = 40
      Top = 96
      Width = 153
      Height = 49
      Caption = 'Abrir Conexao'
      TabOrder = 2
      OnClick = BtConexaoAbrirClick
    end
    object BtConexaoFechar: TButton
      Left = 216
      Top = 96
      Width = 153
      Height = 49
      Caption = 'Fechar Conex'#227'o'
      TabOrder = 3
      OnClick = BtConexaoFecharClick
    end
    object EdServidor: TEdit
      Left = 90
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '127.0.0.1'
    end
    object EdPorta: TEdit
      Left = 90
      Top = 66
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '40000'
    end
    object EdCodEmpresa: TEdit
      Left = 90
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 6
      Text = '1'
    end
  end
  object Panel2: TPanel
    Left = 385
    Top = 0
    Width = 264
    Height = 386
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 51
      Width = 264
      Height = 335
      Align = alClient
      DataSource = DsPadrao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Usu'#225'rio'
          Width = 156
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 264
      Height = 51
      Align = alTop
      Caption = 'Lista de Altera'#231#245'es'
      TabOrder = 1
      OnClick = Panel4Click
    end
  end
  object Panel3: TPanel
    Left = 649
    Top = 0
    Width = 469
    Height = 386
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 0
      Top = 51
      Width = 469
      Height = 335
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Campo'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Antes'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Depois'
          Width = 169
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 469
      Height = 51
      Align = alTop
      Caption = 'Lisa de Campos Alterados'
      TabOrder = 1
      OnClick = Panel4Click
    end
  end
  object TabPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 273
    Top = 232
  end
  object DsPadrao: TDataSource
    DataSet = TabPadrao
    Left = 409
    Top = 232
  end
end
