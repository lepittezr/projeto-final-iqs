*** Settings ***
Resource    ../main.robot


*** Variables ***
${URL}        http://sistemas.t2mlab.com:3006/
${BROWSER}    chrome

*** Keywords ***
Open Browser for Navigation
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window

Close your Browser
    Sleep    time_=2s
    Close Browser