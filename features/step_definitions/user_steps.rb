Given(/^I have a profile$/) do
  @user = User.find_by(email: "existinguser@gmail.com")
  @profile = FactoryGirl.create(:profile, user_id: @user.id)
end

Given(/^I am an admin user$/) do
  @user = FactoryGirl.create(:user, admin: true, sign_in_count: 2)
end

Given(/^I try to visit the new prompt page$/) do
  visit new_prompt_path
end

Given(/^I do not have a luver in the system$/) do
  @user = User.find_by(email: "existinguser@gmail.com")
  @user.luver_id = nil
end

Given(/^I have invited my luver$/) do
  @new_user = FactoryGirl.create(:user, luver_id: @user.id)
  @user.luver_id = @new_user.id
end

Given(/^my luver has signed up$/) do
  @new_user = FactoryGirl.create(:user, email: "troyrenken@gmail.com", luver_id: @user.id)
  @user.luver_id = @new_user.id
  @new_user.save
  @user.save
end

Given(/^my luver has signed up but not added me$/) do
  @new_user = FactoryGirl.create(:user, email: "troy@gmail.com")
  @new_user_profile = FactoryGirl.create(:profile, first_name: "Troy", last_name: "Renken", user_id: @new_user.id)
end
