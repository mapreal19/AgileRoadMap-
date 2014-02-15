class UserObjetivo < ActiveRecord::Base
	belongs_to :user
	belongs_to :practica

	acts_as_list scope: :user
end
