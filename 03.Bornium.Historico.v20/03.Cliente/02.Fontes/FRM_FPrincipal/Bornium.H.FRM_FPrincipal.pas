unit Bornium.H.FRM_FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.Menus;

type
  TFRM_FPrincipal = class(TForm)
    MnPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    miTesteConexao: TMenuItem;
    N1: TMenuItem;
    miSair: TMenuItem;
    Consultas1: TMenuItem;
    Bornium1: TMenuItem;
    N3: TMenuItem;
    BorniumFbrica1: TMenuItem;
    SobreoSistema1: TMenuItem;
    SobreaEmpresa1: TMenuItem;
    N4: TMenuItem;
    SobreoSistema2: TMenuItem;
    procedure miTesteConexaoClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FRM_FPrincipal: TFRM_FPrincipal;

implementation

uses
  Bornium.H.DLG_TesteConexao;

{$R *.dfm}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TFRM_FPrincipal.miTesteConexaoClick(Sender: TObject);
var
  DTesteConexao :TDLG_DTesteConexao;
begin
//------------------------------------------------------------------------------
  try
    DTesteConexao:= TDLG_DTesteConexao.Create(Self);
    DTesteConexao.ShowModal;
  finally
    FreeAndNil(DTesteConexao);
  end;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

procedure TFRM_FPrincipal.FormCreate(Sender: TObject);
begin
//------------------------------------------------------------------------------
  Self.Caption:= 'Bornium.H - 1.02';
//------------------------------------------------------------------------------
end;

procedure TFRM_FPrincipal.miSairClick(Sender: TObject);
begin
//------------------------------------------------------------------------------
  Close;
//------------------------------------------------------------------------------
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


end.
