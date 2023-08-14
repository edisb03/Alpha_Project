*** Settings ***
Documentation    Keywords for Sign Up Form
Resource    ../import.resource


*** Variables ***
### SU - SIGN UP
${SU_EMAIL}             //input[@type='text']
${SU_PASSWORD}          //input[@name='password']
${SIGN_IN_TICK}         //input[@class='success']
${SIGN_UP_BUTTON}       //button[@class='button button--primary']
${LOG_IN_TICK}          //input[@class='success update']


*** Keywords ***
Enter Email And Password
    [Documentation]    Keyword is used to input email and password
    [Arguments]    ${email}=${USER_01}[email]    ${password}=${USER_01}[password]
    Set Selenium Speed    0.3
    Input Text    ${SU_EMAIL}    ${email}
    Input Text    ${SU_PASSWORD}    ${password}

Verify Tick Is Visible
    [Documentation]    Keyword ensures that a tick sign icon is displayed on the page, often used
    ...    to confirm successful actions or completion during testing or automation tasks.
    [Arguments]    ${login_OR_sign_up}
    Wait Until Element Is Visible    ${NAV_LOGO}
    IF    '${login_OR_sign_up}' == 'Sign Up'
        Wait Until Page Contains Element    ${SIGN_IN_TICK}
        Element Should Be Visible    ${SIGN_IN_TICK}
    ELSE IF    '${login_OR_sign_up}' == 'Login'
        Wait Until Page Contains Element    ${LOG_IN_TICK}
        Element Should Be Visible    ${LOG_IN_TICK}
    END

Enter Invalid Password
    [Documentation]    Keyword is used to simulate the input of an incorrect password during
    ...    testing or automation tasks.
    [Arguments]    ${password}
    Set Selenium Speed    0.3
    Input Text    ${SU_PASSWORD}    ${password}

Check Button State And Sign-Up/Log-In
    [Documentation]    Keyword state of Sign Button State checks if
    ...    the Sign Button is disabled or enabled to click, and keyword
    ...    have two options depends which state of Sign Button is.
    ${is_enabled} =    Run Keyword And Return Status    Element Should Be Enabled      ${SIGN_UP_BUTTON}
    ${is_disabled} =    Run Keyword And Return Status    Element Should Be Disabled    ${SIGN_UP_BUTTON}
    IF    ${is_enabled}
        Element Should Be Visible    ${SIGN_UP_BUTTON}
        Click Button    ${SIGN_UP_BUTTON}
        Log    "Sign Up" button is enabled and clickable
    ELSE IF    ${is_disabled}
        Log    "Sign Up" button is already disabled
    END