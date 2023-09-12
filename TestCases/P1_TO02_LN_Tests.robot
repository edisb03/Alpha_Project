*** Settings ***
Documentation       Login In Section
...    This section contains test cases for the Log In functionality
...    on the TestBench website. These test cases cover various scenarios,
...    including valid and invalid login attempts, password reset, and language switching.

Resource            ..//Resources/import.resource

Test Setup           Start Test Bench
Test Teardown        Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Log In
    [Documentation]    Open TestBench web page navigate to Log in And validate if page is open.
    [Tags]    P1TO02_TC01    exploratory
    Navigate To Login
    Navigate To TestBench Logo

P1_TO02_LN_TC02 Valid Credentials Of Registered User
    [Documentation]    In this test case is tested if a registered user can fulfill the login form
    ...    with their valid credentials and the Login button is enabled.
    [Tags]    P1TO02_TC02    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_01}
    Verify If Tick Is Visible    SignUp_Valid_Email
    Verify If Tick Is Visible    SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains    Welcome!

P1_TO02_TC03 Invalid Email Valid Password Failed Login
    [Documentation]    In this test case is tested if a registered user can fulfill the login form
    ...    with wrong email and valid password and then check the Login button state and error message as well.
    [Tags]    P1TO02_TC03    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_03}
    Verify If Tick Is Visible    SignUp_Invalid_Email
    Verify If Tick Is Visible    SignUp_Valid_Password
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains   Log in failed. Please check your credentials.

P1_TO02_TC04 Valid Email Invalid Password Failed Login
    [Documentation]    In this test case is tested if a registered user can fulfill the login form
    ...    with correct email and invalid password and then check the Login button state and error message as well.
    [Tags]    P1TO02_TC04    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_05}
    Verify If Tick Is Visible    Login_Valid_Email
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains    Log in failed. Please check your credentials.

P1_TO02_TC05 Empty Email And Password
    [Documentation]    In this test case user navigates to Log in and try,
    ...    to login without filling the login form at all..
    [Tags]    P1TO02_TC05    exploratory
    Navigate To Login
    Check Button State And Sign-Up/Log-In    Log_in_Disabled

P1_TO02_TC06 Account Lockout After Multiple Failed Attempts
    [Documentation]    In this test case is tested if an error message is shown after filling the Login form
    ...    with incorrect credentials and the user can click the checkbox Forgot my password.
    [Tags]    P1TO02_TC06    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_05}
    Verify If Tick Is Visible    Login_Valid_Email
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains    Log in failed. Please check your credentials.
    Verify And Click Forgot Your Password
    Check Reset Password Availability    Reset_Password_Disabled

P1_TO02_TC07 Forgot Password Reset Password Flow
    [Documentation]    In this test case is tested if an error message is shown after filling the Login form
    ...    with incorrect credentials and the user can click the checkbox Forgot my password.
    ...    Then enter the email and checks the if Reset Password is enable and clickable.
    [Tags]    P1TO02_TC07    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_05}
    Verify If Tick Is Visible    Login_Valid_Email
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains    Log in failed. Please check your credentials.
    Verify And Click Forgot Your Password
    Enter The Email    agnesaa_m@hotmail.com
    Verify If Tick Is Visible    SignUp_Valid_Email
    Check Reset Password Availability    Reset_Password_Enabled
    Navigate To TestBench Logo

P1_TO02_LN_TC08 Translate Login Page To Deutsch
    [Documentation]    In this test case is tested if login page is translated correctly from English to German
    ...    and works correct in each language.
    [Tags]    P1TO02_TC08    exploratory
    Navigate To Login
    Verify Default Languange Is    English
    Control If Login/SignUp Page Contains    Enter your details below
    Perform Language Switching    Deutsch
    Control If Login/SignUp Page Contains    Geben Sie Ihre Daten unten ein
    Check The Log In Form Language    Deutsch

P1_TO02_LN_TC09 Valid Credentials Of Not Registered User
    [Documentation]    In this test case is tested if not registered user can fullfill login form
    ...    with his valid credentials and the Login button is enabled...
    [Tags]    P1TO02_TC09    exploratory
    Navigate To Login
    Enter Email And Password    &{USER_02}
    Verify If Tick Is Visible    SignUp_Valid_Email
    Verify If Tick Is Visible    SignUp_Invalid_Password
    Check Button State And Sign-Up/Log-In    Log_in_Enabled
    Control If Login/SignUp Page Contains    Log in failed. Please check your credentials.
