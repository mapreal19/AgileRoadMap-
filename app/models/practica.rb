class Practica < ActiveRecord::Base
	default_scope { order('position') }
end
