class UserPractica < ActiveRecord::Base
	belongs_to :user

	include RankedModel
  	ranks :position
end