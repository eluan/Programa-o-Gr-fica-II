unit CoordenadasQuadrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Primeiro1;

type
  TfrmCoordenadasQuadrado = class(TForm)
    Panel1: TPanel;
    btnOK: TButton;
    btnCancelar: TButton;
    groupCoordenadas: TGroupBox;
    lblPonto1: TLabel;
    lblXPonto1: TLabel;
    lblYPonto1: TLabel;
    lblPonto2: TLabel;
    lblXPonto2: TLabel;
    lblYPonto2: TLabel;
    lblPonto3: TLabel;
    lblXPonto3: TLabel;
    lblYPonto3: TLabel;
    lblPonto4: TLabel;
    lblXPonto4: TLabel;
    lblYPonto4: TLabel;
    edXPonto1: TEdit;
    edYPonto1: TEdit;
    edXPonto2: TEdit;
    edYPonto2: TEdit;
    edXPonto3: TEdit;
    edYPonto3: TEdit;
    edXPonto4: TEdit;
    edYPonto4: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCoordenadasQuadrado: TfrmCoordenadasQuadrado;

implementation


{$R *.dfm}

procedure TfrmCoordenadasQuadrado.btnCancelarClick(Sender: TObject);
begin
  close();
end;

procedure TfrmCoordenadasQuadrado.btnOKClick(Sender: TObject);
var
  Principal: TPrincipal;
begin
  Principal.InicializaVariaveisQuadrado(StrToFloat(edXPonto1.Text), StrToFloat(edYPonto1.Text), StrToFloat(edXPonto2.Text), StrToFloat(edYPonto2.Text),
                                        StrToFloat(edXPonto3.Text), StrToFloat(edYPonto3.Text), StrToFloat(edXPonto4.Text), StrToFloat(edYPonto4.Text));
  btnCancelarClick(self);
end;

end.
