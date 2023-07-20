*** Settings ***
Documentation       ...

Resource            ../../Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
TC_02 Navigate To Login 
  [Documentation]  Open TestBench web page and check if Login page is open...
  [Tags]   TC_02   exploratory
  Set Selenium Speed    0.8
  Accept Cokkies
  Navigate To Login
  Check That Login Page Is Open
  # Agnesa.