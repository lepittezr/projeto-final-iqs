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

${SELECT_PROJECT}    css=.col-lg-3:nth-child(3) .MuiCardMedia-root

&{CAD_COMPETENCE}
...    Button=xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[1]/div/div/a/div/button
...    CompetenceInput=id=formBasicEmail
...    DescriptionInput=css=.justify-content-center:nth-child(2) #formBasicEmail
...    ConfirmButton=xpath=//span[contains(.,'Confirmar Cadastro')]
...    ModalButton=css=.hDPZGJ > .botao-default

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

Selecionar Projeto
    Wait Until Element Is Visible    ${SELECT_PROJECT}    timeout=10s
    Click Element    ${SELECT_PROJECT}

Cadastrar Competência
    Wait Until Element Is Visible    ${CAD_COMPETENCE.Button}    timeout=10s
    Click Element    ${CAD_COMPETENCE.Button}
    Wait Until Element Is Visible    ${CAD_COMPETENCE.Button}    timeout=10s
    Click Element    ${CAD_COMPETENCE.Button}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}    Testezinho
    Input Text    ${CAD_COMPETENCE.DescriptionInput}    Isso é apenas um teste
    Click Element    ${CAD_COMPETENCE.ConfirmButton}
    Wait Until Element Is Visible    ${CAD_COMPETENCE.ModalButton}    timeout=10s
    Click Element    ${CAD_COMPETENCE.ModalButton}
    
Campos Obrigatórios Cadastrar Competências
    Wait Until Element Is Visible    ${CAD_COMPETENCE.Button}    timeout=10s
    Click Element    ${CAD_COMPETENCE.Button}
    Wait Until Element Is Visible    ${CAD_COMPETENCE.Button}    timeout=10s
    Click Element    ${CAD_COMPETENCE.Button}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}    Testezinho
    Click Element    ${CAD_COMPETENCE.ConfirmButton}

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

TC004 - Cadastrar Competência
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login Válido Gestor
    Selecionar Projeto
    Cadastrar Competência
    # Close Browser

TC005 - Campos Obrigatórios - Cadastro de Competências
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login Válido Gestor
    Selecionar Projeto
    Campos Obrigatórios Cadastrar Competências

