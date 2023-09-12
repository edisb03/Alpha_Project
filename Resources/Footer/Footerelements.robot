*** Settings ***
Documentation    Keywords for Footer
Resource        ../import.resource


*** Variables ***
${FOOTER_TB_LOGO}      (//img[@alt='TestBench'])[3]
#Footer Headlines universal locators
${TESTBENCH_HL}        (//span[contains(@class, 'menu-item--headline')])[1]
${LEARN_HL}            (//span[contains(@class, 'menu-item--headline')])[2]
${SUPPORT_HL}          (//span[contains(@class, 'menu-item--headline')])[3]
${COMPANY_HL}          (//span[contains(@class, 'menu-item--headline')])[4]
#TestBench Headline links locators
${HOME_LINK}    //ul[contains(@class, 'menu menu--level-1')]//a[contains(text(), 'H')]
${FEATURES_LINK}
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

Navigate To Testbench Link
    [Documentation]    This keyword is used for validating the progress of TestBench Headline Links
    [Arguments]    ${testbench_links}
    IF    $var_in_py_expr1 == $var_in_py_expr2
        
    END