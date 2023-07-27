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
    [Documentation]    Verify Resources links
    [Arguments]    ${resources_links}
    Set Selenium Speed    0.5
    IF    "${resources_links}" == "Test Automation"
        Page Should Contain    Test Automation
        Sleep    3
        Tolerant Click    ${AUTOMATED_GET_STARTED}
        Execute JavaScript    window.scrollTo(0,1200);
        Switch Window    Test Case Automation Agent for TestBench CS
        Page Should Contain    Test Case Automation Agent for TestBench CS
    ELSE IF    "${resources_links}" == "Data-Driven Testing "
        Page Should Contain    Data-Driven Testing 
        Sleep    3
        Tolerant Click    ${DD_GET_STARTED}
        Switch Window    DDT table import via Excel for TestBench CS
    ELSE IF    "${resources_links}" == "Defect Export"
        Page Should Contain    Defect Export
        Sleep    3
        Tolerant Click    ${DE_GET_STARTED}
        Switch Window    Defect Export via Excel for TestBench CS
    ELSE IF    "${resources_links}" == "Fast Setup"
        Page Should Contain    Fast Setup
        Sleep    3
        Tolerant Click    ${FS_GET_STARTED}
        Switch Window    Setup users along with Workspaces in TestBench CS
    END
