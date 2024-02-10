*** Settings ***
Resource    ../resources/main.robot

Test Setup    Open Browser for Navigation
Test Teardown    Close your Browser

*** Test Cases ***
TC001 - Realizar Login com Credenciais Válidas - Colaborador
    Realizar Login Válido Colaborador

TC002 - Realizar Login com Credenciais Válidas - Gestor
    Realizar Login Válido Gestor
   
TC003 - Verificar Credenciais Inválidas
    Realizar Login Inválido

