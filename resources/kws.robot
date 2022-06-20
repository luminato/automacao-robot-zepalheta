
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

    Wait Until Element Contains    ${TOASTER_ERROR}    ${expect_message}


##Customers
Dado que acesso o fomrulário de Cadastro de clientes
    Wait Until Element Is Visible       ${NAV_CUSTOMERS_LINK}       5
    Click Element                       ${NAV_CUSTOMERS_LINK}
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}           5
    Click Element                       ${CUSTOMERS_FORM}

Quando faço a inclusão desse cliente:
    [Arguments]    ${name}     ${cpf}      ${address}       ${phone_number}

    #Remove Customer By Cpf      ${cpf} 

    Register New Customer  ${name}      ${cpf}     ${address}       ${phone_number}

Então devo ver a notificação:  
    [Arguments]     ${expect_message}

    Wait Until Element Contains     ${TOASTER_SUCCESS}    ${expect_message}   5