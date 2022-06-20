*** Settings ***
Documentation   Login

Resource    ../resources/base.robot

Suite Setup          Start Session
Suite Teardown       Finish Session
Test Template       Tentativa de login
 
*** Keywords ***
Tentativa de login
    [Arguments]     ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a página Login
    Submeto minhas credenciais  ${input_email}  ${input_senha}
    Devo ver um toaster com a mensagem   ${output_mensagem}


*** Test Cases ***
Senha incorreta             admin@zepalheta.com.br      abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
Senha em branco             admin@zepalheta.com.br      ${EMPTY}    O campo senha é obrigatório!
Email em branco             ${EMPTY}                    abc123      O campo email é obrigatório!
Email e senha em branco     ${EMPTY}                    ${EMPTY}    Os campos email e senha não foram preenchidos!
Login incorreto             error&gmail.com             abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
