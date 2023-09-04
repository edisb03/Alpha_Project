*** Settings ***
Documentation       Main Header Section    ...

Resource            ..//Resources/import.resource

Test Setup          Open Web Browser    # browser_type=headlesschrome
Test Teardown       Close Browser

*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
    [Documentation]    Navigate and Validate Cards On Home Page.
    [Tags]    p1to01_tc01    exploratory
    Accept Cookies
    Control If The Page Contains    What You Can Do With TestBench
    Check Test Bench Service Cards

P1_TO01_MH_TC02 Start For Free
    [Documentation]    Navigate to the TestBench for free use.
    [Tags]    p1to01_tc02    exploratory
    Accept Cookies
    Navigate To TestBench Logo
    Use TestBench For Free

P1_TO01_MH_TC03 Learn More About Imbus
    [Documentation]    Verifies that Learn More About Imbus button is clickable and its own new page is opened.
    [Tags]    p1to01_tc03    exploratory
    Accept Cookies
    Navigate To TestBench Logo
    More About Imbus
    Accept Cookies Imbus Page

P1_TO01_MH_TC04 Verify Feature Functions
    [Documentation]    Navigates to Features and verifies each existing features.
    [Tags]    p1to01_tc04    exploratory
    Accept Cookies
    Navigate To Features
    Verify Content Features

P1_TO01_MH_TC05 Verify Try TestBench Now
    [Documentation]    After open test bench page, open Features item and check
    ...    if button "Try TestBench Now" within the page is enabled.
    [Tags]    p1to01_tc05    explorator
    Accept Cookies
    Navigate To Features
    Try TestBench Now

P1_TO01_MH_TC06 Verify Try Exploratory Testing
    [Documentation]    After open test bench page, open Features item and check,
    ...    if button "Try Exploratory Testing" within the page is enabled.
    [Tags]    p1to01_tc06    exploratory
    Accept Cookies
    Navigate To Features
    Try Exploratory Testing
    Go Back
    Navigate To Learn More Exploratory Testing    Learn More
    Control If The MH Page Contains   Explore. Learn. Create. Execute. Improve.

P1_TO01_MH_TC07 Verify Try Data-Driven Testing
    [Documentation]    Verify Try Data-Driven Testing button.
    [Tags]    p1to01_tc07    exploratory
    Accept Cookies
    Navigate To Features
    Try Data-Driven Testing
    Go Back
    Navigate To Learn More Data Driven    Learn More
    Control If The MH Page Contains
    ...    Let the Data Do All Your Testing

P1TO01_TC09 Navigate To Blog
    [Documentation]    User open web page of TestBench : www.testbanch.com and,
    ...    checks for Blog item on main Header, then verifies if,
    ...    its clickable and new page is opened after.
    [Tags]    p1to01_tc09    exploratory
    Set Selenium Speed    0.5
    Accept Cookies
    Navigate To Blog
    Control If The MH Page Contains    Welcome to the World of Testing

P1_TO01_MH_TC10 Verify Test Approaches Links
    [Documentation]    Check if Test Approaches link are opened successfully and validate each content of links..
    [Tags]    p1to01_tc10    exploratory
    Accept Cookies
    Navigate To Test Approaches
    Search Links By Name    Exploratory Testing
    Go Back
    Navigate To Test Approaches
    Search Links By Name    Data-Driven Testing
    Go Back
    Navigate To Test Approaches
    Search Links By Name    Keyword-Driven Testing

P1TO01_TC11 Validate Video Exploratory Testing
    [Documentation]    User opens the web page of TestBench: www.testbench.com and
    ...    checks if they can open Exploratory Testing under Test Approaches on the Main Header
    ...    finding the specified link, scrolling to a video, and controlling the video
    ...    playback by playing and pausing it.
    [Tags]    p1to01_tc11    exploratory
    Set Selenium Speed    0.5
    Accept Cookies
    Navigate To Test Approaches
    Search Links By Name    Exploratory Testing
    Scroll To Video    The Right Tool
    Control Video Playback    Play_video
    Sleep    0.1min
    Control Video Playback    Pause_Video

P1_TO01_MH_TC12 Navigate As A Test Manager
    [Documentation]    Verify if    As A Test Manager Button is enabled, validate all its elements,
    ...    and verify new page content.
    [Tags]    p1to01_tc12    exploratory
    Accept Cookies
    Navigate To Your Personal TestBench Benefit    Test Manager

P1_TO01_MH_TC13 Navigate As A Software Developer
    [Documentation]    Verifies if As A Software Developer Button is enabled, validate all its elements,
    ...    and verify new page content.
    [Tags]    p1to01_tc13    exploratory
    Accept Cookies
    Navigate To Your Personal TestBench Benefit    Software Developer

P1_TO01_MH_TC14 Navigate As A Project Manager
    [Documentation]    Verifies if the As A Project Manager Button works correctly.
    [Tags]    p1to01_tc14    exploratory
    Accept Cookies
    Navigate To Your Personal TestBench Benefit    Project Manager

P1_TO01_MH_TC15 Navigate As A Tester
    [Documentation]    Validates if the As A Test Manager Button is enabled, validate all it elements,
    ...    and verify new page content...
    [Tags]    p1to01_tc15    exploratory
    Accept Cookies
    Navigate To Your Personal TestBench Benefit    Tester

P1_TO01_TC21 Switch Page To Deutch And Revert To Default Language English
    [Documentation]    Verify that users can navigate to the Deutsch version,
    ...    of the website from the home page using the language switcher...
    Accept Cookies
    Verify Default Languange Is    English
    Perform Language Switching    English_To_Deutsch
    Control If The MH Page Contains     The Smart Test Management Tool
    Perform Language Switching    Deutsch_To_Deutsch
    Scroll To Verify Test Bench Logo
    Navigate To TestBench Logo
    Perform Language Switching    Deutsch_To_English
    Control If The MH Page Contains     The Smart Test Management Tool
