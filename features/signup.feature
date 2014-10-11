Feature: Signup
  In order to use chitter
  As a Maker
  I want to sign up to the service

Scenario: Signing up from the homepage
    Given I am on the homepage
    When I sign up
      And I choose a username 
    Then I should see "Spike Lindsey"
      And I should see "@spikenox"

Scenario: Signing up with an e-mail that is already taken
    Given I am on the homepage
    When I have previously signed up
      And I sign up again 
    Then I should see "This email is already taken"

Scenario: Signing up with a username that is already taken
    Given I am on the homepage
    When I have previously signed up
      And I sign up with the same username
    Then I should see "This username is already taken"
