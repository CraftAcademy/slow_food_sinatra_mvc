Feature: User can log in
  As a registered user
  In order to access restricted parts of the application
  I would like to be able to log in to the application


  Background:
    Given the following users exist
      | name   | password    | email             |
      | Thomas | my_password | random@random.com |


  Scenario: User is logged in if ge provides valid credentials
    Given I visit the sign in page
    Then show me the page
    And I fill in "Name" with "Thomas"
    And I fill in "Password" with "my_password"
    And I click "Sign in"
    Then I should be on the landing page
    And I should see "Welcome Thomas! You were successfully logged in."
    And I should see "Logged in as: Thomas"

  Scenario: User is logged in if ge provides valid credentials
    Given I visit the sign in page
    And I fill in "Name" with "Thomas"
    And I fill in "Password" with "wrong_password"
    And I click "Sign in"
    Then I should be on the sign in page
    And I should see "Incorrect user name or passwor"