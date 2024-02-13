*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC004 - Realizar Cadastro de Competência
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar no botão para selecionar a primeira opção
    Preencher os campos com    NOME=CadastroTeste   DESCRICAO=Teste para cadastrar competência
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso

TC005 - Cadastro de Competências - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar no botão para selecionar a primeira opção
    Clicar no botão confirmar
    Checar aviso de campo obrigatório

TC006 - Cadastro de Competências Duplicadas
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar no botão para selecionar a primeira opção
    Preencher os campos com    NOME=TesteDuplo    DESCRICAO=testando
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso
    Clicar no botão de voltar
    Clicar no botão para selecionar a primeira opção
    Preencher os campos com    NOME=testeDuplo    DESCRICAO=testando
    Clicar no botão confirmar
    Clicar no botão modal
    Checar mensagem de sucesso indevida

TC007 - Listar Competências Cadastradas
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência

    
TC008 - Exibir Detalhes da Competência
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência
    Depois clicar em detalhes
  
TC009 - Editar Competência
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência
    Depois clicar em detalhes
    Clicar para editar os detalhes da competência
    Editar nome    NOME=testeIQS
    E depois clicar em editar descrição
    Editar descrição    DESCRICAO=editar descrição
    Clicar no botão "salvar"
    Confirmar no modal

TC010 - Excluir Competência pela Lista
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência
    Clicar no ícone da lixeira
    Confirmar no modal
    Checar mensagem de sucesso

TC011 - Excluir Competência pelos Detalhes
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência
    Depois clicar em detalhes
    Excluir Competência Detalhes
    Checar mensagem de sucesso

TC012 - Verificar Filtro de Busca
    Realizar Login Válido Gestor
    Selecionar projeto
    Clicar no botão para selecionar a primeira opção
    Clicar em buscar competência
    Rolar para última página
    Pegar item da lista
    Voltar para primeira página
    Pesquisar o nome coletado
    Verificar se há resultados
