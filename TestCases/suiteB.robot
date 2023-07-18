*** Settings ***
Documentation    .....
Resource            ../Resources/common.resource
Resource            ../Resources/common_Second.resource
Library             SeleniumLibrary
Library    ../Resources/python.configuration/test.py

# Test Setup    Open Web Browser     browser_type=headlesschrome
Test Setup    Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***

TC_01-----Test
    [Documentation]     Test........
    Wait Until Page Contains    Accept all
    Sleep    5s
