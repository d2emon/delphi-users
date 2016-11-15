unit unDBGame;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs;

type
  TdmGame = class(TDataModule)
    tbGames: TTable;
    dsGames: TDataSource;
    tbGamesName: TStringField;
    tbGamesType: TStringField;
    tbGamesDescription: TStringField;
    tbGamesTurnrate: TIntegerField;
    tbGamesInterestrate: TIntegerField;
    tbGamesStartdate: TDateField;
    tbGamesClosedate: TDateField;
    tbGamesEnddate: TDateField;
    quActivePlayer: TQuery;
    tbGamesActive: TBooleanField;
    tbGamesId: TAutoIncField;
    procedure tbGamesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGame: TdmGame;

implementation

uses unDBUser;

{$R *.dfm}

procedure TdmGame.tbGamesCalcFields(DataSet: TDataSet);
begin
  quActivePlayer.ParamByName('GameId').AsInteger := tbGamesId.Value;

  quActivePlayer.Close;
  quActivePlayer.ExecSQL;
  quActivePlayer.Open;

  tbGamesActive.Value := quActivePlayer.RecordCount > 0;
end;

end.
