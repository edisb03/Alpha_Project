*** Settings ***
Documentation       Resource

Resource            ../common.resource


*** Variables ***
#Resources Suboptions Keywords
${INTEGRATION}            (//a[contains(text(),'Integration')])[1]
${INTEGRATION_TITLE}      //p[@class='overline']
${ITORX}                  (//a[@class=" menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-1762 menu-item-has-children"])[2]
${ITORX_TITLE}            //h2[@class='h2 has-no-overline']
#Integration page keywords
${PERFECT_TOOL_TITLE}                           //h2[@class='h2']
${PERFECT_TOOL_DESCRIPTION}                     (//div[@class='content'])[1]
#Connect the TestBench with your requirements management keywords
${REQUIREMENT_TOOL_CONNECTION_TITLE}            (//h2[@class="h3 has-no-overline"])[1]
${REQUIREMENT_TOOL_CONNECTION_PARAGRAPH}        (//div[contains(@class, 'box-inner box-inner--content text')]/p)[1]
${REQUIREMENT_TOOL_CONNECTION_LIST}             (//div[contains(@class, 'box-inner box-inner--content text')]/ul)[1]
${REQUIREMENT_TOOL_CONNECTION_CONTENT}          (//div[contains(@class, 'box-inner box-inner--content text')]/p)[2]
#Connect the TestBench with your defect management tool keywords
${DEFECT_MANAGMENT_CONNECTION_TITLE}            (//h2[@class="h3 has-no-overline"])[2]
${DEFECT_MANAGMENT_CONNECTION_PARAPGRAPH}       (//div[contains(@class, 'box-inner box-inner--content text')]/p)[3]
${DEFECT_MANAGMENT_CONNECTION_LIST}             (//div[contains(@class, 'box-inner box-inner--content text')]/ul)[2]
${DEFECT_MANAGMENT_CONNECTION_CONTENT}          (//div[contains(@class, 'box-inner box-inner--content text')]/p)[4]
#Connect the TestBench with your test automation tool keywords
${AUTOMATION_TOOL_CONNECTION_TITLE}              (//h2[@class="h3 has-no-overline"])[3]
${AUTOMATION_TOOL_CONNECTION_PARAGRAPH}          (//div[contains(@class, 'box-inner box-inner--content text')]/p)[5]
${AUTOMATION_TOOL_CONNECTION_LIST}               (//div[contains(@class, 'box-inner box-inner--content text')]/ul)[3]
${AUTOMATION_TOOL_CONNECTION_CONTENT}            (//div[contains(@class, 'box-inner box-inner--content text')]/p)[6]
${AUTOMATION_TOOL_CONNECTION_CONTENT_LAST}       (//div[contains(@class, 'box-inner box-inner--content text')]/p)[7]
#Questions Content keywords
${QUESTIONS_TITLE}                                (//h2[@class="h2 has-no-overline"])[1]
${QUESTIONS_CONTENT}                              (//div[@class="content"])[2]
${ASK_US_BUTTON}                                  //a[@class="button button--primary"]

#iTORX page keywords

${WIZARD_TITLE}                   //h2[contains(@class, 'h2 has-no-overline')]
${WIZZARD_DESCRIPTION}            (//div[contains(@class, 'content')])[1]
${SECURE_CLEAR_ACCURATE_TITLE}    (//h2[contains(@class, 'h3 has-no-overline')])[1]
${HEADER3_DESCRIPTION}            //div[contains(@id, 'anchor-secure._clear._accurate.')]//p


*** Keywords ***
Verify Resources Drop Menu Item
    [Documentation]    Verify Resources suboption
    [Arguments]    ${resources_links}
    IF    "${resources_links}" == "Integration"
        Page Should Contain Element    ${INTEGRATION}
        Tolerant Click   ${INTEGRATION}
        Page Should Contain Element    ${INTEGRATION_TITLE}
    ELSE IF    "${resources_links}" == "iTORX"
        Page Should Contain Element    ${ITORX}
        Page Should Contain Element    ${ITORX_TITLE}
        Tolerant Click    ${ITORX}
    END


Check iTORX First Components
    [Documentation]   This keyword verifies the iTORX page content
    Page Should Contain Element    ${WIZARD_TITLE} 
    Page Should Contain Element    ${WIZZARD_DESCRIPTION}
    Page Should Contain Element    ${SECURE_CLEAR_ACCURATE_TITLE}
    Page Should Contain Element    ${HEADER3_DESCRIPTION}

Verify New Automation Page
    [Documentation]    Check for New Page Loaded
    ${handles}=  Get Window Handles
    Switch Window    ${handles}[1]

# Verify Page Of GitHub
#     [Documentation]    Check for the content text of GitHub page. This keyword its not usable on new version.
#     [Arguments]    ${GitHub_page_tittle}
#     IF    '${GitHub_page_tittle}' == "Test Case Automation Agent for TestBench CS"
#         Execute JavaScript    window.scrollTo(0,1000);
#         Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${TA_TITLE}
#     ELSE IF    "${GitHub_page_tittle}" == "DDT table import via Excel for TestBench CS"
#         Execute JavaScript    window.scrollTo(0,500);
#         Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${DD_PAGE_TITLE}
#     ELSE IF    "${GitHub_page_tittle}" == "Defect Export via Excel for TestBench CS"
#         Execute JavaScript    window.scrollTo(0,500);
#         Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${DE_PAGE_TITLE}
#     ELSE IF    "${GitHub_page_tittle}" == "Setup users along with Workspaces in TestBench CS"
#         Execute JavaScript    window.scrollTo(0,500);
#         Wait Until Keyword Succeeds    3x    1s    Page Should Contain Element    ${FS_PAGE_TITLE}
#     ELSE
#         Fail    Unexpected status:  ${GitHub_page_tittle}
#     END



Validate Title
    [Documentation]    Scrolls down to the middle of the page
    [Arguments]    ${text}
    Execute JavaScript    window.scrollTo(0,500);
    Page Should Contain    ${text}

Verify Main Header
    [Documentation]    Checks if the main header exits
    Wait Until Page Contains Element    ${MAIN_HEADER}
