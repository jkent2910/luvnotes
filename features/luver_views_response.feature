Feature: Luver logs in to view response

  Background:
    Given I am an existing user
    And I have a profile
    And my luver has signed up
    And there are some prompts
    And I answer the prompt "What is the first thing you noticed about me?"

  Scenario:
    Given my luver signs in
    And the date/time is after the date/time saved when I answered the prompt
    Then my luver can view my prompt response to "What is the first thing you noticed about me?"
    And I should see "Your beautiful eyes"

  Scenario:
    Given my luver signs in
    And the date/time is before the date/time saved when I answered the prompt
    Then my luver cannot view my prompt response to "What is the first thing you noticed about me?"
    And I should see "No Luv Notes right now"
