Feature: Timeline
  In order to see what people have to say 
  As a Maker 
  I want to see all peeps in chronological order

Scenario: Seeing peeps
    Given I am on the homepage
      And there are peeps
      And I see "HAI CHITTER"
    When someone posts a new peep
    Then I should see "NEW PEEP"

Scenario: Guest access
    Given I am on the homepage
      And there have been peeps
    When I ask to preview tweets
    Then I should see "HAI CHITTER"
