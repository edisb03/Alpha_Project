*** Settings ***
Documentation       Main Header Section
...    This section contains test cases for the Main Header functionality
...    on the TestBench website. These test cases cover various scenarios,
...    including navigation, content validation, language switching, and more.

Resource            ..//Resources/import.resource

Test Setup          Start Test Bench
Test Teardown       Close Browser


*** Test Cases ***
P1TO01_TC01 - Navigate To Testing Solutions Menu Item
    [Documentation]    This test case validates the Testing Solutios item
    [Tags]  P1TO01_TC01  exploratory
    Verify Main Header
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Testing automation
    Check If The Page Contains Elements    Test automation
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Keyword Driven Testing
    Check If The Page Contains Elements    Keyword Driven Testing
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Data Driven Testing
    Check If The Page Contains Elements   Data Driven Testing

P1TO01_TC02 - Navigate To Resources Menu Item
    [Documentation]    This test case validates the Resources item in the main header
    [Tags]    P1TO01_TC02  exploratory
    Verify Main Header
    Navigate To Resources
    Verify Resources Drop Menu Item    Integration
    Check If The Page Contains Elements    INTEGRATION IN THE TESTBENCH
    Navigate To Resources
    Verify Resources Drop Menu Item    iTORX
    Check If The Page Contains Elements    Your Wizard for the manual execution of tests

P1_TO01_TC03 Switch Page To Deutch And Revert To Default Language English
    [Documentation]    Verify that users can navigate to the Deutsch version,
    ...    of the website from the home page using the language switcher...
    [Tags]    P1TO01_TC03    exploratory
    Verify Default Languange Is    English
    Perform Language Switching    Deutsch
    Control If The MH Page Contains     Test auf höchstem Niveau
    Perform Language Switching    Deutsch
    Scroll To Verify Test Bench Logo
    Navigate To TestBench Logo
    Perform Language Switching    English
    Control If The MH Page Contains     Test on the highest level

P1TO01_TC04 - Test Bench Main Header Logo Verification
    [Documentation]    This Test case validates Test Bench logo in Main Header
    [Tags]     P1TO01_TC04  exploratory
    Verify Main Header
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Testing automation
    Check If The Page Contains Elements    Test automation
    Navigate To TestBench Logo
    Control If The MH Page Contains    Test on the highest level

P1TO01_TC05 - Navigate And Validate Cards Home Page
    [Documentation]    This Test case validates Home Page cards: Testautomation, Keyworddriven Testing,
    ...    Datadriven Testing, Integration.
    [Tags]     P1TO01_TC05  exploratory
    Check If The Page Contains Elements    The test management and test design features
    Check Test Bench Service Cards

# P1TO01_TC04 - Lets talk about your testautomation Button Verification
#     [Documentation]    This Test case validates Lets tal about your testautomation button
#     [Tags]     P1TO01_TC04  exploratory
#     Navigate To Testing Solutions
#     Verify Testing Solution Drop Items    Testing automation
#     Check Page Button State     Lets talk about your testautomation_Enabled

# P1TO01_TC03 - Keyword Driven Testing Drop Menu Item Verification
#     [Documentation]    This Test case validates Testing Automation drop menu item in Testing solutions
#     [Tags]     P1TO01_TC03  exploratory
#     Navigate To Testing Solutions
#     Verify Testing Solution Drop Items    Keyword Driven Testing
#     Control If The Page Contains    Keyword Driven Testing

# P1TO01_TC04 - Data Driven Testing Drop Menu Item Verification
#     [Documentation]    This Test case validates Testing Automation drop menu item in Testing solutions
#     [Tags]     P1TO01_TC04  exploratory
#     Navigate To Testing Solutions
#     Verify Testing Solution Drop Items    Data Driven Testing
#     Control If The Page Contains    Data Driven Testing


#     [Documentation]    Navigate and Validate Cards On Home Page.
#     [Tags]    P1TO01_TC01    exploratory
#     Control If The MH Page Contains  Test on the highest level
#     Check Test Bench Service Cards

# P1_TO01_MH_TC03 Navigate To English Language
#     [Documentation]    Verifies that English option is shown at Header of the testbench page.
#     [Tags]    P1TO01_TC02    exploratory
#     Verify Default Languange Is    English

# P1_TO01_MH_TC03 Verify English Option In The Language Dropdown List
#     [Documentation]    Verifies that English option is shown in the language dropdown list.
#     ...  Not part of Resources page on  new version
#     [Tags]    P1TO01_TC03    exploratory
#     Perform Language Switching    English

# P1_TO01_TC04 Switch Page To Deutch And Revert To Default Language English
#     [Documentation]    Verify that users can navigate to the Deutsch version,
#     ...    of the website from the home page using the language switcher...
#     [Tags]    P1TO01_TC04    exploratory
#     Verify Default Languange Is    English
#     Perform Language Switching    Deutsch
#     Control If The MH Page Contains     Test auf höchstem Niveau
#     Perform Language Switching    Deutsch
#     Scroll To Verify Test Bench Logo
#     Navigate To TestBench Logo
#     Perform Language Switching    English
#     Control If The MH Page Contains     Test on the highest level

# P1_TO01_TC05 - Integration Drop Menu Item Content Verification
#     [Documentation]    This test case valdidate the Integration suboption and its content
#     [Tags]    P1_TO01_TC05   exploratory
#     Navigate To Resources
#     Verify Resources Drop Menu Item   Integration
#     Perfect Tool Section
#     Defect Management Connection Section
#     Automation Tool Connection Section
#     Questions Section
