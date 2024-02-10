*** Settings ***
Resource    ../main.robot

*** Variables ***

&{LOGIN_PAGE}
...    UsernameInput=id:formBasicEmail
...    PasswordInput=id:formBasicPassword
...    LoginButton=css=.botao-default

${WARNING_ERROR}    css=.Toastify__toast
${SELECT_PROJECT}    css=.col-lg-3:nth-child(3) .MuiCardMedia-root

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
    Wait Until Element Is Visible    ${WARNING_ERROR}    timeout=2s
    Element Should Be Visible    ${WARNING_ERROR}
    Location Should Be    url=${URL}

Selecionar Projeto
    Wait Until Element Is Enabled    ${SELECT_PROJECT}    timeout=10s
    Click Element    ${SELECT_PROJECT}