class UserObjetivo < ActiveRecord::Base
	belongs_to :user
	belongs_to :objetivo

	acts_as_list scope: :user
end
