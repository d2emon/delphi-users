unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, unUser;

type
  TfmLogin = class(TForm)
    leUsername: TLabeledEdit;
    lePassword: TLabeledEdit;
    bbOk: TBitBtn;
    bbRegister: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure bbRegisterClick(Sender: TObject);
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

procedure TfmLogin.bbOkClick(Sender: TObject);
begin
(*
  if User.Login(leUsername.Text, lePassword.Text) then
  begin
    ModalResult := mrYes;
  end;
*)
end;

procedure TfmLogin.bbRegisterClick(Sender: TObject);
begin
  User.ShowRegisterForm;
end;

end.
