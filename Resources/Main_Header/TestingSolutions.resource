*** Settings ***
Documentation       Keywords for Navigation
Resource            ../import.resource


*** Variables ***
${TESTING_SOLUTIONS_ITEM}        (//li[contains(@class, 'menu-item menu-item--has-childs')])[1]
${KEYWORDDRIVEN_TITLE}            //h1[contains(@class,'h1 has-no-overline')]
${DATADRIVEN_TITLE}               //h1[contains(@class,'overline')]
${TEST_AUTOMATION_DROP_DOWN}        (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[1]
${TEST_AUTOMATION_TITLE}    //h1[contains(@class, 'h1 has-no-overline')]
${KEYWORD_DRIVEN_TESTING}    (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[2]
${DATA_DRIVEN_TESTING}    (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[3]


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
        Wait Until Page Contains Element    ${KEYWORD_DRIVEN_TESTING}
        Tolerant Click    ${KEYWORD_DRIVEN_TESTING}
    ELSE IF    "${testing_solution}" == "Data Driven Testing"
        Wait Until Page Contains Element    ${DATA_DRIVEN_TESTING}
        Tolerant Click    ${DATA_DRIVEN_TESTING}
    END
