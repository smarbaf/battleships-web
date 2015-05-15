Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I enter my name as "([^"]*)"$/) do |name|
  fill_in('name', with: name)
end

When(/^I hit "([^"]*)"$/) do |submit|
  click_on(submit)
end

Then(/^I should see message "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end