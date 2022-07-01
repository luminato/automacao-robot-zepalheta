***Settings***
Resource        ../../resources/services.robot


***Test Cases***
New Customer

    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      address=rua 88      phone_number=81999999999
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    Delete Request      zp-api      /customers/${payload['cpf']}         headers=${headers}

    ${resp}=      Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    Status Should Be        200     ${resp}


Name is required
    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token

    &{payload}=     Create Dictionary       cpf=789.777.777-77      address=rua 88      phone_number=81999999999
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    ${resp}=      Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "name" is required


Cpf is required
    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token

    &{payload}=     Create Dictionary       name=joão       address=rua 88      phone_number=81999999999
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    ${resp}=      Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "cpf" is required


Address is required
    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      phone_number=81999999999
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    ${resp}=      Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "address" is required


Phone is required
    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token

    &{payload}=     Create Dictionary       name=joão       cpf=789.777.777-77      address=rua 88      
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    ${resp}=      Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "phone_number" is required
