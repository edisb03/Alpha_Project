*** Settings ***
Documentation    Keywords for Navigation
Resource    ../import.resource


*** Variables ***
${NAV_FEATURES}    //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_BLOG}        //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/blog/')]
${NAV_RESOURCES}   //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/resources')]
${LOGIN_BUTTON}            //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}        //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${NAV_SIGN_UP}     //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/sign-up/')]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features.
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains     Discover the features

Navigate To Blog
    [Documentation]    This Keyword is used to navigate to Blog
    Wait Until Page Contains Element        ${NAV_BLOG}
    Click Element                           ${NAV_BLOG}
    Wait Until Page Contains                TestBench Blog

Navigate To Resources
    [Documentation]    This keyword is used to navigate to Resources.
    Wait Until Page Contains Element    ${NAV_RESOURCES}
    Click Element    ${NAV_RESOURCES}
    Wait Until Page Contains     Find it quick - Use it right away