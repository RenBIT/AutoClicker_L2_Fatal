unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Unit2, Windows, Classes, SysUtils, Forms, Controls,
  Dialogs, ExtCtrls,
  StdCtrls, Buttons, IniPropStorage;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image2: TImage;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MouseHandle: TTimer;
    SpeedButton1: TSpeedButton;
    TimerDec: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: char);
    procedure Edit11Change(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: char);
    procedure Edit12Change(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: char);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: char);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: char);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: char);
    procedure Edit8Change(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: char);
    procedure Edit9Change(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: char);
    procedure Image2MouseDown(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimerDecTimer(Sender: TObject);
    procedure MouseHandleTimer(Sender: TObject);
  private
    { private declarations }
  public
    procedure SearchWindow(rPos: TPoint);
    procedure KeyPress(key: integer; DownPar, UpPar: dword); reintroduce;
    { public declarations }
  end;

var
  Form1: TForm1;
  TimDec: array [1..12] of integer;
  CursWnd: THandle;
  CursName: array [0..255] of char;
  rPos: TPoint;

implementation

{$R *.lfm}

{ TForm1 }
//Тянем картинку на окно
procedure TForm1.Image2MouseDown(Sender: TObject);
begin
  Screen.Cursor := crSizeAll;
  if getasynckeystate($01) <> 0 then
  begin
    MouseHandle.Enabled := True;
    Image2.Visible := False;
    Label13.Visible := True;
  end;
end;

//info
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Form2.Show;
end;

//Старат программы
procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i: integer;
  Edit: TEdit;
begin
  Edit := TEdit.Create(nil);

  for i := 1 to 11 do
  begin
    Edit := TEdit(FindComponent('Edit' + IntToStr(i)));

    if Edit.Text = '' then
    begin
      Edit.Text := '0';
    end;

    TimDec[i] := StrToInt(Edit.Text);

  end;

  if not (TimerDec.Enabled) then
  begin
    BitBtn1.Caption := 'STOP';
    TimerDec.Enabled := True;
  end
  else
  begin
    BitBtn1.Caption := 'START';
    TimerDec.Enabled := False;
  end;
end;

procedure TForm1.Edit10Change(Sender: TObject);
begin
  if trim(edit10.Text) = '' then
    TimDec[10] := 0
  else
    TimDec[10] := StrToInt(edit10.Text);
end;

procedure TForm1.Edit10KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit11Change(Sender: TObject);
begin
  if trim(edit11.Text) = '' then
    TimDec[11] := 0
  else
    TimDec[11] := StrToInt(edit11.Text);
end;

procedure TForm1.Edit11KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit12Change(Sender: TObject);
begin
  if trim(edit12.Text) = '' then
    TimDec[12] := 0
  else
    TimDec[12] := StrToInt(edit12.Text);
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text) = '' then
    TimDec[1] := 0
  else
    TimDec[1] := StrToInt(edit1.Text);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if trim(edit2.Text) = '' then
    TimDec[2] := 0
  else
    TimDec[2] := StrToInt(edit2.Text);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  if trim(edit3.Text) = '' then
    TimDec[3] := 0
  else
    TimDec[3] := StrToInt(edit3.Text);
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  if trim(edit4.Text) = '' then
    TimDec[4] := 0
  else
    TimDec[4] := StrToInt(edit4.Text);
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if trim(edit5.Text) = '' then
    TimDec[5] := 0
  else
    TimDec[5] := StrToInt(edit5.Text);
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  if trim(edit6.Text) = '' then
    TimDec[6] := 0
  else
    TimDec[6] := StrToInt(edit6.Text);
end;

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
  if trim(edit7.Text) = '' then
    TimDec[7] := 0
  else
    TimDec[7] := StrToInt(edit7.Text);
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit8Change(Sender: TObject);
begin
  if trim(edit8.Text) = '' then
    TimDec[8] := 0
  else
    TimDec[8] := StrToInt(edit8.Text);
end;

procedure TForm1.Edit8KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.Edit9Change(Sender: TObject);
begin
  if trim(edit9.Text) = '' then
    TimDec[9] := 0
  else
    TimDec[9] := StrToInt(edit9.Text);
end;

procedure TForm1.Edit9KeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

//клавиши
procedure TForm1.TimerDecTimer(Sender: TObject);
begin
  if CheckBox1.Checked = True then
  begin
    Dec(TimDec[1]);
    if TimDec[1] = 0 then
    begin
      KeyPress(112, $003B0001, $C03B0001);
      TimDec[1] := StrToInt(edit1.Text);
    end;
    if TimDec[1] > 0 then
      Label1.Caption := '~' + IntToStr(TimDec[1]);
  end;

  if CheckBox2.Checked = True then
  begin
    Dec(TimDec[2]);
    if TimDec[2] = 0 then
    begin
      KeyPress(113, $003C0001, $C03C0001);
      TimDec[2] := StrToInt(edit2.Text);
    end;
    if TimDec[2] > 0 then
      Label2.Caption := '~' + IntToStr(TimDec[2]);
  end;


  if CheckBox3.Checked = True then
  begin
    Dec(TimDec[3]);
    if TimDec[3] = 0 then
    begin
      KeyPress(114, $003D0001, $C03D0001);
      TimDec[3] := StrToInt(edit3.Text);
    end;
    if TimDec[3] > 0 then
      Label3.Caption := '~' + IntToStr(TimDec[3]);
  end;

  if CheckBox4.Checked = True then
  begin
    Dec(TimDec[4]);
    if TimDec[4] = 0 then
    begin
      KeyPress(115, $003E0001, $C03E0001);
      TimDec[4] := StrToInt(edit4.Text);
    end;
    if TimDec[4] > 0 then
      Label4.Caption := '~' + IntToStr(TimDec[4]);
  end;

  if CheckBox5.Checked = True then
  begin
    Dec(TimDec[5]);
    if TimDec[5] = 0 then
    begin
      KeyPress(116, $003F0001, $C03F0001);
      TimDec[5] := StrToInt(edit5.Text);
    end;
    if TimDec[5] > 0 then
      Label5.Caption := '~' + IntToStr(TimDec[5]);
  end;

  if CheckBox6.Checked = True then
  begin
    Dec(TimDec[6]);
    if TimDec[6] = 0 then
    begin
      KeyPress(117, $00400001, $C0400001);
      TimDec[6] := StrToInt(edit6.Text);
    end;
    if TimDec[6] > 0 then
      Label6.Caption := '~' + IntToStr(TimDec[6]);
  end;

  if CheckBox7.Checked = True then
  begin
    Dec(TimDec[7]);
    if TimDec[7] = 0 then
    begin
      KeyPress(118, $00410001, $C0410001);
      TimDec[7] := StrToInt(edit7.Text);
    end;
    if TimDec[7] > 0 then
      Label7.Caption := '~' + IntToStr(TimDec[7]);
  end;

  if CheckBox8.Checked = True then
  begin
    Dec(TimDec[8]);
    if TimDec[8] = 0 then
    begin
      KeyPress(119, $00420001, $C0420001);
      TimDec[8] := StrToInt(edit8.Text);
    end;
    if TimDec[8] > 0 then
      Label8.Caption := '~' + IntToStr(TimDec[8]);
  end;

  if CheckBox9.Checked = True then
  begin
    Dec(TimDec[9]);
    if TimDec[9] = 0 then
    begin
      KeyPress(120, $00430001, $C0430001);
      TimDec[9] := StrToInt(edit9.Text);
    end;
    if TimDec[9] > 0 then
      Label9.Caption := '~' + IntToStr(TimDec[9]);
  end;

  if CheckBox10.Checked = True then
  begin
    Dec(TimDec[10]);
    if TimDec[10] = 0 then
    begin
      KeyPress(121, $00440001, $C0440001);
      TimDec[10] := StrToInt(edit10.Text);
    end;
    if TimDec[10] > 0 then
      Label10.Caption := '~' + IntToStr(TimDec[10]);
  end;


  if CheckBox11.Checked = True then
  begin
    Dec(TimDec[11]);
    if TimDec[11] = 0 then
    begin
      KeyPress(122, $00570001, $C0570001);
      TimDec[11] := StrToInt(edit11.Text);
    end;
    if TimDec[11] > 0 then
      Label11.Caption := '~' + IntToStr(TimDec[11]);
  end;

  if CheckBox12.Checked = True then
  begin
    Dec(TimDec[12]);
    if TimDec[12] = 0 then
    begin
      KeyPress(123, $00580001, $C0580001);
      TimDec[12] := StrToInt(edit12.Text);
    end;
    if TimDec[12] > 0 then
      Label12.Caption := '~' + IntToStr(TimDec[12]);
  end;

end;

//Таймер получаем Окно под курсором
procedure TForm1.MouseHandleTimer(Sender: TObject);
begin
  Label13.Caption := IntToStr(CursWnd);
  if boolean(GetCursorPos(rPos)) then
  begin
    SearchWindow(rPos);
    if getasynckeystate($1) = 0 then
    begin
      MouseHandle.Enabled := False;
      Screen.Cursor := crDefault;
      ShowMessage('Окно подключено!');
      Image2.Visible := True;
      Label13.Visible := False;
      GroupBox2.Enabled := True;
      BitBtn1.Enabled := True;
    end;
  end;
end;

//Функция Окно под курсором
procedure TForm1.SearchWindow(rPos: TPoint);
begin
  CursWnd := WindowFromPoint(rPos);
  if boolean(GetClassName(CursWnd, CursName, 256)) then
  begin
  end;
end;

//Нажимаем клавишу по ёе коду
procedure TForm1.KeyPress(key: integer; DownPar, UpPar: dword);
begin
    //Нажмем клавишу
  PostMessage(CursWnd, WM_SYSKEYDOWN, key, DownPar);
  sleep(2);
   //Отпустим клавишу
  PostMessage(CursWnd, WM_SYSKEYUP, key, UpPar);
end;

end.
