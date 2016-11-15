unit unDBUser;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmUser = class(TDataModule)
    quLogin: TQuery;
    dsLogin: TDataSource;
    quLoginId: TIntegerField;
    quLoginName: TStringField;
    quLoginPass: TStringField;
    quLoginRights: TStringField;
    quLoginEmail: TStringField;
    quLoginRank: TStringField;
    quLoginBanned: TBooleanField;
    quLoginIp: TStringField;
    quLoginPostTradeScreen: TStringField;
    quLoginIgnoreNewbie: TBooleanField;
    tbUsers: TTable;
    dsUsers: TDataSource;
    tbUsersId: TAutoIncField;
    tbUsersName: TStringField;
    tbUsersPass: TStringField;
    tbUsersRights: TStringField;
    tbUsersEmail: TStringField;
    tbUsersRank: TStringField;
    tbUsersBanned: TBooleanField;
    tbUsersIp: TStringField;
    tbUsersPostTradeScreen: TStringField;
    tbUsersIgnoreNewbie: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUser: TdmUser;

implementation

{$R *.dfm}

end.
