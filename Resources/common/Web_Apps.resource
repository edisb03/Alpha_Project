*** Settings ***
Library    SeleniumLibrary           implicit_wait=10 seconds    run_on_failure=NOTHING
Library    Collections


*** Variables ***
${URL}    https://www.testbench.com/
${BROWSER}    chrome

${HEADLESS CHROME OPTIONS}
...    SEPARATOR=${SPACE}
...    add_argument("--no-sandbox");
...    add_argument("--disable-dev-shm-usage");
...    add_argument("--window-size=1920,1080");
...    add_argument("--ignore-certificate-errors");
...    add_argument("--ignore-ssl-errors")


*** Keywords ***
Open Web Browser
    [Documentation]    Opens a new browser instance and maximizes the window
    [Arguments]    ${URL}=${URL}    ${browser_type}=${BROWSER}
    &{browser args}=    Create Dictionary
    IF    "${browser_type}" == "headlesschrome"
        Set To Dictionary    ${browser args}    options=${HEADLESS CHROME OPTIONS}
    END
    SeleniumLibrary.Open Browser    ${URL}    ${browser type}    &{browser args}
    Maximize Browser Window

Tolerant Click
    [Documentation]    This tolerant click performs selenium actions
    ...    and catches exceptions like: StaleElementReferenceException etc...
    [Arguments]    ${locator}    @{Exceptions_error}
    TRY
        Click Element    ${locator}
    EXCEPT    StaleElementReferenceException
        Log    Expected error '${Exceptions_error}' while clicking the '${locator}' element - ignoring it
        Click Element    ${locator}
    END
    