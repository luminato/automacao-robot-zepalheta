***Settings***
Documentation       Representação do menu lateral de navegação na área logada

***Variables***
${NAV_CUSTOMERS_LINK}       css:a[href$=customers]
${NAV_EQUIPOS_LINK}         css:a[href$=equipos]  

***Keywords***
Go To Customers
    Wait Until Element Is Visible       ${NAV_CUSTOMERS_LINK}      5
    Click Element                       ${NAV_CUSTOMERS_LINK}

Go To Contracts
    Wait Until Element Is Visible       ${NAV_CONTRACTS}      5
    Click Element                       ${NAV_CONTRACTS}
