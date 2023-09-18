*** Settings ***
Documentation    Blog

Resource        ../import.resource


*** Variables ***
${SEARCH_BAR}        (//input[@id='s'])[1]
${SEARCH_ICON}        //input[@id='searchsubmit']
${ALL_ARTICLES}         //div[@class='button button--tab active']//a[@class='menu-link']


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

Navigate To The All Articles
    [Documentation]    Navigate to the Tutorilas within the Blog
    Wait Until Page Contains Element    ${ALL_ARTICLES}
    Tolerant Click   ${ALL_ARTICLES}

Check All Articles
    [Documentation]    Checks and clicks all cards available in the fist page of Test Bench..
    Navigate To Articles    Shape your testing using diagrams
    Go Back
    Navigate To Articles    Manage Cypress Tests With TestBench – Part Two: Inspect And Report Test Results
    Go Back
    Navigate To Articles    Automating Security Tests – Doing Magic With The TestBench-API
    Go Back
    Navigate To Articles   What’s New in Release 2.5
    Go Back
    Navigate To Articles    How To Import Data Tables for Data-Driven Testing
    Go Back
    Navigate To Articles   Everything Is Prepared for You in a TestBench Template
    Go Back
    
# Check All Articles Page Two
#     Navigate To Articles    Let’s Practice Testing!
#     Go Back
#     Navigate To Articles    Synchronize Jira with TestBench
#     Go Back
#     Navigate To Articles   Designing Tests Is All About The Data
#     Go Back
#     Navigate To Articles   This Is How to Do It! Exploratory Testing in TestBench – Part Two
#     Go Back
#     Navigate To Articles    Release-News: What’s New in Release 2.4
#     Go Back
#     Navigate To Articles   Manage and Control Cypress End-to-End System Tests With TestBench
#     Go Back

Navigate To Articles
    [Documentation]    Verifies if all the links works properly.
    [Arguments]    ${article}
    Set Selenium Speed    0.6
    Execute JavaScript    window.scrollTo(0,1100);
    IF    "${article}" == "Shape your testing using diagrams"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[1]
        Click Element                      (//h4[@class= 'h3'])[1]
    ELSE IF    "${article}" == " Manage Cypress Tests With TestBench – Part Two: Inspect And Report Test Results"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[2]
        Click Element                       (//h4[@class= 'h3'])[2]
    ELSE IF    "${article}" == "Automating Security Tests – Doing Magic With The TestBench-API"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[3]
        Click Element                       (//h4[@class= 'h3'])[3]
    ELSE IF    "${article}" == "What’s New in Release 2.5"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[4]
        Click Element                     (//h4[@class= 'h3'])[4]
    ELSE IF    "${article}" == "How To Import Data Tables for Data-Driven Testing"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[5]
        Click Element                     (//h4[@class= 'h3'])[5]
    ELSE IF    "${article}" == "Everything Is Prepared for You in a TestBench Template"
        Wait Until Page Contains Element    (//h4[@class= 'h3'])[6]
        Click Element                       (//h4[@class= 'h3'])[6]
    # ELSE IF    "${article}" == " Let’s Practice Testing!"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[1]
    #     Click Element                       (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[1]
    # ELSE IF    "${article}" == "Synchronize Jira with TestBench"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[2]
    #     Click Element                       (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[3]
    # ELSE IF    "${article}" == "Designing Tests Is All About The Data"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[3]
    #     Click Element                     (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[3]
    # ELSE IF    "${article}" == "This Is How to Do It! Exploratory Testing in TestBench – Part Two"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[4]
    #     Click Element                     (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[4]
    # ELSE IF    "${article}" == "Release-News: What’s New in Release 2.4"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[5]
    #     Click Element                       (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[5]
    # ELSE IF    "${article}" == "Manage and Control Cypress End-to-End System Tests With TestBench"
    #     Wait Until Page Contains Element    (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[6]
    #     Click Element                       (//html[contains(@class, 'search-paged-2')]//h4[contains(@class, 'h3')])[6]
    END

Next Link
    [Documentation]    Click Next link
    # Scroll Element Into View               //div[contains(@class, 'pagination pagination--prevDisabled')]//a
    Execute JavaScript    window.scrollTo(0,9000);
    Wait Until Keyword Succeeds    3x    3s     Wait Until Page Contains Element       //div[contains(@class, 'pagination pagination--prevDisabled')]//a
    Tolerant Click    //div[contains(@class, 'pagination pagination--prevDisabled')]//a
    Wait Until Page Contains Element    //html[contains(@class, 'html blog')]//main//div//h2