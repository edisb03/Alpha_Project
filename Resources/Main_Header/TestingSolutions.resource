*** Settings ***
Documentation       Keywords for Navigation
Resource            ../import.resource


*** Variables ***
${TESTING_SOLUTIONS_ITEM}               (//li[contains(@class, 'menu-item menu-item--has-childs')])[1]
${KEYWORDDRIVEN_TITLE}                  //h1[contains(@class,'h1 has-no-overline')]
${DATADRIVEN_TITLE}                     //h1[contains(@class,'overline')]
${TEST_AUTOMATION_DROP_DOWN}            (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[1]
${TEST_AUTOMATION_TITLE}                //h1[contains(@class, 'h1 has-no-overline')]
${KEYWORD_DRIVEN_TESTING_DROP_DOWN}     (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[2]
${DATA_DRIVEN_TESTING_DROP_DOWN}        (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[3]
#Test Automation Buttons
${LETS_TALK_BTN}                         //div[contains(@id,'anchor-what_is_test_automation?')]//div[@class='cta']
${CONTACT_US_BTN}                        (//a[@class='button button--primary'])[2]
#This variables validates Advantages in automation with TestBench:
${HEADER2_TEST_AUTOMATION_TITLE}        (//div[contains(@class, 'box-inner box-inner--intro text text--lg')])[2]
#Test Automation page list items keywords
${TEST_DESIGN_LINK}        //a[contains(@class, 'h4 acc-0')]
${CASE_GENERATION_LINK}    //a[contains(@class, 'h4 acc-1')]
${PROCESSES_LINK}          //a[contains(@class, 'h4 acc-2')]
${EFFICENT_LINK}           //a[contains(@class, 'h4 acc-3')]
${FAST_LINK}               //a[contains(@class, 'h4 acc-4')]
${NO_BORDERS_LINK}         //a[contains(@class, 'h4 acc-5')]
${SECURING_LINK}           //a[contains(@class, 'h4 acc-6')]
${TB_HOW_TO_DO_IT}         (//div[contains(@class, 'box-inner box-inner--intro text text--lg')]//h2)[3]
#Keywords for List items description
${TEST_DESIGN_CONTENT}        //div[contains(@id, 'acc-0')]
${CASE_GENERATION_CONTENT}    //div[contains(@id, 'acc-1')]
${PROCESSES_CONTENT}          //div[contains(@id, 'acc-2')]
${EFFICENT_CONTENT}           //div[contains(@id, 'acc-3')]
${FAST_CONTENT}               //div[contains(@id, 'acc-4')]
${NO_BORDERS_CONTENT}         //div[contains(@id, 'acc-5')]
${SECURING_CONTENT}           //div[contains(@id, 'acc-6')]


*** Keywords ***
Navigate To Testing Solutions
    [Documentation]    This keyword is used to  navigate to testins solutions 
    Wait Until Page Contains Element    ${TESTING_SOLUTIONS_ITEM}
    Tolerant Click   ${TESTING_SOLUTIONS_ITEM}

Verify Testing Solution Drop Items
    [Documentation]    This keyword is used to navigate to Testing Solution, we have 3 option and we will call
    ...    with arguments. Test automation, Keyword Driven Testing, Data Driven Testing.
    [Arguments]     ${testing_solution}
    IF    "${testing_solution}" == "Testing automation"
        Wait Until Page Contains Element   ${TEST_AUTOMATION_DROP_DOWN}
        Tolerant Click    ${TEST_AUTOMATION_DROP_DOWN}
        Sleep    2s
    ELSE IF    "${testing_solution}" == "Keyword Driven Testing"
        Wait Until Page Contains Element    ${KEYWORD_DRIVEN_TESTING_DROPDOWN}
        Tolerant Click    ${KEYWORD_DRIVEN_TESTING_DROPDOWN}
    ELSE IF    "${testing_solution}" == "Data Driven Testing"
        Wait Until Page Contains Element    ${DATA_DRIVEN_TESTING_DROP_DOWN}
        Tolerant Click    ${DATA_DRIVEN_TESTING_DROP_DOWN}
    END

 Check If The Page Contains Elements
    [Documentation]    Reusable keyword
    [Arguments]    ${title}
    IF    "${title}" == "Test automation"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${TEST_AUTOMATION_TITLE}
    ELSE IF    "${title}" == "Keyword Driven Testing"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${KEYWORDDRIVEN_TITLE}
    ELSE IF    "${title}" == "Data Driven Testing"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${DATA_DRIVEN_TESTING}
    ELSE IF    "${title}" == "INTEGRATION IN THE TESTBENCH"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${INTEGRATION_TITLE}
    ELSE IF    "${title}" == "Your Wizard for the manual execution of tests"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${ITORX_TITLE}
    ELSE IF    "${title}" == "The test management and test design features"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${CARD_SECTION_TITLE}
    ELSE IF    "${title}" == "New!"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${NEW!_TITLE}
    ELSE IF    "${title}" == "Your Wizard for the manual execution of tests"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${iTORX_PAGE_TITLE}
    ELSE IF     "${title}" == "Advantages in automation with TestBench"
        Wait Until Page Contains Element    ${HEADER2_TEST_AUTOMATION_TITLE}
    ELSE IF     "${title}" == "The road to efficiency"
        Wait Until Page Contains Element    ${ROAD_EFFICIENCY_TITLE}
    ELSE IF     "${title}" == "Keyworddriven Testing"
        Wait Until Page Contains Element    ${KDRIVEN_TESTING_TITLE}
    ELSE IF     "${title}" == "What our customers say"
        Wait Until Page Contains Element    ${TESTIMONIALS_TITLE}
    ELSE IF     "${title}" == "Varying tests by using test data"
        Wait Until Page Contains Element    ${DDRIVEN_TESTING_TITLE}
    ELSE IF     "${title}" == "Work with any tool landscape"
        Wait Until Page Contains Element    ${INTEGRATION_SUBTITLE}
    ELSE IF     "${title}" == "Automated testing for more efficiency"
        Wait Until Page Contains Element    ${TESTAUTOMATION_SUBTITLE}
    ELSE IF     "${title}" == "This is how test automation works"
        Scroll Element Into View     ${TB_HOW_TO_DO_IT}
        Wait Until Keyword Succeeds    3x    3s    Page Should Contain Element    ${TB_HOW_TO_DO_IT}
    ELSE
        Fail    Unexpected status: ${title}
    END

Navigate To Test Automation List Item
    [Documentation]    Verifies if all the list items work are shown and they are clickable
    [Arguments]    ${card_links}
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1200);
    IF    "${card_links}" == "Testdesign"
        Page Should Contain Element        ${TEST_DESIGN_LINK}
        Wait Until Page Contains Element    ${TEST_DESIGN_CONTENT}
    ELSE IF    "${card_links}" == "Test case generation"
        Page Should Contain Element         ${CASE_GENERATION_LINK}
        Wait Until Page Contains Element    ${CASE_GENERATION_CONTENT}
    ELSE IF    "${card_links}" == "Processes"
        Wait Until Page Contains Element    ${PROCESSES_LINK}
        Tolerant Click                      ${PROCESSES_LINK}
        Wait Until Page Contains Element    ${PROCESSES_CONTENT}
    ELSE IF    "${card_links}" == "Efficient"
        Wait Until Page Contains Element    ${EFFICENT_LINK}
        Tolerant Click                      ${EFFICENT_LINK}
        Wait Until Page Contains Element    ${EFFICENT_CONTENT}
    ELSE IF    "${card_links}" == "Fast"
        Wait Until Page Contains Element    ${FAST_LINK}
        Tolerant Click                      ${FAST_LINK}
        Wait Until Page Contains Element    ${FAST_CONTENT}
    ELSE IF    "${card_links}" == "No borders"
        Wait Until Page Contains Element    ${NO_BORDERS_LINK}
        Tolerant Click                      ${NO_BORDERS_LINK}
        Wait Until Page Contains Element    ${NO_BORDERS_CONTENT}
    ELSE IF    "${card_links}" == "Securing"
        Wait Until Page Contains Element    ${SECURING_LINK}
        Tolerant Click                      ${SECURING_LINK}
        Wait Until Page Contains Element    ${SECURING_CONTENT}
    END

Test Automation List Items Box Verification
    [Documentation]    Checks and clicks all cards available in the first page of Test Bench..
    Navigate To Test Automation List Item    Testdesign
    Navigate To Test Automation List Item    Processes
    Navigate To Test Automation List Item    Test case generation
    Navigate To Test Automation List Item    Efficient
    Navigate To Test Automation List Item    Fast
    Navigate To Test Automation List Item    No borders
    Navigate To Test Automation List Item    Securing

Navigate To Test Automation Blocks
    [Documentation]    Verifies if all the list items work are shown and they are clickable
    [Arguments]    ${block}
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,3500);
    IF    "${block}" == "Test blocks of the TestBench and blocks of the library of the test automat:"
        Scroll Element Into View    (//h2[@class='h3'])[1]
        Page Should Contain Element        (//h2[@class='h3'])[1]
    ELSE IF    "${block}" == "Assembling tests:"
        Scroll Element Into View    (//h2[@class='h3'])[2]
        Page Should Contain Element        (//h2[@class='h3'])[2]
    ELSE IF    "${block}" == "Test planning in the TestBench:"
        Scroll Element Into View    (//h2[@class='h3'])[3]
        Page Should Contain Element        (//h2[@class='h3'])[3]
    ELSE IF    "${block}" == "Start test execution:"
        Scroll Element Into View    (//h2[@class='h3'])[4]
        Page Should Contain Element        (//h2[@class='h3'])[4]
    ELSE IF    "${block}" == "Execute automation:"
        Scroll Element Into View    (//h2[@class='h3'])[5]
        Page Should Contain Element        (//h2[@class='h3'])[5]
    ELSE IF    "${block}" == "Return of results and evaluation:"
        Scroll Element Into View    (//h2[@class='h3'])[6]
        Page Should Contain Element        (//h2[@class='h3'])[6]
    END

Test Automation Blocks Verification
    [Documentation]    Checks six blocks in Testing Automation page.
    Navigate To Test Automation Blocks    Test blocks of the TestBench and blocks of the library of the test automat:
    Navigate To Test Automation Blocks    Assembling tests:
    Navigate To Test Automation Blocks    Test planning in the TestBench:
    Navigate To Test Automation Blocks    Start test execution:
    Navigate To Test Automation Blocks    Execute automation:
    Navigate To Test Automation Blocks    Return of results and evaluation:
