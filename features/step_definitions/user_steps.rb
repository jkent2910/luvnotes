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