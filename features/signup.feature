Feature: Signup
  In order to use chitter
  As a Maker
  I want to sign up to the service

Scenario: Signing up from the homepage
    Given I am on the homepage
    When I sign up
    Then I should be taken to the signup page

Scenario: On the signup page
    Given I am on the signup page
    When I choose a username 
    Then I should see "Spike Lindsey"
      And I should see "@spikenox"
