*** Settings ***
Documentation  ...
Library     SeleniumLibrary
Resource    common.resource


*** Keywords ***
Navigate To Software Testing
    [Documentation]    This keyword is to navigate to Software Testing
    Mouse Over    ${LINK_SOFTWARE_TESTING}

Navigate To Test Automation [Software Testing]
    [Documentation]    This keyword is to navigate to Test Automation
    Mouse Over    ${LINK_TEST_AUTOMATION}

Navigate To Test Automation With Robot Framework [Test Automation]
    [Documentation]    This keyword is to navigate to Test Automation With Robot Framework
    Click Element    ${LINK_TEST_AUTOMATION_WITH_RBFW}

Navigate To Test Automation Strategy [Test Automation]
    [Documentation]    This keyword is to navigate to Test Automation Strategy
    Click Element    ${LINK_TEST-AUTOMATION-STRATEGY}

Navigate To Robot Framework
    [Documentation]    This keyword is to navigate to Robot Framework
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${LINK_ROBOT_FRAMEWORK}
    Click Element    ${LINK_ROBOT_FRAMEWORK}

Navigate To Top Page
    [Documentation]    This keyword is navigate to the top of the page
    Wait Until Page Contains Element    ${LINK_NAVIGATION_TO-TOP}
    Click Element    ${LINK_NAVIGATION_TO-TOP}

Navigate To Academy
    [Documentation]    This keyword is navigate to the Academy
    Mouse Over    ${LINK_ACADEMY}

Navigate To ISTQB Certified Tester
    [Documentation]    This keyword is navigate to ISTQB Certified Tester Section
    Mouse Over    ${LINK_ISTQB_CERTIFIED_TESTER}
    Click Element    ${LINK_ISTQB_CERTIFIED_TESTER}

Navigate To The German Testing Board
    [Documentation]    This keyword is navigate to the German Testing Board and validate the new tab wich is opened
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${TITLE_GERMAN_TESTING_BOARD}
    Wait Until Page Contains Element    ${TITLE_GERMAN_TESTING_BOARD}
    Click Element    ${TITLE_GERMAN_TESTING_BOARD}
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Wait Until Element Is Visible    ${TITLE_GERMAN_TESTING_BOARD}

Navigate To Mobile Testing
    [Documentation]    This Keyword is to navigate to Mobile Testing
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View    ${LINK_MOBILE_TESTING}
    Click Element    ${LINK_MOBILE_TESTING}
    Wait Until Keyword Succeeds    5x    2s    Scroll Element Into View
    ...    (//img[contains(@class, 'image-embed-item')])[4]
    Sleep    1s
    Click Element    (//img[contains(@class, 'image-embed-item')])[4]

Navigate To Registration Form
    [Documentation]    This Keyword is used to Navigate To Navigation Form.
    Mouse Over    //span[contains(text(), 'Login')]
    Wait Until Page Contains Element    //a[contains(@href, '/en/user-management/registration')]
    Click Element    //a[contains(@href, '/en/user-management/registration')]

Navigate To Login Form
    [Documentation]    This Keyword is used to Navigate To Navigation form.
    Mouse Over    //span[contains(text(), 'Login')]
    Wait Until Page Contains Element    //a[contains(text(), 'Login')]
    Click Element    //a[contains(text(), 'Login')]
