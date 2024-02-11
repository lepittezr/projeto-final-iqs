*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC022 - Cadastrar Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher campos nome "Test again" e descrição "apenas testando"
    Clicar no botão confirmar
    Clicar no botão modal
    Checar alerta

TC023 - Cadastrar Serviço - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher campos nome "Other test" e descrição ""
    Clicar no botão confirmar
    Verificar aviso de campo obrigatório


TC024 - Cadastrar Serviço - Etapas Obrigatórias
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher campos nome "updateeee" e descrição "eeeee"
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso antes de finalizar as etapas obrigatórias

TC025 - Listar Todos os Serviços Cadastrados
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço    
TC026 - Exibir Detalhes do Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço    
    Clicar no ícone de detalhes

TC027 - Editar Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço    
    Clicar no ícone de detalhes
    Clicar no ícone de edição
    Editar nome    NOME=oieee
    Clicar para editar a descrição
    Editar descrição    DESCRICAO=sabadouuu
    Rolar a tela
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar alerta

TC028 - Excluir Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço
    Clicar no ícone da lixeira
    Clicar no botão modal

TC029 - Verificar Filtro de Busca de Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço
    Rolar para última página
    Pegar item da lista
    Voltar para primeira página
    Pesquisar o nome coletado
    Verificar se há resultados

TC030 - Visualizar Competências Vinculadas
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço    
    Clicar no ícone de detalhes
    Clicar na opção Visualizar Competências do serviço

TC031 - Adicionar Competência ao Serviço
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em buscar serviço    
    Clicar no ícone de detalhes
    Clicar na opção Visualizar Competências do serviço
    Clicar no botão de adicionar
    Selecionar as competências que deseja vincular
    Clicar para confirmar
    Confirmar no modal
    Checar alerta