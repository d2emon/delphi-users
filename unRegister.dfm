object fmRegister: TfmRegister
  Left = 192
  Top = 114
  BorderStyle = bsToolWindow
  Caption = 'Register'
  ClientHeight = 213
  ClientWidth = 139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbUsername: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object lbPassword: TLabel
    Left = 8
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object lbConfirm: TLabel
    Left = 8
    Top = 120
    Width = 84
    Height = 13
    Caption = 'Confirm Password'
  end
  object bbRegister: TBitBtn
    Left = 32
    Top = 176
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = bbRegisterClick
    Kind = bkOK
  end
  object edVerify: TEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object dbedUsername: TDBEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    DataField = 'Name'
    DataSource = dmUser.dsUsers
    TabOrder = 0
  end
  object dbedPassword: TDBEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    DataField = 'Pass'
    DataSource = dmUser.dsUsers
    PasswordChar = '*'
    TabOrder = 1
  end
end
