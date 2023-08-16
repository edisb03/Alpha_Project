*** Settings ***
Documentation       Keywords for Log In Form

Resource            ../import.resource


*** Variables ***
${LOGIN_BUTTON}         //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}     //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${SU_PASSWORD}          //input[@name='password']
${SU_EMAIL}             //input[@type='text']
${SIGN_UP_BUTTON}       //button[@class='button button--primary']

### Users ###
&{USER_01}              email=agnesaa_m@hotmail.com    password=Seharoj@400
&{USER_02}              email=arberdresha@gmail.com    password=Valid123
&{USER_03}              email=arberdresha@gmail.com    password=12345678
