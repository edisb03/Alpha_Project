*** Settings ***
Documentation       Common

Resource            import.resource


*** Variables ***
${ACCEPT_COOKIES}           (//a[@role='button'][normalize-space()='Accept all'])[1]
${ACCEPT_GERMAN_COOKEIS}     //*[@id="BorlabsCookieBox"]/div/div/div/div[1]/div/div/div/p[2]/a


*** Keywords ***
Accept Cookies
    [Documentation]    This keyword is for Cookies and for validate that TestBench web is open.
    [Arguments]    ${COOKIE}
    Wait Until Page Contains    Accept all
    Tolerant Click    ${ACCEPT_COOKIES}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    The Smart Test Management Tool
    Wait Until Keyword Succeeds    3x    1s    Verify Main Header
