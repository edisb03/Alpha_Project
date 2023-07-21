*** Settings ***
Documentation    Login In     ...
Resource            ..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Login
  [Documentation]  Open TestBench web page and check if Login page is open....
  [Tags]   TC_02   exploratory
  Set Selenium Speed    0.8
  Accept Cokkies
  Navigate To Login
  Check That Login Page Is Open

P1_TO02_LN_TC03 - Navigate to Log in
    [Documentation]    Agnesa navigate to Log in
    [Tags]    P1TO02_LN_03
    Navigate To Login

P1_TOO2_LN_TC06 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TOO2_LN_TC007 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TO02_LN_TC010 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TO02_LN_TC01033 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TO02_LN_TC01036 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login
