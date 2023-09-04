*** Settings ***
Documentation       Common

Resource            import.resource


*** Variables ***
${ACCEPT_COOKIES}           (//a[@role='button'][normalize-space()='Accept all'])[1]
${ACCEPT_GERMAN_COOKEIS}    //*[@id="BorlabsCookieBox"]/div/div/div/div[1]/div/div/div/p[2]/a
${CHECKBOX}                 //span[contains(text(),'Please send me occasional')]
${COOKIES}                  //p[@class='_brlbs-accept'][1]
${FIRST_HEADER}             //h1[@class='h1']


*** Keywords ***
# Accept Cookies
#    [Documentation]    This keyword is for Cookies and for validate that TestBench web is open.
#    [Arguments]    ${COOKIE}
#    Set Selenium Speed    0.2
#    IF    "${COOKIE}" == "Accept all"
#    Wait Until Page Contains    Accept all
#    Tolerant Click    ${ACCEPT_COOKIES}
#    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    The Smart Test Management Tool
#    Wait Until Keyword Succeeds    3x    1s    Verify Main Header
#    ELSE IF    "${COOKIE}" == "Accept all"
#    Element Should Not Be Visible    ${ACCEPT_COOKIES}
#    No Operation
#    ELSE IF    "${COOKIE}" == "Alle Cookies akzeptieren"
#    Wait Until Page Contains    Alle Cookies akzeptieren
#    Wait Until Page Contains Element    ${ACCEPT_GERMAN_COOKEIS}
#    Tolerant Click    ${ACCEPT_GERMAN_COOKEIS}
#    ELSE IF    "${COOKIE}" == "Alle Cookies akzeptieren"
#    Element Should Not Be Visible    ${ACCEPT_GERMAN_COOKEIS}
#    No Operation
#    END
Accept Cookies
    [Documentation]    This keyword is for accepting cookies on the TestBench web page.
    Set Selenium Speed    0.2
    Wait Until Page Contains Element    ${COOKIES}
    Tolerant Click    ${COOKIES}
    Wait Until Page Contains Element   ${FIRST_HEADER}
    Wait Until Keyword Succeeds    3x    1s    Verify Main Header

Tick The Checkbox
    [Documentation]    Waits until the specified checkbox element is present on the page
    ...    Once the checkbox is visible, it's clicked to select it.
    Wait Until Page Contains Element        ${CHECKBOX}
    Tolerant Click                         ${CHECKBOX}
