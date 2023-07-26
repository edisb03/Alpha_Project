*** Settings ***
Documentation       HomePage elements

Resource    ../import.resource


*** Variables ***







${TEST_MANAGER_BUTTON}         //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}          //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...    //p[contains (text(), 'are covered with an adequate number of test cases.“')]
${TEST_MANAGEMENT_LINK}      //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Management')]
${SOFTWARE_DEV_BUTTON}          //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Software Developer')]
${SOFTWARE_DEV_QUOTE}           //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...    //p[contains (text(), 'which requirements I probably missed and which defects I should fix.“')]
${TEST_EXECUTION_LINK}        //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Execution')]
${PROJECT_M_BUTTON}           //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Project Manager')]
${PROJECT_M_QUOTE}            //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...    //p[contains (text(), '„TestBench is our central quality monitoring tool.')]
${TEAM_COLLAB_LINK}          //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Team Collaboration')]
${TESTER_BUTTON}            //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Tester')]
${TESTER_QUOTE}             //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]
...   //p[contains (text(), 'structured test procedures, checklists, automated test scripts, or exploratory testing.“')]
${TEST_DESIGN_LINK}         /div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Design')]


*** Keywords ***
Verify As A Test Manager Button And Its Elements
    [Documentation]    This Keyword scrolls to the As A Test Manager button and verifies its content and items inside
    ...    of it

    Scroll Element Into View       ${TEST_MANAGEMENT_LINK}
    Wait Until Page Contains       As a Test Manager
    Page Should Contain Element    ${TEST_MANAGER_QUOTE} 
    Click Element                  ${TEST_MANAGEMENT_LINK}
    Page Should Contain            Test Management

Verify As A Software Developer Button And Its Elements
    [Documentation]    This Keyword scrolls to the As A Software Developer button and verifies its content and 
    ...    items inside of it

    Scroll Element Into View       ${SOFTWARE_DEV_BUTTON}
    Click Element                  ${SOFTWARE_DEV_BUTTON}
    Page Should Contain Element    ${SOFTWARE_DEV_QUOTE}
    Click Element                  ${TEST_EXECUTION_LINK}
    Page Should Contain            Test Execution

Verify As A Project Manager Button And Its Elements

    [Documentation]    This Keyword scrolls to the As A Project Manager button and verifies its content and items 
    ...    inside of it
    Scroll Element Into View       ${PROJECT_M_BUTTON}
    Click Element                  ${PROJECT_M_BUTTON}
    Page Should Contain Element    ${PROJECT_M_QUOTE}
    Click Element                  ${TEAM_COLLAB_LINK}
    Page Should Contain            Team Collaboration

Verify As A Tester Button And Its Elements
    [Documentation]    This Keyword scrolls to the As A Tester button and verifies its content and items 
    ...    inside of it
    Scroll Element Into View       ${TESTER_BUTTON} 
    Click Element                  ${TESTER_BUTTON}
    Page Should Contain Element    ${TESTER_QUOTE}
    Click Element                  ${TEST_DESIGN_LINK}
    Page Should Contain            Test Design
