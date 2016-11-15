unit unRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfmRegister = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    dbedUsername: TDBEdit;
    dbedPassword: TDBEdit;
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
