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
    Click Testbench Headline Link    Home

P1TO04_TC03- Footer Features Link Verification
    [Documentation]    This Test case verifies and validates that Features link is working properly without any errors
    [Tags]    P1TO04_TC03    exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench
    Click Testbench Headline Link    Features

P1TO04_TC04- Footer Exploratory Testing Link Verification
    [Documentation]    This Test case verifies and validates that Exploratory Testing
    ...    link is working properly without any errors
    [Tags]    P1TO04_TC03    exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench
    Click Testbench Headline Link    Exploratory Testing

P1TO04_TC05- Footer Data Driven Testing Link Verification
    [Documentation]    This Test case verifies and validates that Data Driven Testing
    ...    link is working properly without any errors
    [Tags]    P1TO04_TC03    exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench
    Click Testbench Headline Link    Data Driven Testing

P1TO04_TC06- Footer Keyword Driven Testing Link Verification
    [Documentation]    This Test case verifies and validates that Keyword Driven Testing
    ...    link is working properly without any errors
    [Tags]    P1TO04_TC03    exploratory
    Check Footer Test Bench Logo
    Validate Footer HeadLine    TestBench
    Click Testbench Headline Link    Keyword Driven Testing
