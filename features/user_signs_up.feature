Feature: Person signs up for Luv Notes

  Scenario: New user created for Luv Notes
    Given I am on the home page
    And I follow "Join Luv Notes"
    Then I should be on the sign up page
    And I fill in "Email" with "user@gmail.com"
    And I fill in "Password" with "testpassword"
    And I fill in "Password confirmation" with "testpassword"
    And I press "Sign up"
    Then I should be on the home page

