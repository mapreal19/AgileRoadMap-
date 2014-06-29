class Contribucion < ActiveRecord::Base
	# Many-to-many Practica-Objetivo
	belongs_to :practica
	belongs_to :objetivo
  
  enum valor: ['Muy Baja', 'Baja', 'Media', 'Alta', 'Muy Alta']  
end
