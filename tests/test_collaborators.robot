*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC013 - Colaborador - Listar Todos os Colaboradores
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores

TC014 - Colaborador - Exibir Detalhes
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador

TC015 - Atualizar Empresa do Colaborador
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar no ícone de edição
    Selecionar uma empresa
    Rolar página e confirmar
    Verificar mensagem de confirmação
    Verificar se empresa foi atualizada

TC016 - Visualizar Competências do Colaborador
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar na opção Visualizar Competências do colaborador

TC017 - Visualizar Competências Disponíveis para Adicionar ao Colaborador
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar na opção Visualizar Competências do colaborador
    Visualizar competências disponíveis

TC018 - Vincular Competência ao Colaborador
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar na opção Visualizar Competências do colaborador
    Visualizar competências disponíveis
    Selecionar as competências que deseja vincular
    Clicar nos botões para confirmar

TC019 - Excluir Vínculo de Competência com Colaborador
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar na opção Visualizar Competências do colaborador
    Clicar no ícone da lixeira
    Confirmar exclusão
    Verificar mensagem de confirmação

TC020 - Filtrar Colaborador por Empresa
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Pegar o nome da primeira empresa da tabela
    Clicar na caixa de pesquisa
    Pesquisar o nome da empresa
    Verificar se há resultados

TC021 - Filtrar Colaborador por Competência
    Realizar Login Válido Gestor
    Selecionar projeto
    Exibir Colaboradores
    Exibir Detalhes de Colaborador
    Clicar na opção Visualizar Competências do colaborador
    Pegar o nome da competência do colaborador
    Voltar para página Buscar Colaborador
    Clicar na caixa de pesquisa
    Pesquisar o nome da competência
    Verificar se há resultados

    
