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
  Accept Cookies
  Navigate To Login
  Check That Login Page Is Open

P1_TO02_LN_TC02 Navigate To Resources
    [Documentation]    Navigate To Reseources
    Accept Cookies
    Navigate To Resources
    Sleep    10s

TC_TEST_BLOG
    [Documentation]    Check for Blog in Main Header
    Accept Cookies
    Navigate To Blog
