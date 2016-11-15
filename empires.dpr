program empires;

uses
  Forms,
  Controls,
  Dialogs,
  unMain in 'unMain.pas' {fmMain},
  unLogin in 'unLogin.pas' {fmLogin},
  unRegister in 'unRegister.pas' {fmRegister},
  unUser in 'unUser.pas',
  unDBUser in 'unDBUser.pas' {dmUser: TDataModule};

{$R *.res}

resourcestring
  AccessEnabled = 'Access Enabled';
  AccessDenied  = 'Access Denied';

begin
  Application.Initialize;

  User := TUser.Create;
  if(User.ShowLoginForm)then
  begin
    MessageDlg(AccessEnabled, mtInformation, [mbOk], 0);

    Application.CreateForm(TfmMain, fmMain);
    //Application.CreateForm(TdmUser, dmUser);
    //Application.CreateForm(TfmRegister, fmRegister);
    //Application.CreateForm(TfmLogin, fmLogin);
    Application.Run;
  end
  else
  begin
    MessageDlg(AccessDenied, mtError, [mbOk], 0);
    Application.Terminate;
  end;
end.
