*** Settings ***
Documentation    Keywords for Footer
Resource        ../import.resource


*** Variables ***
${FOOTER_TB_LOGO}      (//img[@alt='TestBench'])[3]
# Footer Headlines universal locators
${TESTBENCH_HL}        (//span[contains(@class, 'menu-item--headline')])[1]
${LEARN_HL}            (//span[contains(@class, 'menu-item--headline')])[2]
${SUPPORT_HL}          (//span[contains(@class, 'menu-item--headline')])[3]
${COMPANY_HL}          (//span[contains(@class, 'menu-item--headline')])[4]
# TestBench Headline links locators
${HOME_LINK}              //ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'H')]
${FEATURES_LINK}          //ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'F')]
${EXPLOR_TESTING_LINK}    //ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'E')]
${DD_TESTING_LINK}        (//ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'D')])[1]
${KD_TESTING_LINK}        //ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'Ke')]
${KD_TITLE}               //h1[contains(@class, 'h1')]


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
    ELSE IF  "${headlines}" == "Learn"
         Wait Until Page Contains Element    ${LEARN_HL}
    ELSE IF    "${headlines}" == "Support"
         Wait Until Page Contains Element    ${SUPPORT_HL}
    ELSE IF    "${headlines}" == "Company"
         Wait Until Page Contains Element    ${COMPANY_HL}
    END

 Click Testbench Headline Link
    [Documentation]    This keyword is used for validating the progress of TestBench Headline Links
    [Arguments]    ${testbench_links}
    IF    "${testbench_links}" == "Home"
         Wait Until Page Contains Element    ${HOME_LINK}
         Tolerant Click    ${HOME_LINK}
         Wait Until Page Contains Element    ${FIRST_HEADER}
    ELSE IF  "${testbench_links}" == "Features"
         Wait Until Page Contains Element    ${FEATURES_LINK}
         Tolerant Click    ${FEATURES_LINK}
         Control If The MH Page Contains    Discover the features
    ELSE IF    "${testbench_links}" == "Exploratory Testing"
         Wait Until Page Contains Element    ${EXPLOR_TESTING_LINK}
         Tolerant Click    ${EXPLOR_TESTING_LINK}
         Control If The MH Page Contains   Explore. Learn. Create. Execute. Improve.
    ELSE IF    "${testbench_links}" == "Data Driven Testing"
         Wait Until Page Contains Element    ${DD_TESTING_LINK}
         Tolerant Click    ${DD_TESTING_LINK}
         Control If The MH Page Contains    Let the Data Do All Your Testing
    ELSE IF    "${testbench_links}" == "Keyword Driven Testing"
         Wait Until Page Contains Element    ${KD_TESTING_LINK}
         Tolerant Click    ${KD_TESTING_LINK}
         Control If The MH Page Contains    Unambiguous. Concise. Readable Test Cases.
    END
