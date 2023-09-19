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

Navigate To The All Articles
    [Documentation]    Navigate to the Tutorilas within the Blog
    Wait Until Page Contains Element    ${ALL_ARTICLES}
    Tolerant Click   ${ALL_ARTICLES}

Check All Articles
    [Documentation]    Checks and clicks all cards available under first page of All Articles.
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

Navigate To Articles
    [Documentation]    Verifies if all the links of articles works properly in first page under all articles.
    [Arguments]    ${article}
    Set Selenium Speed    0.9
    IF    "${article}" == "Shape your testing using diagrams"
        Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[1]
        Page Should Contain Element         (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[1]
        Click Element                      (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[1]
    ELSE IF    "${article}" == "Manage Cypress Tests With TestBench – Part Two: Inspect And Report Test Results"
        # Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[2]
        Page Should Contain Element         (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[2]
        Click Element                       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[2]
    ELSE IF    "${article}" == "Automating Security Tests – Doing Magic With The TestBench-API"
        # Execute JavaScript    window.scrollTo(0,2000);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[3]
        Click Element                       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[3]
    ELSE IF    "${article}" == "What’s New in Release 2.5"
        # Execute JavaScript    window.scrollTo(0,2000);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[4]
        Click Element                       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[4]
    ELSE IF    "${article}" == "How To Import Data Tables for Data-Driven Testing"
        # Execute JavaScript    window.scrollTo(0,2500);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
        Click Element                     (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
    ELSE IF    "${article}" == "Everything Is Prepared for You in a TestBench Template"
        # Execute JavaScript    window.scrollTo(0,2500);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[6]
        Click Element                       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[6]
    END

Check All Articles Page Two
    [Documentation]    Checks and clicks all cards available under second page of All Articles.
    Navigate To Articles Page Two    Let’s Practice Testing!
    Go Back
    Navigate To Articles Page Two    Synchronize Jira with TestBench
    Go Back
    Navigate To Articles Page Two   Designing Tests Is All About The Data
    Go Back
    Navigate To Articles Page Two   This Is How to Do It! Exploratory Testing in TestBench Part Two
    Go Back
    Navigate To Articles Page Two    Release-News: What’s New in Release 2.4
    Go Back
    Navigate To Articles Page Two   Manage and Control Cypress End-to-End System Tests With TestBench
    Go Back

Navigate To Articles Page Two
    [Documentation]    Verifies if all the links of articles works properly in second page under all articles.
    [Arguments]    ${article2}
    Set Selenium Speed    0.9
    IF    "${article2}" == "Let’s Practice Testing!"
        Execute JavaScript    window.scrollTo(0,1000);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[1]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[1]
    ELSE IF    "${article2}" == "Synchronize Jira with TestBench"
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[2]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[2]
    ELSE IF    "${article2}" == "Designing Tests Is All About The Data"
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[3]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[3]
    ELSE IF    "${article2}" == "This Is How to Do It! Exploratory Testing in TestBench Part Two"
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[4]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[4]
    ELSE IF    "${article2}" == "Release-News: What’s New in Release 2.4"
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[5]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[5]
    ELSE IF    "${article2}" == "Manage and Control Cypress End-to-End System Tests With TestBench"
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[6]
        Click Element                       (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[6]
    END

Check All Articles Page Three
    [Documentation]        Checks and clicks all cards available under third page of All Articles.
    Navigate To Articles Page Three    This Is How to Do It! Exploratory Testing in TestBench.
    Go Back
    Sleep    5s
    Navigate To Articles Page Three    From Theory to Practice With the VirtualShowRoom.
    Go Back
    Sleep    2s
    Navigate To Articles Page Three    Individual Test Management Flexibly Expandable per API
    Go Back
    Sleep    2s
    Navigate To Articles Page Three    What if the Babel Fish Existed?
    Go Back

Navigate To Articles Page Three
    [Documentation]    Verifies if all the links of articles works properly in third page under all articles.
    [Arguments]    ${article3}
    Set Selenium Speed    0.9
    IF    "${article3}" == "This Is How to Do It! Exploratory Testing in TestBench."
        Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[1]
        Click Element                       (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[1]
    ELSE IF    "${article3}" == "From Theory to Practice With the VirtualShowRoom."
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-3')]//a[contains(@href, 'https://www.testbench.com/blog/what-if-there-would-be-a-test-object-available-to-anyone-who-wants-to-practice-testing-part-one-move-from-software-testing-theory-to-practice-with-the-virtualshowroom/')][1])[1]
        Click Element                       (//html[contains(@class, 'html blog paged paged-3')]//a[contains(@href, 'https://www.testbench.com/blog/what-if-there-would')][1])[1]
    ELSE IF    "${article3}" == "Individual Test Management Flexibly Expandable per API"
        Execute JavaScript    window.scrollTo(0,1700);
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[3]
        Click Element                       (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[3]
    ELSE IF    "${article3}" == "What if the Babel Fish Existed?"
        Scroll Element Into View    (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[4]
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[4]
        Click Element                       (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[4]
    END

Next Link
    [Documentation]    Click Next link in first page
    Execute JavaScript    window.scrollTo(0,7000);
    Wait Until Keyword Succeeds    3x    3s     Wait Until Page Contains Element       //div[contains(@class, 'pagination pagination--prevDisabled')]//a
    Tolerant Click    //div[contains(@class, 'pagination pagination--prevDisabled')]//a
    Wait Until Page Contains Element    //html[contains(@class, 'html blog paged paged-2')]//main//div//h2
    Sleep    3s

Next Link Page Two
    [Documentation]    Click Next link in second page
    Execute JavaScript    window.scrollTo(0,7000);
    Wait Until Keyword Succeeds    3x    3s     Wait Until Page Contains Element       (//div[contains(@class, 'pagination')]//a)[2]
    Tolerant Click    (//div[contains(@class, 'pagination')]//a)[2]
    Wait Until Page Contains Element    //html[contains(@class, 'html blog paged paged-3')]//main//div//h2
    Sleep    1s