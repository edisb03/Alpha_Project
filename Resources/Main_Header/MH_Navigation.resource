*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                 //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_TEST_APPROACHES}          //a[@href="#"]
${NAV_EXPLOTARY_TESTING}        //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${NAV_DATA-DRIVEN-TESTING}      //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[2]/a[1]
${NAV_KEYWORD-DRIVEN_TESTING}    //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]
${NAV_BLOG}                     //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/blog/')]
${NAV_RESOURCES}                //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/resources')]
${LOGIN_BUTTON}                 /div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}             //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${NAV_SIGN_UP}                  //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/sign-up/')]
${NAV_LOGO}                     (//header[contains(@class, 'mainHeader')]//a//img[contains(@class, 'logo-image')])[1]
${NAV_ENG}                      (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'English')])[1]
${NAV_GER}                      (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'Deutsch')])[1]
${GER_COOKIES}                  //div[contains(@class, 'container')]//p//a[contains(text(), 'Alle Cookies akzeptieren')][1]
${MAIN_HEADER}                  (//ul[contains(@class, "menu")])[1]
${NAV_TESTBENCH_BENEFITS}       //h2[contains(text(), 'Your Personal TestBench Benefit')]

*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features...
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains    Discover the features

Navigate To Test Approaches
    [Documentation]    Navigate To Test Approaches
    Wait Until Page Contains Element    ${NAV_TEST_APPROACHES}
    Tolerant Click    ${NAV_TEST_APPROACHES}

Navigate To Language
    [Documentation]    Navigates to Research processes...
    [Arguments]  ${LANGUAGE}
    Wait Until Element Is Visible    ${NAV_LOGO}
    IF    '${LANGUAGE}' == 'English'
         Wait Until Page Contains Element       ${NAV_GER}
         Mouse Over    ${NAV_GER}
         Sleep    2s
         Click Element    //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), 'Englisch')]
    ELSE IF     '${LANGUAGE}' == 'Deutsch'
         Sleep    2s
         Wait Until Page Contains Element     ${NAV_ENG}
         Mouse Over    ${NAV_ENG}
         Click Element        //ul[contains(@class, 'menu')]//li[9]//ul//li//span[2][contains(text(), 'German')]
         Wait Until Page Contains Element    ${GER_COOKIES}
         Click Element    ${GER_COOKIES}
    END

Search Links By Name
    [Documentation]    Search the specified links by using its name
    [Arguments]    ${link_status}
    Set Selenium Speed    0.3
    IF    "${link_status}" == "Exploratory Testing"
        Page Should Contain    Exploratory Testing
        Sleep    3s
        Tolerant Click    ${NAV_EXPLOTARY_TESTING}
        Page Should Contain    Exploratory Testing Explained
    ELSE IF    "${link_status}" == "Data-Driven Testing"
        Page Should Contain    Data-Driven Testing
        Sleep    3s
        Tolerant Click    ${NAV_DATA-DRIVEN-TESTING}
        Page Should Contain    Data-Driven Testing
    ELSE IF    "${link_status}" == "Keyword-Driven Testing"
        Page Should Contain    Keyword-Driven Testing
        Sleep    3s
        Tolerant Click    ${NAV_KEYWORD-DRIVEN_TESTING}
        Page Should Contain    Keyword-Driven Testing
    END

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

Navigate To Login
  [Documentation]  Navigates to Login Button
  Set Selenium Speed    0.8
  Wait Until Page Contains Element     ${LOGIN_BUTTON}
  Tolerant Click                       ${LOGIN_BUTTON}
  Wait Until Element Is Visible        ${LOGIN_PAGE_TITLE}

 Navigate To Sign Up
    [Documentation]    This keyword is used to navigate to Sign Up.
    Wait Until Page Contains Element    ${NAV_SIGN_UP}
    Click Element                       ${NAV_SIGN_UP}
    Wait Until Page Contains     Get started with a free account

Navigate To TestBench Logo
    [Documentation]    This keyword is used to navigate to TestBench logo
    Wait Until Page Contains Element    ${NAV_LOGO}
    Click Element                       ${NAV_LOGO}
    Wait Until Page Contains    The Smart Test Management Tool


