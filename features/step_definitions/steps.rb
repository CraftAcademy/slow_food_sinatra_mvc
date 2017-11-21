Given(/^there are "([^"]*)" users in the database$/) do |count|
  count.to_i.times do
    User.create(name: Faker::Name.name, password: 'password')
  end

end

Given(/^I visit the users page$/) do
  visit '/users'
end

Then(/^I should see "([^"]*)" users$/) do |count|
  #binding.pry
  expect(page).to have_css 'div .user', count: count.to_i
end

Then(/^show me the page$/) do
  save_and_open_page
end