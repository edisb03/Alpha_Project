*** Settings ***
Documentation       Resource

Resource            ../common.resource


*** Keywords ***
Test API
    [Documentation]    Checks the status codes
    [Arguments]    ${expected_status}
    ${status_code}    check_api_status
    IF    "${status_code}" == "${expected_status}"
        Log    API Response Status Code is ${expected_status}
    ELSE
        Log    API Response Status Code is not ${expected_status}
    END
