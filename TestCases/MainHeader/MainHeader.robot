*** Settings ***
Documentation       ...

# Resource            ../../Resources/common.resource
# Resource            ../../Resources/TestBench_Resources/Login_in.resource
Resource            ../../Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
TC_01
    [Documentation]    Test
    [Tags]    tc_01
    Wait Until Page Contains    Accept all
    Sleep    5s

 # Browser Library to install
