object frmCoordenadasQuadrado: TfrmCoordenadasQuadrado
  Left = 0
  Top = 0
  Caption = 'Quadrado'
  ClientHeight = 251
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 425
    Height = 233
    TabOrder = 0
    object btnOK: TButton
      Left = 248
      Top = 184
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancelar: TButton
      Left = 329
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object groupCoordenadas: TGroupBox
      Left = 8
      Top = 11
      Width = 401
      Height = 158
      Caption = 'Coordenadas'
      TabOrder = 2
      object lblPonto1: TLabel
        Left = 16
        Top = 27
        Width = 41
        Height = 13
        Caption = 'Ponto 1:'
      end
      object lblXPonto1: TLabel
        Left = 63
        Top = 27
        Width = 14
        Height = 13
        Caption = 'X='
      end
      object lblYPonto1: TLabel
        Left = 135
        Top = 27
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object lblPonto2: TLabel
        Left = 16
        Top = 57
        Width = 44
        Height = 13
        Caption = 'Ponto 2: '
      end
      object lblXPonto2: TLabel
        Left = 63
        Top = 57
        Width = 17
        Height = 13
        Caption = 'X= '
      end
      object lblYPonto2: TLabel
        Left = 135
        Top = 57
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object lblPonto3: TLabel
        Left = 16
        Top = 85
        Width = 41
        Height = 13
        Caption = 'Ponto 3:'
      end
      object lblXPonto3: TLabel
        Left = 63
        Top = 85
        Width = 17
        Height = 13
        Caption = 'X= '
      end
      object lblYPonto3: TLabel
        Left = 135
        Top = 85
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object lblPonto4: TLabel
        Left = 16
        Top = 113
        Width = 41
        Height = 13
        Caption = 'Ponto 4:'
      end
      object lblXPonto4: TLabel
        Left = 63
        Top = 113
        Width = 17
        Height = 13
        Caption = 'X= '
      end
      object lblYPonto4: TLabel
        Left = 135
        Top = 113
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object edXPonto1: TEdit
        Left = 83
        Top = 27
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object edYPonto1: TEdit
        Left = 158
        Top = 27
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
      object edXPonto2: TEdit
        Left = 83
        Top = 54
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object edYPonto2: TEdit
        Left = 158
        Top = 54
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object edXPonto3: TEdit
        Left = 83
        Top = 82
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 4
      end
      object edYPonto3: TEdit
        Left = 158
        Top = 82
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 5
      end
      object edXPonto4: TEdit
        Left = 83
        Top = 110
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 6
      end
      object edYPonto4: TEdit
        Left = 158
        Top = 110
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 7
      end
    end
  end
end
