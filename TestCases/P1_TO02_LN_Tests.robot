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

P1_TO02_LN_TC02 Valid Credentials
    [Documentation]    In this test case is tested if registered user can fullfill login form
    ...                with his valid credentials and the Login button is enabled
    [Tags]    P1TO02_TC02    exploratory
    Accept Cookies    Accept all
    Navigate To Login
    Enter Valid Email    agnesaa_m@hotmail.com
    Enter Valid Password    Seharoj@400
    
    #Enter Valid Credentials
