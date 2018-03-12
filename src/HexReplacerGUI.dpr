program HexReplacerGUI;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Hex Replacer GUI';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
