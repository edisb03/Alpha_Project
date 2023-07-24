*** Settings ***
Documentation    Keywords for Navigation
Resource    ../import.resource


*** Variables ***
${NAV_FEATURES}    //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_LOGO}        (//header[contains(@class, 'mainHeader')]//a//img[contains(@class, 'logo-image')])[1]
${NAV_ENG}  (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'English')])[1]
${NAV_GER}  (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'Deutsch')])[1]

*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features.
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains     Discover the features














































Navigate To Language
    [Documentation]    Navigates to Research processes
    [Arguments]  ${LANGUAGE}
    Wait Until Element Is Visible    ${NAV_LOGO}
    IF    '${LANGUAGE}' == 'English'
         Wait Until Page Contains Element       ${NAV_GER}
         Mouse Over    ${NAV_GER}
         Sleep    1s
         Click Element    //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), 'Englisch')]
    ELSE IF     '${LANGUAGE}' == 'Deutsch'
         Wait Until Page Contains Element     ${NAV_ENG}
         Mouse Over    ${NAV_ENG}
         Click Element        //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), 'German')]
    END

