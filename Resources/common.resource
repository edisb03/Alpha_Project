*** Settings ***
Documentation       ...

Resource    import.resource

*** Variables ***
${ACCEPTC_COOKIES}           (//a[@role='button'][normalize-space()='Accept all'])[1]


*** Keywords ***
<<<<<<< HEAD
Accept Cookies
  [Documentation]    Wait Until Page Contains    Accept all
=======
Accept Cokkies
  [Documentation]    Wait Until Page Contains    Accept all 2023
>>>>>>> 8735daecdff39f33822f4d8c01c8f6f8336da3f0
   Wait Until Page Contains    Accept all
   Tolerant Click    ${ACCEPTC_COOKIES}
   # AgnesaB.
