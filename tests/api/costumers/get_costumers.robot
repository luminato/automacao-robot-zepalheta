***Settings***

Resource        ../../../resources/services.robot

***Test Cases***
Get Customer List

    ${list}=        Get Json  customers/list.json

    FOR     ${item}     IN      @{list['data']}
        # O ${item} é o Payload
        Post Customer   ${item}
    END

    ${resp}                 Get Customers
    Status Should Be        200              ${resp}
    ${total}=               Get Length      ${resp.json()}
    Should Be True          ${total} > 0

