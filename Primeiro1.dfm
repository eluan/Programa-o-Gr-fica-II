object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Primitivas Geogr'#225'ficas'
  ClientHeight = 547
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object btnTriangulo: TButton
    Left = 16
    Top = 8
    Width = 65
    Height = 25
    Caption = 'Triangulo'
    TabOrder = 0
    OnClick = btnTrianguloClick
  end
  object btnQuadrado: TButton
    Left = 87
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Quadrado'
    TabOrder = 1
    OnClick = btnQuadradoClick
  end
  object btnLinha: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Linha'
    TabOrder = 2
    OnClick = btnLinhaClick
  end
  object btnCima: TButton
    Left = 40
    Top = 56
    Width = 41
    Height = 25
    Caption = 'Cima'
    TabOrder = 3
    OnClick = btnCimaClick
  end
  object btnBaixo: TButton
    Left = 40
    Top = 79
    Width = 41
    Height = 25
    Caption = 'Baixo'
    TabOrder = 4
    OnClick = btnBaixoClick
  end
  object btnEsquerda: TButton
    Left = 0
    Top = 72
    Width = 41
    Height = 25
    Caption = 'Esq.'
    TabOrder = 5
    OnClick = btnEsquerdaClick
  end
  object btnDireita: TButton
    Left = 80
    Top = 72
    Width = 41
    Height = 25
    Caption = 'Dir.'
    TabOrder = 6
    OnClick = btnDireitaClick
  end
end
