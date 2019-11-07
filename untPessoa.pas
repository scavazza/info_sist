unit untPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, xmldom, DB, Xmlxform, DBClient, Provider, Grids,
  DBGrids, SqlExpr, ExtCtrls, DBCtrls, StdCtrls, Mask, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler,
  IdIOHandlerStream, IdServerIOHandler, IdServerIOHandlerSocket,
  uLkJSON, IdMessageClient, IdSMTP, IdMessage, IdSSLOpenSSL, XMLIntf,
  msxmldom, XMLDoc, ComCtrls, IdIOHandlerSocket;

type
  TfrmPessoa = class(TForm)
    dsPessoa: TDataSource;
    idhViaCep: TIdHTTP;
    cdsPessoa: TClientDataSet;
    cdsPessoapssNome: TStringField;
    cdsPessoapssIdentidade: TStringField;
    cdsPessoapssCpf: TStringField;
    cdsPessoapssTelefone: TStringField;
    cdsPessoapssEmail: TStringField;
    cdsPessoapssCep: TStringField;
    cdsPessoapssLogradouro: TStringField;
    cdsPessoapssNumero: TStringField;
    cdsPessoapssComplemento: TStringField;
    cdsPessoapssBairro: TStringField;
    cdsPessoapssCidade: TStringField;
    cdsPessoapssEstado: TStringField;
    cdsPessoapssPais: TStringField;
    tmrLimpaMsg: TTimer;
    IdSMTP1: TIdSMTP;
    XMLDocument1: TXMLDocument;
    pgcTela: TPageControl;
    tbsCadastro: TTabSheet;
    lblMsgCep: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblMsgEmail: TLabel;
    lblMsgCpf: TLabel;
    dbgPessoa: TDBGrid;
    dbnPessoa: TDBNavigator;
    dbeCEP: TDBEdit;
    dbeLogradouro: TDBEdit;
    dbeNome: TDBEdit;
    dbeIdentidade: TDBEdit;
    dbeCpf: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeEmail: TDBEdit;
    dbeNumero: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    tbsEmail: TTabSheet;
    btnEnvEmail: TButton;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    lbeHost: TLabeledEdit;
    lbePort: TLabeledEdit;
    lbeUsuario: TLabeledEdit;
    lbeSenha: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure cdsPessoapssCepChange(Sender: TField);
    procedure tmrLimpaMsgTimer(Sender: TObject);
    procedure cdsPessoapssEmailChange(Sender: TField);
    procedure cdsPessoapssCpfChange(Sender: TField);
    procedure geraXML;
    procedure btnEnvEmailClick(Sender: TObject);
  private
    { Private declarations }
    procedure lblMensagem(pLabel: TLabel; pTexto: String);
  public
    { Public declarations }
  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}

function ValidaCpf(num: string): boolean;
var
i,n,d1,d2:integer;
digitado, calculado:string;
begin
   result:=false;

   d1 := 0;
   d2 := 0;

   try
      for i := 1 to 9 do
      begin
         n := StrToInt(num[i]);
         d1:= d1 + n*(11-1);
         d2:= d2 + n*(12-i);
      end;
      d1:= 11-(d1 mod 11);

      if d1>=10 then d1:=0;

      d2 := d2 + d1*2;
      d2:= 11-(d2 mod 11);
      if d2>=10 then d2:=0;

      calculado:= inttostr(d1)+inttostr(d2);
      digitado := num[10]+num[11];

      if calculado = digitado then
         result:=true;
   except
   end;
end;


procedure TfrmPessoa.FormShow(Sender: TObject);
begin
   cdsPessoa.CreateDataSet;
   pgcTela.TabIndex := tbsCadastro.TabIndex;
   dbeNome.SetFocus;
end;


procedure TfrmPessoa.cdsPessoapssCepChange(Sender: TField);
var
  lHTTP: TIdHTTP;
  httpStr: String;
  js:TlkJSONobject;
  jsonStr: TlkJSONstring;
  jsonBln: TlkJSONboolean;
  econtrado: boolean;
begin
   if length(cdsPessoapssCep.Text) <> 8 then
      lblMensagem(lblMsgCep, 'CEP deve conter 8 números dígitos.')
   else
   begin
      // cria acesso http
      lHTTP := TIdHTTP.Create(nil);


      // obtem a string json
      try
         httpStr := lHTTP.Get('http://viacep.com.br/ws/' + cdsPessoapssCep.Text + '/json/');

         // realiza o parce
         js := TlkJSON.ParseText(httpStr) as TlkJSONobject;

         econtrado := true;
      except
        lblMensagem(lblMsgCep, 'Erro ao acessar site www.viacep.');
        econtrado := false;
      end;

      // verifica se o cep é válido
      if econtrado then
      try
         jsonBln := js.Field['erro'] as TlkJSONboolean;

         if (jsonBln <> nil) then
            if (jsonBln.Value) then
            begin
               lblMensagem(lblMsgCep, 'CEP inválido.');
               econtrado := false
            end;
      except
         econtrado := true;
      end;

      // verifica se o cep é válido
      if econtrado then
      begin
         jsonStr := js.Field['logradouro'] as TlkJSONstring;
         cdsPessoapssLogradouro.Value := jsonStr.Value;

         jsonStr := js.Field['bairro'] as TlkJSONstring;
         cdsPessoapssBairro.Value := jsonStr.Value;

         jsonStr := js.Field['localidade'] as TlkJSONstring;
         cdsPessoapssCidade.Value := jsonStr.Value;

         jsonStr := js.Field['uf'] as TlkJSONstring;
         cdsPessoapssEstado.Value := jsonStr.Value;

         cdsPessoapssPais.Value := 'Brasil';

         js.Free;
      end;
   end;
end;

procedure TfrmPessoa.lblMensagem(pLabel: TLabel; pTexto: String);
begin
   pLabel.Caption := pTexto;
   pLabel.Visible := true;
   tmrLimpaMsg.Enabled := true;
end;


procedure TfrmPessoa.tmrLimpaMsgTimer(Sender: TObject);
begin
   lblMsgCep.Visible := false;
   lblMsgEmail.Visible := false;
   lblMsgCpf.Visible := false;
   tmrLimpaMsg.Enabled := false;
end;

procedure TfrmPessoa.cdsPessoapssEmailChange(Sender: TField);
begin
   if Pos('@',cdsPessoapssEmail.Value) = 0 then
      lblMensagem(lblMsgEmail, 'eMail inválido.');
end;

procedure TfrmPessoa.cdsPessoapssCpfChange(Sender: TField);
begin
   if not ValidaCpf(cdsPessoapssCpf.Value) then
      lblMensagem(lblMsgCpf, 'CPF inválido.');

end;

procedure TfrmPessoa.geraXML;
var
  LDocument: IXMLDocument;
  LNodeElement: IXMLNode;
  i:integer;
begin
   LDocument := TXMLDocument.Create(nil);

   LDocument.Active := True;

   // cria o nó principal
   LDocument.DocumentElement := LDocument.CreateNode('pessoa', ntElement, '');

   // percorre os campos da tabela  criando as tags
   for i:=0 to cdsPessoa.FieldDefs.Count-1 do
   begin
      LNodeElement := LDocument.DocumentElement.AddChild(cdsPessoa.FieldList[i].FieldName, -1);
      LNodeElement.Text := cdsPessoa.FieldList[i].AsString;
   end;

   // despeja em arquivo
   LDocument.SaveToFile('pessoa.xml');
end;

procedure TfrmPessoa.btnEnvEmailClick(Sender: TObject);
var
  // objetos necessários para o funcionamento
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  ArqTemp: string;
begin
   if (lbePort.Text = '')  or
      (lbeHost.Text = '') or
      (lbeUsuario.Text = '') or
      (lbeSenha.text = '') then
   begin
      pgcTela.TabIndex := tbsEmail.TabIndex;
      MessageDlg('Por favor informe os dados do servidor de email.', mtError, [mbOK], 0);
   end
   else
   begin
      // chama a geração do XML
      geraXML;

      // instanciação dos objetos
      IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
      IdSMTP := TIdSMTP.Create(Self);
      IdMessage := TIdMessage.Create(Self);

      try
         // Configuração do SSL
         IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
         IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

         // Configuração do SMTP
         IdSMTP.IOHandler := IdSSLIOHandlerSocket;
         IdSMTP.AuthenticationType := atLogin;
         IdSMTP.Port := StrToInt(lbePort.Text);
         IdSMTP.Host := lbeHost.Text;
         IdSMTP.Username := lbeUsuario.Text;
         IdSMTP.Password := lbeSenha.text;

         // Tentativa de conexão e autenticação
         try
           IdSMTP.Connect(1000);
           IdSMTP.Authenticate;
         except
           on E:Exception do
           begin
             MessageDlg('Erro na conexão e/ou autenticação: ' +
                         E.Message, mtWarning, [mbOK], 0);
             Exit;
           end;
         end;
   
         // Configuração da mensagem
         IdMessage.From.Address := lbeUsuario.Text;
         IdMessage.From.Name := lbeUsuario.Text;
         IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
         IdMessage.Recipients.EMailAddresses := cdsPessoapssEmail.Value;
         IdMessage.Subject := 'Confirmação do Cadastro';
         IdMessage.Body.Text := 'Anexo vai o XML de confirmação do cadastro';
   
         // Anexo da mensagem (opcional)
         ArqTemp := 'pessoa.xml';
         if FileExists(ArqTemp) then
           TIdAttachment.Create(IdMessage.MessageParts, ArqTemp);
   
         // Envio da mensagem
         try
           IdSMTP.Send(IdMessage);
           MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);
         except
           On E:Exception do
             MessageDlg('Erro ao enviar a mensagem: ' +
                         E.Message, mtWarning, [mbOK], 0);
         end;

         // apaga o arquivo temporário
         DeleteFile(ArqTemp)
      finally
         // liberação dos objetos da memória
         FreeAndNil(IdMessage);
         FreeAndNil(IdSSLIOHandlerSocket);
         FreeAndNil(IdSMTP);
      end;
   end;
end;

end.
