class CreatePracticaDesafios < ActiveRecord::Migration
  def change
    create_table :practica_desafios do |t|
      t.integer :practica_id
      t.integer :desafio_id

      t.timestamps
    end
  end
end
