Given(/^I am on the homepage$/) do
  visit('/')
end

Given(/^I am on the signup page$/) do
  visit('/signup')
end

Given(/^I am signed in$/) do
  steps %Q{Given I am on the homepage
           When I put in my login details}
end

Given(/^I have already signed up with an e\-mail address$/) do
    steps %Q{Given I am on the homepage
             When I sign up
             And I choose a username}
end

Given(/^there are peeps$/) do
    steps %Q{Given I have previously signed up
             When I put in my login details
             And I post "HAI CHITTER"} 
end

Given(/^there have been peeps$/) do
  steps %Q{Given there are peeps
           And I click "Sign out"}
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

When(/^I have previously signed up$/) do
    steps %Q{Given I am on the homepage
             When I sign up
             And I choose a username
             And I click "Sign out"}
end

When(/^I sign up again$/) do
    steps %Q{Given I have already signed up with an e-mail address}
end

When(/^I click "(.*?)"$/) do |button|
    click_button(button)
end

When(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I sign up with the same username$/) do
  visit '/'
  fill_in('Full name', with: 'Spike Lindsey')
  fill_in('E-mail', with: 'spike01@outlook.com')
  fill_in('password', with: 'makersWelcome')
  click_button('Sign up for Chitter')
  steps %Q{When I choose a username}
end

When(/^I post "(.*?)"$/) do |content|
  click_button('Peep')
  fill_in('Compose new Peep', with: content)
  click_button('Peep!')
end

When(/^someone posts a new peep$/) do
  steps %Q{When I post "NEW PEEP"}
end

When(/^I ask to preview tweets$/) do
    click_link('Preview Chitter')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should be taken to the signup page$/) do
  expect(page).to have_content("Join Chitter today")
end


