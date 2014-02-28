class CreateAmbitoTrabajos < ActiveRecord::Migration
  def change
    create_table :ambito_trabajos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
