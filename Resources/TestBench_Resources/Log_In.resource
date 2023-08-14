*** Settings ***
Documentation       Keywords for Log In Form

Resource            ../import.resource


*** Variables ***
${LOGIN_BUTTON}         //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}     //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${SU_PASSWORD}          //input[@name='password']
${SU_EMAIL}             //input[@type='text']
${SIGN_UP_BUTTON}       //button[@class='button button--primary']
&{VALID_USER}           email=agnesaa_m@hotmail.com     password=Seharoj@800


*** Keywords ***
Enter Valid Password
    [Documentation]        Keyword is used to simulate the input of a correct password during
    ...    testing or automation tasks.
    [Arguments]    ${password}
    Set Selenium Speed    0.3
    Input Text    ${SU_PASSWORD}    ${password}

Click Login Button
    [Documentation]    Keyword is used to check if Login button is enabled after entered valid credentials
    

Enter Valid Credentials
    [Documentation]
    [Arguments]    ${email}=${VALID_USER}[email]    ${password}=${VALID_USER}[password]
    ${Header}=        Get Text    ${LOGIN_PAGE_TITLE}
    Log    ${Header}
    IF    '${Header}' == 'Enter your details below'
        Sleep    3s
        Wait Until Page Contains Element    ${SU_EMAIL}
        Input Text    ${SU_EMAIL}    ${email}
        Input Password    ${SU_PASSWORD}    ${password}
        Click Button    ${SIGN_UP_BUTTON}
        Wait Until Keyword Succeeds    3X    3s    Wait Until Page Contains    Welcome!
    ELSE
        No Operation
        Log    "Login to test bench page failed due to Welcome! text not visible"
    END