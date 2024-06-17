Feature: json feature testing

  Scenario: json reader

    * def jsonObject =
    """
    [
      {
        "name": "Tom",
        "city": "Sydney",
        "age": 25
      },
      {
        "name": "Peter",
        "city": "Los Angeles",
        "age": 35
      }
    ]
    """

    * print jsonObject

  Scenario: complex json reader

