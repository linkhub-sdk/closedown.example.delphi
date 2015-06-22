unit closedownExam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Closedown;

const
        // 링크아이디.
        LinkID = 'TESTER';
        // 파트너 통신용 비밀키. 유출 주의.
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
        tmp := tmp + 'stateDate(휴폐업일자) : '+ corpState.stateDate + #13;
        tmp := tmp + 'checkDate(국세청 확인일자) : '+ corpState.checkDate + #13#13;
        
        tmp := tmp + '* type (사업 유형) : null-알수없음, 1-일반과세자, 2-면세과세자, 3-간이과세자, 4-비영리법인, 국가기관' +#13;
        tmp := tmp + '* state (휴폐업상태) : null-알수없음, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업';

        ShowMessage(tmp);
end;


procedure TclosedownExample.btnCheckCorpNumsClick(Sender: TObject);
var
        CorpNumList : Array Of String;
        StateList : TCorpStateList;
        tmp : string;
        i : Integer;
begin
        //사업자번호 목록, 최대 1000건
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

        tmp := '* type (사업 유형) : null-알수없음, 1-일반과세자, 2-면세과세자, 3-간이과세자, 4-비영리법인, 국가기관' +#13;
        tmp := tmp + '* state (휴폐업상태) : null-알수없음, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업' +#13#13;
        
        for i := 0 to Length(StateList) -1 do
        begin
                tmp := tmp +'corpNum : '+ StateList[i].corpNum + #13;
                tmp := tmp +'type : '+ StateList[i].ctype + #13;
                tmp := tmp +'state : '+ StateList[i].state + #13;
                tmp := tmp +'stateDate(휴폐업일자) : '+ StateList[i].stateDate + #13;
                tmp := tmp +'checkDate(국세청 확인일자) : '+ StateList[i].checkDate + #13#13;
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

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

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

        ShowMessage('조회 단가 : '+ FloatToStr(unitcost));
end;

end.
