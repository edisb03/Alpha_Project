*** Settings ***
Documentation       Features

Resource    ../import.resource


*** Variables ***
${TEST_MANAGER_BUTTON}    //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}     //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]//p[contains (text(), 'are covered with an adequate number of test cases.“')]
${TEST_MANAGEMENT_BUTTON}    //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Management')]


*** Keywords ***
Scroll To As A Test Manager Button And Click On
    Scroll Element Into View       ${TEST_MANAGEMENT_BUTTON}  
    Wait Until Page Contains       As a Test Manager
    Page Should Contain Element    ${TEST_MANAGER_QUOTE} 
    Click Element                  ${TEST_MANAGEMENT_BUTTON}
    Page Should Contain            Test Management




