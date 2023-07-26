*** Settings ***
Documentation       HomePage elements


Resource    ../import.resource


*** Variables ***
${TEST_MANAGER_BUTTON}    //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}     //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...    //p[contains (text(), 'are covered with an adequate number of test cases.“')]
${TEST_MANAGEMENT_BUTTON}    //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Management')]

${SOFTWARE_DEV_BUTTON}       //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Software Developer')]
${SOFTWARE_DEV_QUOTE}        //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...    //p[contains (text(), 'which requirements I probably missed and which defects I should fix.“')]
${TEST_EXECUTION_BUTTON}        //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Execution')]   

*** Keywords ***
Verify As A Test Manager Button And Its Elements
    [Documentation]    This Keywords scrolls to the As A Test Manager button and verifies its content and items inside
    ...    of it

    Scroll Element Into View       ${TEST_MANAGEMENT_BUTTON}  
    Wait Until Page Contains       As a Test Manager
    Page Should Contain Element    ${TEST_MANAGER_QUOTE} 
    Click Element                  ${TEST_MANAGEMENT_BUTTON}
    Page Should Contain            Test Management

Verify As A Software Developer Button And Its Elements

    Scroll Element Into View       ${SOFTWARE_DEV_BUTTON}
    Click Element                  ${SOFTWARE_DEV_BUTTON}
    Page Should Contain Element    ${SOFTWARE_DEV_QUOTE}
    Click Element                  ${TEST_EXECUTION_BUTTON}
    Page Should Contain            Test Execution









