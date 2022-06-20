***Settings***
Documentation   Cadastro de clientes

Resource    ../resources/base.robot

Test Setup      Login Session
Test Teardown   Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o fomrulário de Cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...        Bom jovi     00000001406     Rua dos bugs, 123       11999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Campos obrigatorios
    [tags]      temp
    Dado que acesso o fomrulário de Cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...        ${EMPTY}     ${EMPTY}     ${EMPTY}       ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de cliente são obrigatórios
