*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC004 - Realizar Cadastro de Competência
    Realizar Login Válido Gestor
    Selecionar Projeto
    Cadastrar Competência

TC005 - Cadastro de Competências - Campos Obrigatórios
    Realizar Login Válido Gestor
    Selecionar Projeto
    Campos Obrigatórios Cadastrar Competência

TC006 - Cadastro de Competências Duplicadas
    Realizar Login Válido Gestor
    Selecionar Projeto
    Cadastrar Competência
    Cadastrar Competência Duplicada

TC007 - Listar Competências Cadastradas
    Realizar Login Válido Gestor
    Selecionar Projeto
    Listar Competências
    
TC008 - Exibir Detalhes da Competência
    Realizar Login Válido Gestor
    Selecionar Projeto
    Exibir Detalhes de Competência

    
TC009 - Editar Competência
    Realizar Login Válido Gestor
    Selecionar Projeto
    Exibir Detalhes de Competência
    Editar Detalhes de Competência

TC010 - Excluir Competência pela Lista
    Realizar Login Válido Gestor
    Selecionar Projeto
    Listar Competências
    Excluir Competência Lista


TC011 - Excluir Competência pelos Detalhes
    Realizar Login Válido Gestor
    Selecionar Projeto
    Exibir Detalhes de Competência
    Excluir Competência Detalhes

TC012 - Verificar Filtro de Busca
    Realizar Login Válido Gestor
    Selecionar Projeto
    Listar Competências
    Filtrar Busca de Competência
    Verificar se há resultados
