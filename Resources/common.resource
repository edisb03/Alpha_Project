*** Settings ***
Documentation       Common
Resource            import.resource
Library    XML
Library    OperatingSystem


*** Variables ***
${JSON_FILE_PATH}     ${EXECDIR}//Json//lang.json

&{TESTBENCH_URL}
...    prod=https://www.testbench.com/

${ENV}            prod

${CHECKBOX}                 //div[@class='newsletter']//label//span
${COOKIES}                  //p[@class='_brlbs-accept'][1]
${FIRST_HEADER}             //h1[@class='h1']


*** Keywords ***
Start Test Bench
    [Documentation]  Start browser, maximize window and navigate to TestBench Website
    [Arguments]   ${url}=${TESTBENCH_URL.${ENV}}
    ${json_content}=    Get File    ${JSON_FILE_PATH}
    ${headlessbrowser}=    Evaluate   json.loads('''${json_content}''')['browser']    json
    Start Browser     ${url}   # ${headlessbrowser}
    Accept Cookies
    ${language}=    Evaluate   json.loads('''${json_content}''')['language']    json
    Perform Language Switching     ${language} 

Accept Cookies
    [Documentation]    This keyword is for accepting cookies on the TestBench web page.
    ${accept}    Run Keyword And Return Status    Element Should Be Visible    ${COOKIES}
    IF    '${accept}' == 'True'
        Set Selenium Speed    0.2
        Wait Until Page Contains Element    ${COOKIES}
        Tolerant Click    ${COOKIES}
        Wait Until Keyword Succeeds    3x    1s    Verify Main Header
    ELSE
        Element Should Not Be Visible    ${COOKIES}
        No Operation
    END

Tick The Checkbox
    [Documentation]    Waits until the specified checkbox element is present on the page
    ...    Once the checkbox is visible, it's clicked to select it.
    Wait Until Page Contains Element        ${CHECKBOX}
    Tolerant Click                         ${CHECKBOX}
