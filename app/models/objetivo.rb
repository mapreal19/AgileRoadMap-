class Objetivo < ApplicationRecord
  has_many :contribucions
  has_many :practicas, through: :contribucions

  def id_with_prefix
    'OBJ' + self[:id].to_s
  end

  def id_with_prefix_and_name
    if I18n.locale == :es
      id_with_prefix + ' ' + self[:name_es]
    else
      id_with_prefix + ' ' + self[:name_en]
    end
   end

  def get_json_practicas_ids
    ActiveSupport::JSON.encode(contribucions.pluck(:practica_id, :valor))
  end
end
