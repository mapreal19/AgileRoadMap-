class UserPractica < ActiveRecord::Base
	belongs_to :user
	belongs_to :practica

	acts_as_list scope: :user
  
  scope :only_aplicable, -> { where(no_aplicable: false) }

	has_many :user_practicas, -> { order("position") }, dependent: :destroy

	# http://apidock.com/rails/v2.3.8/ActiveModel/Validations/ClassMethods/validates_inclusion_of
	ESFUERZO = { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto'}
	validates_inclusion_of :effort, in: 1..5, allow_nil: true

	#MARGEN = { -1 => 'No definido', 0 => 'Ninguno', 1 => 'Poco', 2 => 'Medio', 3 => 'Alto'}
  MARGEN = { -1 => 'No definido', 0 => 'Muy Bajo', 1 => 'Bajo', 2 => 'Medio', 3 => 'Alto', 4 => 'Muy Alto'}

	validates_inclusion_of :range, in: -1..4, allow_nil: true

	#validates_length_of :comment, maximum: 150

	# Getters
	def legacy_position_with_prefix
		"PRA" + self[:legacy_position].to_s
  end

  def self.get_prac_position_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica.position_with_prefix] ||= []
      result[user_practica.practica.position_with_prefix].push user_practica.position
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result.sort_by &:last
  end

  def self.get_aplicable_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica.position_with_prefix] ||= []
      result[user_practica.practica.position_with_prefix].push (user_practica.no_aplicable ? 0 : 1) # Si no aplicable == true, no se aplica -> valor 0
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result.sort_by &:last
  end

  def self.get_margen_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica.position_with_prefix] ||= []
      # No tenemos en cuenta si range == -1 (No definido)
      result[user_practica.practica.position_with_prefix].push user_practica.range if user_practica.range >= 0
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end
    
    # if nan lo ponemos a cero. 
    result.each do |k,v|
      if v.nan?
        result[k] = 0
      end
    end
    
    result.sort_by &:last
  end

  def self.without_yopolt
    UserPractica.joins(:user).where("email NOT LIKE ? ", 'yopolt%').only_aplicable
  end
end