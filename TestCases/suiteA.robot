*** Settings ***
Documentation       ...

Resource            ../Resources/common.resource
Library             SeleniumLibrary

# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser


*** Test Cases ***
 # Browser Library to install
