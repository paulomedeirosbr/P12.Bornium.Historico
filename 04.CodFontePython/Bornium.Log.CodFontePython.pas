unit Bornium.Log.CodFontePython;

interface

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
Const
  SistemaPyton_RegistroInserir =
    'import pymongo '                                         + sLineBreak +
    'Client = pymongo.MongoClient("mongodb+srv://borniumadm:axmafraX3324@cluster0.xlelb.mongodb.net/?retryWrites=true&w=majority") '+  sLineBreak +
    'BaseDados = Client.get_database("Bornium") '             + sLineBreak +
    'Colecao = BaseDados.get_collection("PAIS") '             + sLineBreak +
    'oJSon = <OBJ_JSON> '                                     + sLineBreak +
    'Colecao.insert_one(oJSon) '                              + sLineBreak ;


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
Const
  SistemaPyton_RegistroRecuperar =
    'import pymongo ' + sLineBreak +
    'Client = pymongo.MongoClient("mongodb+srv://borniumadm:axmafraX3324@cluster0.xlelb.mongodb.net/?retryWrites=true&w=majority") ' + sLineBreak +
    'BaseDados = Client.get_database("Bornium") '             + sLineBreak +
    'Colecao = BaseDados.get_collection("PAIS") '             + sLineBreak +
    'ListaRegistro = Colecao.find({<P01><P02>},{"_id":0}) '   + sLineBreak +
    'jArray = [] '                                            + sLineBreak +
    'for Registro in ListaRegistro: '                         + sLineBreak +
    '  jArray.append(Registro) '                              + sLineBreak +
    'print(jArray)'                                           + sLineBreak;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------

implementation

end.
