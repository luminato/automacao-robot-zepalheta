***Settings***
Documentation       Camada de serviços do projeto de automação da api

Library     RequestsLibrary
Library     OperatingSystem

***Variables***
${base_url}         http://zepalheta-api:3333



***Keywords***
##helpers
Get Session Token
    ${resp}=        Post Session        admin@zepalheta.com.br        pwd123

    ${token}        Convert To String       Bearer ${resp.json()['token']}

    [Return]        ${token}

##Post /sessions
Post Session
    [Arguments]         ${email}            ${password}

    Create Session      zp-api                  ${base_url}

    &{headers}=         Create Dictionary       Content-Type=application/json
    &{payload}=         Create Dictionary       email=${email}          password=${password}

    ${resp}=            Post Request       zp-api      /sessions        data=${payload}         headers=${headers}

    [Return]        ${resp}

##POST /customers
Post customer
    [Arguments]         ${payload}

    Create Session      zp-api      ${base_url}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    ${resp}=        Post Request       zp-api      /customers        data=${payload}         headers=${headers}

    [Return]        ${resp}


##DELETE /customers
Delete Customer
    [Arguments]         ${cpf}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       Content-Type=application/json           Authorization=${token}

    DELETE On Session     zp-api      /customers/${cpf}      headers=${headers}