unit unSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus;

type
  TfmSelect = class(TForm)
    DBGrid1: TDBGrid;
    pmSelect: TPopupMenu;
    miSelect: TMenuItem;
    procedure miSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelect: TfmSelect;

implementation

uses unDBGame;

{$R *.dfm}

procedure TfmSelect.miSelectClick(Sender: TObject);
begin
  Close;
end;

end.
