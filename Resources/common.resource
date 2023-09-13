*** Settings ***
Documentation       Common
Resource            import.resource
Resource            ../Json/lang.json
Library    XML
Library    OperatingSystem
Library    JSONLibrary


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
    Start Browser     ${url}   # headlesschrome
    Accept Cookies
    Get Json Data = ${JSON_FILE_PATH}
    ${json_content}=    Get File    Get Json Data
    ${selected_options}=    Get From Dictionary    json.loads('''${json_content}''')['option_2']    json
    Perform Language Switching     ${selected_options}  # Langauges available Deutsch or English
    RETURN    ${selected_options}

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
