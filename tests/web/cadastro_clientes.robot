***Settings***
Documentation   Cadastro de clientes

Resource    ../../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session



***Test Cases***
Novo cliente
    [Tags]      smoke
    Dado que acesso o fomrulário de Cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        Bom jovi     00000001406     Rua dos bugs, 123       11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:   Cliente cadastrado com sucesso!
    E esse cliente deve aparecer na lista!

Cliente duplicado
    [Tags]      smoke
    Dado que acesso o fomrulário de Cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        Bom jovi     00000001406     Rua dos bugs, 123       11999999999
    Mas esse cpf já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:   Este CPF já existe no sistema!

Campos obrigatorios
    [tags]      temp
    Dado que acesso o fomrulário de Cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        ${EMPTY}     ${EMPTY}     ${EMPTY}       ${EMPTY}
    Quando faço a inclusão desse cliente
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
    E que eu tenho o seguinte cliente:
    ...        ${nome}     ${cpf}      ${endereco}     ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto:     ${saida}