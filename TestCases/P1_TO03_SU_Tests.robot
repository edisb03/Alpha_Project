*** Settings ***
Documentation       Sign Up Section

Resource            ../Resources/import.resource

Test Setup    Open Web Browser    #browser_type=headlesschrome
Test Teardown       Close Browser


*** Test Cases ***
P1_TO03_SU_TC01 Navigate To Sign Up
    [Documentation]    Open TestBench web page navigate to Sign Up And validate if page is open.
    [Tags]    P1TO03_TC01     exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Navigate To TestBench Logo

P1_TO03_TC04 Register To Sign Up With Valid Email And Invalid Password
    [Documentation]  This test case navigates to the TestBench web page's Sign Up section and
    ...   provides valid Email and not valid password for registration..
    ...    It checks the Sign Up Button State.
    [Tags]   P1TO03_TC04    exploratory  REGISTRATION
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password         &{USER_02}
    Verify If Tick Is Visible    SignUp_Valid_Email
    Verify If Tick Is Visible   SignUp_Invalid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Disabled

P1_TO03_TC06 Register To Sign Up With Invalid Email And Valid Password
    [Documentation]    This test case verifies the behavior of the "Sign Up" process on the test bench website
    ...    when an nonsregistered invalid email and a valid password are entered.
    [Tags]    P1TO03_TC06     exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password    &{USER_04}
    Verify If Tick Is Visible    SignUp_Invalid_Email
    Verify If Tick Is Visible    SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Disabled

P1_TO03_TC03 Register To Sign Up With Registered Email
    [Documentation]    This Test Case verifies the behavior of the 'Sign up' process on test bench website
    ...    when an registered user is trying to register again.
    [Tags]    P1TO03_TC03   exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Enter Email And Password    &{USER_01}
    Control If Page Contains   Email already exists.
    Control If Page Contains    Well done
    Verify If Tick Is Visible     SignUp_Valid_Email
    Verify If Tick Is Visible     SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Disabled

P1_TO03_TC05 Register to Sign Up with Valid Email And Valid Password
    [Documentation]    This Test Case verifies the behavior of 'Sign Up' process,
    ...    on the test bench website when a not registered user is trying to,
    ...    register for the first time.
    [Tags]    P1TO03_TC05    exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    ${email}    ${password}=    Generate Random Email And Password    Arber
    Control If Page Contains    Well done
    Verify If Tick Is Visible     SignUp_Valid_Email
    Verify If Tick Is Visible     SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Sign_up_Enabled
    Control If Page Contains    Check Your Email
