Feature: login system
	
	@javascript
  Scenario: Signing in
  	Given a user with email "user1@gmail.com" and password "secret"
    When I login as "user1@gmail.com" with password "secret"
    Then I should see h2 "Roadmap de Prácticas Ágiles"
    And the user "user1@gmail.com" should have 42 pracs
