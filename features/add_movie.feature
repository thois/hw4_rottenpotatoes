Feature: add movie
 
  As an avid moviegoer
  I need to delete movie added by mistake

Scenario: Add movie
Given I am on the RottenPotatoes home page
When I follow "Add new movie"
Then I should be on the Create New Movie page
When I fill in "Title" with "Zorro"
And I select "PG" from "Rating"
And I press "Save Changes"
Then I should be on the RottenPotatoes home page
And I should see "Zorro"