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
    quUserExists: TQuery;
    quEmailExists: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function InsertUser(Values: Array of String): Boolean;
    function ValidateEmail(Value: String): Boolean;
    function ValidateUsername(Value: String): Boolean;
    { Public declarations }
  end;

var
  dmUser: TdmUser;

resourcestring
  ErrorEmailExists = 'A user with that email address already exists!';
  ErrorUserExists = 'This user allready exists!';

implementation

{$R *.dfm}

procedure TdmUser.DataModuleCreate(Sender: TObject);
begin
  tbUsers.Open;
end;

function TdmUser.InsertUser(Values: array of String): Boolean;
begin
  if not (tbUsers.State in [dsInsert]) then
    tbUsers.Insert;
  tbUsersName.Value  := Values[0];
  tbUsersPass.Value  := Values[1];
  tbUsersEmail.Value := Values[2];
  tbUsers.Post;
  result := true;
end;

function TdmUser.ValidateEmail(Value: String): Boolean;
begin
  quEmailExists.ParamByName('Email').AsString := Value;

  quEmailExists.Close;
  quEmailExists.Open;

  Result := (quEmailExists.RecordCount = 0);
  if not Result then
    raise Exception.Create(ErrorEmailExists);
end;

function TdmUser.ValidateUsername(Value: String): Boolean;
begin
  quUserExists.ParamByName('Username').AsString := Value;

  quUserExists.Close;
  quUserExists.Open;

  Result := (quUserExists.RecordCount = 0);
  if not Result then
    raise Exception.Create(ErrorUserExists);
end;

end.
