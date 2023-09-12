*** Settings ***
Documentation       Main Header Section    ...

Resource            ..//Resources/import.resource


*** Test Cases ***
Test API Status Code 200
    [Documentation]    Test API status code with expected status code 200
    Test APi    200

Test API Status Code 300
    [Documentation]    Test API status code with expected status code 300
    Test Api    300

# Test API Return Yaml Data Text
#     [Documentation]    Test retrieving and working with API info data
#     ${info_data}    Get Info Data
#     Log    Info Section Data:
#     Log Many    ${info_data}
