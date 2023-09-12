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
    [Tags]    P1TO04_TC02    exploratory 
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench