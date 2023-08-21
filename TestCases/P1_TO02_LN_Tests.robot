*** Settings ***
Documentation       Login In Section

Resource            ..//Resources/import.resource

Test Setup    Open Web Browser    browser_type=headlesschrome
Test Teardown       Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Log In
    [Documentation]    Open TestBench web page navigate to Log in And validate if page is open....
    [Tags]    P1TO02_TC01    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Navigate To TestBench Logo

P1_TO02_LN_TC02 Valid Credentials Of Registered User
    [Documentation]    In this test case is tested if a registered user can fulfill the login form
    ...                with their valid credentials and the Login button is enabled
    [Tags]    P1TO02_TC02    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Email And Password    &{USER_01}
    Verify Tick Is Visible    Login
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Page Contains     Welcome!

P1_TO02_LN_TC09 Valid Credentials Of Not Registered User
    [Documentation]    In this test case is tested if not registered user can fullfill login form
    ...                with his valid credentials and the Login button is enabled...
    [Tags]    P1TO02_TC09    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Email And Password    &{USER_02}
    Verify Tick Is Visible    Login
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Page Contains     Log in failed. Please check your credentials.

P1TO02_TC03 Invalid Email Failed Login
    [Documentation]    In this test case is tested if a registered user can fulfill the login form
    ...    with wrong email and valid password and then check the Login button state and error message as well.
    [Tags]    P1TO02_TC03    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Email And Password    &{USER_03}
    Verify Tick Is Visible    Login
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Page Contains     Log in failed. Please check your credentials.
