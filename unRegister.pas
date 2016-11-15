unit unRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfmRegister = class(TForm)
    bbRegister: TBitBtn;
    edConfirm: TEdit;
    dbedUsername: TDBEdit;
    dbedPassword: TDBEdit;
    lbUsername: TLabel;
    lbPassword: TLabel;
    lbConfirm: TLabel;
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

end.
