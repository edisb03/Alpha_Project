*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                 //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_TEST_APPROACHES}          //a[@href="#"]
${NAV_EXPLOTARY_TESTING}        //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${NAV_DATA-DRIVEN-TESTING}      //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[2]/a[1]
${NAV_KEYWORD-DRIVENTESTING}    //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]
# ${NAV_FEATURES}                 //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_BLOG}                     //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/blog/')]
${NAV_RESOURCES}                //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/resources')]
${LOGIN_BUTTON}                 /div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}             //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${NAV_SIGN_UP}                  //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/sign-up/')]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features 
    Wait Until Page Contains Element    ${NAV_FEATURES} 
    Click Element    ${NAV_FEATURES} 
    Wait Until Page Contains    Discover the features

Navigate To Test Approaches
    [Documentation]    Navigate To Test Approaches
    Wait Until Page Contains Element    ${NAV_TEST_APPROACHES}
    Tolerant Click    ${NAV_TEST_APPROACHES}

Search Links By Name
    [Documentation]    Search the specified links by using its name
    [Arguments]    ${link_status}
    Set Selenium Speed    0.5
    IF    "${link_status}" == "Exploratory Testing"
        Page Should Contain    Exploratory Testing
        Sleep    5s
        Tolerant Click    ${NAV_EXPLOTARY_TESTING}
        Page Should Contain    Exploratory Testing Explained
    ELSE IF    "${link_status}" == "Data-Driven Testing"
        Page Should Contain    Data-Driven Testing
        Sleep    4s
        Tolerant Click    ${NAV_DATA-DRIVEN-TESTING}
        Page Should Contain    Data-Driven Testing
    ELSE IF    "${link_status}" == "Keyword-Driven Testing"
        Page Should Contain    Keyword-Driven Testing
        Sleep    4s
        Tolerant Click    ${NAV_KEYWORD-DRIVENTESTING}
        Page Should Contain    Keyword-Driven Testing
    END
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

Navigate To Login
  [Documentation]  Navigates to Login Button
  Set Selenium Speed    0.8
  Wait Until Page Contains Element    ${LOGIN_BUTTON}
  Tolerant Click    ${LOGIN_BUTTON}
  Wait Until Element Is Visible    ${LOGIN_PAGE_TITLE}

 Navigate To Sign Up
    [Documentation]    This keyword is used to navigate to Sign Up.
    Wait Until Page Contains Element    ${NAV_SIGN_UP}
    Click Element    ${NAV_SIGN_UP}
    Wait Until Page Contains     Get started with a free account

Navigate To Blog
    [Documentation]    This Keyword is used to navigate to Blog
    Wait Until Page Contains Element        ${NAV_BLOG} 
    Click Element                           ${NAV_BLOG} 
    Wait Until Page Contains                 TestBench Blog 

Navigate To Resources
    [Documentation]    This keyword is used to navigate to Resources
    Wait Until Page Contains Element    ${NAV_RESOURCES} 
    Click Element    ${NAV_RESOURCES}  
    Wait Until Page Contains     Find it quick - Use it right away 

Navigate To Login 
  [Documentation]  Navigates to Login Button. 
  Set Selenium Speed    0.8 
  Wait Until Page Contains Element    ${LOGIN_BUTTON} 
  Tolerant Click    ${LOGIN_BUTTON} 
  Wait Until Element Is Visible        ${LOGIN_PAGE_TITLE} 
