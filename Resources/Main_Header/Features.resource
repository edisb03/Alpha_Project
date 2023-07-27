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
Navigate Through Features Page
    [Documentation]    Navigate to Requirements Management within Features
    Wait Until Page Contains Element    ${REQUIREMENTS_MANAGEMENT_FEATURES}
    Wait Until Page Contains Element    ${TEST_MANAGEMENT_FEATURES}
    Wait Until Page Contains Element    ${TEST_DESIGN_FEATURES}
    Wait Until Page Contains Element    ${TEST_EXECUTION_FEATURES}
    Wait Until Page Contains Element    ${TEST_AUTOMATION_FEATURES}
    Wait Until Page Contains Element    ${TEST_COLLABORATION_FEATURES}
    Wait Until Page Contains Element    ${CUSTOMIZATION_FEATURES}
    Wait Until Page Contains Element    ${INTEGRATION_FEATURES}

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
