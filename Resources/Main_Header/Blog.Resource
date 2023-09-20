*** Settings ***
Documentation    Blog

Resource        ../import.resource


*** Variables ***
${SEARCH_BAR}                  (//input[@id='s'])[1]
${SEARCH_ICON}                 //input[@id='searchsubmit']
### ARTICLES AT ALL ARTICLES FIRST PAGE ###
${ALL_ARTICLES}                //div[@class='button button--tab active']//a[@class='menu-link']
${SHAPE_YOUR...}               (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[1]
${MANAGE_CYPRES_1...}            (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[2]
${AUTOMATING_SECURITY...}      (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[3]
${WHATS_NEWS...}               (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[4]
${HOW_TO_IMPORT...}            (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
${EVERYTHING_IS_PREP...}       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[6]
### ARTICLES AT ALL ARTICLES SECOND PAGE ###
${LETS_PRACTICE_...}           (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[1]
${SYNC_JIRA_...}               (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[2]
${DESIGNING_TESTS_...}         (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[3]
${EXP_TEST_PART_TWO}           (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[4]
${RELEASE_NEWS_...}            (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[5]
${MANAGE_CONTROL_...}          (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[6]
### ARTICLES AT ALL ARTICLES THIRD PAGE ###
${EXP_TEST_...}                (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[1]
${FROM_THEORY_...}             (//html[contains(@class, 'html blog paged paged-3')]//a[contains(@href, 'https://www.testbench.com/blog/what-if-there-would')][1])[1]
${INDIVIDUAL_TEST_...}         (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[3]
${WHAT_IF_...}                 (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[4]
### Next link in the first page of All articles ###
${NEXT_LINK}                   //div[contains(@class, 'pagination pagination--prevDisabled')]//a
### Next link in the SECOND page of All articles ###
${NEXT_LINK_PAGE2}             (//div[contains(@class, 'pagination')]//a)[2]

${TITLE_OF_PAGE_TWO_BLOG}      //html[contains(@class, 'html blog paged paged-2')]//main//div//h2
${TITLE_OF_PAGE_THREE_BLOG}    //html[contains(@class, 'html blog paged paged-3')]//main//div//h2


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
    Navigate To Articles    Manage Cypress Tests With TestBench Part Two: Inspect And Report Test Results
    Go Back
    Navigate To Articles    Automating Security Tests Doing Magic With The TestBench-API
    Go Back
    Navigate To Articles   What's New in Release 2.5
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
        Wait Until Page Contains Element    ${SHAPE_YOUR...}
        Click Element                       ${SHAPE_YOUR...}
    ELSE IF    "${article}" == "Manage Cypress Tests With TestBench Part Two: Inspect And Report Test Results"
        Wait Until Page Contains Element    ${MANAGE_CYPRES_1...}  
        Click Element                       ${MANAGE_CYPRES_1...}  
    ELSE IF    "${article}" == "Automating Security Tests Doing Magic With The TestBench-API"
        Wait Until Page Contains Element    ${AUTOMATING_SECURITY...}
        Click Element                       ${AUTOMATING_SECURITY...}
    ELSE IF    "${article}" == "What's New in Release 2.5"
        Wait Until Page Contains Element    ${WHATS_NEWS...}
        Click Element                       ${WHATS_NEWS...}
    ELSE IF    "${article}" == "How To Import Data Tables for Data-Driven Testing"
        Scroll Element Into View            (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
        Wait Until Page Contains Element    (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
        Click Element                       (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
    ELSE IF    "${article}" == "Everything Is Prepared for You in a TestBench Template"
        Scroll Element Into View            ${EVERYTHING_IS_PREP...}
        Wait Until Page Contains Element    ${EVERYTHING_IS_PREP...}
        Click Element                       ${EVERYTHING_IS_PREP...}
    END

Check All Articles Page Two
    [Documentation]    Checks and clicks all cards available under second page of All Articles.
    Navigate To Articles Page Two    Lets Practice Testing!
    Go Back
    Navigate To Articles Page Two    Synchronize Jira with TestBench
    Go Back
    Navigate To Articles Page Two   Designing Tests Is All About The Data
    Go Back
    Navigate To Articles Page Two   This Is How to Do It! Exploratory Testing in TestBench Part Two
    Go Back
    Navigate To Articles Page Two    Release-News: Whats New in Release 2.4
    Go Back
    Navigate To Articles Page Two   Manage and Control Cypress End-to-End System Tests With TestBench
    Go Back

Navigate To Articles Page Two
    [Documentation]    Verifies if all the links of articles works properly in second page under all articles.
    [Arguments]    ${article2}
    Set Selenium Speed    0.9
    IF    "${article2}" == "Let’s Practice Testing!"
        Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    ${LETS_PRACTICE_...}
        Click Element                       ${LETS_PRACTICE_...}
    ELSE IF    "${article2}" == "Synchronize Jira with TestBench"
        Wait Until Page Contains Element    ${SYNC_JIRA_...}
        Click Element                       ${SYNC_JIRA_...}
    ELSE IF    "${article2}" == "Designing Tests Is All About The Data"
        Wait Until Page Contains Element    ${DESIGNING_TESTS_...}
        Click Element                       ${DESIGNING_TESTS_...}
    ELSE IF    "${article2}" == "This Is How to Do It! Exploratory Testing in TestBench Part Two"
        Wait Until Page Contains Element    ${EXP_TEST_PART_TWO}
        Click Element                       ${EXP_TEST_PART_TWO}
    ELSE IF    "${article2}" == "Release-News: What’s New in Release 2.4"
        Wait Until Page Contains Element    ${RELEASE_NEWS_...}
        Click Element                       ${RELEASE_NEWS_...}
    ELSE IF    "${article2}" == "Manage and Control Cypress End-to-End System Tests With TestBench"
        Wait Until Page Contains Element    ${MANAGE_CONTROL_...} 
        Click Element                       ${MANAGE_CONTROL_...} 
    END

Check All Articles Page Three
    [Documentation]        Checks and clicks all cards available under third page of All Articles.
    ${articles_content}=    Get File    ${JSON_ARTICLE_PATH}
    ${option_1}=    Evaluate   json.loads('''${articles_content}''')['option_1']    json
    Navigate To Articles Page Three    option_1
    Go Back
    Sleep    5s
    ${option_2}=    Evaluate   json.loads('''${articles_content}''')['option_2']    json
    Navigate To Articles Page Three    option_2
    Go Back
    Sleep    2s
    ${option_3}=    Evaluate   json.loads('''${articles_content}''')['option_3']    json
    Navigate To Articles Page Three    option_3
    Go Back
    Sleep    2s
    ${option_4}=    Evaluate   json.loads('''${articles_content}''')['option_4']    json
    Navigate To Articles Page Three   option_4
    Go Back

Navigate To Articles Page Three
    [Documentation]    Verifies if all the links of articles works properly in third page under all articles.
    [Arguments]    ${article3}
    IF    "${article3}" == "option_1"
        Scroll Element Into View            ${EXP_TEST_...}
        Wait Until Page Contains Element    ${EXP_TEST_...}
        Click Element                       ${EXP_TEST_...}
    ELSE IF    "${article3}" == "option_2" 
        Scroll Element Into View            ${FROM_THEORY_...} 
        Wait Until Page Contains Element    ${FROM_THEORY_...} 
        Click Element                       ${FROM_THEORY_...} 
        Scroll Element Into View            ${INDIVIDUAL_TEST_...}
        Wait Until Page Contains Element    ${INDIVIDUAL_TEST_...}
        Click Element                       ${INDIVIDUAL_TEST_...}
    ELSE IF    "${article3}" == "option_4"
        Scroll Element Into View            ${WHAT_IF_...}
        Wait Until Page Contains Element    ${WHAT_IF_...}
        Click Element                       ${WHAT_IF_...}
    END

Next Link
    [Documentation]    Click Next link in first page of all articles within Blog
    Execute JavaScript    window.scrollTo(0,7000);
    Wait Until Keyword Succeeds    3x    3s     Wait Until Page Contains Element       ${NEXT_LINK}
    Tolerant Click    ${NEXT_LINK} 
    Wait Until Page Contains Element    ${TITLE_OF_PAGE_TWO_BLOG}
    Sleep    3s

Next Link Page Two
    [Documentation]    Click Next link in second page of all articles within Blog
    Execute JavaScript    window.scrollTo(0,7000);
    Wait Until Keyword Succeeds    3x    3s     Wait Until Page Contains Element       ${NEXT_LINK_PAGE2} 
    Tolerant Click    ${NEXT_LINK_PAGE2}
    Wait Until Page Contains Element    ${TITLE_OF_PAGE_THREE_BLOG}
    Sleep    1s
