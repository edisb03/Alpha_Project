*** Settings ***
Documentation    Blog

Resource        ../import.resource


*** Variables ***
${SEARCH_BAR}                     (//input[@id='s'])[1]
${SEARCH_ICON}                    //input[@id='searchsubmit']
### ARTICLES AT ALL ARTICLES FIRST PAGE ###
${ALL_ARTICLES}                   //div[@class='button button--tab active']//a[@class='menu-link']
${SHAPE_YOUR_TESTING}            (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[1]
${MANAGE_CYPRES_PART_TWO}        (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[2]
${AUTOMATING_SECURITY_TESTS}     (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[3]
${RELEASE_2.5}                   (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[4]
${HOW_TO_IMPORT_DT}              (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[5]
${EVERYTHING_IS_PREP}            (//html[contains(@class, 'html blog')]//h4[contains(@class, 'h3')])[6]
### ARTICLES AT ALL ARTICLES SECOND PAGE ###
${LETS_PRACTICE_TESTING}         (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[1]
${SYNC_JIRA_}                    (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[2]
${DESIGNING_TESTS}               (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[3]
${EXP_TEST_PART_TWO}             (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[4]
${RELEASE_NEWS_2.4}              (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[5]
${MANAGE_CONTROL_CYPRESS}        (//html[contains(@class, 'html blog paged paged-2')]//h4[contains(@class, 'h3')])[6]
### ARTICLES AT ALL ARTICLES THIRD PAGE ###
${EXP_TEST}                      (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[1]
${VIRTUAL_SHOW_ROOM}             (//html[contains(@class, 'html blog paged paged-3')]//a[contains(@href, 'https://www.testbench.com/blog/what-if-there-would')][1])[1]
${INDIVIDUAL_TEST_API}           (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[3]
${BABEL_FISH}                    (//html[contains(@class, 'html blog paged paged-3')]//h4[contains(@class, 'h3')])[4]
### Next link in the first page of All articles ###
${NEXT_LINK}                     //div[contains(@class, 'pagination pagination--prevDisabled')]//a
### Next link in the SECOND page of All articles ###
${NEXT_LINK_PAGE2}               (//div[contains(@class, 'pagination')]//a)[2]

${TITLE_OF_PAGE_TWO_BLOG}        //html[contains(@class, 'html blog paged paged-2')]//main//div//h2
${TITLE_OF_PAGE_THREE_BLOG}      //html[contains(@class, 'html blog paged paged-3')]//main//div//h2

${FEATURED_ART_SLIDE1}           //div[@class='swiper-slide swiper-slide-active']//span[@aria-label='Go to slide 1']
${SLIDE1_TITLE}                  (//div[contains(@class, 'slide-content')]//h4[contains(@class, 'h2')]//a[contains(@href, 'https://www.testbench.com/blog/manage')])[1]
${FEATURED_ART_SLIDE2}           //div[@class='swiper-slide swiper-slide-active']//span[@aria-label='Go to slide 2']
${SLIDE2_TITLE}                  (//div[contains(@class, 'slide-content')]//h4[contains(@class, 'h2')]//a[contains(@href, 'https://www.testbench.com/blog/auto')])[1]
${FEATURED_ART_SLIDE3}           //div[@class='swiper-slide swiper-slide-active']//span[@aria-label='Go to slide 3']
${SLIDE3_TITLE}                  (//div[contains(@class, 'slide-content')]//h4[contains(@class, 'h2')]//a[contains(@href, 'https://www.testbench.com/blog/')])[1]


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
    Navigate To Articles    What's New in Release 2.5
    Go Back
    Navigate To Articles    How To Import Data Tables for Data-Driven Testing
    Go Back
    Navigate To Articles    Everything Is Prepared for You in a TestBench Template
    Go Back

Navigate To Articles
    [Documentation]    Verifies if all the links of articles works properly in first page under all articles.
    [Arguments]    ${article}
    Set Selenium Speed    0.9
    IF    "${article}" == "Shape your testing using diagrams"
        Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    ${SHAPE_YOUR_TESTING}
        Click Element                       ${SHAPE_YOUR_TESTING}
    ELSE IF    "${article}" == "Manage Cypress Tests With TestBench Part Two: Inspect And Report Test Results"
        Wait Until Page Contains Element    ${MANAGE_CYPRES_PART_TWO}
        Click Element                       ${MANAGE_CYPRES_PART_TWO}
    ELSE IF    "${article}" == "Automating Security Tests Doing Magic With The TestBench-API"
        Wait Until Page Contains Element    ${AUTOMATING_SECURITY_TESTS}
        Click Element                       ${AUTOMATING_SECURITY_TESTS}
    ELSE IF    "${article}" == "What's New in Release 2.5"
        Wait Until Page Contains Element    ${RELEASE_2.5}
        Click Element                       ${RELEASE_2.5}
    ELSE IF    "${article}" == "How To Import Data Tables for Data-Driven Testing"
        Scroll Element Into View            ${HOW_TO_IMPORT_DT}
        Wait Until Page Contains Element    ${HOW_TO_IMPORT_DT}
        Click Element                       ${HOW_TO_IMPORT_DT}
    ELSE IF    "${article}" == "Everything Is Prepared for You in a TestBench Template"
        Scroll Element Into View            ${EVERYTHING_IS_PREP}
        Wait Until Page Contains Element    ${EVERYTHING_IS_PREP}
        Click Element                       ${EVERYTHING_IS_PREP}
    END

Check All Articles Page Two
    [Documentation]    Checks and clicks all cards available under second page of All Articles.
    Navigate To Articles Page Two    Lets Practice Testing!
    Go Back
    Navigate To Articles Page Two    Synchronize Jira with TestBench
    Go Back
    Navigate To Articles Page Two    Designing Tests Is All About The Data
    Go Back
    Navigate To Articles Page Two    This Is How to Do It! Exploratory Testing in TestBench Part Two
    Go Back
    Navigate To Articles Page Two    Release-News: Whats New in Release 2.4
    Go Back
    Navigate To Articles Page Two    Manage and Control Cypress End-to-End System Tests With TestBench
    Go Back

Navigate To Articles Page Two
    [Documentation]    Verifies if all the links of articles works properly in second page under all articles.
    [Arguments]    ${article2}
    Set Selenium Speed    0.9
    IF    "${article2}" == "Lets Practice Testing!"
        Execute JavaScript    window.scrollTo(0,1200);
        Wait Until Page Contains Element    ${LETS_PRACTICE_TESTING}
        Click Element                       ${LETS_PRACTICE_TESTING}
    ELSE IF    "${article2}" == "Synchronize Jira with TestBench"
        Wait Until Page Contains Element    ${SYNC_JIRA_}
        Click Element                       ${SYNC_JIRA_}
    ELSE IF    "${article2}" == "Designing Tests Is All About The Data"
        Wait Until Page Contains Element    ${DESIGNING_TESTS}
        Click Element                       ${DESIGNING_TESTS}
    ELSE IF    "${article2}" == "This Is How to Do It! Exploratory Testing in TestBench Part Two"
        Wait Until Page Contains Element    ${EXP_TEST_PART_TWO}
        Click Element                       ${EXP_TEST_PART_TWO}
    ELSE IF    "${article2}" == "Release-News: Whats New in Release 2.4"
        Wait Until Page Contains Element    ${RELEASE_NEWS_2.4}
        Click Element                       ${RELEASE_NEWS_2.4}
    ELSE IF    "${article2}" == "Manage and Control Cypress End-to-End System Tests With TestBench"
        Wait Until Page Contains Element    ${MANAGE_CONTROL_CYPRESS}
        Click Element                       ${MANAGE_CONTROL_CYPRESS}
    END

Check All Articles Page Three
    [Documentation]        Checks and clicks all cards available under third page of All Articles.
    ${articles_content}=    Get File    ${JSON_ARTICLE_PATH}
    ${card_1}=    Evaluate   json.loads('''${articles_content}''')['card_1']    json
    Navigate To Articles Page Three    card_1
    Go Back
    Sleep    5s
    ${card_2}=    Evaluate   json.loads('''${articles_content}''')['card_2']    json
    Navigate To Articles Page Three    card_2
    Go Back
    Sleep    2s
    ${card_3}=    Evaluate   json.loads('''${articles_content}''')['card_3']    json
    Navigate To Articles Page Three    card_3
    Go Back
    Sleep    2s
    ${card_4}=    Evaluate   json.loads('''${articles_content}''')['card_4']    json
    Navigate To Articles Page Three   card_4
    Go Back

Navigate To Articles Page Three
    [Documentation]    Verifies if all the links of articles works properly in third page under all articles.
    [Arguments]    ${article3}
    IF    "${article3}" == "card_1"
        Scroll Element Into View            ${EXP_TEST}
        Wait Until Page Contains Element    ${EXP_TEST}
        Click Element                       ${EXP_TEST}
    ELSE IF    "${article3}" == "card_2"
        Scroll Element Into View            ${VIRTUAL_SHOW_ROOM}
        Wait Until Page Contains Element    ${VIRTUAL_SHOW_ROOM}
        Click Element                       ${VIRTUAL_SHOW_ROOM}
    ELSE IF    "${article3}" == "card_3"
        Scroll Element Into View            ${INDIVIDUAL_TEST_API}
        Wait Until Page Contains Element    ${INDIVIDUAL_TEST_API}
        Click Element                       ${INDIVIDUAL_TEST_API}
    ELSE IF    "${article3}" == "card_4"
        Scroll Element Into View            ${BABEL_FISH}
        Wait Until Page Contains Element    ${BABEL_FISH}
        Click Element                       ${BABEL_FISH}
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

Blog Tab Name
    [Documentation]    Name of the Blog tab
    [Arguments]    ${names_in_tab}
    ${tab_names}=    Get Window Titles
    Log    The current tab name is: ${tab_names[0]}
    ${name_in_tabs_converted}=    Convert To String    ${names_in_tab}
    Should Be Equal As Strings   ${name_in_tabs_converted}    ${tab_names[0]}

Featured Articles
    [Documentation]    Check featured articles within the All articles
    Wait Until Page Contains Element    ${FEATURED_ART_SLIDE1}
    Click Element    ${FEATURED_ART_SLIDE1}
    Wait Until Page Contains Element    ${SLIDE1_TITLE}
    Wait Until Page Contains Element    ${FEATURED_ART_SLIDE2}
    Click Element    ${FEATURED_ART_SLIDE2}
    Wait Until Page Contains Element    ${SLIDE2_TITLE}
    Wait Until Page Contains Element    ${FEATURED_ART_SLIDE3}
    Click Element    ${FEATURED_ART_SLIDE3}
    Wait Until Page Contains Element    ${SLIDE3_TITLE}