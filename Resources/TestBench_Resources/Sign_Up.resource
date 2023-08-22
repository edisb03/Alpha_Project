*** Settings ***
Documentation       Keywords for Sign Up Form

Resource            ../import.resource


*** Variables ***
### SU - SIGN UP
${SU_EMAIL}                     //input[@type='text']
${SU_PASSWORD}                  //input[@name='password']
${SIGN_IN_TICK}                 //input[contains(@class, 'success')]//..//label[contains(text(), 'Email')]
${PASSWORD_TICK_VERIFY}         //input[contains(@class, 'success')]//..//..//label[contains(text(),'Password')]
${INVALID_PASSWORD}             //div[@class='pw-check']
${SIGN_UP_OR_LOGIN_BUTTON}      //button[@class='button button--primary']
${DISABLED_BUTTON}              //button[contains(text(),'Sign Up')]
${LOG_IN_TICK}                  //input[@class='success update']


*** Keywords ***
Enter Email And Password
    [Documentation]    Keyword is used to input email and password
    [Arguments]    ${email}=${USER_01}[email]    ${password}=${USER_01}[password]
    Set Selenium Speed    0.3
    Input Text    ${SU_EMAIL}    ${email}
    Input Text    ${SU_PASSWORD}    ${password}

Verify If Tick Is Visible
    [Documentation]    Keyword ensures that a tick sign icon is displayed on the page, often used
    ...    to confirm successful actions or completion during testing or automation tasks.
    [Arguments]    ${login_OR_sign_up}
    Wait Until Element Is Visible    ${NAV_LOGO}
    IF    '${login_OR_sign_up}' == 'SignUp_Valid_Email'
        Wait Until Page Contains Element    ${SIGN_IN_TICK}
        Element Should Be Visible    ${SIGN_IN_TICK}
    ELSE IF    '${login_OR_sign_up}' == 'SignUp_Invalid_Email'
        Wait Until Page Contains Element    ${SU_EMAIL}
        Element Should Be Visible    ${SU_EMAIL}
    ELSE IF    '${login_OR_sign_up}' == 'SignUp_Invalid_Password'
        Wait Until Page Contains Element    ${INVALID_PASSWORD}
        Element Should Be Visible    ${INVALID_PASSWORD}
    ELSE IF    '${login_OR_sign_up}' == 'SignUp_Valid_Password'
        Wait Until Page Contains Element    ${PASSWORD_TICK_VERIFY}
        Element Should Be Visible    ${PASSWORD_TICK_VERIFY}
    ELSE IF    '${login_OR_sign_up}' == 'Login_Email'
        Wait Until Page Contains Element    ${LOG_IN_TICK}
        Element Should Be Visible    ${LOG_IN_TICK}
    END

Check Button State And Sign-Up/Log-In
    [Documentation]    Keyword to check the state of a button and perform actions accordingly.
    ...    The keyword checks if the button is disabled or enabled to click, and takes actions
    ...    based on the button state.
    [Arguments]    ${state}
    ${status} =    Run Keyword And Return Status    Element Should Be Enabled    ${SIGN_UP_OR_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${NAV_LOGO}
    IF    '${state}' == 'Sign_up_Enabled'
        Wait Until Page Contains Element    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Click Button    ${SIGN_UP_OR_LOGIN_BUTTON}
        Log    Sign Up button is enabled and clickable
    ELSE IF    '${state}' == 'Log_in_Enabled'
        Wait Until Page Contains Element    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Click Button    ${SIGN_UP_OR_LOGIN_BUTTON}
        Log    Login button is enabled and clickable
    ELSE IF    '${state}' == 'Sign_up_Disabled'
        IF    ${status} == False
            Log    Sign Up button is disabled and not clickable
        ELSE IF    '${state}' == 'Log_in_Disabled'
            IF    ${status} == False
                Log    Log In button is disabled and not clickable
            ELSE
                Log    Button is clickable and enable
            END
        END
    END
