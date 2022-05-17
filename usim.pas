unit USim;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Grids,
  StdCtrls, Buttons;

type

  { TFSim }

  TFSim = class(TForm)
    ECapital: TEdit;
    EJuros: TEdit;
    EMeses: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GDados: TStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  FSim: TFSim;

implementation

{$R *.lfm}

{ TFSim }

procedure TFSim.FormCreate(Sender: TObject);
begin
   Width := Screen.Width div 2;
   Left:=Screen.Width div 2;;
   Height:= Screen.Height;
end;

procedure TFSim.FormResize(Sender: TObject);
begin
  Width := Screen.Width div 2;
  ECapital.Width:=Panel4.Width div 3;
  EJuros.Width:=Panel4.Width div 3;
  EMeses.Width:=Panel4.Width div 3;
  Label2.Width:=Panel4.Width div 3;
  Label4.Width:=Panel4.Width div 3;
  Label3.Width:=Panel4.Width div 3;
end;

procedure TFSim.SpeedButton1Click(Sender: TObject);
var _saldodevedor, _juros: Double;
    I: integer;
begin
  GDados.Clean;



  _saldodevedor := strtofloat(ECapital.Text);
  _juros := 0;

  for I := 0 to StrToInt(EMeses.Text) do

  begin

    if I = StrToInt(EMeses.Text) then
    begin
       GDados.InsertRowWithValues(I+1,[floattostr(I), floattostr((_saldodevedor * (StrToFloat(EJuros.Text)))/100), (ECapital.Text), floattostr(_saldodevedor), '0' ]);

    end
    else
    begin
       GDados.InsertRowWithValues(I+1,[floattostr(I), floattostr((_saldodevedor * (StrToFloat(EJuros.Text)))/100), '0', '0', floattostr(_saldodevedor) ]);

    end;

    _juros := _saldodevedor * (StrToFloat(EJuros.Text))/100;
    _saldodevedor:= _saldodevedor + _juros;

  end;
end;

end.

