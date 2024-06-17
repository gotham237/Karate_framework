Feature: Update user using put api
  Background:
    * url 'https://gorest.co.in'

    * def randomStr =
    """
      function(s) {
        var text = "";
        var pattern = "ABCDEFGHIJKLMNOPRSTOVWXYZabcdefghijklmnoprstuvwxyz";

        for (var i = 0; i < s; i++) {
          text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
          return text;
        }

      }
    """
    * def randomString = randomStr(10)
    * print randomString

    * def user =
    """
    {
      "name": "tom",
      "gender": "male",
      "status": "active"
    }
    """

    * user.email = randomString + '@gmail.com'
    * print user

  Scenario: Create a user with given data
    # 1st call: create user with post call
    Given path 'public/v2/users'
    And request user
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'

    # fetch the user id from post call response
    * def userId = $.data.id;

    # 2nd call: put call to update the user
  Scenario: Update user

    * def requestPayload =
    """
    {
      "name": "bob"
      "status": "inactive"
    }
    """

    Given url baseUrl + "/public/v2/users/" + userId
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match response.data.id == '#present'
    And match response.data.name == 'bob'
    And match response.data.status == requestPayload.status
