Given(/^I am an existing user$/) do
  @user = FactoryGirl.create(:existing_user)
end

Given /^I am not signed in$/ do
  step "I sign out"
end

Given /^I am signed in$/ do
  step "I sign in"
end

When /^I sign in$/ do
  step "I sign in using \"password\""
end

When /^I sign in using "([^"]*)"$/ do |password|
  step "I am on sign in page"
  step "I fill in \"user_email\" with \"#{@user.email}\""
  step "I fill in \"user_password\" with \"#{password}\""
  step "I press \"Sign in\""
end

When /^I sign out$/ do
  visit destroy_user_session_path
end

When /^I sign in with the wrong email$/ do
  step "I am on sign in page"
  step "I should see \"SIGN IN\""
  step "I fill in \"Email\" with \"bogus\""
  step "I fill in \"Password\" with \"password\""
  step "I press \"Log in\""
end

When /^I sign in with the wrong password$/ do
  step "I sign in using \"bogus\""
end

Given(/^I am a new user$/) do
  visit new_user_registration_path
end

Given(/^I sign up$/) do
  step "I am on the sign up page"
  step "I fill in \"user_email\" with \"user@gmail.com\""
  step "I fill in \"user_password\" with \"testpassword\""
  step "I fill in \"user_password_confirmation\" with \"testpassword\""
  step "I press \"Sign up\""
end