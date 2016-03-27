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
