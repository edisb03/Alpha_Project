*** Settings ***
Documentation       Keywords for Log In Form
Resource            ../import.resource


*** Variables ***
${LOGIN_BUTTON}           //div[@class='wrapper']//li[5]
${LOGIN_PAGE_TITLE}       //div[@class='box-inner box-inner--right']//div[@id='logIn']//div[@class='overline']
