class Desafio < ActiveRecord::Base
	def id_with_prefix
		"CHA" + self[:id].to_s
	end
end
