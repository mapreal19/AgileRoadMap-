class Contribucion < ApplicationRecord
  belongs_to :practica
  belongs_to :objetivo

  enum valor: { 'Muy Baja' => 1, 'Baja' => 2, 'Media' => 3, 'Alta' => 4, 'Muy Alta' => 5 }
end
