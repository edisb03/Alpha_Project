*** Settings ***
Documentation       Features

Resource    ../import.resource


*** Variables ***
${REQUIREMENTS_MANAGEMENT_FEATURES}              (//h2[@class='h3'])[1]
${TEST_MANAGEMENT_FEATURES}                      (//h2[@class='h3'])[2]
${TEST_DESIGN_FEATURES}                          (//h2[@class='h3'])[3]
${TEST_EXECUTION_FEATURES}                       (//h2[@class='h3'])[4]
${TEST_AUTOMATION_FEATURES}                      (//h2[@class='h3'])[5]
${TEST_COLLABORATION_FEATURES}                   (//h2[@class='h3'])[6]
${CUSTOMIZATION_FEATURES}                        (//h2[@class='h3'])[7]
${INTEGRATION_FEATURES}                          (//h2[@class='h3'])[8]
${TRY_TESTBENCH_NOW}                             (//div[@class='box-inner box-inner--cta'])[1]//a[1]
${TRY_EXPLORTORY_TESTING}                        //div[@class='box box--imageRight']//div[@class='cta']//a[2]
${TRY_DATA-DRIVEN_TESTING}                       (//div[@class='cta'])[2]//a[2]
${LEARN_MORE}                                    //div[@class='box box--imageRight']//div[@class='cta']//a[1]
${LEARN_MORE_DATA}                               //div[@class='box box--imageLeft']//div[@class='cta']//a[1]


*** Keywords ***
Verify Content Features
    [Documentation]    Navigate to Requirements Management within Features
    Execute JavaScript    window.scrollTo(0,1000);
    Wait Until Page Contains Element    ${REQUIREMENTS_MANAGEMENT_FEATURES}
    Execute JavaScript    window.scrollTo(0,1500);
    Wait Until Page Contains Element    ${TEST_MANAGEMENT_FEATURES}
    Execute JavaScript    window.scrollTo(0,2300);
    Wait Until Page Contains Element    ${TEST_DESIGN_FEATURES}
    Execute JavaScript    window.scrollTo(0,3000);
    Wait Until Page Contains Element    ${TEST_EXECUTION_FEATURES}
    Execute JavaScript    window.scrollTo(0,4000);
    Wait Until Page Contains Element    ${TEST_AUTOMATION_FEATURES}
    Execute JavaScript    window.scrollTo(0,4800);
    Wait Until Page Contains Element    ${TEST_COLLABORATION_FEATURES}
    Execute JavaScript    window.scrollTo(0,5500);
    Wait Until Page Contains Element    ${CUSTOMIZATION_FEATURES}
    Execute JavaScript    window.scrollTo(0,6200);
    Wait Until Page Contains Element    ${INTEGRATION_FEATURES}

Try TestBench Now
    [Documentation]    Navigate to Try Testbench Now button
    Execute JavaScript    window.scrollTo(0,7200);
    Wait Until Page Contains Element    ${TRY_TESTBENCH_NOW}
    Wait Until Keyword Succeeds    3x    3s    Click Element    ${TRY_TESTBENCH_NOW}
    Control If The MH Page Contains    Get started with a free account

Try Exploratory Testing
    [Documentation]    Navigate to Try Exploratory Testing button
    Execute JavaScript    window.scrollTo(0,7900);
    Wait Until Page Contains Element    ${TRY_EXPLORTORY_TESTING}
    Sleep    1s
    Tolerant Click   ${TRY_EXPLORTORY_TESTING}
    Control If The MH Page Contains    Get started with a free account

Navigate To Learn More Exploratory Testing
    [Documentation]    Scrolls down to the middle of the page
    ...    finds the Learn More Function and Clicks on it.
    [Arguments]    ${Learn_More_1}
    Execute JavaScript    window.scrollTo(0,7800);
    Wait Until Page Contains Element   ${LEARN_MORE}
    Tolerant Click                     ${LEARN_MORE}

Navigate To Learn More Data Driven
    [Documentation]    Scrolls down to the middle of the page
    ...    finds the Learn More Function and Clicks on it
    [Arguments]    ${Learn_More_2}
    Set Selenium Speed    0.2
    Execute JavaScript    window.scrollTo(0,9000);
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains Element    ${LEARN_MORE_DATA}
    Tolerant Click                      ${LEARN_MORE_DATA}

Try Data-Driven Testing
    [Documentation]    Navigate to Try Data-Driven Testing button
    Execute JavaScript    window.scrollTo(0,8800);
    Wait Until Element Is Visible    ${TRY_DATA-DRIVEN_TESTING}
    Click Element    ${TRY_DATA-DRIVEN_TESTING}
    Control If The MH Page Contains    Get started with a free account

Control If The MH Page Contains
    [Documentation]    Navigate to Try Data-Driven Testing button
    [Arguments]    ${status}
    IF    "${status}" == "Explore. Learn. Create. Execute. Improve."
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EXPLORE_LERAN...TITLE}
    ELSE IF    "${status}" == "Let the Data Do All Your Testing"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EXPLORE_LERAN...TITLE}
    ELSE IF    "${status}" == "Welcome to the World of Testing"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${BLOG_PAGE_TITLE}
    ELSE IF    "${status}" == "The Smart Test Management Tool"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${FIRST_HEADER}
    ELSE IF    "${status}" == "What You Can Do With TestBench"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${SUBTITLE_TESTBENCH}
    ELSE IF    "${status}" == "Get started with a free account"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${GET_STARTED_WITH_FREE_ACCOUNT}
    ELSE IF    "${status}" == "Our Portfolio and trend topics"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${IMBUS_PAGE_TITTLE}
    ELSE IF    "${status}" == "Discover the features"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${FEATURES_PAGE_TITTLE}
    ELSE IF    "${status}" == "Find it quick - Use it right away"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element   ${RESOURCES_PAGE_TITTLE}
    ELSE
        Fail    Unexpected status: ${status}
    END
