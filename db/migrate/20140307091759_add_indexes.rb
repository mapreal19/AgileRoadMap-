class AddIndexes < ActiveRecord::Migration
  def change
    add_index :user_practicas, :user_id
    add_index :user_practicas, :practica_id

    add_index :user_objetivos, :user_id
    add_index :user_objetivos, :objetivo_id

    add_index :users, :ambito_trabajo_id
    add_index :users, :sector_empresa_id

    add_index :contribucions, :practica_id
    add_index :contribucions, :objetivo_id

    add_index :practica_desafios, :practica_id
    add_index :practica_desafios, :desafio_id

    add_index :relacion_practicas, :practica_id
    add_index :relacion_practicas, :practica2_id
  end
end
