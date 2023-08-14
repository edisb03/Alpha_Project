*** Settings ***
Documentation       Keywords for Log In Form

Resource            ../import.resource


*** Variables ***
#${LOGIN_BUTTON}        //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}       //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${LOGIN_EMAIL}           //input[contains(@type, 'text')]
${TICK_SIGN}              //input[contains(@class, 'success update')]
${LOGIN_PSSW}            //input[contains(@type, 'password')]
${LOGIN_BTN}    //button[contains(@class,'button button--primary')]


*** Keywords ***
Enter Valid Email
    [Documentation]    Keyword is used to simulate the input of a correct email address during
    ...    testing or automation tasks.
    [Arguments]    ${email}
    Set Selenium Speed    0.3
    Input Text    ${LOGIN_EMAIL}     ${email}

Verify Tick Sign Is Visible
    [Documentation]    Keyword ensures that a tick sign icon is displayed on the page, often used
    ...    to confirm successful actions or completion during testing or automation tasks.
    Wait Until Page Contains Element     ${TICK_SIGN}
    Element Should Be Visible            ${TICK_SIGN}

Enter Valid Password
    [Documentation]    Keyword is used to simulate the input of an correct password during
    ...    testing or automation tasks.
    [Arguments]    ${password}
    Set Selenium Speed    0.3
    Input Text    ${LOGIN_PSSW}     ${password}

Login Button State
    [Documentation]    Keyword state of Login Button State checks if
    ...    the Login Button is disabled or enabled to click, and keyword
    ...    have two options depends which state of Login Button is.
    ${is_enabled} =    Run Keyword And Return Status    Element Should Be Enabled    ${LOGIN_BTN}
    IF    ${is_enabled}
        Log    "Sign Up" button is enabled and clickable
        Click Button    ${LOGIN_BTN}
        Element Should Be Visible   ${LOGIN_BTN}
        Log    "Sign Up" button is now disabled
    ELSE
        Log    "Sign Up" button is already disabled
    END
