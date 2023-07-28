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

P1_TO01_MH_TC01/2 Start For Free
    [Documentation]    Test Start For Free Button
    [Tags]    P1TO01_TC01/2  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To TestBench Logo
    Scroll And Click Start For Free Button

P1_TO01_MH_TC01/3 Learn More About Imbus
    [Documentation]    Test Learn more about Imbus button
    [Tags]    P1TO01_TC01/3  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To TestBench Logo
    Scroll And Click Learn More About Imbus Button
    Accept Cookies Imbus Page

P1_TO02_MH_TC02 Validate Exploratory Testing
   [Documentation]  Validates if the page Exploratory Testing
   ...  page works properly
   [Tags]  MH_TC02   exploratory
   Set Selenium Speed    0.5
   Accept Cookies   Accept all
   Navigate To Test Approaches
   Search Links By Name      Exploratory Testing
   Check If The Page Contains   Explore. Learn. Create. Execute. Improve.
   Scroll Down To   What Is Exploratory Testing?

P1_TO01_MH_TCO9_1 Test Manager Verify Box
    [Documentation]    Validates if the As A Test Manager Button works correctly
    [Tags]    MH_TC09_1  exploratory
    Set Selenium Speed    0.5
    Accept Cookies   Accept all
    Navigate To As A Test Manager

P1_TO01_MH_TC09_2 Software Developer Verify Box
    [Documentation]    Verifies if the As A Software Developer Button works correctly
    [Tags]    MH_TC09_2    exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To As A Software Developer

P1_TO01_MH_TC09_3 Project Manager Verify Box
    [Documentation]    Verifies if the As A Project Manager Button works correctly
    [Tags]    MH_TC09_3    exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To As A Project Manager

P1_T009_MH_TC09_4 Tester Verify Box
    [Documentation]    Verifies if the As A Tester Button works correctly
    [Tags]    MH_TC09_4    exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To As A Test Manager

P1_TO01_MH_TC02 Features
    [Documentation]    Navigate to Features and checks if page is open
    [Tags]    P1TO01_TC02  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To Features
    Navigate Through Features Page
    Click Try TestBench Now
    Navigate To TestBench Logo
    Navigate To Features
    Check If The Page Contains    Explore. Learn. Create. Execute. Improve.
    Click Try Exploratory Testing
    Navigate To TestBench Logo
    Navigate To Features
    Click Learn More    Learn More
    Check If The Page Contains    Explore. Learn. Create. Execute. Improve.
    Navigate To Features
    Check If The Page Contains    Let the Data Do All Your Testing
    Click Try Data-Driven Testing

P1_TO01_MH_TC03 Verify Cards On Home Page
   [Documentation]  Verify Cards On Home Page
   [Tags]   MH_TC03   exploratory
   Set Selenium Speed    0.5
   Accept Cookies   Accept all
   Verify Main Header
   Check If Page Contains Text   What You Can Do With TestBench
   Navigate To Card     Tool Integration

P1_TO01_MH_TC10 Verify Resources Links
    [Documentation]    Verify Resources Links
    [Tags]    MH_TC10   exploratory
    Set Selenium Speed    0.8
    Accept Cookies   Accept all
    Verify Main Header
    Navigate To Resources
    Resources Links Works    Test Automation
