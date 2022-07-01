***Settings***
Resource    ../../resources/services.robot



***Test Cases***
Login com sucesso
    ${resp}=        Post Session        admin@zepalheta.com.br          pwd123
    
    Status Should Be         200    ${resp}


Senha incorreta
    ${resp}=        Post Session       admin@zepalheta.com.br          error404

    Status Should Be         401    ${resp}


Usuario não existe
    ${resp}=       Post Session        404@gmail.com.br          pws123
    
    Status Should Be         401    ${resp}




