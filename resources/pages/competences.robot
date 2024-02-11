*** Settings ***
Resource    ../main.robot

*** Variables ***
${SELECT_BUTTON}    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[1]/div/div/a/div/button
${MODAL_BUTTON}    css=.hDPZGJ > .botao-default
${SUCCESS_ELEMENT}    css=.Toastify__toast--success
${ERROR_ELEMENT}    css=.Toastify__toast--error
${LAST_PAGE}    css:.area-paginacao > div:nth-of-type(5) > [stroke='currentColor']
${FIRST_PAGE}    css:.area-paginacao > div:nth-of-type(1) > [stroke='currentColor']
${FILTER_INPUT}    xpath=//input[@class='form-control']
${ITEM_COUNT}
${LAST_ITEM}


&{CAD_COMPETENCE}
...    CompetenceInput=id=formBasicEmail
...    DescriptionInput=css=.justify-content-center:nth-child(2) #formBasicEmail
...    ConfirmButton=xpath=//span[contains(.,'Confirmar Cadastro')]
...    BackButton=css=.botao-default
...    ShowWarning=css=.invalid-feedback


&{SEARCH_COMPETENCE}
...    SearchButton=css=[href='/buscarComp'] .botao-default
...    DetailIcon=css=tr:nth-child(1) svg:nth-child(1)
...    EditIcon=css=.row:nth-child(3) svg
...    NomeInput=css=textarea:nth-child(1)
...    EditIcon2=css=.row:nth-child(5) svg
...    DescriptionInput=xpath=//div[@id='root']/div/div/div[2]/div/div/div/div[2]/div/div[5]/div/textarea
...    SaveButton=xpath=//div[2]/button/span
...    DeleteIcon=css=tr:nth-child(2) svg:nth-child(2)
...    DeleteIcon2=css=.container > div > svg


*** Keywords ***
Cadastrar Competência
    [Documentation]    Testa o cadastro de uma nova competência.
    Wait Until Element Is Enabled    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Wait Until Element Is Visible    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}    sabadouu
    Input Text    ${CAD_COMPETENCE.DescriptionInput}    Isso é apenas um teste
    Click Element    ${CAD_COMPETENCE.ConfirmButton}
    Wait Until Element Is Visible    ${MODAL_BUTTON}    timeout=10s
    Click Element    ${MODAL_BUTTON}
    Wait Until Element Is Visible    ${SUCCESS_ELEMENT}    timeout=5s
    Element Should Be Visible    ${SUCCESS_ELEMENT}

Campos Obrigatórios Cadastrar Competência
    [Documentation]    Testa se é permitido cadastrar uma nova competência sem inserir as informações obrigatórias.
    Wait Until Element Is Visible    ${CAD_COMPETENCE.SelectButton}    timeout=10s
    Click Element    ${CAD_COMPETENCE.SelectButton}
    Wait Until Element Is Visible    ${CAD_COMPETENCE.SelectButton}    timeout=10s
    Click Element    ${CAD_COMPETENCE.SelectButton}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}    Testezinho
    Click Element    ${CAD_COMPETENCE.ConfirmButton}
    Wait Until Element Is Enabled    ${CAD_COMPETENCE.ShowWarning}    timeout=10s
    Element Should Be Enabled    ${CAD_COMPETENCE.ShowWarning}

Cadastrar Competência Duplicada
    [Documentation]    Testa o cadastro de competências com o mesmo nome.
    Wait Until Element Is Enabled    ${CAD_COMPETENCE.BackButton}    timeout=10s
    Scroll Element Into View    ${CAD_COMPETENCE.BackButton}
    Wait Until Element Is Enabled    ${CAD_COMPETENCE.BackButton}    timeout=10s
    Click Element    ${CAD_COMPETENCE.BackButton}
    Click Element    ${SELECT_BUTTON}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}     Sabadouu 
    Input Text    ${CAD_COMPETENCE.DescriptionInput}    Isso é apenas um teste
    Click Element    ${CAD_COMPETENCE.ConfirmButton}
    Wait Until Element Is Visible    ${MODAL_BUTTON}    timeout=10s
    Click Element    ${MODAL_BUTTON}


Listar Competências
    [Documentation]    Testa se na lista são exibidas todas as competências cadastradas.
    Wait Until Element Is Visible    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_COMPETENCE.SearchButton}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.SearchButton}

Exibir Detalhes de Competência
    [Documentation]    Testa se os detalhes são exibidos corretamente ao clicar no ícone.
    Wait Until Element Is Visible    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_COMPETENCE.SearchButton}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.SearchButton}
    Wait Until Element Is Enabled    ${SEARCH_COMPETENCE.DetailIcon}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.DetailIcon}

Editar Detalhes de Competência
    [Documentation]    Testa se é possível editar os detalhes de uma competência.
    Wait Until Element Is Enabled    ${SEARCH_COMPETENCE.EditIcon}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.EditIcon}
    Input Text    ${SEARCH_COMPETENCE.NomeInput}    testezíneo
    Click Element    ${SEARCH_COMPETENCE.EditIcon2}
    Input Text    ${SEARCH_COMPETENCE.DescriptionInput}    testandooooooo de novo
    Click Element    ${SEARCH_COMPETENCE.SaveButton}
    Click Element    ${MODAL_BUTTON}

Excluir Competência Lista
    [Documentation]    Testa se a competência é excluída corretamente ao clicar no ícone pela lista.
    Wait Until Element Is Enabled    ${SEARCH_COMPETENCE.DeleteIcon}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.DeleteIcon}
    Click Element    ${MODAL_BUTTON}

Excluir Competência Detalhes
    [Documentation]    Testa se a competência é excluída corretamente ao clicar no ícone pelos detalhes.
    Wait Until Element Is Enabled    ${SEARCH_COMPETENCE.DeleteIcon2}    timeout=10s
    Click Element    ${SEARCH_COMPETENCE.DeleteIcon2}
    Click Element    ${MODAL_BUTTON}

Rolar para última página
    [Documentation]    Testa se o filtro de busca funciona corretamente.
    Wait Until Page Contains Element    ${LAST_PAGE}    timeout=5s
    Scroll Element Into View    ${LAST_PAGE}
    Click Element At Coordinates    ${LAST_PAGE}    10    10

Pegar item da lista
    ${ITEM_COUNT}=    Get Element Count    ${TABLE_LOCATOR}//tbody/tr
    ${LAST_ITEM}=    Get Text    xpath=(//table[@class='table table-striped table-hover']//tbody/tr[${ITEM_COUNT}])/td[1]
    Set Global Variable    ${ITEM_COUNT}
    Set Global Variable    ${LAST_ITEM}

Voltar para primeira página
    Click Element    ${FIRST_PAGE}

Pesquisar o nome coletado
    Click Element    ${FILTER_INPUT}
    Input Text    ${FILTER_INPUT}    ${LAST_ITEM}