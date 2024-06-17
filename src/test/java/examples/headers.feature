Feature:

  Scenario: pass the user request with headers
    * configure headers = {Authorization: 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==', Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'}
    When url baseUrl+'/public/v2/users'
    And path '3339785'
    When method get
    Then status 200
    * print response