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
Resource            ../Resources/TestBench_Resources/Sign_Up.resource
Resource             ../Resources/Main_Header/API_resource.resource
Library             ../API/Test_Api_Status.py
Library             ../API/Api_Status.py
Library             ../API/API_YAML.py
Library             yaml
# Library              python.configuration/Data_handling.py

### Python files resources
