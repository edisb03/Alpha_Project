*** Settings ***
Documentation       ...

Resource    import.resource

*** Variables ***
${ACCEPTC_COOKIES}           (//a[@role='button'][normalize-space()='Accept all'])[1]


*** Keywords ***
Accept Cokkies
   [Documentation]    Wait Until Page Contains    Accept all 2023
   ...    Wait Until Page Contains    Accept all
   Tolerant Click    ${ACCEPTC_COOKIES}
   # AgnesaB.
