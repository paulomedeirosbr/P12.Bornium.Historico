object OBJ_MongoBD: TOBJ_MongoBD
  OldCreateOrder = False
  Height = 367
  Width = 543
  object PythonEngine: TPythonEngine
    IO = PythonInputOutput
    Left = 48
    Top = 48
  end
  object PythonInputOutput: TPythonInputOutput
    OnSendData = PythonInputOutputSendData
    UnicodeIO = False
    RawOutput = False
    Left = 184
    Top = 48
  end
end
