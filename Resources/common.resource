*** Settings ***
Documentation       Common

Resource            import.resource


*** Variables ***
${ACCEPT_COOKIES}       (//a[@role='button'][normalize-space()='Accept all'])[1]


*** Keywords ***
Accept Cookies
    [Documentation]    This keyword is for Cookies and for validate that TestBench web is open.
    [Arguments]    ${COOKIE}
    Wait Until Page Contains    Accept all
    Tolerant Click    ${ACCEPT_COOKIES}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    The Smart Test Management Tool
    Wait Until Keyword Succeeds    3x    1s    Verify Main Header
