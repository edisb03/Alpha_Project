*** Settings ***
Documentation       Features

Resource    ../import.resource


*** Variables ***
${REQUIREMENTS_MANAGEMENT_FEATURES}              //h2[contains(text(), 'Requirements Management')]
${TEST_MANAGEMENT_FEATURES}                      //h2[contains(text(), 'Test Management')]
${TEST_DESIGN_FEATURES}                          //h2[contains(text(), 'Test Design')]
${TEST_EXECUTION_FEATURES}                       //h2[contains(text(), 'Test Execution')]
${TEST_AUTOMATION_FEATURES}                      //h2[contains(text(), 'Test Automation')]
${TEST_COLLABORATION_FEATURES}                   //h2[contains(text(), 'Team Collaboration')]
${CUSTOMIZATION_FEATURES}                        //h2[contains(text(), 'Customization')]
${INTEGRATION_FEATURES}                          //h2[contains(text(), 'Integration')]
${TRY_TESTBENCH_NOW}                             //a[contains(text(), 'Try TestBench Now')]
${TRY_EXPLORTORY_TESTING}                        //a[contains(text(), 'Try Exploratory Testing')]
${TRY_DATA-DRIVEN_TESTING}                       //a[contains(text(), 'Try Data-Driven Testing')]

*** Keywords ***
Verify Content Features
    [Documentation]    Navigate to Requirements Management within Features
    Execute JavaScript    window.scrollTo(0,1000);
    Wait Until Page Contains Element    ${REQUIREMENTS_MANAGEMENT_FEATURES}
    Page Should Contain    Requirements Management
    Execute JavaScript    window.scrollTo(0,1500);
    Wait Until Page Contains Element    ${TEST_MANAGEMENT_FEATURES}
    Page Should Contain    Test Management
    Execute JavaScript    window.scrollTo(0,2300);
    Wait Until Page Contains Element    ${TEST_DESIGN_FEATURES}
    Page Should Contain    Test Design
    Execute JavaScript    window.scrollTo(0,3000);
    Wait Until Page Contains Element    ${TEST_EXECUTION_FEATURES}
    Page Should Contain    Test Execution
    Execute JavaScript    window.scrollTo(0,4000);
    Wait Until Page Contains Element    ${TEST_AUTOMATION_FEATURES}
    Page Should Contain    Test Automation
    Execute JavaScript    window.scrollTo(0,4800);
    Wait Until Page Contains Element    ${TEST_COLLABORATION_FEATURES}
    Page Should Contain    Team Collaboration
    Execute JavaScript    window.scrollTo(0,5500);
    Wait Until Page Contains Element    ${CUSTOMIZATION_FEATURES}
    Page Should Contain    Customization
    Execute JavaScript    window.scrollTo(0,6200);
    Wait Until Page Contains Element    ${INTEGRATION_FEATURES}
    Page Should Contain    Integration

Click Try TestBench Now
    [Documentation]    Navigate to Try Testbench Now button
    Wait Until Page Contains Element    ${TRY_TESTBENCH_NOW}
    Wait Until Keyword Succeeds    3x    3s    Click Element   ${TRY_TESTBENCH_NOW}
    Wait Until Page Contains     Get started with a free account

Click Try Exploratory Testing
    [Documentation]    Navigate to Try Exploratory Testing button
    Wait Until Element Is Visible    ${TRY_EXPLORTORY_TESTING}
    Click Element    ${TRY_EXPLORTORY_TESTING}
    Wait Until Page Contains     Get started with a free account

Click Learn More
  [Documentation]  Scrolls down to the middle of the page
  [Arguments]   ${text}
  Execute JavaScript    window.scrollTo(0,1000);
  Wait Until Page Contains     Learn More
  Page Should Contain    ${text}

Click Try Data-Driven Testing
    [Documentation]    Navigate to Try Data-Driven Testing button
    Wait Until Element Is Visible    ${TRY_DATA-DRIVEN_TESTING}
    Click Element    ${TRY_DATA-DRIVEN_TESTING}
    Wait Until Page Contains     Get started with a free account
