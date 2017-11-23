Feature: List dishes on landing page
  As a consumer/visitor
  In order to be able to make a choice on what dish to order
  I would like to see a list of available dishes as soon as I get to the site

  Background:
    Given the following products exist
      | name      | price | description     | category    |
      | Pizza     | 50    | Great Pizza     | Main course |
      | Kebab     | 75    | Great Kebab     | Main course |
      | Hamburger | 45    | Great Hamburger | Main course |
      | Ice cream | 15    | Yummy           | Desert      |
      | Salad     | 10    | Green is good   | Starter     |

  Scenario: Visitor see a list of dishes on the page
    When I visit the site
    Then I would like to see "Pizza" with the price of "50 kr" in "Main course" section
    And I would like to see "Great Pizza"
    And I would like to see "Kebab" with the price of "75 kr" in "Main course" section
    And I would like to see "Great Kebab"
    And I would like to see "Hamburger" with the price of "45 kr" in "Main course" section
    And I would like to see "Great Hamburger"
