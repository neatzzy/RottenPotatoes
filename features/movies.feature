
Feature: User can add movie by searching for it in The Movie Database (TMDb) As a movie fan So that I can add new movies without manual tedium I want to add movies by looking up their details in TMDb   

Background: Start from the Search form on the home page   
    Given I am on the "Rotten Potatoes home" page 
    Then I should see "Search TMDb for a movie"   

Scenario: Try to add nonexistent movie (sad path)   
    When I fill in "Search Terms" with "Movie That Does Not Exist"   
    And I press "Search TMDb"   
    Then I should be on the "Rotten Potatoes home" page   
    And I should see "'Movie That Does Not Exist' was not found in TMDb."

Scenario: View movie list after adding 2 movies (Imperative)   
    When I follow "Add new movie"   
    Then I should be on the "Create New Movie" page   
    When I fill in "Title" with "Zorro"   
    And I select "PG" from "Rating"   
    And I press "Save Changes"   
    Then I should be on the "Rotten Potatoes home" page   
    When I follow "Add new movie"   
    Then I should be on the "Create New Movie" page   
    When I fill in "Title" with "Apocalypse Now"   
    And I select "R" from "Rating"   
    And I press "Save Changes"   
    Then I should be on the "Rotten Potatoes home" page   
    When I follow "Movie Title"   
    Then I should see "Apocalypse Now" before "Zorro"

Scenario: View movie list after adding 2 movies (Declarative) 
    Given I have added the movies
    | title          | age_rating |
    | Zorro          | PG         |
    | Apocalypse Now | R          |
    When I sort the movie list by title
    Then I should see "Apocalypse Now" before "Zorro"