class RelacionPractica < ActiveRecord::Base
	belongs_to :practica
	belongs_to :practica2, class_name: 'Practica'
end