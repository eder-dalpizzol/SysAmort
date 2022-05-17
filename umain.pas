unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, ComCtrls, ShellCtrls, USim;

type

  { TFMain }

  TFMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  FMain: TFMain;

implementation

{$R *.lfm}

{ TFMain }

procedure TFMain.FormCreate(Sender: TObject);
begin
  WindowState:= wsMaximized;
end;

procedure TFMain.SpeedButton1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFSim, FSim);

    FSim.Show;
  finally
    FSim :=Nil;
    Fsim.Free;
  end;

end;

end.

