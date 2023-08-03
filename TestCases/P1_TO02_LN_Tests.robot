*** Settings ***
Documentation    Login In Section
Resource            ..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO02_LN_TC01 Navigate To Log In
  [Documentation]  Open TestBench web page navigate to Log in And validate if page is open.
  [Tags]   P1TO02_TC01   exploratory
  Accept Cookies  Accept all
  Navigate To Login
  Navigate To TestBench Logo
