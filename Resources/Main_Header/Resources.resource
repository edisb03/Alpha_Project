*** Settings ***
Documentation       Resource

Resource            ../common.resource


*** Variables ***
${TEST_AUTOMATION}          (//h3[@class='h4'])[1]
${DATA_DRIVEN}              (//h3[@class='h4'])[2]
${DEFECT_EXPORT}            (//h3[@class='h4'])[3]
${FAST_SETUP}               (//h3[@class='h4'])[4]
${TA_TITLE}                 //a[@id='user-content-test-case-automation-agent-for-testbenchcs']
${DD_PAGE_TITLE}            //a[@id='user-content-ddt-table-import-via-excel-for-testbench-cs']
${DE_PAGE_TITLE}            //a[@id='user-content-defect-export-via-excel-for-testbench-cs']
${FS_PAGE_TITLE}            //a[@id='user-content-setup-users-along-with-workspaces-in-testbench-cs']


*** Keywords ***
Verify Resources Links
    [Documentation]    Verify Resources Links
    [Arguments]    ${resources_links}
    IF    "${resources_links}" == "Test Automation"
        Page Should Contain Element    ${TEST_AUTOMATION}
        Tolerant Click   ${TEST_AUTOMATION}
    ELSE IF    "${resources_links}" == "Data-Driven Testing"
        Page Should Contain Element    ${DATA_DRIVEN}
        Tolerant Click    ${DATA_DRIVEN}
    ELSE IF    "${resources_links}" == "Defect Export"
        Page Should Contain Element    ${DEFECT_EXPORT}
        Tolerant Click    ${DEFECT_EXPORT} 
    ELSE IF    "${resources_links}" == "Fast Setup"
        Page Should Contain Element    ${FAST_SETUP}
        Tolerant Click    ${FAST_SETUP}
    END

Verify New Automation Page
    [Documentation]    Check for New Page Loaded
    ${handles}  Get Window Handles
    Switch Window    ${handles}[1]

Verify Page Of GitHub
    [Documentation]    Check for the content text of GitHub page
    [Arguments]    ${GitHub_page_tittle}
    IF    '${GitHub_page_tittle}' == "Test Case Automation Agent for TestBench CS"
        Execute JavaScript    window.scrollTo(0,1000);
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${TA_TITLE}
    ELSE IF    "${GitHub_page_tittle}" == "DDT table import via Excel for TestBench CS"
        Execute JavaScript    window.scrollTo(0,500);
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${DD_PAGE_TITLE}
    ELSE IF    "${GitHub_page_tittle}" == "Defect Export via Excel for TestBench CS"
        Execute JavaScript    window.scrollTo(0,500);
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${DE_PAGE_TITLE}
    ELSE IF    "${GitHub_page_tittle}" == "Setup users along with Workspaces in TestBench CS"
        Execute JavaScript    window.scrollTo(0,500);
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${FS_PAGE_TITLE}
    ELSE
        Fail    Unexpected status:  ${GitHub_page_tittle}
    END

 Control If The Page Contains
    [Documentation]    Reusable keyword
    [Arguments]    ${title}
    Page Should Contain    ${title}

Validate Title
    [Documentation]    Scrolls down to the middle of the page
    [Arguments]    ${text}
    Execute JavaScript    window.scrollTo(0,500);
    Page Should Contain    ${text}

Verify Main Header
    [Documentation]    Checks if the main header exits
    Wait Until Page Contains Element    ${MAIN_HEADER}
