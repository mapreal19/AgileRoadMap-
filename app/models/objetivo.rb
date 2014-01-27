class Objetivo < ActiveRecord::Base
	has_many :contribucions
	has_many :practicas, through: :contribucions
end
