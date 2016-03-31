Feature: User wants to invite their luver to use LuvNotes
  Scenario: User invites luver
    Given I am an existing user
    And I have a profile
    And I sign in
    And I am on the dashboard page
    And I do not have a luver in the system
    And I follow "Invite Luver"
    Then I should be on the send invitation page
    And I fill in "First name" with "Troy"
    And I fill in "Email" with "troyrenken@gmail.com"
    And I press "Send"
    Then I should see "Your invitation has been sent!"
    And I should be on the dashboard page

  Scenario: Luver signs up
    Given I am an existing user
    And I have a profile
    And my luver has signed up
    And I sign in
    When I am on the dashboard page
    Then I should see "Your luver is troyrenken@gmail.com"

  Scenario: User searches for luver
    Given I am an existing user
    And I have a profile
    And I sign in
    And my luver has signed up but not added me
    And I am on the dashboard page
    And I fill in "q_first_name_or_user_email_cont" with "troy@gmail.com"
    And I press "Search"
    Then I should see "Troy Renken"
    When I follow "Add Luver"
    Then I should see "We've sent a confirmation"

