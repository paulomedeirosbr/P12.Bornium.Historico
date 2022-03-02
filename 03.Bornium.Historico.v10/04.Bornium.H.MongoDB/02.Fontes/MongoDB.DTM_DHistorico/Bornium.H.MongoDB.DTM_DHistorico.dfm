object DTM_DHistorico: TDTM_DHistorico
  OldCreateOrder = False
  Height = 356
  Width = 488
  object TabPadrao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ATR_CODPAIS'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'ATR_CODPAISEMP'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'DspPadrao'
    RemoteServer = DspPadraoConection
    Left = 48
    Top = 120
    object TabPadrao_id: TWideStringField
      FieldName = '_id'
      FixedChar = True
      Size = 24
    end
    object TabPadraoinfo: TDataSetField
      FieldName = 'info'
    end
    object TabPadraocdEmpresa: TWideStringField
      FieldName = 'cdEmpresa'
      Size = 2
    end
    object TabPadraocdUsuario: TWideStringField
      FieldName = 'cdUsuario'
      Size = 1
    end
    object TabPadraoNomeUsuario: TWideStringField
      FieldName = 'NomeUsuario'
      Size = 16
    end
    object TabPadraoData: TWideStringField
      FieldName = 'Data'
      Size = 17
    end
  end
  object DspPadraoConection: TDSProviderConnection
    ServerClassName = 'TDAO_Processo'
    Left = 48
    Top = 24
  end
  object TabInformacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ATR_CODPAIS'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'ATR_CODPAISEMP'
        ParamType = ptInput
        Value = 1
      end>
    Left = 232
    Top = 120
    object TabInformacaoElem: TADTField
      FieldName = 'Elem'
      object TabInformacaoElemNomeFisico: TWideStringField
        DisplayWidth = 13
        FieldName = 'Nome Fisico'
        Size = 8
      end
      object TabInformacaoElemNomeLogico: TWideStringField
        DisplayWidth = 14
        FieldName = 'Nome Logico'
        Size = 12
      end
      object TabInformacaoElemInfoAntiga: TWideStringField
        DisplayWidth = 16
        FieldName = 'Info Antiga'
        Size = 14
      end
      object TabInformacaoElemInfoNova: TWideStringField
        DisplayWidth = 20
        FieldName = 'Info Nova'
      end
    end
  end
end
