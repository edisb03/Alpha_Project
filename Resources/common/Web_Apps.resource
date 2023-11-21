*** Settings ***
Documentation    Web Apps
Library    SeleniumLibrary           implicit_wait=10 seconds    run_on_failure=NOTHING
Library    Collections


*** Variables ***
${BROWSER}
...    chrome

${HEADLESS CHROME OPTIONS}
...    SEPARATOR=${SPACE}
...    add_argument("--no-sandbox");
...    add_argument("--disable-dev-shm-usage");
...    add_argument("--window-size=1920,1080")
# ...    add_argument("--ignore-certificate-errors");
# ...    add_argument("--ignore-ssl-errors")


*** Keywords ***
Start Browser
    [Documentation]    Opens a new browser using the global variable `BROWSER`, sets necessary *browser args*
    ...    and navigates to the given `URL`. Finally the browser *windows is maximized*.
    [Arguments]    ${URL}=${EMPTY}    ${browser}=${BROWSER}
    &{browser args}=    Create Dictionary
    IF    "${BROWSER}" == "headlesschrome"
        Set To Dictionary    ${browser args}    options=${HEADLESS CHROME OPTIONS}
    END
     SeleniumLibrary.Open Browser    ${URL}    ${BROWSER}    &{browser args}
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
