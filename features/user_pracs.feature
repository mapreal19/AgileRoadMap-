Feature: user practicas
	
	@javascript
  Scenario: Drag and Drop practica
  	Given a user with email "user1@gmail.com" and password "secret"
    When I login as "user1@gmail.com" with password "secret"
    Then I should be able to drag and drop a practica

  @javascript
  Scenario: Notas en practica
  	Given a user with email "user1@gmail.com" and password "secret"
    When I login as "user1@gmail.com" with password "secret"
    Then I should be able to fill notas with a long text
