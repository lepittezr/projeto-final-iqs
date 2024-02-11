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
    ...    NAME=Exemplo245
    ...    CNPJ=1243456743890    
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

TC038 - Visualizar Detalhes da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes

TC039 - Editar Nome da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o nome
    E colocar um nome    NAME=testEdit
    Clicar no botão "salvar"
    Clicar no botão modal
    Verificar mensagem de sucesso

TC040 - Editar CNPJ da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o cnpj
    E colocar um cnpj    CNPJ=113456745647
    Clicar no botão "salvar"
    Clicar no botão modal
    Verificar mensagem de sucesso

TC041 - Editar Telefone da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o telefone
    E colocar um telefone    PHONE=113456745647
    Clicar no botão "salvar"
    Clicar no botão modal
    Verificar mensagem de sucesso

TC042 - Editar Setor da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o setor
    E colocar um setor    SECTOR=Setor de edição
    Clicar no botão "salvar"
    Clicar no botão modal
    Verificar mensagem de sucesso

TC043 - Verificar Validação na Edição da Nome de Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Pegar um nome de empresa
    Clicar no ícone de detalhes
    E clicar para editar o nome
    E colocar um nome    NAME=${RANDOM_COMPANY}
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC044 - Verificar Validação ao Editar o CNPJ da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o cnpj
    E colocar um cnpj    CNPJ=nãopodeletra
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC045 - Verificar Validação ao Editar o Telefone da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    E clicar para editar o telefone
    E colocar um telefone    PHONE=1
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC046 - Visualizar Serviços da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    Clicar em visualizar serviços