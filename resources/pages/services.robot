*** Settings ***
Resource    ../main.robot

*** Variables ***
${SELECT_SERVICE}    xpath=//button[.='Serviço']
${CAD_SERVICE}    xpath=//button[.='Cadastrar Serviço']
${FORM_INPUT}    id=formBasicEmail
${FORM_INPUT2}    xpath=//textarea[@id='formBasicEmail']
${REQUIRED_FIELD}    xpath=//form[2]//div[@class='invalid-feedback']
${SEARCH_SERVICE}    xpath=//button[.='Buscar Serviço']
${DETAIL_ICON}    css=tbody > tr:nth-of-type(1) svg:nth-of-type(1)
${EDIT_ICON2}    css=.container > div:nth-of-type(4) [stroke='currentColor']
${SAVE_BUTTON}    xpath=//button[@class='botao-default btn btn-var(--verde-primario)']
${VIEW_COMPETENCES_SERVICE}    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[6]/strong

*** Keywords ***
Clicar em serviço
    Click Element    ${SELECT_SERVICE}
    
Clicar em cadastrar serviço
    Click Element    ${CAD_SERVICE}

Preencher campos nome "${NOME}" e descrição "${DESCRICAO}"
    Input Text    ${FORM_INPUT}    ${NOME}
    Input Text    ${FORM_INPUT2}    ${DESCRICAO}

Clicar no botão confirmar
    Click Element    ${DEFAULT_BUTTON}

Clicar no botão modal
    Click Element    ${MODAL_BUTTON}

Checar mensagem de sucesso
    Wait Until Element Is Visible    ${SUCCESS_ELEMENT}
    Element Should Be Visible    ${SUCCESS_ELEMENT}

Verificar aviso de campo obrigatório
    Wait Until Element Is Enabled    ${REQUIRED_FIELD}    timeout=5s
    Element Should Be Visible    ${REQUIRED_FIELD}

Checar mensagem de sucesso antes de finalizar as etapas obrigatórias
    Sleep    1s
    ${element_error_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_ELEMENT}
    ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${SUCCESS_ELEMENT}
    IF    ${element_error_visible}
         Fail    Já cadastrado!
    ELSE IF    ${element_visible}
        Fail    Serviço está sendo cadastrado sem competência.
    END

Clicar em buscar serviço
    Click Element    ${SEARCH_SERVICE}

Clicar no ícone de detalhes
    Wait Until Element Is Visible    ${DETAIL_ICON}    timeout=5s
    Click Element    ${DETAIL_ICON}
    
Editar nome
    [Arguments]     ${NOME}=

    Input Text    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[3]/div/textarea    ${NOME}

Clicar para editar a descrição
    Click Element    ${EDIT_ICON2}

Editar descrição
    [Arguments]    ${DESCRICAO}=
    Input Text    xpath=//*[@id="root"]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div[5]/div/textarea    ${DESCRICAO}

Rolar a tela
    Scroll Element Into View    ${SAVE_BUTTON}

Clicar no botão "salvar"
    Click Element    ${SAVE_BUTTON}

Clicar na opção Visualizar Competências do serviço
    Click Element    ${VIEW_COMPETENCES_SERVICE}

Clicar no botão de adicionar
    Click Element    ${DEFAULT_BUTTON}

Clicar para confirmar
    Scroll Element Into View    ${DEFAULT_BUTTON}
    Click Element    ${DEFAULT_BUTTON}

Confirmar no modal
    Click Element    ${MODAL_BUTTON}
    
    