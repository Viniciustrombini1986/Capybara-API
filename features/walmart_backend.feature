Feature: Buscar posts existentes

@api @consulta_posts
  Scenario: Consultar todos os posts existentes na API
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "consulta" pelo ID "todos os posts existentes"
    Then deverá retornar a "consulta" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @consulta_id_existente
  Scenario: Consultar post por um ID existente
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "consulta" pelo ID "1"
    Then deverá retornar a "consulta" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @consulta_id_inexistente
  Scenario: Consultar post por um ID inexistente
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "consulta" pelo ID "99999999"
    Then deverá retornar a "consulta" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @deletar_post
  Scenario: Deletar um post
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "exclusão" pelo ID "6"
    Then deverá retornar a "exclusão" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @deletar_post_inexistente
  Scenario: Deletar um post inexistente
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "exclusão" pelo ID "999999999"
    Then deverá retornar a "exclusão" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @alterar_post
  Scenario: Alterar um post
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When realize uma "alteração" pelo ID "20"
    Then deverá retornar a "alteração" com sucesso ou exibir uma mensagem alertando alguma irregularidade

#================================================================================================

@api @criar_post
  Scenario Outline: Criar um novo post
    Given Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes
    When informe os dados "<userId>" "<id>", "<title>" e "<body>" do post a ser criado
    Then deverá retornar a "inserção" com sucesso ou exibir uma mensagem alertando alguma irregularidade

  Examples:
  | userId | id |                title                  |                body                   |
  |   1    |  1 | Titulo do novo post criado pelo teste | Corpo do novo post criado pelo teste  |    