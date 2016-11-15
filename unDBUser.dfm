object dmUser: TdmUser
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 150
  Width = 215
  object quLogin: TQuery
    Active = True
    DatabaseName = 'gameMe'
    SQL.Strings = (
      
        'SELECT Id, Name, Pass, Rights, Email, Rank, Banned, Ip, PostTrad' +
        'eScreen, IgnoreNewbie'
      'FROM "users.db" Users'
      'WHERE   (Name = :Username)  '
      '   AND  (Pass = :Password)  ')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'Username'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Password'
        ParamType = ptUnknown
      end>
    object quLoginId: TIntegerField
      FieldName = 'Id'
      Origin = 'GAMEME."users.DB".Id'
    end
    object quLoginName: TStringField
      FieldName = 'Name'
      Origin = 'GAMEME."users.DB".Name'
      Size = 55
    end
    object quLoginPass: TStringField
      FieldName = 'Pass'
      Origin = 'GAMEME."users.DB".Pass'
      Size = 55
    end
    object quLoginRights: TStringField
      FieldName = 'Rights'
      Origin = 'GAMEME."users.DB".Rights'
      Size = 55
    end
    object quLoginEmail: TStringField
      FieldName = 'Email'
      Origin = 'GAMEME."users.DB".Email'
      Size = 55
    end
    object quLoginRank: TStringField
      FieldName = 'Rank'
      Origin = 'GAMEME."users.DB".Rank'
      Size = 55
    end
    object quLoginBanned: TBooleanField
      FieldName = 'Banned'
      Origin = 'GAMEME."users.DB".Banned'
    end
    object quLoginIp: TStringField
      FieldName = 'Ip'
      Origin = 'GAMEME."users.DB".Ip'
      Size = 55
    end
    object quLoginPostTradeScreen: TStringField
      FieldName = 'PostTradeScreen'
      Origin = 'GAMEME."users.DB".PostTradeScreen'
      Size = 55
    end
    object quLoginIgnoreNewbie: TBooleanField
      FieldName = 'IgnoreNewbie'
      Origin = 'GAMEME."users.DB".IgnoreNewbie'
    end
  end
  object dsLogin: TDataSource
    DataSet = quLogin
    Left = 48
    Top = 8
  end
  object tbUsers: TTable
    Active = True
    DatabaseName = 'gameMe'
    TableName = 'users.db'
    Left = 88
    Top = 8
    object tbUsersId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbUsersName: TStringField
      FieldName = 'Name'
      Size = 55
    end
    object tbUsersPass: TStringField
      FieldName = 'Pass'
      Size = 55
    end
    object tbUsersRights: TStringField
      FieldName = 'Rights'
      Size = 55
    end
    object tbUsersEmail: TStringField
      FieldName = 'Email'
      Size = 55
    end
    object tbUsersRank: TStringField
      FieldName = 'Rank'
      Size = 55
    end
    object tbUsersBanned: TBooleanField
      FieldName = 'Banned'
    end
    object tbUsersIp: TStringField
      FieldName = 'Ip'
      Size = 55
    end
    object tbUsersPostTradeScreen: TStringField
      FieldName = 'PostTradeScreen'
      Size = 55
    end
    object tbUsersIgnoreNewbie: TBooleanField
      FieldName = 'IgnoreNewbie'
    end
  end
  object dsUsers: TDataSource
    DataSet = tbUsers
    Left = 128
    Top = 8
  end
end