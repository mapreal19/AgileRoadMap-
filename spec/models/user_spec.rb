require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#clone_practicas" do
    it "clones the 42 practicas" do
      user = create(:user)

      user.clone_practicas

      expect(user.user_practicas.size).to eq(42)
      expect(user.user_practicas.first.position).to eq(1)
      expect(user.user_practicas.last.position).to eq(42)
    end
  end

  describe "#clone_objetivos" do
    it "clones the 16 objetivos" do
      user = create(:user)

      user.clone_objetivos

      expect(user.user_objetivos.size).to eq(16)
      expect(user.user_objetivos.first.position).to eq(1)
      expect(user.user_objetivos.last.position).to eq(16)
    end
  end
end
