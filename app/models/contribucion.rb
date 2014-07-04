class Contribucion < ActiveRecord::Base
	# Many-to-many Practica-Objetivo
	belongs_to :practica
	belongs_to :objetivo
  
  # valoresContribucion = {1: 'Muy Baja', 2: 'Baja', 3: 'Media', 4: 'Alta', 5: 'Muy Alta'}
  enum valor: {'Muy Baja' => 1, 'Baja' => 2, 'Media' => 3, 'Alta' => 4, 'Muy Alta' => 5}
end
