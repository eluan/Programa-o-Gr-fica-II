object frmLinha: TfrmLinha
  Left = 0
  Top = 0
  Caption = 'Linha'
  ClientHeight = 195
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Principal: TPanel
    Left = 8
    Top = 8
    Width = 289
    Height = 177
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 257
      Height = 113
      Caption = 'GroupBox1'
      TabOrder = 0
      object lblPonto1: TLabel
        Left = 24
        Top = 32
        Width = 44
        Height = 13
        Caption = 'Ponto 1: '
      end
      object lblPonto2: TLabel
        Left = 24
        Top = 67
        Width = 44
        Height = 13
        Caption = 'Ponto 2: '
      end
      object lblXPonto1: TLabel
        Left = 79
        Top = 32
        Width = 17
        Height = 13
        Caption = 'X= '
      end
      object lblXPonto2: TLabel
        Left = 79
        Top = 67
        Width = 17
        Height = 13
        Caption = 'X= '
      end
      object lblYPonto1: TLabel
        Left = 164
        Top = 32
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object lblYPonto2: TLabel
        Left = 164
        Top = 67
        Width = 17
        Height = 13
        Caption = 'Y= '
      end
      object edXPonto1: TEdit
        Left = 102
        Top = 29
        Width = 45
        Height = 21
        TabOrder = 0
      end
      object edYPonto1: TEdit
        Left = 190
        Top = 29
        Width = 45
        Height = 21
        TabOrder = 1
      end
      object edXPonto2: TEdit
        Left = 102
        Top = 64
        Width = 45
        Height = 21
        TabOrder = 2
      end
      object edYPonto2: TEdit
        Left = 190
        Top = 64
        Width = 45
        Height = 21
        TabOrder = 3
      end
    end
    object btnOK: TButton
      Left = 118
      Top = 135
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancelar: TButton
      Left = 199
      Top = 135
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
end
