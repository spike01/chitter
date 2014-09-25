Given(/^I am on the homepage$/) do
  visit('/')
end

Given(/^I am on the signup page$/) do
  visit('/signup')
end

When(/^I sign up$/) do
  fill_in('Full name', with: 'Spike Lindsey')
  fill_in('E-mail', with: 'spike01@gmail.com')
  fill_in('Password', with: 'makersWelcome')
  click_button('Sign up for Chitter')
end

When(/^I choose a username$/) do
  #fill_in('Username', with: 'spikenox')
  click_button('Create my account')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should be taken to the signup page$/) do
  expect(page).to have_content("Join Chitter today")
end


