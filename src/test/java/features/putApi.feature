Feature: Update user using put api

  Scenario: Update user

    * def requestPayload =
    """
    {
      "status": "active"
    }
    """

    Given url baseUrl + "/public/v2/users/3339785"
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match response.name == 'Amb. Saraswati Khanna'
    And match response.status == 'active'
