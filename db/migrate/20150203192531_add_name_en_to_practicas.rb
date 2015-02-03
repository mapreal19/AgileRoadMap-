class AddNameEnToPracticas < ActiveRecord::Migration
  def change
    add_column :practicas, :name_en, :string
  end
end
