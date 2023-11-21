*** Settings ***
Documentation       Footer Section

Resource            ..//Resources/import.resource

Test Setup          Start Test Bench
Test Teardown       Close Browser


*** Test Cases ***
P1_TO04_TC01 Footer Presence Verification
    [Documentation]    This Test case verifies existence of footer of test bench page
    [Tags]    P1TO04_TC01  exploratory
    Check Footer Test Bench Logo

P1_TO04_TC02 Footer Home Link Verification
    [Documentation]    This Test case verifies and validates that Home link is working properly without any errors
    [Tags]    P1TO04_TC02  exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench
    Validate Home Link

P1_TO04_TC03 Contact Support Link Functionality
    [Documentation]    This test case checks Contact Support link Functionality. PS: Validation is left for future
    [Tags]    P1TO04_TC03  exploratory    robot:skip
    Check Footer Test Bench Logo
    Validate Footer HeadLine    Support
    Check Contact Support Link

P1_TO04_TC04 Validation Of Legal Link In Company Section
    [Documentation]    This test case verify Legal link under Company Section
    [Tags]    P1TO04_TC04  exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    Company
    Check Legal Link

P1_TO04_TC05 Verification Of Twitter Integration On Test Bench
    [Documentation]    This test case verify if Twitter button works properly
    [Tags]    P1TO04_TC05  exploratory
    Check Footer Test Bench Logo
    Navigate To Twitter Button
    Switch To New Tab
    Validate New Tab Page

P1_TO04_TC06 Verification Of Facebook Integration On Test Bench
    [Documentation]    This test case verify if Facebook button works properly
    [Tags]    P1TO04_TC06  exploratory
    Check Footer Test Bench Logo
    Navigate To Facebook Button
    Switch To New Tab
    Validate New Tab Page