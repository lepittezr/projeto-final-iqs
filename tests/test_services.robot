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
    Preencher os campos com    NOME=Relatorio    DESCRICAO=Description
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso

TC023 - Cadastrar Serviço - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Clicar no botão confirmar
    Verificar aviso de campo obrigatório


TC024 - Cadastrar Serviço - Etapas Obrigatórias
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar em serviço
    Clicar em cadastrar serviço
    Preencher os campos com    NOME=EtapasTeste    DESCRICAO=Description
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso indevida

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
    Editar nome    NOME=TesteEdit
    Clicar para editar a descrição
    Editar descrição    DESCRICAO=Domingou
    Rolar a tela
    Clicar no botão "salvar"
    Clicar no botão modal
    Checar mensagem de sucesso

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
    Selecionar o que deseja vincular
    Clicar para confirmar
    Confirmar no modal
    Checar mensagem de sucesso