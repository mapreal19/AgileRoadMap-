class CreatePracticas < ActiveRecord::Migration
  def change
    create_table :practicas do |t|
      t.integer :position
      t.string :name
      t.string :name_en
      t.string :agile_method

      t.timestamps
    end
  end
end
