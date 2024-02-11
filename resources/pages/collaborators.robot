*** Settings ***
Resource    ../main.robot

*** Variables ***
${BUTTON_COLLAB}    xpath=//div[@id='root']/div/div/div[2]/div/div/div/div[2]/div/div[2]/div/div/a/div/button/span
${DETAIL_COLLAB}    css=tr:nth-child(7) svg:nth-child(1)
${CHECK_NAME}=    Get Value    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div/div[1]/table/tbody/tr[1]/td[1]
${COMPANIE}=    Get Value    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[2]/div[2]/p
${VIEW_COMPETENCE_COLLAB}    xpath=//*[@id="root"]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div[3]/div/strong
${DEFAULT_BUTTON}    css=.sc-aXZVg > .botao-default
${BACK_BUTTON}    xpath=//button[@class='botao-default btn btn-var(--cinza-primario)']
${TRASH_ICON}    css=tbody > tr:nth-of-type(1) [color='var(--vermelho-constraste)']
${TABLE_LOCATOR}    xpath=//table[@class='table table-striped table-hover']
${COMPANY_NAME}
${COMPETENCE}



&{EDIT_COLLAB}
...    EditIcon=css=[color='var(--verde-primario)']
...    CheckIcon=xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div/div[1]/table/tbody/tr[1]/td[2]

&{ADD_COMPETENCE}
...    OneExample=css=tr:nth-of-type(2) [viewBox='0 0 512 512']
...    TwoExample=css=tr:nth-of-type(4) [viewBox='0 0 512 512']
...    ThreeExample=css=tr:nth-of-type(6) [viewBox='0 0 512 512']
...    ButtonConfirm=css=div:nth-of-type(6) .hDPZGJ > .botao-default

&{FILTER_SEARCH_COMPANY}
...    SearchInput=xpath=//input[@class='form-control']
...    CompanyName=xpath=//table[@class='table table-striped table-hover']//tbody/tr[1]/td[3]

&{FILTER_SEARCH_COMPETENCE}
...    TableLocator=xpath=//table[@class='table table-striped table-hover']
...    CompetenceName=xpath=//table[@class='table table-striped table-hover']//tbody/tr[1]/td[1]

*** Keywords ***
Exibir Colaboradores
    Wait Until Element Is Enabled    ${BUTTON_COLLAB}    timeout=5s
    Click Element    ${BUTTON_COLLAB}
    Wait Until Page Contains Element    ${DETAIL_COLLAB}    timeout=10s

Exibir Detalhes de Colaborador
    Wait Until Element Is Enabled    ${DETAIL_COLLAB}    timeout=5s
    Scroll Element Into View    ${DETAIL_COLLAB}
    Click Element    ${DETAIL_COLLAB}

Clicar no ícone de edição
    Wait Until Element Is Enabled    ${EDIT_COLLAB.EditIcon}    timeout=5s
    Click Element    ${EDIT_COLLAB.EditIcon}

Selecionar uma empresa
    Wait Until Element Is Enabled    ${EDIT_COLLAB.CheckIcon}    timeout=5s
    Click Element    ${EDIT_COLLAB.CheckIcon}

Rolar página e confirmar
    Scroll Element Into View    ${DEFAULT_BUTTON}
    Click Element    ${DEFAULT_BUTTON}
    Click Element    ${MODAL_BUTTON}

Verificar mensagem de sucesso
    Wait Until Element Is Visible    ${SUCCESS_ELEMENT}    timeout=5s
    Element Should Be Visible    ${SUCCESS_ELEMENT}

Verificar se empresa foi atualizada
    IF    '${COMPANIE}' == '${CHECK_NAME}'
        Log To Console    Empresa atualizada!
    ELSE
        Fail    Empresa não atualizada!
    END

Clicar na opção Visualizar Competências do colaborador
    Click Element    ${VIEW_COMPETENCE_COLLAB}

Visualizar competências disponíveis
    Click Element    ${DEFAULT_BUTTON}

Selecionar as competências que deseja vincular
    Wait Until Element Is Visible    ${ADD_COMPETENCE.OneExample}    timeout=5s
    Click Element    ${ADD_COMPETENCE.OneExample}
    Click Element    ${ADD_COMPETENCE.TwoExample}
    Click Element    ${ADD_COMPETENCE.ThreeExample}

Clicar nos botões para confirmar
    Scroll Element Into View    ${DEFAULT_BUTTON}
    Click Element    ${DEFAULT_BUTTON}
    Wait Until Element Is Visible    ${ADD_COMPETENCE.ButtonConfirm}    timeout=5s
    Click Element    ${ADD_COMPETENCE.ButtonConfirm}

Clicar no ícone da lixeira
    Wait Until Element Is Enabled    ${TRASH_ICON}    timeout=5s
    Click Element    ${TRASH_ICON}

Confirmar exclusão
    Wait Until Element Is Visible    ${MODAL_BUTTON}
    Click Element    ${MODAL_BUTTON}

Clicar na caixa de pesquisa
    Wait Until Element Is Visible    ${FILTER_SEARCH_COMPANY.SearchInput}    timeout=5s
    Click Element    ${FILTER_SEARCH_COMPANY.SearchInput}

Pegar o nome da primeira empresa da tabela
    ${COMPANY_NAME}=    Get Text    ${FILTER_SEARCH_COMPANY.CompanyName}
    Click Element    ${FILTER_SEARCH_COMPANY.SearchInput}
    Set Global Variable    ${COMPANY_NAME}


Pesquisar o nome da empresa
    Input Text    ${FILTER_SEARCH_COMPANY.SearchInput}    ${COMPANY_NAME}

Verificar se há resultados
    ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${TABLE_LOCATOR}//tbody/tr[1]
    IF    '${element_visible}' == 'False'
        Fail   Nenhum resultado obtido!
        ELSE
        Log To Console    \nTudo certo! Há itens na lista!
    END
    
Pegar o nome da competência do colaborador
    Wait Until Element Is Visible    ${FILTER_SEARCH_COMPETENCE.CompetenceName}    timeout=5s
    ${COMPETENCE}=    Get Text    ${FILTER_SEARCH_COMPETENCE.CompetenceName}
    Set Global Variable    ${COMPETENCE}

Voltar para página Buscar Colaborador
    Scroll Element Into View    ${BACK_BUTTON}
    Click Element    ${BACK_BUTTON}

Pesquisar o nome da competência
    Input Text    ${FILTER_SEARCH_COMPANY.SearchInput}   ${COMPETENCE}