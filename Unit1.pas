unit Unit1;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, StdCtrls;

type
TForm1 = class(TForm)
Label1: TLabel;
Edit1: TEdit;
Button1: TButton;
Button2: TButton;
Label2: TLabel;
procedure Button1Click(Sender: TObject);
procedure Button2Click(Sender: TObject);

private
{ Private declarations }
public
{ Public declarations }
end;

Const
BukvKirSTR: set of char = ['�'..'�','�','�'..'�','�'..'�','�'];
BukvLat: set of char =['A'..'Z','a'..'z'];
BukvLatm: set of char = ['a'..'z'];
Prob: set of char = [' '];
BukvLatb: set of char =  ['A'..'Z'];
var
Form1: TForm1;

implementation

{$R *.dfm}

Function Prov(const s: string): byte;
Var
Nom: byte; // ����� ��������
i,Len: word; // ������� ������ � ����� ������
Begin
Nom:=0; len:= Length(S);
If Len=0 then Nom:=1
Else
Begin
i:=1;
while (i<=Len) and (Nom=0) do
begin
if Not ((S[i] in Prob) or (S[i] in BukvKirSTR)  or (S[i] in BukvLat)) then Nom:=2;
Inc(i);
end;
End;
Prov:=Nom;
End;

Procedure Sort(var s:string);
Var 
i, z, len: Word; // ����� �������� �������, ����� �������� (����), ����� ������
flag: Boolean; // �����������? (��� �������?)
ch: char; // ��� ������
Begin
Z:=1; len:=length(s);
Repeat
flag:=true;
for i:=1 to len-z do
if (s[i] in BukvLat) and ((s[i+1] in BukvKirSTR) or
(s[i+1] in Prob)) or (s[i] in BukvKirSTR)
and (s[i+1] in Prob) or
(s[i] in BukvLat) and (s[i+1] in BukvLat)
and (ansiuppercase(s[i])>ansiuppercase(s[i+1]))
or (s[i] in BukvLatm) and (s[i+1] in BukvLatb) and (ansiuppercase(s[i])=s[i+1])
then
begin // �����
ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;

end;
inc(z);
Until flag or (z=len);
End;

procedure TForm1.Button1Click(Sender: TObject);
var
s: string; Nom: byte;
begin
s:=Edit1.Text; // ���� ������ S
// ��������
Nom:= Prov(s);
Case Nom of
1: Label2.Caption := '������ ������';
2: Label2.Caption := '������������ �������';
else
begin // ����������
Sort(s);
Label2.Caption:='"'+s+'"'; // ����� ������ S
end; {else}
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Close;
end;
end.
