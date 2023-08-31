*** Settings ***
Documentation       Resource

Resource            ../common.resource


*** Variables ***
${TEST_AUTO}                //h3[contains(text(),'Test Automation')]
${DATA_DRIVEN}              //h3[contains(text(),'Data-Driven Testing')]
${DEFECT_REPORT}            //h3[contains(text(),'Export')]
${FAST_SETUP}               //h3[contains(text(),'Fast Setup')]
${AUTOMATION_PAGE_TITLE}    //a[@id='user-content-test-case-automation-agent-for-testbenchcs']
${DD_PAGE_TITLE}            //a[@id='user-content-ddt-table-import-via-excel-for-testbench-cs']


*** Keywords ***
Verify Resources Links
    [Documentation]    Verify Resources Links
    [Arguments]    ${resources_links}
    IF    "${resources_links}" == "Test Automation"
        Page Should Contain    Test Automation
        Sleep    2s
        Click Element    ${TEST_AUTO}
        Verify New Automation Page
    ELSE IF    "${resources_links}" == "Data-Driven Testing"
        Page Should Contain    Data-Driven Testing
        Sleep    2s
        Click Element    ${DATA_DRIVEN}
        Verify New Data-Driven Page
    ELSE IF    "${resources_links}" == "Defect Export"
        Page Should Contain    Defect    Export
        Sleep    2s
        Click Element    ${DEFECT_REPORT}
    ELSE IF    "${resources_links}" == "Fast Setup"
        Page Should Contain    Fast Setup
        Sleep    2s
        Click Element    ${FAST_SETUP}
    END

Verify New Automation Page
    [Documentation]    Check for New Page Loaded
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Identify Text On The Automation Page
    ${windows}    Get Window Handles
    Switch Window    ${windows}[0]

Identify Text On The Automation Page
    [Documentation]    Check for the content text
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1000);
    Wait Until Page Contains Element    ${AUTOMATION_PAGE_TITLE}

Verify New Data-Driven Page
    [Documentation]    Check for New Page Loaded
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Identify Text On New Data Driven Page
    ${windows}    Get Window Handles
    Switch Window    ${windows}[0]

Identify Text On New Data Driven Page
    [Documentation]    Check for the content text of Data driven
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1000);
    Wait Until Page Contains Element    ${DD_PAGE_TITLE}

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

Test Api
    [Documentation]    Checks the status codes
    ${status}    check_api_status
    IF  ${status} == 200
        Succesfull Results
    ELSE
        Not Succesfull Results
    END

Succesfull Results
    [Documentation]    Message should be 200
    Log    API Response Status Code is 200

Not Succesfull Results
    [Documentation]    Message its not 200 value
    Log    API Response Status Code is not 200
