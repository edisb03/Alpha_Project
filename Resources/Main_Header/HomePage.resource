*** Settings ***
Documentation       HomePage elements

Resource            ../import.resource


*** Variables ***
### Locators for boxes ###
${TEST_MANAGER_BUTTON}          //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}           //p[contains(text(),'„I can track at any time whether all requirements ')]
${TEST_MANAGEMENT_LINK}         //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Management')]
${SOFTWARE_DEV_BUTTON}          //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Software Developer')]
${SOFTWARE_DEV_QUOTE}           //p[contains(text(),'„I can check if my feature implementations were ac')]
${TEST_EXECUTION_LINK}          //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Execution')]
${PROJECT_M_BUTTON}             //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Project Manager')]
${PROJECT_M_QUOTE}              //p[contains(text(),'„TestBench is our central quality monitoring tool.')]
${TEAM_COLLAB_LINK}             //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Team Collaboration')]
${TESTER_BUTTON}                //div[contains (@class, 'tabs')]//a[contains(text(), 'As a Tester')]
${TESTER_QUOTE}                 //p[contains (text(), 'structured test procedures, checklists, automated test scripts, or exploratory testing.“')]
${TEST_DESIGN_LINK}             //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Design')]
### Locators for homepage ###
${START_FOR_FREE}               //a[contains(text(), 'Start for Free')]
${LEARN_MORE_ABOUT_IMBUS}       //a[contains(text(), 'Learn More About imbus')]
${IMBUS_LOGO}                   //div[@id='logo']//a[contains(text(), 'imbus AG')]
${ACCEPT_COOKIES_IMBUS}         //div[@id='cookieconsent:body']//a[contains(text(), 'allow all cookies ')]


*** Keywords ***
Verify As A Test Manager Button And Its Elements
    [Documentation]  Scrolls to the As A Test Manager button
    ...    and verifies its content and items insid of it
    Execute JavaScript    window.scrollTo(0,1000);
    Scroll Element Into View    ${TEST_MANAGEMENT_LINK}
    Wait Until Page Contains    As a Test Manager
    Page Should Contain Element    ${TEST_MANAGER_QUOTE}
    Click Element    ${TEST_MANAGEMENT_LINK}
    Page Should Contain    Test Management

Verify As A Software Developer Button And Its Elements
    [Documentation]  Scrolls to the As A Software Developer button
    ...    and verifies its content anditems inside of it
    Execute JavaScript    window.scrollTo(0,1000);
    # Scroll Element Into View    ${SOFTWARE_DEV_BUTTON}
    Click Element    ${SOFTWARE_DEV_BUTTON}
    Page Should Contain Element    ${SOFTWARE_DEV_QUOTE}
    Click Element    ${TEST_EXECUTION_LINK}
    Page Should Contain    Test Execution

Verify As A Project Manager Button And Its Elements
    [Documentation]  Scrolls to the As A Project Manager button
    ...    and verifies its content and items inside of it
    Execute JavaScript    window.scrollTo(0,1000);
    # Scroll Element Into View    ${PROJECT_M_BUTTON}
    Click Element    ${PROJECT_M_BUTTON}
    Page Should Contain Element    ${PROJECT_M_QUOTE}
    Click Element    ${TEAM_COLLAB_LINK}
    Page Should Contain    Team Collaboration

Verify As A Tester Button And Its Elements
    [Documentation]  Scrolls to the As A Tester button
    ...    and verifies its content and items inside of it
    Execute JavaScript    window.scrollTo(0,1000);
    # Scroll Element Into View    ${TESTER_BUTTON}
    Click Element    ${TESTER_BUTTON}
    Page Should Contain Element    ${TESTER_QUOTE}
    Click Element    ${TEST_DESIGN_LINK}
    Page Should Contain    Test Design

Scroll And Click Start For Free Button
    [Documentation]  This keyword is used to navigate to Start For Free button
    Wait Until Element Is Visible    ${START_FOR_FREE}
    Click Element    ${START_FOR_FREE}
    Wait Until Page Contains    Get started with a free account

Accept Cookies Imbus Page
    [Documentation]  This keyword is for Cookies and for validate that TestBench web is open.
    Tolerant Click    ${ACCEPT_COOKIES_IMBUS}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    Our Portfolio and trend topics

Scroll And Click Learn More About Imbus Button
    [Documentation]  This keyword is used to navigate to Learn More About Imbus button
    Scroll Element Into View    ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Element Is Visible    ${LEARN_MORE_ABOUT_IMBUS}
    Click Element    ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Page Contains Element    ${IMBUS_LOGO}
