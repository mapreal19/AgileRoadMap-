class ChangeNameAttrToUserPracticas < ActiveRecord::Migration
  def change
    add_column :user_practicas, :name_en, :string
    change_table :user_practicas do |t|
      t.rename :name, :name_es
    end
  end
end
