*** Settings ***
Resource    ../main.robot

*** Variables ***
${SELECT_SERVICE}    xpath=//button[.='Serviço']
${CAD_SERVICE}    xpath=//button[.='Cadastrar Serviço']
${FORM_INPUT}    id=formBasicEmail
${FORM_INPUT2}    xpath=//textarea[@id='formBasicEmail']
${REQUIRED_FIELD}    xpath=//form[2]//div[@class='invalid-feedback']

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

Checar alerta
    Wait Until Element Is Visible    ${SUCCESS_ELEMENT}
    Element Should Be Visible    ${SUCCESS_ELEMENT}

Verificar aviso de campo obrigatório
    Wait Until Element Is Enabled    ${REQUIRED_FIELD}
    Element Should Be Visible    ${REQUIRED_FIELD}