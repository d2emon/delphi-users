program users;

uses
  Forms,
  Controls,
  unMain in 'unMain.pas' {fmMain},
  unLogin in 'unLogin.pas' {fmLogin},
  unRegister in 'unRegister.pas' {fmRegister},
  unUser in 'unUser.pas',
  unDBUser in 'unDBUser.pas' {dmUser: TDataModule},
  unDBGame in 'unDBGame.pas' {dmGame: TDataModule},
  unSelect in 'unSelect.pas' {fmSelect};

{$R *.res}

begin
  Application.Initialize;

  User := TUser.Create;
  if(User.ShowLoginForm)then
  begin
    Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmGame, dmGame);
  Application.CreateForm(TfmSelect, fmSelect);
  //Application.CreateForm(TdmUser, dmUser);
    //Application.CreateForm(TfmRegister, fmRegister);
    //Application.CreateForm(TfmLogin, fmLogin);
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;
end.
