class Desafio < ApplicationRecord
  def id_with_prefix
    'CHA' + self[:id].to_s
  end
end
