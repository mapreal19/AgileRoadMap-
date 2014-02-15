class CreateDesafios < ActiveRecord::Migration
  def change
    create_table :desafios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
