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
    ...   provides valid Email and not valid password for registration..
    ...    It checks the Sign Up Button State.
    [Tags]   P1_TO03_TC04   exploratory  registration
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password         &{USER_02}
    Verify Tick Is Visible    SignUp_Valid_Email
    Verify Tick Is Visible    SignUp_Invalid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Disabled

P1TO03_TC06 Register To Sign Up With Invalid Email And Valid Password
    [Documentation]    This test case verifies the behavior of the "Sign Up" process on the test bench website
    ...    when an nonsregistered invalid email and a valid password are entered.
    [Tags]    P1TO03_TC04    exploratory
    Set Selenium Speed    0.5
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password    &{USER_04}
    Verify Tick Is Visible    SignUp_Invalid_Email
    Verify Tick Is Visible    SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Disabled
