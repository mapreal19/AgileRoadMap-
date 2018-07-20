require 'rails_helper'

RSpec.describe 'Visitor changes language', type: :system do
  it 'successfully' do
    visit 'es/agile-roadmap'
    click_on 'English', match: :first

    expect(page).to have_text('An Agile Roadmap')
  end
end
