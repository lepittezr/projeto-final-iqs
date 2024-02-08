*** Settings ***

Library    SeleniumLibrary

Test Setup    Run Keywords

*** Variables ***

${URL}        http://sistemas.t2mlab.com:3006/
${BROWSER}    chrome

&{LOGIN_PAGE}
...    UsernameInput=id:formBasicEmail
...    PasswordInput=id:formBasicPassword
...    LoginButton=css=.botao-default

*** Keywords ***

Realizar Login Válido Colaborador
    Input Text    ${LOGIN_PAGE.UsernameInput}    BLCarvalho
    Input Password    ${LOGIN_PAGE.PasswordInput}    123
    Click Element    ${LOGIN_PAGE.LoginButton}

Realizar Login Válido Gestor
    Input Text    ${LOGIN_PAGE.UsernameInput}    Alan
    Input Password    ${LOGIN_PAGE.PasswordInput}    123
    Click Element    ${LOGIN_PAGE.LoginButton}    

Realizar Login Inválido
    Input Text    ${LOGIN_PAGE.UsernameInput}    BLCarvalho
    Input Password    ${LOGIN_PAGE.PasswordInput}    senhaerrada
    Click Element    ${LOGIN_PAGE.LoginButton}

*** Test Cases ***
TC001 - Realizar Login com Credenciais Válidas - Colaborador
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login Válido Colaborador
    Close Browser

TC002 - Realizar Login com Credenciais Válidas - Gestor
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login Válido Gestor
    Close Browser   

TC003 - Verificar Credenciais Inválidas - Colaborador
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login Inválido
    Close Browser

