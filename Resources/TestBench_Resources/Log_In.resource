*** Settings ***
Documentation       Keywords for Log In Form

Resource            ../import.resource

Library    String


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
# &{USER_05} Registered user with correct email and wrong valid pass
&{USER_05}              email=agnesaa_m@hotmail.com    password=seharoj@400
# ${User_06}  Not registered user with valid email and valid pass


*** Keywords ***
Generate Random Number 
    [Documentation]    This keyword is used for generating a random number
    ${random_number}    Generate Random String    4    [NUMBERS]
    [RETURN]    ${random_number}

Generate Random Email
    [Documentation]    This keyword generates a random email using a random number
    ${random_number}    Generate Random Number
    ${random_email}    Set Variable    blertaa.n${random_number}@gmail.com
    [RETURN]    ${random_email}
