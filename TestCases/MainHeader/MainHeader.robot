*** Settings ***
Documentation       ...

# Resource            ../../Resources/common.resource
# Resource            ../../Resources/TestBench_Resources/Login_in.resource
Resource            ../../Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
TC_01 Open TestBench Website
    [Documentation]    Checks if the TestBench website is successfully opened.
    [Tags]    TC_01   exploratory
    Set Selenium Speed    0.5
    Accept Cokkies

 # Browser Library to install
