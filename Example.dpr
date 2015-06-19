program Example;

uses
  Forms,
  closedownExam in 'closedownExam.pas' {closedownExample},
  Closedown in 'Closedown\Closedown.pas',
  Linkhub in 'Linkhub\Linkhub.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TclosedownExample, closedownExample);
  Application.Run;
end.
