*** Settings ***
Documentation    Sign Up Section
Resource        ../Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO03_SU_TC01 Navigate To Sign Up
    [Documentation]    Open TestBench web page navigate to Sign Up And validate if page is open.
    [Tags]   P1TO03_TC01   exploratory
    Accept Cookies  Accept all
    Navigate To Sign Up
    Navigate To TestBench Logo

P1_TO03_TC04 Invalid Password Blocks Sign Up with Valid Email
    [Documentation]     Test the Sign Up process with a valid email and
    ...    an invalid password to ensure appropriate error handling.
    [Tags]    P1TO03_TC04    exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Signup Validation With New Email And Weak Password
