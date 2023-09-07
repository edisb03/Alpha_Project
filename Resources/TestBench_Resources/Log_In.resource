*** Settings ***
Documentation       Keywords for Log In Form

Resource            ../import.resource
Library             String
Library             Collections
Library             BuiltIn
Library             random


*** Variables ***
${LOGIN_BUTTON}         //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}     //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${SU_PASSWORD}          //input[@name='password']
${SU_EMAIL}             //input[@type='text']
${SIGN_UP_BUTTON}       //button[@class='button button--primary']
### Login labels and buttons in English language  ###
${EMAIL_LABEL_ENG}      //div[@id="logIn"]//label[contains(text(), 'Email')]
${PASSWORD_LABEL_ENG}   //div[@id="logIn"]//label[contains(text(), 'Password')]
${LN_SIGN_UP_BUTTON}    //div[@class='cta space-between']//a[contains(@href, '/sign-up/')]
${FORGOT_PASSWORD}      //a[contains(@href, '/log-in/#/password-forgot')]
### Login labels and buttons in German language  ###
${EMAIL_LABEL_GER}      //div[@id="logIn"]//label[contains(text(), 'E-Mail')]
${PASSWORD_LABEL_GER}   //div[@id="logIn"]//label[contains(text(), 'Passwort')]
${LN_ANMELDEN_BUTTON}   //div[@class='cta space-between']//a[contains(@href, '/de/sign-up/')]
${FORGOT_PASS_MESSAGE}  (//h3[@class='h2'])[1]

### Users ###
# &{USER_01} Registered user with valid credentials
&{USER_01}              email=agnesaa_m@hotmail.com    password=Seharoj@400
# &{USER_02} Not registered user with valid email and invalid pass
&{USER_02}              email=arberdresha@gmail.com    password=Valid123
# &{USER_03} Registered user with wrong email and valid pass
&{USER_03}              email=agnesa_m@hotmail.com    password=Seharoj@400
# &{USER_04} Not registered user with invalid email and valid pass
&{USER_04}              email=agnesa_m    password=Seharoj@4004444
# &{USER_05} Registered user with correct email and wrong pass
&{USER_05}              email=agnesaa_m@hotmail.com    password=seharoj@400
# ${USER_06},${USER_07},${USER_08} for dynamic domain names
${USER_06}              hotmail.com
${USER_07}              gmail.com
${USER_08}              imbus-peja.de

${USER_1}               agnesaa_m@hotmail.com   ### Registered user in the test bench app
${USER_2}               agnesa@hotmail.com      ### Not Registered user in the test bench app
${USER_3}               agnesa                  ### Invalid Email


*** Keywords ***
Enter Dynamic Email And Password
    [Documentation]    Generates a random email and password for test purposes..
    [Arguments]  ${name}    ${user}   ${email_length}=10    ${password_length}=12
    Set Selenium Speed    0.3
    ${random_name}=    Set Variable    ${name}
    ### Generate random email
    ${random_email_string}=    Generate Random String    3    [NUMBERS]
    ${email}=    Catenate      ${random_name}${random_email_string}@${user}
    Set Suite Variable    ${USER_06}
    Set Suite Variable    ${USER_07}
    Set Suite Variable    ${USER_08}
    ### Generate random password
    ${uppercase_letter}=    Generate Random String    1    [UPPERCASE]
    ${lowercase_letter}=    Generate Random String    1    [LOWERCASE]
    ${digit}=               Generate Random String    1    [PUNCTUATION]
    ${special_char}=        Generate Random String    1    [NUMBERS]
    ${low_case}=  Set Variable    imbus
    ${dynamic_password}=    Catenate     ${low_case}${uppercase_letter}${lowercase_letter}${digit}${special_char}@_
    Input Text    ${SU_EMAIL}       ${email}
    Input Text    ${SU_PASSWORD}    ${dynamic_password}

Check That Login Form Is German Page
    [Documentation]    This keyword checks the Log in form language
    [Arguments]    ${language}
    Set Selenium Speed    0.3
    IF    "${language}" == "English"
        Page Should Contain Element    ${EMAIL_LABEL_ENG}
        Page Should Contain Element    ${PASSWORD_LABEL_ENG}
        Wait Until Page Contains Element    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${LN_SIGN_UP_BUTTON}
    ELSE IF    "${language}" == "Deutsch"
        Page Should Contain Element    ${EMAIL_LABEL_GER}
        Page Should Contain Element    ${PASSWORD_LABEL_GER}
        Wait Until Page Contains Element    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${LN_ANMELDEN_BUTTON}
    END

Verify And Click Forgot Your Password
    [Documentation]    This keyword verify if "Forgot your password" is shown in the Login form and can be clicked.
    Wait Until Element Is Visible    ${FORGOT_PASSWORD}
    Tolerant Click    ${FORGOT_PASSWORD}
    Wait Until Page Contains Element   ${FORGOT_PASS_MESSAGE}

Check Reset Password Availability
    [Documentation]    Keyword is used to check the state of a Reset Password button and perform actions accordingly.
    ...    The keyword checks if the button is disabled or enabled to click, and takes actions
    ...    based on the button state.
    [Arguments]    ${button_available}
    ${status}=    Run Keyword And Return Status    Element Should Be Enabled    ${SIGN_UP_OR_LOGIN_BUTTON}
    IF    '${button_available}' == 'Reset_Password_Enabled'
        Wait Until Page Contains Element    ${SIGN_UP_OR_LOGIN_BUTTON}
        Element Should Be Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Click Button    ${SIGN_UP_OR_LOGIN_BUTTON}
        Log    Reset password button is enabled and clickable
    ELSE IF    '${button_available}' == 'Reset_Password_Disabled'
        IF    ${status} == False
            Log    Reset password button is disabled and not clickable
        END
    END

Enter The Email
    [Documentation]    Keyword is used to enter email in the Reset Password email box.
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${SU_EMAIL}
    Input Text    ${SU_EMAIL}   ${email}

Enter The Email-RP
    [Documentation]    Keyword is used to enter registered, not registered or invalid email
    ...    in the Reset Password email box.
    [Arguments]    ${email}
    IF    '${email}' == '${USER_1}'
        Wait Until Element Is Visible    ${SU_EMAIL}
        Input Text    ${SU_EMAIL}   ${email}
        Wait Until Element Is Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Tolerant Click    ${SIGN_UP_OR_LOGIN_BUTTON}
    ELSE IF    '${email}' == '${USER_2}'
        Wait Until Element Is Visible    ${SU_EMAIL}
        Input Text    ${SU_EMAIL}   ${email}
        Wait Until Element Is Visible    ${SIGN_UP_OR_LOGIN_BUTTON}
        Tolerant Click    ${SIGN_UP_OR_LOGIN_BUTTON}
        Page Should Contain    Sorry, your email address is not registered.
    ELSE IF    '${email}' == '${USER_3}'
        Wait Until Element Is Visible    ${SU_EMAIL}
        Input Text    ${SU_EMAIL}   ${email}
        Element Should Be Disabled    ${SIGN_UP_OR_LOGIN_BUTTON}
    END
