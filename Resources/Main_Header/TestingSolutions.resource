*** Settings ***
Documentation       Keywords for Navigation
Resource            ../import.resource


*** Variables ***
${TEST_AUTOMATION}    (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[1]
${KEYWORD_DRIVEN_TESTING}    (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[1]
${DATA_DRIVEN_TESTING}    (//ul[contains(@class, 'menu')]//ul[contains(@class, 'nav-drop')]//li//a[contains(@href, '')])[1]


*** Keywords ***
Navigate To Testing Solution
    [Documentation]    This keyword is used to navigate to Testing Solution, we have 3 option and we will call
    ...    with arguments. Test automation, Keyword Driven Testing, Data Driven Testing.
    [Arguments]     ${testing_solution}
    IF    "${testing_solution}" == "Testing automation"
        Wait Until Page Contains Element    ${TEST_AUTOMATION}
        Tolerant Click    ${TEST_AUTOMATION}
    ELSE IF    "${testing_solution}" == "Keyword Driven Testing"
        Wait Until Page Contains Element    ${KEYWORD_DRIVEN_TESTING}
        Tolerant Click    ${KEYWORD_DRIVEN_TESTING}
    ELSE IF    "${testing_solution}" == "Data Driven Testing"
        Wait Until Page Contains Element    ${DATA_DRIVEN_TESTING}
        Tolerant Click    ${DATA_DRIVEN_TESTING}
    END
