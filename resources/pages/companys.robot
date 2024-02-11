*** Settings ***
Resource    ../main.robot

*** Variables ***
${SELECT_COMPANY}    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[3]/div/div/div/a/div/button
${REGISTER_COMPANY}    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div/div[1]/div/div/a/div/button
${COMPANY_INPUT}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[1]/div[1]/form/div/input
${CNPJ_INPUT}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[1]/div[2]/form/div/input
${PHONE_INPUT}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[1]/div[3]/form/div/input
${SECTOR_INPUT}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[1]/form/div/input
${ADDRESS_INPUT}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[2]/form/div/textarea
${REQUIRED}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[1]/div[2]/form/div/div
${BACK_PAGE}    xpath=//button[@class='botao-default btn btn-var(--cinza-primario)']
${SEARCH_COMPANY}    xpath=//button[.='Buscar Empresa']

*** Keywords ***
Clicar em empresa
    Click Element    ${SELECT_COMPANY}

Clicar em cadastrar empresa
    Click Element    ${REGISTER_COMPANY}

Preencher os campos
    [Arguments]    ${NAME}=    ${CNPJ}=    ${PHONE}=    ${SECTOR}=    ${ADDRESS}=
    Input Text    ${COMPANY_INPUT}    ${NAME}
    Input Text    ${CNPJ_INPUT}       ${CNPJ}
    Input Text    ${PHONE_INPUT}      ${PHONE}
    Input Text    ${SECTOR_INPUT}     ${SECTOR}
    Input Text    ${ADDRESS_INPUT}    ${ADDRESS}

Rolar a página
    Scroll Element Into View    ${DEFAULT_BUTTON}
    Scroll Element Into View    ${BACK_PAGE}

E aparece o aviso de campo obrigatório
    Wait Until Element Is Visible    ${REQUIRED}
    Element Should Be Visible    ${REQUIRED}

Clicar no botão de voltar
    Wait Until Element Is Enabled    ${BACK_PAGE}    timeout=5s
    Click Element    ${BACK_PAGE}

E clicar em buscar empresa
    Click Element     ${SEARCH_COMPANY}


    
