require 'rails_helper'

RSpec.describe UserObjetivo, type: :model do
  describe '#position' do
    it "same user can't have objetivos with same position" do
      user = create(:user)
      _user_objetivo = create(:user_objetivo, user: user, position: 1)

      user_objetivo = build(:user_objetivo, user: user, position: 1)

      expect(user_objetivo).not_to be_valid
      expect(user_objetivo.errors.full_messages).to include("Posición La posición no es válida")
    end
  end
end
