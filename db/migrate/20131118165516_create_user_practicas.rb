class CreateUserPracticas < ActiveRecord::Migration
	def change
		create_table :user_practicas do |t|
			t.integer :position
			t.string :name
			t.string :agile_method
			t.references :user

			t.timestamps
		end
	end
end
