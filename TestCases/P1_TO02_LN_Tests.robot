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

P1_TOO2_LN_TC05 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TOO2_LN_TC06 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

<<<<<<< HEAD
P1_TOO2_LN_TC07 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login
  

P1_TOO2_LN_TC307 - Navigate To Login
=======
P1_TOO2_LN_TC007 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

P1_TO02_LN_TC009 - Navigate To Login
>>>>>>> e44ee1ded6811f7ef7be0e70047afdfd9a23844a
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

<<<<<<< HEAD
P1_TOO2_LN_TC037 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login
=======
P1_TO02_LN_TC010 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login


P1_TO02_LN_TC0102 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

  
P1_TO02_LN_TC0103 - Navigate To Login
  [Documentation]  Test Login Page
  [Tags]   P1TO02_LN_05
  Navigate To Login

>>>>>>> e44ee1ded6811f7ef7be0e70047afdfd9a23844a
