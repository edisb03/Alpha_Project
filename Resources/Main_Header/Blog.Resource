*** Settings ***
Documentation    Blog

Resource        ../import.resource


*** Variables ***
${SEARCH_BAR}        (//input[@id='s'])[1]
${SEARCH_ICON}        //input[@id='searchsubmit']
${TUTORIALS}          //div[@class='button button--tab active']//a[@class='menu-link']


*** Keywords ***
Navigate To The Search Bar
    [Documentation]    Navigate to the Search bar on the Blog
    Wait Until Page Contains Element    ${SEARCH_BAR}
    Tolerant Click    ${SEARCH_BAR}

Search Article
    [Documentation]    Search Articles that are on the Blog
    Wait Until Page Contains Element    ${SEARCH_ICON}
    Tolerant Click    ${SEARCH_ICON}

Cancel Pop Up Window
    [Documentation]    Cancel Pop Up Window
    Press Escape Key

Navigate To The Tutorials
    [Documentation]    Navigate to the Tutorilas within the Blog
    Wait Until Page Contains Element    ${TUTORIALS}
    Tolerant Click   ${TUTORIALS}