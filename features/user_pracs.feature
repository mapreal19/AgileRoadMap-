Feature: user practicas
  The user should be able to build his own agile roadmap
	
  Background: 
    Given a user with email "user1@gmail.com" and password "secret"
    When I login as "user1@gmail.com" with password "secret"
  
	@javascript
  Scenario: Drag and Drop practica
    Then I should be able to drag and drop a practica

  @javascript
  Scenario: Notas en practica
    Then I should be able to fill notas with a long text
    
  @javascript 
  Scenario: Margen de Mejora
    Then I should be able to change the range
    
  @javascript
  Scenario: No aplicable
    Then I should be able to mark the checkbox
  
