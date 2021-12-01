unit fMkDir;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls, LCLType, Dialogs, strutils, uDebug;

type

  { TfrmMkDir }

  TfrmMkDir = class(TForm)
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    cbMkDir: TComboBox;
    lblMakeDir: TLabel;
    pnlButtons: TPanel;
    pnlBottom: TPanel;
    mDirList: TMemo;

    procedure cbMkDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mDirListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public

  end;

function ShowMkDir(TheOwner: TComponent; var sPath:String; var sPathList: TStringList): Boolean;

implementation

{$R *.lfm}

uses
  DCStrUtils, uGlobs;

procedure TfrmMkDir.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    ModalResult:= mrCancel;
    Key := #0;
  end
end;

function ShowMkDir(TheOwner: TComponent; var sPath: String; var sPathList: TStringList): Boolean;
const
  MAX_LINES = 20;
var Index, i: Integer;
    dirListItem: String;
begin
  with TfrmMkDir.Create(TheOwner) do
  try
    mDirList.Text := '';
    
    ActiveControl := cbMkDir;
    cbMkDir.Items.Assign(glsCreateDirectoriesHistory);
    if (sPath <> '..') then
      cbMkDir.Text := sPath
    else begin
      cbMkDir.Text := '';
    end;
    cbMkDir.SelectAll;
    Result := (ShowModal = mrOK);
    
    if Result then
    begin
      sPath := TrimPath(cbMkDir.Text);
      glsCreateDirectoriesHistory.CaseSensitive := FileNameCaseSensitive;
      Index := glsCreateDirectoriesHistory.IndexOf(sPath);

      if (Index = -1) then
        glsCreateDirectoriesHistory.Insert(0, sPath)
      else
        glsCreateDirectoriesHistory.Move(Index, 0);

      if (glsCreateDirectoriesHistory.Count > MAX_LINES) then
        glsCreateDirectoriesHistory.Delete(glsCreateDirectoriesHistory.Count - 1);
    end;
    
    if mDirList.Lines.Count = 0 then
    begin
      sPathList.Add(sPath);
    end
    else
    begin
      for i:=0 to mDirList.Lines.Count-1 do
      begin
        dirListItem := mDirList.Lines[i].Trim;
        if Length(dirListItem) <> 0 then
          sPathList.Add(dirListItem);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmMkDir.mDirListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
  begin
    ModalResult:=mrOK;
    Key:=0;
  end;
end;

procedure TfrmMkDir.cbMkDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  sText, TextBefore, TextAfter: String;
  CursorPos, wPos, wCount, wPosTemp, wNum, wLen, sTextLen, DeletedChars: Integer;
begin
   if (ssCtrl in Shift) and (Key = VK_BACK) then
   begin
     sText := cbMkDir.Text;
     CursorPos := cbMkDir.SelStart + cbMkDir.SelLength + 1;
     sTextLen := Length(sText);
     
     wPos := 0;
     wCount := WordCount(sText, StdWordDelims);
     
     if wCount > 0 then
     begin
       for i := 1 to wCount do
       begin
         wPosTemp := WordPosition(i, sText, StdWordDelims);
         if wPosTemp >= CursorPos then break;
         wPos := wPosTemp;
       end;
     end;
     
     TextBefore := Copy(sText, 1, wPos-1);
     TextAfter := Copy(sText, CursorPos, sTextLen);
     sText := TextBefore + TextAfter;

     cbMkDir.Text := sText;
     cbMkDir.SelStart := wPos-1;

     Key := 0;
   end;
end;

end.
