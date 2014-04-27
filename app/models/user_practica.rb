class UserPractica < ActiveRecord::Base
	belongs_to :user
	belongs_to :practica

	acts_as_list scope: :user

	# http://apidock.com/rails/v2.3.8/ActiveModel/Validations/ClassMethods/validates_inclusion_of
	ESFUERZO = { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto'}
	validates_inclusion_of :effort, in: 1..5, allow_nil: true

	MARGEN = { -1 => 'No definido', 0 => 'Ninguno', 1 => 'Poco', 2 => 'Medio', 3 => 'Alto'}
	validates_inclusion_of :range, in: -1..3, allow_nil: true

	validates_length_of :comment, maximum: 150

	# Getters
	def legacy_position_with_prefix
		"PRA" + self[:legacy_position].to_s
  end

  def self.get_prac_position_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica_id] ||= []
      result[user_practica.practica_id].push user_practica.position
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result
  end

  def self.get_aplicable_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica_id] ||= []
      result[user_practica.practica_id].push (user_practica.no_aplicable ? 0 : 1) # Si no aplicable == true, no se aplica -> valor 0
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result
  end

  def self.get_margen_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica_id] ||= []
      # No tenemos en cuenta si range == -1 (No definido)
      result[user_practica.practica_id].push user_practica.range if user_practica.range >= 0
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result
  end

  def self.without_yopolt
    UserPractica.joins(:user).where("email NOT LIKE ? ", 'yopolt%')
  end
end