require 'rails_helper'

RSpec.describe 'Visitor Registers a User', type: :system do
  it 'successfully' do
    email = 'mario@gmail.com'
    password = 'password'

    visit '/es/signup'
    fill_in('Nombre', with: 'Mario')
    fill_in('Email', with: email)
    select('Otro', from: 'Ámbito de trabajo')
    select('Otro', from: 'Sector de la empresa')
    fill_in('Número promedio de integrantes de equipo', with: 2)
    fill_in('Contraseña', with: password, match: :prefer_exact)
    fill_in('Repetir contraseña', with: password)
    click_button('Registrarse')

    expect(page).to have_text('Bienvenido')
  end
end
