class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.string :codigo
      t.string :name
      t.bool :sat_client
      t.bool :equipo
      t.bool :productivity

      t.timestamps
    end
  end
end
