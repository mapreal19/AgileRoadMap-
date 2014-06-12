Then(/^I should be able to change the range$/) do   
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(6) > select').find(:xpath, 'option[2]').select_option
  click_link('Mi Agile Roadmap+')
  sleep 5
  
  expect(
    find('#sortable > tbody > tr:nth-child(1) > td:nth-child(6) > select')
    .find(:xpath, 'option[2]')[:selected]
    ).to eq(true) 
end   