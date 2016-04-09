Feature: Person signs up for Luv Notes

  Scenario: New user created for Luv Notes
    Given I am on the home page
    And I follow "Join Luv Notes"
    Then I should be on the sign up page
    And I fill in "Email" with "user@gmail.com"
    And I fill in "Password" with "testpassword"
    And I fill in "Password confirmation" with "testpassword"
    And I press "Sign up"
    Then I should be on the create new profile page

  Scenario: Already registered user should not be directed to the new profile page
    Given I am an existing user
    And I have a profile
    And I am not signed in
    And I sign in
    Then I should be on the dashboard page

  Scenario: User creates profile
    Given I am a new user
    And I sign up
    And I am on the create new profile page
    And I fill in "First name" with "Julie"
    And I fill in "Last name" with "Kent"
    And I select "Female" from "Gender"
    And I fill in "City" with "West Des Moines"
    And I fill in "State" with "Iowa"
    And I select "1988" from "profile[birthday(1i)]"
    And I select "July" from "profile[birthday(2i)]"
    And I select "13" from "profile[birthday(3i)]"
    And I press "Create Profile"
    Then I should be on the dashboard page
    And I should see "Thanks for joining"

