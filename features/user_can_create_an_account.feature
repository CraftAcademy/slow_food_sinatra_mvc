Feature: User can create an account
  As a customer
  In order to access some restricted functionality (like check-out)
  I would like to be able to create an account


  Scenario: An account is created when user submits all necessary info
    Given I visit the registration page
    When I fill in "Name" with "Sophie"
    When I fill in "Email" with "sophie@random.com"
    And I fill in "Password" with "12345"
    And I fill in "Password confirmation" with "12345"
    And I click "Register"
    Then I should be on the landing page
    And I should see "Thank you for signing up Sophie"


  Scenario: Error message is displayed if user fails to submit a username
    Given I visit the registration page
    When I fill in "Name" with ""
    When I fill in "Email" with "sophie@random.com"
    And I fill in "Password" with "12345"
    And I fill in "Password confirmation" with "12345"
    And I click "Register"
    Then I should be on the registration page
    And I should see "Name can't be blank"

  Scenario: Error message is displayed if user fails to submit an email
    Given I visit the registration page
    When I fill in "Name" with ""
    When I fill in "Email" with "sophie@random.com"
    And I fill in "Password" with "12345"
    And I fill in "Password confirmation" with "12345"
    And I click "Register"
    Then I should be on the registration page
    And I should see "Email can't be blank"

  Scenario: Error message is displayed if user fails to submit a password
    Given I visit the registration page
    When I fill in "Name" with "Thomas"
    When I fill in "Email" with "thomas@random.com"
    And I fill in "Password" with ""
    And I fill in "Password confirmation" with "12345"
    And I click "Register"
    Then I should be on the registration page
    And I should see "Password can't be blank"

  Scenario: Error message is displayed if password and password confirmation does not match
    Given I visit the registration page
    When I fill in "Name" with "Thomas"
    When I fill in "Email" with "sophie@random.com"
    And I fill in "Password" with "12345"
    And I fill in "Password confirmation" with "67890"
    And I click "Register"
    Then I should be on the registration page
    And I should see "Password confirmation doesn't match Password"