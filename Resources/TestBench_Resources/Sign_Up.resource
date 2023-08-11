*** Settings ***
Documentation       Keywords for Sign Up Form

Resource            ../import.resource


*** Variables ***
### SU - SIGN UP
${SU_EMAIL}             //input[@type='text']    
${SU_PASSWORD}          //input[@name='password']
${TICK_SIGN}            //input[@class='success']
${SIGN_UP_BUTTON}       //button[@class='button button--primary']


*** Keywords ***
Enter Valid Email
    [Documentation]    Keyword is used to simulate the input of a correct email address during
    ...    testing or automation tasks.
    [Arguments]    ${email}
    Set Selenium Speed    0.3
    Input Text    ${SU_EMAIL}    ${email}

Verify Tick Sign Is Visible
    [Documentation]    Keyword ensures that a tick sign icon is displayed on the page, often used
    ...    to confirm successful actions or completion during testing or automation tasks.
    Wait Until Page Contains Element     ${TICK_SIGN}
    Element Should Be Visible            ${TICK_SIGN}

Enter Invalid Password
    [Documentation]    Keyword is used to simulate the input of an incorrect password during
    ...    testing or automation tasks.
    [Arguments]    ${password}
    Set Selenium Speed    0.3
    Input Text    ${SU_PASSWORD}    ${password}

Sign Up Button State
    [Documentation]    Keyword state of Sign Button State checks if
    ...    the Sign Button is disabled or enabled to click, and keyword
    ...    have two options depends which state of Sign Button is.
    ${is_enabled} =    Run Keyword And Return Status    Element Should Be Enabled    ${SIGN_UP_BUTTON}
    IF    ${is_enabled}
        Log    "Sign Up" button is enabled and clickable
        Click Button    ${SIGN_UP_BUTTON}
        Element Should Be Visible   ${SIGN_UP_BUTTON}
        Log    "Sign Up" button is now disabled
    ELSE
        Log    "Sign Up" button is already disabled
    END
