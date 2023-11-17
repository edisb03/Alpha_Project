*** Settings ***
Documentation       Main Header Section
...    This section contains test cases for the Main Header functionality
...    on the TestBench website. These test cases cover various scenarios,
...    including navigation, content validation, language switching, and more.

Resource            ..//Resources/import.resource

Test Setup          Start Test Bench
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
    [Documentation]    Navigate and Validate Cards On Home Page.
    [Tags]    P1TO01_TC01    exploratory
    Control If The MH Page Contains  Test on the highest level
    Check Test Bench Service Cards

P1_TO01_MH_TC08 Navigate To English Language
    [Documentation]    Verifies that English option is shown at Header of the testbench page.
    [Tags]    P1TO01_TC08    exploratory
    Verify Default Languange Is    English

P1_TO01_MH_TC20 Verify English Option In The Language Dropdown List
    [Documentation]    Verifies that English option is shown in the language dropdown list.
    ...  Not part of Resources page on  new version
    [Tags]    P1TO01_TC20    exploratory
    Perform Language Switching    English

P1_TO01_TC21 Switch Page To Deutch And Revert To Default Language English
    [Documentation]    Verify that users can navigate to the Deutsch version,
    ...    of the website from the home page using the language switcher...
    [Tags]    P1TO01_TC21    exploratory
    Verify Default Languange Is    English
    Perform Language Switching    Deutsch
    Control If The MH Page Contains     The Smart Test Management Tool
    Perform Language Switching    Deutsch
    Scroll To Verify Test Bench Logo
    Navigate To TestBench Logo
    Perform Language Switching    English
    Control If The MH Page Contains     The Smart Test Management Tool

P1_TO01_TC01 Verify Integration Suboption Of Resources
    [Documentation]    This test case valdidate the Integration suboption and its content
    [Tags]    P1_TO01_TC25   exploratory
    Navigate To Resources
    Verify Resources Suboptions   Integration
    Check Integration Overview

P1_TO01_TC0201 Verify Itox Suboption Of Resources
    [Documentation]    This test case valdidate the Integration suboption and its content
    [Tags]    P1_TO01_TC25   exploratory
    Navigate To Resources
    Verify Resources Suboptions    iTOX
