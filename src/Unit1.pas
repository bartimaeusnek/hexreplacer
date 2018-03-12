  {
  created on 12.03.2018 - bartimaeusnek
  }

unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    TBConvert: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    procedure TBConvertClick(Sender: TObject);

  private
    { Private declarations }


  public
    { Public declarations }

  end;
     function GetFileSizeEx(const AFileName: string): Int64;
     function HexStrToInt(const str: string): byte;
var
  Form1: TForm1;
  TCharFile,output : File;
  b : array of byte;
  regrex,replace : byte;

implementation

{$R *.dfm}

procedure TForm1.TBConvertClick(Sender: TObject);
var i : Integer;
begin

//open original file
 if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
    begin
      AssignFile(TCharFile, OpenDialog1.FileName);
      //open as readonly
      Reset(TCharFile,1);
      //set the array b to the files byte lenth
      SetLength(b,GetFileSizeEx(OpenDialog1.FileName));
      //read the file to the array
      while not Eof(TCharFile) do
        begin
        for i:=0 to (Length(b)-1) do
          blockread(TCharFile,b[i],1);
        end;
       //close the file, since we dont need it anymore data is in array
        CloseFile(TCharFile);

       //get the regrex and replacement
       regrex := HexStrToInt(Edit1.Text);
       replace := HexStrToInt(Edit2.Text);

       for i:=0 to (Length(b)-1) do
        if b[i] = regrex then //check for the regrex
          b[i] := replace;    //replace it

       //open/create a new file in RW mode & save byte array to it.
       if SaveDialog1.Execute then begin
         AssignFile(output,SaveDialog1.FileName);
         ReWrite(output,1);
         for i:=0 to (Length(b)-1) do
          blockwrite(output,b[i],1);
         end;
      CloseFile(output);
      ShowMessage('Done.');
    end;
end;


function GetFileSizeEx(const AFileName: string): Int64;
var
  F: TSearchRec;
begin
  Result := -1;
  if FindFirst(AFileName, faAnyFile, F) = 0 then
  begin
    try
      Result :=  F.FindData.nFileSizeLow or (F.FindData.nFileSizeHigh shl 32);
    finally
      SysUtils.FindClose(F);
    end;
  end;
end;

function HexStrToInt(const str: string): byte;
begin
  Result := StrToInt('$' + str);
end;

end.
