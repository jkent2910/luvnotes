Feature: Admin can create prompts

  Scenario: Admin creates prompts
    Given I am an admin user
    And I sign in
    And I am on the admin dashboard page
    And I follow "Add Prompt"
    Then I should be on the new prompt page
    When I fill in "Prompt question" with "What is our most romantic date?"
    And I press "Create Prompt"
    Then I should be on the admin dashboard page
    And I should see "Prompt saved"

  Scenario: User cannot create prompt
    Given I am an existing user
    And I have a profile
    And I sign in
    And I am on the dashboard page
    And I try to visit the new prompt page
    Then I should be on the dashboard page
    And I should see "You must be an admin to view"


