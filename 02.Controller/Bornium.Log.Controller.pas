unit Bornium.Log.Controller;

interface

procedure registry;

implementation

uses
  Horse, Bornium.Log.DAO_Mongo, System.SysUtils, System.JSON;

Const XXX =
   'import pymongo ' + sLineBreak +
   'client = pymongo.MongoClient("mongodb+srv://borniumadm:axmafraX3324@cluster0.xlelb.mongodb.net/?retryWrites=true&w=majority") '+  sLineBreak +
   'a = client.get_database("Bornium") ' +  sLineBreak +
   'b = a.get_collection("PAIS") ' + sLineBreak +
   'x = { ''cdPais'': 121, ''nome'':''paulo cesar medeiros''} '+ sLineBreak +
   'b.insert_one(x) ' + sLineBreak ;


//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure ExecutarPost(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DAO       : TDAO_Mongo;
  info      : String;
  oRegistro : TJSONObject;
  oBody     : TJSONValue;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DAO:= TDAO_Mongo.Create(nil);
  try
    try
      if req.Body = '' then begin
        res.Send('{'+TJSONPair.Create('result','[[]]').ToJSON+'}');
        exit;
      end;

      oBody := TJSonObject.ParseJSONValue(TEncoding.UTF8.getBytes(req.Body),0) as TJSONValue;

      Info:= DAO.ExecutarPost(oBody.ToJSON);
      oRegistro := TJSONObject.Create;
      try
        oRegistro.AddPair(TJSONPair.Create('Resultado', TJSONString.Create('0')));
        Res.Send(TJSONPair.Create('result', oRegistro.ToJSON).ToJSON);

         res.Send('{'+TJSONPair.Create('result','[[]]').ToJSON+'}');
      finally
        FreeAndNil(oRegistro);
      end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
    except
       res.Send('{'+TJSONPair.Create('result','[[]]').ToJSON+'}');
    end;
  finally
     FreeAndNil(DAO);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure ExecutarGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DAO   : TDAO_Mongo;
  info  : String;

  JSArray  : TJSONArray;
  JSObject : TJSONObject;

Const XXX1 =

'import pymongo ' + sLineBreak +
'client = pymongo.MongoClient("mongodb+srv://borniumadm:axmafraX3324@cluster0.xlelb.mongodb.net/?retryWrites=true&w=majority") ' + sLineBreak +
'a = client.get_database("Bornium") ' + sLineBreak +
'b = a.get_collection("PAIS") ' + sLineBreak +
'ListaRegistro =b.find({},{"_id":0}) ' + sLineBreak +
'xxx = [] ' + sLineBreak +

'for Registro in ListaRegistro: ' + sLineBreak +
'    xxx.append(Registro) ' + sLineBreak +
'print(xxx)' + sLineBreak;

begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  DAO:= TDAO_Mongo.Create(nil);
  try
    try
      Info:= DAO.ExecutarGet(XXX1);
      JSArray:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Info), 0) as TJSONArray;

      JSObject:= TJSONObject.Create;
      JSObject.AddPair(TJSONPair.Create('result', JSArray));
      Res.Send(JSObject.ToJSON);
    except
      res.Send('Erro ao Recuperar o Log');
    end;
  finally
    FreeAndNil(DAO);
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure registry;
begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  THorse.get  ('/bornium.log',ExecutarGet);
  THorse.post ('/bornium.log',ExecutarPost);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end;

end.
