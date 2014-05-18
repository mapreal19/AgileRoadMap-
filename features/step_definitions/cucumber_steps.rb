# encoding: utf-8

Given /^I have signed up as "(.*?)"$/ do |email|
  visit('/es/signin')
  save_and_open_page
  fill_in('Email', :with => email)
  fill_in('Contraseña', :with => 's3cr3t')
  save_and_open_page
  click_button('Login')
end

Then /^show me the page$/ do
  save_and_open_page
end