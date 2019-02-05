class UserPractica < ApplicationRecord
  ESFUERZO = if I18n.locale == :es
               { 1 => 'Muy poco', 2 => 'Bajo', 3 => 'Medio', 4 => 'Alto', 5 => 'Muy alto' }.freeze
             else
               { 1 => 'Very little', 2 => 'Low', 3 => 'Medium', 4 => 'High', 5 => 'Very High' }.freeze
             end

  if I18n.locale == :es
    MARGEN = { -1 => 'No definido', 0 => 'Muy Bajo', 1 => 'Bajo', 2 => 'Medio', 3 => 'Alto', 4 => 'Muy Alto' }.freeze
  else
    MARGEN = { -1 => 'Not defined', 0 => 'Very Low', 1 => 'Low', 2 => 'Medium', 3 => 'High', 4 => 'Very High' }.freeze
  end

  belongs_to :user
  belongs_to :practica
  has_many :user_practicas, -> { order('position') }, dependent: :destroy

  scope :only_aplicable, -> { where(no_aplicable: false) }

  validates :effort, inclusion: { in: 1..5, allow_nil: true }
  validates :range, inclusion: { in: -1..4, allow_nil: true }
  validates :position, uniqueness: { scope: :user }

  acts_as_list scope: :user

  def self.get_prac_position_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica.position_with_prefix_and_name] ||= []
      result[user_practica.practica.position_with_prefix_and_name].push user_practica.position
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    result.sort_by(&:last)
  end

  def self.get_aplicable_stats
    result = {}
    UserPractica.without_yopolt.each do |user_practica|
      result[user_practica.practica.position_with_prefix] ||= []
      result[user_practica.practica.position_with_prefix].push(user_practica.no_aplicable ? 0 : 1)
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
      result[user_practica.practica.position_with_prefix_and_name] ||= []
      # No tenemos en cuenta si range == -1 (No definido)
      result[user_practica.practica.position_with_prefix_and_name].push user_practica.range if user_practica.range >= 0
    end

    result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      result[key] = array.inject(:+).to_f / array.size
    end

    # if nan lo ponemos a cero.
    result.each do |k, v|
      result[k] = 0 if v.nan?
    end

    result.sort_by &:last
  end

  def self.without_yopolt
    UserPractica.joins(:user).where('email NOT LIKE ? ', 'yopolt%').only_aplicable
  end

  def legacy_position_with_prefix
    'PRA' + self[:legacy_position].to_s
  end
end
