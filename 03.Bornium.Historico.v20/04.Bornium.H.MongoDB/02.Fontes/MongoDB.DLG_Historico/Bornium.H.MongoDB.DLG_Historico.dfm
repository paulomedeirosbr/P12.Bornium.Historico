object DLG_DHistorico: TDLG_DHistorico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Hist'#243'rico'
  ClientHeight = 591
  ClientWidth = 1305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PnInfoProcesso: TPanel
    Left = 0
    Top = 0
    Width = 1305
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 1375
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Processo:'
    end
    object Label3: TLabel
      Left = 560
      Top = 14
      Width = 44
      Height = 13
      Caption = 'Registro:'
    end
    object PnProcesso: TPanel
      Left = 85
      Top = 8
      Width = 452
      Height = 27
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = '  NOME DO PROCESSO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object PnCodRegistro: TPanel
      Left = 610
      Top = 7
      Width = 71
      Height = 27
      BevelOuter = bvLowered
      Caption = '0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 42
    Width = 1305
    Height = 36
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitWidth = 1375
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 536
      Height = 34
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel2: TBevel
        Left = 530
        Top = 0
        Width = 6
        Height = 34
        Align = alRight
        Shape = bsRightLine
        ExplicitLeft = 97
        ExplicitHeight = 32
      end
      object Label2: TLabel
        Left = 21
        Top = 13
        Width = 40
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object CbxDataInicio: TCheckBox
        Left = 226
        Top = 9
        Width = 77
        Height = 17
        Caption = 'A Partir de:'
        TabOrder = 0
        OnClick = CbxDataInicioClick
      end
      object BtConsultar: TBitBtn
        Left = 423
        Top = 4
        Width = 94
        Height = 25
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = BtConsultarClick
      end
      object EdData: TDateTimePicker
        Left = 302
        Top = 5
        Width = 115
        Height = 21
        Date = 41334.757451168980000000
        Time = 41334.757451168980000000
        TabOrder = 2
      end
      object EdUsuario: TEdit
        Left = 65
        Top = 8
        Width = 150
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
    end
  end
  object PnPrincipal: TPanel
    Left = 0
    Top = 78
    Width = 1305
    Height = 513
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 1375
    object Splitter1: TSplitter
      Left = 345
      Top = 0
      Width = 10
      Height = 513
      ExplicitLeft = 593
      ExplicitTop = 6
    end
    object Panel2: TPanel
      Left = 355
      Top = 0
      Width = 950
      Height = 513
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 1020
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 950
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '   Lista de Atributos Alterados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 1020
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 24
        Width = 950
        Height = 489
        Align = alClient
        DataSource = DsInformacao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Elem.Nome Logico'
            Title.Caption = 'Atributo'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Elem.Info Antiga'
            Title.Caption = 'Informa'#231#227'o Antiga'
            Width = 341
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Elem.Info Nova'
            Title.Caption = 'Informacao Nova'
            Width = 418
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 345
      Height = 513
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 345
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '   Lista de Altera'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 24
        Width = 345
        Height = 489
        Align = alClient
        DataSource = DsPadrao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NomeUsuario'
            Title.Caption = 'Nome Usu'#225'rio'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Width = 119
            Visible = True
          end>
      end
    end
  end
  object DsPadrao: TDataSource
    DataSet = DTM_DHistorico.TabPadrao
    Left = 56
    Top = 286
  end
  object DsInformacao: TDataSource
    DataSet = DTM_DHistorico.TabInformacao
    Left = 240
    Top = 286
  end
end
