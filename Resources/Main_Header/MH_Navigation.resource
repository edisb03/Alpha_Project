*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                 //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_TEST_APPROACHES}          //a[@href="#"]
${NAV_EXPLOTARY_TESTING}        //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${NAV_DATA-DRIVEN-TESTING}      //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[2]/a[1]
${NAV_KEYWORD-DRIVENTESTING}    //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features.
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
