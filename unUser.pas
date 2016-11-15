unit unUser;

interface

uses
  DB, DBTables, SysUtils, unDBUser, Controls;

type
  EUserException = class(Exception)
  end;

  TUser = class
  private
    FLoginQuery: TQuery;
    FUsernameParam: TParam;
    FPasswordParam: TParam;
    FDataModule: TdmUser;
    function GetId: integer;
  public
    property Id: integer read GetId;
    function Login(Username, Password: String): Boolean;
    constructor Create;
    property DataModule: TdmUser read FDataModule;
    function ShowLoginForm: Boolean;
    function ShowRegisterForm: Boolean;
  end;

resourcestring
  ErrorBanned = 'You are banned!';
  ErrorLogin  = 'Invalid Username or Password';

var
  User: TUser;

implementation

uses unLogin, unRegister;

constructor TUser.Create;
begin
  FDataModule := TdmUser.Create(nil);

  FLoginQuery    := FDataModule.quLogin;
  FUsernameParam := FDataModule.quLogin.ParamByName('Username');
  FPasswordParam := FDataModule.quLogin.ParamByName('Password');
end;

function TUser.GetId: integer;
begin
  result := FDataModule.quLoginId.Value;
end;

function TUser.Login(Username, Password: String): Boolean;
begin
  FUsernameParam.AsString := Username;
  FPasswordParam.AsString := Password;

  FLoginQuery.Close;
  FLoginQuery.ExecSQL;
  FLoginQuery.Open;

  if(Id>0)then
  begin
    if(DataModule.quLoginBanned.Value)then
    begin
      raise EUserException.Create(ErrorBanned);
      result := false;
    end
    else
    begin
      result := true;
    end;
  end
  else
  begin
    raise EUserException.Create(ErrorLogin);
    result := false;
  end;
end;

function TUser.ShowLoginForm: Boolean;
var
  LoginForm: TfmLogin;
begin
  LoginForm := TfmLogin.Create(nil);
  LoginForm.User := self;

  if LoginForm.ShowModal = mrYes then
  begin
    result := Login(LoginForm.leUsername.Text, LoginForm.lePassword.Text);
  end
  else
  begin
    result := false;
  end;
end;

function TUser.ShowRegisterForm: Boolean;
var
  RegisterForm: TfmRegister;
begin
  RegisterForm := TfmRegister.Create(nil);

  DataModule.tbUsers.Insert;

  if RegisterForm.ShowModal = mrYes then
  begin
    DataModule.tbUsers.Post;
    result := true; //Login(LoginForm.leUsername.Text, LoginForm.lePassword.Text);
  end
  else
  begin
    result := false;
  end;
end;

end.
