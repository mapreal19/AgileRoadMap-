class AddNoInteresaColumnToUserObjetivos < ActiveRecord::Migration
	def change
		add_column :user_objetivos, :no_interesa, :boolean, :default => false
	end
end
