Feature: GET API feature

  Scenario: get user
    Given url baseUrl+'/public/v2/users'
    And path '3339785'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * match jsonResponse.name == 'Jitender Nambeesan'

  Scenario: user not found
    Given url baseUrl+'/public/v2/users'
    And path '33'
    When method GET
    Then status 404