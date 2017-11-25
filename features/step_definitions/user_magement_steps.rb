Given(/^I visit the registration page$/) do
  visit '/signup'
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in field_name, with: value
end

Given(/^I click "([^"]*)"$/) do |element|
  click_link_or_button element
end

Then(/^I should be on the landing page$/) do
  expect(current_path).to eq '/'
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I should be on the registration page$/) do
  expect(current_path).to eq '/signup'
end

Given(/^the following users exist$/) do |table|
  table.hashes.each do |user|
    User.create!(user)
  end
end

Given(/^I visit the sign in page$/) do
  visit '/login'
end

Then(/^I should be on the sign in page$/) do
  expect(current_path).to eq '/login'
end

And(/^I am logged in as "([^"]*)" using the password "([^"]*)"$/) do |name, password|
  steps %Q{
    Given I visit the sign in page
    And I fill in "Name" with "#{name}"
    And I fill in "Password" with "#{password}"
    And I click "Sign in"
        }
end


Given(/^I am logged out$/) do
  steps %q{
    Given I click "Logout"
        }
end