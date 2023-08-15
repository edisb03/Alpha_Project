*** Settings ***
Documentation       Main Header Section
Resource            ..//..//..//Resources/import.resource

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO03_SU_TC01 Navigate To Sign Up
    [Documentation]    Open TestBench web page navigate to Sign Up And validate if page is open.
    [Tags]    p1to03_tc01    exploratory
    Accept Cookies    Accept all
    Navigate To Sign Up
    Navigate To TestBench Logo