Feature: Posting
  In order to let people know what I am doing 
  As a Maker 
  I want to post a message to chitter

Scenario: Creating a message
    Given I have previously signed up
      And I am signed in
    When I post "HAI CHITTER"
    Then I should see "HAI CHITTER"

