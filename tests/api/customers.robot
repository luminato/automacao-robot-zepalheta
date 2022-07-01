***Settings***
Resource        ../../resources/services.robot


***Test Cases***
New Customer

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      address=rua 88      phone_number=81999999999

    Delete Customer         ${payload['cpf']}
    ${resp}=        Post customer         ${payload}

    Status Should Be        200     ${resp}


Name is required

    &{payload}=     Create Dictionary       cpf=789.777.777-77      address=rua 88      phone_number=81999999999

    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "name" is required


Cpf is required

    &{payload}=     Create Dictionary       name=joão       address=rua 88      phone_number=81999999999

    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "cpf" is required


Address is required

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      phone_number=81999999999

    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "address" is required


Phone is required

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      address=rua 88      

    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "phone_number" is required
