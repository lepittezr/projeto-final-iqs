*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC032 - Realizar o Cadastro de uma Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    Clicar em cadastrar empresa
    Preencher os campos    
    ...    NAME=Exemplo2 
    ...    CNPJ=1234567890    
    ...    PHONE=21346774    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Rolar a página
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso