require 'rails_helper'

RSpec.describe UserPractica, type: :model do
  describe '#position' do
    it "same user can't have practices with same position" do
      user = create(:user)
      _user_practica = create(:user_practica, user: user, position: 1)

      user_practica = build(:user_practica, user: user, position: 1)

      expect(user_practica).not_to be_valid
      expect(user_practica.errors.full_messages).to include("Posición La posición no es válida")
    end
  end
end
