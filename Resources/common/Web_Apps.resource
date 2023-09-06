*** Settings ***
Documentation    Web Apps
Library    SeleniumLibrary           implicit_wait=10 seconds    run_on_failure=NOTHING
Library    Collections


*** Variables ***
# ${URL}    https://www.testbench.com/
# ${BROWSER}    chrome

# ${HEADLESS CHROME OPTIONS}
# ...    SEPARATOR=${SPACE}
# ...    add_argument("--no-sandbox");
# ...    add_argument("--disable-dev-shm-usage");
# ...    add_argument("--window-size=1920,1080");
# ...    add_argument("--ignore-certificate-errors");
# ...    add_argument("--ignore-ssl-errors")

# *** Keywords ***
# Open Web Browser
#     [Documentation]    Opens a new browser instance and maximizes the window
#     [Arguments]    ${URL}=${URL}    ${browser_type}=${BROWSER}
#     &{browser args}=    Create Dictionary
#     IF    "${browser_type}" == "headlesschrome"
#         Set To Dictionary    ${browser args}    options=${HEADLESS CHROME OPTIONS}
#     END
#     SeleniumLibrary.Open Browser    ${URL}    ${browser type}    &{browser args}
#     Maximize Browser Window

${BROWSER}
...    chrome
# ${BROWSER}    ff
# ${BROWSER}    headlesschrome
# ${BROWSER}    edge

# Heal "page crashing" issues
# https://stackoverflow.com/questions/53902507/unknown-error-session-deleted-because-of-page-crash-from-unknown-error-cannot
# Otherwise some elements might be unavailable because of responsive design
${HEADLESS CHROME OPTIONS}
...    SEPARATOR=${SPACE}
...    add_argument("--no-sandbox");
...    add_argument("--disable-dev-shm-usage");
...    add_argument("--window-size=1920,1080")


*** Keywords ***
Start Browser
    [Documentation]    Opens a new browser using the global variable `BROWSER`, sets necessary *browser args*
    ...    and navigates to the given `URL`. Finally the browser *windows is maximized*.
    [Arguments]    ${URL}=${empty}    ${browser}=${BROWSER}
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
