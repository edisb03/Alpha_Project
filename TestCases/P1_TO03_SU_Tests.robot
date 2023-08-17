*** Settings ***
Documentation       Sign Up Section

Resource            ../Resources/import.resource

Test Setup    Open Web Browser    #browser_type=headlesschrome
Test Teardown       Close Browser


*** Test Cases ***
P1_TO03_SU_TC01 Navigate To Sign Up
    [Documentation]    Open TestBench web page navigate to Sign Up And validate if page is open.
    [Tags]    p1to03_tc01    exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Navigate To TestBench Logo

P1_TO03_TC04 Register To Sign Up With Valid Email And Invalid Password
    [Documentation]  This test case navigates to the TestBench web page's Sign Up section and
    ...   provides valid Email and not valid password for registration.
    ...    It checks the Sign Up Button State
    [Tags]   P1_TO03_TC04   exploratory  registration
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password         &{USER_03}
    Verify Tick Is Visible    Sign Up
    Check Button State And Sign-Up/Log-In    Disabled
