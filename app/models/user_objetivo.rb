class UserObjetivo < ActiveRecord::Base
	belongs_to :user
	belongs_to :objetivo

	acts_as_list scope: :user

  def self.get_position_stats
    result = {}
    UserObjetivo.without_yopolt.each do |user_objetivo|
      result[user_objetivo.objetivo_id] ||= []
      result[user_objetivo.objetivo_id].push user_objetivo.position
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result
  end

  def self.without_yopolt
    UserObjetivo.joins(:user).where("email NOT LIKE ? ", 'yopolt%')
  end

end
