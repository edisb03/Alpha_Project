*** Settings ***
Documentation       This file is used to connect all files, and to import all other folders

Library             SeleniumLibrary
Library             Collections
Resource            ../Resources/common.resource
Resource            common.resource
Resource            common/Web_Apps.resource
# Keywords resources
Resource            ../Resources/TestBench_Resources/Log_In.resource
Resource            Main_Header/MH_Navigation.resource
#Library    ../Resources/python.configuration/test.py
