program Bornium.Historico.Servidor;

uses
  Horse,
  Horse.Jhonson,
  Bornium.Log.Controller in '..\02.Controller\Bornium.Log.Controller.pas',
  Bornium.Log.OBJ_MongoBD in '..\03.OBJ_MongoBD\Bornium.Log.OBJ_MongoBD.pas' {OBJ_MongoBD: TDataModule},
  System.SysUtils {DAO_Mongo: TDataModule},
  Bornium.Log.CodFontePython in '..\04.CodFontePython\Bornium.Log.CodFontePython.pas';

{$APPTYPE CONSOLE}

{$R *.res}

begin
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  THorse.Use(Jhonson());
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  Bornium.Log.Controller.registry;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
  THorse.Listen(9000,
  procedure (Horse :THorse)
  begin
    Writeln('');
    Writeln('======================================================');
    Writeln(' >> SERVIDOR MONGO DB <<                              ');
    Writeln('======================================================');
    Writeln(Format('Servidor Rodando na Porta %d', [Horse.port]));
    Writeln('======================================================');
  end
  )
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
end.
