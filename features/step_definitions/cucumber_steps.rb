# encoding: utf-8

# Need to rake db:migrate RAILS_ENV=test and rake db:seed RAILS_ENV=test

Given(/^a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
	@user = User.new(email: email, password: password, password_confirmation: password)  
	@user.save(validate: false)
	@user.clone_practicas
  @user.clone_objetivos
  expect(Practica.all.count).to eq(42)
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

Then(/^I should be able to drag and drop a practica$/) do 
	begin
		#target = find('table#sortable > tbody > tr:nth-child(1) > td.handle')
		#find('table#sortable > tbody > tr:nth-child(4) > td.handle').drag_to(target)
		#the_prac = find('table#sortable > tbody > tr:nth-child(4)').text
		#the_next_prac = find('table#sortable > tbody > tr:nth-child(5)').text

		#expect(page.body.index(the_prac)).to be < page.body.index(the_next_prac)
		#page.body.should =~ /PRA4.*PRA5/  
		prac_position = UserPractica.find_by(user_id: @user.id, practica_id: 25).position
		page.execute_script %Q{
    	$('table#sortable > tbody > tr:nth-child(4)').simulateDragSortable({move: 4, handle: '.handle'});
  	}
  	sleep 1
  	expect(UserPractica.find_by(user_id: @user.id, practica_id: 25).position).to be > prac_position
	rescue 
		save_page	
		raise	
	end
end

Then(/^I should be able to fill notas with a long text$/) do
  sleep 5
  comment = 'aaaaa'
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(7) > textarea').set(comment)
  sleep 2

=begin
	within("table#sortable > tbody > tr:nth-child(2)") do
		fill_in 'bio', with: 'aaaaaaa'
		#find('.comment').set(comment)
		find('.comment').trigger('blur')
		sleep 1
	end
=end
  
  click_link('Mi Agile Roadmap+')
  # Need this for loading all the rows
  sleep 5
	within("table#sortable > tbody > tr:nth-child(1)") do
		#fill_in 'bio', with: 'aaaaaaa'
		expect(find('.comment').text).to eq(comment)
	end
end


Then /^show me the page$/ do
  save_and_open_page
end