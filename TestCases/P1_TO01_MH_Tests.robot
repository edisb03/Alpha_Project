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
  Accept Cookies
  Navigate To Test Approaches
  Search Links By Name      Exploratory Testing

P1_TO01_MH_TC01/2 Start For Features
    [Documentation]    Test Start For Free Button
    [Tags]    P1TO02_TC01/2  exploratory
    Set Selenium Speed    0.5

P1_TO01_MH_TC01/2 Start For Free
    [Documentation]    Test Start For Free Button
    [Tags]    P1TO01_TC01/2  exploratory
    Accept Cookies
    Navigate To TestBench Logo
    Scroll And Click Start For Free Button

P1_TC01_HP_TCO9_1 Verify As A Test Manager Button
    [Documentation]    Validates if the As A Test Manager Button works correctly
    [Tags]    HP_TC09_1  exploratory
    Set Selenium Speed    0.5
    Accept Cookies
    Scroll To As A Test Manager Button And Click On
    
P1_TO01_MH_TC01/3 Learn More About Imbus
    [Documentation]    Test Learn more about Imbus button
    [Tags]    P1TO01_TC01/3  exploratory
    Accept Cookies
    Navigate To TestBench Logo
    Scroll And Click Learn More About Imbus Button


