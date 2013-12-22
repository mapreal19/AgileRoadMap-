class AddDescriptionToPractica < ActiveRecord::Migration
  def change
    add_column :practicas, :description, :text
  end
end
