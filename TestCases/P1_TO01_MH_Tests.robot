*** Settings ***
Documentation    Home Page     ...
Resource            ..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
   [Documentation]  Verify Cards On Home Page
   [Tags]   P1TO01_TC01   exploratory
   Set Selenium Speed    0.5
   Accept Cookies   Accept all
   Control If The Page Contains  What You Can Do With TestBench
   Navigate To Card     Tool Integration

P1_TO01_MH_TC02 Start For Free
    [Documentation]    Test Start For Free Button
    [Tags]    P1TO01_TC02  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To TestBench Logo
    Scroll And Click Start For Free Button

P1_TO01_MH_TC03 Learn More About Imbus
    [Documentation]    Test Learn more about Imbus button
    [Tags]    P1TO01_TC03  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To TestBench Logo
    Scroll And Click Learn More About Imbus Button
    Accept Cookies Imbus Page

P1_TO01_MH_TC04 Verify Feature Functions
    [Documentation]    Navigate to Features and checks if page is open
    [Tags]    P1TO01_TC04  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To Features
    Verify Content Features

P1_TO01_MH_TC05 Verify Try TestBench Now
    [Documentation]    After open test bench page, open Features item and check
    ...                if button "Try TestBench Now" within the page is available
    [Tags]    P1TO01_TC05  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To Features
    Click Try TestBench Now

P1_TO01_MH_TC06 Verify Try Exploratory Testing
    [Documentation]    After open test bench page, open Features item and check
    ...                if button "Try Exploratory Testing" within the page is available
    [Tags]    P1TO01_TC06  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To Features
    Control If The Page Contains    Explore. Learn. Create. Execute. Improve.
    Click Try Exploratory Testing
    Go Back 
    Navigate To Learn More Exploratory Testing    Learn More
    Control If The Page Contains   Explore. Learn. Create. Execute. Improve.

P1_TO01_MH_TC07 Verify Try Data-Driven Testing
    [Documentation]    Verify Try Data-Driven Testing button
    [Tags]    P1TO01_TC07  exploratory
    Set Selenium Speed    0.5
    Accept Cookies  Accept all
    Navigate To Features
    Control If The Page Contains   Let the Data Do All Your Testing
    Click Try Data-Driven Testing
    Redirect To Main Page
    Navigate To Learn More Data Driven  Learn More
    Control If The Page Contains  Let the Data Do All Your Testing

P1_TO01_MH_TCO9-1 Test Manager Verify Box
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

P1_TO01_MH_TC10 Verify Test Approaches Works          
  [Documentation]  Checks if the test approaches works
  [Tags]   P1TO01_TC10  exploratory
  Set Selenium Speed    0.5
  Accept Cookies  Accept all
  Navigate To Test Approaches
  Search Links By Name      Exploratory Testing

P1_TO02_MH_TC11 Validate Exploratory Testing
   [Documentation]  Validates if the page Exploratory Testing under Test Approaches
   ...   works properly
   [Tags]  P1TO01_TC11   exploratory
   Set Selenium Speed    0.5
   Accept Cookies   Accept all
   Navigate To Test Approaches
   Search Links By Name      Exploratory Testing
   Control If The Page Contains   Explore. Learn. Create. Execute. Improve.
   Scroll Down To   What Is Exploratory Testing?






