Feature: Delete user using delete api

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

    # 2nd call: delete call to delete the user
  Scenario: Delete user with the given user id
    Given path 'public/v2/users' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204

    # 3rd call: get user with the same id
    Given path 'public/v2/users' + userId
    When method get
    Then status 404
    And match $.data.message == 'Resource not found'