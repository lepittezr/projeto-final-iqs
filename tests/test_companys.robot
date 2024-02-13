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
    ...    NAME=Segundoou
    ...    CNPJ=12434343055 
    ...    PHONE=216774    
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
    ...    NAME=tsttt 
    ...    CNPJ=6125
    ...    PHONE=2   
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
    ...    NAME=etapas 
    ...    CNPJ=042222465  
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
    ...    NAME=Teste Duplicado
    ...    CNPJ=12072554
    ...    PHONE=2134674    
    ...    SECTOR=IQS
    ...    ADDRESS=Rua dos testes
    Clicar no botão confirmar
    Clicar no botão modal
    Rolar a página
    Clicar no botão de voltar
    Preencher os campos    
    ...    NAME=teste Duplicado
    ...    CNPJ=54834
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
    E colocar um nome    NAME=vamopular
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
    E colocar um cnpj    CNPJ=11345345674
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
    E colocar um telefone    PHONE=11446775444
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
    E colocar um cnpj    CNPJ=SomenteNumeros
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
    E colocar um telefone    PHONE=0
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

TC047 - Vincular Serviço à Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    Clicar em visualizar serviços
    Clicar no botão de adicionar
    Selecionar o que deseja vincular
    Rolar a página
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso

TC048 - Filtrar Busca por Serviços da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    Clicar em visualizar serviços
    Clicar no botão de adicionar
    Selecionar o que deseja vincular
    Rolar a página
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso
    E pegar o nome do primeiro item da lista
    Rolar a página
    Clicar no botão de voltar
    E pesquisar o item coletado    SEARCH=${FIRST_ITEM}
    Verificar se há resultados

TC049 - Filtrar Busca por Nome da Empresa    
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Pegar um nome de empresa
    E pesquisar o item coletado    SEARCH=${RANDOM_COMPANY}
    Verificar se há resultados

TC050 - Filtrar Busca por CNPJ da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Pegar um cnpj da lista    
    E pesquisar o item coletado    SEARCH=${CNPJ_LIST}
    Verificar se há resultados

TC051 - Filtrar Busca por Telefone da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Pegar um telefone da lista
    E pesquisar o item coletado    SEARCH=${PHONE_LIST}
    Verificar se há resultados

TC052 - Filtrar Busca por Setor da Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Pegar um setor da lista    
    E pesquisar o item coletado    SEARCH=${SECTOR_LIST}
    Verificar se há resultados

TC053 - Excluir Serviço Vinculado
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone de detalhes
    Clicar em visualizar serviços
    Clicar no botão de adicionar
    Selecionar o que deseja vincular
    Rolar a página
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso
    Clicar no ícone da lixeira
    Clicar no botão modal
    Checar mensagem de sucesso

TC054 - Excluir Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em empresa
    E clicar em buscar empresa
    Clicar no ícone da lixeira
    Clicar no botão modal
    Checar mensagem de sucesso