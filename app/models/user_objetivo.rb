class UserObjetivo < ApplicationRecord
  belongs_to :user
  belongs_to :objetivo

  scope :only_interesa, -> { where(no_interesa: false) }

  validates :position, uniqueness: { scope: :user }

  acts_as_list scope: :user

  def self.get_position_stats
    result = {}
    UserObjetivo.without_yopolt.each do |user_objetivo|
      result[user_objetivo.objetivo.id_with_prefix_and_name] ||= []
      result[user_objetivo.objetivo.id_with_prefix_and_name].push user_objetivo.position
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result.sort_by &:last
  end

  def self.without_yopolt
    UserObjetivo.joins(:user).where('email NOT LIKE ? ', 'yopolt%').only_interesa
  end
end
