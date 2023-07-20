*** Settings ***
Documentation       ...

# Resource    other.resource
# Resource    variables.py
# Resource    custom_library.py
Resource            common_Second.resource
Resource            common_Navigate.resource
Library            ../Resources/python.configuration/test.py
Library             SeleniumLibrary
#Library             AutoItLibrary


*** Variables ***
${Accept_Cookies}           (//a[@role='button'][normalize-space()='Accept all'])[1]



*** Keywords ***
Accept Cokkies
  [Documentation]    Wait Until Page Contains    Accept all
   Wait Until Page Contains    Accept all
   Tolerant Click    ${Accept_Cookies}
   # AgnesaB.
