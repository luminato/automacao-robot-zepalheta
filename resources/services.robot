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

##Post / sessions
Post Session
    [Arguments]         ${email}            ${password}

    Create Session      zp-api                  ${base_url}

    &{headers}=         Create Dictionary       Content-Type=application/json
    &{payload}=         Create Dictionary       email=${email}          password=${password}

    ${resp}=            Post Request       zp-api      /sessions        data=${payload}         headers=${headers}

    [Return]        ${resp}

