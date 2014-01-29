class Objetivo < ActiveRecord::Base
	has_many :contribucions
	has_many :practicas, through: :contribucions

	def get_json_practicas_ids
		ActiveSupport::JSON.encode(self.contribucions.pluck(:practica_id, :valor))
		# contribucions.pluck(:practica_id, :valor)
	end

end
