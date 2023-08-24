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


*** Keywords ***
Generate Random Email And Password
    [Documentation]    Generates a random email and password
    [Arguments]  ${name}   ${email_length}=4    ${password_length}=5
    Set Selenium Speed    0.3
    ### My static name
    ${random_name}=    Set Variable    ${name}
    ${domain}=    Set Variable    gmail.com
    ### Generate random email
    ${random_email_string}=    Generate Random String    1    [NUMBERS]
    ${email}=    Catenate      ${random_name}${random_email_string}@${domain}
    ### Generate random password
    ${uppercase_letter}=    Generate Random String    1    [UPPERCASE]
    ${lowercase_letter}=    Generate Random String    1    [LOWERCASE]@e
    ${digit}=               Generate Random String    1    [PUNCTUATION]
    ${special_char}=        Generate Random String    1    [NUMBERS]
    ${password}=    Catenate    ${uppercase_letter}@${lowercase_letter}${digit}${special_char}@_/;e
    Input Text    ${SU_EMAIL}       ${email}
    Input Text    ${SU_PASSWORD}    ${password}
    RETURN    ${email}    ${password}
