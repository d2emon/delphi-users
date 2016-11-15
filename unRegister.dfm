object fmRegister: TfmRegister
  Left = 192
  Top = 114
  BorderStyle = bsToolWindow
  Caption = 'Register'
  ClientHeight = 164
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
  object BitBtn1: TBitBtn
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object Edit1: TEdit
    Left = 8
    Top = 96
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object dbedUsername: TDBEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    DataField = 'Name'
    DataSource = dmUser.dsUsers
    TabOrder = 2
  end
  object dbedPassword: TDBEdit
    Left = 8
    Top = 56
    Width = 121
    Height = 21
    DataField = 'Pass'
    DataSource = dmUser.dsUsers
    PasswordChar = '*'
    TabOrder = 3
  end
end
