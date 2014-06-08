# encoding: utf-8


# Need to rake db:migrate RAILS_ENV=test and rake db:seed RAILS_ENV=test

Given(/^a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
	@user = User.new(email: email, password: password, password_confirmation: password)  
	@user.save(validate: false)
	@user.clone_practicas
  @user.clone_objetivos
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

Then(/^the user "(.*?)" should have (\d+) pracs$/) do |user_email, num_pracs|
  the_user = User.find_by(email: user_email)
  expect(the_user.user_practicas.count).to eq(42)
  #@user.user_practicas.count.should == 42
end

Then(/^I should be able to drag the prac (\d+) to the (\d+) position$/) do |from_pos, to_pos|
	target = find('table#sortable tr:nth-child(4) > td.handle')
	find('table#sortable tr:nth-child(1) > td.handle').drag_to(target)

end



Then /^show me the page$/ do
  save_and_open_page
end