Feature: Log out
  In order to avoid others using my account 
  As a Maker 
  I want to log out

Scenario: Logging out
    Given I have previously signed up
    When I am signed in
     And I click "Sign out"
    Then I should see "New to Twitter?"

