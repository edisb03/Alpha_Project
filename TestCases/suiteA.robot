*** Settings ***
Documentation       ...

Resource            ../Resources/common.resource
Library             SeleniumLibrary

<<<<<<< HEAD
# Test Setup    Open Browser
# Test Teardown       Close Browser
=======
# Test Setup    Open Web Browser    browser_type=headlesschrome
Test Setup          Open Web Browser
Test Teardown       Close Browser
>>>>>>> dev


*** Test Cases ***
 # Browser Library to install
