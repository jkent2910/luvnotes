require 'cucumber/rspec/doubles'

Given(/^there are some prompts$/) do
  FactoryGirl.create(:prompt, prompt_question: "What is the first thing you noticed about me?")
  FactoryGirl.create(:prompt, prompt_question: "How do you describe me to other people?")
  FactoryGirl.create(:prompt, prompt_question: "What qualities make me special to you?")
end

Then(/^a prompt response should have been created$/) do
  existing_user = User.find_by(email: "existinguser@gmail.com")
  luver = User.find_by(email: "troyrenken@gmail.com")
  prompt_response = PromptResponse.find_by(user_id: existing_user.id)
  expect(prompt_response).to have_attributes(:luver_id => luver.id, :user_id => existing_user.id )
end

Given(/^there is a prompt "([^"]*)"$/) do |prompt_question|
  FactoryGirl.create(:prompt, prompt_question: prompt_question)
end

Given(/^I answer the prompt "([^"]*)"$/) do |prompt_question|
  prompt = Prompt.find_by(prompt_question: prompt_question)
  user = User.find_by(email: "existinguser@gmail.com")
  luver = User.find_by(email: "troyrenken@gmail.com")
  email = luver.email
  response = PromptResponse.create(prompt_id: prompt.id, luver_id: luver.id, user_id: user.id, response: "Your beautiful eyes", send_date: DateTime.new(2016,3,6))
  response.save
end

When(/^the date\/time saved in the database for this prompt occurs$/) do
  travel_to Time.new(2016,3,7)
end

Then(/^an e\-mail should be sent to my luver$/) do
  pending
end

Given(/^the date\/time is after the date\/time saved when I answered the prompt$/) do
  travel_to Time.new(2016,3,7)
end

Then(/^my luver can view my prompt response to "([^"]*)"$/) do |prompt|
  prompt = Prompt.find_by(prompt_question: prompt)
  prompt_response = PromptResponse.find_by(prompt_id: prompt.id)
  visit prompt_prompt_response_path(prompt, prompt_response)
end

Given(/^the date\/time is before the date\/time saved when I answered the prompt$/) do
  travel_to Time.new(2016,3,1)
end

Then(/^my luver cannot view my prompt response to "([^"]*)"$/) do |prompt|
  prompt = Prompt.find_by(prompt_question: prompt)
  prompt_response = PromptResponse.find_by(prompt_id: prompt.id)
  visit prompt_prompt_response_path(prompt, prompt_response)
end
