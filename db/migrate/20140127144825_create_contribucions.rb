class CreateContribucions < ActiveRecord::Migration
  def change
    create_table :contribucions do |t|
      t.integer :practica_id
      t.integer :objetivo_id
      t.integer :valor

      t.timestamps
    end
  end
end
