*** Settings ***
Documentation    Keywords for Footer
Resource        ../import.resource


*** Variables ***
${FOOTER_TB_LOGO}      (//img[@alt='TestBench'])[3]
# Footer Headlines universal locators
${TESTBENCH_HL}        (//span[contains(@class, 'menu-item--headline')])[1]
${SUPPORT_HL}          (//span[contains(@class, 'menu-item--headline')])[2]
${COMPANY_HL}          (//span[contains(@class, 'menu-item--headline')])[3]
# TestBench Headline links locators
${HOME_LINK}              (//ul[contains(@class, 'menu menu--level-1')]//a[contains(@href,"https://www.testbench.com/")])[1]
${HOME_TITLE}             //h1[@class='h1 has-no-overline']
# Support links
${CONTACT_SUPPORT}        (//ul[contains(@class, 'menu menu--level-1')]//a[contains(@href,"mailto:info@testbench.com")])[1]
# Company Links
${LEGAL_LINK}             (//ul[contains(@class, 'menu menu--level-1')]//li[contains(@class, 'menu-item menu-item-type-post_type menu-item-object-page menu-item-')])[2]
${LEGAL_TITLE}            //h1[@class='overline']
# Twitter button
${TWITTER_BUTTON}        //ul[contains(@class, 'menu menu--level-0')]//a[contains(@href,"https://twitter.com/TestBench_4")]
# Facebook button
${FACEBOOK_BUTTON}        //ul[contains(@class, 'menu menu--level-0')]//a[contains(@href, "https://www.facebook.com/TestBench4")]
# Close X Window
${CLOSE_X}                /div[@aria-label='Close']


*** Keywords ***
Check Footer Test Bench Logo
    [Documentation]    This keyword verifies that testbench logo is showing in the bottom right of footer
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Page Should Contain Element    ${FOOTER_TB_LOGO}

Validate Footer HeadLine
    [Documentation]    This keyword is used for validating headline items of footer
    [Arguments]    ${headlines}
    IF    "${headlines}" == "TestBench"
         Wait Until Page Contains Element    ${TESTBENCH_HL}
    ELSE IF    "${headlines}" == "Support"
         Wait Until Page Contains Element    ${SUPPORT_HL}
    ELSE IF    "${headlines}" == "Company"
         Wait Until Page Contains Element    ${COMPANY_HL}
    END

Validate Home Link
    [Documentation]    This keyword is used for validating Home link at footer section
         Wait Until Page Contains Element    ${HOME_LINK}
         Tolerant Click    ${HOME_LINK}
         Wait Until Page Contains Element    ${HOME_TITLE}

Check Contact Support Link
    [Documentation]    This keyword is used for validation of Contact Support Link
    Wait Until Page Contains Element    ${CONTACT_SUPPORT}
    Tolerant Click    ${CONTACT_SUPPORT}

Check Legal Link
    [Documentation]    This keyword is used for validation of Legal Link
    Wait Until Page Contains Element    ${LEGAL_LINK}
    Tolerant Click    ${LEGAL_LINK}
    Wait Until Page Contains Element    ${LEGAL_TITLE}

Navigate To Twitter Button
    [Documentation]    This keyword validates Twitter button
    Wait Until Page Contains Element    ${TWITTER_BUTTON}
    Tolerant Click    ${TWITTER_BUTTON}

Switch To New Tab
    [Documentation]    Switching to new tab
    ${window_handles}=    Get Window Handles
    ${new_tab}=    Set Variable    ${window_handles}[1]
    Switch Window    ${new_tab}

Validate New Tab Page
    [Documentation]    Validate new tab page
    Wait Until Element Is Visible    ${CLOSE_X}
    Click Element    ${CLOSE_X}

Navigate To Facebook Button
    [Documentation]    This keyword validates Twitter button
    Wait Until Page Contains Element    ${FACEBOOK_BUTTON}
    Tolerant Click    ${FACEBOOK_BUTTON}