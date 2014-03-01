class CreateRelacionPracticas < ActiveRecord::Migration
  def change
    create_table :relacion_practicas do |t|
      t.integer :practica_id
      t.integer :practica2_id
    end
  end
end
