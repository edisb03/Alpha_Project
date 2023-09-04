*** Settings ***
Documentation       Common

Resource            import.resource


*** Variables ***
${ACCEPT_COOKIES}           (//a[@role='button'][normalize-space()='Accept all'])[1]
${ACCEPT_GERMAN_COOKEIS}    //*[@id="BorlabsCookieBox"]/div/div/div/div[1]/div/div/div/p[2]/a
${CHECKBOX}                 //div[@class='newsletter']//label//span
${COOKIES}                  //p[@class='_brlbs-accept'][1]
${FIRST_HEADER}             //h1[@class='h1']


*** Keywords ***
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
