*** Settings ***
Documentation       Keywords for Navigation

Resource            ../import.resource


*** Variables ***
${NAV_FEATURES}                         (//li[contains(@class, 'menu-item')]//a[contains(text(), 'F')])[1]
${NAV_TEST_APPROACHES}                  (//li[contains(@class, 'menu-item')]//a[contains(text(), 'Test')])[1]
### Locators for Test Approaches Links ###
${NAV_EXPLOTARY_TESTING}                (//li[contains(@class, 'nav-drop-item')]//a[contains(text(), 'Explo')])[1]
${NAV_DATA-DRIVEN-TESTING}              (//li[contains(@class, 'nav-drop-item')]//a[contains(text(), 'Dat')])[1]
${NAV_KEYWORD-DRIVEN_TESTING}           (//li[contains(@class, 'nav-drop-item')]//a[contains(text(), 'Key')])[1]
### Main Header Locators ###
${NAV_BLOG}                             (//li[contains(@class, 'menu-item')]//a[contains(text(), 'Blog')])[1]
${NAV_RESOURCES}                        (//li[contains(@class, 'menu-item')]//a[contains(text(), 'R')])[1]
${LOGIN_BUTTON}                         (//li[contains(@class, 'menu-item')]//a[contains(text(), 'L')])[1]
${LOGIN_PAGE_TITLE}                     (//div[@class='overline'])[1]
${NAV_SIGN_UP}                          (//li[contains(@class, 'menu-item')]//a[contains(text(), 'Sign Up')])[1]
${NAV_GER_REG}                          (//li[contains(@class, 'menu-item')]//a[contains(text(), 'Registrieren')])[1]
${NAV_LOGO}                             (//img[@class="logo-image"])[1]
${MAIN_HEADER}                          (//div[contains(@class, "container centerMaxWidthContainer")])[1]
${NAV_TESTBENCH_BENEFITS}               (//h2[@class='overline'])[4]
### Exploratory testing video locators
${EXPLORATORY_TESTING_TITLE_VIDEO}      (//div[@class='box-inner box-inner--content text text--lg'])[3]//h3[@class='h1']
${EXPLORATORY_TESTING_VIDEO}            //button[@aria-label='Play Video']
${VIDEO_PLAYER}                         (//iframe)[1]
${DROP_DOWN}                            (//span[@class='wpml-ls-native'])[1]
${DROP_DOWN_ENGLISH}                     (//li[contains(@class, 'menu-item menu')]//span[contains(@lang, 'en')])[1]
${DROP_DOWN_GERMAN}                     (//li[contains(@class, 'menu-item menu')]//span[contains(@lang, 'de')])[1]
${ENGLISH}                              (//span[contains(@class, 'wpml-ls-native')])[1]
${GERMAN}                               (//span[contains(@class, 'wpml-ls-native')])[1]


*** Keywords ***
Navigate To Features
    [Documentation]    This keyword is used to navigate to Features...
    Wait Until Page Contains Element    ${NAV_FEATURES}
    Click Element    ${NAV_FEATURES}
    Control If The MH Page Contains    Discover the features

Navigate To Test Approaches
    [Documentation]    Navigate To Test Approaches
    Wait Until Page Contains Element    ${NAV_TEST_APPROACHES}
    Tolerant Click    ${NAV_TEST_APPROACHES}

Search Links By Name
    [Documentation]    Search the specified links by using its name
    [Arguments]    ${link_status}
    IF    "${link_status}" == "Exploratory Testing"
        Wait Until Page Contains Element    ${NAV_EXPLOTARY_TESTING}
        Tolerant Click    ${NAV_EXPLOTARY_TESTING}
    ELSE IF    "${link_status}" == "Data-Driven Testing"
        Wait Until Page Contains Element    ${NAV_DATA-DRIVEN-TESTING}
        Tolerant Click    ${NAV_DATA-DRIVEN-TESTING}
    ELSE IF    "${link_status}" == "Keyword-Driven Testing"
        Wait Until Page Contains Element    ${NAV_KEYWORD-DRIVEN_TESTING}
        Tolerant Click    ${NAV_KEYWORD-DRIVEN_TESTING}
    END

Navigate To Blog
    [Documentation]    This Keyword is used to navigate to Blog
    Wait Until Page Contains Element    ${NAV_BLOG}
    Tolerant Click    ${NAV_BLOG}

Navigate To Resources
    [Documentation]    This keyword is used to navigate to Resources.
    Wait Until Page Contains Element    ${NAV_RESOURCES}
    Tolerant Click    ${NAV_RESOURCES}


Navigate To Login
    [Documentation]    Navigates to Login Button
    Set Selenium Speed    0.8
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
    Tolerant Click    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_PAGE_TITLE}

 Navigate To Sign Up
    [Documentation]    This keyword is used to navigate to Sign Up.
    ${status}    Run Keyword And Return Status    Element Should Be Visible     ${NAV_SIGN_UP}
    IF    '${status}' == 'True'
        Wait Until Page Contains Element    ${NAV_SIGN_UP}
        Tolerant Click    ${NAV_SIGN_UP}
        Wait Until Page Contains Element    //h3[@class='h2']
    ELSE
        Wait Until Page Contains Element    ${NAV_GER_REG}
        Tolerant Click    ${NAV_GER_REG}
        Wait Until Page Contains Element    //h3[@class='h2']
    END

Navigate To TestBench Logo
    [Documentation]    This keyword is used to navigate to TestBench logo on Main 
    Wait Until Page Contains Element    ${NAV_LOGO}
    Tolerant Click    ${NAV_LOGO}
    Wait Until Page Contains Element    ${FIRST_HEADER}

Scroll To Video
    [Documentation]    Scrolls the page to bring the video element into view.
    [Arguments]    ${video_title}
    Wait Until Page Contains Element    ${EXPLORATORY_TESTING_TITLE_VIDEO}
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

Verify Default Languange Is
    [Documentation]    Checks which language is currently on the page
    [Arguments]    ${language_page}
    IF    "${language_page}" == "English"
        Wait Until Page Contains Element    ${ENGLISH}
        ${english_text}    Get Text    ${ENGLISH}
    ELSE IF    "${language_page}" == "Deutsch"
        Wait Until Page Contains Element    ${GERMAN}
        ${german_text}    Get Text    ${GERMAN}
    END

Perform Language Switching
    [Documentation]    Performs language switching from `${ENGLISH}` to `${GERMAN}`
    ...    and,${GERMAN} to ${ENGLISH} verifies the switch.
    [Arguments]    ${language}
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${DROP_DOWN_ENGLISH}
    IF    '${status}' == 'True'
        Wait Until Page Contains Element    ${DROP_DOWN_ENGLISH}
        Click Element    ${DROP_DOWN_ENGLISH}
        IF    '${language}' == 'English'
            Wait Until Page Contains Element    ${ENGLISH}
            Click Element    ${ENGLISH}
            Accept Cookies
        ELSE IF    '${language}' == 'Deutsch'
            Wait Until Page Contains Element    ${GERMAN}
            Click Element    ${GERMAN}
            Accept Cookies
        END
    ELSE IF    '${status}' == 'False'
        Wait Until Page Contains Element    ${DROP_DOWN}
        Mouse Over    ${DROP_DOWN}
        Wait Until Page Contains Element    ${DROP_DOWN_GERMAN}
        Click Element    ${DROP_DOWN_GERMAN}
        IF    '${language}' == 'English'
            Wait Until Page Contains Element    ${ENGLISH}
            Click Element    ${ENGLISH}
            Accept Cookies
        ELSE IF    '${language}' == 'Deutsch'
            Accept Cookies
            Wait Until Page Contains Element    ${GERMAN}
            Tolerant Click    ${GERMAN}
        END
    END

Scroll To Verify Test Bench Logo
    [Documentation]    Scrolls to and clicks the Test Bench Logo,
    ...    on footer page
    Scroll Element Into View    ${FOOTER_TB_LOGO}
    Tolerant Click    ${FOOTER_TB_LOGO}

Check Page Button State
    [Documentation]    Keyword to check the state of a button and perform actions accordingly.
    ...    The keyword checks if the button is disabled or enabled to click, and takes actions
    ...    based on the button state.
    [Arguments]    ${button_available}
        Scroll Element Into View   ${button_available}
        Wait Until Page Contains Element    ${button_available}
        Click Element    ${button_available}
        Log    ${button_available} is enabled
