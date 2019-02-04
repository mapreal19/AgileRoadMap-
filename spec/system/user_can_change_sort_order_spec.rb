require 'rails_helper'

RSpec.describe 'User can change sort order', type: :system, selenium: true do
  it 'successfully' do
    user = create(:user, password: 'password')
    practica1 = create(:user_practica, user: user, position: 1)
    practica2 = create(:user_practica, user: user, position: 2)
    practica3 = create(:user_practica, user: user, position: 3)

    visit signin_path
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: 'password'
    within 'form' do
      click_on 'Login'
    end
    practica1_handler = page.find("tr[data-practica-id='#{practica1.id}'] td.handle")
    practica3_handler = page.find("tr[data-practica-id='#{practica3.id}'] td.handle")
    practica3_handler.drag_to practica1_handler
    visit current_path

    expect(practica3.name_es).to appear_before(practica2.name_es)
  end
end
