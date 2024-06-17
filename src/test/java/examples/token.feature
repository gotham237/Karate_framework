Feature:
  Scenario: pass token to the request
    * print tokenID
    Given header Authorization = 'Bearer ' + tokenID
    Given url baseUrl + '/public/v2/users'
    And path '3339785'
    When method get
    Then status 200