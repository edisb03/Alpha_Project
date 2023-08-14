*** Settings ***
Documentation       Login In Section

Resource            ..//Resources/import.resource

Test Setup    Open Web Browser    browser_type=headlesschrome
Test Teardown       Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Log In
    [Documentation]    Open TestBench web page navigate to Log in And validate if page is open.
    [Tags]    p1to02_tc01    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Navigate To TestBench Logo

P1TO02_TO02_LN_TC02 Valid Credentials
    [Documentation]    User attempts to log in with valid credentials username and password.
    [Tags]    P1TO02_TC02  exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Valid Email    test@test.com
    Verify Tick Sign Is Visible
    Enter Valid Password    Test123.
    Login Button State

