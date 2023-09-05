*** Settings ***
Documentation       Home Page elements

Resource            ../import.resource


*** Variables ***
### Locators for boxes ###
${BTN_TEST_MANAGER}             //div[contains (@class, 'tabs')]//a[contains(@class, 'button button--tab hovered')]
${TEST_MANAGER_QUOTE}           (//blockquote[@class='quote'])[1]
${TEST_MANAGEMENT_LINK}         (//p)[21]
${BTN_SOFTWARE_DEV}             //div[@class='tabs']//a[2]
${SOFTWARE_DEV_QUOTE}           (//p)[22]
${TEST_EXECUTION_LINK}          (//p)[23]
${BTN_PROJECT_M}                (//a[@class='button button--tab'])[2]
${PROJECT_M_QUOTE}              (//p)[24]
${TEAM_COLLAB_LINK}             (//p)[25]
${BTN_TESTER}                   (//a[@class='button button--tab'])[3]
${TESTER_QUOTE}                 (//p)[26]
${TEST_DESIGN_LINK}             (//p)[27]
### Locators for homepage ###
${START_FOR_FREE}               (//div[contains(@class, 'cta')]//a[contains(@href, 'https://www.testbench.com/')])[1]
${LEARN_MORE_ABOUT_IMBUS}       //a[contains(text(), 'Learn More About imbus')]
${IMBUS_LOGO}                   //div[@id='logo']//a[contains(text(), 'imbus AG')]
${ACCEPT_COOKIES_IMBUS}         //div[@id='cookieconsent:body']//a[contains(text(), 'allow all cookies ')]
### Home Page Locators For Card ###
${REQUIREMENTS_MANAGEMENT}      (//div[@class='card-inner'])[1]
${TEST_MANAGEMENT}              (//div[@class='card-inner'])[2]
${TEST_DESIGN}                  (//div[@class='card-inner'])[3]
${TEST_EXECUTION}               (//div[@class='card-inner'])[4]
${TEST_AUTOMATION}              (//div[@class='card-inner'])[5]
${TEST_COLLABORATION}           (//div[@class='card-inner'])[6]
${TOOL_CUSTOMIZATION}           (//div[@class='card-inner'])[7]
${TOOL_INTEGRATION}             (//div[@class='card-inner'])[8]
${SUBTITLE_TESTBENCH}           //div[@class='flyntComponent componentSpacing themeLight']//h3[@class='h2']

# Status
${WELL_DONE_STATUS}             //div[contains(@class, 'checklist')]//p[contains(@class, 'msg--success')]
${EMAIL_ALEADY_EXIST}           //p[contains(@class, 'msg--error')]
${CHECK_YOUR_EMAIL}             ////h3[contains(@class, 'h2')]
${ENTER_YOUR_DETAILS_BELOW}     //div[contains(@class, 'overline')]
${WELCOME}                      //h2[contains(@class, 'h2')]

# MH_STATUS
${EXPLORE_LERAN...TITLE}        //h2[contains(@class, 'h1')]
${BLOG_PAGE_TITLE}              //h2[contains(@class, 'h2')]


*** Keywords ***
Use TestBench For Free
    [Documentation]    This keyword is used to navigate to Start For Free.
    Wait Until Element Is Visible    ${START_FOR_FREE}
    Click Element    ${START_FOR_FREE}
    Wait Until Page Contains    Get started with a free account

Accept Cookies Imbus Page
    [Documentation]    This keyword is for Cookies and for validate that TestBench web is open.
    Tolerant Click    ${ACCEPT_COOKIES_IMBUS}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    Our Portfolio and trend topics

More About Imbus
    [Documentation]    This keyword is used to navigate to Learn More About Imbus button.
    Scroll Element Into View            ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Element Is Visible       ${LEARN_MORE_ABOUT_IMBUS}
    Click Element                       ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Page Contains Element    ${IMBUS_LOGO}

Control If Login/SignUp Page Contains
    [Documentation]    Check If Page Contains Text.
    [Arguments]    ${status}
    IF    "${status}" == "Well done"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${WELL_DONE_STATUS}
    ELSE IF    "${status}" == "Email already exists"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EMAIL_ALEADY_EXIST}
    ELSE IF    "${status}" == "Check Your Email"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${CHECK_YOUR_EMAIL}
    ELSE IF    "${status}" == "Log in failed. Please check your credentials"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EMAIL_ALEADY_EXIST} 
    ELSE IF    "${status}" == "Enter your details below"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${ENTER_YOUR_DETAILS_BELOW}
    ELSE IF    "${status}" == "Welcome!"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${ENTER_YOUR_DETAILS_BELOW}
    ELSE
        Fail    Unexpected status: ${status}
    END

Navigate To Card
    [Documentation]    Verifies if all the links works properly.
    [Arguments]    ${card_links}
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1200);
    IF    "${card_links}" == "Requirements Management"
        Wait Until Page Contains Element    ${REQUIREMENTS_MANAGEMENT}
        Tolerant Click                      ${REQUIREMENTS_MANAGEMENT}
    ELSE IF    "${card_links}" == "Test Management"
        Wait Until Page Contains Element    ${TEST_MANAGEMENT}
        Tolerant Click                      ${TEST_MANAGEMENT}
    ELSE IF    "${card_links}" == "Test Design"
        Wait Until Page Contains Element    ${TEST_DESIGN}
        Tolerant Click                      ${TEST_DESIGN}
    ELSE IF    "${card_links}" == "Test Execution"
        Wait Until Page Contains Element    ${TEST_EXECUTION}
        Tolerant Click                      ${TEST_EXECUTION}
    ELSE IF    "${card_links}" == "Test Automation"
        Wait Until Page Contains Element    ${TEST_AUTOMATION}
        Tolerant Click                      ${TEST_AUTOMATION}
    ELSE IF    "${card_links}" == "Team Collaboration"
        Wait Until Page Contains Element    ${TEST_COLLABORATION}
        Tolerant Click                      ${TEST_COLLABORATION}
    ELSE IF    "${card_links}" == "Tool Customization"
        Wait Until Page Contains Element    ${TOOL_CUSTOMIZATION}
        Tolerant Click                      ${TOOL_CUSTOMIZATION}
    ELSE IF    "${card_links}" == "Tool Integration"
        Wait Until Page Contains Element    ${TOOL_INTEGRATION}
        Tolerant Click                      ${TOOL_INTEGRATION}
    END

Navigate To Your Personal TestBench Benefit
    [Documentation]    This keyword is used for navigation to TestBench Benefits.
    [Arguments]    ${testbench_tab}
    Wait Until Page Contains Element    ${NAV_LOGO}
    Click Element    ${NAV_LOGO}
    Wait Until Keyword Succeeds    3x    1s    Scroll Element Into View    ${NAV_TESTBENCH_BENEFITS}
    IF    "${testbench_tab}" == "Test Manager"
        Wait Until Page Contains Element     ${TEST_MANAGER_QUOTE}
        Page Should Contain Element          ${TEST_MANAGER_QUOTE}
        Tolerant Click                       ${TEST_MANAGEMENT_LINK}
    ELSE IF    "${testbench_tab}" == "Software Developer"
        Set Selenium Speed    0.3
        Wait Until Page Contains Element     ${BTN_SOFTWARE_DEV}
        Tolerant Click                       ${BTN_SOFTWARE_DEV}
        Page Should Contain Element          ${SOFTWARE_DEV_QUOTE}
        Execute JavaScript    window.scrollTo(0,1500)
        Wait Until Page Contains Element     ${TEST_EXECUTION_LINK}
        Tolerant Click                       ${TEST_EXECUTION_LINK}
    ELSE IF    "${testbench_tab}" == "Project Manager"
        Wait Until Page Contains Element     ${BTN_PROJECT_M}
        Tolerant Click                       ${BTN_PROJECT_M}
        Wait Until Page Contains Element     ${PROJECT_M_QUOTE}
        Tolerant Click                       ${TEAM_COLLAB_LINK}
    ELSE IF    "${testbench_tab}" == "Tester"
        Wait Until Page Contains Element     ${BTN_TESTER}
        Tolerant Click                       ${BTN_TESTER}
        Wait Until Page Contains Element     ${TESTER_QUOTE}
        Tolerant Click                       ${TEST_DESIGN_LINK}
    END

Check Test Bench Service Cards
    [Documentation]    Checks and clicks all cards available in the fist page of Test Bench..
    Navigate To Card    Requirements Management
    Go Back
    Navigate To Card    Test Management
    Go Back
    Navigate To Card    Test Design
    Go Back
    Navigate To Card    Test Execution
    Go Back
    Navigate To Card    Test Automation
    Go Back
    Navigate To Card    Team Collaboration
    Go Back
    Navigate To Card    Tool Customization
    Go Back
    Navigate To Card    Tool Integration
