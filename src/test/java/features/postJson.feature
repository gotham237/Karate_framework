Feature:
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

    * def user = read('classpath:src/test/resources/payload/user.json')

    * set user.email = randomString + "@gmail.com"
    * print user

  Scenario: Create a user with given data
    Given path 'public/v2/users'
    And request user
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == user.email
