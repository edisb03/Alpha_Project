*** Settings ***
Documentation    This test case conducts Second Performance Testing for Start For Free button on Home Page
Resource            ..//..//Resources/import.resource

Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC02 Start For Free
    [Documentation]    Navigate to the TestBench for free use.
    [Tags]     P1TO01_TC02    exploratory
    Accept Cookies    Accept all
    Navigate To TestBench Logo     The Smart Test Management Tool
    Use TestBench For Free
