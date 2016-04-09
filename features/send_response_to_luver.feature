Feature: Luver will receive an e-mail with link to view the prompt response

  Background:
    Given I am an existing user
    And I have a profile
    And I sign in
    And my luver has signed up
    And there is a prompt "What did you notice first about me?"

  Scenario:
    Given I answer the prompt "What did you notice first about me?"
    When the date/time saved in the database for this prompt occurs
    Then an e-mail should be sent to my luver