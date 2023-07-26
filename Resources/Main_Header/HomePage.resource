*** Settings ***
Documentation       Features

Resource    ../import.resource


*** Variables ***


${START_FOR_FREE}    //a[contains(text(), 'Start for Free')]
*** Keywords ***






Scroll And Click Start For Free Button
    [Documentation]    This keyword is used to navigate to Start For Free button
    Wait Until Element Is Visible    ${START_FOR_FREE}
    Click Element    ${START_FOR_FREE}
    Wait Until Page Contains     Get started with a free account


