*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                 //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_BLOG}        //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/blog/')]
${NAV_RESOURCES}   //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/resources')]
${LOGIN_BUTTON}            //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}        //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${NAV_SIGN_UP}     //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/sign-up/')]
${NAV_TEST_APPROACHES}          //a[@href="#"]
${NAV_EXPLOTARY_TESTING}        //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${NAV_DATA-DRIVEN-TESTING}      //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[2]/a[1]
${NAV_KEYWORD-DRIVENTESTING}    //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features.
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains     Discover the features
