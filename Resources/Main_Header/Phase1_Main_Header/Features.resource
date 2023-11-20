*** Settings ***
Documentation       THIS TEST SUITE NOW IS ON BLOCKED STATUS BECAUSE DOESN'T EXIST ON NEW VERSION ANYMORE. BUT WE WON'T DELETE IT.

Resource            ../../import.resource


*** Variables ***
${REQUIREMENTS_MANAGEMENT_FEATURES}     (//h2[@class='h3'])[1]
${TEST_MANAGEMENT_FEATURES}             (//h2[@class='h3'])[2]
${TEST_DESIGN_FEATURES}                 (//h2[@class='h3'])[3]
${TEST_EXECUTION_FEATURES}              (//h2[@class='h3'])[4]
${TEST_AUTOMATION_FEATURES}             (//h2[@class='h3'])[5]
${TEST_COLLABORATION_FEATURES}          (//h2[@class='h3'])[6]
${CUSTOMIZATION_FEATURES}               (//h2[@class='h3'])[7]
${INTEGRATION_FEATURES}                 (//h2[@class='h3'])[8]
${TRY_TESTBENCH_NOW}                    (//div[@class='box-inner box-inner--cta'])[1]//a[1]
${TRY_EXPLORTORY_TESTING}               //div[@class='box box--imageRight']//div[@class='cta']//a[2]
${TRY_DATA-DRIVEN_TESTING}              (//div[@class='cta'])[2]//a[2]
${LEARN_MORE}                           //div[@class='box box--imageRight']//div[@class='cta']//a[1]
${LEARN_MORE_DATA}                      //div[@class='box box--imageLeft']//div[@class='cta']//a[1]


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
    [Documentation]    Navigate to Try Testbench Now button and verify its presence.
    Execute JavaScript    window.scrollTo(0, 7200)
    ${isElementPresent} =    Run Keyword And Return Status    Page Should Contain Element    ${TRY_TESTBENCH_NOW}
    IF    '${isElementPresent}' == 'True'
        Wait Until Keyword Succeeds    3x    3s    Tolerant Click    ${TRY_TESTBENCH_NOW}
        Control If The MH Page Contains    Get started with a free account
        Log    Button is present in English version of the page
    ELSE
        Log    Button is not present in German version of the page
    END

Try Exploratory Testing
    [Documentation]    Navigate to Try Exploratory Testing button
    Execute JavaScript    window.scrollTo(0,7900);
    Wait Until Page Contains Element    ${TRY_EXPLORTORY_TESTING}
    Sleep    1s
    Tolerant Click    ${TRY_EXPLORTORY_TESTING}
    Control If The MH Page Contains    Get started with a free account

Navigate To Learn More Exploratory Testing
    [Documentation]    Scrolls down to the middle of the page
    ...    finds the Learn More Function and Clicks on it.
    [Arguments]    ${Learn_More_1}
    Execute JavaScript    window.scrollTo(0,7800);
    Wait Until Page Contains Element    ${LEARN_MORE}
    Tolerant Click    ${LEARN_MORE}

Navigate To Learn More Data Driven
    [Documentation]    Scrolls down to the middle of the page
    ...    finds the Learn More Function and Clicks on it
    [Arguments]    ${Learn_More_2}
    Set Selenium Speed    0.2
    Execute JavaScript    window.scrollTo(0,9000);
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains Element    ${LEARN_MORE_DATA}
    Tolerant Click    ${LEARN_MORE_DATA}

Try Data-Driven Testing
    [Documentation]    Navigate to Try Data-Driven Testing button
    Execute JavaScript    window.scrollTo(0,8800);
    Wait Until Element Is Visible    ${TRY_DATA-DRIVEN_TESTING}
    Click Element    ${TRY_DATA-DRIVEN_TESTING}
    Control If The MH Page Contains    Get started with a free account

