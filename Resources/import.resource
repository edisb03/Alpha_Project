*** Settings ***
Documentation       This file is used to connect all files, and to import all other folders
Library             Collections
Library             SeleniumLibrary
Resource            ../Resources/common.resource
Resource            common.resource
Resource            common/Web_Apps.resource

# Keywords resources
Resource            ../Resources/TestBench_Resources/Log_In.resource
Resource            Main_Header/MH_Navigation.resource
Resource            Main_Header/Blog.Resource
Resource            Main_Header/Features.resource
Resource            Main_Header/Resources.resource
Resource            Main_Header/HomePage.resource

### Python files resources
# Library            ../Resources/python.configuration/test.py
