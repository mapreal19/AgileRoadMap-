class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.string :codigo
      t.string :name
      t.boolean :sat_client
      t.boolean :equipo
      t.boolean :productivity

      t.timestamps
    end
  end
end
