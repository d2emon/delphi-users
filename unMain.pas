unit unMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, CustomizeDlg, XPStyleActnCtrls,
  ActnMan, ActnCtrls, ToolWin, ActnMenus, ImgList, ActnColorMaps, ExtCtrls, unUser,
  Grids, DBGrids;

type
  TfmMain = class(TForm)
    cdCustom: TCustomizeDlg;
    alActions: TActionList;
    aRegister: TAction;
    aLogin: TAction;
    amActions: TActionManager;
    ilImages: TImageList;
    aCustom: TAction;
    cbMenu: TControlBar;
    ambMenu: TActionMainMenuBar;
    atbTools: TActionToolBar;
    aSelectGame: TAction;
    pnLeft: TPanel;
    DBGrid1: TDBGrid;
    procedure aCustomExecute(Sender: TObject);
    procedure aLoginExecute(Sender: TObject);
    procedure aRegisterExecute(Sender: TObject);
    procedure aSelectGameExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

resourcestring
  AccessEnabled = 'Access Enabled';
  AccessDenied  = 'Access Denied';

var
  fmMain: TfmMain;

implementation

uses unLogin, unRegister, unDBUser, unSelect;

{$R *.dfm}

procedure TfmMain.aCustomExecute(Sender: TObject);
begin
  cdCustom.Show;
end;

procedure TfmMain.aLoginExecute(Sender: TObject);
begin
  User.ShowLoginForm;
end;

procedure TfmMain.aRegisterExecute(Sender: TObject);
begin
  User.ShowRegisterForm;
end;

procedure TfmMain.aSelectGameExecute(Sender: TObject);
begin
  fmSelect.ShowModal;
end;

end.
