Given(/^I am on the homepage$/) do
  visit('/')
end

Given(/^I am on the signup page$/) do
  visit('/signup')
end

When(/^I sign up$/) do
  fill_in('Full name', with: 'Spike Lindsey')
  fill_in('E-mail', with: 'spike01@gmail.com')
  fill_in('password', with: 'makersWelcome')
  click_button('Sign up for Chitter')
end

When(/^I choose a username$/) do
  fill_in('username', with: 'spikenox')
  click_button('Create my account')
end

When(/^I put in my login details$/) do
  fill_in('login-uname', with: 'spikenox')
  fill_in('login-pword', with: 'makersWelcome')
  click_button('Sign in')
end

When(/^I put my login details incorrectly$/) do
  fill_in('login-uname', with: 'spikenox')
  fill_in('login-pword', with: 'mome')
  click_button('Sign in')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should be taken to the signup page$/) do
  expect(page).to have_content("Join Chitter today")
end


