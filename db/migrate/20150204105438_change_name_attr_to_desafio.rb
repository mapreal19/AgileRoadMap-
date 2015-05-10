class ChangeNameAttrToDesafio < ActiveRecord::Migration
  def change
    add_column :desafios, :name_en, :string
    change_table :desafios do |t|
      t.rename :name, :name_es
    end
  end
end
