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
${START_FOR_FREE}               (//div[contains(@class, 'cta')]//a[contains(@href, 'https://www.testbench.com/')])[7]
${LEARN_MORE_ABOUT_IMBUS}       //div[(contains(@class, 'cta'))]//a[contains(@href, 'https://www.imbus.de')]
${IMBUS_LOGO}                   //div[@id='logo']//a
${ACCEPT_COOKIES_IMBUS}         (//a[@class='cc-btn cc-allow-all cc-w-100'])[1]
${LEARN_MORE_BTN}               (//div[@class='box-inner box-inner--cta']//a)[1]
${iTORX_PAGE_TITLE}             //h2[@class='h2 has-no-overline']
${MORE_ABOUT_TA_BTN}            (//div[@class='cta']//a)[2]
${EXP_KEYWORDDRIVEN_TEST}       (//div[@class='box-inner box-inner--cta']//a)[2]
${SWISSCOM_BUTTON}              (//div[@class='box-inner--text']//blockquote[@class='quote'])[1]
${SWISSCOM_CONTAINER}           (//div[@class='box-inner--text']//blockquote[@class='quote'])[1]
${SWISSCOM_LINK}                //a[@href='https://www.swisscom.ch/de/privatkunden.html' and @class='button button--link']
${SWISSCOM_LINK_PAGE}           //h2[@id='onetrust-policy-title']
${TARGENIO_BUTTON}              //a[@class='button button--tab']
${TARGENIO_CONTAINER}           (//div[@class='box-inner--text']//blockquote[@class='quote'])[2]
${TESTBENCH_IN_USE_LINK}        //a[normalize-space()='The TestBench in use']
${TARGENIO_PAGE}                //span[@class='logo avia-svg-logo']
### Home Page Locators For Card ###
${CARD_SECTION_TITLE}           //h2[@class='h3 has-no-overline']
${TESTAUTOMATION}               (//h3[@class='h4'])[1]
${KEYWORDDRIVEN_TESTING}        (//h3[@class='h4'])[2]
${DATADRIVEN_TESTING}           (//h3[@class='h4'])[3]
${INTEGRATION}                  (//h3[@class='h4'])[4]
${SUBTITLE_TESTBENCH}           //div[@class='flyntComponent componentSpacing themeLight']//h3[@class='h2']
${RDM_TESTAUTOMATION}           (//div[@class='card'])[1]//a[1]
${RDM_KEYWORDD_TESTING}         (//div[@class='card'])[2]//a[1]
${RDM_DATAD_TESTING}            (//div[@class='card'])[3]//a[1]
${RDM_INTEGRATION}              (//div[@class='card'])[4]//a[1]
### Home Page tites
${NEW!_TITLE}                   (//div[contains(@class, 'box-inner box-inner--intro text text--lg')]//p[@class='overline'])[2]
${ROAD_EFFICIENCY_TITLE}        (//div[contains(@class, 'box-inner box-inner--content text text--lg')]//p[@class='overline'])[1]
${KDRIVEN_TESTING_TITLE}        (//div[contains(@class, 'box-inner box-inner--intro text text--lg')]//p[@class='overline'])[3]
${TESTIMONIALS_TITLE}           (//h2[@class='h2'])[7]

# Status
${WELL_DONE_STATUS}             //div[contains(@class, 'checklist')]//p[contains(@class, 'msg--success')]
${EMAIL_ALEADY_EXIST}           (//p[@class='msg msg--error'])[1]
${CHECK_YOUR_EMAIL}             //h3[contains(@class, 'h2')]
${ENTER_YOUR_DETAILS_BELOW}     (//div[@class='overline'])[1]
${WELCOME}                      (//h2[@class='h2'])[1]

# MH_STATUS
${IMBUS_PAGE_TITTLE}                        //h2[contains(@class, ' headline--h3 headline--noline')]
${HOME_PAGE_TITLE}                          //h1[contains(@class, 'h1 has-no-overline')]
${RESOURCES_PAGE_TITTLE}                    //p[@class='overline']

*** Keywords ***

Control If The MH Page Contains
    [Documentation]    Navigate to Try Data-Driven Testing button
    [Arguments]    ${status}
    IF    "${status}" == "Test auf höchstem Niveau"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${HOME_PAGE_TITLE}
    ELSE IF    "${status}" == "Test on the highest level"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${HOME_PAGE_TITLE}
    ELSE
        Fail    Unexpected status: ${status}
    END

Use TestBench For Free
    [Documentation]    This keyword is used to navigate to Start For Free.
    Wait Until Element Is Visible    ${START_FOR_FREE}
    Click Element    ${START_FOR_FREE}
    Control If The MH Page Contains    Get started with a free account

Accept Cookies Imbus Page
    [Documentation]    This keyword is foraccepting Cookies and for validate that TestBench web is open.
    Wait Until Keyword Succeeds    3s    3x    Tolerant Click    ${ACCEPT_COOKIES_IMBUS}
    Wait Until Page Contains Element    ${IMBUS_LOGO}
    Control If The MH Page Contains    Our Portfolio and trend topics

More About Imbus
    [Documentation]    This keyword is used to navigate to Learn More About Imbus button.
    Scroll Element Into View    ${LEARN_MORE_ABOUT_IMBUS}
    Wait Until Page Contains Element   ${LEARN_MORE_ABOUT_IMBUS}
    Tolerant Click    ${LEARN_MORE_ABOUT_IMBUS}

Control If Login/SignUp Page Contains
    [Documentation]    Check If Page Contains Text.
    [Arguments]    ${status}
    IF    "${status}" == "Well done"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${WELL_DONE_STATUS}
    ELSE IF    "${status}" == "Email already exists"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EMAIL_ALEADY_EXIST}
    ELSE IF    "${status}" == "Check Your Email"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${CHECK_YOUR_EMAIL}
    ELSE IF    "${status}" == "Log in failed. Please check your credentials."
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${EMAIL_ALEADY_EXIST}
    ELSE IF    "${status}" == "Enter your details below"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${ENTER_YOUR_DETAILS_BELOW}
    ELSE IF    "${status}" == "Welcome!"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${WELCOME}
    ELSE IF    "${status}" == "Geben Sie Ihre Daten unten ein"
        Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${ENTER_YOUR_DETAILS_BELOW}
    ELSE
        Fail    Unexpected status: ${status}
    END

Navigate To Card
    [Documentation]    Verifies if all the links works properly.
    [Arguments]    ${card_links}
    Set Selenium Speed    0.3
    Execute JavaScript    window.scrollTo(0,1200);
    IF    "${card_links}" == "Testautomation"
        Page Should Contain Element        ${TESTAUTOMATION}
        Wait Until Page Contains Element    ${RDM_TESTAUTOMATION}
        Tolerant Click                      ${RDM_TESTAUTOMATION}
        Wait Until Page Contains Element    ${TEST_AUTOMATION_TITLE}
    ELSE IF    "${card_links}" == "Keyworddriven Testing"
        Page Should Contain Element        ${TESTAUTOMATION}
        Wait Until Page Contains Element    ${RDM_KEYWORDD_TESTING}
        Tolerant Click                      ${RDM_KEYWORDD_TESTING}
        Wait Until Page Contains Element    ${KEYWORDDRIVEN_TITLE}
    ELSE IF    "${card_links}" == "Datadriven Testing"
        Page Should Contain Element        ${TESTAUTOMATION}
        Wait Until Page Contains Element    ${RDM_DATAD_TESTING}
        Tolerant Click                      ${RDM_DATAD_TESTING}
        Wait Until Page Contains Element    ${DATA_DRIVEN_TESTING}
    ELSE IF    "${card_links}" == "Integration"
        Page Should Contain Element        ${TESTAUTOMATION}
        Wait Until Page Contains Element    ${RDM_INTEGRATION}
        Tolerant Click                      ${RDM_INTEGRATION}
        Wait Until Page Contains Element    ${INTEGRATION_TITLE}
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
    [Documentation]    Checks and clicks all cards available in the first page of Test Bench..
    Navigate To Card    Testautomation
    Go Back
    Navigate To Card    Keyworddriven Testing
    Go Back
    Navigate To Card    Datadriven Testing
    Go Back
    Navigate To Card    Integration

Open Imbus Page
    [Documentation]     This keyword is for accepting Cookies and for validate that TestBench web is open
    ${handles}=  Get Window Handles
    Switch Window    ${handles}[-1]
    Accept Cookies Imbus Page

Check Swisscom Button Is Enabled
    [Documentation]    This keyword verifies swisscom button is enabled by default.
    Scroll Element Into View    ${SWISSCOM_BUTTON}
    Wait Until Page Contains Element    ${SWISSCOM_BUTTON}
    Element Should Be Enabled    ${SWISSCOM_BUTTON}
    Click Element    ${SWISSCOM_BUTTON}

Verify Swisscom Container
    [Documentation]    This keyword verifies Swisscom container.
    Set Selenium Speed    0.3s
    Scroll Element Into View    ${SWISSCOM_CONTAINER}
    Wait Until Page Contains Element    ${SWISSCOM_CONTAINER}
    Wait Until Element Is Visible    ${SWISSCOM_LINK}
    Click Element    ${SWISSCOM_LINK}
    Wait Until Page Contains Element    ${SWISSCOM_LINK_PAGE}

Navigate To Targenio Button
    Wait Until Page Contains Element    ${TARGENIO_BUTTON}
    Click Element    ${TARGENIO_BUTTON}

Verify Targenio Container
    [Documentation]    This keyword verifies targenio container.
    Wait Until Page Contains Element    ${TARGENIO_CONTAINER}
    Wait Until Element Is Visible    ${TESTBENCH_IN_USE_LINK}
    Click Element    ${TESTBENCH_IN_USE_LINK}
    Wait Until Page Contains Element    ${TARGENIO_PAGE}