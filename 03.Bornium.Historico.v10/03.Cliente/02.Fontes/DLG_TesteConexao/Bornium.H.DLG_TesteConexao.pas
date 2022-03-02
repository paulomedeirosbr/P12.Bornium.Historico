unit Bornium.H.DLG_TesteConexao;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.SqlExpr;

type
  TDLG_DTesteConexao = class(TForm)
    BtConectar: TButton;
    BtDesconectar: TButton;
    Label1: TLabel;
    EdServidor: TEdit;
    Label3: TLabel;
    EdPorta: TEdit;
    BtTestar: TButton;
    Conexao: TSQLConnection;
    procedure BtConectarClick(Sender: TObject);
    procedure BtDesconectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtTestarClick(Sender: TObject);
  private

    FComMongo : TMongoConnection;
    FEnv      : TMongoEnv;

    procedure VerJanela;

    procedure RecuperarConfiguracao;
    procedure AjustarConexao;

  public

  end;


implementation

uses
  Winapi.Windows;

{$R *.dfm}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DTesteConexao.BtConectarClick(Sender: TObject);
begin
//------------------------------------------------------------------------------
  try
    AjustarConexao;

    Conexao.Connected:= True;
      {
    FComMongo := TMongoConnection(Conexao.CliObj);
    FEnv      :=  FComMongo.Env; }

    ShowMessage('Conectado');
    VerJanela;
  except
    on e :Exception do begin
      ShowMessage(E.Message);
    end;
  end;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DTesteConexao.BtDesconectarClick(Sender: TObject);
begin
//------------------------------------------------------------------------------
  try
    Conexao.Close;
    ShowMessage('Desconectado');
    VerJanela;
  except
    on e :Exception do begin
      ShowMessage(E.Message);
    end;
  end;
//------------------------------------------------------------------------------
end;

procedure TDLG_DTesteConexao.FormCreate(Sender: TObject);
begin
//------------------------------------------------------------------------------
  RecuperarConfiguracao;
  VerJanela;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DTesteConexao.VerJanela;
begin
//------------------------------------------------------------------------------
  BtConectar   .Enabled:= Conexao.Connected = False;
  BtDesconectar.Enabled:= Conexao.Connected = True;
//------------------------------------------------------------------------------
  BtTestar     .Enabled:= BtDesconectar.Enabled;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DTesteConexao.RecuperarConfiguracao;
begin
//------------------------------------------------------------------------------
  EdServidor.Text:= Conexao.Params.Values['Server'];
  EdPorta   .Text:= Conexao.Params.Values['Port'];
//------------------------------------------------------------------------------
end;

procedure TDLG_DTesteConexao.AjustarConexao;
begin
//------------------------------------------------------------------------------
  Conexao.Params.Values['HostName']   := EdServidor.Text;
  Conexao.Params.Values['Port']     := EdPorta   .Text;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TDLG_DTesteConexao.BtTestarClick(Sender: TObject);
var
  oDoc :TMongoDocument;
  oUpd :TMongoUpdate;
  oQry :TMongoQuery;

begin
//------------------------------------------------------------------------------
  try
    oDoc := TMongoDocument.Create(FEnv);
    oUpd := TMongoUpdate  .Create(FEnv);
    oQry := TMongoQuery     .Create(FEnv);
//
    oDoc.Add('nome','Paulo Cesar Medeiros');

  finally
    FreeAndNil(oDoc);
    FreeAndNil(oUpd);
    FreeAndNil(oQry);
  end;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



end.
