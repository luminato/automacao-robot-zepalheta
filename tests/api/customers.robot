***Settings***
Resource        ../../resources/services.robot

Library         OperatingSystem

***Test Cases***
New Customer

    ${payload}=     Get json        customers/sucess.json

    Delete Customer         ${payload['cpf']}
    ${resp}=        Post customer         ${payload}

    Status Should Be        200     ${resp}


Name is required

    ${payload}=     Get json        customers/no_name.json
    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "name" is required


Cpf is required

    ${payload}=     Get json        customers/no_cpf.json
    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "cpf" is required


Address is required

    ${payload}=     Get json        customers/no_address.json
    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "address" is required


Phone is required

    ${payload}=     Get json        customers/no_phone.json  
    ${resp}=        Post customer         ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "phone_number" is required
