***Settings***
Documentation   Cadastro de clientes

Resource    ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

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


Nome é obrigatório
    [Tags]          required
    [Template]      Validção de Campos
    ${EMPTY}    33208165862     Rua dos bugs, 123       11999999999        Nome é obrigatório

CPF é obrigatório
    [Tags]          required
    [Template]      Validção de Campos
    Bom jovi    ${EMPTY}        Rua dos bugs, 123       11999999999        CPF é obrigatório

Endereço é obrigatório
    [Tags]          required
    [Template]      Validção de Campos
    Bom jovi    33208165862      ${EMPTY}       11999999999        Endereço é obrigatório  

Telefone é obrigatório
    [Tags]          required
    [Template]      Validção de Campos
    Bom jovi    33208165862     Rua dos bugs, 123      ${EMPTY}         Telefone é obrigatório  

Telefone inválido
    [Tags]          required
    [Template]      Validção de Campos
    Bom jovi    33208165862     Rua dos bugs, 123      1199999998         Telefone inválido

***Keywords***
Validção de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}
    Dado que acesso o fomrulário de Cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...        ${nome}     ${cpf}      ${endereco}     ${telefone}
    Então devo ver o texto:     ${saida}