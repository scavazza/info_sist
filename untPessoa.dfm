object frmPessoa: TfrmPessoa
  Left = 269
  Top = 134
  Width = 661
  Height = 568
  Caption = 'frmPessoa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcTela: TPageControl
    Left = 0
    Top = 0
    Width = 645
    Height = 529
    ActivePage = tbsCadastro
    Align = alClient
    TabOrder = 0
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      DesignSize = (
        637
        501)
      object lblMsgCep: TLabel
        Left = 80
        Top = 309
        Width = 49
        Height = 13
        Caption = 'lblMsgCep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label1: TLabel
        Left = 8
        Top = 192
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 392
        Top = 192
        Width = 50
        Height = 13
        Caption = 'Identidade'
      end
      object Label3: TLabel
        Left = 512
        Top = 192
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object Label4: TLabel
        Left = 8
        Top = 240
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label5: TLabel
        Left = 128
        Top = 240
        Width = 25
        Height = 13
        Caption = 'eMail'
      end
      object Label6: TLabel
        Left = 8
        Top = 288
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object Label7: TLabel
        Left = 8
        Top = 336
        Width = 54
        Height = 13
        Caption = 'Logradouro'
      end
      object Label8: TLabel
        Left = 392
        Top = 336
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label9: TLabel
        Left = 8
        Top = 384
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label10: TLabel
        Left = 216
        Top = 384
        Width = 24
        Height = 13
        Caption = 'Bairo'
      end
      object Label11: TLabel
        Left = 8
        Top = 432
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label12: TLabel
        Left = 176
        Top = 432
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label13: TLabel
        Left = 224
        Top = 432
        Width = 20
        Height = 13
        Caption = 'Pais'
      end
      object lblMsgEmail: TLabel
        Left = 504
        Top = 261
        Width = 55
        Height = 13
        Caption = 'lblMsgEmail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblMsgCpf: TLabel
        Left = 512
        Top = 229
        Width = 46
        Height = 13
        Caption = 'lblMsgCpf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbgPessoa: TDBGrid
        Left = 8
        Top = 32
        Width = 622
        Height = 137
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsPessoa
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbnPessoa: TDBNavigator
        Left = 8
        Top = 0
        Width = 240
        Height = 25
        DataSource = dsPessoa
        TabOrder = 1
      end
      object dbeCEP: TDBEdit
        Left = 8
        Top = 304
        Width = 65
        Height = 21
        DataField = 'pssCep'
        DataSource = dsPessoa
        TabOrder = 2
      end
      object dbeLogradouro: TDBEdit
        Left = 8
        Top = 352
        Width = 369
        Height = 21
        DataField = 'pssLogradouro'
        DataSource = dsPessoa
        TabOrder = 3
      end
      object dbeNome: TDBEdit
        Left = 8
        Top = 208
        Width = 369
        Height = 21
        DataField = 'pssNome'
        DataSource = dsPessoa
        TabOrder = 4
      end
      object dbeIdentidade: TDBEdit
        Left = 392
        Top = 208
        Width = 105
        Height = 21
        DataField = 'pssIdentidade'
        DataSource = dsPessoa
        TabOrder = 5
      end
      object dbeCpf: TDBEdit
        Left = 512
        Top = 208
        Width = 105
        Height = 21
        DataField = 'pssCpf'
        DataSource = dsPessoa
        TabOrder = 6
      end
      object dbeTelefone: TDBEdit
        Left = 8
        Top = 256
        Width = 105
        Height = 21
        DataField = 'pssTelefone'
        DataSource = dsPessoa
        TabOrder = 7
      end
      object dbeEmail: TDBEdit
        Left = 128
        Top = 256
        Width = 369
        Height = 21
        DataField = 'pssEmail'
        DataSource = dsPessoa
        TabOrder = 8
      end
      object dbeNumero: TDBEdit
        Left = 392
        Top = 352
        Width = 89
        Height = 21
        DataField = 'pssNumero'
        DataSource = dsPessoa
        TabOrder = 9
      end
      object dbeComplemento: TDBEdit
        Left = 8
        Top = 400
        Width = 193
        Height = 21
        DataField = 'pssComplemento'
        DataSource = dsPessoa
        TabOrder = 10
      end
      object dbeBairro: TDBEdit
        Left = 216
        Top = 400
        Width = 193
        Height = 21
        DataField = 'pssBairro'
        DataSource = dsPessoa
        TabOrder = 11
      end
      object dbeCidade: TDBEdit
        Left = 8
        Top = 448
        Width = 153
        Height = 21
        DataField = 'pssCidade'
        DataSource = dsPessoa
        TabOrder = 12
      end
      object dbeEstado: TDBEdit
        Left = 176
        Top = 448
        Width = 33
        Height = 21
        DataField = 'pssEstado'
        DataSource = dsPessoa
        TabOrder = 13
      end
      object dbePais: TDBEdit
        Left = 224
        Top = 448
        Width = 153
        Height = 21
        DataField = 'pssPais'
        DataSource = dsPessoa
        TabOrder = 14
      end
      object btnEnvEmail: TButton
        Left = 528
        Top = 384
        Width = 75
        Height = 25
        Caption = 'Envia email'
        TabOrder = 15
        OnClick = btnEnvEmailClick
      end
    end
    object tbsEmail: TTabSheet
      Caption = 'Servidor de email'
      ImageIndex = 1
      object lbeHost: TLabeledEdit
        Left = 16
        Top = 24
        Width = 185
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Host'
        TabOrder = 0
        Text = 'smtp.gmail.com'
      end
      object lbePort: TLabeledEdit
        Left = 16
        Top = 72
        Width = 49
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'Port'
        TabOrder = 1
        Text = '465'
      end
      object lbeUsuario: TLabeledEdit
        Left = 16
        Top = 120
        Width = 185
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        TabOrder = 2
      end
      object lbeSenha: TLabeledEdit
        Left = 16
        Top = 168
        Width = 185
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        TabOrder = 3
      end
    end
  end
  object dsPessoa: TDataSource
    AutoEdit = False
    DataSet = cdsPessoa
    Left = 248
    Top = 96
  end
  object idhViaCep: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 360
    Top = 56
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 64
    object cdsPessoapssNome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 72
      FieldName = 'pssNome'
      Size = 50
    end
    object cdsPessoapssIdentidade: TStringField
      DisplayLabel = 'Identidade'
      DisplayWidth = 16
      FieldName = 'pssIdentidade'
      Size = 11
    end
    object cdsPessoapssCpf: TStringField
      DisplayLabel = 'Cpf'
      DisplayWidth = 16
      FieldName = 'pssCpf'
      OnChange = cdsPessoapssCpfChange
      EditMask = '999\.999\.999\-99;0;_'
      Size = 11
    end
    object cdsPessoapssTelefone: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 22
      FieldName = 'pssTelefone'
      EditMask = '!\(99\)99999-9999;0;_'
      Size = 15
    end
    object cdsPessoapssEmail: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 47
      FieldName = 'pssEmail'
      OnChange = cdsPessoapssEmailChange
      Size = 100
    end
    object cdsPessoapssCep: TStringField
      DisplayLabel = 'Cep'
      DisplayWidth = 12
      FieldName = 'pssCep'
      OnChange = cdsPessoapssCepChange
      EditMask = '99999\-999;0;_'
      Size = 8
    end
    object cdsPessoapssLogradouro: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 59
      FieldName = 'pssLogradouro'
      Size = 100
    end
    object cdsPessoapssNumero: TStringField
      DisplayLabel = 'Numero'
      DisplayWidth = 15
      FieldName = 'pssNumero'
      Size = 10
    end
    object cdsPessoapssComplemento: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 43
      FieldName = 'pssComplemento'
      Size = 30
    end
    object cdsPessoapssBairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 43
      FieldName = 'pssBairro'
      Size = 30
    end
    object cdsPessoapssCidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 58
      FieldName = 'pssCidade'
      Size = 40
    end
    object cdsPessoapssEstado: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 9
      FieldName = 'pssEstado'
      Size = 2
    end
    object cdsPessoapssPais: TStringField
      DisplayLabel = 'Pais'
      DisplayWidth = 43
      FieldKind = fkCalculated
      FieldName = 'pssPais'
      Size = 30
      Calculated = True
    end
  end
  object tmrLimpaMsg: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrLimpaMsgTimer
    Left = 360
    Top = 24
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 584
    Top = 320
  end
  object XMLDocument1: TXMLDocument
    Left = 544
    Top = 320
    DOMVendorDesc = 'MSXML'
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 588
    Top = 288
  end
end
