object closedownExample: TclosedownExample
  Left = 428
  Top = 190
  Width = 613
  Height = 216
  Caption = '�������ȸ API SDK Example.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 18
    Width = 545
    Height = 65
    Caption = '�������ȸ API'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 121
      Height = 11
      AutoSize = False
      Caption = '��ȸ�� ����ڹ�ȣ :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object txtCorpNum: TEdit
      Left = 137
      Top = 27
      Width = 153
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 0
      Text = '4108600477'
    end
    object btnCheckCorpNum: TButton
      Left = 307
      Top = 23
      Width = 96
      Height = 28
      Caption = '�ܰ� ��ȸ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCheckCorpNumClick
    end
    object btnCheckCorpNums: TButton
      Left = 421
      Top = 24
      Width = 95
      Height = 26
      Caption = '�뷮 ��ȸ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCheckCorpNumsClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 108
    Width = 277
    Height = 65
    Caption = '���� API'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object btnGetBalance: TButton
      Left = 15
      Top = 23
      Width = 111
      Height = 25
      Caption = '�ܿ�����Ʈ ��ȸ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnGetBalanceClick
    end
    object btnUnitCost: TButton
      Left = 140
      Top = 23
      Width = 113
      Height = 25
      Caption = '��ȸ �ܰ� Ȯ��'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnUnitCostClick
    end
  end
end
