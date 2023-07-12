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
# Buttons
${BTN_ALLOW_ALL COOKIES}                //a[contains(text(), 'allow all cookies')]
${BTN_RUN}                              //button[contains(@class, 'theme flex middle bling')]
${BTN_NEXT_2_EXAMPLE}                   //button[contains(text(), ' next: Simple Example 2')]
${BTN_NEXT_BDD_EXAMPLE}                 //button[contains(text(), ' next: BDD-Example')]
${BTN_ADVANCED_EXAMPLE}                 //button[contains(text(), ' next: Advanced Example')]
${BTN_RESET}                            //span[contains(text(), 'Reset')]
${BTN_FIND}                             //input[contains(@value, 'Find')]
${BTN_SEARCH}                           (//span[contains(text(), 'Suche')])[2]

# Navigation
${LINK_SOFTWARE_TESTING}                (//a[contains(@title, 'Software Testing')])[1]
${LINK_TEST_AUTOMATION}                 (//a[contains(text(), 'Test Automation')])[1]
${LINK_TEST_AUTOMATION_WITH_RBFW}       //a[contains(text(), 'Testautomation with Robot Framework')]
${LINK_ROBOT_FRAMEWORK}                 //img[contains(@src,'Robot-framework')]
${LINK_TEST-AUTOMATION-STRATEGY}        //a[contains(text(), 'Test and automation strategy')]
${LINK_NAVIGATION_TO-TOP}               //a[contains(@id, 'toTop')]
${LINK_ACADEMY}                         (//a[contains(text(), 'Academy')])[1]
${LINK_ISTQB_CERTIFIED_TESTER}          //a[contains(text(), 'ISTQB Certified Tester')]
${LINK_MOBILE_TESTING}                  (//span[contains(text(),    'Mobile')])[2]

# Title
${TITLE_ROLL-OUT}                       //button//div[contains(text(), 'Run')]
${TITLE_TEST&AUTOMATION-STRATEGY}       //h1[contains(text(), 'Test and automation strategy')]
${TITLE_GERMAN_TESTING_BOARD}           //a[contains(text(), 'German Testing Board')]

# Form
${FORM_USERNAME}                        //input[contains(@placeholder, 'Username')]
${FORM_PASSWORD}                        //input[contains(@type, 'password')]
${FORM_CITY}                            //input[contains(@placeholder, 'City*')]
${FORM_COMPANY}                         //input[contains(@placeholder, 'Company*')]
${FORM_FIRST_NAME}                      //input[contains(@placeholder, 'First name*')]
${FORM_BTN_CREATE_ACCOUNT}              //input[contains(@value, 'Create account')]
${FORM_BTN_LOGIN}                       (//input[contains(@value, 'Login')])[3]

# Input
${SEARCH_FORM_1}                        //input[contains(@id, 'ke_search_sword')]
${SEARCH_FORM_2}                        //input[contains(@placeholder, 'at least 4 characters')]


*** Keywords ***
Allow All Cookies
    [Documentation]    This keyword is to accept all Cookies
    Wait Until Page Contains Element    ${BTN_ALLOW_ALL COOKIES}
    Click Element    ${BTN_ALLOW_ALL COOKIES}

Run Robot Framework Scripts
    [Documentation]    This keyword is to Run Robot Framework Scripts
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${BTN_RUN}
    Click Button    ${BTN_RUN}
    Wait Until Page Contains Element    ${BTN_NEXT_2_EXAMPLE}    60
    Click Button    ${BTN_NEXT_2_EXAMPLE}
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${TITLE_ROLL-OUT}
    Click Button    ${BTN_RUN}
    Wait Until Page Contains Element    ${BTN_ADVANCED_EXAMPLE}    120
    Click Button    ${BTN_ADVANCED_EXAMPLE}
    Wait Until Page Contains Element    ${BTN_RUN}
    Click Button    ${BTN_RUN}
    Wait Until Element Is Visible    ${BTN_NEXT_BDD_EXAMPLE}

Check Roll-Out Title
    [Documentation]    This keyword is to Check Roll Out Title
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${TITLE_ROLL-OUT}
    Wait Until Page Contains Element    ${TITLE_ROLL-OUT}

Check Test Automation Strategy Title
    [Documentation]    This keyword Check Test Automation Strategy Title
    Wait Until Element Is Visible    ${TITLE_TEST&AUTOMATION-STRATEGY}

Reset And Search Results
    [Documentation]    This keyword reset Search Results
    [Arguments]    ${Search}
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${BTN_RESET}
    Click Element    ${BTN_RESET}
    Input Text    ${SEARCH_FORM_1}    ${Search}
    Click Element    ${BTN_FIND}

Search In Search Navigation
    [Documentation]    In this keyword we navigate to Search..
    [Arguments]    ${Search_navigation}
    Wait Until Page Contains Element    ${BTN_SEARCH}
    Click Element    ${BTN_SEARCH}
    Input Text    ${SEARCH_FORM_2}    ${Search_navigation}
    Press Keys    ${SEARCH_FORM_2}    ENTER

Fill Out The Form In Registration
    [Documentation]    In this keyword we fill out the form in Registration.
    [Arguments]    ${NAME}    ${COMPANY}    ${CITY}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${FORM_FIRST_NAME}    ${NAME}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${FORM_COMPANY}    ${COMPANY}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${FORM_COMPANY}    ${CITY}
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${FORM_BTN_CREATE_ACCOUNT}
    Click Element    ${FORM_BTN_CREATE_ACCOUNT}

Fill Out The Login Form
    [Documentation]    In this keyword we fill out the form in Registration.
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${FORM_USERNAME}    ${USERNAME}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${FORM_PASSWORD}    ${PASSWORD}
    Click Element    ${FORM_BTN_LOGIN}

Check Validation Form
    [Documentation]    In this keyword we check validation form
    Page Should Contain    This field is required

Check Login Form
    [Documentation]    In this keyword we check validation form
    Page Should Contain    Login failure
