# encoding: utf-8

Given(/^a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
	@user = User.new(email: email, password: password, password_confirmation: password)  
	@user.save(validate: false)
end

When /^I login as "(.*?)" with password "(.*?)"$/ do |email, password|
  visit('/es/signin')
  fill_in('Email', :with => email)
  fill_in('Contraseña', :with => password)
  click_button('Login')
end

Then(/^I should see h2 "(.*?)"$/) do |text|
	find("h2", text: text)
end

Then /^show me the page$/ do
  save_and_open_page
end