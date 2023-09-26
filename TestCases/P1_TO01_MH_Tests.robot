*** Settings ***
Documentation       Main Header Section
...    This section contains test cases for the Main Header functionality
...    on the TestBench website. These test cases cover various scenarios,
...    including navigation, content validation, language switching, and more.

Resource            ..//Resources/import.resource

Test Setup          Start Test Bench
Test Teardown       Close Browser


*** Test Cases ***
P1_TO01_MH_TC01 Verify Cards On Home Page
    [Documentation]    Navigate and Validate Cards On Home Page.
    [Tags]    P1TO01_TC01    exploratory
    Control If The MH Page Contains    What You Can Do With TestBench
    Check Test Bench Service Cards

P1_TO01_MH_TC02 Start For Free
    [Documentation]    Navigate to the TestBench for free use.
    [Tags]    P1TO01_TC02    exploratory
    Navigate To TestBench Logo
    Use TestBench For Free

P1_TO01_MH_TC03 Learn More About Imbus
    [Documentation]    Verifies that Learn More About Imbus button is clickable and its own new page is opened.
    [Tags]    P1TO01_TC03    exploratory
    Navigate To TestBench Logo
    More About Imbus
    Open Imbus Page

P1_TO01_MH_TC04 Verify Feature Functions
    [Documentation]    Navigates to Features and verifies each existing features.
    [Tags]    P1TO01_TC04    exploratory
    Navigate To Features
    Verify Content Features

P1_TO01_MH_TC05 Verify Try TestBench Now
    [Documentation]    After open test bench page, open Features item and check
    ...    if button "Try TestBench Now" within the page is enabled.(This test case can be tested only when page
    ...    is in English since TestBench Now button doesn't appear when page is in German)
    [Tags]    P1TO01_TC05    explorator
    Navigate To Features
    Try TestBench Now

P1_TO01_MH_TC06 Verify Try Exploratory Testing
    [Documentation]    After open test bench page, open Features item and check,
    ...    if button "Try Exploratory Testing" within the page is enabled.
    [Tags]    P1TO01_TC06    exploratory
    Navigate To Features
    Try Exploratory Testing
    Go Back
    Navigate To Learn More Exploratory Testing    Learn More
    Control If The MH Page Contains   Explore. Learn. Create. Execute. Improve.

P1_TO01_MH_TC07 Verify Try Data-Driven Testing
    [Documentation]    Verify Try Data-Driven Testing button.
    [Tags]    P1TO01_TC07    exploratory
    Perform Language Switching    English_To_Deutsch
    Navigate To Features
    Try Data-Driven Testing
    Go Back
    Navigate To Learn More Data Driven    Learn More
    Control If The MH Page Contains    Let the Data Do All Your Testing

P1_TO01_MH_TC08 Navigate To English Language
    [Documentation]    Verifies that English option is shown at Header of the testbench page.
    [Tags]    P1TO01_TC08    exploratory
    Verify Default Languange Is    English

P1_TO01_TC09 Navigate To Blog
    [Documentation]    User open web page of TestBench : www.testbanch.com and,
    ...    checks for Blog item on main Header, then verifies if,
    ...    its clickable and new page is opened after.
    [Tags]    P1TO01_TC09    exploratory
    Navigate To Blog
    Control If The MH Page Contains    Welcome to the World of Testing

P1_TO01_MH_TC10 Verify Test Approaches Links
    [Documentation]    Check if Test Approaches link are opened successfully and validate each content of links..
    [Tags]    P1TO01_TC10    exploratory
    Navigate To Test Approaches
    Search Links By Name    Exploratory Testing
    Go Back
    Navigate To Test Approaches
    Search Links By Name    Data-Driven Testing
    Go Back
    Navigate To Test Approaches
    Search Links By Name    Keyword-Driven Testing

P1_TO01_TC11 Validate Video Exploratory Testing
    [Documentation]    User opens the web page of TestBench: www.testbench.com and
    ...    checks if they can open Exploratory Testing under Test Approaches on the Main Header
    ...    finding the specified link, scrolling to a video, and controlling the video
    ...    playback by playing and pausing it.
    [Tags]    P1TO01_TC11    exploratory
    Set Selenium Speed    0.5
    Navigate To Test Approaches
    Search Links By Name    Exploratory Testing
    Scroll To Video    The Right Tool
    Control Video Playback    Play_video
    Sleep    0.1min
    Control Video Playback    Pause_Video

P1_TO01_MH_TC12 Navigate As A Test Manager
    [Documentation]    Verify if    As A Test Manager Button is enabled, validate all its elements,
    ...    and verify new page content.
    [Tags]    P1TO01_TC12    exploratory
    Navigate To Your Personal TestBench Benefit    Test Manager

P1_TO01_MH_TC13 Navigate As A Software Developer
    [Documentation]    Verifies if As A Software Developer Button is enabled, validate all its elements,
    ...    and verify new page content.
    [Tags]    P1TO01_TC13    exploratory
    Navigate To Your Personal TestBench Benefit    Software Developer

P1_TO01_MH_TC14 Navigate As A Project Manager
    [Documentation]    Verifies if the As A Project Manager Button works correctly.
    [Tags]    P1TO01_TC14    exploratory
    Navigate To Your Personal TestBench Benefit    Project Manager

P1_TO01_MH_TC15 Navigate As A Tester
    [Documentation]    Validates if the As A Test Manager Button is enabled, validate all it elements,
    ...    and verify new page content...
    [Tags]    P1TO01_TC15    exploratory
    Navigate To Your Personal TestBench Benefit    Tester

P1_TO01_MH_TC16 Verify Test Automation Link Within Resources Page
    [Documentation]    Verifies if user can click Test Automation Link which is within Resources page
    ...    and validates next page.
    [Tags]    P1TO01_TC16    exploratory
    Navigate To Resources
    Verify Resources Links    Test Automation
    Verify New Automation Page
    Verify Page Of GitHub    Test Case Automation Agent for TestBench CS

P1_TO01_MH_TC17 Verify Data-Driven Testing Link Within Resources Page
    [Documentation]    Verifies if user can click Data-Driven Testing Link which is within Resources page
    ...    and validates next page.
    [Tags]    P1TO01_TC17    exploratory
    Navigate To Resources
    Verify Resources Links    Data-Driven Testing
    Verify New Automation Page
    Verify Page Of GitHub    DDT table import via Excel for TestBench CS

P1_TO01_MH_TC18 Verify Defect Export Link Within Resources Page
    [Documentation]    Verifies if user can click Defect Export Link which is within Resources page
    ...    and validates next page.
    [Tags]    P1TO01_TC18    exploratory
    Navigate To Resources
    Verify Resources Links    Defect Export
    Verify New Automation Page
    Verify Page Of GitHub    Defect Export via Excel for TestBench CS

P1_TO01_MH_TC19 Verify Fast Setup Link Within Resources Page
    [Documentation]    Verifies if user can click Fast Setup Link which is within Resources page
    ...    and validates next page.
    [Tags]    P1TO01_TC19    exploratory
    Navigate To Resources
    Verify Resources Links    Fast Setup
    Verify New Automation Page
    Verify Page Of GitHub    Setup users along with Workspaces in TestBench CS

P1_TO01_MH_TC20 Verify English Option In The Language Dropdown List
    [Documentation]    Verifies that English option is shown in the language dropdown list
    [Tags]    P1TO01_TC20    exploratory
    Perform Language Switching    English

P1_TO01_TC21 Switch Page To Deutch And Revert To Default Language English
    [Documentation]    Verify that users can navigate to the Deutsch version,
    ...    of the website from the home page using the language switcher...
    [Tags]    P1TO01_TC21    exploratory
    Verify Default Languange Is    English
    Perform Language Switching    Deutsch
    Control If The MH Page Contains     The Smart Test Management Tool
    Perform Language Switching    Deutsch
    Scroll To Verify Test Bench Logo
    Navigate To TestBench Logo
    Perform Language Switching    English
    Control If The MH Page Contains     The Smart Test Management Tool

P1_TO01_TC22 Search For Existing Blog Articles
    [Documentation]    User open web page of TestBench, navigates to the Blog
    ...    and search some existing articles within the Blog
    [Tags]    P1TO01_TC22    exploratory
    Navigate To Blog
    Control If The MH Page Contains    TestBench Blog
    Navigate To The All Articles
    Check All Articles
    Next Link
    Check All Articles Page Two
    Next Link Page Two
    Check All Articles Page Three

P1_TO01_TC23 Verify Tabs Names Blog
    [Documentation]    User open web page of TestBench, navigates to the Blog
    ...    and search some existing articles within the Blog and checks tab name of the page three
    [Tags]    P1TO01_TC23    exploratory
    Navigate To Blog
    Control If The MH Page Contains    TestBench Blog
    Next Link
    Next Link Page Two
    Blog Tab Name     Blog - Page 3 of 3 - TestBench

P1_TO01_TC24 Featured Articles
    [Documentation]    User open web page of TestBench, navigates to the Blog
    ...    and search some existing articles within the Blog
    [Tags]    P1_TO01_TC24    exploratory
    Navigate To Blog
    Control If The MH Page Contains    TestBench Blog
    Navigate To The All Articles
    Featured Articles
