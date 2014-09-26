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
