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

TC033 - Cadastrar Empresa - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    Clicar em cadastrar empresa
    Preencher os campos    
    ...    NAME=
    ...    CNPJ=
    ...    PHONE=21346774    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Rolar a página
    Clicar no botão confirmar
    E aparece o aviso de campo obrigatório    

TC034 - Cadastrar Empresa - Tratamento de Caracteres
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    Clicar em cadastrar empresa
    Preencher os campos    
    ...    NAME=Exemplo2 
    ...    CNPJ=eeeee    
    ...    PHONE=2134564    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Rolar a página
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC035 - Cadastrar Empresa - Etapas Obrigatórias
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    Clicar em cadastrar empresa
    Preencher os campos    
    ...    NAME=Ué 
    ...    CNPJ=12345645   
    ...    PHONE=5774    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Rolar a página
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC036 - Cadastrar Empresa Duplicada
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    Clicar em cadastrar empresa
    Preencher os campos    
    ...    NAME=Duplicandoo
    ...    CNPJ=1234574    
    ...    PHONE=2134674    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Clicar no botão confirmar
    Clicar no botão modal
    Rolar a página
    Clicar no botão de voltar
    Preencher os campos    
    ...    NAME=Duplicandoo 
    ...    CNPJ=1238563    
    ...    PHONE=2134673    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Rolar a página
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso indevida
TC037 - Listar Empresas Cadastradas
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Verificar se há resultados