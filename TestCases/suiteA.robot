*** Settings ***
Documentation   ...
Resource            ../Resources/common.resource
Library             SeleniumLibrary

# Test Setup    Open Browser
# Test Teardown       Close Browser


*** Test Cases ***
TC_TO01_suiteA
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts
    [Tags]    tc_to01_a
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Software Testing
    Navigate To Test Automation [Software Testing]
    Navigate To Test Automation With Robot Framework [Test Automation]
    Navigate To Robot Framework
    Run Robot Framework Scripts

TC_TO02_suiteA
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts.
    [Tags]    tc_to02_a
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Software Testing
    Navigate To Test Automation [Software Testing]
    Navigate To Test Automation Strategy [Test Automation]
    Check Roll-Out Title
    Navigate To Top Page
    Check Test Automation Strategy Title

TC_TO03_suiteA
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts.
    [Tags]    tc_to03_a
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Academy
    Navigate To ISTQB Certified Tester
    Navigate To The German Testing Board

 # Browser Library to install
