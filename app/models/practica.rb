class Practica < ApplicationRecord
  default_scope { order('position') }

  has_many :contribucions
  has_many :objetivos, through: :contribucions

  has_many :practica_desafios
  has_many :desafios, through: :practica_desafios

  ESFUERZO = if I18n.locale == :es
               { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto' }.freeze
             else
               { 1 => 'Very little', 2 => 'Low', 3 => 'Medium', 4 => 'High', 5 => 'Very High' }.freeze
             end

  has_many :relacion_practicas
  has_many :practicas, through: :relacion_practicas
  # Other side of the relation
  has_many :inverse_relacion_practicas, class_name: 'RelacionPractica', foreign_key: 'practica2_id'
  has_many :inverse_practicas, through: :inverse_relacion_practicas, source: :practica

  def get_json_relacion_practicas_ids
    arr1 = relacion_practicas.pluck(:practica2_id)
    arr2 = inverse_relacion_practicas.pluck(:practica_id)
    ActiveSupport::JSON.encode(arr1 + arr2)
  end

  ##
  # Gets the name of the practica taking into account the locale
  def name
    self["name_#{I18n.locale}"]
  end

  def description
    self["description_#{I18n.locale}"]
  end

  def position_with_prefix
    "PRA#{self[:position]}"
  end

  def position_with_prefix_and_name
    "#{position_with_prefix} #{name}"
  end
end
