Feature: Log in
  In order to use Chitter
  As a Maker
  I want to log in

  Scenario: Log in
    Given I have previously signed up
    When I am on the homepage
      And I put in my login details
    Then I should see "Spike Lindsey"
      And I should see "@spikenox"

  Scenario: Failed log in
    Given I am on the homepage
    When I put my login details incorrectly
    Then I should see "The username and password you entered did not match our records."
