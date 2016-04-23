Feature: User wants to invite their luver to use LuvNotes
  Scenario: User invites luver
    Given I am an existing user
    And I have a profile
    And I am on the sign in page
    And I sign in
    And I am on the dashboard page
    And I do not have a luver in the system
    And I follow "INVITE"
    Then I should be on the send invitation page
    And I fill in "first_name" with "Troy"
    And I fill in "email" with "troyrenken@gmail.com"
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

  Scenario: User cannot add his/herself as luver
    Given I am a user with email "troy@gmail.com"
    And I sign in
    And I am on the dashboard page
    And I follow "INVITE"
    Then I should be on the send invitation page
    And I fill in "first_name" with "Troy"
    And I fill in "email" with "troy@gmail.com"
    And I press "Send"
    Then I should see "You can't add yourself"

  Scenario: User cannot add someone who already has a luver
    Given I am a user with email "troy@gmail.com"
    And "troy@gmail.com" does not have a luver in the system
    And I sign in
    And there is a user with email "julie@gmail.com"
    And "julie@gmail.com" has a luver with email "elon@gmail.com"
    And I am on the dashboard page
    And I fill in "q_first_name_or_user_email_cont" with "julie@gmail.com"
    And I press "Search"
    Then I should see "Julie Kent"
    When I follow "Add Luver"
    Then I should see "This person already has a luver"



