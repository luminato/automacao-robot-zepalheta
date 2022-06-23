
*** Keywords ***

##Login
Acesso a página Login
   Go to    ${base_url}

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Login with  ${email}   ${password}


Devo ver a area logada
    Wait Until Page Contains     Aluguéis   5


Devo ver um toaster com a mensagem 
    [Arguments]     ${expect_message}

    Wait Until Element Contains    ${TOASTER_ERROR_P}    ${expect_message}


##Customers
Dado que acesso o fomrulário de Cadastro de clientes
    Wait Until Element Is Visible       ${NAV_CUSTOMERS_LINK}       5
    Click Element                       ${NAV_CUSTOMERS_LINK}
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}           5
    Click Element                       ${CUSTOMERS_FORM}

E que eu tenho o seguinte cliente:
    [Arguments]    ${name}     ${cpf}      ${address}       ${phone_number}

    Remove Customer By Cpf      ${cpf} 

    Set Test Variable   ${name}
    Set Test Variable   ${cpf}
    Set Test Variable   ${address}
    Set Test Variable   ${phone_number}


Mas esse cpf já existe no sistema
    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}


Quando faço a inclusão desse cliente
    Register New Customer  ${name}      ${cpf}     ${address}       ${phone_number}


Então devo ver a notificação:  
    [Arguments]     ${expect_message}

    Wait Until Element Contains     ${TOASTER_SUCCESS}    ${expect_message}   5
    Wait Until Element Is Visible   ${CLOSE_TOASTER_SUCCESS}      5
    Click Element                   ${CLOSE_TOASTER_SUCCESS}

Então devo ver a notificação de erro:
    [Arguments]     ${expect_message}

    Wait Until Element Contains     ${TOASTER_ERROR}            ${expect_message}   5
    Wait Until Element Is Visible   ${CLOSE_TOASTER_ERROR}      5
    Click Element                   ${CLOSE_TOASTER_ERROR}


Então devo ver mensagens informando que os campos do cadastro de cliente são obrigatórios
    Wait Until Element Contains    ${LABEL_NAME}        Nome é obrigatório          5
    Wait Until Element Contains    ${LABEL_CPF}         CPF é obrigatório           5
    Wait Until Element Contains    ${LABEL_ADDRESS}     Endereço é obrigatório      5
    Wait Until Element Contains    ${LABEL_PHONE}       Telefone é obrigatório      5

Então devo ver o texto:
    [Arguments]     ${expect_message}

    Wait Until Page Contains      ${expect_message}     5  


##Equipos
Dado que acesso o fomrulário para cadastro de um equipo
    Wait Until Element Is Visible       ${NAV_EQUIPOS_LINK}       5
    Click Element                       ${NAV_EQUIPOS_LINK}
    Wait Until Element Is Visible       ${EQUIPO_FORM}           5
    Click Element                       ${EQUIPO_FORM} 


E que eu tenho o seguinte equipamento:
    [Arguments]     ${nome_equipo}     ${valor}

    Remove Equipo       ${nome_equipo} 

    Set Test Variable   ${nome_equipo} 
    Set Test Variable   ${valor}


Quando faço a inclusão desse equipamento
    Register News Equipo    ${nome_equipo}    ${valor}


Mas esse equipamento já existe
    Insert New Equipo       ${nome_equipo}    ${valor}


