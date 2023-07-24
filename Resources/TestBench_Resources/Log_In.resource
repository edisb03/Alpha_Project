*** Settings ***
Documentation    Keywords for Log In Form
Resource    ../import.resource


*** Variables ***
${LOGIN_BUTTON}            //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}        //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']


*** Keywords ***
# Navigate To Login
#   [Documentation]  Navigates to Login Button
#   Set Selenium Speed    0.5
#   Wait Until Page Contains Element    ${LOGIN_BUTTON}
#   Tolerant Click    ${LOGIN_BUTTON}

Check That Login Page Is Open
  [Documentation]  Verifies if the Login is open
  Set Selenium Speed    0.8
  # Wait Until Page Contains    ${LOGIN_PAGE_TITLE}
  # Page Should Contain      Enter your details below
  Wait Until Element Is Visible    ${LOGIN_PAGE_TITLE}
