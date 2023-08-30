*** Settings ***
Documentation    This test case conducts Third Performance Testing for Verify Cards On Home Page
Resource            ..//..//Resources/import.resource

Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
    [Documentation]    Navigate and Validate Cards On Home Page.
    [Tags]    P1TO01_TC01    exploratory
    Accept Cookies    Accept all
    Control If The Page Contains    What You Can Do With TestBench
    Check Test Bench Service Cards
