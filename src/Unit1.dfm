object Form1: TForm1
  Left = 382
  Top = 155
  Width = 281
  Height = 273
  Caption = 'Hex Replacer GUI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Regrex'
  end
  object Label2: TLabel
    Left = 160
    Top = 48
    Width = 63
    Height = 13
    Caption = 'Replacement'
  end
  object TBConvert: TButton
    Left = 96
    Top = 120
    Width = 73
    Height = 33
    Caption = 'Convert'
    TabOrder = 0
    OnClick = TBConvertClick
  end
  object Edit1: TEdit
    Left = 40
    Top = 64
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '00'
  end
  object Edit2: TEdit
    Left = 152
    Top = 64
    Width = 81
    Height = 21
    TabOrder = 2
    Text = 'FA'
  end
  object OpenDialog1: TOpenDialog
    Left = 32
    Top = 96
  end
  object SaveDialog1: TSaveDialog
    Left = 200
    Top = 104
  end
end
