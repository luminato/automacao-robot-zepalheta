***Variables***
${browser}=     chrome


***Keywords***
Start Session
    Run Keyword If      "${browser}" == "headless"
    ...     Open Chrome Headless

    Run Keyword If      "${browser}" == "chrome"
    ...     Open Chrome

    Set Window Size     1440    900


Finish TestCase
    Capture Page Screenshot

Finish Session
    Close Browser

Login Session
    Start Session
    Go to    ${base_url}
    Login with  ${admin_user}  ${admin_pass}

### Webdriver
Open Chrome Headless
    Open Browser    about:blank        headlesschrome       options=add_argument('--disable-dev-shm-usage')

Open Chrome
    Open Browser      about:blank        chrome          options=add_experimental_option('excludeSwitches', ['enable-logging'])
