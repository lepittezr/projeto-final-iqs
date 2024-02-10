*** Settings ***
Resource    ../main.robot

*** Variables ***
${SELECT_BUTTON}    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[1]/div/div/a/div/button
${MODAL_BUTTON}    css=.hDPZGJ > .botao-default
${SUCCESS_ELEMENT}    css=.Toastify__toast--success
${ERROR_ELEMENT}    css=.Toastify__toast--error


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

&{FILTER_COMPETENCE}
...    FilterInput=xpath=//input[@class='form-control']
...    LastPage=css:.area-paginacao > div:nth-of-type(5) > [stroke='currentColor']
...    FirstPage=css:.area-paginacao > div:nth-of-type(1) > [stroke='currentColor']
...    TableLocator=xpath=//table[@class='table table-striped table-hover']


*** Keywords ***
Cadastrar Competência
    [Documentation]    Testa o cadastro de uma nova competência.
    Wait Until Element Is Enabled    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Wait Until Element Is Visible    ${SELECT_BUTTON}    timeout=10s
    Click Element    ${SELECT_BUTTON}
    Input Text    ${CAD_COMPETENCE.CompetenceInput}    teste IQS
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
    Input Text    ${CAD_COMPETENCE.CompetenceInput}     teste iqs 
    Input Text    ${CAD_COMPETENCE.DescriptionInput}    Isso é apenas um teste
    Click Element    ${CAD_COMPETENCE.ConfirmButton}
    Wait Until Element Is Visible    ${MODAL_BUTTON}    timeout=10s
    Click Element    ${MODAL_BUTTON}
    Wait Until Element Is Visible    ${ERROR_ELEMENT}    timeout=5s
    Element Should Be Visible    ${ERROR_ELEMENT}

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

Filtrar Busca de Competência
    [Documentation]    Testa se o filtro de busca funciona corretamente.
    Wait Until Page Contains Element    ${FILTER_COMPETENCE.LastPage}    timeout=5s
    Scroll Element Into View    ${FILTER_COMPETENCE.LastPage}
    Click Element At Coordinates    ${FILTER_COMPETENCE.LastPage}    10    10
    ${item_count}=    Get Element Count    ${FILTER_COMPETENCE.TableLocator}//tbody/tr
    ${last_item}=    Get Text    xpath=(//table[@class='table table-striped table-hover']//tbody/tr[${item_count}])/td[1]
    Click Element    ${FILTER_COMPETENCE.FirstPage}
    Click Element    ${FILTER_COMPETENCE.FilterInput}
    Input Text    ${FILTER_COMPETENCE.FilterInput}    ${last_item}

    