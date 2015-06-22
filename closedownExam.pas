unit closedownExam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Closedown;

const
        // ��ũ���̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TclosedownExample = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    txtCorpNum: TEdit;
    Label1: TLabel;
    btnCheckCorpNum: TButton;
    btnCheckCorpNums: TButton;
    btnGetBalance: TButton;
    btnUnitCost: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCheckCorpNumClick(Sender: TObject);
    procedure btnCheckCorpNumsClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnUnitCostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  closedownExample: TclosedownExample;
  closedownChecker: TClosedownChecker;
implementation

{$R *.DFM}

procedure TclosedownExample.FormCreate(Sender: TObject);
begin
        closedownChecker := TClosedownChecker.Create(LinkID,SecretKey);
end;

procedure TclosedownExample.btnCheckCorpNumClick(Sender: TObject);
var
        corpState : TCorpState;
        tmp : string;
begin
        try
                corpState := closedownChecker.checkCorpNum(txtCorpNum.text);
        except
                on le : EClosedownException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'corpNum : '+ corpState.corpNum + #13;
        tmp := tmp + 'type : '+ corpState.ctype + #13;
        tmp := tmp + 'state : '+ corpState.state + #13;
        tmp := tmp + 'stateDate(���������) : '+ corpState.stateDate + #13;
        tmp := tmp + 'checkDate(����û Ȯ������) : '+ corpState.checkDate + #13#13;
        
        tmp := tmp + '* type (��� ����) : null-�˼�����, 1-�Ϲݰ�����, 2-�鼼������, 3-���̰�����, 4-�񿵸�����, �������' +#13;
        tmp := tmp + '* state (���������) : null-�˼�����, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�';

        ShowMessage(tmp);
end;


procedure TclosedownExample.btnCheckCorpNumsClick(Sender: TObject);
var
        CorpNumList : Array Of String;
        StateList : TCorpStateList;
        tmp : string;
        i : Integer;
begin
        //����ڹ�ȣ ���, �ִ� 1000��
        SetLength(CorpNumList,3);
        CorpNumList[0] := '1234567890';
        CorpNumList[1] := '4352343543';
        CorpNumList[2] := '4108600477';

        try
                StateList := closedownChecker.checkCorpNums(CorpNumList);

        except
                on le : EClosedownException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := '* type (��� ����) : null-�˼�����, 1-�Ϲݰ�����, 2-�鼼������, 3-���̰�����, 4-�񿵸�����, �������' +#13;
        tmp := tmp + '* state (���������) : null-�˼�����, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�' +#13#13;
        
        for i := 0 to Length(StateList) -1 do
        begin
                tmp := tmp +'corpNum : '+ StateList[i].corpNum + #13;
                tmp := tmp +'type : '+ StateList[i].ctype + #13;
                tmp := tmp +'state : '+ StateList[i].state + #13;
                tmp := tmp +'stateDate(���������) : '+ StateList[i].stateDate + #13;
                tmp := tmp +'checkDate(����û Ȯ������) : '+ StateList[i].checkDate + #13#13;
        end;
        ShowMessage(tmp);
end;

procedure TclosedownExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        try
                balance := closedownChecker.GetBalance();
        except
                on le : EClosedownException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TclosedownExample.btnUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := closedownChecker.GetUnitCost();
        except
                on le : EClosedownException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('��ȸ �ܰ� : '+ FloatToStr(unitcost));
end;

end.
