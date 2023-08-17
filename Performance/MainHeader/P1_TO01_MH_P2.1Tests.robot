*** Settings ***
Documentation    This test case conducts First Performance Testing for Start For Free button on Home Page
Resource            ..//..//Resources/import.resource

Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC02 Start For Free
    [Documentation]    Navigate to the TestBench for free use.
    [Tags]    p1to01_tc02    exploratory
    Accept Cookies    Accept all
    Navigate To TestBench Logo
    Use TestBench For Free
