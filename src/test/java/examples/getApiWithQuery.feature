Feature:

  Scenario: get all active users

    * def query = {status: 'active', gender: 'male'}

    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200

    * print response
