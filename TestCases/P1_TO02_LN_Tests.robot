*** Settings ***
Documentation       Login In Section

Resource            ..//Resources/import.resource
Resource    ../Resources/TestBench_Resources/Sign_Up.resource

Test Setup    Open Web Browser    #browser_type=headlesschrome
Test Teardown       Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Log In
    [Documentation]    Open TestBench web page navigate to Log in And validate if page is open.
    [Tags]    p1to02_tc01    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Navigate To TestBench Logo

P1_TO02_LN_TC02 Valid Credentials Of Registered User
    [Documentation]    In this test case is tested if registered user can fullfill login form
    ...                with his valid credentials and the Login button is enabled
    [Tags]    P1TO02_TC02    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Email And Password    &{USER_01}
    Verify Tick Is Visible    Login
    Check Button State And Sign-Up/Log-In
    Control If Page Contains     Welcome!

P1_TO02_LN_TC09 Valid Credentials Of Not Registered User
    [Documentation]    In this test case is tested if not registered user can fullfill login form
    ...                with his valid credentials and the Login button is enabled
    [Tags]    P1TO02_TC09    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Email And Password    &{USER_02}
    Verify Tick Is Visible    Login
    Check Button State And Sign-Up/Log-In
    Control If Page Contains     Log in failed. Please check your credentials.
