***Settings***
Documentation       Representação da página login com suas ações e elementos


***Keywords***
Login with
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    Click Element   xpath://button[text()='Entrar']
