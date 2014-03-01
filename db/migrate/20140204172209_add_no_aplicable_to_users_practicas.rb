class AddNoAplicableToUsersPracticas < ActiveRecord::Migration
  def change
    add_column :user_practicas, :no_aplicable, :boolean, :default => false
  end
end
