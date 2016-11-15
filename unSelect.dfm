object fmSelect: TfmSelect
  Left = 192
  Top = 114
  Width = 555
  Height = 314
  Caption = 'Select Game'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 547
    Height = 280
    Align = alClient
    DataSource = dmGame.dsGames
    PopupMenu = pmSelect
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Type'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Startdate'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Closedate'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Enddate'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turnrate'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Interestrate'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Active'
        Width = 35
        Visible = True
      end>
  end
  object pmSelect: TPopupMenu
    Left = 144
    Top = 80
    object miSelect: TMenuItem
      Caption = '&Select'
      OnClick = miSelectClick
    end
  end
end
