unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, unUser, ActnList;

type
  TfmLogin = class(TForm)
    leUsername: TLabeledEdit;
    lePassword: TLabeledEdit;
    bbOk: TBitBtn;
    bbRegister: TBitBtn;
    alUser: TActionList;
    aLogin: TAction;
    aRegister: TAction;
    procedure aLoginExecute(Sender: TObject);
    procedure aRegisterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    User: TUser;
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

uses unMain;

{$R *.dfm}

procedure TfmLogin.aLoginExecute(Sender: TObject);
begin
  // User.ShowLoginForm;
(*
  if User.Login(leUsername.Text, lePassword.Text) then
  begin
    ModalResult := mrYes;
  end;
*)
end;

procedure TfmLogin.aRegisterExecute(Sender: TObject);
begin
  User.ShowRegisterForm;
end;

end.
