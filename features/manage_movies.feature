Feature: Manage movies

Scenario: View movie list after adding 2 movies (Imperative)
    Given I am on the RottenPotatoes home page
    When I follow "New movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Zorro"
    And I select "PG" from "Age rating"
    And I press "Create Movie"
    Then I should be on the RottenPotatoes home page
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Apocalypse Now"
    And I select "R" from "Age rating"
    And I press "Create movie"
    Then I should be on the RottenPotatoes home page
    When I follow "Movie Title"
    Then I should see "Apocalypse Now" before "Zorro"

Scenario: View movie list sorted alphabetically (Declarative)
    Given I have added "Zorro" with "PG" rating
    And I have added "Apocalypse Now" with "R" rating
    When I sort movies by title
    Then I should see "Apocalypse Now" before "Zorro"