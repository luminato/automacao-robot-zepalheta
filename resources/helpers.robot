***Settings***

Library         OperatingSystem


**Keywords***
Get json
    [Arguments]         ${file_name}

    ${file}             Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json_dic}=        Evaluate        json.loads($file)       json

    [Return]        ${json_dic}
