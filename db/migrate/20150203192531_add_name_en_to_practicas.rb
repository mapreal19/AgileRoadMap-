class AddNameEnToPracticas < ActiveRecord::Migration
  def change
    add_column :practicas, :name_en, :string
    add_column :practicas, :description_en, :string
  end
end
