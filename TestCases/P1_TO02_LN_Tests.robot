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

TC_00_TEST
    [Documentation]   Test   Language: English/Deutsch
    Accept Cokkies
    Navigate To Language    Deutsch
    Sleep    3sP1_TO02_LN_TC02 Navigate To Resources

TC_TEST_BLOG
    [Documentation]    Check for Blog in Main Header
    Accept Cokkies
    Navigate To Blog
