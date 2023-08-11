*** Settings ***
Documentation    Keywords for Sign Up Form
Resource    ../import.resource


*** Variables ***
${BTN_SU}        (//a[contains(@href, "https://www.testbench.com/sign-up/")])[1]
${EMAIL_INPUT}    //input[contains(@type, 'text')]
${TICK_SIGN}      //input[contains(@type, 'text')][@class='success error']
${PSW_INPUT}      //input[contains(@type, 'password')]
${DISABLE_SU_BTN}    //button[contains(@disabled, 'disabled')]


*** Keywords ***
Signup Validation With New Email And Weak Password
    [Documentation]  Verifies the behavior of signup validation with a new email and weak password.
    Input Text    ${EMAIL_INPUT}     test@test.com
    Wait Until Element Is Visible    ${TICK_SIGN}
    Input Text    ${PSW_INPUT}       test1
    Element Should Be Disabled       ${DISABLE_SU_BTN}
