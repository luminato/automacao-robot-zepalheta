***Settings***
Documentation       Representação a página equipo com seus elementos

***Variables***
${EQUIPO_FORM}       css:a[href*='equipos/register']


***Keywords***
Register News Equipo
    [Arguments]     ${nome_equipo}     ${valor}

    Input Text      id:equipo-name      ${nome_equipo}
    Input Text      id:daily_price      ${valor}

    Click Element   xpath://button[text()='CADASTRAR']