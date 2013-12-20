class AddColumnsToUserPracs < ActiveRecord::Migration
	def change
		add_column :user_practicas, :legacy_position, :integer
		add_column :user_practicas, :comment, :text
		# (1..5)
		add_column :user_practicas, :effort, :integer
		# margen de aplicación (0,1,2,3) = Ninguno, Poco, Medio, Alto
		add_column :user_practicas, :range, :integer
	end
end
