*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC022 - Cadastrar Serviço
    Realizar Login Válido Gestor
    Selecionar Projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher campos nome "Test again" e descrição "apenas testando"
    Clicar no botão confirmar
    Clicar no botão modal
    Checar alerta

TC023 - Cadastrar Serviço - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar Projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher campos nome "Other test" e descrição ""
    Clicar no botão confirmar
    Verificar aviso de campo obrigatório




