class Practica < ActiveRecord::Base
	default_scope { order('position') }

	has_many :contribucions
	has_many :objetivos, through: :contribucions

	ESFUERZO = { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto'}
end
