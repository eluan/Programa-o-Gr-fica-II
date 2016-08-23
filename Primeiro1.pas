unit Primeiro1;

interface

uses
  OpenGL, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TPrincipal = class(TForm)
    btnTriangulo: TButton;
    btnQuadrado: TButton;
    btnLinha: TButton;
    btnCima: TButton;
    btnBaixo: TButton;
    btnEsquerda: TButton;
    btnDireita: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnTrianguloClick(Sender: TObject);
    procedure btnQuadradoClick(Sender: TObject);
    procedure btnLinhaClick(Sender: TObject);
    procedure btnCimaClick(Sender: TObject);
    procedure btnBaixoClick(Sender: TObject);
    procedure btnEsquerdaClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
  private
    procedure Draw; //Draws an OpenGL scene on request
    procedure DesenhaLinha();
    procedure DesenhaTriangulo();
    procedure DesenhaQuadrado();

  public
    procedure InicializaVariaveisLinha(desenharLinha1: bool; xPonto1, yPonto1, xPonto2, yPonto2: double);
    procedure InicializaVariaveisTriangulo(desenharTriangulo1: bool; xEsqTri1, yEsqTri1, xCimaTri1, yCimaTri1, xDirTri1, yDirTri1: double);
    procedure InicializaVariaveisQuadrado(desenharQuadrado1:bool; xEsqCimaQuad1, yEsqCimaQuad1, xDirCimaQuad1, yDirCimaQuad1, xDirBaixoQuad1, yDirBaixoQuad1, xEsqBaixoQuad1, yEsqBaixoQuad1: double);
  end;

var
  Principal: TPrincipal;

implementation

uses
  CoordenadasQuadrado, CoordenadasTriangulo, CoordenadasLinhas;

var
  desenharLinha, desenharTriangulo, desenharQuadrado: bool;
  x1Linha, y1Linha, x2Linha, y2Linha : double;
  xEsqTri, yEsqTri, xCimaTri, yCimaTri, xDirTri, yDirTri : double;
  xEsqCimaQuad, yEsqCimaQuad, xDirCimaQuad, yDirCimaQuad, xDirBaixoQuad,
  yDirBaixoQuad, xEsqBaixoQuad, yEsqBaixoQuad : double;

{$R *.DFM}

procedure setupPixelFormat(DC:HDC);
const
  pfd:TPIXELFORMATDESCRIPTOR = (
    nSize :           sizeof(TPIXELFORMATDESCRIPTOR);	                              // size
    nVersion :        1;                                                            // version
    dwFlags :         PFD_SUPPORT_OPENGL or PFD_DRAW_TO_WINDOW or PFD_DOUBLEBUFFER;	// support double-buffering
    iPixelType :      PFD_TYPE_RGBA;	                                              // color type
    cColorBits :      24;                                                           // preferred color depth
    cRedBits :        0; cRedShift:0;                                            	  // color bits (ignored)
    cGreenBits :      0; cGreenShift:0;
    cBlueBits :       0; cBlueShift:0;
    cAlphaBits :      0; cAlphaShift:0;                                             // no alpha buffer
    cAccumBits :      0;
    cAccumRedBits :   0;                                                            // no accumulation buffer,
    cAccumGreenBits : 0;                                                           	// accum bits (ignored)
    cAccumBlueBits :  0;
    cAccumAlphaBits : 0;
    cDepthBits :      16; 	                                                        // depth buffer
    cStencilBits :    0;	                                                          // no stencil buffer
    cAuxBuffers :     0; 	                                                          // no auxiliary buffers
    iLayerType :      PFD_MAIN_PLANE;                                               // main layer
    bReserved :       0;
    dwLayerMask :     0;
    dwVisibleMask :   0;
    dwDamageMask :    0;                                                            // no layer, visible, damage masks
  );
var pixelFormat:integer;
begin
   pixelFormat := ChoosePixelFormat(DC, @pfd);
   if (pixelFormat = 0) then
        exit;
   if (SetPixelFormat(DC, pixelFormat, @pfd) <> TRUE) then
        exit;
end;

procedure GLInit;
begin
   // set viewing projection
   glMatrixMode(GL_PROJECTION);
   glFrustum(-0.1, 0.1, -0.1, 0.1, 0.1, 15.0);
   // position viewer
   glMatrixMode(GL_MODELVIEW);
   glEnable(GL_DEPTH_TEST);
end;

procedure TPrincipal.InicializaVariaveisLinha(desenharLinha1: bool; xPonto1, yPonto1, xPonto2, yPonto2: double);
begin
  desenharLinha := desenharLinha1;
  x1Linha := xPonto1;
  y1Linha := yPonto1;
  x2Linha := xPonto2;
  y2Linha := yPonto2;
end;

procedure TPrincipal.InicializaVariaveisQuadrado(desenharQuadrado1:bool; xEsqCimaQuad1, yEsqCimaQuad1, xDirCimaQuad1, yDirCimaQuad1, xDirBaixoQuad1, yDirBaixoQuad1, xEsqBaixoQuad1, yEsqBaixoQuad1: double);
begin
  desenharQuadrado := desenharQuadrado1;
  xEsqCimaQuad  := xEsqCimaQuad1;
  yEsqCimaQuad  := yEsqCimaQuad1;
  xDirCimaQuad  := xDirCimaQuad1;
  yDirCimaQuad  := yDirCimaQuad1;
  xDirBaixoQuad := xDirBaixoQuad1;
  yDirBaixoQuad := yDirBaixoQuad1;
  xEsqBaixoQuad := xEsqBaixoQuad1;
  yEsqBaixoQuad := yEsqBaixoQuad1;
end;

procedure TPrincipal.InicializaVariaveisTriangulo(desenharTriangulo1: bool; xEsqTri1, yEsqTri1, xCimaTri1, yCimaTri1, xDirTri1, yDirTri1: double);
begin
   desenharTriangulo := desenharTriangulo1;
   xEsqTri  := xEsqTri1;
   yEsqTri  := yEsqTri1;
   xCimaTri := xCimaTri1;
   yCimaTri := yCimaTri1;
   xDirTri  := xDirTri1;
   yDirTri  := yDirTri1;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
var
  DC:HDC;
  RC:HGLRC;
  i:integer;
begin
  DC := GetDC(Handle);        //Actually, you can use any windowed control here
  SetupPixelFormat(DC);
  RC := wglCreateContext(DC); //makes OpenGL window out of DC
  wglMakeCurrent(DC, RC);   //makes OpenGL window active
  GLInit;                   //initialize OpenGL
end;

procedure TPrincipal.Draw;
const
  D = 1.5;
  H1= D/1.732;
  H2= D*1.732-H1; // D/H = tg(30) = 1/sqrt(3)
  HY= 3.0;
const //vertexes
  a1:TGLArrayf3=(-D, 0, -H1); //bootom left
  a2:TGLArrayf3=( D, 0, -H1); //bootom right
  a3:TGLArrayf3=( 0, 0,  H2); //bootom back
  a4:TGLArrayf3=( 0, HY, 0);  //top
begin
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glLoadIdentity;
  glTranslatef(0.0, 0.0, -12.0);
  DesenhaLinha();
  DesenhaTriangulo();
  DesenhaQuadrado();
  SwapBuffers(wglGetCurrentDC);
  glFlush();
end;

procedure TPrincipal.FormPaint(Sender: TObject);
begin
   Draw;
end;

procedure TPrincipal.btnBaixoClick(Sender: TObject);
begin
  if(desenharLinha) then
  begin
    y1Linha := y1Linha - 0.5;
    y2Linha := y2Linha - 0.5;
  end
  else
  if(desenharTriangulo) then
  begin
    yEsqTri  := yEsqTri - 0.5;
    yCimaTri := yCimaTri - 0.5;
    yDirTri  := yDirTri - 0.5;
  end
  else
  if(desenharQuadrado) then
  begin
    yEsqCimaQuad  := yEsqCimaQuad - 0.5;
    yDirCimaQuad  := yDirCimaQuad - 0.5;
    yDirBaixoQuad := yDirBaixoQuad - 0.5;
    yEsqBaixoQuad := yEsqBaixoQuad - 0.5;
  end;
end;

procedure TPrincipal.btnCimaClick(Sender: TObject);
begin
  if(desenharLinha) then
  begin
    y1Linha := y1Linha + 0.5;
    y2Linha := y2Linha + 0.5;
  end
  else
  if(desenharTriangulo) then
  begin
    yEsqTri  := yEsqTri + 0.5;
    yCimaTri := yCimaTri + 0.5;
    yDirTri  := yDirTri + 0.5;
  end
  else
  if(desenharQuadrado) then
  begin
    yEsqCimaQuad  := yEsqCimaQuad + 0.5;
    yDirCimaQuad  := yDirCimaQuad + 0.5;
    yDirBaixoQuad := yDirBaixoQuad + 0.5;
    yEsqBaixoQuad := yEsqBaixoQuad + 0.5;
  end;
end;

procedure TPrincipal.btnDireitaClick(Sender: TObject);
begin
  if(desenharLinha) then
  begin
    x1Linha := x1Linha + 0.5;
    x2Linha := x2Linha + 0.5;
  end
  else
  if(desenharTriangulo) then
  begin
    xEsqTri  := xEsqTri + 0.5;
    xCimaTri := xCimaTri + 0.5;
    xDirTri  := xDirTri + 0.5;
  end
  else
  if(desenharQuadrado) then
  begin
    xEsqCimaQuad  := xEsqCimaQuad + 0.5;
    xDirCimaQuad  := xDirCimaQuad + 0.5;
    xDirBaixoQuad := xDirBaixoQuad + 0.5;
    xEsqBaixoQuad := xEsqBaixoQuad + 0.5;
  end;
end;

procedure TPrincipal.btnEsquerdaClick(Sender: TObject);
begin
  if(desenharLinha) then
  begin
    x1Linha := x1Linha - 0.5;
    x2Linha := x2Linha - 0.5;
  end
  else
  if(desenharTriangulo) then
  begin
    xEsqTri  := xEsqTri - 0.5;
    xCimaTri := xCimaTri - 0.5;
    xDirTri  := xDirTri - 0.5;
  end
  else
  if(desenharQuadrado) then
  begin
    xEsqCimaQuad  := xEsqCimaQuad - 0.5;
    xDirCimaQuad  := xDirCimaQuad - 0.5;
    xDirBaixoQuad := xDirBaixoQuad - 0.5;
    xEsqBaixoQuad := xEsqBaixoQuad - 0.5;
  end;
end;

procedure TPrincipal.btnTrianguloClick(Sender: TObject);
var
  coordenadasTriangulo: TfrmTriangulo;
begin
  coordenadasTriangulo := TfrmTriangulo.Create(self);
  coordenadasTriangulo.showModal();
  desenharQuadrado  := false;
  desenharLinha     := false;
end;

procedure TPrincipal.btnLinhaClick(Sender: TObject);
var
  coordenadasLinha: TfrmLinha;
begin
  coordenadasLinha := TfrmLinha.Create(self);
  coordenadasLinha.showModal();
  desenharTriangulo := false;
  desenharQuadrado  := false;
end;

procedure TPrincipal.btnQuadradoClick(Sender: TObject);
var
  coordenadasQuadrado: TfrmCoordenadasQuadrado;
begin
  coordenadasQuadrado := TfrmCoordenadasQuadrado.Create(self);
  coordenadasQuadrado.showModal();
  desenharTriangulo := false;
  desenharLinha     := false;
end;

procedure TPrincipal.DesenhaLinha();
begin
  if desenharLinha then
  begin
    glColor3f(1.0, 1.0, 0.0);
    glLineWidth(20);
    glBegin(GL_LINES);
      glVertex2f(x1Linha, y1Linha);
      glVertex2f(x2Linha, y2Linha);
    glEnd();
  end;
end;

procedure TPrincipal.DesenhaTriangulo();
begin
  if desenharTriangulo then
  begin
    glColor3f(1.0, 0.0, 1.0);
    glBegin(GL_TRIANGLES);
      glVertex2f(xEsqTri, yEsqTri);
      glVertex2f(xCimaTri, yCimaTri);
      glVertex2f(xDirTri, yDirTri);
    glEnd();
  end;
end;

procedure TPrincipal.DesenhaQuadrado();
begin
  if desenharQuadrado then
  begin
    glColor3f(1.0, 0.0, 0.0);
    glBegin(GL_QUADS);
      glVertex2f(xEsqCimaQuad, yEsqCimaQuad);
      glVertex2f(xDirCimaQuad, yDirCimaQuad);
      glVertex2f(xDirBaixoQuad, yDirBaixoQuad);
      glVertex2f(xEsqBaixoQuad, yEsqBaixoQuad);
    glEnd();
  end;
end;

end.
