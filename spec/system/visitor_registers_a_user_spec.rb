require 'rails_helper'

RSpec.describe 'Visitor Registers a User', type: :system do
  it 'successfully' do
    email = 'mario@gmail.com'
    password = 'password'

    visit '/users/sign_up'
    fill_in('Email', with: email)
    fill_in('Password', with: password, match: :prefer_exact)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')

    expect(page).to have_text('Welcome! You have signed up successfully.')
  end
end
