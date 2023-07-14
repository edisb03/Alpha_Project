*** Settings ***
Documentation   ...
Resource            ../Resources/common.resource
Library             SeleniumLibrary

# Test Setup    Open Browser
Test Teardown       Close Browser


*** Test Cases ***
TC_TO01_suiteA
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts.
    [Tags]    tc_to01_a
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Software Testing
    Navigate To Test Automation [Software Testing]
    Navigate To Test Automation With Robot Framework [Test Automation]
    Navigate To Robot Framework
    Run Robot Framework Scripts
