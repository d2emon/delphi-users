unit unUser;

interface

uses
  DB, DBTables, Forms, SysUtils, unDBUser, Controls, Dialogs;

type
  EUserException = class(Exception)
  end;

  TUser = class
  protected
    AutoRegister: Boolean;
    CanGuest: Boolean;

    FLoginQuery: TQuery;
    FUsernameParam: TParam;
    FPasswordParam: TParam;
    FDataModule: TdmUser;

    LifeTime: Integer;
    // Max allowed idle time before
    // reauthentication is necessary.
    // If set to 0, auth never expires.

    RefreshTime: Integer;
    // Refresh interval in minutes.
    // When expires auth data is refreshed
    // from db using auth_refreshlogin()
    // method. Set to 0 to disable refresh
    procedure UpdateUser;
  private
    Expired: TTime;
    Refresh: TTime;
    function GetAuthenticated: Boolean;
    function GetGuest: Boolean;
    function GetId: Integer;
  public
    LoginForm: TForm;
    RegisterForm: TForm;

    property Authenticated: Boolean read GetAuthenticated;
    property DataModule: TdmUser read FDataModule;
    property Id: integer read GetId;
    property IsGuest: Boolean read GetGuest;
    constructor Create;
    function Login(Username, Password: String): Boolean;
    function NewUser(Username, Password: String): Boolean;
    function ShowLoginForm: Boolean;
    function ShowRefreshForm: Boolean;
    function ShowRegisterForm: Boolean;
    procedure Start;
  end;

resourcestring
  ErrorBanned = 'You are banned!';
  ErrorLogin  = 'Invalid Username or Password';

implementation

constructor TUser.Create;
begin
  FDataModule := TdmUser.Create(nil);

  FLoginQuery    := FDataModule.quLogin;
  FUsernameParam := FDataModule.quLogin.ParamByName('Username');
  FPasswordParam := FDataModule.quLogin.ParamByName('Password');

  CanGuest     := True;
  AutoRegister := True;
  Lifetime     := 15;
  RefreshTime  := 0;
end;

function TUser.GetAuthenticated: Boolean;
begin
  Result := False;
  if ((not IsGuest) and ((self.Lifetime <= 0) or (Now() < self.Expired))) then
  begin
    if (self.RefreshTime > 0) and (self.Refresh > 0) and (self.Refresh < Now()) then
    begin
      Result := self.ShowRefreshForm;
    end;
  end;
end;

function TUser.GetGuest: Boolean;
begin
  Result := (self.Id <= 0);
end;

function TUser.GetId: integer;
begin
  result := FDataModule.quLoginId.Value;
end;

function TUser.Login(Username, Password: String): Boolean;
begin
  FUsernameParam.Value := Username;
  FPasswordParam.Value := Password;

  FLoginQuery.Close;
  FLoginQuery.Open;

  if(not self.IsGuest)then
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

function TUser.NewUser(Username, Password: String): Boolean;
begin
  if (DataModule.ValidateUsername(Username))
    then Result := DataModule.InsertUser([Username, Password])
    else Result := False;
end;

function TUser.ShowLoginForm: Boolean;
begin
  result := (self.LoginForm.ShowModal = mrYes);
end;

function TUser.ShowRefreshForm: Boolean;
begin
  Result := self.ShowLoginForm;
end;

function TUser.ShowRegisterForm: Boolean;
begin
  result := (self.RegisterForm.ShowModal = mrYes);
end;

procedure TUser.Start;
begin
  if self.Authenticated then
    self.UpdateUser
  else
    if AutoRegister then
      self.ShowRegisterForm
    else
      if not CanGuest then
        self.ShowLoginForm;
end;

procedure TUser.UpdateUser;
begin
  if not self.IsGuest then
  begin
    self.Expired := Now() + (60 * LifeTime);
    self.Refresh := Now() + (60 * RefreshTime);
  end;
end;

end.
