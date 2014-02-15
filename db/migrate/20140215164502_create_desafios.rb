class CreateDesafios < ActiveRecord::Migration
  def change
    create_table :desafios do |t|
      t.string :name

      t.timestamps
    end
  end
end
