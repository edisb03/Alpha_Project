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
