*** Settings ***
Documentation       Features

Resource    ../import.resource


*** Variables ***
${TEST_MANAGER_BUTTON}       //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}        //div[contains(@class, 'box-inner--text')]//blockquote [contains( @class, 'quote')]//p[contains (text(), 'are covered with an adequate number of test cases.“')]
${TEST_MANAGEMENT_BUTTON}    //div[contains (@class, 'box')]//a[contains(text(), 'Learn more about Test Management')]
${START_FOR_FREE}            //a[contains(text(), 'Start for Free')]
${LEARN_MORE_ABOUT_IMBUS}    //a[contains(text(), 'Learn More About imbus')]
${IMBUS_LOGO}                //div[@id='logo']//a[contains(text(), 'imbus AG')]


*** Keywords ***
Scroll And Click Start For Free Button
    [Documentation]    This keyword is used to navigate to Start For Free button
    Wait Until Element Is Visible    ${START_FOR_FREE}
    Click Element    ${START_FOR_FREE}
    Wait Until Page Contains     Get started with a free account
























    

Scroll And Click Learn More About Imbus Button
    [Documentation]   This keyword is used to navigate to Learn More About Imbus button
    Scroll Element Into View    ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Element Is Visible    ${LEARN_MORE_ABOUT_IMBUS}
    Click Element    ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Page Contains Element    ${IMBUS_LOGO}
