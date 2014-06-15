Then(/^I should be able to change the range$/) do   
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(6) > select').find(:xpath, 'option[2]').select_option
  click_link('Mi Agile Roadmap+')
  sleep 5
  
  expect(
    find('#sortable > tbody > tr:nth-child(1) > td:nth-child(6) > select')
    .find(:xpath, 'option[2]')[:selected]
    ).to eq(true) 
end   

Then(/^I should be able to mark the checkbox$/) do
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(8) > input').set(true)

  visit current_path
  sleep 5
  
  expect(
    find('#sortable > tbody > tr:nth-child(1) > td:nth-child(8) > input')[:value]
    ).to eq("true") 
end   