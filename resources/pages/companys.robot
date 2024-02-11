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
${RANDOM_COMPANY}
${VIEW_SERVICE}    xpath=//strong[contains(.,'Visualizar Serviços')]
${FIRST_ITEM}
${CNPJ_LIST}
${PHONE_LIST}
${SECTOR_LIST}

&{EDIT_COMPANY}
...    EditName=css=.mb-3 > div:nth-of-type(1) [stroke='currentColor']
...    EditCnpj=css=.mb-3 > div:nth-of-type(2) [stroke='currentColor']
...    EditPhone=css=.mb-3 > div:nth-of-type(3) [stroke='currentColor']
...    EditSector=css=.mb-3 > div:nth-of-type(4) [stroke='currentColor']
...    NameInput=xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[1]/input
...    CnpjInput=xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[2]/input
...    PhoneInput=xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[3]/input
...    SectorInput=xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[4]/input

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

E clicar para editar o nome
    Click Element    ${EDIT_COMPANY.EditName}

E clicar para editar o cnpj
    Click Element    ${EDIT_COMPANY.EditCnpj}

E clicar para editar o telefone
    Click Element    ${EDIT_COMPANY.EditPhone}

E clicar para editar o setor
    Click Element    ${EDIT_COMPANY.EditSector}

E colocar um nome
    [Arguments]    ${NAME}=
    Input Text    ${EDIT_COMPANY.NameInput}       ${NAME}

E colocar um cnpj
    [Arguments]    ${CNPJ}=
    Input Text    ${EDIT_COMPANY.CnpjInput}       ${CNPJ}

E colocar um telefone
    [Arguments]    ${PHONE}=
    Input Text    ${EDIT_COMPANY.PhoneInput}      ${PHONE}

E colocar um setor
    [Arguments]    ${SECTOR}=
    Input Text    ${EDIT_COMPANY.SectorInput}     ${SECTOR}

Pegar um nome de empresa
    Wait Until Element Is Visible    ${TABLE_LOCATOR}
    ${RANDOM_COMPANY}=    Get Text    ${TABLE_LOCATOR}//tbody/tr[4]/td[1]
    Set Global Variable    ${RANDOM_COMPANY}

Clicar em visualizar serviços
    Wait Until Element Is Enabled    ${VIEW_SERVICE}    timeout=5s
    Click Element    ${VIEW_SERVICE}

E pegar o nome do primeiro item da lista
    Wait Until Element Is Visible    ${TABLE_LOCATOR}
    ${FIRST_ITEM}=    Get Text    ${TABLE_LOCATOR}//tbody/tr[1]/td[1]
    Set Global Variable    ${FIRST_ITEM}

Pegar um cnpj da lista
    Wait Until Element Is Visible    ${TABLE_LOCATOR}    timeout=5s
    ${CNPJ_LIST}=    Get Text    ${TABLE_LOCATOR}//tbody/tr[1]/td[2]
    Set Global Variable    ${CNPJ_LIST}

Pegar um telefone da lista
    Wait Until Element Is Visible    ${TABLE_LOCATOR}    timeout=5s
    ${PHONE_LIST}=    Get Text    ${TABLE_LOCATOR}//tbody/tr[1]/td[3]
    Set Global Variable    ${PHONE_LIST}

Pegar um setor da lista
    Wait Until Element Is Visible    ${TABLE_LOCATOR}    timeout=5s
    ${SECTOR_LIST}=    Get Text    ${TABLE_LOCATOR}//tbody/tr[1]/td[4]
    Set Global Variable    ${SECTOR_LIST}
   

E pesquisar o item coletado
    [Arguments]    ${SEARCH}=
    Click Element    ${FILTER_INPUT}
    Input Text    ${FILTER_INPUT}    ${SEARCH}
    
    