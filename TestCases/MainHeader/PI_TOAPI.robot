*** Settings ***
Documentation       Main Header Section    ...

Resource            ../../Resources/import.resource


*** Test Cases ***
Check Api Response
  [Documentation]  Checks api response status status_code
  Test Api
