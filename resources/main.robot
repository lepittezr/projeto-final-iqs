*** Settings ***
Library    SeleniumLibrary


### Shared ###
Resource    shared/setup_teardown.robot

### Pages ###
Resource    pages/login.robot
Resource    pages/competences.robot
Resource    pages/collaborators.robot
Resource    pages/services.robot