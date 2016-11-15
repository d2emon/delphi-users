unit unRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfmRegister = class(TForm)
    bbRegister: TBitBtn;
    edVerify: TEdit;
    dbedUsername: TDBEdit;
    dbedPassword: TDBEdit;
    lbUsername: TLabel;
    lbPassword: TLabel;
    lbConfirm: TLabel;
    procedure bbRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRegister: TfmRegister;

implementation

uses unDBUser;

{$R *.dfm}

procedure TfmRegister.bbRegisterClick(Sender: TObject);
begin
  if edVerify.Text = dbedPassword.Text then
  begin
    ModalResult := mrYes;
  end
  else
  begin
    ModalResult := mrNo;
  end;
end;

end.
