class UserPractica < ActiveRecord::Base
	belongs_to :user
	belongs_to :practica

	acts_as_list scope: :user

	# http://apidock.com/rails/v2.3.8/ActiveModel/Validations/ClassMethods/validates_inclusion_of
	ESFUERZO = { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto'}
	validates_inclusion_of :effort, in: 1..5, allow_nil: true

	MARGEN = { 0 => 'Ninguno', 1 => 'Poco', 2 => 'Medio', 3 => 'Alto'}
	validates_inclusion_of :range, in: 0..3, allow_nil: true

	validates_length_of :comment, maximum: 150
end