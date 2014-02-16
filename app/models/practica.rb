class Practica < ActiveRecord::Base
	default_scope { order('position') }

	has_many :contribucions
	has_many :objetivos, through: :contribucions

	has_many :practica_desafios
	has_many :desafios, through: :practica_desafios

	ESFUERZO = { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto'}

	has_many :relacion_practicas
	has_many :practicas, through: :relacion_practicas
	# Other side of the relation
	has_many :inverse_relacion_practicas, class_name: "RelacionPractica", foreign_key: 'practica2_id'
	has_many :inverse_practicas, through: :inverse_relacion_practicas, source: :practica

end
