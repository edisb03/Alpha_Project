*** Settings ***
Documentation    Keywords for Navigation
Resource    ../import.resource


*** Variables ***
${NAV_FEATURES}    //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_LOGO}        (//header[contains(@class, 'mainHeader')]//a//img[contains(@class, 'logo-image')])[1]

*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features.
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains     Discover the features

Navigate To Language
    [Documentation]     This Keyword is to Navigate to Language and select Gemran or English.
    ${element check}    Run Keyword And Return Status    ${NAV_LOGO}
    IF    ${element check} == True
        Click Element      (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'English')])[1]
    ELSE
        Click Element 

    END

Navigate To English Language
    [Documentation]    This Keyword is to Navigate to Language and select Gemran or English.
    Wait Until Page Contains Element    
    Click Element    
    
Navigate To German Language
    Wait Until Page Contains Element    
    Click Element 