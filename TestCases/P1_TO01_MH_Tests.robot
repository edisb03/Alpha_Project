*** Settings ***
Documentation    Login In     ...
Resource            ..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Test Approaches Works
  [Documentation]  Checks if the test approaches works
  [Tags]   MH_TC01  exploratory
  Set Selenium Speed    0.5
  Accept Cookies  Accept all
  Navigate To Test Approaches
  Search Links By Name      Exploratory Testing

P1_TO02_MH_TC02 Validate Exploratory Testing HomePage
  [Documentation]  Validates if the page Exploratory Testing
  ...  page works properly
  [Tags]  MH_TC02   exploratory
  Set Selenium Speed    0.5
  Accept Cookies   Accept all
  Navigate To Test Approaches
  Search Links By Name      Exploratory Testing
  Check If The Page Contains   Explore. Learn. Create. Execute. Improve.
  Scroll Down To   What Is Exploratory Testing?
