require 'rails_helper'

# NOTE: using Selenium for drag_to
RSpec.describe 'User can change sort order', type: :system, selenium: true do
  it 'successfully' do
    user = create(:user, password: 'password')
    practica1 = create(:user_practica, user: user, practica: Practica.first, position: 1)
    practica2 = create(:user_practica, user: user, practica: Practica.second, position: 2)
    practica3 = create(:user_practica, user: user, practica: Practica.third, position: 3)

    login(email: user.email, password: 'password')
    practica1_handler = page.find("tr[data-practica-id='#{practica1.practica.id}'] td.handle")
    practica3_handler = page.find("tr[data-practica-id='#{practica3.practica.id}'] td.handle")
    practica3_handler.drag_to practica1_handler

    visit current_path
    expect(practica3.name_es).to appear_before(practica2.name_es)
  end

  def login(email:, password:)
    visit signin_path
    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password
    within 'form' do
      click_on 'Login'
    end
  end
end
