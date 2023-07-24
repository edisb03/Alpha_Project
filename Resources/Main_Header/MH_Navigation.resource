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
    [Documentation]     This Keyword is to Navigate to Language and select Gemran or English.
    [Arguments]     ${LANGUAGE}
    ${element check}    Run Keyword And Return Status    ${NAV_ENG}
    Sleep    3s
    IF    ${element check} == True
        Wait Until Page Contains    English
        Mouse Over      ${NAV_ENG}
        Wait Until Page Contains    English
        Click Element    //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), '${LANGUAGE}')]
    ELSE
        No Operation
    END
    ${element check}    Run Keyword And Return Status    ${NAV_GER}
    IF     ${element check} == True
        Wait Until Page Contains      Deutsch
        Mouse Over    (//ul[contains(@class, 'menu')]//li[9]//span[contains(text(), 'Deutsch')])[1]
        Click Element     //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), '${LANGUAGE}')]
    END

