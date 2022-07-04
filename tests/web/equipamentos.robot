***Settings***
Documentation       Cadastro de equipamentos

Resource    ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session
Test Teardown        Finish TestCase

***Test Cases***
Novo Equipamento
    Dado que acesso o fomrulário para cadastro de um equipo
    E que eu tenho o seguinte equipamento:
    ...     Guitarra        60
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação:    Equipo cadastrado com sucesso!

Nome Obrigatório
    [Template]    Cadastro de equipo  
    ${EMPTY}        60      Nome do equipo é obrigatório

Valor Obrigatório
    [Template]    Cadastro de equipo  
    Bateria        ${EMPTY}      Diária do equipo é obrigatória


Equipamento Duplicado
    Dado que acesso o fomrulário para cadastro de um equipo   
    E que eu tenho o seguinte equipamento:
    ...     Pandeiro        35
    Mas esse equipamento já existe
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação de erro:  Erro na criação de um equipo


***Keywords***
Cadastro de equipo
    [Arguments]     ${nome}     ${valor}    ${mensagem}
    Dado que acesso o fomrulário para cadastro de um equipo
    E que eu tenho o seguinte equipamento:
    ...     ${nome}        ${valor}
    Quando faço a inclusão desse equipamento
    Então devo ver o texto:   ${mensagem}
