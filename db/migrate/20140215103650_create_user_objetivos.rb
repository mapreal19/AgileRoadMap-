class CreateUserObjetivos < ActiveRecord::Migration
  def change
    create_table :user_objetivos do |t|
      t.integer :user_id
      t.integer :objetivo_id
      t.integer :position

      t.timestamps
    end
  end
end
