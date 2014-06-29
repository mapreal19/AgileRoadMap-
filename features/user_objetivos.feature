Feature: user objetivos
  The user should be able to build his own agile roadmap
	
  Background: 
    Given a user with email "user1@gmail.com" and password "secret"
    When I login as "user1@gmail.com" with password "secret"
  
  @javascript
  Scenario: Notas en objetivo
    Then I should be able to fill a comment in table objetivo 

  @javascript
  Scenario: No interesa
    Then I should be able to mark the checkbox in table objetivo
    
