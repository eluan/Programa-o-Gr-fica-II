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
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnTrianguloClick(Sender: TObject);
    procedure btnQuadradoClick(Sender: TObject);
    procedure btnLinhaClick(Sender: TObject);
  private
    procedure Draw; //Draws an OpenGL scene on request
    procedure InicializaVariaveisLinha();
    procedure InicializaVariaveisTriangulo();
    procedure InicializaVariaveisQuadrado();
    procedure DesenhaLinha();
    procedure DesenhaTriangulo();
    procedure DesenhaQuadrado();
  public
  end;

var
  Principal: TPrincipal;

implementation
var
  desenharLinha, desenharTriangulo, desenharQuadrado: bool;
  x1Linha, y1Linha, x2Linha, y2Linha : double;
  xEsqTri, yEsqTri, xCimaTri, yCimaTri, xDirTri, yDirTri : double;
  xEsqCimaQuad, yEsqCimaQuad, xDirCimaQuad, yDirCimaQuad, xDirBaixoQuad, yDirBaixoQuad, xEsqBaixoQuad, yEsqBaixoQuad : double;

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
   glFrustum(-0.1, 0.1, -0.1, 0.1, 0.3, 25.0);
   // position viewer
   glMatrixMode(GL_MODELVIEW);
   glEnable(GL_DEPTH_TEST);
end;

procedure TPrincipal.InicializaVariaveisLinha;
begin
  x1Linha := 0;
  y1Linha := 0;
  x2Linha := 0;
  y2Linha := 0;
end;

procedure TPrincipal.InicializaVariaveisQuadrado();
begin
  xEsqCimaQuad  := 0;
  yEsqCimaQuad  := 0;
  xDirCimaQuad  := 0;
  yDirCimaQuad  := 0;
  xDirBaixoQuad := 0;
  yDirBaixoQuad := 0;
  xEsqBaixoQuad := 0;
  yEsqBaixoQuad := 0;
end;

procedure TPrincipal.InicializaVariaveisTriangulo();
begin
   xEsqTri  := 0;
   yEsqTri  := 0;
   xCimaTri := 0;
   yCimaTri := 0;
   xDirTri  := 0;
   yDirTri  := 0;
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
  InicializaVariaveisLinha();
  InicializaVariaveisTriangulo();
  InicializaVariaveisQuadrado();
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

procedure TPrincipal.btnTrianguloClick(Sender: TObject);
begin
  desenharTriangulo := true;
  desenharQuadrado  := false;
  desenharLinha     := false;

  xEsqTri  := -2;
  yEsqTri  := 0;
  xCimaTri := 0;
  yCimaTri := 2;
  xDirTri  := 2;
  yDirTri  := 0;
end;

procedure TPrincipal.btnLinhaClick(Sender: TObject);
begin
  desenharLinha     := true;
  desenharTriangulo := false;
  desenharQuadrado  := false;

  x1Linha := 0;
  y1Linha := 0;
  x2Linha := 2;
  y2Linha := 2;
end;

procedure TPrincipal.btnQuadradoClick(Sender: TObject);
begin
  desenharQuadrado  := true;
  desenharTriangulo := false;
  desenharLinha     := false;

  xEsqCimaQuad  := -2;
  yEsqCimaQuad  := 2;
  xDirCimaQuad  := 2;
  yDirCimaQuad  := 2;
  xDirBaixoQuad := 2;
  yDirBaixoQuad := -2;
  xEsqBaixoQuad := -2;
  yEsqBaixoQuad := -2;
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