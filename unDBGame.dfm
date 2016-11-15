object dmGame: TdmGame
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 150
  Width = 215
  object tbGames: TTable
    OnCalcFields = tbGamesCalcFields
    DatabaseName = 'users'
    TableName = 'games.db'
    Left = 16
    Top = 8
    object tbGamesId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbGamesName: TStringField
      FieldName = 'Name'
      Size = 55
    end
    object tbGamesDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object tbGamesType: TStringField
      FieldName = 'Type'
      Size = 55
    end
    object tbGamesStartdate: TDateField
      DisplayLabel = 'Start'
      FieldName = 'Startdate'
    end
    object tbGamesClosedate: TDateField
      DisplayLabel = 'Close'
      FieldName = 'Closedate'
    end
    object tbGamesEnddate: TDateField
      DisplayLabel = 'End'
      FieldName = 'Enddate'
    end
    object tbGamesTurnrate: TIntegerField
      DisplayLabel = 'Turns'
      FieldName = 'Turnrate'
    end
    object tbGamesInterestrate: TIntegerField
      DisplayLabel = 'Interest'
      FieldName = 'Interestrate'
    end
    object tbGamesActive: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Active'
      Calculated = True
    end
  end
  object dsGames: TDataSource
    DataSet = tbGames
    Left = 56
    Top = 8
  end
  object quActivePlayer: TQuery
    DatabaseName = 'users'
    DataSource = dmUser.dsLogin
    SQL.Strings = (
      
        'SELECT Players.Id, Players.UserId, Players.GameId, Players.Name,' +
        ' Players.RaceId, Players.AllianceId, Games.Id'
      'FROM "games.db" Games, "players.DB" Players'
      'WHERE   (Games.Id = Players.GameId)  '
      '   AND  (Players.UserId = :Id)  '
      '   AND  (Games.Id = :GameId)  ')
    Left = 96
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'GameId'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end
