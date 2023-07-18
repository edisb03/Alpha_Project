*** Settings ***
Documentation       ...

# Resource    other.resource
# Resource    variables.py
# Resource    custom_library.py
Resource            common_Second.resource
Resource            common_Navigate.resource
Library            ../Resources/python.configuration/test.py
Library             SeleniumLibrary
#Library             AutoItLibrary


*** Variables ***

*** Keywords ***

