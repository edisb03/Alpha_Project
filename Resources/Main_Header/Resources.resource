*** Settings ***
Documentation    Resource

Resource         ../common.resource


*** Variables ***
${AUTOMATED_GET_STARTED}    (//a[contains (@href, 'https://github.com/testbench-cs-imbus/automation')])[1]
${DD_GET_STARTED}		    (//a[contains (@href, 'https://github.com/testbench-cs-imbus/automation')])[2]
${DE_GET_STARTED}			(//a[contains (@href, 'https://github.com/testbench-cs-imbus/automation')])[3]
${FS_GET_STARTED}			(//a[contains (@href, 'https://github.com/testbench-cs-imbus/automation')])[4]


*** Keywords ***
Resources Links Works
    [Documentation]    Verify Resources Links
    [Arguments]    ${resources_links}
    IF  "${resources_links}" == "Test Automation"
        Page Should Contain    Test Automation
        Sleep    3
        Click Element   //h3[contains(text(),'Test Automation')]
        Verify New Automation Page

    ELSE IF    "${resources_links}" == "Data-Driven Testing "
        Page Should Contain    Data-Driven Testing
        Sleep    3
        Tolerant Click    ${DD_GET_STARTED}
    ELSE IF    "${resources_links}" == "Defect Export"
        Page Should Contain    Defect  Export
        Sleep    3
        Tolerant Click    ${DE_GET_STARTED}
    ELSE IF    "${resources_links}" == "Fast Setup"
        Page Should Contain    Fast Setup
        Sleep    3
        Tolerant Click    ${FS_GET_STARTED}
    END

Verify New Automation Page
    [Documentation]    Check for New Page Loaded
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Identify Text On The Automation Page
    ${windows}    Get Window Handles
    Switch Window     ${windows}[0]

Identify Text On The Automation Page
    [Documentation]    Check for the content text
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1000);
    Wait Until Page Contains Element    //a[@id='user-content-test-case-automation-agent-for-testbenchcs']
