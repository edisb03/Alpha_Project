*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                         //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/features/')]
${NAV_TEST_APPROACHES}                  //a[@href="#"]
### Locators for Test Approaches Links ###
${NAV_EXPLOTARY_TESTING}                //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${NAV_DATA-DRIVEN-TESTING}              (//a[contains (@href, "https://www.testbench.com/data-driven-testing/")])[1]
${NAV_KEYWORD-DRIVEN_TESTING}           //header/nav[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]
### Main Header Locators ###
${NAV_BLOG}                             //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/blog/')]
${NAV_RESOURCES}                        //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/resources')]
${LOGIN_BUTTON}                         /div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}                     //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
${NAV_SIGN_UP}                          //nav[contains(@class, 'flyntComponent')][1]//li[contains(@class, 'menu-item')]//a[contains(@href, 'https://www.testbench.com/sign-up/')]
${NAV_LOGO}                             (//header[contains(@class, 'mainHeader')]//a//img[contains(@class, 'logo-image')])[1]
${GER_COOKIES}                          //div[contains(@class, 'container')]//p//a[contains(text(), 'Alle Cookies akzeptieren')][1]
${MAIN_HEADER}                          (//ul[contains(@class, "menu")])[1]
${NAV_ENG}                              (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'English')])[1]
${NAV_GER}                              (//div[contains(@class, 'container centerMaxWidthContainer')]//ul//li//span[contains(text(), 'Deutsch')])[1]
${NAV_TESTBENCH_BENEFITS}               //h2[contains(text(), 'Your Personal TestBench Benefit')]
### Exploratory testing video locators
${EXPLORATORY_TESTING_TITLE_VIDEO}      //h3[contains(text(),'The Right Tool – For the Right Job')]
${EXPLORATORY_TESTING_VIDEO}            //button[@aria-label='Play Video']
${VIDEO_PLAYER}                         (//iframe)[1]
${DROP_DOWN_LIST}                       (//span[@lang='en'][normalize-space()='English'])[1]
${ENGLISH}                              (//span[@lang='en'][normalize-space()='English'])[1]
${GERMAN}                               (//span[@lang='de'][normalize-space()='Deutsch'])[1]
${FOOTER_TB_LOGO}                       (//img[@alt='TestBench'])[3]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features...
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Wait Until Page Contains    Discover the features

Navigate To Test Approaches
    [Documentation]    Navigate To Test Approaches
    Wait Until Page Contains Element    ${NAV_TEST_APPROACHES}
    Tolerant Click    ${NAV_TEST_APPROACHES}

Search Links By Name
    [Documentation]    Search the specified links by using its name
    [Arguments]    ${link_status}
    Wait Until Page Contains    Test Approaches
    Navigate To Test Approaches
    Set Selenium Speed    0.3
    IF    "${link_status}" == "Exploratory Testing"
        Sleep    3s
        Page Should Contain    Exploratory Testing
        Tolerant Click    ${NAV_EXPLOTARY_TESTING}
        Page Should Contain    Exploratory Testing Explained
    ELSE IF    "${link_status}" == "Data-Driven Testing"
        Sleep    5s
        Page Should Contain    Data-Driven Testing
        Tolerant Click    ${NAV_DATA-DRIVEN-TESTING}
        Page Should Contain    Data-Driven Testing
    ELSE IF    "${link_status}" == "Keyword-Driven Testing"
        Page Should Contain    Keyword-Driven Testing
        Sleep    3s
        Tolerant Click    ${NAV_KEYWORD-DRIVEN_TESTING}
        Page Should Contain    Keyword-Driven Testing
    END

Navigate To Blog
    [Documentation]    This Keyword is used to navigate to Blog
    Wait Until Page Contains Element    ${NAV_BLOG}
    Click Element    ${NAV_BLOG}
    Wait Until Page Contains    TestBench Blog

Navigate To Resources
    [Documentation]    This keyword is used to navigate to Resources.
    Wait Until Page Contains Element    ${NAV_RESOURCES}
    Click Element    ${NAV_RESOURCES}
    Wait Until Page Contains    Find it quick - Use it right away

Navigate To Login
    [Documentation]    Navigates to Login Button
    Set Selenium Speed    0.8
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
    Tolerant Click    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_PAGE_TITLE}

 Navigate To Sign Up
    [Documentation]    This keyword is used to navigate to Sign Up.
    Wait Until Page Contains Element    ${NAV_SIGN_UP}
    Click Element    ${NAV_SIGN_UP}
    Wait Until Page Contains    Get started with a free account

Navigate To TestBench Logo
    [Documentation]    This keyword is used to navigate to TestBench logo
    Wait Until Page Contains Element    ${NAV_LOGO}
    Tolerant Click    ${NAV_LOGO}

Scroll To Video
    [Documentation]    Scrolls the page to bring the video element into view.
    [Arguments]    ${video_title}
    Wait Until Page Contains Element    ${EXPLORATORY_TESTING_TITLE_VIDEO}
    Page Should Contain    ${video_title}
    Wait Until Page Contains Element    ${EXPLORATORY_TESTING_VIDEO}
    Scroll Element Into View    ${EXPLORATORY_TESTING_VIDEO}

Play Video
    [Documentation]    Placeholder for the Play Video keyword.
    Set Selenium Speed    0.3
    Wait Until Page Contains Element    ${EXPLORATORY_TESTING_VIDEO}
    Double Click Element    ${EXPLORATORY_TESTING_VIDEO}
    Wait Until Page Contains Element    ${VIDEO_PLAYER}
    Tolerant Click    ${VIDEO_PLAYER}

Control Video Playback
    [Documentation]    Placeholder for the Pause Video keyword.
    [Arguments]    ${video_status}
    Set Selenium Speed    0.3
    IF    "${video_status}" == "Play_video"
        Wait Until Page Contains Element    ${EXPLORATORY_TESTING_VIDEO}
        Double Click Element    ${EXPLORATORY_TESTING_VIDEO}
        Wait Until Page Contains Element    ${VIDEO_PLAYER}
        Tolerant Click    ${VIDEO_PLAYER}
    ELSE IF    "${video_status}" == "Pause_Video"
        Wait Until Page Contains Element    ${VIDEO_PLAYER}
        Tolerant Click    ${VIDEO_PLAYER}
    END

Perform Language Switching
    [Documentation]    Performs language switching from `${ENGLISH}` to `${GERMAN}`
    ...    and,${GERMAN} to ${ENGLISH} verifies the switch.
    [Arguments]    ${language}
    Set Selenium Speed    0.3
    IF    "${language}" == "English"
        Wait Until Page Contains Element    ${ENGLISH}
        Page Should Contain    English
        ${english_text}    Get Text    ${ENGLISH}
        Tolerant Click    ${ENGLISH}
    ELSE IF    "${language}" == "German"
        Wait Until Page Contains Element    ${ENGLISH}
        Mouse Over    ${ENGLISH}
        Wait Until Page Contains Element    ${GERMAN}
        Tolerant Click     ${GERMAN}
        Wait Until Page Contains Element    ${ACCEPT_GERMAN_COOKEIS}
        Tolerant Click                      ${ACCEPT_GERMAN_COOKEIS}
        Page Should Contain    Deutsch
        Mouse Over    ${GERMAN}
        Page Should Contain    Deutsch
        ${german_text}    Get Text    ${GERMAN}
    ELSE IF    "${language}" == "English_To_German"
        Wait Until Page Contains Element    ${ENGLISH}
        Tolerant Click    ${ENGLISH}
        Wait Until Page Contains Element    ${GERMAN}
        Tolerant Click    ${GERMAN}
        Wait Until Page Contains Element    ${ACCEPT_GERMAN_COOKEIS}
        Tolerant Click                      ${ACCEPT_GERMAN_COOKEIS}
    ELSE IF    "${language}" == "German_To_English"
        Page Should Contain    Deutsch
        Wait Until Page Contains Element    ${GERMAN}
        Tolerant Click    ${GERMAN}
        Wait Until Page Contains Element    ${ENGLISH}
        Tolerant Click    ${ENGLISH}
    END

# Perform Language Switching
#    [Documentation]    Performs language switching from `${ENGLISH}` to `${GERMAN}`
#    ...    and,${GERMAN} to ${ENGLISH} verifies the switch.
#    [Arguments]    ${language}
#    Set Selenium Speed    0.3
#    IF    "${language}" == "English"
#    Wait Until Page Contains Element    ${ENGLISH}
#    Page Should Contain    English
#    Tolerant Click    ${ENGLISH}
#    ELSE IF    "${language}" == "German"
#    Wait Until Page Contains Element    ${GERMAN}
#    Page Should Contain    Deutsch
#    Tolerant Click    ${GERMAN}
#    ELSE IF    "${language}" == "English_To_German"
#    Page Should Contain    English
#    Wait Until Page Contains Element    ${GERMAN}
#    Tolerant Click    ${GERMAN}
#    Wait Until Page Contains Element    ${ACCEPT_GERMAN_COOKEIS}
#    Tolerant Click    ${ACCEPT_GERMAN_COOKEIS}
#    ELSE IF    "${language}" == "German_To_English"
#    Page Should Contain    Deutsch
#    Wait Until Page Contains Element    ${GERMAN}
#    Tolerant Click    ${GERMAN}
#    Wait Until Page Contains Element    ${ENGLISH}
#    Tolerant Click    ${ENGLISH}
#    END

Scroll To Verify Test Bench Logo
    [Documentation]    Scrolls to and clicks the Test Bench Logo,
    ...    on footer page
    Scroll Element Into View    ${FOOTER_TB_LOGO}
    Tolerant Click    ${FOOTER_TB_LOGO}
