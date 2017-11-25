Feature: User with order can checkout (if signed in)
  As a visitor
  In order to get the food I ordered
  I would like to be able to finalize my order (checkout)


  Background:
    Given the following users exist
      | name   | password    |
      | Thomas | my_password |

    And the following products exist
      | name      | price | description     | category    |
      | Pizza     | 50    | Great Pizza     | Main course |
      | Kebab     | 75    | Great Kebab     | Main course |
      | Hamburger | 45    | Great Hamburger | Main course |

    And the time is "12:00"

    And I am logged in as "Thomas" using the password "my_password"

    And I visit the site
    And there is an order with order item "Kebab"
    And there is an order with order item "Pizza"


  Scenario Outline: User can see checkout
    And I click "Checkout"
    Then I should be on the checkout page
    Then I should see <product> and <price> in the order
    And I should see "Order total: 125 kr"
    And I should see "Estimated pickup time: 12:30"

    Examples:
      | product | price |
      | Kebab   | 75    |
      | Pizza   | 50    |

    Scenario: Logged in user can finalize his order
      And I click "Checkout"
      And I click "Confirm order"
      Then I should see "Thank you for your business"
      And I should see "Confirmed pickup time: 12:30"
      And my order should be marked confirmed


  Scenario: Not logged in user can not  finalize his order
    Given I am logged out
    And I click "Checkout"
    And I click "Confirm order"
    Then I should see "You need to login before finalizing order"
