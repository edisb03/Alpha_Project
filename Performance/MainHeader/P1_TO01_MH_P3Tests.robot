*** Settings ***
Documentation    Login In     ...
Resource            ..//..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
    [Documentation]    Navigate and Validate Cards On Home Page.
    [Tags]    p1to01_tc01    exploratory
    Accept Cookies    Accept all
    Control If The Page Contains    What You Can Do With TestBench
    Navigate To Card    Requirements Management
    Go Back
    Navigate To Card    Test Management
    Go Back
    Navigate To Card    Test Design
    Go Back
    Navigate To Card    Test Execution
    Go Back
    Navigate To Card    Test Automation
    Go Back
    Navigate To Card    Team Collaboration
    Go Back
    Navigate To Card    Tool Customization
    Go Back
    Navigate To Card    Tool Integration
