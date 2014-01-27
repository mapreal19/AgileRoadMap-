class Contribucion < ActiveRecord::Base
	# Many-to-many Practica-Objetivo
	belongs_to :practica
	belongs_to :objetivo
end
