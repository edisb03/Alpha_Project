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

P1TO01_TC06 - Lets talk about your testautomation Button Verification
    [Documentation]    This Test case validates Lets tal about your testautomation button
    [Tags]     P1TO01_TC06  exploratory
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Testing automation
    Check Page Button State    ${LETS_TALK_BTN}

P1TO01_TC07 Navigate To English Language
    [Documentation]    Verifies that English option is shown at Header of the testbench page.
    [Tags]    P1TO01_TC07    exploratory
    Verify Default Languange Is    English

P1TO01_TC08 Verify English Option In The Language Dropdown List
    [Documentation]    Verifies that English option is shown in the language dropdown list.
    ...  Not part of Resources page on  new version
    [Tags]    P1TO01_TC08    exploratory
    Perform Language Switching    English

P1TO01_TC09 Validate Contact Us Button On Test Automation Page
    [Documentation]    Verifies that Contact us! button is shown and enabled in Test Automation page.
    [Tags]    P1TO01_TC09    exploratory
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Testing automation
    Check Page Button State    ${CONTACT_US_BTN}

P1TO01_TC10 Validate Advantages In Automation With TestBench List Items
    [Documentation]    This Test Case validates list inside of Test Automation page
    [Tags]    P1TO01_TC10  exploratory
    Navigate To Testing Solutions
    Verify Testing Solution Drop Items    Testing automation
    Check If The Page Contains Elements    Advantages in automation with TestBench
    Test Automation List Items Box Verification

P1TO01_TC11 Validation Of Learn More Button And iTORX Page
    [Documentation]    Verifies that Learn more button is shown and enabled in Home page at iTORX.
    [Tags]    P1TO01_TC11    exploratory
    Verify Main Header
    Check If The Page Contains Elements       New!
    Check Page Button State    ${LEARN_MORE_BTN}
    Check If The Page Contains Elements       Your Wizard for the manual execution of tests

P1TO01_TC12 The Road To Efficiency Components Validations On Home Page
    [Documentation]    Verifies that More about Testautomation button is shown and enabled in Home page
    ...    at Testautomation.
    [Tags]    P1TO01_TC12    exploratory
    Verify Main Header
    Check If The Page Contains Elements       The road to efficiency
    Check Page Button State    ${MORE_ABOUT_TA_BTN}
    Check If The Page Contains Elements       Test automation
