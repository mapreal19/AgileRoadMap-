Then(/^I should be able to change the range$/) do   
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(5) > select').find(:xpath, 'option[2]').select_option
  click_link('Mi Agile Roadmap+')
  sleep 5
  
  expect(
    find('#sortable > tbody > tr:nth-child(1) > td:nth-child(5) > select')
    .find(:xpath, 'option[2]')[:selected]
    ).to eq(true) 
end   

Then(/^I should be able to mark the checkbox$/) do
  find('#sortable > tbody > tr:nth-child(1) > td:nth-child(7) > input').set(true)

  visit current_path
  sleep 5
  
  expect(
    find('#sortable > tbody > tr:nth-child(1) > td:nth-child(7) > input')[:value]
    ).to eq("true") 
end   

Then(/^I should be able to mark the checkbox in table objetivo$/) do
  find('#toggle_objetivos').click
  find('#tabla_objetivos > tbody > tr:nth-child(1) > td:nth-child(7) > input', visible: false).set(true)

  visit current_path
  sleep 5
  
  expect(
    find('#tabla_objetivos > tbody > tr:nth-child(1) > td:nth-child(7) > input', visible: false)[:value]
    ).to eq("true") 
end


Then(/^I should be able to fill a comment in table objetivo$/) do
  comment = 'a'*151
  
  find('#tabla_objetivos > tbody > tr:nth-child(1) > td:nth-child(6) > textarea', visible: false).set(comment)

  click_link('Mi Agile Roadmap+')
 
  # Need this for loading all the rows
  sleep 5
  
  expect(find('#tabla_objetivos > tbody > tr:nth-child(1) > td:nth-child(6) > textarea', visible: false).text).to eq(comment)
end

