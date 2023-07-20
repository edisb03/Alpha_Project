*** Settings ***
Documentation       ...

Resource    import.resource

*** Variables ***
${Accept_Cookies}           (//a[@role='button'][normalize-space()='Accept all'])[1]



*** Keywords ***
Accept Cookies
  [Documentation]    Wait Until Page Contains    Accept all
   Wait Until Page Contains    Accept all
   Tolerant Click    ${Accept_Cookies} 
