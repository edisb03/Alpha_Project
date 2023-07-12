*** Settings ***
Documentation    ...
Resource            ../Resources/common.resource
Resource            ../Resources/common_Second.resource
Library             SeleniumLibrary
Library    ../Resources/python.configuration/test.py

# Test Setup    Open Browser
Test Teardown       Close Browser


*** Test Cases ***
TC_TO01_suiteB
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts
    [Tags]    tc_to01_b
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Search In Search Navigation    Mobile
    Reset And Search Results    Mobile
    Navigate To Mobile Testing
    Press Tab Key

TC_TO02_suiteB
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts
    [Tags]    tc_to02_b
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Registration Form
    Fill Out The Form In Registration    Edis    Imbus    Peje
    Check Validation Form

TC_TO03_suiteB
    [Documentation]    This Test Case is to Check And Run Robot Framework Scripts
    [Tags]    tc_to02_b
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Allow All Cookies
    Navigate To Login Form
    Fill Out The Login Form    Edis@Imbus.de    1234567890
    Check Login Form
