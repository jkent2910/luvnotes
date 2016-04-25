Feature: User can respond to prompts

  Background:
    Given I am an existing user
    And I have a profile
    And I sign in
    And my luver has signed up
    And there are some prompts

  Scenario:
    Given I am on the dashboard page
    And I follow "Answer prompt"
    And I fill in "prompt_response_response" with "Your eyes"
    And I press "Create Prompt response"
    Then I should be on the dashboard page
    And I should see "Answer prompt"
    And a prompt response should have been created


