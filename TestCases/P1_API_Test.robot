*** Settings ***
Documentation       Main Header Section    ...

Resource            ..//Resources/import.resource


*** Test Cases ***
Test API Status Code 200
    [Documentation]    Test API status code with expected status code 200
    [Tags]    P1TO_API_TC1    exploratory
    Test APi    200

Test API Status Code 300
    [Documentation]    Test API status code with expected status code 300
    [Tags]    P1TO_API_TC2    exploratory
    Test Api    300

Retrieve and Validate API Info Data
    [Documentation]    Test retrieving and working with API info data..
    [Tags]     P1TO_API_TC3   exploratory
    ${info_data}    Get Info Data
    Log    Info Section Data:
    Log Many    ${info_data}
